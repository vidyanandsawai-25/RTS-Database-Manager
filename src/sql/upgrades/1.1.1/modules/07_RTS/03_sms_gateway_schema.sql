SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   Upgrade 1.1.1: Core SMS Gateway Architecture & RTS Notification Engine
   100% Database-Driven Configuration for Akola Municipal Corporation
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

/* ============================================================================
   SEED / SYNC OFFICIAL AKOLA MUNICIPAL CORPORATION GATEWAY & TEMPLATES
   ============================================================================ */

-- Clean any previous seed data to ensure fresh, accurate config
DELETE FROM [CORE].[SMSMaster];
DELETE FROM [CORE].[SmsGatewayDetails];
DELETE FROM [CORE].[SMSGatewayMaster];

-- 1. Insert Gateway Provider
SET IDENTITY_INSERT [CORE].[SMSGatewayMaster] ON;
INSERT INTO [CORE].[SMSGatewayMaster] ([SMSGatewayMasterID], [ProviderName], [IsActive], [CreatedBy], [CreatedDate])
VALUES (1, 'Akola Municipal Corporation SMS Gateway', 1, 1, GETDATE());
SET IDENTITY_INSERT [CORE].[SMSGatewayMaster] OFF;
GO

-- 2. Insert Gateway Configuration Properties
SET IDENTITY_INSERT [CORE].[SmsGatewayDetails] ON;
INSERT INTO [CORE].[SmsGatewayDetails] 
    ([SMSGatewayDetailsID], [SMSGatewayMasterID], [PropertyName], [Value], [SequenceNo], [IsURL], [IsMessage], [IsMobile], [IsTemplateID], [IsUnicode], [IsActive], [CreatedBy], [CreatedDate])
VALUES
    (1, 1, 'BaseURL',   'http://sms.ptaxcollection.com/sendsms.jsp', 1, 1, 0, 0, 0, 0, 1, 1, GETDATE()),
    (2, 1, 'user',      'payakl',                                    2, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
    (3, 1, 'password',  'fb05b4a701XX',                              3, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
    (4, 1, 'senderid',  'AKOLMC',                                    4, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
    (5, 1, 'mobiles',   '',                                          5, 0, 0, 1, 0, 0, 1, 1, GETDATE()),
    (6, 1, 'sms',       '',                                          6, 0, 1, 0, 0, 0, 1, 1, GETDATE()),
    (7, 1, 'tempid',    '1707175319753583565',                       7, 0, 0, 0, 1, 0, 1, 1, GETDATE()),
    (8, 1, 'unicode',   '0',                                         8, 0, 0, 0, 0, 1, 1, 1, GETDATE());
SET IDENTITY_INSERT [CORE].[SmsGatewayDetails] OFF;
GO

-- 3. Upsert SMS Types
MERGE INTO [CORE].[SMSType] AS Target
USING (VALUES
    (1, 'OTP',                       'One Time Password for login/verification'),
    (2, 'Change Password',           'Notification for password updates'),
    (3, 'Online Fee Paid',           'Receipt notification for online payments'),
    (4, 'RTS Application Submitted', 'Notification sent when RTS application is submitted'),
    (5, 'RTS Payment Pending',       'Notification requesting citizen to pay application fee'),
    (6, 'RTS Application Approved',  'Notification when RTS service is approved and ready'),
    (7, 'RTS Application Rejected',  'Notification when RTS application is rejected')
) AS Source ([SMSTypeID], [TypeName], [Description])
ON Target.[TypeName] = Source.[TypeName]
WHEN MATCHED THEN
    UPDATE SET Target.[Description] = Source.[Description], Target.[IsActive] = 1
WHEN NOT MATCHED THEN
    INSERT ([TypeName], [Description], [IsActive])
    VALUES (Source.[TypeName], Source.[Description], 1);
GO

-- 4. Insert Official DLT SMS Templates
DECLARE @GatewayId INT = 1;
DECLARE @OtpTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'OTP');
DECLARE @SubmitTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'RTS Application Submitted');
DECLARE @PaymentPendingTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'RTS Payment Pending');
DECLARE @FeePaidTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'Online Fee Paid');
DECLARE @ApprovedTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'RTS Application Approved');

INSERT INTO [CORE].[SMSMaster] ([SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate])
VALUES
(@GatewayId, @OtpTypeId,            'OTP_SMS',            '1707175319753583565', 'Your PTAX Login OTP is {OTP} Akola Municipal Corporation', 1, 1, GETDATE()),
(@GatewayId, @SubmitTypeId,         'RTS_APP_SUBMITTED',  '1707175319753583565', 'Dear Citizen {UserName}, your application {ApplicationNo} for {ServiceName} has been successfully submitted to Akola Municipal Corporation.', 1, 1, GETDATE()),
(@GatewayId, @PaymentPendingTypeId, 'RTS_PAYMENT_PENDING','1707175319753583565', 'Dear Citizen {UserName}, your application {ApplicationNo} is verified. Please pay Government Fee of Rs.{Amount} to Akola Municipal Corporation.', 1, 1, GETDATE()),
(@GatewayId, @FeePaidTypeId,        'RTS_FEE_PAID',       '1707175319753583565', 'Dear Citizen {UserName}, payment of Rs.{Amount} for application {ApplicationNo} is successful. Receipt No: {ReceiptNo}. Akola Municipal Corporation', 1, 1, GETDATE()),
(@GatewayId, @ApprovedTypeId,       'RTS_APP_APPROVED',   '1707175319753583565', 'Dear Citizen {UserName}, your certificate for {ServiceName} (Application No: {ApplicationNo}) has been approved by Akola Municipal Corporation.', 1, 1, GETDATE());
GO
