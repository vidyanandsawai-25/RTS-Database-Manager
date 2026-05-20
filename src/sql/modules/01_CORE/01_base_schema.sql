SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ===========================
   [CORE].[MultilingualResource]
 =========================== */
CREATE TABLE [CORE].[MultilingualResource](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Resource] [nvarchar](256) NOT NULL,
	[Key] [nvarchar](256) NOT NULL,
	[en_US] [nvarchar](500) NOT NULL,
	[hi_IN] [nvarchar](500) NOT NULL,
	[mr_IN] [nvarchar](500) NOT NULL,
	[IsGenerated] [bit] NOT NULL ,--- Default value will be set from application code while inserting/updating records
	[IsActive]              BIT NOT NULL CONSTRAINT [DF_MultilingualResource_IsActive] DEFAULT (1),
    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_MultilingualResource_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,
    CONSTRAINT [PK_MultilingualResource] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT UQ_MultilingualResource_Resource_Key  UNIQUE ([Resource], [Key])
)ON [PRIMARY]
GO


/* ===========================
   [CORE].[DepartmentMaster]
 =========================== */
CREATE TABLE [CORE].[DepartmentMaster](
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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

    CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentCode] UNIQUE ([DepartmentCode]),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentName] UNIQUE ([DepartmentName])
);
GO
/* ===========================
   [CORE].[ModuleMaster]
=========================== */
CREATE TABLE [CORE].[ModuleMaster](
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentId]      INT NOT NULL,
    [ModuleCode]        NVARCHAR(50) NOT NULL,
    [ModuleName]        NVARCHAR(50) NOT NULL,
    [ModuleNameLocal]   NVARCHAR(50) NULL,
    [ModuleIcon]        NVARCHAR(50) NULL,
    [ModuleLabel]       NVARCHAR(100) NULL,
    [ModuleDescription] NVARCHAR(100) NULL,
    [IsActive]          BIT NOT NULL CONSTRAINT [DF_ModuleMaster_IsActive]    DEFAULT (1),
    [CreatedBy]         INT NULL,
    [CreatedDate]       DATETIME NOT NULL CONSTRAINT [DF_ModuleMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]         INT NULL,
    [UpdatedDate]       DATETIME NULL,

    CONSTRAINT [PK_ModuleMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ModuleMaster_ModuleCode] UNIQUE ([ModuleCode]),
    CONSTRAINT [UQ_ModuleMaster_ModuleName] UNIQUE ([ModuleName])
);
GO

    ALTER TABLE [CORE].[ModuleMaster] WITH CHECK
    ADD CONSTRAINT [FK_ModuleMaster_DepartmentId]
    FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id]);
    GO

    ALTER TABLE [CORE].[ModuleMaster] CHECK CONSTRAINT [FK_ModuleMaster_DepartmentId];
    GO

CREATE NONCLUSTERED INDEX [IX_ModuleMaster_DepartmentId]
    ON [CORE].[ModuleMaster] ([DepartmentId]);
GO

/* ===========================
   [CORE].[DepartmentLicenceDetails]
  =========================== */
CREATE TABLE [CORE].[DepartmentLicenceDetails](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentId]         INT NOT NULL,
    [LicenceStartDate]     DATE NULL,
    [LicenceEndDate]       DATE NULL,
    [LicenceDuration]      VARCHAR(50) NULL,
    [IsActive]             BIT NOT NULL CONSTRAINT [DF_DepartmentLicenceDetails_IsActive] DEFAULT (1),
    [CreatedBy]            INT NULL,
    [CreatedDate]          DATETIME NOT NULL CONSTRAINT [DF_DepartmentLicenceDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]            INT NULL,
    [UpdatedDate]          DATETIME NULL,

    CONSTRAINT [PK_DepartmentLicenceDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DepartmentLicenceDetails_DepartmentMaster]
        FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id]),
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
    [Id]                     INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DesignationCode]       VARCHAR(50) NOT NULL,
    [DesignationName]       VARCHAR(100) NOT NULL,
    [DesignationLocal]      NVARCHAR(150) NULL,
    [DesignationDescription] NVARCHAR(250) NULL,
    [IsActive]              BIT NOT NULL CONSTRAINT [DF_DesignationMaster_IsActive] DEFAULT (1),
    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_DesignationMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_DesignationMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_DesignationMaster_DesignationCode] UNIQUE ([DesignationCode]),
    CONSTRAINT [UQ_DesignationMaster_DesignationName] UNIQUE ([DesignationName])
);
GO

/* ===========================
   [CORE].[ScreenGroupMaster]
  =========================== */
CREATE TABLE [CORE].[ScreenGroupMaster](
    [Id]                   INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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

    CONSTRAINT [PK_ScreenGroupMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ScreenGroupMaster_ScreenGroupCode] UNIQUE ([ScreenGroupCode])
);
GO

/* ===========================
   [CORE].[BankMaster]
=========================== */
CREATE TABLE [CORE].[BankMaster](
    [Id]          INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [BankCode]    NVARCHAR(50) NOT NULL,
    [BankName]    NVARCHAR(200) NOT NULL,
    [BranchName]  NVARCHAR(200) NULL,
    [IFSCCode]    VARCHAR(11) NULL,
    [Address]     NVARCHAR(500) NULL,
    [City]        NVARCHAR(50) NULL,
    [State]       NVARCHAR(50) NULL,
    [Pincode]     NVARCHAR(10) NULL,
    [IsActive]    BIT NOT NULL CONSTRAINT [DF_BankMaster_IsActive] DEFAULT (1),
    [CreatedBy]   INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_BankMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]   INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_BankMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_BankMaster_BankCode] UNIQUE ([BankCode]),
    CONSTRAINT [CK_BankMaster_IFSC_Len] CHECK ([IFSCCode] IS NULL OR LEN([IFSCCode]) = 11)
);
GO

/* ===========================
   [CORE].[OfficeMaster]
 =========================== */
CREATE TABLE [CORE].[OfficeMaster](
    [Id]                   INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [OfficeCode]           NVARCHAR(20) NOT NULL,
    [OfficeName]           NVARCHAR(100) NOT NULL,
    [Type]                 NVARCHAR(20) NULL,
    [Address]              NVARCHAR(250) NULL,
    [City]                 NVARCHAR(50) NULL,
    [Pincode]              NVARCHAR(10) NULL,
    [Phone]                VARCHAR(13) NULL,
    [EmailId]              NVARCHAR(100) NULL,
    [OfficeIncharge]       INT NULL,
    [DesignationMasterId]  INT NULL,
    [EstablishedDate]      DATETIME NULL,
    [IsActive]             BIT NOT NULL CONSTRAINT [DF_OfficeMaster_IsActive] DEFAULT (1),
    [CreatedBy]            INT NULL,
    [CreatedDate]          DATETIME NOT NULL CONSTRAINT [DF_OfficeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]            INT NULL,
    [UpdatedDate]          DATETIME NULL,

    CONSTRAINT [PK_OfficeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_OfficeMaster_OfficeCode] UNIQUE ([OfficeCode])
);
GO

CREATE NONCLUSTERED INDEX [IX_OfficeMaster_DesignationMasterId]
ON [CORE].[OfficeMaster] ([DesignationMasterId]);
GO

ALTER TABLE [CORE].[OfficeMaster] WITH CHECK
ADD CONSTRAINT [FK_OfficeMaster_DesignationMaster]
FOREIGN KEY ([DesignationMasterId]) REFERENCES [CORE].[DesignationMaster] ([Id]);
GO
ALTER TABLE [CORE].[OfficeMaster] CHECK CONSTRAINT [FK_OfficeMaster_DesignationMaster];
GO

/* ===========================
   [CORE].[PaymentMode]
=========================== */
CREATE TABLE [CORE].[PaymentMode](
    [Id]                INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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

    CONSTRAINT [PK_PaymentMode] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_PaymentMode_Code] UNIQUE ([Code]),
    CONSTRAINT [CK_PaymentMode_TransactionCharge]
        CHECK ([TransactionCharge] IS NULL OR [TransactionCharge] >= 0)
);
GO

/* ===========================
   [CORE].[ServiceCategoryMaster]
=========================== */
CREATE TABLE [CORE].[ServiceCategoryMaster](
    [Id]                 INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ServiceCode]        VARCHAR(50) NOT NULL,
    [ServiceName]        NVARCHAR(200) NOT NULL,
    [DepartmentId]       INT NULL,
    [ServiceType]        VARCHAR(50) NOT NULL,
    [Priority]           VARCHAR(20) NOT NULL,
    [ProcessingTimeDays] INT NOT NULL,
    [Description]        NVARCHAR(500) NULL,
    [IsActive]           BIT NOT NULL CONSTRAINT [DF_ServiceCategoryMaster_IsActive] DEFAULT (1),
    [CreatedBy]          INT NULL,
    [CreatedDate]        DATETIME NOT NULL CONSTRAINT [DF_ServiceCategoryMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]          INT NULL,
    [UpdatedDate]        DATETIME NULL,

    CONSTRAINT [PK_ServiceCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ServiceCategoryMaster_ServiceCode] UNIQUE ([ServiceCode]),
    CONSTRAINT [CK_ServiceCategoryMaster_ProcessingTimeDays] CHECK ([ProcessingTimeDays] >= 0)
);
GO

CREATE NONCLUSTERED INDEX [IX_ServiceCategoryMaster_DepartmentId]
ON [CORE].[ServiceCategoryMaster] ([DepartmentId]);
GO

ALTER TABLE [CORE].[ServiceCategoryMaster] WITH CHECK
ADD CONSTRAINT [FK_ServiceCategoryMaster_DepartmentMaster]
FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id]);
GO
ALTER TABLE [CORE].[ServiceCategoryMaster] CHECK CONSTRAINT [FK_ServiceCategoryMaster_DepartmentMaster];
GO

/* ===========================
   [CORE].[UserRoleMaster]
  =========================== */
CREATE TABLE [CORE].[UserRoleMaster](
    [Id]            INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserRoleName]  NVARCHAR(100) NOT NULL,
    [IsActive]      BIT NOT NULL CONSTRAINT [DF_UserRoleMaster_IsActive] DEFAULT (1),
    [CreatedBy]     INT NULL,
    [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_UserRoleMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]     INT NULL,
    [UpdatedDate]   DATETIME NULL,

    CONSTRAINT [PK_UserRoleMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_UserRoleMaster_UserRoleName] UNIQUE ([UserRoleName])
);
GO

/* ===========================
   [CORE].[YearMaster]
=========================== */
CREATE TABLE [CORE].[YearMaster](
    [Id]          INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
    CONSTRAINT [PK_YearMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_YearMaster_Year] UNIQUE ([Year]),
    CONSTRAINT [CK_YearMaster_DateRange]
        CHECK ([StartDate] IS NULL OR [EndDate] IS NULL OR [EndDate] >= [StartDate])
);
GO

/* ===========================
   [CORE].[DepartmentYearConfigMaster]
=========================== */
CREATE TABLE [CORE].[DepartmentYearConfigMaster](
    [Id]           INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [DepartmentId] INT NOT NULL,
    [YearId]       INT NOT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT DF_DepartmentYearConfigMaster_IsActive DEFAULT(1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT DF_DepartmentYearConfigMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,
    CONSTRAINT PK_DepartmentYearConfigMaster PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT UQ_DepartmentYearConfigMaster UNIQUE ([DepartmentId],[YearId]),
    CONSTRAINT FK_DepartmentYearConfigMaster_DepartmentMaster FOREIGN KEY ([DepartmentId])
        REFERENCES [CORE].[DepartmentMaster]([Id]),
    CONSTRAINT FK_DepartmentYearConfig_YearMaster FOREIGN KEY ([YearId])
        REFERENCES [CORE].[YearMaster]([Id])
);
GO

/* ===========================
   [CORE].[EmployeeTypeMaster]
=========================== */
CREATE TABLE [CORE].[EmployeeTypeMaster](
    [Id]    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [EmployeeType]  NVARCHAR(100) NOT NULL,
    [IsActive]      BIT NOT NULL CONSTRAINT [DF_EmployeeTypeMaster_IsActive] DEFAULT (1),
    [CreatedBy]     INT NULL,
    [CreatedDate]   DATETIME NOT NULL CONSTRAINT [DF_EmployeeTypeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]     INT NULL,
    [UpdatedDate]   DATETIME NULL,
    CONSTRAINT [PK_EmployeeTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_EmployeeTypeMaster_EmployeeType] UNIQUE ([EmployeeType])
);
GO

/* ===========================
   STEP 1: [CORE].[UserMaster]  ← must come FIRST (referenced by FKs below)
=========================== */
CREATE TABLE [CORE].[UserMaster](
    [Id]                  INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserName]            NVARCHAR(100) NOT NULL,
    [FirstName]           NVARCHAR(100) NULL,
	[MiddleName]          NVARCHAR(100) NULL,
	[LastName]            NVARCHAR(100) NULL,
    [UserCode]            NVARCHAR(50) NULL,
    [Address]             NVARCHAR(400) NULL,
    [MobileNo]            varchar(13) NULL,
    [AlternateMobileNo]   varchar(13) NULL,
    [Email]               NVARCHAR(100) NULL,
    [MustChangePassword]  BIT NOT NULL CONSTRAINT [DF_UserMaster_MustChangePassword] DEFAULT (0),
    [Language]            NVARCHAR(50) NULL,
    [IsActive]            BIT NOT NULL  CONSTRAINT [DF_UserMaster_IsActive]           DEFAULT (1),
    [Remark]              NVARCHAR(400) NULL,
    [LockedUntilAt]       DATETIME NULL,
    [FailedLoginCount]    INT NOT NULL  CONSTRAINT [DF_UserMaster_FailedLoginCount]   DEFAULT (0),
    [LastLoginAt]         DATETIME NULL,
    [UserLocked]          BIT NOT NULL  CONSTRAINT [DF_UserMaster_UserLocked]         DEFAULT (0),
    [EmployeeTypeId]      INT NOT NULL,
    [PasswordHash]        NVARCHAR(255) NULL,
    [CreatedBy]           INT NULL,
    [CreatedDate]         DATETIME NOT NULL CONSTRAINT [DF_UserMaster_CreatedDate]    DEFAULT (GETDATE()),
    [UpdatedBy]           INT NULL,
    [UpdatedDate]         DATETIME NULL,
    [MarkedForDeletion]   BIT NOT NULL  CONSTRAINT [DF_UserMaster_MarkedForDeletion]           DEFAULT (0),
	[MarkedForDeletionDate] DATETIME NULL,
    CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_UserMaster_UserName]           UNIQUE ([UserName]),
    CONSTRAINT [FK_UserMaster_EmployeeTypeMaster]
        FOREIGN KEY ([EmployeeTypeId]) REFERENCES [CORE].[EmployeeTypeMaster] ([Id])
);
GO

CREATE NONCLUSTERED INDEX [IX_UserMaster_EmployeeTypeId]
    ON [CORE].[UserMaster] ([EmployeeTypeId]);
GO

/* ===========================
   STEP 2: [CORE].[UserDepartmentAllocation]  ← depends on UserMaster + DepartmentMaster
=========================== */
CREATE TABLE [CORE].[UserDepartmentAllocation](
    [Id]           INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserId]       INT NOT NULL,
    [DepartmentId] INT NOT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT [DF_UserDepartmentAllocation_IsActive]    DEFAULT (1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT [DF_UserDepartmentAllocation_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,

    CONSTRAINT [PK_UserDepartmentAllocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_UserDepartmentAllocation_User_Department] UNIQUE ([UserId], [DepartmentId]),
    CONSTRAINT [FK_UserDepartmentAllocation_DepartmentMaster]
        FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id])
);
GO

-- Add FK after both tables exist
ALTER TABLE [CORE].[UserDepartmentAllocation] WITH CHECK
ADD CONSTRAINT [FK_UserDepartmentAllocation_UserMaster]
FOREIGN KEY ([UserId]) REFERENCES [CORE].[UserMaster] ([Id]);
GO
ALTER TABLE [CORE].[UserDepartmentAllocation] CHECK CONSTRAINT [FK_UserDepartmentAllocation_UserMaster];
GO


CREATE NONCLUSTERED INDEX [IX_UserDepartmentAllocation_DepartmentId]
    ON [CORE].[UserDepartmentAllocation] ([DepartmentId]);
GO

/* ===========================
   STEP 3: [CORE].[UserModuleAllocation]  ← depends on UserMaster + DepartmentMaster + ModuleMaster
=========================== */
CREATE TABLE [CORE].[UserModuleAllocation](
    [Id]           INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserId]       INT NOT NULL,
    [DepartmentId] INT NOT NULL,
    [ModuleId]     INT NOT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT [DF_UserModuleAllocation_IsActive]    DEFAULT (1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT [DF_UserModuleAllocation_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,

    CONSTRAINT [PK_UserModuleAllocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_UserModuleAllocation_User_Department_Module] UNIQUE ([UserId], [DepartmentId], [ModuleId]),
    CONSTRAINT [FK_UserModuleAllocation_UserMaster]
        FOREIGN KEY ([UserId]) REFERENCES [CORE].[UserMaster] ([Id]),
    CONSTRAINT [FK_UserModuleAllocation_DepartmentMaster]
        FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id])
    -- Removed single-column FK to ModuleMaster(Id); composite FK will be added later
);
GO


CREATE NONCLUSTERED INDEX [IX_UserModuleAllocation_DepartmentId]
    ON [CORE].[UserModuleAllocation] ([DepartmentId]);
GO
CREATE NONCLUSTERED INDEX [IX_UserModuleAllocation_ModuleId]
    ON [CORE].[UserModuleAllocation] ([ModuleId]);
GO

/* ===========================
   STEP 4: [CORE].[UserRoleAllocation]  ← depends on UserMaster + DepartmentMaster + UserRoleMaster
=========================== */
CREATE TABLE [CORE].[UserRoleAllocation](
    
    [Id]           INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserId]       INT NOT NULL,
    [DepartmentId] INT NOT NULL,
    [UserRoleId]   INT NOT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT [DF_UserRoleAllocation_IsActive]    DEFAULT (1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT [DF_UserRoleAllocation_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,

    CONSTRAINT [PK_UserRoleAllocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_UserRoleAllocation_User_Department_Role] UNIQUE ([UserId], [DepartmentId], [UserRoleId]),
    CONSTRAINT [FK_UserRoleAllocation_UserMaster]
        FOREIGN KEY ([UserId]) REFERENCES [CORE].[UserMaster] ([Id]),
    CONSTRAINT [FK_UserRoleAllocation_DepartmentMaster]
        FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id]),
    CONSTRAINT [FK_UserRoleAllocation_UserRoleMaster]
        FOREIGN KEY ([UserRoleId]) REFERENCES [CORE].[UserRoleMaster] ([Id])
);
GO

CREATE NONCLUSTERED INDEX [IX_UserRoleAllocation_DepartmentId]
    ON [CORE].[UserRoleAllocation] ([DepartmentId]);
GO
CREATE NONCLUSTERED INDEX [IX_UserRoleAllocation_UserRoleId]
    ON [CORE].[UserRoleAllocation] ([UserRoleId]);
GO

/* ===========================
   [CORE].[Document]
=========================== */
CREATE TABLE [CORE].[Document](
	[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DocumentGuid] UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_Document_DocumentGuid] DEFAULT (NEWSEQUENTIALID()) CONSTRAINT [UQ_Document_DocumentGuid] UNIQUE,
	[UploadedBy] INT NOT NULL,
	[OwnerUserId] INT NULL,
	[FileName] NVARCHAR(500) NOT NULL,
	[OriginalFileName] NVARCHAR(500) NOT NULL,
	[FileExtension] VARCHAR(50) NOT NULL,
	[MimeType] VARCHAR(200) NOT NULL,
	[FileSizeBytes] BIGINT NOT NULL CONSTRAINT [CK_Document_FileSizeBytes] CHECK ([FileSizeBytes] >= 0),
	[StorageProvider] VARCHAR(50) NOT NULL,
	[StoragePath] NVARCHAR(1000) NOT NULL,
	[ThumbnailPath] NVARCHAR(1000) NULL,
	[ChecksumSha256] VARCHAR(64) NULL
		CONSTRAINT [CK_Document_ChecksumSha256_Length] CHECK ([ChecksumSha256] IS NULL OR LEN([ChecksumSha256]) = 64),
	[ScanStatusCode] VARCHAR(50) NULL,
	[ScanCompletedDate] DATETIME NULL,
	[ScanDetails] NVARCHAR(4000) NULL,
	[UploadStatusCode] VARCHAR(50) NOT NULL,
	[DocumentTitle] NVARCHAR(500) NULL,
	[Description] NVARCHAR(2000) NULL,
	[DocumentType] NVARCHAR(100) NULL,
	[DocumentCategory] NVARCHAR(100) NULL,
	[Tags] VARCHAR(2000) NULL,
	[Language] VARCHAR(10) NULL,
	[Version] INT NOT NULL CONSTRAINT [CK_Document_Version_Positive] CHECK ([Version] > 0),
	[ParentDocumentId] INT NULL,
	[IsLatestVersion] BIT NOT NULL CONSTRAINT [DF_Document_IsLatestVersion] DEFAULT (1),
	[ReplacedByDocumentId] INT NULL,
	[IsPublic] BIT NOT NULL CONSTRAINT [DF_Document_IsPublic] DEFAULT (0),
	[InheritPermissions] BIT NOT NULL CONSTRAINT [DF_Document_InheritPermissions] DEFAULT (1),
	[ConfidentialityLevel] VARCHAR(50) NULL,
	[ExpiryDate] DATETIME NULL,
	[RetentionPeriodDays] INT NULL CONSTRAINT [CK_Document_RetentionPeriodDays_NonNegative] CHECK ([RetentionPeriodDays] >= (0)),
	[PageCount] INT NULL CONSTRAINT [CK_Document_PageCount_NonNegative] CHECK ([PageCount] >= (0)),
	[SearchableText] NVARCHAR(4000) NULL,
	[ExtractionStatus] VARCHAR(50) NULL,
	[EncryptionKeyId] VARCHAR(100) NULL,
	[IsEncrypted] BIT NOT NULL CONSTRAINT [DF_Document_IsEncrypted] DEFAULT (0),
	[DownloadCount] INT NOT NULL
		CONSTRAINT [DF_Document_DownloadCount] DEFAULT (0)
		CONSTRAINT [CK_Document_DownloadCount_NonNegative] CHECK ([DownloadCount] >= 0),
	[LastAccessedDate] DATETIME NULL,
	[LastAccessedByUserId] INT NULL,
	[SourceSystem] VARCHAR(100) NULL,
	[IsActive] BIT NOT NULL CONSTRAINT [DF_Document_IsActive] DEFAULT (1),
	[MarkedForDeletion] BIT NOT NULL CONSTRAINT [DF_Document_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] DATETIME NULL,
	[CreatedBy] INT NULL,
	[CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_Document_CreatedDate] DEFAULT (GETDATE()),
	[UpdatedBy] INT NULL,
	[UpdatedDate] DATETIME NULL,
	[DeletedDate] DATETIME NULL,
	[DeletedBy] INT NULL,
	[RowVersion] ROWVERSION NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
);
GO

-- Add foreign key constraints for user references
ALTER TABLE [CORE].[Document] WITH CHECK
ADD CONSTRAINT [FK_Document_UploadedBy]
FOREIGN KEY ([UploadedBy]) REFERENCES [CORE].[UserMaster] ([Id]);
GO

ALTER TABLE [CORE].[Document] CHECK CONSTRAINT [FK_Document_UploadedBy];
GO

ALTER TABLE [CORE].[Document] WITH CHECK
ADD CONSTRAINT [FK_Document_OwnerUserId]
FOREIGN KEY ([OwnerUserId]) REFERENCES [CORE].[UserMaster] ([Id]);
GO

ALTER TABLE [CORE].[Document] CHECK CONSTRAINT [FK_Document_OwnerUserId];
GO

ALTER TABLE [CORE].[Document] WITH CHECK
ADD CONSTRAINT [FK_Document_LastAccessedByUserId]
FOREIGN KEY ([LastAccessedByUserId]) REFERENCES [CORE].[UserMaster] ([Id]);
GO

ALTER TABLE [CORE].[Document] CHECK CONSTRAINT [FK_Document_LastAccessedByUserId];
GO

-- Add self-referencing foreign keys for versioning
ALTER TABLE [CORE].[Document] WITH CHECK
ADD CONSTRAINT [FK_Document_ParentDocumentId]
FOREIGN KEY ([ParentDocumentId]) REFERENCES [CORE].[Document] ([Id]);
GO

ALTER TABLE [CORE].[Document] CHECK CONSTRAINT [FK_Document_ParentDocumentId];
GO

ALTER TABLE [CORE].[Document] WITH CHECK
ADD CONSTRAINT [FK_Document_ReplacedByDocumentId]
FOREIGN KEY ([ReplacedByDocumentId]) REFERENCES [CORE].[Document] ([Id]);
GO

ALTER TABLE [CORE].[Document] CHECK CONSTRAINT [FK_Document_ReplacedByDocumentId];
GO

-- Add indexes for foreign key columns
CREATE NONCLUSTERED INDEX [IX_Document_UploadedBy]
    ON [CORE].[Document] ([UploadedBy]);
GO

CREATE NONCLUSTERED INDEX [IX_Document_OwnerUserId]
    ON [CORE].[Document] ([OwnerUserId]);
GO

CREATE NONCLUSTERED INDEX [IX_Document_LastAccessedByUserId]
    ON [CORE].[Document] ([LastAccessedByUserId]);
GO

CREATE NONCLUSTERED INDEX [IX_Document_ParentDocumentId]
    ON [CORE].[Document] ([ParentDocumentId]);
GO

CREATE NONCLUSTERED INDEX [IX_Document_ReplacedByDocumentId]
    ON [CORE].[Document] ([ReplacedByDocumentId]);
GO


/* ===========================
 screen master
=========================== */

CREATE TABLE [CORE].[ScreenMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ScreenGroupId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[ScreenCode] [varchar](200) NOT NULL,
	[ScreenName] [varchar](200) NOT NULL,
	[ScreenNameLocal] [nvarchar](200) NULL,
	[ScreenIcon] [nvarchar](100) NULL,
	[RoutePath] [nvarchar](300) NULL,
	[IsMenu] [bit] NULL,
	[IsAuthenticationRequired] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[IsActive]     BIT NOT NULL CONSTRAINT DF_ScreenMaster_IsActive DEFAULT(1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT DF_ScreenMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,
    CONSTRAINT [PK_ScreenMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_ScreenMaster_ScreenCode] UNIQUE ([ScreenCode]),
    CONSTRAINT [FK_ScreenMaster_ScreenGroupMaster] FOREIGN KEY ([ScreenGroupId]) REFERENCES [CORE].[ScreenGroupMaster] ([Id]),
    CONSTRAINT [FK_ScreenMaster_ModuleMaster] FOREIGN KEY ([ModuleId]) REFERENCES [CORE].[ModuleMaster] ([Id] ) ,
    CONSTRAINT [CK_ScreenMaster_DisplayOrder_NonNegative] CHECK ([DisplayOrder] >= 0)   

)
GO

/* ===========================
 role wise screen access master
=========================== */


CREATE TABLE [CORE].[RoleWiseScreenAccessMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[ScreenId] [int] NOT NULL,
	[CanView] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[HaveFullAccess] [bit] NOT NULL,
	[HaveNoAccess] [bit] NOT NULL,
	[IsActive]     BIT NOT NULL CONSTRAINT DF_RoleWiseScreenAccessMaster_IsActive DEFAULT(1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT DF_RoleWiseScreenAccessMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,
    CONSTRAINT [PK_RoleWiseScreenAccessMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_RoleWiseScreenAccessMaster_UserRole_Screen] UNIQUE ([UserRoleId], [ScreenId]),
    CONSTRAINT [FK_RoleWiseScreenAccessMaster_UserRoleMaster] FOREIGN KEY ([UserRoleId]) REFERENCES [CORE].[UserRoleMaster] ([Id]),
    CONSTRAINT [FK_RoleWiseScreenAccessMaster_ScreenMaster] FOREIGN KEY ([ScreenId]) REFERENCES [CORE].[ScreenMaster] ([Id])
)

GO

/* ===========================
   RuleEffectTypeMaster
=========================== */
CREATE TABLE [CORE].[RuleEffectTypeMaster](
    [Id]           INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [EffectType]   VARCHAR(100) NOT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT [DF_RuleEffectTypeMaster_IsActive]    DEFAULT (1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT [DF_RuleEffectTypeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,

    CONSTRAINT [PK_RuleEffectTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_RuleEffectTypeMaster_EffectType] UNIQUE ([EffectType])
);
GO

/* ===========================
 RuleOperatorMaster
=========================== */
CREATE TABLE [CORE].[RuleOperatorMaster](
    [Id]                    INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [Operator]              VARCHAR(100) NOT NULL,
    [OperatorDescription]   VARCHAR(100) NOT NULL,
    [IsActive]              BIT NOT NULL CONSTRAINT [DF_RuleOperatorMaster_IsActive]    DEFAULT (1),
    [CreatedBy]             INT NULL,
    [CreatedDate]           DATETIME NOT NULL CONSTRAINT [DF_RuleOperatorMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]             INT NULL,
    [UpdatedDate]           DATETIME NULL,

    CONSTRAINT [PK_RuleOperatorMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_RuleOperatorMaster_Operator] UNIQUE ([Operator])
);
GO

/* ===========================
 RuleScopeMaster
=========================== */
CREATE TABLE [CORE].[RuleScopeMaster](
    [Id]          INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [RuleScope]   VARCHAR(100) NOT NULL,
    [IsActive]    BIT NOT NULL CONSTRAINT [DF_RuleScopeMaster_IsActive]    DEFAULT (1),
    [CreatedBy]   INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_RuleScopeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]   INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_RuleScopeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_RuleScopeMaster_RuleScope] UNIQUE ([RuleScope])
);
GO


/* ===========================
 DocumentBinding
 =========================== */
CREATE TABLE [CORE].[DocumentBinding](
	[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DocumentId] INT NOT NULL,
	[ModuleId] INT NOT NULL,
	[ReferenceTableName] VARCHAR(100) NOT NULL,
	[ReferenceTableId] INT NULL,
	[ReferenceTableIdGuid] UNIQUEIDENTIFIER NULL,
	[BindingPurpose] VARCHAR(200) NULL,
	[DisplayOrder] INT NULL,
	[IsPrimaryDocument] BIT NOT NULL CONSTRAINT [DF_DocumentBinding_IsPrimaryDocument] DEFAULT (0),
	[Notes] VARCHAR(1000) NULL,
	[AccessPermission] VARCHAR(50) NULL,
	[ExpiryDate] DATETIME NULL,
	[AuthModuleId] INT NULL,
	[AuthReferenceId] INT NULL,
	[IsActive] BIT NOT NULL CONSTRAINT [DF_DocumentBinding_IsActive] DEFAULT (1),
	[IsReferenceValid] BIT NOT NULL CONSTRAINT [DF_DocumentBinding_IsReferenceValid] DEFAULT (0),
	[LastValidatedDate] DATETIME NULL,
	[ValidationError] VARCHAR(500) NULL,
	[CreatedBy] INT NULL,
	[CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_DocumentBinding_CreatedDate] DEFAULT (GETDATE()),
	[UpdatedBy] INT NULL,
	[UpdatedDate] DATETIME NULL,
	[RowVersion] ROWVERSION NOT NULL,
	CONSTRAINT [PK_DocumentBinding] PRIMARY KEY CLUSTERED ([Id] ASC ),
    CONSTRAINT [FK_DocumentBinding_Document] FOREIGN KEY ([DocumentId]) REFERENCES [CORE].[Document] ([Id]),
	CONSTRAINT [CK_DocumentBinding_ReferenceId_XOR]
		CHECK (
			([ReferenceTableId] IS NOT NULL AND [ReferenceTableIdGuid] IS NULL) OR
			([ReferenceTableId] IS NULL AND [ReferenceTableIdGuid] IS NOT NULL)
		)
);
GO

ALTER TABLE [CORE].[DocumentBinding] WITH CHECK
ADD CONSTRAINT [FK_DocumentBinding_ModuleMaster]
FOREIGN KEY ([ModuleId]) REFERENCES [CORE].[ModuleMaster] ([Id]);
GO

ALTER TABLE [CORE].[DocumentBinding] CHECK CONSTRAINT [FK_DocumentBinding_ModuleMaster];
GO

ALTER TABLE [CORE].[DocumentBinding] WITH CHECK
ADD CONSTRAINT [FK_DocumentBinding_AuthModuleMaster]
FOREIGN KEY ([AuthModuleId]) REFERENCES [CORE].[ModuleMaster] ([Id]);
GO

ALTER TABLE [CORE].[DocumentBinding] CHECK CONSTRAINT [FK_DocumentBinding_AuthModuleMaster];
GO

CREATE NONCLUSTERED INDEX [IX_DocumentBinding_DocumentId]
ON [CORE].[DocumentBinding] ([DocumentId]);
GO

CREATE NONCLUSTERED INDEX [IX_DocumentBinding_ModuleId]
ON [CORE].[DocumentBinding] ([ModuleId]);
GO

CREATE NONCLUSTERED INDEX [IX_DocumentBinding_Reference]
ON [CORE].[DocumentBinding] ([ModuleId], [ReferenceTableName], [ReferenceTableId])
WHERE [ReferenceTableId] IS NOT NULL;
GO

CREATE NONCLUSTERED INDEX [IX_DocumentBinding_ReferenceGuid]
ON [CORE].[DocumentBinding] ([ModuleId], [ReferenceTableName], [ReferenceTableIdGuid])
WHERE [ReferenceTableIdGuid] IS NOT NULL;
GO

CREATE NONCLUSTERED INDEX [IX_DocumentBinding_AuthModule]
ON [CORE].[DocumentBinding] ([AuthModuleId], [AuthReferenceId]) WHERE [AuthModuleId] IS NOT NULL AND [AuthReferenceId] IS NOT NULL;
 
 /* ===========================
 CommonRemarkTypeMaster
 =========================== */
CREATE TABLE [CORE].[CommonRemarkTypeMaster](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [RemarkTypeName] VARCHAR(100) NOT NULL, -- e.g. Survey, Recovery, Notice, Mobile Remark, etc.
   	[IsActive]     BIT NOT NULL CONSTRAINT DF_CommonRemarkTypeMaster_IsActive DEFAULT(1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT DF_CommonRemarkTypeMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,
CONSTRAINT [PK_CommonRemarkTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
CONSTRAINT [UQ_CommonRemarkTypeMaster_RemarkTypeName] UNIQUE ([RemarkTypeName])
);

GO
/* ===========================
 CommunicationTypeMaster
 =========================== */
CREATE TABLE [CORE].[CommunicationTypeMaster](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [TypeName] VARCHAR(100) NOT NULL,
    [DepartmentId] INT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_CommunicationTypeMaster_IsActive] DEFAULT ((1)),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_CommunicationTypeMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,
    CONSTRAINT [PK_CommunicationTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CommunicationTypeMaster_DepartmentMaster] FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster] ([Id])
);
GO

CREATE TABLE [CORE].[UlbType](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL ,
	[UlbTypeName] [varchar](50) NOT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_UlbType_IsActive] DEFAULT ((1)),
 	[CreatedBy] INT NULL,
 	[CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_UlbType_CreatedDate] DEFAULT (GETDATE()),
 	[UpdatedBy] INT NULL,
 	[UpdatedDate] DATETIME NULL,
 CONSTRAINT [PK_UlbType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [CORE].[UlbMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL ,
	[UlbCode] [nvarchar](50) NOT NULL,
	[UlbName] [nvarchar](200) NOT NULL,
	[UlbNameLocal] [nvarchar](200) NULL,
	[UlbTypeId] [int] NOT NULL,
	[UlbLogo] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[MobileNo] [varchar](13) NULL,
	[AlternateMobileNo] [varchar](13) NULL,
	[WebsiteUrl] [nvarchar](2048) NULL,
	[ContactPersonName] [nvarchar](150) NULL,
	[ContactPersonDesignation] [nvarchar](100) NULL,
	[UlbAddress] [nvarchar](500) NULL,
	[State] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[PinCode] [varchar](10) NULL,
	[ProjectStartDate] [datetime] NULL,
	[FinancialYearStartDate] [datetime] NULL,
	[ExpectedGoLiveDate] [datetime] NULL,
	[PartnerName] [varchar](50) NULL,
	[PMName] [varchar](50) NULL,
	[PMEmailId] [nvarchar](100) NULL,
	[PMMobileNo] [varchar](13) NULL,
	[LicenceType] [varchar](50) NULL,
	[LicenceStartDate] [datetime] NULL,
	[LicenceEndDate] [datetime] NULL,
	[LicenceDuration] [varchar](50) NULL,
	[SupportType] [varchar](50) NULL,
	[LicenceKey] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT [DF_UlbMaster_CreatedDate] DEFAULT (GETDATE()),
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UlbMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY],
 CONSTRAINT [UQ_UlbMaster_UlbCode] UNIQUE NONCLUSTERED 
(
	[UlbCode] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [CORE].[UlbMaster] ADD  CONSTRAINT [DF_UlbMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [CORE].[UlbMaster]  WITH CHECK ADD  CONSTRAINT [FK_UlbMaster_UlbType] FOREIGN KEY([UlbTypeId])
REFERENCES [CORE].[UlbType] ([Id])
GO
ALTER TABLE [CORE].[UlbMaster] CHECK CONSTRAINT [FK_UlbMaster_UlbType]
GO
CREATE NONCLUSTERED INDEX [IX_UlbMaster_UlbTypeId]
ON [CORE].[UlbMaster] ([UlbTypeId]);
GO
CREATE TABLE [CORE].[RefreshToken](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL ,
    [Token] [nvarchar](400) NOT NULL,
    [UserId] [int] NOT NULL,
    [ExpiresAt] [datetime] NOT NULL,
    [IsRevoked] [bit] NOT NULL CONSTRAINT [DF_RefreshToken_IsRevoked] DEFAULT (0),
    [RevokedAt] [datetime] NULL,
    [IpAddress] [nvarchar](45) NULL,
    [UserAgent] [nvarchar](500) NULL,
    [IsActive] BIT NOT NULL CONSTRAINT DF_RefreshToken_IsActive DEFAULT(1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT DF_RefreshToken_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_RefreshToken_Token] UNIQUE ([Token])    
);
 
ALTER TABLE [CORE].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_UserMaster] FOREIGN KEY([UserId])
REFERENCES [CORE].[UserMaster] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [CORE].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_UserMaster];
GO
 
CREATE TABLE [CORE].[ConfigCategoryMaster](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL  ,
    [CategoryCode] [varchar](30) NOT NULL,
    [CategoryName] [nvarchar](100) NOT NULL,
    [DisplayOrder] [int] NOT NULL CONSTRAINT DF_ConfigCategoryMaster_DisplayOrder DEFAULT(0),
    [IsActive] BIT NOT NULL CONSTRAINT DF_ConfigCategoryMaster_IsActive DEFAULT(1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT DF_ConfigCategoryMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,
 CONSTRAINT [PK_ConfigCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_ConfigCategoryMaster_CategoryCode] UNIQUE ([CategoryCode])
) ON [PRIMARY]
GO
 

CREATE TABLE [CORE].[ConfigKeyMaster](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL ,
    [CategoryId] [int] NOT NULL,
    [ConfigCode] [varchar](60) NOT NULL,
    [ConfigName] [nvarchar](150) NOT NULL,
    [Description] [nvarchar](400) NULL,
    [DataType] [varchar](20) NOT NULL,
    [ControlType] [varchar](30) NOT NULL,
    [DefaultValue] [nvarchar](500) NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT DF_ConfigKeyMaster_IsActive DEFAULT(1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConfigKeyMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL, 
 CONSTRAINT [PK_ConfigKeyMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_ConfigKeyMaster_ConfigCode] UNIQUE ([ConfigCode])
) ON [PRIMARY]
GO
 
ALTER TABLE [CORE].[ConfigKeyMaster] WITH CHECK ADD CONSTRAINT [FK_ConfigKeyMaster_ConfigCategoryMaster_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [CORE].[ConfigCategoryMaster] ([Id])
GO
ALTER TABLE [CORE].[ConfigKeyMaster] CHECK CONSTRAINT [FK_ConfigKeyMaster_ConfigCategoryMaster_CategoryId]
GO
 
CREATE NONCLUSTERED INDEX [IX_ConfigKeyMaster_CategoryId]
ON [CORE].[ConfigKeyMaster] ([CategoryId] ASC)
GO
 
CREATE TABLE [CORE].[ConfigValueMaster](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [ConfigKeyId] [int] NOT NULL,
    [DepartmentId] [int] NULL,
    [ModuleId] [int] NULL,
    [Value] [nvarchar](500) NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT DF_ConfigValueMaster_IsActive DEFAULT(1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConfigValueMaster_CreatedDate DEFAULT(GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_ConfigValueMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ConfigValue_ConfigKeyId_Global]
ON [CORE].[ConfigValueMaster] ([ConfigKeyId] ASC)
WHERE [DepartmentId] IS NULL AND [ModuleId] IS NULL
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ConfigValue_ConfigKeyId_DepartmentId]
ON [CORE].[ConfigValueMaster] ([ConfigKeyId] ASC, [DepartmentId] ASC)
WHERE [DepartmentId] IS NOT NULL AND [ModuleId] IS NULL
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ConfigValue_ConfigKeyId_ModuleId]
ON [CORE].[ConfigValueMaster] ([ConfigKeyId] ASC, [ModuleId] ASC)
WHERE [DepartmentId] IS NULL AND [ModuleId] IS NOT NULL
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ConfigValue_ConfigKeyId_DepartmentId_ModuleId]
ON [CORE].[ConfigValueMaster] ([ConfigKeyId] ASC, [DepartmentId] ASC, [ModuleId] ASC)
WHERE [DepartmentId] IS NOT NULL AND [ModuleId] IS NOT NULL
GO
 
ALTER TABLE [CORE].[ConfigValueMaster] WITH CHECK ADD CONSTRAINT [FK_ConfigValueMaster_ConfigKeyMaster_ConfigKeyId]
FOREIGN KEY([ConfigKeyId])
REFERENCES [CORE].[ConfigKeyMaster] ([Id]);
GO

ALTER TABLE [CORE].[ConfigValueMaster] WITH CHECK ADD CONSTRAINT [FK_ConfigValueMaster_DepartmentMaster_DepartmentId]
FOREIGN KEY([DepartmentId])
REFERENCES [CORE].[DepartmentMaster] ([Id]);
GO

ALTER TABLE [CORE].[ConfigValueMaster] WITH CHECK ADD CONSTRAINT [FK_ConfigValueMaster_ModuleMaster_ModuleId]
FOREIGN KEY([ModuleId])
REFERENCES [CORE].[ModuleMaster] ([Id]);
GO
