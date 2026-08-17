SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   Upgrade 1.1.1: RTS Payment Module Enterprise Normalized Schema and Seeds
   ============================================================================ */

-- 1. PaymentStatusMaster
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

-- 2. PaymentModeMaster
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

-- 3. PaymentGatewayConfig
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

-- 4. PaymentTransaction
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'RTS' AND TABLE_NAME = 'PaymentTransaction')
BEGIN
    CREATE TABLE [RTS].[PaymentTransaction]
    (
        [Id]                BIGINT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [TransactionNo]     VARCHAR(60) NOT NULL,
        [ApplicationId]     INT NOT NULL,
        [ApplicationNo]     VARCHAR(100) NOT NULL,
        [ServiceId]         INT NOT NULL,
        [DepartmentId]      INT NOT NULL,
        [GatewayConfigId]   INT NOT NULL,
        [PaymentStatusId]   INT NOT NULL,
        [PaymentModeId]     INT NULL,
        [BaseAmount]        DECIMAL(18,2) NOT NULL,
        [LateFeeAmount]     DECIMAL(18,2) NOT NULL CONSTRAINT [DF_PaymentTransaction_LateFeeAmount] DEFAULT (0),
        [DiscountAmount]    DECIMAL(18,2) NOT NULL CONSTRAINT [DF_PaymentTransaction_DiscountAmount] DEFAULT (0),
        [TotalAmount]       DECIMAL(18,2) NOT NULL,
        [Currency]          VARCHAR(10) NOT NULL CONSTRAINT [DF_PaymentTransaction_Currency] DEFAULT ('INR'),
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
        CONSTRAINT [UQ_PaymentTransaction_GatewayOrderId] UNIQUE NONCLUSTERED ([GatewayOrderId] ASC) WHERE [GatewayOrderId] IS NOT NULL,
        CONSTRAINT [UQ_PaymentTransaction_ReceiptNo] UNIQUE NONCLUSTERED ([ReceiptNo] ASC) WHERE [ReceiptNo] IS NOT NULL,
        CONSTRAINT [CK_PaymentTransaction_TotalAmount] CHECK ([TotalAmount] > 0)
    );

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]);

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_ServiceMaster]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[ServiceMaster] ([Id]);

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]);

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentGatewayConfig]
        FOREIGN KEY ([GatewayConfigId])
        REFERENCES [RTS].[PaymentGatewayConfig] ([Id]);

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentStatusMaster]
        FOREIGN KEY ([PaymentStatusId])
        REFERENCES [RTS].[PaymentStatusMaster] ([Id]);

    ALTER TABLE [RTS].[PaymentTransaction] WITH CHECK
        ADD CONSTRAINT [FK_PaymentTransaction_PaymentModeMaster]
        FOREIGN KEY ([PaymentModeId])
        REFERENCES [RTS].[PaymentModeMaster] ([Id]);
END;
GO

-- 5. PaymentWebhookLog
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

    ALTER TABLE [RTS].[PaymentWebhookLog] WITH CHECK
        ADD CONSTRAINT [FK_PaymentWebhookLog_PaymentGatewayConfig]
        FOREIGN KEY ([GatewayConfigId])
        REFERENCES [RTS].[PaymentGatewayConfig] ([Id]);
END;
GO

-- 6. Seeds for Status, Mode, and Gateway Config
MERGE [RTS].[PaymentStatusMaster] AS target
USING (VALUES
    ('INITIATED', 'Initiated', N'सुरू केले', 'bg-amber-50 text-amber-700', 1, 1),
    ('PENDING',   'Pending',   N'प्रलंबित',   'bg-yellow-50 text-yellow-800', 2, 1),
    ('SUCCESS',   'Success',   N'यशस्वी',     'bg-emerald-50 text-emerald-700', 3, 1),
    ('FAILED',    'Failed',    N'अयशस्वी',   'bg-rose-50 text-rose-700', 4, 1),
    ('REFUNDED',  'Refunded',  N'परतावा केला', 'bg-purple-50 text-purple-700', 5, 1),
    ('EXPIRED',   'Expired',   N'कालबाह्य',   'bg-slate-50 text-slate-700', 6, 1)
) AS source (StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive)
ON target.StatusCode = source.StatusCode
WHEN MATCHED THEN
    UPDATE SET 
        target.StatusNameEn = source.StatusNameEn,
        target.StatusNameMr = source.StatusNameMr,
        target.BadgeColor = source.BadgeColor,
        target.DisplayOrder = source.DisplayOrder,
        target.IsActive = source.IsActive
WHEN NOT MATCHED THEN
    INSERT (StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive, CreatedDate)
    VALUES (source.StatusCode, source.StatusNameEn, source.StatusNameMr, source.BadgeColor, source.DisplayOrder, source.IsActive, GETDATE());
GO

MERGE [RTS].[PaymentModeMaster] AS target
USING (VALUES
    ('UPI',             'UPI / QR Code',      N'युपीआय / क्यूआर कोड', 'QrCode', 1),
    ('NETBANKING',      'Internet Banking',  N'नेट बँकिंग',           'Building', 1),
    ('CREDIT_CARD',     'Credit Card',       N'क्रेडिट कार्ड',         'CreditCard', 1),
    ('DEBIT_CARD',      'Debit Card',        N'डेबिट कार्ड',          'CreditCard', 1),
    ('WALLET',          'Digital Wallet',    N'डिजिटल वॉलेट',         'Wallet', 1),
    ('OFFLINE_CHALLAN', 'Offline Challan',   N'ऑफलाइन चलन',          'FileText', 1)
) AS source (ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive)
ON target.ModeCode = source.ModeCode
WHEN MATCHED THEN
    UPDATE SET 
        target.ModeNameEn = source.ModeNameEn,
        target.ModeNameMr = source.ModeNameMr,
        target.IconName = source.IconName,
        target.IsActive = source.IsActive
WHEN NOT MATCHED THEN
    INSERT (ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive, CreatedDate)
    VALUES (source.ModeCode, source.ModeNameEn, source.ModeNameMr, source.IconName, source.IsActive, GETDATE());
GO

IF NOT EXISTS (SELECT 1 FROM [RTS].[PaymentGatewayConfig] WHERE [GatewayCode] = 'RAZORPAY')
BEGIN
    INSERT INTO [RTS].[PaymentGatewayConfig]
    (
        [GatewayCode],
        [GatewayName],
        [MerchantId],
        [KeyId],
        [SecretKey],
        [WebhookSecret],
        [ServiceUrl],
        [Currency],
        [IsActive],
        [IsDefault],
        [CreatedDate]
    )
    VALUES
    (
        'RAZORPAY',
        N'Razorpay Smart Payment Gateway',
        NULL,
        'rzp_test_SZLId8MmrfQwTX',
        'd1TPunImUMBxcPDStAGUnOdj',
        'd1TPunImUMBxcPDStAGUnOdj',
        'https://api.razorpay.com/v1/checkout/embedded',
        'INR',
        1,
        1,
        GETDATE()
    );
END;
GO
