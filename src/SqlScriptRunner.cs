using System.Data;
using Microsoft.Data.SqlClient;

namespace DatabaseManager;

public class SqlScriptRunner
{
    private readonly string _connectionString;

    public SqlScriptRunner(string connectionString)
    {
        _connectionString = connectionString;
    }

    public async Task CreateDatabaseIfNotExistsAsync(string databaseName)
    {
        var builder = new SqlConnectionStringBuilder(_connectionString);
        // Connect to master
        var masterConnectionString = new SqlConnectionStringBuilder(_connectionString)
        {
            InitialCatalog = "master"
        }.ConnectionString;

        using var conn = new SqlConnection(masterConnectionString);
        await conn.OpenAsync();

        var cmdText = $"IF DB_ID(N'{databaseName}') IS NULL CREATE DATABASE [{databaseName}];";
        using var cmd = new SqlCommand(cmdText, conn);
        await cmd.ExecuteNonQueryAsync();
    }

    /// <summary>
    /// Checks whether a database exists on the server.
    /// </summary>
    public async Task<bool> DatabaseExistsAsync(string databaseName)
    {
        var masterConnectionString = new SqlConnectionStringBuilder(_connectionString)
        {
            InitialCatalog = "master"
        }.ConnectionString;

        using var conn = new SqlConnection(masterConnectionString);
        await conn.OpenAsync();
        var cmdText = "SELECT CASE WHEN DB_ID(@DbName) IS NULL THEN 0 ELSE 1 END";
        using var cmd = new SqlCommand(cmdText, conn);
        cmd.Parameters.AddWithValue("@DbName", databaseName);
        var result = await cmd.ExecuteScalarAsync();
        return Convert.ToInt32(result) == 1;
    }

    /// <summary>
    /// Drops the specified database if it exists. Uses SINGLE_USER to force disconnects.
    /// </summary>
    public async Task DropDatabaseAsync(string databaseName)
    {
        var masterConnectionString = new SqlConnectionStringBuilder(_connectionString)
        {
            InitialCatalog = "master"
        }.ConnectionString;

        using var conn = new SqlConnection(masterConnectionString);
        await conn.OpenAsync();

        var cmdText = $@"
IF DB_ID(@DbName) IS NOT NULL
BEGIN
    ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [{databaseName}];
END
";
        using var cmd = new SqlCommand(cmdText, conn);
        cmd.Parameters.AddWithValue("@DbName", databaseName);
        await cmd.ExecuteNonQueryAsync();
    }

    public async Task ExecuteSqlFilesAsync(string folderPath)
    {
        if (!Directory.Exists(folderPath))
            throw new DirectoryNotFoundException($"SQL folder not found: {folderPath}");

        var files = Directory.GetFiles(folderPath, "*.sql").OrderBy(f => f).ToList();
        if (files.Count == 0)
        {
            Console.WriteLine("No .sql files found to execute.");
            return;
        }

        foreach (var file in files)
        {
            Console.WriteLine($"Executing: {Path.GetFileName(file)}");
            var sql = await File.ReadAllTextAsync(file);
            await ExecuteSqlAsync(sql);
        }
    }

    /// <summary>
    /// Executes SQL files from a specified folder and records the version as applied
    /// </summary>
    public async Task ExecuteVersionedSqlFilesAsync(string folderPath, string fromVersion, string toVersion, DatabaseVersionManager versionManager, string databaseName)
    {
        if (!Directory.Exists(folderPath))
            throw new DirectoryNotFoundException($"SQL folder not found: {folderPath}");

        var files = Directory.GetFiles(folderPath, "*.sql").OrderBy(f => f).ToList();
        if (files.Count == 0)
        {
            Console.WriteLine($"No .sql files found in {folderPath}");
            return;
        }

        // Switch connection to target database
        var dbConnectionString = new SqlConnectionStringBuilder(_connectionString)
        {
            InitialCatalog = databaseName
        }.ConnectionString;

        using var conn = new SqlConnection(dbConnectionString);
        await conn.OpenAsync();
        
        using var transaction = conn.BeginTransaction();
        try
        {
            var executedFiles = new List<string>();
            foreach (var file in files)
            {
                var fileName = Path.GetFileName(file);
                Console.WriteLine($"  Executing: {fileName}");
                var sql = await File.ReadAllTextAsync(file);
                await ExecuteSqlWithTransactionAsync(sql, conn, transaction);
                executedFiles.Add(fileName);
            }

            // Record the executed files as belonging to the upgrade from fromVersion -> toVersion
            await versionManager.RecordVersionFilesAsync(fromVersion, toVersion, executedFiles, transaction);

            // Record the version as applied (summary row)
            await versionManager.RecordVersionAsync(toVersion, transaction);
            
            // Commit all changes if everything succeeded
            await transaction.CommitAsync();
            Console.WriteLine($"Version {toVersion} applied successfully.");
        }
        catch (Exception)
        {
            await transaction.RollbackAsync();
            Console.WriteLine($"Error: Transaction rolled back for version {toVersion}.");
            throw;
        }
    }

    /// <summary>
    /// Executes the post-deployment script if it exists
    /// This always runs after base creation or upgrades
    /// </summary>
    public async Task ExecutePostDeploymentAsync(string databaseName)
    {
        var postDeploymentPath = Path.Combine(AppContext.BaseDirectory, "sql", "post-deployment.sql");
        
        if (!File.Exists(postDeploymentPath))
        {
            Console.WriteLine("Post-deployment script not found, skipping.");
            return;
        }

        Console.WriteLine("Executing post-deployment script...");
        var sql = await File.ReadAllTextAsync(postDeploymentPath);
        
        // Switch connection to target database
        var dbConnectionString = new SqlConnectionStringBuilder(_connectionString)
        {
            InitialCatalog = databaseName
        }.ConnectionString;

        using var conn = new SqlConnection(dbConnectionString);
        await conn.OpenAsync();
        
        var commands = SplitSqlStatements(sql);
        foreach (var cmdText in commands)
        {
            if (string.IsNullOrWhiteSpace(cmdText)) continue;
            using var cmd = new SqlCommand(cmdText, conn);
            cmd.CommandType = CommandType.Text;
            await cmd.ExecuteNonQueryAsync();
        }
        
        Console.WriteLine("Post-deployment script executed successfully.");
    }

    private async Task ExecuteSqlAsync(string sql)
    {
        // Use the configured connection string that should include target database
        using var conn = new SqlConnection(_connectionString);
        await conn.OpenAsync();

        var commands = SplitSqlStatements(sql);
        foreach (var cmdText in commands)
        {
            if (string.IsNullOrWhiteSpace(cmdText)) continue;
            using var cmd = new SqlCommand(cmdText, conn);
            cmd.CommandType = CommandType.Text;
            await cmd.ExecuteNonQueryAsync();
        }
    }

    private async Task ExecuteSqlWithTransactionAsync(string sql, SqlConnection conn, SqlTransaction transaction)
    {
        var commands = SplitSqlStatements(sql);
        foreach (var cmdText in commands)
        {
            if (string.IsNullOrWhiteSpace(cmdText)) continue;
            using var cmd = new SqlCommand(cmdText, conn, transaction);
            cmd.CommandType = CommandType.Text;
            await cmd.ExecuteNonQueryAsync();
        }
    }

    private IEnumerable<string> SplitSqlStatements(string sql)
    {
        // Very simple splitter on GO statements on their own line.
        var lines = sql.Replace("\r\n", "\n").Split('\n');
        var sb = new System.Text.StringBuilder();
        foreach (var line in lines)
        {
            if (line.Trim().Equals("GO", StringComparison.OrdinalIgnoreCase))
            {
                yield return sb.ToString();
                sb.Clear();
            }
            else
            {
                sb.AppendLine(line);
            }
        }

        if (sb.Length > 0)
            yield return sb.ToString();
    }
}
