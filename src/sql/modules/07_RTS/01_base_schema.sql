
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object: Table [RTS].[DepartmentMaster] ******/
-- Changes: DepartmentName NVARCHAR(200) -> NVARCHAR(100), DeptIcon -> DepartmentIcon,
--          NOT FOR REPLICATION added to IDENTITY
CREATE TABLE [RTS].[DepartmentMaster]
(
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentName]        NVARCHAR(100) NOT NULL,
    [DepartmentNameLocal]   NVARCHAR(200) NULL,
    [DepartmentIcon]        NVARCHAR(200) NULL,
    [DisplayOrder]          INT NOT NULL CONSTRAINT [DF_DepartmentMaster_DisplayOrder] DEFAULT (0),
    [IsActive]              BIT NOT NULL CONSTRAINT [DF_DepartmentMaster_IsActive] DEFAULT (1),
    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_DepartmentMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentName] UNIQUE NONCLUSTERED ([DepartmentName] ASC)
);
GO

/****** Object: Table [RTS].[ServiceMaster] ******/
-- Changes: Renamed from Services, RTSServiceId -> GovtServiceCode,
--          CreatedBy NOT NULL -> NULL, ServiceName NVARCHAR(300) -> NVARCHAR(200),
--          FK moved to ALTER TABLE (PTIS pattern), NOT FOR REPLICATION added
CREATE TABLE [RTS].[ServiceMaster]
(
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentId]      INT NOT NULL,
    [GovtServiceCode]   INT NULL,
    [ServiceName]       NVARCHAR(200) NOT NULL,
    [ServiceNameLocal]  NVARCHAR(MAX) NULL,
    [Description]       NVARCHAR(500) NULL,
    [ServiceUrl]        NVARCHAR(500) NULL,
    [ServiceIcon]       NVARCHAR(100) NULL,
    [DisplayOrder]      INT NOT NULL CONSTRAINT [DF_ServiceMaster_DisplayOrder] DEFAULT (0),
    [Sla]               NVARCHAR(50) NULL,
    [Fees]              DECIMAL(18,2) NULL,
    [FeesRequired]      BIT NOT NULL CONSTRAINT [DF_ServiceMaster_FeesRequired] DEFAULT (0),

    [IsActive]          BIT NOT NULL CONSTRAINT [DF_ServiceMaster_IsActive] DEFAULT (1),

    [CreatedBy]         INT NULL,
    [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_ServiceMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]         INT NULL,
    [UpdatedDate]       DATETIME NULL,

    CONSTRAINT [PK_ServiceMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

ALTER TABLE [RTS].[ServiceMaster] WITH CHECK
    ADD CONSTRAINT [FK_ServiceMaster_DepartmentMaster]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [RTS].[DepartmentMaster] ([Id]);
GO
ALTER TABLE [RTS].[ServiceMaster] CHECK CONSTRAINT [FK_ServiceMaster_DepartmentMaster];
GO

/****** Object: Table [RTS].[FieldDefinition] ******/
-- Changes: FieldName removed (duplicate of FieldCode), DefaultValue NVARCHAR(200) -> NVARCHAR(500),
--          ValidationRules NVARCHAR(200) -> NVARCHAR(MAX), FK moved to ALTER TABLE (PTIS pattern),
--          NOT FOR REPLICATION added
CREATE TABLE [RTS].[FieldDefinition]
(
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,

    [DepartmentId]          INT NOT NULL,
    [ServiceId]             INT NOT NULL,

    [FieldCode]             NVARCHAR(50) NOT NULL,
    [FieldLabel]            NVARCHAR(200) NOT NULL,
    [FieldLabelLocal]       NVARCHAR(200) NULL,
    [FieldType]             NVARCHAR(50) NOT NULL,
    [FieldGroup]            NVARCHAR(100) NULL,

    [OptionsJson]           NVARCHAR(MAX) NULL,
    [DefaultValue]          NVARCHAR(500) NULL,
    [ValidationRules]       NVARCHAR(MAX) NULL,

    [IsRequired]            BIT NOT NULL CONSTRAINT [DF_FieldDefinition_IsRequired] DEFAULT (0),
    [DisplayOrder]          INT NOT NULL CONSTRAINT [DF_FieldDefinition_DisplayOrder] DEFAULT (0),

    [MinValue]              DECIMAL(18,4) NULL,
    [MaxValue]              DECIMAL(18,4) NULL,
    [MaxLength]             INT NULL,

    [IsActive]              BIT NOT NULL CONSTRAINT [DF_FieldDefinition_IsActive] DEFAULT (1),
    [MarkedForDeletion]     BIT NOT NULL CONSTRAINT [DF_FieldDefinition_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_FieldDefinition_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_FieldDefinition]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_FieldDefinition_Department_Service_FieldCode]
        UNIQUE NONCLUSTERED ([DepartmentId] ASC, [ServiceId] ASC, [FieldCode] ASC)
);
GO

ALTER TABLE [RTS].[FieldDefinition] WITH CHECK
    ADD CONSTRAINT [FK_FieldDefinition_DepartmentMaster]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [RTS].[DepartmentMaster] ([Id]);
GO
ALTER TABLE [RTS].[FieldDefinition] CHECK CONSTRAINT [FK_FieldDefinition_DepartmentMaster];
GO

ALTER TABLE [RTS].[FieldDefinition] WITH CHECK
    ADD CONSTRAINT [FK_FieldDefinition_ServiceMaster]
    FOREIGN KEY ([ServiceId])
    REFERENCES [RTS].[ServiceMaster] ([Id]);
GO
ALTER TABLE [RTS].[FieldDefinition] CHECK CONSTRAINT [FK_FieldDefinition_ServiceMaster];
GO

/****** Object: Table [RTS].[CitizenSession] ******/
-- Changes: Removed CreatedBy, CreatedDate, UpdatedBy, UpdatedDate (dead columns —
--          LoginTime tracks creation, LastActivityTime tracks updates),
--          UPIC -> Upic (camelCase convention), NOT FOR REPLICATION added
CREATE TABLE [RTS].[CitizenSession]
(
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [SessionId]         NVARCHAR(200) NOT NULL,
    [CitizenName]       NVARCHAR(200) NULL,
    [MobileNo]          NVARCHAR(20) NULL,
    [Upic]              NVARCHAR(50) NULL,
    [PropertyNo]        NVARCHAR(100) NULL,
    [OwnerId]           INT NULL,
    [LoginTime]         DATETIME NOT NULL CONSTRAINT [DF_CitizenSession_LoginTime] DEFAULT (GETDATE()),
    [LastActivityTime]  DATETIME NULL,
    [LogoutTime]        DATETIME NULL,
    [IsActive]          BIT NOT NULL CONSTRAINT [DF_CitizenSession_IsActive] DEFAULT (1),

    CONSTRAINT [PK_CitizenSession]
        PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_CitizenSession_SessionId]
        UNIQUE NONCLUSTERED ([SessionId] ASC)
);
GO

/****** Object: Table [RTS].[ApplicationDetails] ******/
-- Changes: ApplicationStatus NULL -> NOT NULL DEFAULT 'Submitted',
--          FK constraints moved to ALTER TABLE (PTIS pattern), NOT FOR REPLICATION added
CREATE TABLE [RTS].[ApplicationDetails]
(
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,

    [ApplicationNo]         AS ('RTS' + RIGHT('00000000' + CONVERT(VARCHAR(8), [Id]), 8)) PERSISTED,

    [DepartmentId]          INT NOT NULL,
    [ServiceId]             INT NOT NULL,
    [SessionId]             NVARCHAR(200) NULL,
    [OwnerId]               INT NULL,

    [ApplicationStatus]     NVARCHAR(50) NOT NULL CONSTRAINT [DF_ApplicationDetails_ApplicationStatus] DEFAULT ('Submitted'),
    [Remark]                NVARCHAR(500) NULL,

    [IsActive]              BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_IsActive] DEFAULT (1),
    [MarkedForDeletion]     BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_ApplicationDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_ApplicationDetails]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_ApplicationDetails_ApplicationNo]
        UNIQUE NONCLUSTERED ([ApplicationNo] ASC)
);
GO

ALTER TABLE [RTS].[ApplicationDetails] WITH CHECK
    ADD CONSTRAINT [FK_ApplicationDetails_DepartmentMaster]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [RTS].[DepartmentMaster] ([Id]);
GO
ALTER TABLE [RTS].[ApplicationDetails] CHECK CONSTRAINT [FK_ApplicationDetails_DepartmentMaster];
GO

ALTER TABLE [RTS].[ApplicationDetails] WITH CHECK
    ADD CONSTRAINT [FK_ApplicationDetails_ServiceMaster]
    FOREIGN KEY ([ServiceId])
    REFERENCES [RTS].[ServiceMaster] ([Id]);
GO
ALTER TABLE [RTS].[ApplicationDetails] CHECK CONSTRAINT [FK_ApplicationDetails_ServiceMaster];
GO

ALTER TABLE [RTS].[ApplicationDetails] WITH CHECK
    ADD CONSTRAINT [FK_ApplicationDetails_CitizenSession]
    FOREIGN KEY ([SessionId])
    REFERENCES [RTS].[CitizenSession] ([SessionId]);
GO
ALTER TABLE [RTS].[ApplicationDetails] CHECK CONSTRAINT [FK_ApplicationDetails_CitizenSession];
GO

/****** Object: Table [RTS].[FieldValue] ******/
-- Changes: FieldName removed (redundant via FieldDefinitionId FK JOIN),
--          FK constraints moved to ALTER TABLE (PTIS pattern), NOT FOR REPLICATION added
CREATE TABLE [RTS].[FieldValue]
(
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,

    [ApplicationId]         INT NOT NULL,
    [FieldDefinitionId]     INT NOT NULL,

    [TextValue]             NVARCHAR(MAX) NULL,
    [NumberValue]           DECIMAL(18,4) NULL,
    [DateValue]             DATETIME NULL,
    [BooleanValue]          BIT NULL,
    [DocumentGuid]          UNIQUEIDENTIFIER NULL,

    [IsActive]              BIT NOT NULL CONSTRAINT [DF_FieldValue_IsActive] DEFAULT (1),
    [MarkedForDeletion]     BIT NOT NULL CONSTRAINT [DF_FieldValue_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_FieldValue_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_FieldValue]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_FieldValue_Application_FieldDefinition]
        UNIQUE NONCLUSTERED ([ApplicationId] ASC, [FieldDefinitionId] ASC)
);
GO

ALTER TABLE [RTS].[FieldValue] WITH CHECK
    ADD CONSTRAINT [FK_FieldValue_ApplicationDetails]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [RTS].[ApplicationDetails] ([Id]);
GO
ALTER TABLE [RTS].[FieldValue] CHECK CONSTRAINT [FK_FieldValue_ApplicationDetails];
GO

ALTER TABLE [RTS].[FieldValue] WITH CHECK
    ADD CONSTRAINT [FK_FieldValue_FieldDefinition]
    FOREIGN KEY ([FieldDefinitionId])
    REFERENCES [RTS].[FieldDefinition] ([Id]);
GO
ALTER TABLE [RTS].[FieldValue] CHECK CONSTRAINT [FK_FieldValue_FieldDefinition];
GO

/****** Object: Table [RTS].[ApprovalFlowMaster] ******/
-- Stores the approval workflow configuration for each RTS service.
-- One active flow per service (IsActive = 1).
CREATE TABLE [RTS].[ApprovalFlowMaster]
(
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ServiceId]         INT NOT NULL,
    [ApprovalFlowName]  NVARCHAR(200) NOT NULL,
    [IsActive]          BIT NOT NULL CONSTRAINT [DF_ApprovalFlowMaster_IsActive] DEFAULT (1),

    [CreatedBy]         INT NULL,
    [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_ApprovalFlowMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]         INT NULL,
    [UpdatedDate]       DATETIME NULL,

    CONSTRAINT [PK_ApprovalFlowMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

ALTER TABLE [RTS].[ApprovalFlowMaster] WITH CHECK
    ADD CONSTRAINT [FK_ApprovalFlowMaster_ServiceMaster]
    FOREIGN KEY ([ServiceId])
    REFERENCES [RTS].[ServiceMaster] ([Id]);
GO
ALTER TABLE [RTS].[ApprovalFlowMaster] CHECK CONSTRAINT [FK_ApprovalFlowMaster_ServiceMaster];
GO

/****** Object: Table [RTS].[ApprovalFlowStageMaster] ******/
-- Stores the ordered stages for each approval workflow.
-- EmployeeTypeId refers to the employee/role type allowed to act at this stage.
CREATE TABLE [RTS].[ApprovalFlowStageMaster]
(
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ApprovalFlowId]    INT NOT NULL,
    [StageOrder]        INT NOT NULL,
    [StageName]         NVARCHAR(200) NOT NULL,
    [EmployeeTypeId]    INT NOT NULL,
    [SLADays]           INT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_SLADays] DEFAULT (3),

    -- Capability flags: what actions are allowed at this stage
    [CanVerifyDocument] BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanVerifyDocument] DEFAULT (0),
    [CanApprove]        BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanApprove]        DEFAULT (0),
    [CanReject]         BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanReject]         DEFAULT (0),
    [CanReturn]         BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanReturn]         DEFAULT (0),
    [CanPay]            BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanPay]            DEFAULT (0),
    [IsFinalStage]      BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_IsFinalStage]      DEFAULT (0),

    CONSTRAINT [PK_ApprovalFlowStageMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ApprovalFlowStageMaster_FlowStage] UNIQUE NONCLUSTERED ([ApprovalFlowId] ASC, [StageOrder] ASC)
);
GO

ALTER TABLE [RTS].[ApprovalFlowStageMaster] WITH CHECK
    ADD CONSTRAINT [FK_ApprovalFlowStageMaster_ApprovalFlowMaster]
    FOREIGN KEY ([ApprovalFlowId])
    REFERENCES [RTS].[ApprovalFlowMaster] ([Id]);
GO
ALTER TABLE [RTS].[ApprovalFlowStageMaster] CHECK CONSTRAINT [FK_ApprovalFlowStageMaster_ApprovalFlowMaster];
GO
