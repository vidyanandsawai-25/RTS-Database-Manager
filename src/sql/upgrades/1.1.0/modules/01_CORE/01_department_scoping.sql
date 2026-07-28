/* ============================================================================
   Version 1.1.0 - Department-scoped screens and roles
   Brings existing databases in line with the latest CORE base schema.
   ============================================================================ */

IF COL_LENGTH('CORE.ScreenMaster', 'DepartmentId') IS NULL
BEGIN
    ALTER TABLE [CORE].[ScreenMaster]
    ADD [DepartmentId] INT NOT NULL
        CONSTRAINT [DF_ScreenMaster_DepartmentId] DEFAULT (1) WITH VALUES;
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.foreign_keys
    WHERE [name] = 'FK_ScreenMaster_DepartmentMaster'
      AND [parent_object_id] = OBJECT_ID('CORE.ScreenMaster')
)
BEGIN
    ALTER TABLE [CORE].[ScreenMaster] WITH CHECK
    ADD CONSTRAINT [FK_ScreenMaster_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [CORE].[DepartmentMaster] ([Id]);

    ALTER TABLE [CORE].[ScreenMaster]
    CHECK CONSTRAINT [FK_ScreenMaster_DepartmentMaster];
END;
GO

IF COL_LENGTH('CORE.UserRoleMaster', 'DepartmentId') IS NULL
BEGIN
    ALTER TABLE [CORE].[UserRoleMaster]
    ADD [DepartmentId] INT NOT NULL
        CONSTRAINT [DF_UserRoleMaster_DepartmentId] DEFAULT (1) WITH VALUES;
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.foreign_keys
    WHERE [name] = 'FK_UserRoleMaster_DepartmentMaster'
      AND [parent_object_id] = OBJECT_ID('CORE.UserRoleMaster')
)
BEGIN
    ALTER TABLE [CORE].[UserRoleMaster] WITH CHECK
    ADD CONSTRAINT [FK_UserRoleMaster_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [CORE].[DepartmentMaster] ([Id]);

    ALTER TABLE [CORE].[UserRoleMaster]
    CHECK CONSTRAINT [FK_UserRoleMaster_DepartmentMaster];
END;
GO

IF EXISTS
(
    SELECT 1
    FROM sys.key_constraints
    WHERE [name] = 'UQ_UserRoleMaster_UserRoleName'
      AND [parent_object_id] = OBJECT_ID('CORE.UserRoleMaster')
)
BEGIN
    ALTER TABLE [CORE].[UserRoleMaster]
    DROP CONSTRAINT [UQ_UserRoleMaster_UserRoleName];
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.key_constraints
    WHERE [name] = 'UQ_UserRoleMaster_Department_UserRoleName'
      AND [parent_object_id] = OBJECT_ID('CORE.UserRoleMaster')
)
BEGIN
    ALTER TABLE [CORE].[UserRoleMaster]
    ADD CONSTRAINT [UQ_UserRoleMaster_Department_UserRoleName]
        UNIQUE ([DepartmentId], [UserRoleName]);
END;
GO
