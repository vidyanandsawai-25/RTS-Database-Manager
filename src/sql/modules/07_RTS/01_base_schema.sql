
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE TABLE [RTS].[DepartmentMaster]
(
    [Id] INT IDENTITY(1,1) NOT NULL,
    [DepartmentName] NVARCHAR(200) NOT NULL,
    [DeptIcon] NVARCHAR(200) NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_DepartmentMaster_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_DepartmentMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_DepartmentMaster_DepartmentName] UNIQUE NONCLUSTERED ([DepartmentName] ASC)
);

CREATE TABLE [RTS].[Services]
(
    [Id] INT IDENTITY(1,1) NOT NULL,
    [DepartmentId] INT NOT NULL,
    [RTSServiceId] INT NULL,
    [ServiceName] NVARCHAR(300) NOT NULL,
    [Description] NVARCHAR(500) NULL,
    [ServiceUrl] NVARCHAR(500) NULL,
    [ServiceIcon] NVARCHAR(100) NULL,

    [IsActive] BIT NOT NULL CONSTRAINT [DF_Services_IsActive] DEFAULT (1),

    [CreatedBy] INT NOT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_Services_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_Services_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id])
);

CREATE TABLE [RTS].[FieldDefinition]
(
    [Id] INT IDENTITY(1,1) NOT NULL,

    [DepartmentId] INT NOT NULL,
    [ServiceId] INT NOT NULL,

    [FieldCode] NVARCHAR(50) NOT NULL,
    [FieldName] NVARCHAR(100) NOT NULL,
    [FieldLabel] NVARCHAR(200) NOT NULL,
    [FieldType] NVARCHAR(50) NOT NULL,
    [FieldGroup] NVARCHAR(100) NULL,

    [OptionsJson] NVARCHAR(MAX) NULL,
    [DefaultValue] NVARCHAR(200) NULL,
    [ValidationRules] NVARCHAR(200) NULL,

    [IsRequired] BIT NOT NULL CONSTRAINT [DF_FieldDefinition_IsRequired] DEFAULT (0),
    [DisplayOrder] INT NOT NULL CONSTRAINT [DF_FieldDefinition_DisplayOrder] DEFAULT (0),

    [MinValue] DECIMAL(18,4) NULL,
    [MaxValue] DECIMAL(18,4) NULL,
    [MaxLength] INT NULL,

    [IsActive] BIT NOT NULL CONSTRAINT [DF_FieldDefinition_IsActive] DEFAULT (1),
    [MarkedForDeletion] BIT NOT NULL CONSTRAINT [DF_FieldDefinition_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_FieldDefinition_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_FieldDefinition]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_FieldDefinition_Department_Service_FieldCode]
        UNIQUE NONCLUSTERED ([DepartmentId] ASC, [ServiceId] ASC, [FieldCode] ASC),

    CONSTRAINT [FK_FieldDefinition_Department]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]),

    CONSTRAINT [FK_FieldDefinition_Service]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[Services] ([Id])
);

CREATE TABLE [RTS].[ApplicationDetails]
(
    [Id] INT IDENTITY(1,1) NOT NULL,

    [ApplicationNo] AS 
        ('RTS' + RIGHT('00000000' + CONVERT(VARCHAR(8), [Id]), 8)) PERSISTED,

    [DepartmentId] INT NOT NULL,
    [ServiceId] INT NOT NULL,
    [OwnerId] INT NULL,

    [ApplicationStatus] NVARCHAR(50) NULL,
    [Remark] NVARCHAR(500) NULL,

    [IsActive] BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_IsActive] DEFAULT (1),
    [MarkedForDeletion] BIT NOT NULL CONSTRAINT [DF_ApplicationDetails_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_ApplicationDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_ApplicationDetails]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_ApplicationDetails_ApplicationNo]
        UNIQUE NONCLUSTERED ([ApplicationNo] ASC),

    CONSTRAINT [FK_ApplicationDetails_DepartmentMaster]
        FOREIGN KEY ([DepartmentId])
        REFERENCES [RTS].[DepartmentMaster] ([Id]),

    CONSTRAINT [FK_ApplicationDetails_Services]
        FOREIGN KEY ([ServiceId])
        REFERENCES [RTS].[Services] ([Id])
);

CREATE TABLE [RTS].[FieldValue]
(
    [Id] INT IDENTITY(1,1) NOT NULL,

    [ApplicationId] INT NOT NULL,
    [FieldDefinitionId] INT NOT NULL,

    [FieldName] NVARCHAR(100) NOT NULL,

    [TextValue] NVARCHAR(MAX) NULL,
    [NumberValue] DECIMAL(18,4) NULL,
    [DateValue] DATETIME NULL,
    [BooleanValue] BIT NULL,
    [DocumentGuid] UNIQUEIDENTIFIER NULL,

    [IsActive] BIT NOT NULL CONSTRAINT [DF_FieldValue_IsActive] DEFAULT (1),
    [MarkedForDeletion] BIT NOT NULL CONSTRAINT [DF_FieldValue_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME NULL,

    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_FieldValue_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_FieldValue]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_FieldValue_Application_FieldDefinition]
        UNIQUE NONCLUSTERED ([ApplicationId] ASC, [FieldDefinitionId] ASC),

    CONSTRAINT [FK_FieldValue_ApplicationDetails]
        FOREIGN KEY ([ApplicationId])
        REFERENCES [RTS].[ApplicationDetails] ([Id]),

    CONSTRAINT [FK_FieldValue_FieldDefinition]
        FOREIGN KEY ([FieldDefinitionId])
        REFERENCES [RTS].[FieldDefinition] ([Id])
);
GO

