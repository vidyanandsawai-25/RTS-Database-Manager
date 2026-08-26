SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS Certificate Engine & Sign-off Schema Upgrade
   Version: 1.1.1
   Module: 07_RTS
   ============================================================================ */

-- 1. [RTS].[CertificateTemplateMaster]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'CertificateTemplateMaster')
BEGIN
    CREATE TABLE [RTS].[CertificateTemplateMaster]
    (
        [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ServiceId]             INT NOT NULL,
        [TemplateName]          NVARCHAR(200) NOT NULL,
        [TemplateCode]          NVARCHAR(100) NULL,
        [HeaderContent]         NVARCHAR(MAX) NULL,
        [BodyContent]           NVARCHAR(MAX) NOT NULL,
        [FooterContent]         NVARCHAR(MAX) NULL,
        [DefaultConditionsJson] NVARCHAR(MAX) NULL,
        [OfficerFieldsJson]     NVARCHAR(MAX) NULL,
        [IsActive]              BIT NOT NULL CONSTRAINT [DF_CertificateTemplateMaster_IsActive] DEFAULT (1),
        [CreatedBy]             INT NULL,
        [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_CertificateTemplateMaster_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]             INT NULL,
        [UpdatedDate]           DATETIME NULL,

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

-- 2. [RTS].[IssuedCertificates]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'IssuedCertificates')
BEGIN
    CREATE TABLE [RTS].[IssuedCertificates]
    (
        [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [CertificateGuid]       UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_IssuedCertificates_CertificateGuid] DEFAULT (NEWID()),
        [CertificateNo]         NVARCHAR(100) NOT NULL,
        [ApplicationId]         INT NOT NULL,
        [ServiceId]             INT NOT NULL,
        [TemplateId]            INT NULL,
        [CitizenDataJson]       NVARCHAR(MAX) NULL,
        [OfficerDataJson]       NVARCHAR(MAX) NULL,
        [MergedHtmlContent]     NVARCHAR(MAX) NOT NULL,
        [IssuedByUserId]        INT NOT NULL,
        [IssuedByOfficerName]   NVARCHAR(200) NULL,
        [OfficerDesignation]    NVARCHAR(200) NULL,
        [IsDigitallySigned]     BIT NOT NULL CONSTRAINT [DF_IssuedCertificates_IsDigitallySigned] DEFAULT (1),
        [DigitalSignatureHash]  NVARCHAR(500) NULL,
        [QrCodeDataUrl]         NVARCHAR(MAX) NULL,
        [QrCodeVerificationUrl] NVARCHAR(500) NULL,
        [DownloadCount]         INT NOT NULL CONSTRAINT [DF_IssuedCertificates_DownloadCount] DEFAULT (0),
        [LastDownloadedDate]    DATETIME NULL,
        [IsActive]              BIT NOT NULL CONSTRAINT [DF_IssuedCertificates_IsActive] DEFAULT (1),
        [CreatedBy]             INT NULL,
        [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_IssuedCertificates_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]             INT NULL,
        [UpdatedDate]           DATETIME NULL,

        CONSTRAINT [PK_IssuedCertificates] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [UQ_IssuedCertificates_CertificateGuid] UNIQUE NONCLUSTERED ([CertificateGuid] ASC),
        CONSTRAINT [UQ_IssuedCertificates_CertificateNo] UNIQUE NONCLUSTERED ([CertificateNo] ASC)
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_IssuedCertificates_ApplicationDetails')
BEGIN
    ALTER TABLE [RTS].[IssuedCertificates] WITH CHECK
        ADD CONSTRAINT [FK_IssuedCertificates_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_IssuedCertificates_ServiceMaster')
BEGIN
    ALTER TABLE [RTS].[IssuedCertificates] WITH CHECK
        ADD CONSTRAINT [FK_IssuedCertificates_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);
END;
GO

-- 3. [RTS].[ApprovalFlowStageMaster] Capability Flags
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
