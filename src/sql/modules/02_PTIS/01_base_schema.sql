SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [PTIS].[ZoneMaster] ******/
CREATE TABLE [PTIS].[ZoneMaster](
	[ZoneId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ZoneNo] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SequenceNo] int null,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ZoneMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_ZoneMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_ZoneMaster] PRIMARY KEY CLUSTERED ([ZoneId] ASC),
	CONSTRAINT [UQ_ZoneMaster_ZoneNo] UNIQUE ([ZoneNo]),
	CONSTRAINT [UQ_ZoneMaster_Description] UNIQUE ([Description] ASC)
) ON [PRIMARY]

GO


/****** Object:  Table [PTIS].[WardMaster] ******/
CREATE TABLE [PTIS].[WardMaster](
	[WardId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardNo] [nvarchar](10) NOT NULL,
	[Description] [nvarchar] (100) NOT NULL,
	[ZoneId] Int NOT NULL,
	[SequenceNo] int null,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_WardMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_WardMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_WardMaster] PRIMARY KEY CLUSTERED ([WardId] ASC),
	CONSTRAINT [UQ_WardMaster_WardNo] UNIQUE ([WardNo] ASC),
	CONSTRAINT [UQ_WardMaster_Description] UNIQUE ([Description] ASC)
) ON [PRIMARY]

GO

ALTER TABLE [PTIS].[WardMaster]  WITH CHECK ADD  CONSTRAINT [FK_WardMaster_ZoneMaster]
FOREIGN KEY([ZoneId]) REFERENCES [PTIS].[ZoneMaster] ([ZoneId])
GO
ALTER TABLE [PTIS].[WardMaster] CHECK CONSTRAINT [FK_WardMaster_ZoneMaster]
GO	


/****** Object:  Table [PTIS].[OwnerTypeMaster]******/

CREATE TABLE [PTIS].[OwnerTypeMaster](
	[OwnerTypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerType] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_OwnerTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_OwnerTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OwnerTypeMaster] PRIMARY KEY CLUSTERED ([OwnerTypeId] ASC),
 CONSTRAINT [UQ_OwnerTypeMaster_OwnerType] UNIQUE ([OwnerType])
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[PropertyTypeCategoryMaster]******/

CREATE TABLE [PTIS].[PropertyTypeCategoryMaster](
	[PropertyTypeCategoryId] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeCategory] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTypeCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeCategoryMaster] PRIMARY KEY CLUSTERED ([PropertyTypeCategoryId] ASC),
 CONSTRAINT [UQ_PropertyTypeCategoryMaster_PropertyTypeCategory] UNIQUE ([PropertyTypeCategory] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[PropertyTypeMaster]******/

CREATE TABLE [PTIS].[PropertyTypeMaster](
	[PropertyTypeId] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyDescription] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[PropertyTypeGroup] [nvarchar](50) NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[PropertyTypeCategoryId] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeMaster] PRIMARY KEY CLUSTERED ([PropertyTypeId] ASC),
 CONSTRAINT [UQ_PropertyTypeMaster_PropertyDescription] UNIQUE ([PropertyDescription] ASC)
)

GO
ALTER TABLE [PTIS].[PropertyTypeMaster] WITH CHECK ADD CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster]
FOREIGN KEY ([PropertyTypeCategoryId]) REFERENCES [PTIS].[PropertyTypeCategoryMaster]([PropertyTypeCategoryId]);
GO
ALTER TABLE [PTIS].[PropertyTypeMaster] CHECK CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster];
GO




/****** Object:  Table [PTIS].[CategoryMaster]******/

CREATE TABLE [PTIS].[CategoryMaster](
	[CategoryId] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryCode] [nvarchar](50) NOT NULL,
	[SubCategoryCode] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_CategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED ([CategoryId] ASC),
	CONSTRAINT [UQ_CategoryMaster_CategoryCode] UNIQUE ([CategoryCode],[SubCategoryCode])
)

GO

-- /****** Object:  Table [PTIS].[SubCategory]******/
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE TABLE [PTIS].[SubCategory](
-- 	[SubCategory] [nvarchar] (30) NOT NULL,
-- 	[SubCategoryType] [nvarchar](50) NOT NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubCategory_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubCategory_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED ([SubCategory] ASC)

-- ) 


/****** Object:  Table [PTIS].[SocietyDetailsMast] ******/
CREATE TABLE [PTIS].[SocietyDetailsMast](
	[SocietyDetailId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WingName] [nvarchar](30) NULL,
	[WingId] [int] NULL,
	[BHKType] [nvarchar](20) NULL,
	[SecretoryName] [nvarchar](200) NULL,
	[SocietyName] [nvarchar](500) NULL,
	[ManagerName] [nvarchar](200) NULL,
	[SecretoryNameEnglish] [nvarchar](200) NULL,
	[SocietyNameEnglish] [nvarchar](500) NULL,
	[ManagerNameEnglish] [nvarchar](200) NULL,
	[ManagerMobileNo] [varchar](13) NULL,
	[SecretaryMobileNo] [varchar](13) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_SocietyDetailsMaster_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SocietyDetailsMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SocietyDetailsMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SocietyDetailsMaster] PRIMARY KEY CLUSTERED ([SocietyDetailId] ASC),
) ON [PRIMARY]
GO



CREATE UNIQUE INDEX [UQ_SocietyDetailsMaster_WingName]
ON [PTIS].[SocietyDetailsMast] ([WingName])
WHERE [WingName] IS NOT NULL;
GO



/****** Object:  Table [PTIS].[TaxZoneMaster]******/

CREATE TABLE [PTIS].[TaxZoneMaster](
	[TaxZoneId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxZoneNo] [nvarchar](10) NOT NULL,
	[TaxZoneType] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxZoneMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxZoneMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxZoneMaster] PRIMARY KEY CLUSTERED ([TaxZoneId] ASC),
 CONSTRAINT [UQ_TaxZoneMaster_TaxZoneNo] UNIQUE ([TaxZoneNo] ASC)
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[PropertyMast]******/
CREATE TABLE [PTIS].[PropertyMast](
	[PropertyId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxZoneId] int NOT NULL,
	[WardId] int NOT NULL,
	[PropertyNo] [nvarchar](10) NULL,
	[PartitionNo] [nvarchar](10) NULL,
	[PropertyTypeId] [int] NULL,
	[UPICId] [nvarchar](30) NULL,
	[OpenPlot] [bit] NULL,
	[CSN] [nvarchar](30) NULL,
	[SubZoneNo] [nvarchar](20) NULL,
	[PlotNo] [nvarchar](20) NULL,
	[CategoryId] [int] NULL,
	[Type] [varchar](5) NULL,
	[PartType] [nvarchar](20) NULL,
	[OwnerTitle] [nvarchar](20) NULL,
	[OwnerName] [nvarchar](1000) NULL,
	[OccupierTitle] [nvarchar](20) NULL,
	[OccupierName] [nvarchar](1000) NULL,
	[FlatOrShopNo] [nvarchar](100) NULL,
	[FlatOrShopName] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Location] [nvarchar](200) NULL,
	[MobileNo] [varchar](13) NULL,
	[EmailId] [nvarchar](100) NULL,
	[SocietyDetailId] [int] NULL,
	[OwnerTitleEnglish] [nvarchar](20) NULL,
	[OwnerNameEnglish] [nvarchar](1000) NULL,
	[OccupierTitleEnglish] [nvarchar](20) NULL,
	[OccupierNameEnglish] [nvarchar](1000) NULL,
	[FlatOrShopNoEnglish] [nvarchar](100) NULL,
	[FlatOrShopNameEnglish] [nvarchar](200) NULL,
	[AddressEnglish] [nvarchar](500) NULL,
	[LocationEnglish] [nvarchar](200) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyMast_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_PropertyMast] PRIMARY KEY CLUSTERED ([PropertyId] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyMast] WITH CHECK ADD CONSTRAINT [FK_PropertyMast_PropertyTypeMaster]
FOREIGN KEY([PropertyTypeId]) REFERENCES [PTIS].[PropertyTypeMaster]([PropertyTypeId]);
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_PropertyTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyMast] WITH CHECK ADD CONSTRAINT [FK_PropertyMast_TaxZoneMaster_TaxZoneId]
FOREIGN KEY([TaxZoneId]) REFERENCES [PTIS].[TaxZoneMaster]([TaxZoneId]);
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_TaxZoneMaster_TaxZoneId];
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_CategoryMaster] FOREIGN KEY([CategoryId])
REFERENCES [PTIS].[CategoryMaster] ([CategoryId])
GO	
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_CategoryMaster]
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_WardMaster] FOREIGN KEY([WardId])
REFERENCES [PTIS].[WardMaster] ([WardId])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_WardMaster]
GO


ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_SocietyDetailsMast] FOREIGN KEY([SocietyDetailId])
REFERENCES [PTIS].[SocietyDetailsMast] ([SocietyDetailId])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_SocietyDetailsMast]
GO



CREATE UNIQUE NONCLUSTERED INDEX [UX_PropertyMast_UPICID_NotNull]
ON [PTIS].[PropertyMast]([UPICId] ASC)
WHERE [UPICId] IS NOT NULL;

GO
CREATE NONCLUSTERED INDEX [Ind_Category] 
ON [PTIS].[PropertyMast]
(
    [WardId] ASC,
    [PropertyNo] ASC,
    [PartitionNo] ASC
)
INCLUDE ([CategoryId])
GO

/****** Object:  Table [PTIS].[FloorMaster]******/

CREATE TABLE [PTIS].[FloorMaster](
	[FloorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorCode] nvarchar(5) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SequenceNo] [int] NULL,
	[MaxFloorNo] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_FloorMaster] PRIMARY KEY CLUSTERED ([FloorId] ASC),
  CONSTRAINT [UQ_FloorMaster_Code] UNIQUE ([FloorCode]),
  CONSTRAINT [UQ_FloorMaster_Description] UNIQUE ([Description])
);

GO

/****** Object:  Table [PTIS].[ConstructionTypeMaster]******/

CREATE TABLE [PTIS].[ConstructionTypeMaster](
	[ConstructionTypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionCode] [varchar](7) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConstructionTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConstructionTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConstructionTypeMaster] PRIMARY KEY CLUSTERED ([ConstructionTypeId] ASC),
 CONSTRAINT [UQ_ConstructionTypeMaster_ConstructionCode] UNIQUE ([ConstructionCode]),
 CONSTRAINT [UQ_ConstructionTypeMaster_Description] UNIQUE ([Description])
  );
GO



/****** Object:  Table [PTIS].[TypeOfUseGroupMaster]******/

CREATE TABLE [PTIS].[TypeOfUseGroupMaster](
	[TypeOfUseGroupId]  [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseGroupCode]  [varchar](10) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
    [GroupIcon] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseGroupMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_TypeOfUseGroupMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_TypeOfUseGroupMaster] PRIMARY KEY CLUSTERED ([TypeOfUseGroupId] ASC),
	CONSTRAINT [UQ_TypeOfUseGroupMaster_TypeOfUseGroupCode] UNIQUE ([TypeOfUseGroupCode]),
    CONSTRAINT [UQ_TypeOfUseGroupMaster] UNIQUE ([GroupName])
  )

GO


/****** Object:  Table [PTIS].[TypeOfUseMaster]******/

CREATE TABLE [PTIS].[TypeOfUseMaster](
	[TypeOfUseId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseCode] [varchar](10) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[TypeOfUseGroupId] int NOT NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TypeOfUseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TypeOfUseMaster] PRIMARY KEY CLUSTERED ([TypeOfUseId] ASC),
 CONSTRAINT [UQ_TypeOfUseMaster_TypeOfUseCode] UNIQUE ([TypeOfUseCode]),
 CONSTRAINT [UQ_TypeOfUseMaster_Description] UNIQUE ([Description])
)
GO
alter table [PTIS].[TypeOfUseMaster]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster] FOREIGN KEY([TypeOfUseGroupId])	
REFERENCES [PTIS].[TypeOfUseGroupMaster] ([TypeOfUseGroupId])
GO
ALTER TABLE [PTIS].[TypeOfUseMaster] CHECK CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster]
GO



/****** Object:  Table [PTIS].[SubTypeOfUseMaster]******/

CREATE TABLE [PTIS].[SubTypeOfUseMaster](
	[SubTypeOfUseId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [nvarchar](80) NULL,
	[TypeOfUseId] [int] NOT NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubTypeOfUseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubTypeOfUseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_SubTypeOfUseMaster]  PRIMARY KEY CLUSTERED ([SubTypeOfUseId] ASC),
CONSTRAINT [FK_SubTypeOfUseMaster_TypeOfUseMaster]  FOREIGN KEY ([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]),
CONSTRAINT [UQ_SubTypeOfUseMaster_Type_Desc]  UNIQUE ([Description])
)

GO


/****** Object:  Table [PTIS].[RateSectionMaster]******/

CREATE TABLE [PTIS].[RateSectionMaster](
	[RateSectionId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RateSectionNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateSectionMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_RateSectionMaster] PRIMARY KEY CLUSTERED ([RateSectionId] ASC),
	CONSTRAINT [UQ_RateSectionMaster_RateSectionCode] UNIQUE ([RateSectionNo]),
	CONSTRAINT [UQ_RateSectionMaster_Description] UNIQUE ([Description])
)
GO




/****** Object:  Table [PTIS].[SubZoneDetailsForCV]******/
CREATE TABLE [PTIS].[SubZoneDetailsForCV](
	[SubZoneId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MoujaName] [nvarchar](300) NULL,
	[SubZoneNo] [nvarchar](20) NULL,
	[SubZoneName] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubZoneDetailsForCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubZoneDetailsForCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_SubZoneDetailsForCV] PRIMARY KEY CLUSTERED  ([SubZoneId] ASC)
)
GO


/****** Object:  Table [PTIS].[SubFloorMaster]******/

CREATE TABLE [PTIS].[SubFloorMaster](
	[SubFloorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubFloorCode] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[SubFloorPercentage] [money] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubFloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubFloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_SubFloorMaster] PRIMARY KEY CLUSTERED ([SubFloorId] ASC),
  CONSTRAINT [UQ_SubFloorMaster_SubFloorCode] UNIQUE ([SubFloorCode]),
  CONSTRAINT [UQ_SubFloorMaster_Description] UNIQUE ([Description])
)
GO

-- /****** Object:  Table [PTIS].[YearMaster]******/

-- CREATE TABLE [PTIS].[YearMaster](
-- 	[Year] int NOT NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_YearMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_YearMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_YearMaster] PRIMARY KEY CLUSTERED ([Year] ASC)
-- )

-- GO

/****** Object:  Table [PTIS].[PropertyDetails]******/

CREATE TABLE [PTIS].[PropertyDetails](
	[PropertyDetailsId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[FloorId] [int] NOT  NULL,
	[SubFloorId] [int]  NULL,
	[ConstructionYear] [varchar](4) NULL,
	[AssessmentYear] [nvarchar](4) NULL,
	[ConstructionTypeId] [int] NOT  NULL,
	[TypeOfUseId] [int] NOT  NULL,
	[CarpetAreaSqMeter] [float] NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[BuiltupAreaSqMeter] [float] NULL,
	[BuiltupAreaSqFeet] [float] NULL,
	[NoOfRooms] [int] NULL,
	[RenterYesNO] [bit] NULL,
	[RentMonthly] [float] NULL,
	[RentYearly] [float] NULL,
	[NonCalculateRentMonthly] [float] NULL,
	[RenterNameEnglish] [nvarchar](500) NULL,
	[RenterName] [nvarchar](500) NULL,
	[AgreementFromDate] [datetime] NULL,
	[AgreementDate] [datetime] NULL,
	[AgreementToDate] [datetime] NULL,
	[SubTypeOfUseId] [int] NULL,
	[TaxLiability] [nvarchar](20) NULL,
	[IsTaxable] [bit] NULL,
	[OccupancyDate] [datetime] NULL,
	[OccupancyApplyOrNot] [bit] NULL,
	[OccupancyNumber] [varchar](30) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED ([PropertyDetailsId] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_PropertyMast] 
FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast]([PropertyId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_SubFloorMaster] 
FOREIGN KEY([SubFloorId]) REFERENCES [PTIS].[SubFloorMaster]([SubFloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster] 
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionTypeId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_FloorMaster] 
FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([FloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_FloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_TypeOfUseMaster] 
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_SubTypeOfUseMaster]
FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([SubTypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_SubTypeOfUseMaster];
GO



/****** Object:  Table [PTIS].[PropertyDetailsReassessment]******/
CREATE TABLE [PTIS].[PropertyDetailsReassessment](
	[PropertyDetailsReassessmentId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[FloorId] [int] NOT  NULL,
	[SubFloorId] [int]  NULL,
	[ConstructionYear] [varchar](4) NULL,
	[AssessmentYear] [nvarchar](4) NULL,
	[ConstructionTypeId] [int] NOT  NULL,
	[TypeOfUseId] [int] NOT  NULL,
	[CarpetAreaSqMeter] [float] NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[BuiltupAreaSqMeter] [float] NULL,
	[BuiltupAreaSqFeet] [float] NULL,
	[NoOfRooms] [int] NULL,
	[RenterYesNO] [bit] NULL,
	[RentMonthly] [float] NULL,
	[NonCalculateRentMonthly] [float] NULL,
	[RenterNameEnglish] [nvarchar](500) NULL,
	[RenterName] [nvarchar](500) NULL,
	[AgreementFromDate] [datetime] NULL,
	[AgreementDate] [datetime] NULL,
	[AgreementToDate] [datetime] NULL,
	[SubTypeOfUseId] [int] NULL,
	[TaxLiability] [nvarchar](20) NULL,
	[IsTaxable] [bit] NULL,
	[OccupancyDate] [datetime] NULL,
	[OccupancyApplyOrNot] [bit] NULL,
	[OccupancyNumber] [varchar](30) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsReassessment_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsReassessment_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetailsReassessment_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyDetailsReassessment] PRIMARY KEY CLUSTERED ([PropertyDetailsReassessmentId] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_PropertyMast] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast]([PropertyId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_SubFloorMaster] FOREIGN KEY([SubFloorId]) REFERENCES [PTIS].[SubFloorMaster]([SubFloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_ConstructionTypeMaster] FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionTypeId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_FloorMaster] FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([FloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_FloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_TypeOfUseMaster] FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_SubTypeOfUseMaster] FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([SubTypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_SubTypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[ActiveTaxesMaster]******/

CREATE TABLE [PTIS].[ActiveTaxesMaster](
	[ActiveTaxesId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxName] [nvarchar](200) NOT NULL,
	[TaxNameAlias] [nvarchar](200) NULL,
	[DisplayOrder] [int] NULL,
	[TaxOnUnit] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_TaxOnUnit] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ActiveTaxesMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_ActiveTaxesMaster] PRIMARY KEY CLUSTERED ([ActiveTaxesId] ASC)
)
GO

ALTER TABLE [PTIS].[ActiveTaxesMaster]
ADD CONSTRAINT UQ_ActiveTaxesMaster_TaxName UNIQUE (TaxName);
GO

/****** Object:  Table [PTIS].[AgeFactorCVMaster]******/

CREATE TABLE [PTIS].[AgeFactorCVMaster](
	[AgeFactorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] int NOT NULL,
	[AgeFrom] [int] NOT NULL,
	[AgeTo] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[YearId] [int] NOT NULL,
	[Code] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AgeFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AgeFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_AgeFactorCVMaster] PRIMARY KEY CLUSTERED ([AgeFactorId] ASC),
CONSTRAINT [UQ_AgeFactorCVMaster] UNIQUE ([ConstructionTypeId], [AgeFrom], [AgeTo], [YearId])
	)
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster] FOREIGN KEY([ConstructionTypeId])
REFERENCES [PTIS].[ConstructionTypeMaster] ([ConstructionTypeId])
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster] CHECK CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster]
GO
ALTER TABLE [PTIS].[AgeFactorCVMaster] ADD CONSTRAINT FK_AgeFactorCVMaster_YearMaster FOREIGN KEY (YearId) REFERENCES [CORE].[YearMaster](YearId);
GO
ALTER TABLE [PTIS].[AgeFactorCVMaster] CHECK CONSTRAINT [FK_AgeFactorCVMaster_YearMaster]
GO


/****** Object:  Table [PTIS].[PolicyTaxDetails] ******/

CREATE TABLE [PTIS].[PolicyTaxDetails]
(
    [PolicyTaxId]                int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId]            int NOT NULL,
												-- Policy order/precedence: NETTAX (1) < APPEAL (2) < HEARING  (3) < COMMITTEE (4) < REMISSION (5)
    [PolicyCode]         varchar(20) NOT NULL,   -- 'NETTAX','APPEAL','HEARING','COMMITTEE','REMISSION'
	[PolicyDate]         datetime NULL,
    [PolicyYear]         smallint NULL,
    [PolicyReason]       nvarchar(200) NULL,
    [PolicyRVorCVvalue]  money NULL,
    [GeneralTax]         money NULL,
    [TreeCess]           money NULL,
    [StateEducationTax]  money NULL,
    [StateEmploymentTax] money NULL,
    [SpEducationTax]     money NULL,
    [SanitationCess]     money NULL,
    [DrainCess]          money NULL,
    [SpWaterCess]        money NULL,
    [RoadCess]           money NULL,
    [FireCess]           money NULL,
    [LightCess]          money NULL,
    [WaterBenefitCess]   money NULL,
    [BigBuilding]        money NULL,
    [SewageDisposalCess] money NULL,
    [WaterBill]          money NULL,
    [IllegalConstPenalty] money NULL,
    [UserCharges]        money NULL,
    [ServiceTax]         money NULL,
    [Tax1]               money NULL,
    [Tax2]               money NULL,
    [Tax3]               money NULL,
    [Tax4]               money NULL,
    [Tax5]               money NULL,
    [Tax6]               money NULL,
    [Tax7]               money NULL,
    [Tax8]               money NULL,
    [Tax9]               money NULL,
    [Tax10]              money NULL,
    [TaxTotal]       	 money NULL,
	[MarkedForDeletion]  bit NOT NULL CONSTRAINT [DF_PolicyTaxDetails_MarkedForDeletion] DEFAULT (0),
    [IsActive]           bit NOT NULL CONSTRAINT [DF_PolicyTaxDetails_IsActive] DEFAULT (1),
    [CreatedBy]          int NULL,
    [CreatedDate]        datetime NOT NULL CONSTRAINT [DF_PolicyTaxDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy]          int NULL,
    [UpdatedDate]        datetime NULL,

    CONSTRAINT [PK_PolicyTaxDetails] PRIMARY KEY CLUSTERED ([PolicyTaxId] ASC),

    CONSTRAINT [FK_PolicyTaxDetails_PropertyMast_PropertyId]
        FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([PropertyId]),

    CONSTRAINT [CK_PolicyTaxDetails_PolicyCode]
        CHECK ([PolicyCode] IN ('NETTAX','APPEAL','HEARING','COMMITTEE','REMISSION'))
);
GO

CREATE UNIQUE INDEX [UX_PolicyTaxDetails_Owner_Year_PolicyCode]
ON [PTIS].[PolicyTaxDetails]([PropertyId], [PolicyYear], [PolicyCode])
WHERE [IsActive] = 1 AND [MarkedForDeletion] = 0;
GO

CREATE INDEX [IX_PolicyTaxDetails_PropertyId]
ON [PTIS].[PolicyTaxDetails]([PropertyId]);
GO



/****** Object:  Table [PTIS].[ApplyTaxesMaster]******/

CREATE TABLE [PTIS].[ApplyTaxesMaster](
	[ApplyTaxesId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[GeneralTax] [bit] NOT NULL,
	[StateEducationTax] [bit] NOT NULL,
	[StateEmploymentTax] [bit] NOT NULL,
	[TreeCess] [bit] NOT NULL,
	[SpWaterCess] [bit] NOT NULL,
	[RoadCess] [bit] NOT NULL,
	[FireCess] [bit] NOT NULL,
	[LightCess] [bit] NOT NULL,
	[WaterBenefitCess] [bit] NOT NULL,
	[SewageDisposalCess] [bit] NOT NULL,
	[SpEducationTax] [bit] NOT NULL,
	[SanitationCess] [bit] NOT NULL,
	[DrainCess] [bit] NOT NULL,
	[WaterBill] [bit] NOT NULL,
	[BigBuilding] [bit] NOT NULL,
	[IllegalConstPenalty] [bit] NOT NULL,
	[UserCharges] [bit] NOT NULL,
	[ServiceTax] [bit] NOT NULL,
	[Tax1] [bit] NOT NULL,
	[Tax2] [bit] NOT NULL,
	[Tax3] [bit] NOT NULL,
	[Tax4] [bit] NOT NULL,
	[Tax5] [bit] NOT NULL,
	[Tax6] [bit] NOT NULL,
	[Tax7] [bit] NOT NULL,
	[Tax8] [bit] NOT NULL,
	[Tax9] [bit] NOT NULL,
	[Tax10] [bit] NOT NULL,
	[OldPenalty] [bit] NOT NULL,
	[IsTaxForPlot] [bit] NULL,
	[IsPolicyApplicable] [bit] NULL,
	[InAppComm] [bit] NULL,
	[InHearing] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ApplyTaxesMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_ApplyTaxesMaster] PRIMARY KEY CLUSTERED ([ApplyTaxesId] ASC)
)

GO

ALTER TABLE [PTIS].[ApplyTaxesMaster] ADD  CONSTRAINT [DF_ApplyTaxesMaster_IsTaxForPlot]  DEFAULT ((0)) FOR [IsTaxForPlot]
GO

ALTER TABLE [PTIS].[ApplyTaxesMaster] ADD  CONSTRAINT [DF_ApplyTaxesMaster_IsPolicyApplicable]  DEFAULT ((0)) FOR [IsPolicyApplicable]
GO


ALTER TABLE [PTIS].[ApplyTaxesMaster]  WITH CHECK ADD  CONSTRAINT [FK_ApplyTaxesMaster_PropertyMast_PropertyId] 
FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([PropertyId])	
GO
ALTER TABLE [PTIS].[ApplyTaxesMaster] CHECK CONSTRAINT [FK_ApplyTaxesMaster_PropertyMast_PropertyId]
GO



-- /****** Object:  Table [PTIS].[ApplyTaxesMasterPrime]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[ApplyTaxesMasterPrime](
-- 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[TypeOfUseId] [varchar](10) NULL,
-- 	[Type] [varchar](5) NULL,
-- 	[GeneralTax] [bit] NOT NULL,
-- 	[StateEducationTax] [bit] NOT NULL,
-- 	[StateEmploymentTax] [bit] NOT NULL,
-- 	[TreeCess] [bit] NOT NULL,
-- 	[SpWaterCess] [bit] NOT NULL,
-- 	[RoadCess] [bit] NOT NULL,
-- 	[FireCess] [bit] NOT NULL,
-- 	[LightCess] [bit] NOT NULL,
-- 	[WaterBenefitCess] [bit] NOT NULL,
-- 	[SewageDisposalCess] [bit] NOT NULL,
-- 	[SpEducationTax] [bit] NOT NULL,
-- 	[SanitationCess] [bit] NOT NULL,
-- 	[DrainCess] [bit] NOT NULL,
-- 	[WaterBill] [bit] NOT NULL,
-- 	[BigBuilding] [bit] NOT NULL,
-- 	[IllegalConstPenalty] [bit] NOT NULL,
-- 	[UserCharges] [bit] NOT NULL,
-- 	[ServiceTax] [bit] NOT NULL,
-- 	[Tax1] [bit] NOT NULL,
-- 	[Tax2] [bit] NOT NULL,
-- 	[Tax3] [bit] NOT NULL,
-- 	[Tax4] [bit] NOT NULL,
-- 	[Tax5] [bit] NOT NULL,
-- 	[Tax6] [bit] NOT NULL,
-- 	[Tax7] [bit] NOT NULL,
-- 	[Tax8] [bit] NOT NULL,
-- 	[Tax9] [bit] NOT NULL,
-- 	[Tax10] [bit] NOT NULL,
-- 	[OldPenalty] [bit] NOT NULL,
-- 	[Interest] [bit] NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMasterPrime_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ApplyTaxesMasterPrime_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_ApplyTaxesMasterPrime] PRIMARY KEY CLUSTERED ([Id] ASC)
-- ) ON [PRIMARY]
-- GO

-- ALTER TABLE [PTIS].[ApplyTaxesMasterPrime] WITH CHECK ADD CONSTRAINT [FK_ApplyTaxesMasterPrime_TypeOfUseMaster]
-- FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
-- GO

-- ALTER TABLE [PTIS].[ApplyTaxesMasterPrime] CHECK CONSTRAINT [FK_ApplyTaxesMasterPrime_TypeOfUseMaster];
-- GO

-- /****** Object:  Table [PTIS].[AssessmentMaster]******/

/****** Object:  Table [PTIS].[AssessmentMaster] ******/
CREATE TABLE [PTIS].[AssessmentMaster](
	[AssessmentId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NULL,
	[ToYear] [int] NULL,
	[MaxYear] [int] NULL,
	[MinRV] [money] NULL,
	[NPAddress] [nvarchar](250) NULL,
	[ThirdPartyName] [nvarchar](150) NULL,
	[ThirdPartyAddress] [nvarchar](250) NULL,
	[ThirdPartyContact] [nvarchar](12) NULL,
	[ThirdPartyWebSite] [nvarchar](100) NULL,
	[ThirdPartyEmail] [nvarchar](100) NULL,
	[NPRemark] [nvarchar](250) NULL,
	[ThirdPartyRemark] [nvarchar](250) NULL,
	[SrNo] [smallint] NULL,
	[NPIcon] [varbinary](max) NULL,
	[ThirdPartyIcon] [varbinary](max) NULL,
	[NPImage] [varbinary](max) NULL,
	[ThirdPartyImage] [varbinary](max) NULL,
	[NPcon] [varchar](50) NULL,
	[NPContactNo] [nvarchar](15) NULL,
	[NPEmail] [nvarchar](100) NULL,
	[NPWebsite] [nvarchar](100) NULL,
	[ThirdPartyCopyRight] [nvarchar](250) NULL,
	[CouncilId] [int] NULL,
	[NPTitle] [nvarchar](250) NULL,
	[NPAddressInLocal] [nvarchar](300) NULL,
	[PartyNameInLocal] [nvarchar](250) NULL,
	[PartyAddressInLocal] [nvarchar](300) NULL,
	[NPPrefix] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AssessmentMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AssessmentMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AssessmentMaster] PRIMARY KEY CLUSTERED ([AssessmentId] ASC)
) ON [PRIMARY] 
GO


/****** Object:  Table [PTIS].[BillBookMaster]******/

CREATE TABLE [PTIS].[BillBookMaster](
	[BillBookId] [int]  IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
	[BillBookNo] [nvarchar](50) NULL,
	[ReceiptNoFrom] [int] NULL,
	[ReceiptNoTo] [int] NULL,
	[Date] [datetime] NULL,
	[Remark] [nvarchar](20) NULL,
	[BookDescription] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[EmpId] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BillBookMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BillBookMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BillBookMaster] PRIMARY KEY CLUSTERED ([BillBookId] ASC)
) ON [PRIMARY]
GO
ALTER TABLE PTIS.BillBookMaster ADD CONSTRAINT UQ_BillBookMaster_EmpName_Year UNIQUE (EmpName, Year);
GO
/****** Object:  Table [PTIS].[BillTransactionDetails]******/
CREATE TABLE [PTIS].[BillTransactionDetails](
	[BilltransactionId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[BillbookNo] [nvarchar](50) NULL,
	[InvoiceNo] [int] NULL,
	[BillNo] [nvarchar](50) NULL,
	[BillDate] [date] NULL,
	[TransactionDate] [datetime] NULL,
	[YearId] [int] NULL,
	[PendingYear] [int] NULL,
	[PaymentMode] [nvarchar](10) NULL,
	[PaymentType] [nvarchar](10) NULL,
	[PaymentResource] [nvarchar](10) NULL,
	[GeneralTax] [money] NULL,
	[StateEducationTax] [money] NULL,
	[StateEmploymentTax] [money] NULL,
	[TreeCess] [money] NULL,
	[SpWaterCess] [money] NULL,
	[RoadCess] [money] NULL,
	[FireCess] [money] NULL,
	[LightCess] [money] NULL,
	[WaterBenefitCess] [money] NULL,
	[SewageDisposalCess] [money] NULL,
	[SpEducationTax] [money] NULL,
	[SanitationCess] [money] NULL,
	[DrainCess] [money] NULL,
	[WaterBill] [money] NULL,
	[BigBuilding] [money] NULL,
	[IllegalConstPenalty] [money] NULL,
	[UserCharges] [money] NULL,
	[ServiceTax] [money] NULL,
	[Tax1] [money] NULL,
	[Tax2] [money] NULL,
	[Tax3] [money] NULL,
	[Tax4] [money] NULL,
	[Tax5] [money] NULL,
	[Tax6] [money] NULL,
	[Tax7] [money] NULL,
	[Tax8] [money] NULL,
	[Tax9] [money] NULL,
	[Tax10] [money] NULL,
	[TaxTotal] [money] NULL,
	[OldPenalty] [money] NULL,
	[Penalty] [money] NULL,
	[GeneralTaxPenalty] [money] NULL,
	[StateEducationTaxPenalty] [money] NULL,
	[StateEmploymentTaxPenalty] [money] NULL,
	[BigBuildingPenalty] [money] NULL,
	[Discount] [money] NULL,
	[NetTotal] [money] NULL,
	[AdvanceAmount] [money] NULL,
	[OtherFeeAmount] [money] NULL,
	[Amount] [money] NULL,
	[IsAdvanceDeduction] bit NULL,
	[AdvanceRemark] [nvarchar](20) NULL,
	[EmailId] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](13) NULL,
	[LastDate] [datetime] NULL,
	[MerchantTxnRefNumber] [nvarchar](50) NULL,
	[SocietyPaymentId] [nvarchar](20) NULL,
	[BehalfPayerName] [nvarchar](200) NULL,
	[DebitRefId] [nvarchar](20) NULL,
	[ClearingDate] [datetime] NULL,
	[ChequeStatus] [varchar](20) NULL,
	[DDChequeDate] [date] NULL,
	[DDChequeNo] [nvarchar](20) NULL,
	[ExpiryDate] [date] NULL,
	[EmpId] [int] NULL,
	[UserId] [int] NULL,
	[CFCId] [int] NULL,
	[CashierUserId] [int] NULL,
	[TaxPayerName] [nvarchar](1000) NULL,
	[OccupierName] [nvarchar](1000) NULL,
	[FromYear] [int] NULL,
	[ToYear] [int] NULL,
	[IsPayFromSMSurl] [bit] NULL,
	[GlobalReceiptNo] [nvarchar](50) NULL,
	[CounterReceiptNo] [nvarchar](500) NULL,
	[GlobalId] [int] NULL,
	[StampCount] [int] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BillTransactionDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__BillTransactionDetails] PRIMARY KEY CLUSTERED ([BilltransactionId] ASC)

) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [StateEducationTax]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [TaxTotal]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [Penalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [GeneralTaxPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [StateEducationTaxPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [StateEmploymentTaxPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  DEFAULT ((0)) FOR [BigBuildingPenalty]
GO

ALTER TABLE [PTIS].[BillTransactionDetails] ADD  CONSTRAINT [DF_BillTransactionDetails_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[BillTransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[BillTransactionDetails] CHECK CONSTRAINT [FK_BillTransactionDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[BillTransactionDiscountDetails] ******/
CREATE TABLE [PTIS].[BillTransactionDiscountDetails](
	[BilltransactionDiscountId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BilltransactionId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[OnlineDiscountAmount] [money] NULL,
	[OnlineDiscountPercentage] [int] NULL,
	[FamilyPlanningDiscountAmount] [money] NULL,
	[FamilyPlanningDiscountPercentage] [int] NULL,
	[WomenOwnerDiscountAmount] [money] NULL,
	[WomenDiscountPercentage] [int] NULL,
	[NewPropertyDiscAmount] [money] NULL,
	[NewPropertyDiscPercentage] [int] NULL,
	[OnlineCompostingDiscount] [money] NULL,
	[OnlineCompostingDiscountPercentage] [int] NULL,
	[OnlineCompostingPlusSTPDiscount] [money] NULL,
	[OnlineCompostingPlusSTPDiscountPercentage] [int] NULL,
	[RainWaterHarvestingDiscountAmount] [money] NULL,
	[RainWaterHarvestingDiscountPercentage] [int] NULL,
	[SEGeneratorDiscount] [money] NULL,
	[SEGeneratorDiscountPer] [int] NULL,
	[SelfAssessmentDiscount] [money] NULL,
	[SelfAssessmentDiscountPercentage] [int] NULL,
	[SolarEnergyDiscountAmount] [money] NULL,
	[SolarEnergyDiscountPercentage] [int] NULL,
	[STPDiscount] [money] NULL,
	[STPDiscountPercentage] [int] NULL,
	[SWHeaterDiscount] [money] NULL,
	[SWHeaterDiscountPer] [int] NULL,
	[TreeSavardhanDiscount] [money] NULL,
	[TreeSavardhanDiscountPercentage] [int] NULL,
	[UnMarriedMartyredSoldierDiscount] [money] NULL,
	[UnMarriedMartyredSoldierDiscountPercentage] [int] NULL,
	[VermiCompDiscount] [money] NULL,
	[VermiCompDiscountPercentage] [int] NULL,
	[ZeroWestDiscount] [money] NULL,
	[ZeroWestDiscountPercentage] [int] NULL,
	[ZeroWestPlusRainWaterDiscount] [money] NULL,
	[ZeroWestPlusRainWaterDiscountPercentage] [int] NULL,
	[ZeroWestPlusRainWaterPlusSolarEnergyDiscountAmount] [money] NULL,
	[ZeroWestPlusRainWaterPlusSolarEnergyDiscountPercentage] [int] NULL,
	[ZeroWestPlusSolarEnergyDiscountAmount] [money] NULL,
	[ZeroWestPlusSolarEnergyDiscountPercentage] [int] NULL,
	[ZeroWestPlusSTPDiscount] [money] NULL,
	[ZeroWestPlusSTPDiscountPercentage] [int] NULL,
	[FreedomFighterDiscount] [money] NULL,
	[FreedomFighterDiscountPercentage] [int] NULL,
	[FullPaidDiscount] [money] NULL,
	[FullPaidDiscountPercentage] [int] NULL,
	[GallantrySoldierDiscount] [money] NULL,
	[GallantrySoldierDiscountPercentage] [int] NULL,
	[GarbageDisposalDiscountAmount] [money] NULL,
	[GarbageDisposalDiscountPercentage] [int] NULL,
	[GarbageSegregationDiscountAmount] [money] NULL,
	[GarbageSegregationDiscountPercentage] [int] NULL,
	[RunTimePenaltyDiscount] [money] NULL,
	[OldPenaltyDiscount] [money] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDiscountDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDiscountDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BillTransactionDiscountDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED ([BilltransactionDiscountId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDiscountDetails_BillTransactionDetails] FOREIGN KEY([BilltransactionId])
REFERENCES [PTIS].[BillTransactionDetails] ([BilltransactionId])
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails] CHECK CONSTRAINT [FK_BillTransactionDiscountDetails_BillTransactionDetails]
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDiscountDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails] CHECK CONSTRAINT [FK_BillTransactionDiscountDetails_PropertyMast]
GO


 
-- /****** Object:  Table [PTIS].[CitySurveyNoMaster]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[CitySurveyNoMaster](
-- 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[SubZoneID] [int] NULL,
-- 	[CSN] [nvarchar](4000) NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CitySurveyNoMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_CitySurveyNoMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_CitySurveyNoMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
-- )
-- GO

-- ALTER TABLE [PTIS].[CitySurveyNoMaster]  WITH CHECK ADD  CONSTRAINT [FK_CitySurveyNoMaster_SubZoneDetailsForCV] FOREIGN KEY([SubZoneID])
-- REFERENCES [PTIS].[SubZoneDetailsForCV] ([SubZoneId])
-- GO

-- ALTER TABLE [PTIS].[CitySurveyNoMaster] CHECK CONSTRAINT [FK_CitySurveyNoMaster_SubZoneDetailsForCV]
-- GO



/****** Object:  Table [PTIS].[AssessmentYearRangeMaster] ******/
CREATE TABLE [PTIS].[AssessmentYearRangeMaster](
	[YearRangeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AssessmentYearRangeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AssessmentYearRangeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_AssessmentYearRangeMaster] PRIMARY KEY CLUSTERED ([YearRangeId] ASC),
	CONSTRAINT [UQ_AssessmentYearRangeMaster_FromYear_ToYear] UNIQUE ([FromYear], [ToYear]),
	CONSTRAINT [CK_AssessmentYearRange_ValidYear] CHECK (FromYear <= ToYear)
)

GO



/****** Object:  Table [PTIS].[TaxPercentageMasterCV]******/

CREATE TABLE [PTIS].[TaxPercentageMasterCV](
    [TaxPercentageCVId] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [TypeOfUseId] [int] NOT NULL,
	[YearRangeId] [int] NOT NULL,
    [GeneralTax] money NOT NULL,
    -- [StateEducationTax] money NOT NULL,
    -- [StateEmploymentTax] money NOT NULL,
    [TreeCess] money NOT NULL,
    [SpWaterCess] money NOT NULL,
    [RoadCess] money NOT NULL,
    [FireCess] money NOT NULL,
    [LightCess] money NOT NULL,
    [WaterBenefitCess] money NOT NULL,
    [SewageDisposalCess] money NOT NULL,
    [SpEducationTax] money NOT NULL,
    [SanitationCess] money NOT NULL,
    [DrainCess] money NOT NULL,
    [WaterBill] money NOT NULL,
    [BigBuilding] money NOT NULL,
    [IllegalConstPenalty] money NOT NULL,
    [UserCharges] money NOT NULL,
    [ServiceTax] money NOT NULL,
    [Tax1] money NOT NULL,
    [Tax2] money NOT NULL,
    [Tax3] money NOT NULL,
    [Tax4] money NOT NULL,
    [Tax5] money NOT NULL,
    [Tax6] money NOT NULL,
    [Tax7] money NOT NULL,
    [Tax8] money NOT NULL,
    [Tax9] money NOT NULL,
    [Tax10] money NOT NULL,
    [OldPenalty] money NOT NULL,
    [IsActive] bit NOT NULL CONSTRAINT [DF_TaxPercentageMasterCV_IsActive] DEFAULT (1),
    [CreatedBy] int NULL,
    [CreatedDate] datetime NOT NULL CONSTRAINT DF_TaxPercentageMasterCV_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] int NULL,
    [UpdatedDate] datetime NULL,

    CONSTRAINT [PK_TaxPercentageMasterCV] PRIMARY KEY CLUSTERED ([TaxPercentageCVId] ASC),
    CONSTRAINT [UQ_TaxPercentageMasterCV_TypeOfUseId_YearRangeId] UNIQUE ([TypeOfUseId], [YearRangeId])
) ON [PRIMARY];
GO


ALTER TABLE PTIS.TaxPercentageMasterCV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterCV_TypeOfUseId FOREIGN KEY (TypeOfUseId)
REFERENCES PTIS.TypeOfUseMaster(TypeOfUseId);
GO
 ALTER TABLE PTIS.TaxPercentageMasterCV CHECK CONSTRAINT FK_TaxPercentageMasterCV_TypeOfUseId;
GO

ALTER TABLE PTIS.TaxPercentageMasterCV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterCV_AssessmentYearRangeId FOREIGN KEY (YearRangeId)
REFERENCES PTIS.AssessmentYearRangeMaster(YearRangeId);
GO	
ALTER TABLE PTIS.TaxPercentageMasterCV CHECK CONSTRAINT FK_TaxPercentageMasterCV_AssessmentYearRangeId;
GO	


ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO

/****** Object:  Table [PTIS].[TaxPercentageMasterRV]******/

CREATE TABLE [PTIS].[TaxPercentageMasterRV](
	[TaxPercentageRVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[YearRangeId] [int] NOT NULL,
  	[GeneralTax] [money] NOT NULL,
	-- [StateEducationTax] [money] NOT NULL,
	-- [StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPercentageMasterRV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPercentageMasterRV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 
    CONSTRAINT [PK_TaxPercentageMasterRV] PRIMARY KEY CLUSTERED ([TaxPercentageRVId] ASC),
	CONSTRAINT [UQ_TaxPercentageMasterRV_TypeOfUseId_YearRangeId] UNIQUE (TypeOfUseId, YearRangeId)
   ) ON [PRIMARY];
GO
ALTER TABLE PTIS.TaxPercentageMasterRV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterRV_TypeOfUseId FOREIGN KEY (TypeOfUseId)
REFERENCES PTIS.TypeOfUseMaster(TypeOfUseId);
GO
 ALTER TABLE PTIS.TaxPercentageMasterRV CHECK CONSTRAINT FK_TaxPercentageMasterRV_TypeOfUseId;
GO

ALTER TABLE PTIS.TaxPercentageMasterRV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterRV_AssessmentYearRangeId FOREIGN KEY (YearRangeId)
REFERENCES PTIS.AssessmentYearRangeMaster(YearRangeId);
GO
ALTER TABLE PTIS.TaxPercentageMasterRV CHECK CONSTRAINT FK_TaxPercentageMasterRV_AssessmentYearRangeId;	
GO




ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO


ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO

-- /****** Object:  Table [PTIS].[ConditionMaster]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[ConditionMaster](
-- 	[ConditionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[FloorId] [nvarchar](500) NULL,
-- 	[ConstructionTypeId] [nvarchar](100) NULL,
-- 	[PropType] [nvarchar](50) NULL,
-- 	[TypeOfUseId] [nvarchar](600) NULL,
-- 	[RatePercent] [int] NOT NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConditionMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConditionMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_ConditionMaster] PRIMARY KEY CLUSTERED ([ConditionID] ASC)
-- ) ON [PRIMARY] 
-- GO

-- /****** Object:  Table [PTIS].[ConditionMasterRates]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[ConditionMasterRates](
-- 	[RateID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[FloorId] [nvarchar](10) NULL,
-- 	[ConstructionTypeId] [nvarchar](7) NULL,
-- 	[PropType] [nvarchar](10) NULL,
-- 	[TypeOfUseId] [varchar](10) NULL,
-- 	[RatePercent] [int] NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConditionMasterRates_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConditionMasterRates_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_ConditionMasterRates] PRIMARY KEY CLUSTERED ([RateID] ASC)
-- ) ON [PRIMARY]
-- GO


/****** Object:  Table [PTIS].[CustomDatabaseChangesParameter]******/

CREATE TABLE [PTIS].[CustomDatabaseChangesParameter](
	[CustomDBParameterId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardWiseRate] [bit] NULL,
	[SqFtToSqMt] [float] NULL,
	[EduEmpOnRV] [bit] NULL,
	[TaxesOnRV] [bit] NULL,
	[TaxesOnCV] [bit] NULL,
	[IsCalcOnBuiltUp] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CustomDatabaseChangesParameter_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_CustomDatabaseChangesParameter_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_CustomDatabaseChangesParameter] PRIMARY KEY CLUSTERED ([CustomDBParameterId] ASC)
) ON [PRIMARY];
GO


/****** Object:  Table [PTIS].[DepreciationMaster]******/

CREATE TABLE [PTIS].[DepreciationMaster](
	[DepreciationId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[Rate] [money] NULL,
	[Year] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_DepreciationMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_DepreciationMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_DepreciationMaster] PRIMARY KEY CLUSTERED ([DepreciationId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[DepreciationMaster] WITH CHECK ADD CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionTypeId]);
GO

ALTER TABLE [PTIS].[DepreciationMaster] CHECK CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster];
GO

/****** Object:  Table [PTIS].[EducationTaxMaster]******/

CREATE TABLE [PTIS].[EducationTaxMaster](
	[EducationTaxId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](5) NULL,
	[Year] [int] NULL,
	[MinAmount] [money] NULL,
	[MaxAmount] [money] NULL,
	[Rate] [money] NULL,
	[OnRVOrALV] [varchar](5) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_EducationTaxMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_EducationTaxMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EducationTaxMaster] PRIMARY KEY CLUSTERED ([EducationTaxId] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[EmploymentTaxMaster]******/

CREATE TABLE [PTIS].[EmploymentTaxMaster](
	[EmploymentTaxId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](5) NULL,
	[Year] [int] NULL,
	[MinAmount] [money] NULL,
	[MaxAmount] [money] NULL,
	[Rate] [money] NULL,
	[OnRVOrALV] [varchar](5) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_EmploymentTaxMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_EmploymentTaxMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmploymentTaxMaster] PRIMARY KEY CLUSTERED ([EmploymentTaxId] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[FlagMaster]******/

CREATE TABLE [PTIS].[FlagMaster](
	[FlagId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[LatestTaxCalculated] [bit] NOT NULL,
	[NewSecurityDeposit] [bit] NOT NULL,
	[NakkalDownloadAvailable] [bit] NOT NULL,
	[RenterNameVisible] [bit] NOT NULL,
	[NoticeDownloaded] [bit] NOT NULL,
	[NewPropertyRegistered] [bit] NOT NULL,
	[PropertyChangedForTax] [bit] NOT NULL,
	[ReportGenerated] [bit] NOT NULL,
	[TreeSavardhanApplied] [bit] NOT NULL,
	[VermiCompostApplied] [bit] NOT NULL,
	[FamilyPlanning] [bit] NOT NULL,
	[FemaleOwner] [bit] NOT NULL,
	[Solar] [bit] NOT NULL,
	[Boar] [bit] NOT NULL,
	[RainwaterHarvesting] [bit] NOT NULL,
	[WaterConnectionStatus] [bit] NOT NULL,
	[HandPump] [bit] NOT NULL,
	[Well] [bit] NOT NULL,
	[Lift] [bit] NOT NULL,
	[ToiletDrainage] [bit] NOT NULL,
	[Act129Applied] [bit] NOT NULL,
	[ToiletSepticTank] [bit] NOT NULL,
	[BhuyariGatar] [bit] NOT NULL,
	[DieselGeneratorSet] [bit] NOT NULL,
	[FireFightingSystem] [bit] NOT NULL,
	[RegistrationForMTDC] [bit] NOT NULL,
	[SolarElectric] [bit] NOT NULL,
	[SolarWaterHeater] [bit] NOT NULL,
	[STP] [bit] NOT NULL,
	[GreenProperty] [bit] NOT NULL,
	[ElectricityChargingStation] [bit] NOT NULL,
	[FireMachine] [bit] NOT NULL,
	[DieselGenerator] [bit] NOT NULL,
	[MTDCRegistered] [bit] NOT NULL,
	[MaintenancePercent] [money] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FlagMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FlagMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FlagMaster] PRIMARY KEY CLUSTERED ([FlagId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [LatestTaxCalculated]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [NewSecurityDeposit]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [NakkalDownloadAvailable]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [RenterNameVisible]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [NoticeDownloaded]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [NewPropertyRegistered]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [PropertyChangedForTax]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [ReportGenerated]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [TreeSavardhanApplied]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [VermiCompostApplied]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [FamilyPlanning]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [FemaleOwner]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [Solar]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [Boar]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [RainwaterHarvesting]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [WaterConnectionStatus]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [HandPump]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [Well]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [Lift]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [ToiletDrainage]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [Act129Applied]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [ToiletSepticTank]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [BhuyariGatar]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [DieselGeneratorSet]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [FireFightingSystem]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [RegistrationForMTDC]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [SolarElectric]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [SolarWaterHeater]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [STP]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [GreenProperty]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [ElectricityChargingStation]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [FireMachine]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [DieselGenerator]
GO

ALTER TABLE [PTIS].[FlagMaster] ADD  DEFAULT ((0)) FOR [MTDCRegistered]
GO

ALTER TABLE [PTIS].[FlagMaster]  WITH CHECK ADD  CONSTRAINT [FK_FlagMaster_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[FlagMaster] CHECK CONSTRAINT [FK_FlagMaster_PropertyMast]
GO

/****** Object:  Table [PTIS].[FloorFactorCVMaster]******/

CREATE TABLE [PTIS].[FloorFactorCVMaster](
	[FloorFactorCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorId] [int] NOT NULL,
	[FactorWithLift] [decimal](5, 2) NULL,
	[FactorWithoutLift] [decimal](5, 2) NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FloorFactorCVMaster] PRIMARY KEY CLUSTERED ([FloorFactorCVId] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[FloorFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster]
FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([FloorId]);
GO

ALTER TABLE [PTIS].[FloorFactorCVMaster] CHECK CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster];
GO

/****** Object:  Table [PTIS].[RoomWiseSubmissionDetails]******/

CREATE TABLE [PTIS].[RoomWiseSubmissionDetails](
	[RoomWiseSubmissionId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PropertyDetailsId] [int] NULL,
	[LengthMtr] [decimal](18,2) NULL,
	[WidthMtr] [decimal](18,2) NULL,
	[AreaSqMtr] [decimal](18,2) NULL,
	[HeightMtr] [decimal](18,2) NULL,
	[Base1Mtr] [decimal](18,2) NULL,
	[Base2Mtr] [decimal](18,2) NULL,
	[NoOfRooms] [int] NULL,
	[TotalAreaSqMtr] [decimal](18, 2) NULL,
	[Shape] [nvarchar] (25) NULL,
	[RoomNo] [nvarchar](100) NULL,
	[OuterYesNo] [bit] NOT NULL CONSTRAINT [DF_RoomWiseSubmissionDetails_OuterYesNo] DEFAULT (0),
	[RoomType] [nvarchar](100) NULL,
	[SubmissionType] [nvarchar](100) NULL,
	[MinusYesNo] [bit] NOT NULL CONSTRAINT [DF_RoomWiseSubmissionDetails_MinusYesNo] DEFAULT (0),
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RoomWiseSubmissionDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomWiseSubmissionDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomWiseSubmissionDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RoomWiseSubmissionDetails] PRIMARY KEY CLUSTERED ([RoomWiseSubmissionId] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH CHECK
ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyDetails]
FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([PropertyDetailsId]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyDetails];
GO

ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH CHECK
ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast]
FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast];
GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster]
-- FOREIGN KEY([ConstructionTypeId])
-- REFERENCES [PTIS].[ConstructionTypeMaster] ([ConstructionTypeId]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_FloorMaster]
-- FOREIGN KEY([FloorId])
-- REFERENCES [PTIS].[FloorMaster] ([FloorId]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- WITH CHECK CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_FloorMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_TypeOfUseMaster]
-- FOREIGN KEY([TypeOfUseId])
-- REFERENCES [PTIS].[TypeOfUseMaster] ([TypeOfUseId]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- WITH CHECK CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_TypeOfUseMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_SubFloorMaster]
-- FOREIGN KEY([SubFloorId])
-- REFERENCES [PTIS].[SubFloorMaster] ([SubFloorId]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_SubFloorMaster];
-- GO
/****** Object:  Table [PTIS].[FloorSubmissionRoomNoDetail]******/
/****** Object:  Table [PTIS].[RoomNoCountMaster] ******/
 CREATE TABLE [PTIS].[RoomNoCountMaster](
 	[RoomNoCountId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 	[RoomNo] [nvarchar](100) NOT NULL,
 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomNoCountMaster_IsActive] DEFAULT (1),
 	[CreatedBy] [int] NULL,
 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomNoCountMaster_CreatedDate DEFAULT (GETDATE()),
 	[UpdatedBy] [int] NULL,
 	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_RoomNoCountMaster] PRIMARY KEY CLUSTERED ([RoomNoCountId] ASC),
  CONSTRAINT UQ_RoomNoCountMaster_RoomNo UNIQUE (RoomNo)
 ) ON [PRIMARY]
 GO

/****** Object:  Table [PTIS].[NatureFactorCVMaster]******/

CREATE TABLE [PTIS].[NatureFactorCVMaster](
	[NatureFactorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	[Code] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_NatureFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_NatureFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NatureFactorCVMaster] PRIMARY KEY CLUSTERED ([NatureFactorId] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionTypeId]);
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] CHECK CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster];
GO


/****** Object:  Table [PTIS].[RateSectionDetails]******/

CREATE TABLE [PTIS].[RateSectionDetails](
	[RateSectionDetailsId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RateSectionId] [int] NOT NULL,
	[WardId] int NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionDetails_IsActive] DEFAULT (1),
	[CreatedBy] int NULL,
    [CreatedDate] datetime NOT NULL CONSTRAINT DF_RateSectionDetails_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] int NULL,
    [UpdatedDate] datetime NULL,
    CONSTRAINT [PK_RateSectionDetails] PRIMARY KEY CLUSTERED ([RateSectionDetailsId] ASC)
);
GO

alter table [PTIS].[RateSectionDetails] with check add constraint [FK_RateSectionDetails_RateSectionMaster]	
foreign key([RateSectionId]) references [PTIS].[RateSectionMaster] ([RateSectionId]);
GO
alter table [PTIS].[RateSectionDetails] check constraint [FK_RateSectionDetails_RateSectionMaster];

ALTER TABLE [PTIS].[RateSectionDetails] WITH CHECK ADD CONSTRAINT [FK_RateSectionDetails_WardMaster]
FOREIGN KEY([WardId]) REFERENCES [PTIS].[WardMaster] ([WardId]);
GO
ALTER TABLE [PTIS].[RateSectionDetails] CHECK CONSTRAINT [FK_RateSectionDetails_WardMaster];
GO	



ALTER TABLE [PTIS].[RateSectionDetails] ADD CONSTRAINT [UQ_RateSectionDetails_RateSection_Ward]
UNIQUE ([RateSectionId], [WardId]);
GO

/****** Object:  Table [PTIS].[ParkingTypeMaster]******/

CREATE TABLE [PTIS].[ParkingTypeMaster](
	[ParkingTypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ParkingTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ParkingTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ParkingTypeMaster] PRIMARY KEY CLUSTERED ([ParkingTypeId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[ParkingTypeMaster] WITH CHECK ADD CONSTRAINT [FK_ParkingTypeMaster_TypeOfUseMaster]
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO

ALTER TABLE [PTIS].[ParkingTypeMaster] CHECK CONSTRAINT [FK_ParkingTypeMaster_TypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[PartTypeMaster]******/

CREATE TABLE [PTIS].[PartTypeMaster](
	[PartTypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PartType] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PartTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PartTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartTypeMaster_1] PRIMARY KEY CLUSTERED ([PartTypeId] ASC),
 CONSTRAINT [UQ_PartTypeMaster_PartType] UNIQUE ([PartType])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PenaltyDetails]******/

CREATE TABLE [PTIS].[PenaltyDetails](
	[PenaltyId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YearId] [int] NOT NULL,
	[PropertyId] [int] NULL,
	[CurrentPenalty] [money] NULL,
	[PendingPenalty] [money] NULL,
	[PaidPendPenalty] [money] NULL,
	[PaidCurrentPenalty] [money] NULL,
	[PreviousYearCurrentPenalty] [money] NULL,
	[PreviousYearPendingPenalty] [money] NULL,
	[PayablePendingPenalty] [money] NULL,
	[PayablePreviousYearPendingPenalty] [money] NULL,
	[PayablePreviousYearCurrentPenalty] [money] NULL,
	[PayableCurrentPenalty] [money] NULL,
	[LastDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PenaltyDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PenaltyDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PenaltyDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PenaltyDetails] PRIMARY KEY CLUSTERED ([PenaltyId] ASC),
 CONSTRAINT FK_PenaltyMaster_YearMaster  FOREIGN KEY (YearId) REFERENCES [CORE].[YearMaster](YearId)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PenaltyDetails]  WITH CHECK ADD  CONSTRAINT [FK_PenaltyDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO
ALTER TABLE [PTIS].[PenaltyDetails] CHECK CONSTRAINT [FK_PenaltyDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PenaltyTaxesMaster]******/

CREATE TABLE [PTIS].[PenaltyTaxesMaster](
	[PenaltyTaxesId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YearId] [int] NOT NULL,
	[BillGenerationDate] [datetime] NULL,
	[PenaltyPercent_Current] [float] NULL,
	[PenaltyPercent_Pending] [float] NULL,
	[GeneralTax] [bit] NOT NULL,
	[StateEducationTax] [bit] NOT NULL,
	[StateEmploymentTax] [bit] NOT NULL,
	[TreeCess] [bit] NOT NULL,
	[SpWaterCess] [bit] NOT NULL,
	[RoadCess] [bit] NOT NULL,
	[FireCess] [bit] NOT NULL,
	[LightCess] [bit] NOT NULL,
	[WaterBenefitCess] [bit] NOT NULL,
	[SewageDisposalCess] [bit] NOT NULL,
	[SpEducationTax] [bit] NOT NULL,
	[SanitationCess] [bit] NOT NULL,
	[DrainCess] [bit] NOT NULL,
	[WaterBill] [bit] NOT NULL,
	[BigBuilding] [bit] NOT NULL,
	[IllegalConstPenalty] [bit] NOT NULL,
	[UserCharges] [bit] NOT NULL,
	[ServiceTax] [bit] NOT NULL,
	[Tax1] [bit] NOT NULL,
	[Tax2] [bit] NOT NULL,
	[Tax3] [bit] NOT NULL,
	[Tax4] [bit] NOT NULL,
	[Tax5] [bit] NOT NULL,
	[Tax6] [bit] NOT NULL,
	[Tax7] [bit] NOT NULL,
	[Tax8] [bit] NOT NULL,
	[Tax9] [bit] NOT NULL,
	[Tax10] [bit] NOT NULL,
	[OldPenalty] [bit] NOT NULL,
	[Start_Half_On_Current] [datetime] NOT NULL,
	[End_Half_On_Current] [datetime] NOT NULL,
	[Start_Full_On_Current] [datetime] NOT NULL,
	[End_Full_On_Current] [datetime] NOT NULL,
	[Start_Full_On_Pending] [datetime] NOT NULL,
	[End_Full_On_Pending] [datetime] NOT NULL,
	[IsValidateDate] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PenaltyTaxesMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PenaltyTaxesMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ApplyPenaltyTaxesMaster] PRIMARY KEY CLUSTERED ([PenaltyTaxesId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [StateEducationTax]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO
ALTER TABLE [PTIS].[PenaltyTaxesMaster] ADD CONSTRAINT FK_PenaltyTaxesMaster_YearMaster FOREIGN KEY (YearId) REFERENCES [CORE].[YearMaster](YearId);
GO
/****** Object:  Table [PTIS].[PlotDetails]******/

CREATE TABLE [PTIS].[PlotDetails](
	[PlotId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PlotArea] [float] NULL,
	[PlotTaxableAreaSqFt] [float] NULL,
	[OpenPlotType] [nvarchar](10) NULL,
	[OpenPlotRenterName] [nvarchar](1000) NULL,
	[OpenPlotLength] [float] NULL,
	[OpenPlotWidth] [float] NULL,
	[PlotTaxableAreaSqMtr] [float] NULL,
	[PlotAreaSqMtr] [float] NULL,
	[OpenPlotSubmissionType] [varchar](30) NULL,
	[PlotAreaMtrLength] [float] NULL,
	[PlotAreaMtrWidth] [float] NULL,
	[PlotAreaFtLength] [float] NULL,
	[PlotAreaFtWidth] [float] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PlotDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PlotDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PlotDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PlotDetails] PRIMARY KEY CLUSTERED ([PlotId] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PlotDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlotDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PlotDetails] CHECK CONSTRAINT [FK_PlotDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyAssessmentDetails]******/

CREATE TABLE [PTIS].[PropertyAssessmentDetails](
	[PropertyAssessmentDetailsId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[QcDone] [bit] NULL,
	[QcDoneByUser] [int] NULL,
	[QcDoneDate] [datetime] NULL,
	[AddTaxesDone] [bit] NULL,
	[AddTaxeDoneByUser] [nvarchar](200) NULL,
	[AddTaxeDoneDate] [datetime] NULL,
	[QcRevert] [bit] NULL,
	[QcRevertBy] [int] NULL,
	[QcRevertDate] [datetime] NULL,
	[QcRevertRemark] [nvarchar](500) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyAssessmentDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyAssessmentDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyAssessmentDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyAssessmentDetails] PRIMARY KEY CLUSTERED ([PropertyAssessmentDetailsId] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails] CHECK CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast]
GO
ALTER TABLE [PTIS].[PropertyAssessmentDetails] ADD CONSTRAINT UQ_PropertyAssessmentDetails_PropertyId UNIQUE (PropertyId);
GO


/****** Object:  Table [PTIS].[PropertyDescriptionAndTypeOfUseValidation] ******/
CREATE TABLE [PTIS].[PropertyDescriptionAndTypeOfUseValidation](
	[TypeOfUseValidationId] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDescriptionAndTypeOfUseValidation_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDescriptionAndTypeOfUseValidation_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_PropertyDescriptionAndTypeOfUseValidation] PRIMARY KEY CLUSTERED ([TypeOfUseValidationId]),
    CONSTRAINT [FK_PropertyDescriptionAndTypeOfUseValidation_PropertyType]
        FOREIGN KEY ([PropertyTypeId]) 
        REFERENCES [PTIS].[PropertyTypeMaster]([PropertyTypeId]),
	CONSTRAINT [FK_PropertyDescriptionAndTypeOfUseValidation_TypeOfUse]
		FOREIGN KEY ([TypeOfUseId]) 
		REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]),
	CONSTRAINT [UQ_PropertyDescriptionAndTypeOfUseValidation] UNIQUE ([PropertyTypeId], [TypeOfUseId])
	
) ON [PRIMARY];
GO

/****** Object:  Table [PTIS].[PropertyDetailsOld]******/

CREATE TABLE [PTIS].[PropertyDetailsOld](
	[PropertyDetailsOldId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[OldFloorId] [nvarchar](10) NULL,
	[OldConstructionYear] [varchar](4) NULL,
	[OldConstructionTypeId] [varchar](7) NULL,
	[OldTypeOfUseId] [nvarchar](20) NULL,
	[OldCarpetAreaSqfeet] [float] NULL,
	[OldCarpetAreaSqMeter] [float] NULL,
	[OldRegistration] [bit] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsOld_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsOld_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetailsOld_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OldPropertyDetails] PRIMARY KEY CLUSTERED ([PropertyDetailsOldId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyDetailsOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyDetailsOld_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyDetailsOld] CHECK CONSTRAINT [FK_PropertyDetailsOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyImagesMast]******/

CREATE TABLE [PTIS].[PropertyImagesMast](
	[PropertyImageId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[PlanPhoto] [varbinary](max) NULL,
	[PropertyPhotoA] [varbinary](max) NULL,
	[PropertyPhotoB] [varbinary](max) NULL,
	[PropertyPhotoC] [varbinary](max) NULL,
	[PropertyPhotoD] [varbinary](max) NULL,
	[PropertyObjQR] [varbinary](max) NULL,
	[QuickSearchQR] [varbinary](max) NULL,
	[PropertyPhotoQR] [varbinary](max) NULL,
	[PropertyPhotoSLR] [varbinary](max) NULL,
	[PropertyPhotoRW] [varbinary](max) NULL,
	[PropertyPhotoGS] [varbinary](max) NULL,
	[PropertyPhotoGD] [varbinary](max) NULL,
	[PropertyPhotoAGR] [varbinary](max) NULL,
	[PropertyPhotoSign] [varbinary](max) NULL,
	[PropertyPhotoSRF1] [varbinary](max) NULL,
	[PropertyPhotoSRF2] [varbinary](max) NULL,
	[PropertyPhotoSRF3] [varbinary](max) NULL,
	[PropertyPhotoECST] [varbinary](max) NULL,
	[PropertyPhotoSTP] [varbinary](max) NULL,
	[IsPlanPhoto] [bit] NULL,
	[IsPropertyPhotoA] [bit] NULL,
	[IsPropertyPhotoB] [bit] NULL,
	[IsPropertyPhotoC] [bit] NULL,
	[IsPropertyPhotoD] [bit] NULL,
	[IsPropertyObjQR] [bit] NULL,
	[IsQuickSearchQR] [bit] NULL,
	[IsPropertyPhotoQR] [bit] NULL,
	[IsPropertyPhotoSLR] [bit] NULL,
	[IsPropertyPhotoRW] [bit] NULL,
	[IsPropertyPhotoGS] [bit] NULL,
	[IsPropertyPhotoGD] [bit] NULL,
	[IsPropertyPhotoAGR] [bit] NULL,
	[IsPropertyPhotoSign] [bit] NULL,
	[IsPropertyPhotoSRF1] [bit] NULL,
	[IsPropertyPhotoSRF2] [bit] NULL,
	[IsPropertyPhotoSRF3] [bit] NULL,
	[IsPropertyPhotoECST] [bit] NULL,
	[IsPropertyPhotoSTP] [bit] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyImagesMast_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyImagesMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyImagesMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyImagesMast] PRIMARY KEY CLUSTERED ([PropertyImageId] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyImagesMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyImagesMast_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyImagesMast] CHECK CONSTRAINT [FK_PropertyImagesMast_PropertyMast]
GO



/****** Object:  Table [PTIS].[UsageCategoryMaster]******/

CREATE TABLE [PTIS].[UsageCategoryMaster](
	[UsageCategoryId] [int] NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UsageCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_UsageCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UsageCategoryMaster] PRIMARY KEY CLUSTERED ([UsageCategoryId] ASC),
 CONSTRAINT UQ_UsageCategoryMaster_Description UNIQUE (Description)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyMastDetails]******/

CREATE TABLE [PTIS].[PropertyMastDetails](
	[PropertyDetailsId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[OwnerTypeId] int NULL,
	[WingName] [nvarchar](30) NULL,
	[WingId] [int] NULL,
	[WingNo] [nvarchar](20) NULL,
	[AssessmentRemark] [nvarchar](400) NULL,
	[SurveyRemark] [nvarchar](400) NULL,
	[FlatSystemRemark] [nvarchar](400) NULL,
	[CombPropRemark] [nvarchar](400) NULL,
	[AdharCardNo] [varchar](12) NULL,
	[ManagerMobileNo] [varchar](13) NULL,
	[RenterMobileNo] [varchar](13) NULL,
	[SecretaryMobileNo] [varchar](13) NULL,
	[AssessmentNo] [nvarchar](10) NULL,
	[PrarupYadiPublishDate] [datetime] NULL,
	[AntimYadiPublishDate] [datetime] NULL,
	[PropertyRegDate] [datetime] NULL,
	[ApplyTaxesFrom] [smallint] NULL,
	[PartOCDate] [datetime] NULL,
	[BHK] [nvarchar](50) NULL,
	[BlockNo] [nvarchar](20) NULL,
	[UsageCategoryId] [int] NULL,
	[AlternetivEmailId] [varchar](100) NULL,
	[TotalBuiltupAreaSqFeet] [float] NULL,
	[TotalBuiltupAreaSqMeter] [float] NULL,
	[Latitude] [varchar](20) NULL,
	[Longitude] [varchar](20) NULL,
	[NoOfResidentialToilets] [int] NULL,
	[NoOfCommercialToilets] [int] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyMastDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMastDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMastDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyMastDetails] PRIMARY KEY CLUSTERED ([PropertyDetailsId] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_PropertyMast_PropertyId]
GO

alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster] FOREIGN KEY([OwnerTypeId])
REFERENCES [PTIS].[OwnerTypeMaster] ([OwnerTypeId])	
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster]


GO
alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster] FOREIGN KEY([UsageCategoryId])
REFERENCES [PTIS].[UsageCategoryMaster] ([UsageCategoryId])
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster]	
GO

/****** Object:  Table [PTIS].[PropertyMastOld]******/

CREATE TABLE [PTIS].[PropertyMastOld](
	[PropertyOldId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[OldWardNo] [nvarchar](10) NULL,
	[OldPropertyNo] [nvarchar](10) NULL,
	[OldPartitionNo] [nvarchar](10) NULL,
	[OldEgovNo] [nvarchar](10) NULL,
	[OldPropertyTypeId] [int] NULL,
	[OldALV] [float] NULL,
	[OldRV] [float] NULL,
	[OldGeneralTax] [float] NULL,
	[OldTotalTax] [float] NULL,
	[OldZoneNo] [nvarchar](20) NULL,
	[OldPlotNo] [nvarchar](20) NULL,
	[OldCSN] [nvarchar](30) NULL,
	[OldPlotArea] [float] NULL,
	[OldAssessmentYear] [int] NULL,
	[OldFloor] [nvarchar](10) NULL,
	[OldConstructionTypeOfUseId] [nvarchar](7) NULL,
	[OldUseType] [nvarchar](100) NULL,
	[OldConstArea] [float] NULL,
	[OldOwnerName] [nvarchar](1000) NULL,
	[OldOccupierName] [nvarchar](1000) NULL,
	[OldAddress] [nvarchar](500) NULL,
	[OldOwnerNameEnglish] [nvarchar](1000) NULL,
	[OldOccupierNameEnglish] [nvarchar](1000) NULL,
	[OldAddressEnglish] [nvarchar](500) NULL,
	[NoOfOldToilets] [int] NULL,
	[OldTotalRooms] [int] NULL,
	[OldSocietyName] [nvarchar](300) NULL,
	[OldEmailId] [nvarchar](100) NULL,
	[OldParkingAreaSqFt] [float] NULL,
	[OldParkingAreaSqMtr] [float] NULL,
	[OldAssessmentDate] [datetime] NULL,
	[OldFlatOrShopNumber] [nvarchar](50) NULL,
	[OldWing] [nvarchar](20) NULL,
	[OldMobileNo] [varchar](13) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyMastOld_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMastOld_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMastOld_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyMastOld] PRIMARY KEY CLUSTERED ([PropertyOldId] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastOld_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyMastOld] CHECK CONSTRAINT [FK_PropertyMastOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetails]******/

CREATE TABLE [PTIS].[PropertySocialDetails](
	[PropertySocialId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[RoadWidth] [float] NULL,
	[WaterConnStatus] [int] NULL,
	[WaterConnectionYear] [int] NULL,
	[WaterMeter] [bit] NULL,
	[HandPump] [bit] NULL,
	[Well] [bit] NULL,
	[NoOfWell] [int] NULL,
	[Boar] [bit] NULL,
	[NoOfBoar] [int] NULL,
	[Drain] [bit] NULL,
	[SepticTank] [bit] NULL,
	[STP] [bit] NULL,
	[GarbageSegrigation] [bit] NULL,
	[GarbageDisposal] [bit] NULL,
	[ElectricConnection] [bit] NULL,
	[EBill] [bit] NULL,
	[ElectricityChargingStation] [bit] NULL,
	[Solar] [bit] NULL,
	[NoOfSolar] [int] NULL,
	[SolarElectric] [bit] NULL,
	[SolarElectricKW] [int] NULL,
	[SolarCapacityKW] [int] NULL,
	[SolarWaterHeater] [bit] NULL,
	[SolarWaterLtr] [int] NULL,
	[SolarWaterLiterCapacity] [int] NULL,
	[DiselGenKW] [int] NULL,
	[DiselGeneratorKW] [int] NULL,
	[GeneratorPowerKW] [int] NULL,
	[DieselGenSet] [bit] NULL,
	[DieselGeneratorSet] [bit] NULL,
	[DiselGenerator] [bit] NULL,
	[FireFightingSystem] [bit] NULL,
	[FireMachine] [bit] NULL,
	[Lift] [bit] NULL,
	[NoOfLift] [int] NULL,
	[Stairs] [bit] NULL,
	[NoOfTrees] [int] NULL,
	[Rainwaterharvesting] [int] NULL,
	[GreenProperty] [bit] NULL,
	[GreenPropertyStar] [int] NULL,
	[MTDCreg] [bit] NULL,
	[RegistrationForMTDC] [bit] NULL,
	[Familyplanning] [bit] NULL,
	[WomenOwner] [bit] NULL,
	[BuildingPermitNo] [nvarchar](50) NULL,
	[BuildingPermitDate] [date] NULL,
	[CommencementNo] [nvarchar](50) NULL,
	[CommencementDate] [date] NULL,
	[BuildCompletionCertNo] [nvarchar](50) NULL,
	[BuildCompletionDate] [date] NULL,
	[OccupancyCertNo] [nvarchar](50) NULL,
	[OccupancyCertDate] [date] NULL,
	[PossessionCertNo] [nvarchar](50) NULL,
	[PossessionCertDate] [date] NULL,
	[Index2No] [nvarchar](50) NULL,
	[Index2Date] [date] NULL,
	[ElectricBillNo] [nvarchar](50) NULL,
	[ElectricBillDate] [date] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertySocialDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertySocialDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertySocialDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertySocialDetails] PRIMARY KEY CLUSTERED ([PropertySocialId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertySocialDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertySocialDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertySocialDetails] CHECK CONSTRAINT [FK_PropertySocialDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetailsSequenceMaster]******/

CREATE TABLE [PTIS].[PropertySocialDetailsSequenceMaster](
	[PropertySocialSequenceId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FieldName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertySocialDetailsSequenceMaster_IsActive] DEFAULT (1),
	[SequenceNo] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertySocialDetailsSequenceMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED ([PropertySocialSequenceId] ASC),
 CONSTRAINT UQ_PropertySocialDetailsSequenceMaster_FieldName UNIQUE (FieldName)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyTaxCalculationRVResults]******/

CREATE TABLE [PTIS].[PropertyTaxCalculationRVResults](
	[PropertyCalculationRVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[PropertyDetailsId] [int] NOT NULL,
	[MonthlyRate] [float] NULL,
	[YearlyRate] [float] NULL,
	[YearlyRent] [float] NULL,
	[Depreciation] [money] NULL,
	[AnnualRentalValue] [float] NULL,
	[Maintenance] [money] NULL,
	[RateableValue] [money] NULL,
	[GeneralTaxPer] [money] NULL,
	[GeneralTax] [money] NULL,
	[StateEducationTaxPer] [money] NULL,
	[StateEducationTax] [money] NULL,
	[StateEmploymentTaxPer] [money] NULL,
	[StateEmploymentTax] [money] NULL,
	[TreeCessPer] [money] NULL,
	[TreeCess] [money] NULL,
	[SpWaterCessPer] [money] NULL,
	[SpWaterCess] [money] NULL,
	[RoadCessPer] [money] NULL,
	[RoadCess] [money] NULL,
	[FireCessPer] [money] NULL,
	[FireCess] [money] NULL,
	[LightCessPer] [money] NULL,
	[LightCess] [money] NULL,
	[WaterBenefitCessPer] [money] NULL,
	[WaterBenefitCess] [money] NULL,
	[SewageDisposalCessPer] [money] NULL,
	[SewageDisposalCess] [money] NULL,
	[SpEducationTaxPer] [money] NULL,
	[SpEducationTax] [money] NULL,
	[SanitationCessPer] [money] NULL,
	[SanitationCess] [money] NULL,
	[DrainCessPer] [money] NULL,
	[DrainCess] [money] NULL,
	[WaterBillPer] [money] NULL,
	[WaterBill] [money] NULL,
	[BigBuildingPer] [money] NULL,
	[BigBuilding] [money] NULL,
	[IllegalConstPenaltyPer] [money] NULL,
	[IllegalConstPenalty] [money] NULL,
	[UserChargesPer] [money] NULL,
	[UserCharges] [money] NULL,
	[ServiceTaxPer] [money] NULL,
	[ServiceTax] [money] NULL,
	[Tax1Per] [money] NULL,
	[Tax1] [money] NULL,
	[Tax2Per] [money] NULL,
	[Tax2] [money] NULL,
	[Tax3Per] [money] NULL,
	[Tax3] [money] NULL,
	[Tax4Per] [money] NULL,
	[Tax4] [money] NULL,
	[Tax5Per] [money] NULL,
	[Tax5] [money] NULL,
	[Tax6Per] [money] NULL,
	[Tax6] [money] NULL,
	[Tax7Per] [money] NULL,
	[Tax7] [money] NULL,
	[Tax8Per] [money] NULL,
	[Tax8] [money] NULL,
	[Tax9Per] [money] NULL,
	[Tax9] [money] NULL,
	[Tax10Per] [money] NULL,
	[Tax10] [money] NULL,
	[REducationTax] [money] NULL,
	[CEducationTax] [money] NULL,
	[REducationTaxPercentage] [money] NULL,
	[CEducationTaxPercentage] [money] NULL,
	[REmploymentTax] [money] NULL,
	[CEmploymentTax] [money] NULL,
	[REmploymentTaxPercentage] [money] NULL,
	[CEmploymentTaxPercentage] [money] NULL,
	[TotalAreaSqMtr] [float] NULL,
	[RAreaSqMtr] [float] NULL,
	[CAreaSqlMtr] [float] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationRVResults_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationRVResults_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTaxCalculationRVResults_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTaxCalculationRVResults] PRIMARY KEY CLUSTERED ([PropertyCalculationRVId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationRVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationRVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyMast]
GO


ALTER TABLE PTIS.PropertyTaxCalculationRVResults ADD CONSTRAINT FK_PropertyTaxCalculationRVResults_PropertyDetails FOREIGN KEY (PropertyDetailsId)
REFERENCES PTIS.PropertyDetails (PropertyDetailsId);
GO
ALTER TABLE PTIS.PropertyTaxCalculationRVResults CHECK CONSTRAINT FK_PropertyTaxCalculationRVResults_PropertyDetails
GO


---****** Object:  Table [PTIS].[PropertyTaxCalculationCVResults]******/
CREATE TABLE [PTIS].[PropertyTaxCalculationCVResults](
	[PropertyCalculationCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyDetailsId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[SDRR] [float] NULL,
	[BaseValue] [float] NULL,
	[FloorFactor] [float] NULL,
	[AgeFactor] [float] NULL,
	[NTBFactor] [float] NULL,
	[UseFactor] [float] NULL,
	[CapitalValue] [money] NULL,
	[GeneralTaxPer] [money] NULL,
	[GeneralTax] [money] NULL,
	[StateEducationTaxPer] [money] NULL,
	[StateEducationTax] [money] NULL,
	[StateEmploymentTaxPer] [money] NULL,
	[StateEmploymentTax] [money] NULL,
	[TreeCessPer] [money] NULL,
	[TreeCess] [money] NULL,
	[SpWaterCessPer] [money] NULL,
	[SpWaterCess] [money] NULL,
	[RoadCessPer] [money] NULL,
	[RoadCess] [money] NULL,
	[FireCessPer] [money] NULL,
	[FireCess] [money] NULL,
	[LightCessPer] [money] NULL,
	[LightCess] [money] NULL,
	[WaterBenefitCessPer] [money] NULL,
	[WaterBenefitCess] [money] NULL,
	[SewageDisposalCessPer] [money] NULL,
	[SewageDisposalCess] [money] NULL,
	[SpEducationTaxPer] [money] NULL,
	[SpEducationTax] [money] NULL,
	[SanitationCessPer] [money] NULL,
	[SanitationCess] [money] NULL,
	[DrainCessPer] [money] NULL,
	[DrainCess] [money] NULL,
	[WaterBillPer] [money] NULL,
	[WaterBill] [money] NULL,
	[BigBuildingPer] [money] NULL,
	[BigBuilding] [money] NULL,
	[IllegalConstPenaltyPer] [money] NULL,
	[IllegalConstPenalty] [money] NULL,
	[UserChargesPer] [money] NULL,
	[UserCharges] [money] NULL,
	[ServiceTaxPer] [money] NULL,
	[ServiceTax] [money] NULL,
	[Tax1Per] [money] NULL,
	[Tax1] [money] NULL,
	[Tax2Per] [money] NULL,
	[Tax2] [money] NULL,
	[Tax3Per] [money] NULL,
	[Tax3] [money] NULL,
	[Tax4Per] [money] NULL,
	[Tax4] [money] NULL,
	[Tax5Per] [money] NULL,
	[Tax5] [money] NULL,
	[Tax6Per] [money] NULL,
	[Tax6] [money] NULL,
	[Tax7Per] [money] NULL,
	[Tax7] [money] NULL,
	[Tax8Per] [money] NULL,
	[Tax8] [money] NULL,
	[Tax9Per] [money] NULL,
	[Tax9] [money] NULL,
	[Tax10Per] [money] NULL,
	[Tax10] [money] NULL,
	[REducationTax] [money] NULL,
	[CEducationTax] [money] NULL,
	[REducationTaxPercentage] [money] NULL,
	[CEducationTaxPercentage] [money] NULL,
	[REmploymentTax] [money] NULL,
	[CEmploymentTax] [money] NULL,
	[REmploymentTaxPercentage] [money] NULL,
	[CEmploymentTaxPercentage] [money] NULL,
	[TotalAreaSqMtr] [float] NULL,
	[RAreaSqMtr] [float] NULL,
	[CAreaSqlMtr] [float] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationCVResults_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationCVResults_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTaxCalculationCVResults_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTaxCalculationCVResults] PRIMARY KEY CLUSTERED ([PropertyCalculationCVId] ASC) 
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyMast]
GO

ALTER TABLE PTIS.PropertyTaxCalculationCVResults ADD CONSTRAINT FK_PropertyTaxCalculationCVResults_PropertyDetails FOREIGN KEY (PropertyDetailsId)
REFERENCES PTIS.PropertyDetails (PropertyDetailsId);
GO
ALTER TABLE PTIS.PropertyTaxCalculationCVResults CHECK CONSTRAINT FK_PropertyTaxCalculationCVResults_PropertyDetails
GO


/****** Object:  Table [PTIS].[PropertyTaxCalculationSection129Results] ******/
CREATE TABLE [PTIS].[PropertyTaxCalculationSection129Results](
	[PropertyCalculationSectionId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyDetailsId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[RateableValue] [money] NULL,
	[CapitalValue] [money] NULL,
	[GeneralTaxPer] [money] NULL,
	[GeneralTax] [money] NULL,
	[StateEducationTaxPer] [money] NULL,
	[StateEducationTax] [money] NULL,
	[StateEmploymentTaxPer] [money] NULL,
	[StateEmploymentTax] [money] NULL,
	[TreeCessPer] [money] NULL,
	[TreeCess] [money] NULL,
	[SpWaterCessPer] [money] NULL,
	[SpWaterCess] [money] NULL,
	[RoadCessPer] [money] NULL,
	[RoadCess] [money] NULL,
	[FireCessPer] [money] NULL,
	[FireCess] [money] NULL,
	[LightCessPer] [money] NULL,
	[LightCess] [money] NULL,
	[WaterBenefitCessPer] [money] NULL,
	[WaterBenefitCess] [money] NULL,
	[SewageDisposalCessPer] [money] NULL,
	[SewageDisposalCess] [money] NULL,
	[SpEducationTaxPer] [money] NULL,
	[SpEducationTax] [money] NULL,
	[SanitationCessPer] [money] NULL,
	[SanitationCess] [money] NULL,
	[DrainCessPer] [money] NULL,
	[DrainCess] [money] NULL,
	[WaterBillPer] [money] NULL,
	[WaterBill] [money] NULL,
	[BigBuildingPer] [money] NULL,
	[BigBuilding] [money] NULL,
	[IllegalConstPenaltyPer] [money] NULL,
	[IllegalConstPenalty] [money] NULL,
	[UserChargesPer] [money] NULL,
	[UserCharges] [money] NULL,
	[ServiceTaxPer] [money] NULL,
	[ServiceTax] [money] NULL,
	[Tax1Per] [money] NULL,
	[Tax1] [money] NULL,
	[Tax2Per] [money] NULL,
	[Tax2] [money] NULL,
	[Tax3Per] [money] NULL,
	[Tax3] [money] NULL,
	[Tax4Per] [money] NULL,
	[Tax4] [money] NULL,
	[Tax5Per] [money] NULL,
	[Tax5] [money] NULL,
	[Tax6Per] [money] NULL,
	[Tax6] [money] NULL,
	[Tax7Per] [money] NULL,
	[Tax7] [money] NULL,
	[Tax8Per] [money] NULL,
	[Tax8] [money] NULL,
	[Tax9Per] [money] NULL,
	[Tax9] [money] NULL,
	[Tax10Per] [money] NULL,
	[Tax10] [money] NULL,
	[EducationTax] [money] NULL,
	[EducationTaxPercentage] [money] NULL,
	[EmploymentTax] [money] NULL,
	[EmploymentTaxPercentage] [money] NULL,
	[TotalAreaSqMtr] [float] NULL,
	[RAreaSqMtr] [float] NULL,
	[CAreaSqlMtr] [float] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationSection129Results_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationSection129Results_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTaxCalculationSection129Results_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTaxCalculationSection129Results] PRIMARY KEY CLUSTERED  ([PropertyCalculationSectionId] ASC ) 
 )

GO
 
ALTER TABLE [PTIS].[PropertyTaxCalculationSection129Results]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationSection129Results] CHECK CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyMast]
GO

ALTER TABLE PTIS.PropertyTaxCalculationSection129Results ADD CONSTRAINT FK_PropertyTaxCalculationSection129Results_PropertyDetails FOREIGN KEY (PropertyDetailsId)
REFERENCES PTIS.PropertyDetails (PropertyDetailsId)
GO
ALTER TABLE PTIS.PropertyTaxCalculationSection129Results CHECK CONSTRAINT FK_PropertyTaxCalculationSection129Results_PropertyDetails
GO


-- /****** Object:  Table [PTIS].[PropertyTaxSlabWiseMaster]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[PropertyTaxSlabWiseMaster](
-- 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[Type] [varchar](5) NULL,
-- 	[Year] [int] NULL,
-- 	[MinRV] [money] NULL,
-- 	[MaxRV] [money] NULL,
-- 	[Rate] [money] NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxSlabWiseMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTaxSlabWiseMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_PropertyTaxSlabWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
-- ) ON [PRIMARY]
-- GO

-- GO



-- /****** Object:  Table [PTIS].[RateChartDetails]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[RateChartDetails](
-- 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[Year] [int] NULL,
-- 	[TaxZoneId] [nvarchar](10) NULL,
-- 	[ConstructionTypeId] [int] NULL,
-- 	[Rate] [money] NULL,
-- 	[MinYear] [int] NULL,
-- 	[MaxYear] [int] NULL,
-- 	[RateSectionNo] [nvarchar](20) NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateChartDetails_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateChartDetails_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_RateChartDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
-- ) ON [PRIMARY]
-- GO

-- ALTER TABLE [PTIS].[RateChartDetails] WITH CHECK ADD CONSTRAINT [FK_RateChartDetails_ConstructionTypeMaster]
-- FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionTypeId]);
-- GO

-- ALTER TABLE [PTIS].[RateChartDetails] CHECK CONSTRAINT [FK_RateChartDetails_ConstructionTypeMaster];
-- GO

-- alter table [PTIS].[RateChartDetails] WITH CHECK ADD CONSTRAINT [FK_RateChartDetails_TaxZoneMaster]
-- FOREIGN KEY([TaxZoneNo]) REFERENCES [PTIS].[TaxZoneMaster]([TaxZoneNo]);
-- GO
-- ALTER TABLE [PTIS].[RateChartDetails] CHECK CONSTRAINT [FK_RateChartDetails_TaxZoneMaster];
-- GO
-- /****** Object:  Table [PTIS].[RateChartMaster]******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE TABLE [PTIS].[RateChartMaster](
-- 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[Year] [int] NOT NULL,
-- 	[CommercialMultiplier] [float] NULL,
-- 	[IndustrialMultiplier] [float] NULL,
-- 	[CommercialMultiplier2] [float] NULL,
-- 	[CommMultiplierAppliedToZone] [nvarchar](100) NULL,
-- 	[CommMultiplier1AppliedToZone] [nvarchar](100) NULL,
-- 	[MinYear] [int] NULL,
-- 	[MaxYear] [int] NULL,
-- -- 	[RateSectionId] [int] NOT NULL,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateChartMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateChartMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
	
--  CONSTRAINT [PK_RateChartMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
-- ) ON [PRIMARY]
-- GO

-- alter table [PTIS].[RateChartMaster] WITH CHECK ADD CONSTRAINT [FK_RateChartMaster_RateSectionMaster]
-- FOREIGN KEY([RateSectionId]) REFERENCES [PTIS].[RateSectionMaster]([RateSectionId]);	
-- GO
-- ALTER TABLE [PTIS].[RateChartMaster] CHECK CONSTRAINT [FK_RateChartMaster_RateSectionMaster];

/****** Object:  Table [PTIS].[RateMaster]******/

CREATE TABLE [PTIS].[RateMaster](
	[RateId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NOT NULL,
	[TaxZoneId] [int] NOT NULL,
	[FloorId] [int] NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[TypeOfUseGroupId] [int] NOT NULL,
	[YearRangeId] [int] NOT NULL,
	-- [MinYear] [int] NULL,
	-- [MaxYear] [int] NULL,
	[RateSquareMeter] [money] NULL,
	[RateSquareFeet] [money] NULL,
	[RateSectionId] [int] NOT NULL,
	[RateRemark] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_RateMaster] PRIMARY KEY CLUSTERED ([RateId] ASC)
) ON [PRIMARY]

GO


ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT FK_RateMaster_TaxZoneMaster
FOREIGN KEY (TaxZoneId) REFERENCES PTIS.TaxZoneMaster(TaxZoneId);
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT FK_RateMaster_TaxZoneMaster;
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_FloorId] 
FOREIGN KEY (FloorId) REFERENCES [PTIS].[FloorMaster](FloorId);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_FloorId];
GO


ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_ConstructionTypeId]
FOREIGN KEY (ConstructionTypeId) REFERENCES [PTIS].[ConstructionTypeMaster](ConstructionTypeId);
GO	
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_ConstructionTypeId];
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_TypeOfUseGroupId]
FOREIGN KEY (TypeOfUseGroupId) REFERENCES [PTIS].[TypeOfUseGroupMaster](TypeOfUseGroupId);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_TypeOfUseGroupId];
GO

ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT [FK_RateMaster_RateSectionMaster]
FOREIGN KEY (RateSectionId) REFERENCES PTIS.RateSectionMaster(RateSectionId);
GO
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT [FK_RateMaster_RateSectionMaster];
GO

ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT FK_RateMaster_AssessmentYearRangeMaster
FOREIGN KEY (YearRangeId) REFERENCES PTIS.AssessmentYearRangeMaster(YearRangeId);
GO
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT FK_RateMaster_AssessmentYearRangeMaster;
GO	


ALTER TABLE PTIS.RateMaster ADD CONSTRAINT UQ_RateMaster_TaxZone_Construction_UseGroup_Year_Section
UNIQUE (Year,TaxZoneId,ConstructionTypeId, TypeOfUseGroupId, YearRangeId, RateSectionId);
GO


/****** Object:  Table [PTIS].[MoujaMaster]******/
CREATE TABLE [PTIS].[MoujaMaster](
	[MoujaId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NOT NULL,
	[MoujaName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MoujaMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_MoujaMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_MoujaMaster] PRIMARY KEY CLUSTERED 	([MoujaId] ASC)	
)
GO
ALTER TABLE [PTIS].[MoujaMaster] ADD CONSTRAINT UQ_MoujaMaster_Year_MoujaName UNIQUE (Year, MoujaName);
GO

/****** Object:  Table [PTIS].[RateMasterForCV]******/

CREATE TABLE [PTIS].[RateMasterForCV](
	[RateMasterCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MoujaId] [int] NOT NULL,
	[SubZoneNo] [nvarchar](20) NOT NULL,
	[SubZoneName] [nvarchar](1000) NOT NULL,
	[CSN] [nvarchar](4000) NOT NULL,
	[OpenPlotRate] [money] NULL,
	[ResidentialRate] [money] NULL,
	[OfficeRate] [money] NULL,
	[ShopRate] [money] NULL,
	[IndustrialRate] [money] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateMasterForCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateMasterForCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RateMasterForCV] PRIMARY KEY CLUSTERED ([RateMasterCVId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[RateMasterForCV]  WITH CHECK ADD  CONSTRAINT [FK_RateMasterForCV_MoujaMaster] FOREIGN KEY([MoujaId])
REFERENCES [PTIS].[MoujaMaster] ([MoujaId])
GO
 
ALTER TABLE [PTIS].[RateMasterForCV] CHECK CONSTRAINT [FK_RateMasterForCV_MoujaMaster]
GO



/****** Object:  Table [PTIS].[RetentionFactorMaster] ******/
CREATE TABLE [PTIS].[RetentionFactorMaster](
	[RetentionFactorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionFactMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionFactMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionFactMaster] PRIMARY KEY CLUSTERED ([RetentionFactorId] ASC),
  CONSTRAINT UQ_RetentionFactorMaster_FactorValue UNIQUE (FactorValue)
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[RetentionPolicyFactorWiseMaster] ******/
CREATE TABLE [PTIS].[RetentionPolicyFactorWiseMaster](
	[RetentionPolicyFactorId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromFactor] [float] NULL,
	[ToFactor] [float] NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionPolicyFactWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionPolicyFactWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionPolicyFactWiseMaster] PRIMARY KEY CLUSTERED ([RetentionPolicyFactorId] ASC),
 CONSTRAINT UQ_RetentionPolicyFactorWiseMaster_FactorRange UNIQUE (FromFactor, ToFactor),
 CONSTRAINT CK_RetentionPolicyFactorWiseMaster_Range  CHECK (ToFactor >= FromFactor)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[RetentionPolicyYearWiseMaster]******/

CREATE TABLE [PTIS].[RetentionPolicyYearWiseMaster](
	[RetentionPolicyYearId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NULL,
	[ToYear] [int] NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionPolicyYearWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionPolicyYearWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionPolicyYearWiseMaster] PRIMARY KEY CLUSTERED ([RetentionPolicyYearId] ASC),
 CONSTRAINT UQ_RetentionPolicyYearWiseMaster_YearRange UNIQUE (FromYear, ToYear),
 CONSTRAINT CK_RetentionPolicyYearWiseMaster_Range  CHECK (ToYear >= FromYear)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SocietyPartitionNo]******/

CREATE TABLE [PTIS].[SocietyPartitionNo](
	[SocietyPartitionId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PartitionNo] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SocietyPartitionNo_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SocietyPartitionNo_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SocietyPartitionNo] PRIMARY KEY CLUSTERED ([SocietyPartitionId] ASC),
 CONSTRAINT [UQ_SocietyPartitionNo_PartitionNo] UNIQUE ([PartitionNo])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SubmissionRemarkMaster]******/

CREATE TABLE [PTIS].[SubmissionRemarkMaster](
	[SubmissionRemarkId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubmissionRemark] [nvarchar](200) NULL,
	[RemarkType] [nvarchar](200) NULL,
	[IsAreaRemark] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionRemarkMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionRemarkMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SubmissionRemarkMaster] PRIMARY KEY CLUSTERED ([SubmissionRemarkId] ASC),
 CONSTRAINT [UQ_SubmissionRemarkMaster_SubmissionRemark] UNIQUE ([SubmissionRemark])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SubmissionSameAsUserHistory]******/

CREATE TABLE [PTIS].[SubmissionSameAsUserHistory](
	[SubmissionHistoryId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CopyOn] [int] NULL,
	[SameAs] [int] NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionSameAsUserHistory_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
PRIMARY KEY CLUSTERED ([SubmissionHistoryId] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[TaxNameMaster]******/

CREATE TABLE [PTIS].[TaxNameMaster](
	[TaxNameId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxName] [nvarchar](100) NULL,
	[AliseName] [nvarchar](100) NULL,
	[Interest] [nvarchar](50) NULL,
	[ExcelAliasName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxNameMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxNameMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxNameMaster] PRIMARY KEY CLUSTERED ([TaxNameId] ASC),
 CONSTRAINT [UQ_TaxNameMaster_TaxName] UNIQUE ([TaxName])
) ON [PRIMARY]
GO
/****** Object:  Table [PTIS].[TaxPendingDetails]******/

CREATE TABLE [PTIS].[TaxPendingDetails](
	[TaxPendingId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PendingYear] [int] NULL,
	[RVorCVvalue] [money] NOT NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPendingDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetails] PRIMARY KEY CLUSTERED ([TaxPendingId] ASC),
 CONSTRAINT [UQ__TaxPendi__314945C924D2692A] UNIQUE NONCLUSTERED ([PropertyId] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [RVorCVvalue]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [StateEducationTax]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [TaxTotal]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [Penalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [GeneralTaxPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [StateEducationTaxPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [StateEmploymentTaxPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [BigBuildingPenalty]
GO

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  DEFAULT ((0)) FOR [NetTotal]
GO



ALTER TABLE [PTIS].[TaxPendingDetails]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetails] CHECK CONSTRAINT [FK_TaxPendingDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsArchive]******/

CREATE TABLE [PTIS].[TaxPendingDetailsArchive](
	[TaxPendingArchiveId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PendingYear] [int] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_TaxPendingDetailsArchive_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsArchive] PRIMARY KEY CLUSTERED ([TaxPendingArchiveId] ASC)
) ON [PRIMARY]
GO


ALTER TABLE [PTIS].[TaxPendingDetailsArchive]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsArchive_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsArchive] CHECK CONSTRAINT [FK_TaxPendingDetailsArchive_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsCV]******/

CREATE TABLE [PTIS].[TaxPendingDetailsCV](
	[TaxPendingCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PendingYear] [int] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPendingDetailsCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsCV] PRIMARY KEY CLUSTERED ([TaxPendingCVId] ASC),
 CONSTRAINT [UQ__TaxPendicv__314945C924D2692A] UNIQUE NONCLUSTERED ([PropertyId] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsCV]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsCV_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsCV] CHECK CONSTRAINT [FK_TaxPendingDetailsCV_PropertyMast_PropertyId]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsLookup]******/

CREATE TABLE [PTIS].[TaxPendingDetailsLookup](
	[TaxPendingLookupId] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PendingYear] [int] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPendingDetailsLookup_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsLookup] PRIMARY KEY CLUSTERED ([TaxPendingLookupId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsLookup]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsLookup_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsLookup] CHECK CONSTRAINT [FK_TaxPendingDetailsLookup_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsRetro]******/

CREATE TABLE [PTIS].[TaxPendingDetailsRetro](
	[TaxPendingRetroId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[YearId] [int] NULL,
	[PendingYear] [int] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_TaxPendingDetailsRetro_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsRetro] PRIMARY KEY CLUSTERED ([TaxPendingRetroId] ASC),
 CONSTRAINT [UQ__TaxPendiRetro__314945C924D2692A] UNIQUE NONCLUSTERED ([PropertyId] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO



ALTER TABLE [PTIS].[TaxPendingDetailsRetro]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsRetro_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRetro] CHECK CONSTRAINT [FK_TaxPendingDetailsRetro_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsRV]******/

CREATE TABLE [PTIS].[TaxPendingDetailsRV](
	[TaxPendingRVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[PendingYear] [int] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPendingDetailsRV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsRV] PRIMARY KEY CLUSTERED ([TaxPendingRVId] ASC),
 CONSTRAINT [UQ__TaxPendiRV__314945C924D2692A] UNIQUE NONCLUSTERED ([PropertyId] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRV]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsRV_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRV] CHECK CONSTRAINT [FK_TaxPendingDetailsRV_PropertyMast_PropertyId]
GO



/****** Object:  Table [PTIS].[TransMast]******/

CREATE TABLE [PTIS].[TransMast](
	[TransMastId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[YearId] [int] NULL,
	[RVorCV] [varchar](2) NOT NULL,
	[RVorCVvalue] [money] NOT NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMast_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TransMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMast] PRIMARY KEY CLUSTERED ([TransMastId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [RVorCVvalue]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [StateEducationTax]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [TreeCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [SpWaterCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [RoadCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [FireCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [LightCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [WaterBenefitCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [SewageDisposalCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [SpEducationTax]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [SanitationCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [DrainCess]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [WaterBill]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [BigBuilding]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [IllegalConstPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [UserCharges]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax1]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax2]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax3]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax4]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax5]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax6]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax7]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax8]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax9]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Tax10]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [TaxTotal]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [OldPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [Penalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [GeneralTaxPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [StateEducationTaxPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [StateEmploymentTaxPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [BigBuildingPenalty]
GO

ALTER TABLE [PTIS].[TransMast] ADD  DEFAULT ((0)) FOR [NetTotal]
GO

ALTER TABLE [PTIS].[TransMast] ADD  CONSTRAINT [DF_TransMast_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[TransMast]  WITH CHECK ADD  CONSTRAINT [FK_TransMast_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TransMast] CHECK CONSTRAINT [FK_TransMast_PropertyMast]
GO

ALTER TABLE [PTIS].[TransMast]  WITH CHECK ADD FOREIGN KEY([YearId])
REFERENCES [CORE].[YearMaster] ([YearId])
GO



CREATE NONCLUSTERED INDEX [Ind_NC_TR_1] 
ON [PTIS].[TransMast] ([PropertyId]);


CREATE NONCLUSTERED INDEX [Ind_NC_TR_2] 
ON [PTIS].[TransMast] ([YearId]) INCLUDE([PropertyId]);
GO
/****** Object:  Table [PTIS].[TransMastArchive]******/

CREATE TABLE [PTIS].[TransMastArchive](
	[TransMastArchiveId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[YearId] [int] NULL,
	[RVorCV] [varchar](2) NOT NULL,
	[RVorCVvalue] [money] NULL,
	[RateableValue] [money] NULL,
	[GeneralTax] [money] NULL,
	[StateEducationTax] [money] NULL,
	[StateEmploymentTax] [money] NULL,
	[TreeCess] [money] NULL,
	[SpWaterCess] [money] NULL,
	[RoadCess] [money] NULL,
	[FireCess] [money] NULL,
	[LightCess] [money] NULL,
	[WaterBenefitCess] [money] NULL,
	[SewageDisposalCess] [money] NULL,
	[SpEducationTax] [money] NULL,
	[SanitationCess] [money] NULL,
	[DrainCess] [money] NULL,
	[WaterBill] [money] NULL,
	[BigBuilding] [money] NULL,
	[IllegalConstPenalty] [money] NULL,
	[UserCharges] [money] NULL,
	[ServiceTax] [money] NULL,
	[Tax1] [money] NULL,
	[Tax2] [money] NULL,
	[Tax3] [money] NULL,
	[Tax4] [money] NULL,
	[Tax5] [money] NULL,
	[Tax6] [money] NULL,
	[Tax7] [money] NULL,
	[Tax8] [money] NULL,
	[Tax9] [money] NULL,
	[Tax10] [money] NULL,
	[TaxTotal] [money] NULL,
	[OldPenalty] [money] NULL,
	[Penalty] [money] NULL,
	[GeneralTaxPenalty] [money] NULL,
	[StateEducationTaxPenalty] [money] NULL,
	[StateEmploymentTaxPenalty] [money] NULL,
	[BigBuildingPenalty] [money] NULL,
	[NetTotal] [money] NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastArchive_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastArchive_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TransMastArchive_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMastArchive] PRIMARY KEY CLUSTERED ([TransMastArchiveId] ASC)
) ON [PRIMARY]
GO



ALTER TABLE [PTIS].[TransMastArchive]  WITH CHECK ADD  CONSTRAINT [FK_TransMastArchive_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TransMastArchive] CHECK CONSTRAINT [FK_TransMastArchive_PropertyMast]
GO

/****** Object:  Table [PTIS].[TransMastCV]******/

CREATE TABLE [PTIS].[TransMastCV](
	[TransMastCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[YearId] [int] NULL,
	[CapitalValue] [money] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastCV_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TransMastCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMastCV] PRIMARY KEY CLUSTERED ([TransMastCVId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastCV]  WITH CHECK ADD  CONSTRAINT [FK_TransMastCV_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TransMastCV] CHECK CONSTRAINT [FK_TransMastCV_PropertyMast_PropertyId]
GO

ALTER TABLE [PTIS].[TransMastCV] WITH CHECK ADD CONSTRAINT [FK_TransMastCV_YearMaster]
FOREIGN KEY([YearId]) REFERENCES [CORE].[YearMaster]([YearId]);
GO

ALTER TABLE [PTIS].[TransMastCV] CHECK CONSTRAINT [FK_TransMastCV_YearMaster];
GO

/****** Object:  Table [PTIS].[TransMastLookup]******/

CREATE TABLE [PTIS].[TransMastLookup](
	[TransMastLookupId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[YearId] [int] NULL,
	[RVorCV] [varchar](2) NOT NULL,
	[RVorCVvalue] [money] NULL,
	[RateableValue] [money] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastLookup_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastLookup_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TransMastLookup_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMastLookup] PRIMARY KEY CLUSTERED ([TransMastLookupId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastLookup]  WITH CHECK ADD  CONSTRAINT [FK_TransMastLookup_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TransMastLookup] CHECK CONSTRAINT [FK_TransMastLookup_PropertyMast]
GO
ALTER TABLE [PTIS].[TransMastLookup]  WITH CHECK ADD  CONSTRAINT [FK_TransMastLookup_YearMaster] FOREIGN KEY([YearId])
REFERENCES [CORE].[YearMaster] ([YearId])
GO

/****** Object:  Table [PTIS].[TransMastRV]******/

CREATE TABLE [PTIS].[TransMastRV](
	[TransMastRVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[YearId] [int] NULL,
	[RateableValue] [money] NULL,
	[GeneralTax] [money] NOT NULL,
	[StateEducationTax] [money] NOT NULL,
	[StateEmploymentTax] [money] NOT NULL,
	[TreeCess] [money] NOT NULL,
	[SpWaterCess] [money] NOT NULL,
	[RoadCess] [money] NOT NULL,
	[FireCess] [money] NOT NULL,
	[LightCess] [money] NOT NULL,
	[WaterBenefitCess] [money] NOT NULL,
	[SewageDisposalCess] [money] NOT NULL,
	[SpEducationTax] [money] NOT NULL,
	[SanitationCess] [money] NOT NULL,
	[DrainCess] [money] NOT NULL,
	[WaterBill] [money] NOT NULL,
	[BigBuilding] [money] NOT NULL,
	[IllegalConstPenalty] [money] NOT NULL,
	[UserCharges] [money] NOT NULL,
	[ServiceTax] [money] NOT NULL,
	[Tax1] [money] NOT NULL,
	[Tax2] [money] NOT NULL,
	[Tax3] [money] NOT NULL,
	[Tax4] [money] NOT NULL,
	[Tax5] [money] NOT NULL,
	[Tax6] [money] NOT NULL,
	[Tax7] [money] NOT NULL,
	[Tax8] [money] NOT NULL,
	[Tax9] [money] NOT NULL,
	[Tax10] [money] NOT NULL,
	[TaxTotal] [money] NOT NULL,
	[OldPenalty] [money] NOT NULL,
	[Penalty] [money] NOT NULL,
	[GeneralTaxPenalty] [money] NOT NULL,
	[StateEducationTaxPenalty] [money] NOT NULL,
	[StateEmploymentTaxPenalty] [money] NOT NULL,
	[BigBuildingPenalty] [money] NOT NULL,
	[NetTotal] [money] NOT NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastRV_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastRV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TransMastRV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMastRV] PRIMARY KEY CLUSTERED ([TransMastRVId] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastRV]  WITH CHECK ADD  CONSTRAINT [FK_TransMastRV_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([PropertyId])
GO

ALTER TABLE [PTIS].[TransMastRV] CHECK CONSTRAINT [FK_TransMastRV_PropertyMast_PropertyId]
GO

ALTER TABLE [PTIS].[TransMastRV] WITH CHECK ADD CONSTRAINT [FK_TransMastRV_YearMaster]
FOREIGN KEY([YearId]) REFERENCES [CORE].[YearMaster]([YearId])
GO

ALTER TABLE [PTIS].[TransMastRV] CHECK CONSTRAINT [FK_TransMastRV_YearMaster];
GO

/****** Object:  Table [PTIS].[TypeOfUsePrimeMaster]******/

CREATE TABLE [PTIS].[TypeOfUsePrimeMaster](
	[TypeOfUsePrimeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](5) NULL,
	[Description] [nvarchar](80) NULL,
	[TypeTaxableStaus] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUsePrimeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TypeOfUsePrimeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	

 CONSTRAINT [PK_TypeOfUsePrimeMaster] PRIMARY KEY CLUSTERED ([TypeOfUsePrimeId] ASC),
  CONSTRAINT [UQ_TypeOfUsePrimeMaster_Type] UNIQUE ([Type])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[UseFactorCVMaster]******/

CREATE TABLE [PTIS].[UseFactorCVMaster](
	[UseFactorCVId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[SubTypeOfUseId] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	[Code] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UseFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__UseFacto__3214EC27DFB51781] PRIMARY KEY CLUSTERED ([UseFactorCVId] ASC),
 CONSTRAINT UQ_UseFactorCVMaster_Type_SubType_Date UNIQUE (TypeOfUseId, SubTypeOfUseId, EffectiveFrom, EffectiveTo)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] ADD  CONSTRAINT [DF__UseFactor__Creat__76A18A26]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_UseFactorCVMaster_TypeOfUseMaster]
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] CHECK CONSTRAINT [FK_UseFactorCVMaster_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_UseFactorCVMaster_SubTypeOfUseMaster]
FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([SubTypeOfUseId]);
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] CHECK CONSTRAINT [FK_UseFactorCVMaster_SubTypeOfUseMaster];
GO
/****** Object:  Table [PTIS].[RoomWiseMinusData] ******/ 
CREATE TABLE [PTIS].[RoomWiseMinusData](
	[RoomWiseMinusId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RoomWiseSubmissionId] [int] NULL,
	[LengthMtr] [decimal](18, 2) NULL,
	[WidthMtr] [decimal](18, 2) NULL,
	[AreaSqMtr] [decimal](18, 2) NULL,
	[HeightMtr] [decimal](18, 2) NULL,
	[Base1Mtr] [decimal](18, 2) NULL,
	[Base2Mtr] [decimal](18, 2) NULL,
	[Shape] [nvarchar](25) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RoomWiseMinusData_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomWiseMinusData_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomWiseMinusData_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_RoomWiseMinusData] PRIMARY KEY CLUSTERED ( [RoomWiseMinusId] ASC )
) ON [PRIMARY]
GO	

ALTER TABLE [PTIS].[RoomWiseMinusData]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails] FOREIGN KEY([RoomWiseSubmissionId])
REFERENCES [PTIS].[RoomWiseSubmissionDetails] ([RoomWiseSubmissionId])
GO

ALTER TABLE [PTIS].[RoomWiseMinusData] CHECK CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails]
GO



/****** Object:  Table [PTIS].[RenterDetails] ******/
CREATE TABLE [PTIS].[RenterDetails] (
    [RenterDetailId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyDetailsId] [INT] NOT NULL,
    [AgreementId] [Nvarchar](25) NULL, 
    [IncrementFrequency] [NVARCHAR](35) NULL,
    [IncrementType] [NVARCHAR](35) NULL,
    [IncrementValue] [FLOAT] NULL,
    [IncrementMethod] [NVARCHAR](35) NULL,
    [DurationFrom] [DATETIME] NULL,
    [DurationTo] [DATETIME] NULL,
    [RentAmount] [FLOAT] NULL,
    [Increment] [Float] NULL, 
    [IncrementStatus] [bit] NULL,
    [RentMonthly] [float] null,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RenterDetails_MarkedForDeletion] DEFAULT (0),
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_RenterDetails_IsActive] DEFAULT (1),
    [CreatedBy] [INT] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RenterDetails_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] [INT] NULL,
    [UpdatedDate] [DATETIME] NULL,
	CONSTRAINT Pk_RenterDetails PRIMARY KEY CLUSTERED ([RenterDetailId] ASC	)
    );

GO

ALTER TABLE PTIS.RenterDetails  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_PropertyDetails] FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([PropertyDetailsId])
GO	
ALTER TABLE PTIS.RenterDetails CHECK CONSTRAINT [FK_RenterDetails_PropertyDetails]
GO	



/****** Object:  Table [PTIS].[RenterMast] ******/
CREATE TABLE  [PTIS].[RenterMast] (
    [RenterId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyDetailsId] [INT] NOT NULL,
    [FinalRent] [float] NULL,
    [FinancialYear] [nvarchar](4) NULL,
    [DurationFrom] [DATETIME] NULL,
    [DurationTo] [DATETIME] NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RenterMast_MarkedForDeletion] DEFAULT (0),
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_RenterMast_IsActive] DEFAULT (1),
    [CreatedBy] [INT] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RenterMast_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] [INT] NULL,
    [UpdatedDate] [DATETIME] NULL,
	CONSTRAINT Pk_RenterMast PRIMARY KEY CLUSTERED ([RenterId] ASC)
) ON [PRIMARY]

GO
ALTER TABLE PTIS.RenterMast  WITH CHECK ADD  CONSTRAINT [FK_RenterMast_PropertyDetails] FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([PropertyDetailsId])
GO	
ALTER TABLE PTIS.RenterMast CHECK CONSTRAINT [FK_RenterMast_PropertyDetails]
GO



----------- Master For Global Survey App ----Start----------
GO


GO
/****** Object:  Table [PTIS].[GenderMaster] ******/
CREATE TABLE [PTIS].[GenderMaster](
	[GenderId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GenderName] NVARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_GenderMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_GenderMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT UQ_GenderMaster_GenderName UNIQUE ([GenderName]),
 	CONSTRAINT [PK_GenderMaster] PRIMARY KEY CLUSTERED ( [GenderId] ASC )
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[DocumentMaster] ******/
CREATE TABLE [PTIS].[DocumentMaster](
	[DocumentId] [int] IDENTITY(1,1) not FOR REPLICATION NOT NULL,
	[DocumentName] [nvarchar](100) NOT null, 
	[DocPrefix] [varchar](50) not null, 
	[IsActive] BIT NOT NULl CONSTRAINT DF_documentmaster_IsActive DEFAULT (1),
	[CreatedBy] [int] null,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_documentmaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] null,
	[UpdatedDate] [datetime] null,
PRIMARY KEY CLUSTERED ([DocumentId] ASC),
CONSTRAINT UQ_DocumentMaster_DocumentName UNIQUE (DocumentName)
) ON [primary]
GO

/****** Object:  Table [PTIS].[PropertyVisitMeasurementMaster] ******/
CREATE TABLE [PTIS].[PropertyVisitMeasurementMaster](
	[PropertyVisitMeasurementId] int NOT NULL IDENTITY(1,1) NOT FOR REPLICATION,
	[PropertyVisitAndMeasurement] [nvarchar](200) NULL,
	[BillAcceptStatus] [varchar](20) NULL,
	[Remark] [varchar](100) NULL,
	[Flag] [varchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_PropertyVisitMeasurementMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyVisitMeasurement_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	PRIMARY KEY CLUSTERED ([PropertyVisitMeasurementId] ASC ),
	CONSTRAINT UQ_PropertyVisitMeasurementMaster_PropertyVisitAndMeasurement  UNIQUE (PropertyVisitAndMeasurement)
) ON [PRIMARY]
GO

GO
/****** Object:  Table [PTIS].[MobileScreenValidationMaster] ******/
CREATE TABLE [PTIS].[MobileScreenValidationMaster](
	[MobileScreenId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TabScreenName] [varchar](500) NULL,
	[Flag] [nvarchar](30) NULL,
	[Alias] [nvarchar](200) NULL,
	[DefaultSequenceNo] [int] NULL,
	[DefaultNumberingAccess] [bit] NULL,
	[DefaultSurveyAccess] [bit] NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_MobileScreenValidationMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_MobileScreenValidationMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TabScreenMaster] PRIMARY KEY CLUSTERED  (	[MobileScreenId] ASC ),
 CONSTRAINT UQ_MobileScreenValidationMaster_TabScreenName_Flag UNIQUE (TabScreenName, Flag)
) ON [PRIMARY]
 

GO
/****** Object:  Table [PTIS].[BlockMaster] ******/
CREATE TABLE [PTIS].[BlockMaster](
	[BlockId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardId] int NULL,
	[BlockNo] [nvarchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_BlockMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BlockMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BlockMaster] PRIMARY KEY CLUSTERED  ([BlockId] ASC),
 CONSTRAINT UQ_BlockMaster_Ward_BlockNo  UNIQUE (WardId, BlockNo),
 CONSTRAINT [FK_BlockMaster_WardMaster] FOREIGN KEY ([WardId]) REFERENCES [PTIS].[WardMaster]([WardId])
) ON [PRIMARY]
GO
----------- Master For Global Survey App ----End----------



CREATE TABLE [PTIS].[RuleMaster]
(
    [RuleId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RuleCode] NVARCHAR(50) NOT NULL,
    [Category] NVARCHAR(50) NOT NULL,
    [DisplayName] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(500) NULL,
    [DataType] NVARCHAR(20) NOT NULL CONSTRAINT [DF_RuleMaster_DataType] DEFAULT (N'bit'),
    [DefaultValue] NVARCHAR(50) NULL, 
    [IsActive] BIT NOT NULL CONSTRAINT [DF_RuleMaster_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL, 
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_RuleMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,  
    CONSTRAINT [PK_RuleMaster] PRIMARY KEY CLUSTERED ([RuleId] ASC),
	CONSTRAINT UQ_RuleMaster_RuleCode  UNIQUE ([RuleCode])
);
GO

