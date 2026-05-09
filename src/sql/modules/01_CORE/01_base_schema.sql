SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ===========================
   [CORE].[MultilingualResource]
 =========================== */
CREATE TABLE [CORE].[MultilingualResource](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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

    CONSTRAINT [PK_MultilingualResource] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_MultilingualResource_Context_Key] UNIQUE ([Context], [Key])
);
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
    [Email]               NVARCHAR(256) NULL,
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