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
 /****** Added here because [GSMS].[CommonRemarkDetails] is created after [PTIS].[PropertyMast], which avoids an execution error. ******/
ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_MobileNoRemarkMaster] FOREIGN KEY([MobileNoRemarkId])		
REFERENCES [GSMS].[CommonRemarkDetails] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_MobileNoRemarkMaster]
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_OccupierMobileNoRemarkMaster] FOREIGN KEY([OccupierMobileNoRemarkId])
REFERENCES [GSMS].[CommonRemarkDetails] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_OccupierMobileNoRemarkMaster]
GO

ALTER TABLE [GSMS].[CommonRemarkDetails] ADD CONSTRAINT [UQ_CommonRemarkDetails_RemarkTypeId_Remark] UNIQUE ([RemarkTypeId],[Remark])
GO

ALTER TABLE [PTIS].[PropertyMastDetails] WITH CHECK
ADD CONSTRAINT [FK_PropertyMastDetails_CommonRemarkDetails_OwnerSign]
FOREIGN KEY (OwnerSignRemarkId)
REFERENCES [GSMS].[CommonRemarkDetails] ([Id]);
GO

ALTER TABLE [PTIS].[PropertyMastDetails]
CHECK CONSTRAINT [FK_PropertyMastDetails_CommonRemarkDetails_OwnerSign];
GO

CREATE TABLE [GSMS].[SocietyWingDetails]
(
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [SocietyDetailId] INT NULL,
    [PropertyId] INT NULL,
    [WingId] INT NULL,
    [FromFloor] NVARCHAR(50) NULL,
    [ToFloor] NVARCHAR(50) NULL,
    [OldWingName] NVARCHAR(MAX) NULL,
    [NewWingName] NVARCHAR(500) NULL,
    [NoOfFlat] INT NULL,
    [NoOfShop] INT NULL,
    [NoOfRowHouse] INT NULL,
    [WingPhoto] INT NULL,
    [BoardPhoto] INT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_SocietyWingDetails_IsActive] DEFAULT ((1)),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_SocietyWingDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_GSMS_SocietyWingDetails]
        PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_SocietyWingDetails_SocietyDetailsMast] 
        FOREIGN KEY ([SocietyDetailId]) REFERENCES [PTIS].[SocietyDetailsMast] ([Id]),

    CONSTRAINT [FK_SocietyWingDetails_PropertyMast]
        FOREIGN KEY ([PropertyId])REFERENCES [PTIS].[PropertyMast] ([Id]),

    CONSTRAINT [FK_SocietyWingDetails_WingMaster]
        FOREIGN KEY ([WingId])REFERENCES [PTIS].[WingMaster] ([Id])
);

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ===========================
   STEP 1: [GSMS].[WardAllocation]  
=========================== */

CREATE TABLE [GSMS].[WardAllocation](
    [Id]   INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [UserId]       INT NOT NULL,
    [DepartmentId] INT NOT NULL,
    [ModuleId]     INT NOT NULL,
    [ZoneId]       INT NOT NULL,
    [WardId]       INT NOT NULL,
    [OldWardId]    INT NULL,
    [IsActive]     BIT NOT NULL CONSTRAINT [DF_WardAllocation_IsActive] DEFAULT (1),
    [CreatedBy]    INT NULL,
    [CreatedDate]  DATETIME NOT NULL CONSTRAINT [DF_WardAllocation_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]    INT NULL,
    [UpdatedDate]  DATETIME NULL,

    CONSTRAINT [PK_WardAllocation]
    PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [UQ_WardAllocation_User_Department_Module_Zone_Ward]
    UNIQUE ([UserId], [DepartmentId], [ModuleId], [ZoneId], [WardId])
);
GO

ALTER TABLE [GSMS].[WardAllocation] WITH CHECK
ADD CONSTRAINT [FK_WardAllocation_UserMaster]
FOREIGN KEY ([UserId]) REFERENCES [CORE].[UserMaster]([Id]);
GO

ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_UserMaster];
GO

ALTER TABLE [GSMS].[WardAllocation] WITH CHECK
ADD CONSTRAINT [FK_WardAllocation_DepartmentMaster]
FOREIGN KEY ([DepartmentId]) REFERENCES [CORE].[DepartmentMaster]([Id]);
GO

ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_DepartmentMaster];
GO

ALTER TABLE [GSMS].[WardAllocation] WITH CHECK
ADD CONSTRAINT [FK_WardAllocation_DepartmentModule]
FOREIGN KEY ([DepartmentId], [ModuleId]) REFERENCES [CORE].[ModuleMaster]([DepartmentId], [Id]);
GO

ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_DepartmentModule];
GO

ALTER TABLE [GSMS].[WardAllocation] WITH CHECK
ADD CONSTRAINT [FK_WardAllocation_ZoneMaster]
FOREIGN KEY ([ZoneId]) REFERENCES [PTIS].[ZoneMaster]([Id]);
GO

ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_ZoneMaster];
GO

ALTER TABLE [GSMS].[WardAllocation] WITH CHECK
ADD CONSTRAINT [FK_WardAllocation_WardMaster]
FOREIGN KEY ([WardId]) REFERENCES [PTIS].[WardMaster]([Id]);
GO

ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_WardMaster];
GO


CREATE TABLE [GSMS].[PropertySurveyVisit]
(
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyWorkflowDetailsId] INT NOT NULL,
    [InternalSurveyVerified] BIT NOT NULL CONSTRAINT [DF_PropertySurveyVisit_InternalSurveyVerified] DEFAULT (0),
    [RemarkId] INT NULL,
    [RemarkText] NVARCHAR(1000) NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_PropertySurveyVisit_IsActive] DEFAULT (1),
    [Latitude] DECIMAL(10,7) NULL,
    [Longitude] DECIMAL(10,7) NULL,
    [Location] NVARCHAR(500) NULL,
    [CreatedBy] INT NOT NULL,
    [CreatedDate] DATETIME2(0) NOT NULL CONSTRAINT [DF_PropertySurveyVisit_CreatedDate] DEFAULT GETDATE(),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME2(0) NULL,
    CONSTRAINT [PK_PropertySurveyVisit] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_PropertySurveyVisit_PropertyWorkflowDetails] FOREIGN KEY ([PropertyWorkflowDetailsId]) 
                REFERENCES [PTIS].[PropertyWorkflowDetails] ([Id])
);  
GO

ALTER TABLE [GSMS].[PropertySurveyVisit]  WITH CHECK ADD  CONSTRAINT [FK_PropertySurveyVisit_CommonRemarkDetails] FOREIGN KEY([RemarkId])
REFERENCES [GSMS].[CommonRemarkDetails] ([Id])
GO
 
 
CREATE TABLE [GSMS].[OldWardMaster]
(
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [OldZoneName] NVARCHAR(200) NOT NULL,
    [OldWardNo] VARCHAR(100) NOT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_OldWardMaster_IsActive] DEFAULT (1),
    [CreatedBy] INT NOT NULL,
    [CreatedDate] DATETIME2(0) NOT NULL CONSTRAINT [DF_OldWardMaster_CreatedDate] DEFAULT GETDATE(),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME2(0) NULL,
    CONSTRAINT [PK_OldWardMaster] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [UQ_OldWardMaster_OldZoneName_OldWardNo] UNIQUE ([OldZoneName], [OldWardNo])
);
GO
 
 ALTER TABLE [GSMS].[WardAllocation] WITH CHECK ADD CONSTRAINT [FK_WardAllocation_OldWardMaster_OldWardId]
     FOREIGN KEY ([OldWardId]) REFERENCES [GSMS].[OldWardMaster] ([Id]);
GO
ALTER TABLE [GSMS].[WardAllocation] CHECK CONSTRAINT [FK_WardAllocation_OldWardMaster_OldWardId];

GO
CREATE TABLE [GSMS].[MergeDetails]
(
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyMapDetailId] INT NOT NULL,
    [OwnerName] NVARCHAR(1000) NULL,
    [OwnerNameEnglish] VARCHAR(1000) NULL,
    [OccupierName] NVARCHAR(1000) NULL,
    [OccupierNameEnglish] VARCHAR(1000) NULL,
    [MobileNo] VARCHAR(13) NULL,
    [Address] NVARCHAR(500) NULL,
    [BuilderName] NVARCHAR(200) NULL,
    [BuilderNameEnglish] VARCHAR(200) NULL,
    [FlatOrShopNo] NVARCHAR(100) NULL,
    [FlatOrShopNoEnglish] VARCHAR(100) NULL,
    [FlatOrShopName] NVARCHAR(200) NULL,
    [FlatOrShopNameEnglish] VARCHAR(200) NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_MergeDetails_IsActive] DEFAULT (1),
    [CreatedBy] INT NOT NULL,
    [CreatedDate] DATETIME2(0) NOT NULL CONSTRAINT [DF_MergeDetails_CreatedDate] DEFAULT GETDATE(),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME2(0) NULL,
    CONSTRAINT [PK_MergeDetails] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_MergeDetails_PropertyMapDetail] FOREIGN KEY ([PropertyMapDetailId])
            REFERENCES [PTIS].[PropertyMapDetail] ([Id])
);
GO