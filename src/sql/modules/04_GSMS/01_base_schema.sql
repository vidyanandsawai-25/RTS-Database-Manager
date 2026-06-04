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