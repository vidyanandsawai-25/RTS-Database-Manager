SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS / Core SMS Gateway Architecture Tables (Schema: CORE)
   ============================================================================ */

-- 1. [CORE].[SMSGatewayMaster]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'SMSGatewayMaster')
BEGIN
    CREATE TABLE [CORE].[SMSGatewayMaster](
        [SMSGatewayMasterID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ProviderName]       [nvarchar](200) NOT NULL,
        [IsActive]           [bit] NOT NULL CONSTRAINT [DF_SMSGatewayMaster_IsActive] DEFAULT (1),
        [CreatedBy]          [int] NULL,
        [CreatedDate]        [datetime] NOT NULL CONSTRAINT [DF_SMSGatewayMaster_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_SMSGatewayMaster] PRIMARY KEY CLUSTERED ([SMSGatewayMasterID] ASC)
    );
END;
GO

-- 2. [CORE].[SmsGatewayDetails]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'SmsGatewayDetails')
BEGIN
    CREATE TABLE [CORE].[SmsGatewayDetails](
        [SMSGatewayDetailsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [SMSGatewayMasterID]  [int] NOT NULL,
        [PropertyName]        [nvarchar](100) NOT NULL,
        [Value]               [nvarchar](MAX) NULL,
        [SequenceNo]          [int] NULL,
        [IsURL]               [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsURL] DEFAULT (0),
        [IsMessage]           [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsMessage] DEFAULT (0),
        [IsMobile]            [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsMobile] DEFAULT (0),
        [IsTemplateID]        [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsTemplateID] DEFAULT (0),
        [IsUnicode]           [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsUnicode] DEFAULT (0),
        [IsActive]            [bit] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_IsActive] DEFAULT (1),
        [CreatedBy]           [int] NULL,
        [CreatedDate]         [datetime] NOT NULL CONSTRAINT [DF_SmsGatewayDetails_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_SmsGatewayDetails] PRIMARY KEY CLUSTERED ([SMSGatewayDetailsID] ASC),
        CONSTRAINT [FK_SmsGatewayDetails_SMSGatewayMaster] FOREIGN KEY([SMSGatewayMasterID]) REFERENCES [CORE].[SMSGatewayMaster] ([SMSGatewayMasterID])
    );
END;
GO

-- 3. [CORE].[SMSType]
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'SMSType')
BEGIN
    CREATE TABLE [CORE].[SMSType](
        [SMSTypeID]    [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [TypeName]     [nvarchar](100) NOT NULL,
        [Description]  [nvarchar](255) NULL,
        [IsActive]     [bit] NOT NULL CONSTRAINT [DF_SMSType_IsActive] DEFAULT (1),

        CONSTRAINT [PK_SMSType] PRIMARY KEY CLUSTERED ([SMSTypeID] ASC),
        CONSTRAINT [UQ_SMSType_TypeName] UNIQUE NONCLUSTERED ([TypeName] ASC)
    );
END;
GO

-- 4. [CORE].[SMSMaster] (DLT Templates)
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'SMSMaster')
BEGIN
    CREATE TABLE [CORE].[SMSMaster](
        [SmsID]              [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [SMSGatewayMasterID] [int] NOT NULL,
        [SMSTypeID]          [int] NOT NULL,
        [TemplateName]       [nvarchar](100) NOT NULL,
        [TemplateID]         [nvarchar](100) NULL,
        [SmsText]            [nvarchar](MAX) NOT NULL,
        [IsActive]           [bit] NOT NULL CONSTRAINT [DF_SMSMaster_IsActive] DEFAULT (1),
        [CreatedBy]          [int] NULL,
        [CreatedDate]        [datetime] NOT NULL CONSTRAINT [DF_SMSMaster_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy]          [int] NULL,
        [UpdatedDate]        [datetime] NULL,

        CONSTRAINT [PK_SMSMaster] PRIMARY KEY CLUSTERED ([SmsID] ASC),
        CONSTRAINT [FK_SMSMaster_SMSGatewayMaster] FOREIGN KEY([SMSGatewayMasterID]) REFERENCES [CORE].[SMSGatewayMaster] ([SMSGatewayMasterID]),
        CONSTRAINT [FK_SMSMaster_SMSType] FOREIGN KEY([SMSTypeID]) REFERENCES [CORE].[SMSType] ([SMSTypeID])
    );
END;
GO

-- 5. [CORE].[SMSSendDetails] (SMS Audit & Outbox Log)
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'SMSSendDetails')
BEGIN
    CREATE TABLE [CORE].[SMSSendDetails](
        [SMSSendDetailsID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [ReceiverMobileNo] [varchar](20) NOT NULL,
        [SenderName]       [nvarchar](50) NULL,
        [TemplateID]       [nvarchar](100) NULL,
        [SMSTypeID]        [int] NULL,
        [Message]          [nvarchar](MAX) NOT NULL,
        [SmsUrl]           [nvarchar](MAX) NULL,
        [SMSStatus]        [nvarchar](50) NOT NULL CONSTRAINT [DF_SMSSendDetails_SMSStatus] DEFAULT ('PENDING'),
        [GatewayResponse]  [nvarchar](MAX) NULL,
        [ApplicationId]    [int] NULL,
        [CreatedBy]        [int] NULL,
        [CreatedDate]      [datetime] NOT NULL CONSTRAINT [DF_SMSSendDetails_CreatedDate] DEFAULT (GETDATE()),

        CONSTRAINT [PK_SMSSendDetails] PRIMARY KEY CLUSTERED ([SMSSendDetailsID] ASC)
    );
END;
GO
