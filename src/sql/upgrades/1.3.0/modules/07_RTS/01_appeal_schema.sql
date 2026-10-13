-- ============================================================================
-- RTS Module Version 1.3.0 - Appeal Restructuring (MRTSA 2015)
-- ============================================================================

-- 1. [RTS].[AppealTypeMaster] - Add localized name and statutory description
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealTypeMaster' AND COLUMN_NAME = 'AppealTypeNameLocal')
BEGIN
    ALTER TABLE [RTS].[AppealTypeMaster] ADD [AppealTypeNameLocal] NVARCHAR(200) NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealTypeMaster' AND COLUMN_NAME = 'Description')
BEGIN
    ALTER TABLE [RTS].[AppealTypeMaster] ADD [Description] NVARCHAR(500) NULL;
END;
GO

-- 2. Drop obsolete prototype table [RTS].[AppealFlowMaster]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowMaster')
BEGIN
    DROP TABLE [RTS].[AppealFlowMaster];
END;
GO

-- 3. [RTS].[AppealFlowStageMaster] - Drop unused prototype columns
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'CanVerifyDocument')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP CONSTRAINT IF EXISTS [DF_AppealFlowStageMaster_CanVerifyDocument];
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP COLUMN [CanVerifyDocument];
END;
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'IsFinalStage')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP CONSTRAINT IF EXISTS [DF_AppealFlowStageMaster_IsFinalStage];
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP COLUMN [IsFinalStage];
END;
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'CanEdit')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP CONSTRAINT IF EXISTS [DF_AppealFlowStageMaster_CanEdit];
    ALTER TABLE [RTS].[AppealFlowStageMaster] DROP COLUMN [CanEdit];
END;
GO

-- Clean up all obsolete prototype rows from AppealFlowStageMaster before enforcing constraints and seeding
DELETE FROM [RTS].[AppealFlowStageMaster];
GO

-- Add standard audit/status columns if missing
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'IsActive')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] ADD [IsActive] BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_IsActive] DEFAULT (1);
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'CreatedDate')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] ADD [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CreatedDate] DEFAULT (GETUTCDATE());
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster' AND COLUMN_NAME = 'UpdatedDate')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] ADD [UpdatedDate] DATETIME NULL;
END;
GO

-- Enforce Foreign Key to [RTS].[ApprovalFlowMaster]
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_AppealFlowStageMaster_ApprovalFlowMaster')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] WITH CHECK
        ADD CONSTRAINT [FK_AppealFlowStageMaster_ApprovalFlowMaster]
        FOREIGN KEY ([AppealFlowId])
        REFERENCES [RTS].[ApprovalFlowMaster] ([Id]);
END;
GO

-- Enforce Foreign Key to [Core].[UserMaster]
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_AppealFlowStageMaster_UserMaster')
BEGIN
    ALTER TABLE [RTS].[AppealFlowStageMaster] WITH CHECK
        ADD CONSTRAINT [FK_AppealFlowStageMaster_UserMaster]
        FOREIGN KEY ([UserId])
        REFERENCES [Core].[UserMaster] ([Id]);
END;
GO

-- 4. [RTS].[AppealApplicationDetails] - Statutory Hearing, Order, Due Date & Penalty columns
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'HearingDate')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [HearingDate] DATETIME NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'HearingNoticeRemarks')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [HearingNoticeRemarks] NVARCHAR(1000) NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'OrderType')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [OrderType] VARCHAR(50) NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'ServiceDeliveryDueDate')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [ServiceDeliveryDueDate] DATETIME NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'PenaltyAmount')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [PenaltyAmount] DECIMAL(18,2) NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'PenaltyRemarks')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [PenaltyRemarks] NVARCHAR(1000) NULL;
END;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails' AND COLUMN_NAME = 'OrderDocumentPath')
BEGIN
    ALTER TABLE [RTS].[AppealApplicationDetails] ADD [OrderDocumentPath] NVARCHAR(500) NULL;
END;
GO
