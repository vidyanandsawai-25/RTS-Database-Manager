-- Core schema: create stored procedures
CREATE PROCEDURE dbo.GetUserById @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Username, Email, CreatedAt FROM dbo.Users WHERE Id = @Id;
END;
GO

-- Additional procedures
CREATE PROCEDURE dbo.GetAllUsers
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Username, Email, CreatedAt FROM dbo.Users;
END;
GO
