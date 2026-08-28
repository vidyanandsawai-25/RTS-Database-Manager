SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS (Right to Service) - Module 07 Base Schema
   All tables are guarded with IF NOT EXISTS to guarantee idempotent execution.
   ============================================================================ */

-- Ensure RTS Schema exists
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'RTS')
BEGIN
    EXEC('CREATE SCHEMA [RTS]');
END;
GO

/****** Object: Table [RTS].[DepartmentMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'DepartmentMaster')
BEGIN
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
END;
GO

/****** Object: Table [RTS].[ServiceMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'ServiceMaster')
BEGIN
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
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_ServiceMaster_DepartmentMaster')
BEGIN
    ALTER TABLE [RTS].[ServiceMaster] WITH CHECK
        ADD CONSTRAINT [FK_ServiceMaster_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[FieldDefinition] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'FieldDefinition')
BEGIN
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

        CONSTRAINT [PK_FieldDefinition] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_FieldDefinition_Department_Service_FieldCode] UNIQUE NONCLUSTERED ([DepartmentId] ASC, [ServiceId] ASC, [FieldCode] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FieldDefinition_DepartmentMaster')
BEGIN
    ALTER TABLE [RTS].[FieldDefinition] WITH CHECK
        ADD CONSTRAINT [FK_FieldDefinition_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FieldDefinition_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[FieldDefinition] WITH CHECK
        ADD CONSTRAINT [FK_FieldDefinition_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[CitizenSession] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'CitizenSession')
BEGIN
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

        CONSTRAINT [PK_CitizenSession] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_CitizenSession_SessionId] UNIQUE NONCLUSTERED ([SessionId] ASC)
    );
END;
GO

/****** Object: Table [RTS].[ApplicationDetails] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'ApplicationDetails')
BEGIN
    CREATE TABLE [RTS].[ApplicationDetails]
    (
        [Id]                        INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ApplicationNo]             AS ('RTS' + RIGHT('00000000' + CONVERT(VARCHAR(8), [Id]), 8)) PERSISTED,
        [DepartmentId]              INT NOT NULL,
        [ServiceId]                 INT NOT NULL,
        [SessionId]                 NVARCHAR(200) NULL,
        [OwnerId]                   INT NULL,
        [ApplicantName]             NVARCHAR(200) NULL,
        [ApplicantMobileNo]         VARCHAR(15) NULL,
        [ApplicationStatus]         NVARCHAR(50) NOT NULL CONSTRAINT [DF_ApplicationDetails_ApplicationStatus] DEFAULT ('Submitted'),
        [CurrentStageOrder]         INT NULL,
        [ApprovalFlowId]            INT NULL,
        [CurrentApprovalFlowStageId] INT NULL,
        [UserId]                    INT NULL,
        [IsReverted]                BIT NULL CONSTRAINT [DF_ApplicationDetails_IsReverted] DEFAULT (0),
        [Remark]                    NVARCHAR(500) NULL,
        [IsActive]                  BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_IsActive] DEFAULT (1),
        [MarkedForDeletion]         BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_MarkedForDeletion] DEFAULT (0),
        [MarkedForDeletionDate]     DATETIME NULL,
        [CreatedBy]                 INT NULL,
        [CreatedDate]               DATETIME NOT NULL CONSTRAINT [DF_ApplicationDetails_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]                 INT NULL,
        [UpdatedDate]               DATETIME NULL,

        CONSTRAINT [PK_ApplicationDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_ApplicationDetails_ApplicationNo] UNIQUE NONCLUSTERED ([ApplicationNo] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_ApplicationDetails_DepartmentMaster')
BEGIN
    ALTER TABLE [RTS].[ApplicationDetails] WITH CHECK
        ADD CONSTRAINT [FK_ApplicationDetails_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_ApplicationDetails_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[ApplicationDetails] WITH CHECK
        ADD CONSTRAINT [FK_ApplicationDetails_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[FieldValue] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'FieldValue')
BEGIN
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

        CONSTRAINT [PK_FieldValue] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_FieldValue_Application_FieldDefinition] UNIQUE NONCLUSTERED ([ApplicationId] ASC, [FieldDefinitionId] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FieldValue_ApplicationDetails')
BEGIN
    ALTER TABLE [RTS].[FieldValue] WITH CHECK
        ADD CONSTRAINT [FK_FieldValue_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FieldValue_FieldDefinition')
BEGIN
    ALTER TABLE [RTS].[FieldValue] WITH CHECK
        ADD CONSTRAINT [FK_FieldValue_FieldDefinition]
        FOREIGN KEY ([FieldDefinitionId])
        REFERENCES [RTS].[FieldDefinition] ([Id]);
END;
GO

/****** Object: Table [RTS].[ApprovalFlowMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'ApprovalFlowMaster')
BEGIN
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
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_ApprovalFlowMaster_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[ApprovalFlowMaster] WITH CHECK
        ADD CONSTRAINT [FK_ApprovalFlowMaster_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[ApprovalFlowStageMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'ApprovalFlowStageMaster')
BEGIN
    CREATE TABLE [RTS].[ApprovalFlowStageMaster]
    (
        [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ApprovalFlowId]        INT NOT NULL,
        [StageOrder]            INT NOT NULL,
        [StageName]             NVARCHAR(100) NOT NULL,
        [UserId]                INT NOT NULL,
        [SLADays]               INT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_SLADays] DEFAULT (3),
        [CanVerifyDocument]     BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanVerifyDocument] DEFAULT (0),
        [CanApprove]            BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanApprove] DEFAULT (0),
        [CanReject]             BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanReject] DEFAULT (0),
        [CanReturn]             BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanReturn] DEFAULT (0),
        [CanPay]                BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanPay] DEFAULT (0),
        [IsFinalStage]          BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_IsFinalStage] DEFAULT (0),
        [CanEdit]               BIT NULL,
        [CanViewNoteSheet]      BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanViewNoteSheet] DEFAULT (0),
        [CanIssueCertificate]   BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanIssueCertificate] DEFAULT (0),
        [CanEditCertificate]    BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanEditCertificate] DEFAULT (0),

        CONSTRAINT [PK_ApprovalFlowStageMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_ApprovalFlowStageMaster_FlowStage] UNIQUE NONCLUSTERED ([ApprovalFlowId] ASC, [StageOrder] ASC)
    );
END;
GO

-- Ensure columns exist if table already exists
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[RTS].[ApprovalFlowStageMaster]') AND name = 'CanIssueCertificate')
BEGIN
    ALTER TABLE [RTS].[ApprovalFlowStageMaster] ADD [CanIssueCertificate] BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanIssueCertificate] DEFAULT (0);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[RTS].[ApprovalFlowStageMaster]') AND name = 'CanEditCertificate')
BEGIN
    ALTER TABLE [RTS].[ApprovalFlowStageMaster] ADD [CanEditCertificate] BIT NOT NULL CONSTRAINT [DF_ApprovalFlowStageMaster_CanEditCertificate] DEFAULT (0);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_ApprovalFlowStageMaster_ApprovalFlowMaster')
BEGIN
    ALTER TABLE [RTS].[ApprovalFlowStageMaster] WITH CHECK
        ADD CONSTRAINT [FK_ApprovalFlowStageMaster_ApprovalFlowMaster]
        FOREIGN KEY ([ApprovalFlowId])
        REFERENCES [RTS].[ApprovalFlowMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[TrackApplicationHistory] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'TrackApplicationHistory')
BEGIN
    CREATE TABLE [RTS].[TrackApplicationHistory]
    (
        [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ApplicationId]         INT NOT NULL,
        [ApprovalFlowId]        INT NOT NULL,
        [ApprovalFlowStageId]   INT NULL,
        [ActionByUserId]        INT NULL,
        [Action]                NVARCHAR(100) NOT NULL,
        [Status]                NVARCHAR(100) NOT NULL,
        [Remark]                NVARCHAR(400) NULL,
        [IsReverted]            BIT NOT NULL CONSTRAINT [DF_TrackApplicationHistory_IsReverted] DEFAULT (0),
        [IsActive]              BIT NOT NULL CONSTRAINT [DF_TrackApplicationHistory_IsActive] DEFAULT (1),
        [CreatedBy]             INT NULL,
        [CreatedDate]           DATETIME2 NOT NULL CONSTRAINT [DF_TrackApplicationHistory_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]             INT NULL,
        [UpdatedDate]           DATETIME2 NULL,

        CONSTRAINT [PK_TrackApplicationHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_TrackApplicationHistory_ApplicationDetails')
BEGIN
    ALTER TABLE [RTS].[TrackApplicationHistory] WITH CHECK
        ADD CONSTRAINT [FK_TrackApplicationHistory_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);
END;
GO

/****** Object: Table [RTS].[CertificateTemplateMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'CertificateTemplateMaster')
BEGIN
    CREATE TABLE [RTS].[CertificateTemplateMaster]
    (
        [Id]                        INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ServiceId]                 INT NOT NULL,
        [TemplateName]              NVARCHAR(200) NOT NULL,
        [TemplateCode]              NVARCHAR(100) NULL,
        [HeaderContent]             NVARCHAR(MAX) NULL,
        [BodyContent]               NVARCHAR(MAX) NOT NULL,
        [FooterContent]             NVARCHAR(MAX) NULL,
        [DefaultConditionsJson]     NVARCHAR(MAX) NULL,
        [OfficerFieldsConfigJson]   NVARCHAR(MAX) NULL,
        [IsActive]                  BIT NOT NULL CONSTRAINT [DF_CertificateTemplateMaster_IsActive] DEFAULT (1),
        [CreatedBy]                 INT NULL,
        [CreatedDate]               DATETIME NOT NULL CONSTRAINT [DF_CertificateTemplateMaster_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]                 INT NULL,
        [UpdatedDate]               DATETIME NULL,
        [MarkedForDeletion]         BIT NOT NULL CONSTRAINT [DF_CertificateTemplateMaster_MarkedForDeletion] DEFAULT (0),
        [MarkedForDeletionDate]     DATETIME NULL,

        CONSTRAINT [PK_CertificateTemplateMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_CertificateTemplateMaster_ServiceId] UNIQUE NONCLUSTERED ([ServiceId] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_CertificateTemplateMaster_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[CertificateTemplateMaster] WITH CHECK
        ADD CONSTRAINT [FK_CertificateTemplateMaster_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[IssuedCertificate] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'IssuedCertificate')
BEGIN
    CREATE TABLE [RTS].[IssuedCertificate]
    (
        [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [CertificateGuid]       UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_IssuedCertificate_CertificateGuid] DEFAULT (NEWID()),
        [CertificateNo]         NVARCHAR(100) NOT NULL,
        [ApplicationId]         INT NOT NULL,
        [ServiceId]             INT NOT NULL,
        [TemplateId]            INT NOT NULL,
        [OfficerInputsJson]     NVARCHAR(MAX) NULL,
        [MergedHtmlContent]     NVARCHAR(MAX) NOT NULL,
        [QrCodePayload]         NVARCHAR(MAX) NULL,
        [IssuedByUserId]        INT NOT NULL,
        [IssuedAt]              DATETIME NOT NULL CONSTRAINT [DF_IssuedCertificate_IssuedAt] DEFAULT (GETDATE()),
        [IsDigitallySigned]     BIT NOT NULL CONSTRAINT [DF_IssuedCertificate_IsDigitallySigned] DEFAULT (1),
        [DigitalSignatureInfo]  NVARCHAR(MAX) NULL,
        [IsActive]              BIT NOT NULL CONSTRAINT [DF_IssuedCertificate_IsActive] DEFAULT (1),
        [CreatedBy]             INT NULL,
        [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_IssuedCertificate_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]             INT NULL,
        [UpdatedDate]           DATETIME NULL,
        [MarkedForDeletion]     BIT NOT NULL CONSTRAINT [DF_IssuedCertificate_MarkedForDeletion] DEFAULT (0),
        [MarkedForDeletionDate] DATETIME NULL,

        CONSTRAINT [PK_IssuedCertificate] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_IssuedCertificate_CertificateGuid] UNIQUE NONCLUSTERED ([CertificateGuid] ASC),
        CONSTRAINT [UQ_IssuedCertificate_CertificateNo] UNIQUE NONCLUSTERED ([CertificateNo] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_IssuedCertificate_ApplicationDetails')
BEGIN
    ALTER TABLE [RTS].[IssuedCertificate] WITH CHECK
        ADD CONSTRAINT [FK_IssuedCertificate_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_IssuedCertificate_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[IssuedCertificate] WITH CHECK
        ADD CONSTRAINT [FK_IssuedCertificate_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[AppealTypeMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealTypeMaster')
BEGIN
    CREATE TABLE [RTS].[AppealTypeMaster]
    (
        [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [AppealTypeName]    NVARCHAR(100) NOT NULL,
        [Code]              VARCHAR(50) NULL,
        [IsActive]          BIT NOT NULL CONSTRAINT [DF_AppealTypeMaster_IsActive] DEFAULT (1),
        [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_AppealTypeMaster_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_AppealTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

/****** Object: Table [RTS].[AppealFlowMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowMaster')
BEGIN
    CREATE TABLE [RTS].[AppealFlowMaster]
    (
        [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ServiceId]         INT NOT NULL,
        [AppealTypeId]      INT NOT NULL,
        [DepartmentId]      INT NOT NULL,
        [ApprovalFlowName]  NVARCHAR(100) NOT NULL,
        [IsActive]          BIT NOT NULL CONSTRAINT [DF_AppealFlowMaster_IsActive] DEFAULT (1),
        [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_AppealFlowMaster_CreatedDate] DEFAULT (GETDATE()),
        [CreatedBy]         INT NULL,
        [UpdatedDate]       DATETIME NULL,
        [UpdatedBy]         INT NULL,

        CONSTRAINT [PK_AppealFlowMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

/****** Object: Table [RTS].[AppealFlowStageMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealFlowStageMaster')
BEGIN
    CREATE TABLE [RTS].[AppealFlowStageMaster]
    (
        [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ApprovalFlowId]    INT NOT NULL,
        [StageOrder]        INT NOT NULL,
        [StageName]         NVARCHAR(100) NOT NULL,
        [UserId]            INT NOT NULL,
        [SLADays]           INT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_SLADays] DEFAULT (3),
        [CanVerifyDocument] BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CanVerifyDocument] DEFAULT (0),
        [CanApprove]        BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CanApprove] DEFAULT (0),
        [CanReject]         BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CanReject] DEFAULT (1),
        [CanReturn]         BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CanReturn] DEFAULT (0),
        [IsFinalStage]      BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_IsFinalStage] DEFAULT (0),
        [CanEdit]           BIT NOT NULL CONSTRAINT [DF_AppealFlowStageMaster_CanEdit] DEFAULT (0),

        CONSTRAINT [PK_AppealFlowStageMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

/****** Object: Table [RTS].[AppealApplicationDetails] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'AppealApplicationDetails')
BEGIN
    CREATE TABLE [RTS].[AppealApplicationDetails]
    (
        [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [AppealNo]          VARCHAR(50) NULL,
        [ApplicationId]     INT NOT NULL,
        [AppealTypeId]      INT NOT NULL,
        [DepartmentId]      INT NOT NULL,
        [ServiceId]         INT NOT NULL,
        [AppealLevel]       TINYINT NOT NULL,
        [Reason]            NVARCHAR(MAX) NULL,
        [Status]            NVARCHAR(50) NOT NULL CONSTRAINT [DF_AppealApplicationDetails_Status] DEFAULT ('Submitted'),
        [IsActive]          BIT NOT NULL CONSTRAINT [DF_AppealApplicationDetails_IsActive] DEFAULT (1),
        [CreatedBy]         INT NULL,
        [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_AppealApplicationDetails_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_AppealApplicationDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

/****** Object: Table [RTS].[TrackAppealHistory] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'TrackAppealHistory')
BEGIN
    CREATE TABLE [RTS].[TrackAppealHistory]
    (
        [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [AppealId]          INT NOT NULL,
        [ApplicationId]     INT NOT NULL,
        [AppealLevel]       TINYINT NOT NULL,
        [ApprovalFlowId]    INT NULL,
        [AppealFlowStageId] INT NULL,
        [ActionByUserId]    INT NULL,
        [Action]            NVARCHAR(50) NOT NULL,
        [Status]            NVARCHAR(50) NOT NULL,
        [Remark]            NVARCHAR(MAX) NULL,
        [IsActive]          BIT NOT NULL CONSTRAINT [DF_TrackAppealHistory_IsActive] DEFAULT (1),
        [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_TrackAppealHistory_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_TrackAppealHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

/****** Object: Table [RTS].[PaymentStatusMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentStatusMaster')
BEGIN
    CREATE TABLE [RTS].[PaymentStatusMaster]
    (
        [Id]            INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [StatusCode]    VARCHAR(50) NOT NULL,
        [StatusNameEn]  VARCHAR(100) NOT NULL,
        [StatusNameMr]  NVARCHAR(200) NOT NULL,
        [BadgeColor]    VARCHAR(100) NULL,
        [DisplayOrder]  INT NOT NULL CONSTRAINT [DF_PaymentStatusMaster_DisplayOrder] DEFAULT (0),
        [IsActive]      BIT NOT NULL CONSTRAINT [DF_PaymentStatusMaster_IsActive] DEFAULT (1),
        [CreatedBy]     INT NULL,
        [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_PaymentStatusMaster_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]     INT NULL,
        [UpdatedDate]   DATETIME NULL,

        CONSTRAINT [PK_PaymentStatusMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_PaymentStatusMaster_StatusCode] UNIQUE NONCLUSTERED ([StatusCode] ASC)
    );
END;
GO

/****** Object: Table [RTS].[PaymentModeMaster] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentModeMaster')
BEGIN
    CREATE TABLE [RTS].[PaymentModeMaster]
    (
        [Id]            INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ModeCode]      VARCHAR(50) NOT NULL,
        [ModeNameEn]    VARCHAR(100) NOT NULL,
        [ModeNameMr]    NVARCHAR(200) NOT NULL,
        [IconName]      VARCHAR(100) NULL,
        [IsActive]      BIT NOT NULL CONSTRAINT [DF_PaymentModeMaster_IsActive] DEFAULT (1),
        [CreatedBy]     INT NULL,
        [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_PaymentModeMaster_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]     INT NULL,
        [UpdatedDate]   DATETIME NULL,

        CONSTRAINT [PK_PaymentModeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_PaymentModeMaster_ModeCode] UNIQUE NONCLUSTERED ([ModeCode] ASC)
    );
END;
GO

/****** Object: Table [RTS].[PaymentGatewayConfig] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentGatewayConfig')
BEGIN
    CREATE TABLE [RTS].[PaymentGatewayConfig]
    (
        [Id]            INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [GatewayCode]   VARCHAR(50) NOT NULL,
        [GatewayName]   NVARCHAR(150) NOT NULL,
        [MerchantId]    VARCHAR(100) NULL,
        [KeyId]         VARCHAR(250) NOT NULL,
        [SecretKey]     VARCHAR(250) NOT NULL,
        [WebhookSecret] VARCHAR(250) NULL,
        [ServiceUrl]    VARCHAR(500) NULL,
        [Currency]      VARCHAR(10) NOT NULL CONSTRAINT [DF_PaymentGatewayConfig_Currency] DEFAULT ('INR'),
        [IsActive]      BIT NOT NULL CONSTRAINT [DF_PaymentGatewayConfig_IsActive] DEFAULT (1),
        [IsDefault]     BIT NOT NULL CONSTRAINT [DF_PaymentGatewayConfig_IsDefault] DEFAULT (0),
        [CreatedBy]     INT NULL,
        [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_PaymentGatewayConfig_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]     INT NULL,
        [UpdatedDate]   DATETIME NULL,

        CONSTRAINT [PK_PaymentGatewayConfig] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_PaymentGatewayConfig_GatewayCode] UNIQUE NONCLUSTERED ([GatewayCode] ASC)
    );
END;
GO

/****** Object: Table [RTS].[PaymentTransaction] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentTransaction')
BEGIN
    CREATE TABLE [RTS].[PaymentTransaction]
    (
        [Id]                    BIGINT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [TransactionNo]         VARCHAR(60) NOT NULL,
        [ApplicationId]         INT NOT NULL,
        [ApplicationNo]         VARCHAR(100) NOT NULL,
        [ServiceId]             INT NOT NULL,
        [DepartmentId]          INT NOT NULL,
        [GatewayConfigId]       INT NOT NULL,
        [PaymentStatusId]       INT NOT NULL,
        [PaymentModeId]         INT NULL,
        [BaseAmount]            DECIMAL(18,2) NOT NULL,
        [LateFeeAmount]         DECIMAL(18,2) NOT NULL CONSTRAINT [DF_PaymentTransaction_LateFeeAmount] DEFAULT (0),
        [DiscountAmount]        DECIMAL(18,2) NOT NULL CONSTRAINT [DF_PaymentTransaction_DiscountAmount] DEFAULT (0),
        [TotalAmount]           DECIMAL(18,2) NOT NULL,
        [Currency]              VARCHAR(10) NOT NULL CONSTRAINT [DF_PaymentTransaction_Currency] DEFAULT ('INR'),
        [GatewayOrderId]        VARCHAR(100) NULL,
        [GatewayPaymentId]      VARCHAR(100) NULL,
        [GatewaySignature]      VARCHAR(500) NULL,
        [GatewayFee]            DECIMAL(18,2) NULL,
        [GatewayTax]            DECIMAL(18,2) NULL,
        [BankRefNo]             VARCHAR(100) NULL,
        [PayerVpaOrAccount]     VARCHAR(150) NULL,
        [ReceiptNo]             VARCHAR(60) NULL,
        [ReceiptDate]           DATETIME NULL,
        [PaymentDate]           DATETIME NULL,
        [GatewayResponseJson]   NVARCHAR(MAX) NULL,
        [FailureReason]         NVARCHAR(500) NULL,
        [Remarks]               NVARCHAR(1000) NULL,
        [IsActive]              BIT NOT NULL CONSTRAINT [DF_PaymentTransaction_IsActive] DEFAULT (1),
        [CreatedBy]             INT NULL,
        [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_PaymentTransaction_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]             INT NULL,
        [UpdatedDate]           DATETIME NULL,

        CONSTRAINT [PK_PaymentTransaction] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_PaymentTransaction_TransactionNo] UNIQUE NONCLUSTERED ([TransactionNo] ASC),
        CONSTRAINT [CK_PaymentTransaction_TotalAmount] CHECK ([TotalAmount] > 0)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_ApplicationDetails')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_DepartmentMaster')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_PaymentGatewayConfig')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentGatewayConfig]
        FOREIGN KEY ([GatewayConfigId])
        REFERENCES [RTS].[PaymentGatewayConfig] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_PaymentStatusMaster')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentStatusMaster]
        FOREIGN KEY ([PaymentStatusId])
        REFERENCES [RTS].[PaymentStatusMaster] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentTransaction_PaymentModeMaster')
BEGIN
    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentModeMaster]
        FOREIGN KEY ([PaymentModeId])
        REFERENCES [RTS].[PaymentModeMaster] ([Id]);
END;
GO

/****** Object: Table [RTS].[PaymentWebhookLog] ******/
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentWebhookLog')
BEGIN
    CREATE TABLE [RTS].[PaymentWebhookLog]
    (
        [Id]                BIGINT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [GatewayConfigId]   INT NULL,
        [EventId]           VARCHAR(100) NULL,
        [EventType]         VARCHAR(100) NOT NULL,
        [SignatureHeader]   VARCHAR(500) NULL,
        [PayloadJson]       NVARCHAR(MAX) NOT NULL,
        [IsSignatureValid]  BIT NOT NULL CONSTRAINT [DF_PaymentWebhookLog_IsSignatureValid] DEFAULT (0),
        [IsProcessed]       BIT NOT NULL CONSTRAINT [DF_PaymentWebhookLog_IsProcessed] DEFAULT (0),
        [ProcessingError]   NVARCHAR(MAX) NULL,
        [ReceivedDate]      DATETIME NOT NULL CONSTRAINT [DF_PaymentWebhookLog_ReceivedDate] DEFAULT (GETDATE()),
        [ProcessedDate]     DATETIME NULL,

        CONSTRAINT [PK_PaymentWebhookLog] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_PaymentWebhookLog_PaymentGatewayConfig')
BEGIN
    ALTER TABLE [RTS].[PaymentWebhookLog] WITH CHECK
        ADD CONSTRAINT [FK_PaymentWebhookLog_PaymentGatewayConfig]
        FOREIGN KEY ([GatewayConfigId])
        REFERENCES [RTS].[PaymentGatewayConfig] ([Id]);
END;
GO

/* ============================================================================
   RTS High-Performance Non-Clustered Indexes (Aligned with PTIS Architecture)
   ============================================================================ */

-- 1. Index on ApplicationDetails for service, department, and status search
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_ApplicationDetails_Service_Status' AND object_id = OBJECT_ID(N'[RTS].[ApplicationDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_ApplicationDetails_Service_Status]
    ON [RTS].[ApplicationDetails] ([ServiceId], [ApplicationStatus], [MarkedForDeletion])
    INCLUDE ([Id], [ApplicationNo], [ApplicantName], [ApplicantMobileNo], [CreatedDate]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_ApplicationDetails_Department_Status' AND object_id = OBJECT_ID(N'[RTS].[ApplicationDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_ApplicationDetails_Department_Status]
    ON [RTS].[ApplicationDetails] ([DepartmentId], [ApplicationStatus], [MarkedForDeletion])
    INCLUDE ([Id], [ApplicationNo], [ApplicantName], [ApplicantMobileNo], [CreatedDate]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_ApplicationDetails_ApplicantMobileNo' AND object_id = OBJECT_ID(N'[RTS].[ApplicationDetails]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_ApplicationDetails_ApplicantMobileNo]
    ON [RTS].[ApplicationDetails] ([ApplicantMobileNo])
    WHERE ([MarkedForDeletion] = 0);
END;
GO

-- 2. Index on FieldValueData for fast dynamic field retrieval
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_FieldValueData_ApplicationId' AND object_id = OBJECT_ID(N'[RTS].[FieldValueData]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_FieldValueData_ApplicationId]
    ON [RTS].[FieldValueData] ([ApplicationId], [IsActive])
    INCLUDE ([FieldDefinitionId], [TextValue], [NumberValue], [DateValue])
    WHERE ([MarkedForDeletion] = 0);
END;
GO

-- 3. Index on TrackApplicationHistory for fast timeline rendering
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TrackApplicationHistory_App_Date' AND object_id = OBJECT_ID(N'[RTS].[TrackApplicationHistory]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_TrackApplicationHistory_App_Date]
    ON [RTS].[TrackApplicationHistory] ([ApplicationId], [CreatedDate] DESC);
END;
GO

-- 4. Index on IssuedCertificate for instant certificate lookup by application
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_IssuedCertificate_ApplicationId' AND object_id = OBJECT_ID(N'[RTS].[IssuedCertificate]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_IssuedCertificate_ApplicationId]
    ON [RTS].[IssuedCertificate] ([ApplicationId], [IsActive])
    WHERE ([MarkedForDeletion] = 0);
END;
GO

-- 5. Index on CitizenSession for OTP auth validation speed
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_CitizenSession_Mobile_Active' AND object_id = OBJECT_ID(N'[RTS].[CitizenSession]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_CitizenSession_Mobile_Active]
    ON [RTS].[CitizenSession] ([MobileNumber], [IsActive], [ExpiresAt]);
END;
GO

-- 6. Index on PaymentTransaction for application transaction queries
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_PaymentTransaction_ApplicationId' AND object_id = OBJECT_ID(N'[RTS].[PaymentTransaction]'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_PaymentTransaction_ApplicationId]
    ON [RTS].[PaymentTransaction] ([ApplicationId], [PaymentStatusId]);
END;
GO
