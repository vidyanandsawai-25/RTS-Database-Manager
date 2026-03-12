SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ===========================
   [CORE].[MultilingualResource]
 =========================== */
CREATE TABLE [CORE].[MultilingualResource](
    [MultilingualId] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Context]        NVARCHAR(256) NOT NULL,
    [Key]            NVARCHAR(256) NOT NULL,
    [English]        NVARCHAR(500) NOT NULL,
    [Hindi]          NVARCHAR(500) NOT NULL,
    [Marathi]        NVARCHAR(500) NOT NULL,
    [IsActive]       BIT NOT NULL CONSTRAINT [DF_MultilingualResource_IsActive] DEFAULT (1),
    [CreatedBy]      INT NULL,
    [CreatedDate]    DATETIME NOT NULL CONSTRAINT [DF_MultilingualResource_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]      INT NULL,
    [UpdatedDate]    DATETIME NULL,

    CONSTRAINT [PK_MultilingualResource] PRIMARY KEY CLUSTERED ([MultilingualId] ASC),
    CONSTRAINT [UQ_MultilingualResource_Context_Key] UNIQUE ([Context], [Key])
);
GO

/* ===========================
   [CORE].[DepartmentMaster]
 =========================== */
CREATE TABLE [CORE].[DepartmentMaster](
    [DepartmentId]          INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentCode]        VARCHAR(50) NOT NULL,
    [DepartmentName]        VARCHAR(100) NOT NULL,
    [DepartmentNameLocal]   NVARCHAR(150) NULL,
    [DepartmentIcon]        VARCHAR(50) NULL,
    [DepartmentDescription] NVARCHAR(200) NULL,
    [IsActive]              BIT NOT NULL CONSTRAINT [DF_DepartmentMaster_IsActive] DEFAULT (1),
    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_DepartmentMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED ([DepartmentId] ASC),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentCode] UNIQUE ([DepartmentCode]),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentName] UNIQUE ([DepartmentName])
);
GO

/* ===========================
   [CORE].[DepartmentLicenceDetails]
  =========================== */
CREATE TABLE [CORE].[DepartmentLicenceDetails](
    [DepartmentLicenceId] INT IDENTITY(1,1)NOT FOR REPLICATION NOT NULL,
    [DepartmentId]  INT NOT NULL,
    [LicenceStartDate]    DATE NULL,
    [LicenceEndDate]      DATE NULL,
    [LicenceDuration]     VARCHAR(50) NULL,
    [IsActive]            BIT NOT NULL CONSTRAINT [DF_DepartmentLicenceDetails_IsActive] DEFAULT (1),
    [CreatedBy]           INT NULL,
    [CreatedDate]         DATETIME NOT NULL CONSTRAINT [DF_DepartmentLicenceDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]           INT NULL,
    [UpdatedDate]         DATETIME NULL,

    CONSTRAINT [PK_DepartmentLicenceDetails] PRIMARY KEY CLUSTERED ([DepartmentLicenceId] ASC),
    CONSTRAINT [FK_DepartmentLicenceDetails_DepartmentMaster]
        FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([DepartmentId]),
    CONSTRAINT [CK_DepartmentLicenceDetails_DateRange]
        CHECK ([LicenceStartDate] IS NULL OR [LicenceEndDate] IS NULL OR [LicenceEndDate] >= [LicenceStartDate])
);
GO

CREATE NONCLUSTERED INDEX [IX_DepartmentLicenceDetails_DepartmentId]
ON [CORE].[DepartmentLicenceDetails] ([DepartmentId]);
GO

/* ===========================
   [CORE].[DesignationMaster]
 =========================== */
CREATE TABLE [CORE].[DesignationMaster](
    [DesignationId]        INT IDENTITY(1,1)NOT FOR REPLICATION NOT NULL,
    [DesignationCode]      VARCHAR(50) NOT NULL,
    [DesignationName]      VARCHAR(100) NOT NULL,
    [DesignationLocal]     NVARCHAR(150) NULL,
    [DesignationDescription] NVARCHAR(250) NULL,
    [IsActive]             BIT NOT NULL CONSTRAINT [DF_DesignationMaster_IsActive] DEFAULT (1),
    [CreatedBy]            INT NULL,
    [CreatedDate]          DATETIME NOT NULL CONSTRAINT [DF_DesignationMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]            INT NULL,
    [UpdatedDate]          DATETIME NULL,

    CONSTRAINT [PK_DesignationMaster] PRIMARY KEY CLUSTERED ([DesignationId] ASC),
    CONSTRAINT [UQ_DesignationMaster_DesignationCode] UNIQUE ([DesignationCode]),
    CONSTRAINT [UQ_DesignationMaster_DesignationName] UNIQUE ([DesignationName])
);
GO

/* ===========================
   [CORE].[ScreenGroupMaster]
  =========================== */
CREATE TABLE [CORE].[ScreenGroupMaster](
    [ScreenGroupId]        INT IDENTITY(1,1)NOT FOR REPLICATION NOT NULL,
    [ScreenGroupCode]      VARCHAR(50) NOT NULL,
    [ScreenGroupName]      VARCHAR(100) NOT NULL,
    [ScreenGroupNameLocal] NVARCHAR(150) NULL,
    [ScreenGroupIcon]      VARCHAR(50) NULL,
    [DisplayOrder]         INT NULL,
    [IsActive]             BIT NOT NULL CONSTRAINT [DF_ScreenGroupMaster_IsActive] DEFAULT (1),
    [CreatedBy]            INT NULL,
    [CreatedDate]          DATETIME NOT NULL CONSTRAINT [DF_ScreenGroupMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]            INT NULL,
    [UpdatedDate]          DATETIME NULL,

    CONSTRAINT [PK_ScreenGroupMaster] PRIMARY KEY CLUSTERED ([ScreenGroupId] ASC),
    CONSTRAINT [UQ_ScreenGroupMaster_ScreenGroupCode] UNIQUE ([ScreenGroupCode])
);
GO

/* ===========================
   [CORE].[BankMaster]
=========================== */
CREATE TABLE [CORE].[BankMaster](
    [BankId]     INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [BankCode]   NVARCHAR(50) NOT NULL,
    [BankName]   NVARCHAR(200) NOT NULL,
    [BranchName] NVARCHAR(200) NULL,
    [IFSCCode]   VARCHAR(11) NULL,
    [Address]    NVARCHAR(500) NULL,
    [City]       NVARCHAR(50) NULL,
    [State]      NVARCHAR(50) NULL,
    [Pincode]    NVARCHAR(10) NULL,
    [IsActive]   BIT NOT NULL CONSTRAINT [DF_BankMaster_IsActive] DEFAULT (1),
    [CreatedBy]  INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_BankMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]  INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_BankMaster] PRIMARY KEY CLUSTERED ([BankId] ASC),
    CONSTRAINT [UQ_BankMaster_BankCode] UNIQUE ([BankCode]),
    CONSTRAINT [CK_BankMaster_IFSC_Len] CHECK ([IFSCCode] IS NULL OR LEN([IFSCCode]) = 11)
);
GO

/* ===========================
   [CORE].[OfficeMaster]
 =========================== */
CREATE TABLE [CORE].[OfficeMaster](
    [OfficeId]          INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [OfficeCode]        NVARCHAR(20) NOT NULL,
    [OfficeName]        NVARCHAR(100) NOT NULL,
    [Type]              NVARCHAR(20) NULL,
    [Address]           NVARCHAR(250) NULL,
    [City]              NVARCHAR(50) NULL,
    [Pincode]           NVARCHAR(10) NULL,
    [Phone]             VARCHAR(13) NULL,
    [EmailId]           NVARCHAR(100) NULL,
    [OfficeIncharge]    INT NULL,
    [DesignationMasterId] INT NULL,
    [EstablishedDate]   DATETIME NULL,
    [IsActive]          BIT NOT NULL CONSTRAINT [DF_OfficeMaster_IsActive] DEFAULT (1),
    [CreatedBy]         INT NULL,
    [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_OfficeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]         INT NULL,
    [UpdatedDate]       DATETIME NULL,

    CONSTRAINT [PK_OfficeMaster] PRIMARY KEY CLUSTERED ([OfficeId] ASC),
    CONSTRAINT [UQ_OfficeMaster_OfficeCode] UNIQUE ([OfficeCode])
);
GO

CREATE NONCLUSTERED INDEX [IX_OfficeMaster_DesignationMasterId]
ON [CORE].[OfficeMaster] ([DesignationMasterId]);
GO

ALTER TABLE [CORE].[OfficeMaster] WITH CHECK
ADD CONSTRAINT [FK_OfficeMaster_DesignationMaster]
FOREIGN KEY ([DesignationMasterId]) REFERENCES [CORE].[DesignationMaster] ([DesignationId]);
GO
ALTER TABLE [CORE].[OfficeMaster] CHECK CONSTRAINT [FK_OfficeMaster_DesignationMaster];
GO


/* ===========================
   [CORE].[PaymentMode]
=========================== */
CREATE TABLE [CORE].[PaymentMode](
    [PaymentModeId]     INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Code]              VARCHAR(50) NOT NULL,
    [PaymentModeName]   VARCHAR(100) NOT NULL,
    [Type]              VARCHAR(50) NULL,
    [Category]          VARCHAR(50) NULL,
    [Description]       NVARCHAR(200) NULL,
    [ChargeType]        VARCHAR(50) NULL,
    [TransactionCharge] INT NULL,
    [IsActive]          BIT NOT NULL CONSTRAINT [DF_PaymentMode_IsActive] DEFAULT (1),
    [CreatedBy]         INT NULL,
    [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_PaymentMode_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]         INT NULL,
    [UpdatedDate]       DATETIME NULL,

    CONSTRAINT [PK_PaymentMode] PRIMARY KEY CLUSTERED ([PaymentModeId] ASC),
    CONSTRAINT [UQ_PaymentMode_Code] UNIQUE ([Code]),
    CONSTRAINT [CK_PaymentMode_TransactionCharge]
        CHECK ([TransactionCharge] IS NULL OR [TransactionCharge] >= 0)
);
GO

/* ===========================
   [CORE].[ServiceCategoryMaster]
=========================== */
CREATE TABLE [CORE].[ServiceCategoryMaster](
    [ServiceCategoryId]  INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ServiceCode]        VARCHAR(50) NOT NULL,
    [ServiceName]        NVARCHAR(200) NOT NULL,
    [DepartmentId] INT NULL,
    [ServiceType]        VARCHAR(50) NOT NULL,
    [Priority]           VARCHAR(20) NOT NULL,
    [ProcessingTimeDays] INT NOT NULL,
    [Description]        NVARCHAR(500) NULL,
    [IsActive]           BIT NOT NULL CONSTRAINT [DF_ServiceCategoryMaster_IsActive] DEFAULT (1),
    [CreatedBy]          INT NULL,
    [CreatedDate]        DATETIME NOT NULL CONSTRAINT [DF_ServiceCategoryMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]          INT NULL,
    [UpdatedDate]        DATETIME NULL,

    CONSTRAINT [PK_ServiceCategoryMaster] PRIMARY KEY CLUSTERED ([ServiceCategoryId] ASC),
    CONSTRAINT [UQ_ServiceCategoryMaster_ServiceCode] UNIQUE ([ServiceCode]),
    CONSTRAINT [CK_ServiceCategoryMaster_ProcessingTimeDays] CHECK ([ProcessingTimeDays] >= 0)
);
GO

CREATE NONCLUSTERED INDEX [IX_ServiceCategoryMaster_DepartmentId]
ON [CORE].[ServiceCategoryMaster] ([DepartmentId]);
GO

ALTER TABLE [CORE].[ServiceCategoryMaster] WITH CHECK
ADD CONSTRAINT [FK_ServiceCategoryMaster_DepartmentMaster]
FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([DepartmentId]);
GO
ALTER TABLE [CORE].[ServiceCategoryMaster] CHECK CONSTRAINT [FK_ServiceCategoryMaster_DepartmentMaster];
GO

/* ===========================
   [CORE].[UserRoleMaster]
  =========================== */
CREATE TABLE [CORE].[UserRoleMaster](
    [UserRoleId]    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserRoleName]  NVARCHAR(100) NOT NULL,

    [IsActive]      BIT NOT NULL CONSTRAINT [DF_UserRoleMaster_IsActive] DEFAULT (1),
    [CreatedBy]     INT NULL,
    [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_UserRoleMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]     INT NULL,
    [UpdatedDate]   DATETIME NULL,

    CONSTRAINT [PK_UserRoleMaster] PRIMARY KEY CLUSTERED ([UserRoleId] ASC),
    CONSTRAINT [UQ_UserRoleMaster_UserRoleName] UNIQUE ([UserRoleName])
);
GO

/* ===========================
   [CORE].[YearMaster]
=========================== */
CREATE TABLE [CORE].[YearMaster](
    [YearId]      INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Year]        INT NOT NULL,
    [YearCode]    NVARCHAR(15) NULL,
    [Status]      NVARCHAR(10) NULL,
    [StartDate]   DATETIME NULL,
    [EndDate]     DATETIME NULL,
    [Description] NVARCHAR(500) NULL,
    [IsActive]    BIT NOT NULL CONSTRAINT [DF_YearMaster_IsActive] DEFAULT (1),
    [CreatedBy]   INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_YearMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]   INT NULL,
    [UpdatedDate] DATETIME NULL,
    CONSTRAINT [PK_YearMaster] PRIMARY KEY CLUSTERED ([YearId] ASC),
    CONSTRAINT [UQ_YearMaster_Year] UNIQUE ([Year]),
    CONSTRAINT [CK_YearMaster_DateRange]
        CHECK ([StartDate] IS NULL OR [EndDate] IS NULL OR [EndDate] >= [StartDate])
);
GO

/* ===========================
   [CORE].[DepartmentYearConfigMaster]
=========================== */
CREATE TABLE [CORE].[DepartmentYearConfigMaster](
    [DepartmentYearConfigId] INT IDENTITY(1,1)NOT FOR REPLICATION NOT NULL,
    [DepartmentId] INT NOT NULL,
    [YearId] INT NOT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT DF_DepartmentYearConfigMaster_IsActive DEFAULT(1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT DF_DepartmentYearConfigMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,
    CONSTRAINT PK_DepartmentYearConfigMaster PRIMARY KEY CLUSTERED ([DepartmentYearConfigId]),
    CONSTRAINT UQ_DepartmentYearConfigMaster UNIQUE ([DepartmentId],[YearId]),
    CONSTRAINT FK_DepartmentYearConfigMaster_DepartmentMaster FOREIGN KEY ([DepartmentId])
        REFERENCES [CORE].[DepartmentMaster]([DepartmentId]),
    CONSTRAINT FK_DepartmentYearConfig_YearMaster FOREIGN KEY ([YearId])
        REFERENCES [CORE].[YearMaster]([YearId])
);
GO