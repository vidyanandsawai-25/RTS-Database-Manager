-- System Initialization
-- This file creates infrastructure tables needed for database version tracking
-- Schema version tracking table
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'SchemaVersions' AND SCHEMA_NAME(schema_id) = 'dbo')
BEGIN
    CREATE TABLE dbo.SchemaVersions (
        Version NVARCHAR(50) NOT NULL PRIMARY KEY,
        Script NVARCHAR(255) NOT NULL,
        AppliedOn DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
    PRINT 'SchemaVersions table created successfully.';
END;
GO
