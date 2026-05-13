/* ===========================
 CommunicationDetails
=========================== */

CREATE TABLE [GSMS].[CommunicationDetails](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [CommunicationTypeId] INT NOT NULL,
    [CommunicationNo] VARCHAR(50) NULL,
    [CommunicationDate] DATETIME NULL,
    [IssuedBy] INT NULL,
    [ModuleId] INT NULL,
    [Latitude] DECIMAL(10,8) NULL,
    [Longitude] DECIMAL(11,8) NULL,
    [DeviceUniqueNo] VARCHAR(100) NULL,
    [Remarks] NVARCHAR(500) NULL,
    [Status] VARCHAR(50) NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_CommunicationDetails_IsActive] DEFAULT ((1)),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_CommunicationDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,
    CONSTRAINT [PK_CommunicationDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CommunicationDetails_CommunicationType] FOREIGN KEY ([CommunicationTypeId]) REFERENCES [CORE].[CommunicationTypeMaster] ([Id]),
    CONSTRAINT [FK_CommunicationDetails_IssuedBy] FOREIGN KEY ([IssuedBy]) REFERENCES [CORE].[UserMaster] ([Id]),
    CONSTRAINT [FK_CommunicationDetails_ModuleMaster] FOREIGN KEY ([ModuleId]) REFERENCES [CORE].[ModuleMaster] ([Id])
);
GO

/* ===========================
 CommonRemarkDetails
=========================== */
CREATE TABLE [GSMS].[CommonRemarkDetails](
        [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [RemarkTypeId] INT NOT NULL,
        [Remark] NVARCHAR(300) NOT NULL,
        [IsActive] BIT NOT NULL CONSTRAINT [DF_CommonRemarkDetails_IsActive] DEFAULT ((1)),
        [CreatedBy] INT NULL,
        [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_CommonRemarkDetails_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedBy] INT NULL,
        [UpdatedDate] DATETIME NULL,
        CONSTRAINT [PK_CommonRemarkDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_CommonRemarkDetails_CommonRemarkTypeMaster] FOREIGN KEY ([RemarkTypeId]) REFERENCES [CORE].[CommonRemarkTypeMaster] ([Id])
);
GO