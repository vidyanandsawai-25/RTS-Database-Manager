CREATE TABLE [PTIS].[ZoneMaster](

	[ZoneNo] [nvarchar](10) NOT NULL,

	[Description] [nvarchar](100)  NULL,

	-- [DescriptionEnglish] [nvarchar](100) NULL,

	[SequenceNo] int null,

	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ZoneMaster_IsActive] DEFAULT (1),

	[CreatedBy] [int] NULL,

	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_ZoneMaster_CreatedDate DEFAULT (GETDATE()),

	[UpdatedBy] [int] NULL,

	[UpdatedDate] [datetime] NULL,

	CONSTRAINT [PK_ZoneMaster] PRIMARY KEY CLUSTERED ([ZoneNo] ASC)


) ON [PRIMARY]




CREATE TABLE [PTIS].[WardMaster](

	[WardNo] [nvarchar](10) NOT NULL,

	[Description] [nvarchar] (100)  NULL,

	-- [DescriptionEnglish] [nvarchar](100) NULL,

	[ZoneNo] [nvarchar](10) NOT NULL,
	
	[SequenceNo] int null,

	[IsActive] [bit] NOT NULL CONSTRAINT [DF_WardMaster_IsActive] DEFAULT (1),

	[CreatedBy] [int] NULL,

	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_WardMaster_CreatedDate DEFAULT (GETDATE()),

	[UpdatedBy] [int] NULL,

	[UpdatedDate] [datetime] NULL,

	CONSTRAINT [PK_WardMaster] PRIMARY KEY CLUSTERED ([WardNo] ASC)

) ON [PRIMARY]

ALTER TABLE [PTIS].[WardMaster]  WITH CHECK ADD  CONSTRAINT [FK_WardMaster_ZoneMaster]
FOREIGN KEY([ZoneNo]) REFERENCES [PTIS].[ZoneMaster] ([ZoneNo])
GO
ALTER TABLE [PTIS].[WardMaster] CHECK CONSTRAINT [FK_WardMaster_ZoneMaster]
GO	






/****** Object:  Table [PTIS].[OwnerTypeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[OwnerTypeMaster](
	[OwnerType] [nvarchar](30) NOT NULL,
	-- [OwnerTypeEnglish] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_OwnerTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_OwnerTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OwnerTypeMaster] PRIMARY KEY CLUSTERED ([OwnerType] ASC)
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[PropertyTypeCategoryMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyTypeCategoryMaster](
	[PropertyTypeCategoryID] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeCategory] [nvarchar](100) NULL,
	-- [PropertyTypeCategoryEnglish] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeCategoryMaster] PRIMARY KEY CLUSTERED ([PropertyTypeCategoryID] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[PropertyTypeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyTypeMaster](
	[PropertyTypeID] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyDescription] [nvarchar](100) NULL,
	-- [PropertyDescriptionEnglish] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[PropertyTypeGroup] [nvarchar](50) NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[PropertyTypeCategoryID] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeMaster] PRIMARY KEY CLUSTERED ([PropertyTypeID] ASC)
)
ALTER TABLE [PTIS].[PropertyTypeMaster] WITH CHECK ADD CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster]
FOREIGN KEY ([PropertyTypeCategoryID]) REFERENCES [PTIS].[PropertyTypeCategoryMaster]([PropertyTypeCategoryID]);
GO
ALTER TABLE [PTIS].[PropertyTypeMaster] CHECK CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster];
GO




/****** Object:  Table [PTIS].[CategoryMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[CategoryMaster](
	[CategoryID] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[SubCategoryName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_CategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
)

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


CREATE TABLE [PTIS].[SocietyDetailsMast](
	[SocietyID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WingName] [nvarchar](30) NULL,
	[WingID] [int] NULL,
	[BHKType] [nvarchar](20) NULL,
	[SecretoryName] [nvarchar](200) NULL,
	[SocietyName] [nvarchar](500) NULL,
	[ManagerName] [nvarchar](200) NULL,
	[SecretoryNameEnglish] [nvarchar](200) NULL,
	[SocietyNameEnglish] [nvarchar](500) NULL,
	[ManagerNameEnglish] [nvarchar](200) NULL,
	[ManagerMobileNo] [varchar](13) NULL,
	[SecretaryMobileNo] [varchar](13) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SocietyDetailsMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SocietyDetailsMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SocietyDetailsMaster] PRIMARY KEY CLUSTERED ([SocietyID] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[PropertyMast]******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PTIS].[PropertyMast](
	[OwnerID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxZone] [nvarchar](10) NULL,
	[WardNo] [nvarchar](10) NULL,
	[PropertyNo] [nvarchar](10) NULL,
	[PartitionNo] [nvarchar](10) NULL,
	[PropertyTypeID] [int] NULL,
	[UPICID] [nvarchar](30) NULL,
	[OpenPlot] [bit] NULL,
	[CSN] [nvarchar](30) NULL,
	[SubZoneNo] [nvarchar](20) NULL,
	[PlotNo] [nvarchar](20) NULL,
	[CategoryID] [int] NULL,
	[Type] [varchar](5) NULL,
	[PartType] [nvarchar](20) NULL,
	[OwnerTitle] [nvarchar](10) NULL,
	[OwnerName] [nvarchar](1000) NULL,
	[OccupierTitle] [nvarchar](10) NULL,
	[OccupierName] [nvarchar](1000) NULL,
	[FlatOrShopNo] [nvarchar](100) NULL,
	[FlatOrShopName] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Location] [nvarchar](200) NULL,
	[MobileNo] [varchar](13) NULL,
	[EmailId] [nvarchar](100) NULL,
	[SocietyID] [int] NULL,
	[OwnerTitleEnglish] [nvarchar](10) NULL,
	[OwnerNameEnglish] [nvarchar](1000) NULL,
	[OccupierTitleEnglish] [varchar](10) NULL,
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
	
 CONSTRAINT [PK_PropertyMast] PRIMARY KEY CLUSTERED ([OwnerID] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyMast] WITH CHECK ADD CONSTRAINT [FK_PropertyMast_PropertyTypeMaster]
FOREIGN KEY([PropertyTypeID]) REFERENCES [PTIS].[PropertyTypeMaster]([PropertyTypeID]);
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_PropertyTypeMaster];
GO

-- alter table [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_OwnerTypeMaster] FOREIGN KEY([OwnerType])
-- REFERENCES [PTIS].[OwnerTypeMaster] ([OwnerType])	
-- GO
-- ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_OwnerTypeMaster]

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_CategoryMaster] FOREIGN KEY([CategoryID])
REFERENCES [PTIS].[CategoryMaster] ([CategoryID])
GO	
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_CategoryMaster]
GO


-- ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_SubCategory] FOREIGN KEY([SubCategory])
-- REFERENCES [PTIS].[SubCategory] ([SubCategory])
-- GO
-- ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_SubCategory]
-- GO


ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_WardMaster] FOREIGN KEY([WardNo])
REFERENCES [PTIS].[WardMaster] ([WardNo])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_WardMaster]
GO




CREATE UNIQUE NONCLUSTERED INDEX [UX_PropertyMast_UPICID_NotNull]
ON [PTIS].[PropertyMast]([UPICID] ASC)
WHERE [UPICID] IS NOT NULL;
GO
CREATE NONCLUSTERED INDEX [Ind_Category] ON [PTIS].[PropertyMast]
(
	[WardNo] ASC,
	[PropertyNo] ASC,
	[PartitionNo] ASC
)
INCLUDE([CategoryID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[FloorMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[FloorMaster](
	[FloorID] nvarchar(5) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	-- [DescriptionEnglish] [nvarchar](100) NULL,
	[SequenceNo] [int] NULL,
	[MaxFloorNo] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_FloorMaster] PRIMARY KEY CLUSTERED ([FloorID] ASC),
  CONSTRAINT [UQ_FloorMaster_Description] UNIQUE ([Description])
);

/****** Object:  Table [PTIS].[ConstructionTypeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ConstructionTypeMaster](
	[ConstructionId] [varchar](7) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	-- [DescriptionEnglish] [nvarchar](100) NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConstructionTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConstructionTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConstructionTypeMaster] PRIMARY KEY CLUSTERED ([ConstructionId] ASC),
 CONSTRAINT [UQ_ConstructionTypeMaster_Description] UNIQUE ([Description])
  );
GO



/****** Object:  Table [PTIS].[TypeOfUseGroupMaster]******/

CREATE TABLE [PTIS].[TypeOfUseGroupMaster](
	[TypeOfUseGroupId]  [varchar](10) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
    [GroupIcon] [nvarchar](50) NOT NULL,
	-- [GroupNameEnglish] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseGroupMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_TypeOfUseGroupMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_TypeOfUseGroupMaster] PRIMARY KEY CLUSTERED ([TypeOfUseGroupID] ASC),
    CONSTRAINT [UQ_TypeOfUseGroupMaster] UNIQUE ([GroupName])
  )


/****** Object:  Table [PTIS].[TypeOfUseMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TypeOfUseMaster](
	[TypeOfUseId] [varchar](10) NOT NULL,
	[Description] [nvarchar](100) NULL,
	-- [DescriptionEnglish] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[TypeOfUseGroupId] [varchar](10) NULL,
	[SearchKey] [nvarchar](20) NULL,
	[SearchSequence] [int] NULL,
	[IsSociety] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TypeOfUseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TypeOfUseMaster] PRIMARY KEY CLUSTERED ([TypeOfUseId] ASC),
 CONSTRAINT [UQ_TypeOfUseMaster_Description] UNIQUE ([Description])
)
GO
alter table [PTIS].[TypeOfUseMaster]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster] FOREIGN KEY([TypeOfUseGroupID])	
REFERENCES [PTIS].[TypeOfUseGroupMaster] ([TypeOfUseGroupID])
GO
ALTER TABLE [PTIS].[TypeOfUseMaster] CHECK CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster]
GO



/****** Object:  Table [PTIS].[SubTypeOfUseMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[SubTypeOfUseMaster](
	[SubTypeOfUseId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [nvarchar](80) NULL,
	[TypeOfUseId] [varchar](10) NOT NULL,
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


/****** Object:  Table [PTIS].[RateSectionMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateSectionMaster](
	[RateSectionNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](80) NULL,
	-- [DescriptionEnglish] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateSectionMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_RateSectionMaster] PRIMARY KEY CLUSTERED ([RateSectionNo] ASC)
)




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
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[SubFloorMaster](
	[SubFloorId] [nvarchar](10) NOT NULL,
	[SubFloorDescription] [nvarchar](200) NULL,
	-- [SubFloorDescriptionEnglish] [nvarchar](200) NULL,
	[SubFloorPercentage] [money] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubFloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubFloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_SubFloorMaster] PRIMARY KEY CLUSTERED ([SubFloorId] ASC)
)
GO

/****** Object:  Table [PTIS].[YearMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[YearMaster](
	[Year] int NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_YearMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_YearMaster] PRIMARY KEY CLUSTERED ([Year] ASC)
)

/****** Object:  Table [PTIS].[PropertyDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FloorID] nvarchar(5) NOT NULL,
	[SubFloorID] [nvarchar](10) NULL,
	[ConstructionYear] [varchar](4) NULL,
	[AssessmentYear] [nvarchar](4) NULL,
	[ConstructionId] [varchar](7) NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[CarpetAreaSqMeter] [float] NULL,
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
	[BuiltupAreaSqFeet] [float] NULL,
	[BuiltupAreaSqMeter] [float] NULL,
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
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_PropertyMast] 
FOREIGN KEY([OwnerID]) REFERENCES [PTIS].[PropertyMast]([OwnerID]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_SubFloorMaster] 
FOREIGN KEY([SubFloorID]) REFERENCES [PTIS].[SubFloorMaster]([SubFloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster] 
FOREIGN KEY([ConstructionId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionId]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_FloorMaster] 
FOREIGN KEY([FloorID]) REFERENCES [PTIS].[FloorMaster]([FloorID]);
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



/****** Object:  Table [PTIS].[PropertyDetailsReassesment]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyDetailsReassesment](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FloorID] nvarchar(5) NOT NULL,
	[SubFloorID] [nvarchar](10) NULL,
	[ConstructionYear] [varchar](4) NULL,
	[AssessmentYear] [nvarchar](4) NULL,
	[ConstructionId] [varchar](7) NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[CarpetAreaSqMeter] [float] NULL,
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
	[BuiltupAreaSqFeet] [float] NULL,
	[BuiltupAreaSqMeter] [float] NULL,
	[TaxLiability] [nvarchar](20) NULL,
	[IsTaxable] [bit] NULL,
	[OccupancyDate] [datetime] NULL,
	[OccupancyApplyOrNot] [bit] NULL,
	[OccupancyNumber] [varchar](30) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsReassesment_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsReassesment_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetailsReassesment_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyDetailsReassesment] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_PropertyMast] FOREIGN KEY([OwnerID]) REFERENCES [PTIS].[PropertyMast]([OwnerID]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_SubFloorMaster] FOREIGN KEY([SubFloorID]) REFERENCES [PTIS].[SubFloorMaster]([SubFloorId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_ConstructionTypeMaster] FOREIGN KEY([ConstructionId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_FloorMaster] FOREIGN KEY([FloorID]) REFERENCES [PTIS].[FloorMaster]([FloorID]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_FloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_TypeOfUseMaster] FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassesment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassesment_SubTypeOfUseMaster] FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([SubTypeOfUseId]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassesment] CHECK CONSTRAINT [FK_PropertyDetailsReassesment_SubTypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[ActiveTaxesMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ActiveTaxesMaster](
	[TaxNameID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxName] [nvarchar](200) NULL,
	[TaxNameAlias] [nvarchar](200) NULL,
	[DisplayOrder] [int] NULL,
	[TaxOnUnit] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_TaxOnUnit] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ActiveTaxesMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_ActiveTaxesMaster] PRIMARY KEY CLUSTERED ([TaxNameID] ASC)
)


/****** Object:  Table [PTIS].[AgeFactorCVMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[AgeFactorCVMaster](
	[ConstructionId] [varchar](7) NOT NULL,
	[AgeFrom] [int] NOT NULL,
	[AgeTo] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	
	[Code] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AgeFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AgeFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_AgeFactorCVMaster] PRIMARY KEY CLUSTERED (
		[ConstructionId] ASC,
		[AgeFrom] ASC,
		[AgeTo] ASC,
		[EffectiveFrom] ASC
	)
)

ALTER TABLE [PTIS].[AgeFactorCVMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster] FOREIGN KEY([ConstructionId])
REFERENCES [PTIS].[ConstructionTypeMaster] ([ConstructionId])
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster] CHECK CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster]
GO

/****** Object:  Table [PTIS].[AppealMast]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[AppealMast](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[PolicyRemark] [nvarchar](10) NULL,
	[AppealDate] [datetime] NULL,
	[AppealYear] [smallint] NULL,
	[AppealReason] [nvarchar](20) NULL,
	[AppealRVorCVvalue] [money] NULL,
	[AppealGeneralTax] [money] NULL,
	[AppealTreeCess] [money] NULL,
	[AppealStateEducationTax] [money] NULL,
	[AppealStateEmploymentTax] [money] NULL,
	[AppealSpEducationTax] [money] NULL,
	[AppealSanitationCess] [money] NULL,
	[AppealDrainCess] [money] NULL,
	[AppealSpWaterCess] [money] NULL,
	[AppealRoadCess] [money] NULL,
	[AppealFireCess] [money] NULL,
	[AppealLightCess] [money] NULL,
	[AppealWaterBenefitCess] [money] NULL,
	[AppealBigBuilding] [money] NULL,
	[AppealSewageDisposalCess] [money] NULL,
	[AppealWaterBill] [money] NULL,
	[AppealIllegalConstPenalty] [money] NULL,
	[AppealUserCharges] [money] NULL,
	[AppealServiceTax] [money] NULL,
	[AppealTax1] [money] NULL,
	[AppealTax2] [money] NULL,
	[AppealTax3] [money] NULL,
	[AppealTax4] [money] NULL,
	[AppealTax5] [money] NULL,
	[AppealTax6] [money] NULL,
	[AppealTax7] [money] NULL,
	[AppealTax8] [money] NULL,
	[AppealTax9] [money] NULL,
	[AppealTax10] [money] NULL,
	[HearingDate] [datetime] NULL,
	[HearingYear] [smallint] NULL,
	[HearingReason] [nvarchar](20) NULL,
	[HearingRVorCVvalue] [money] NULL,
	[HearingGeneralTax] [money] NULL,
	[HearingTreeCess] [money] NULL,
	[HearingStateEducationTax] [money] NULL,
	[HearingStateEmploymentTax] [money] NULL,
	[HearingSpEducationTax] [money] NULL,
	[HearingSanitationCess] [money] NULL,
	[HearingDrainCess] [money] NULL,
	[HearingSpWaterCess] [money] NULL,
	[HearingRoadCess] [money] NULL,
	[HearingFireCess] [money] NULL,
	[HearingLightCess] [money] NULL,
	[HearingWaterBenefitCess] [money] NULL,
	[HearingBigBuilding] [money] NULL,
	[HearingSewageDisposalCess] [money] NULL,
	[HearingIllegalConstPenalty] [money] NULL,
	[HearingUserCharges] [money] NULL,
	[HearingServiceTax] [money] NULL,
	[HearingTax1] [money] NULL,
	[HearingTax2] [money] NULL,
	[HearingTax3] [money] NULL,
	[HearingTax4] [money] NULL,
	[HearingTax5] [money] NULL,
	[HearingTax6] [money] NULL,
	[HearingTax7] [money] NULL,
	[HearingTax8] [money] NULL,
	[HearingTax9] [money] NULL,
	[HearingTax10] [money] NULL,
	[AppealCommitteeDate] [datetime] NULL,
	[AppealCommitteeYear] [smallint] NULL,
	[AppealCommitteeReason] [nvarchar](20) NULL,
	[AppealCommitteeRVorCVvalue] [money] NULL,
	[AppealCommitteeGeneralTax] [money] NULL,
	[AppealCommitteeTreeCess] [money] NULL,
	[AppealCommitteeStateEducationTax] [money] NULL,
	[AppealCommitteeStateEmploymentTax] [money] NULL,
	[AppealCommitteeSpEducationTax] [money] NULL,
	[AppealCommitteeSanitationCess] [money] NULL,
	[AppealCommitteeDrainCess] [money] NULL,
	[AppealCommitteeSpWaterCess] [money] NULL,
	[AppealCommitteeRoadCess] [money] NULL,
	[AppealCommitteeFireCess] [money] NULL,
	[AppealCommitteeLightCess] [money] NULL,
	[AppealCommitteeWaterBenefitCess] [money] NULL,
	[AppealCommitteeBigBuilding] [money] NULL,
	[AppealCommitteeSewageDisposalCess] [money] NULL,
	[AppealCommitteeIllegalConstPenalty] [money] NULL,
	[AppealCommitteeUserCharges] [money] NULL,
	[AppealCommitteeServiceTax] [money] NULL,
	[AppealCommitteeTax1] [money] NULL,
	[AppealCommitteeTax2] [money] NULL,
	[AppealCommitteeTax3] [money] NULL,
	[AppealCommitteeTax4] [money] NULL,
	[AppealCommitteeTax5] [money] NULL,
	[AppealCommitteeTax6] [money] NULL,
	[AppealCommitteeTax7] [money] NULL,
	[AppealCommitteeTax8] [money] NULL,
	[AppealCommitteeTax9] [money] NULL,
	[AppealCommitteeTax10] [money] NULL,
	[RemissionDate] [datetime] NULL,
	[RemissionYear] [smallint] NULL,
	[RemissionReason] [nvarchar](20) NULL,
	[RemissionRVorCVvalue] [money] NULL,
	[RemissionGeneralTax] [money] NULL,
	[RemissionTreeCess] [money] NULL,
	[RemissionStateEducationTax] [money] NULL,
	[RemissionStateEmploymentTax] [money] NULL,
	[RemissionSpEducationTax] [money] NULL,
	[RemissionSanitationCess] [money] NULL,
	[RemissionDrainCess] [money] NULL,
	[RemissionSpWaterCess] [money] NULL,
	[RemissionRoadCess] [money] NULL,
	[RemissionFireCess] [money] NULL,
	[RemissionLightCess] [money] NULL,
	[RemissionWaterBenefitCess] [money] NULL,
	[RemissionBigBuilding] [money] NULL,
	[RemissionSewageDisposalCess] [money] NULL,
	[RemissionIllegalConstPenalty] [money] NULL,
	[RemissionUserCharges] [money] NULL,
	[RemissionServiceTax] [money] NULL,
	[RemissionTax1] [money] NULL,
	[RemissionTax2] [money] NULL,
	[RemissionTax3] [money] NULL,
	[RemissionTax4] [money] NULL,
	[RemissionTax5] [money] NULL,
	[RemissionTax6] [money] NULL,
	[RemissionTax7] [money] NULL,
	[RemissionTax8] [money] NULL,
	[RemissionTax9] [money] NULL,
	[RemissionTax10] [money] NULL,
	[ResidentialRV] [int] NULL,
	[CommercialRV] [int] NULL,
	[ResidentialCV] [int] NULL,
	[CommercialCV] [int] NULL,
	[AppealUpdatedBy] [int] NULL,
	[AppealCreatedBy] [int] NULL,
	[AppealCreatedDate] [datetime] NULL,
	[AppealUpdatedDate] [datetime] NULL,
	[HearingUpdatedBy] [int] NULL,
	[HearingCreatedBy] [int] NULL,
	[HearingCreatedDate] [datetime] NULL,
	[HearingUpdatedDate] [datetime] NULL,
	[AppealCommitteeUpdatedBy] [int] NULL,
	[AppealCommitteeCreatedBy] [int] NULL,
	[AppealCommitteeCreatedDate] [datetime] NULL,
	[AppealCommitteeUpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_AppealMast_MarkedForDeletion] DEFAULT (0),
	[RemissionUpdatedBy] [int] NULL,
	[RemissionCreatedBy] [int] NULL,
	[RemissionCreatedDate] [datetime] NULL,
	[RemissionUpdatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AppealMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AppealMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_AppealMast] PRIMARY KEY CLUSTERED   ([Id] 	ASC)
 )

ALTER TABLE [PTIS].[AppealMast]  WITH CHECK ADD  CONSTRAINT [FK_AppealMast_PropertyMast_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[AppealMast] CHECK CONSTRAINT [FK_AppealMast_PropertyMast_OwnerID]
GO


/****** Object:  Table [PTIS].[ApplyTaxesMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ApplyTaxesMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
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
CONSTRAINT [PK_ApplyTaxesMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
)

ALTER TABLE [PTIS].[ApplyTaxesMaster] ADD  CONSTRAINT [DF_ApplyTaxesMaster_IsTaxForPlot]  DEFAULT ((0)) FOR [IsTaxForPlot]
GO

ALTER TABLE [PTIS].[ApplyTaxesMaster] ADD  CONSTRAINT [DF_ApplyTaxesMaster_IsPolicyApplicable]  DEFAULT ((0)) FOR [IsPolicyApplicable]
GO


ALTER TABLE [PTIS].[ApplyTaxesMaster]  WITH CHECK ADD  CONSTRAINT [FK_ApplyTaxesMaster_PropertyMast_OwnerID] 
FOREIGN KEY([OwnerID]) REFERENCES [PTIS].[PropertyMast] ([OwnerID])	
GO
ALTER TABLE [PTIS].[ApplyTaxesMaster] CHECK CONSTRAINT [FK_ApplyTaxesMaster_PropertyMast_OwnerID]
GO



/****** Object:  Table [PTIS].[ApplyTaxesMasterPrime]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ApplyTaxesMasterPrime](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[Type] [varchar](5) NULL,
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
	[Interest] [bit] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMasterPrime_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ApplyTaxesMasterPrime_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ApplyTaxesMasterPrime] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[ApplyTaxesMasterPrime] WITH CHECK ADD CONSTRAINT [FK_ApplyTaxesMasterPrime_TypeOfUseMaster]
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO

ALTER TABLE [PTIS].[ApplyTaxesMasterPrime] CHECK CONSTRAINT [FK_ApplyTaxesMasterPrime_TypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[AssessmentMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[AssessmentMaster](
	[AssessmentID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[CouncilID] [int] NULL,
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
 CONSTRAINT [PK_AssessmentMaster] PRIMARY KEY CLUSTERED ([AssessmentID] ASC)
) ON [PRIMARY] 
GO


/****** Object:  Table [PTIS].[BillBookMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[BillBookMaster](
	[Id] [int] NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[BillBookNo] [nvarchar](50) NULL,
	[ReceiptNoFrom] [int] NULL,
	[ReceiptNoTo] [int] NULL,
	[Date] [datetime] NULL,
	[Remark] [nvarchar](20) NULL,
	[BookDescription] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[EmpID] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BillBookMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BillBookMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BillBookMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
/****** Object:  Table [PTIS].[BillTransactionDetails]******/
CREATE TABLE [PTIS].[BillTransactionDetails](
	[BilltransactionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[BillbookNo] [nvarchar](50) NULL,
	[InvoiceNo] [int] NULL,
	[BillNo] [nvarchar](50) NULL,
	[BillDate] [date] NULL,
	[TransactionDate] [datetime] NULL,
	[FinanceYear] [int] NULL,
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
	[SocietyPaymentID] [nvarchar](20) NULL,
	[BehalfPayerName] [nvarchar](50) NULL,
	[DebitRefID] [nvarchar](20) NULL,
	[ClearingDate] [datetime] NULL,
	[ChequeStatus] [varchar](20) NULL,
	[DDChequeDate] [date] NULL,
	[DDChequeNo] [nvarchar](20) NULL,
	[ExpiryDate] [date] NULL,
	[EmpID] [int] NULL,
	[UserID] [int] NULL,
	[CFCID] [int] NULL,
	[CashierUserID] [int] NULL,
	[TaxPayerName] [nvarchar](1000) NULL,
	[OccupierName] [nvarchar](1000) NULL,
	[FromYear] [int] NULL,
	[ToYear] [int] NULL,
	[IsPayFromSMSurl] [bit] NULL,
	[GlobalReceiptNo] [nvarchar](50) NULL,
	[CounterReceiptNo] [nvarchar](500) NULL,
	[GlobalID] [int] NULL,
	[StampCount] [int] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDetails_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_BillTransactionDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BillTransactionDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__BillTransactionDetails] PRIMARY KEY CLUSTERED ([BilltransactionID] ASC)
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

ALTER TABLE [PTIS].[BillTransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[BillTransactionDetails] CHECK CONSTRAINT [FK_BillTransactionDetails_PropertyMast]
GO




CREATE TABLE [PTIS].[BillTransactionDiscountDetails](
	[BilltransactionDiscountID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BilltransactionID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
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
PRIMARY KEY CLUSTERED ([BilltransactionDiscountID] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDiscountDetails_BillTransactionDetails] FOREIGN KEY([BilltransactionID])
REFERENCES [PTIS].[BillTransactionDetails] ([BilltransactionID])
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails] CHECK CONSTRAINT [FK_BillTransactionDiscountDetails_BillTransactionDetails]
GO

ALTER TABLE [PTIS].[BillTransactionDiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillTransactionDiscountDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
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


/****** Object:  Table [PTIS].[TaxPercentageMasterCV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPercentageMasterCV](
    [Id] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [TypeOfUseId] varchar(10) NOT NULL,
    [Description] nvarchar(80) NOT NULL,
    [Type] varchar(5) NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
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
    [EffectiveFrom] date NOT NULL,
    [EffectiveTo] date NULL,
    [IsActive] bit NOT NULL DEFAULT 1,
    [CreatedBy] int NULL,
    [CreatedDate] datetime NOT NULL CONSTRAINT DF_TaxPercentageMasterCV_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] int NULL,
    [UpdatedDate] datetime NULL,

    CONSTRAINT [PK_TaxPercentageMasterCV] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_TaxPercentageMasterCV_Effective]  CHECK (EffectiveTo IS NULL OR EffectiveFrom <= EffectiveTo)
) ON [PRIMARY];
GO
ALTER TABLE PTIS.TaxPercentageMasterCV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterCV_TypeOfUseId FOREIGN KEY (TypeOfUseId)
REFERENCES PTIS.TypeOfUseMaster(TypeOfUseId);
GO
 ALTER TABLE PTIS.TaxPercentageMasterCV CHECK CONSTRAINT FK_TaxPercentageMasterCV_TypeOfUseId;
GO


ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

-- ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [StateEducationTax]
-- GO

-- ALTER TABLE [PTIS].[TaxPercentageMasterCV] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
-- GO
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
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPercentageMasterRV](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [varchar](10) NOT NULL,
	[Description] [nvarchar](80) NOT NULL,
	[Type] [varchar](5) NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
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
	[EffectiveFrom] [date] NULL,
	[EffectiveTo] [date] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPercentageMasterRV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxPercentageMasterRV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 
    CONSTRAINT [PK_TaxPercentageMasterRV] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_TaxPercentageMasterRV_Effective]  CHECK (EffectiveTo IS NULL OR EffectiveFrom <= EffectiveTo)
) ON [PRIMARY];
GO
ALTER TABLE PTIS.TaxPercentageMasterRV WITH CHECK ADD CONSTRAINT FK_TaxPercentageMasterRV_TypeOfUseId FOREIGN KEY (TypeOfUseId)
REFERENCES PTIS.TypeOfUseMaster(TypeOfUseId);
GO
 ALTER TABLE PTIS.TaxPercentageMasterRV CHECK CONSTRAINT FK_TaxPercentageMasterRV_TypeOfUseId;
GO


ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [GeneralTax]
GO

-- ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [StateEducationTax]
-- GO

-- ALTER TABLE [PTIS].[TaxPercentageMasterRV] ADD  DEFAULT ((0)) FOR [StateEmploymentTax]
-- GO

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

/****** Object:  Table [PTIS].[ConditionMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ConditionMaster](
	[ConditionID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorID] [nvarchar](500) NULL,
	[ConstructionId] [nvarchar](100) NULL,
	[PropType] [nvarchar](50) NULL,
	[TypeOfUseId] [nvarchar](600) NULL,
	[RatePercent] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConditionMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConditionMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConditionMaster] PRIMARY KEY CLUSTERED ([ConditionID] ASC)
) ON [PRIMARY] 
GO

/****** Object:  Table [PTIS].[ConditionMasterRates]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ConditionMasterRates](
	[RateID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorID] [nvarchar](10) NULL,
	[ConstructionId] [nvarchar](7) NULL,
	[PropType] [nvarchar](10) NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[RatePercent] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConditionMasterRates_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConditionMasterRates_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConditionMasterRates] PRIMARY KEY CLUSTERED ([RateID] ASC)
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[CustomDatabaseChangesParameter]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[CustomDatabaseChangesParameter](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
    CONSTRAINT [PK_CustomDatabaseChangesParameter] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY];
GO


/****** Object:  Table [PTIS].[DepreciationMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[DepreciationMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionId] [varchar](7) NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[Rate] [money] NULL,
	[Year] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_DepreciationMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_DepreciationMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_DepreciationMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[DepreciationMaster] WITH CHECK ADD CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionId]);
GO

ALTER TABLE [PTIS].[DepreciationMaster] CHECK CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster];
GO

/****** Object:  Table [PTIS].[EducationTaxMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[EducationTaxMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_EducationTaxMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[EmploymentTaxMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[EmploymentTaxMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_EmploymentTaxMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[FlagMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[FlagMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
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
 CONSTRAINT [PK_FlagMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
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

ALTER TABLE [PTIS].[FlagMaster]  WITH CHECK ADD  CONSTRAINT [FK_FlagMaster_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[FlagMaster] CHECK CONSTRAINT [FK_FlagMaster_PropertyMast]
GO

/****** Object:  Table [PTIS].[FloorFactorCVMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[FloorFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorID] [nvarchar](5) NOT NULL,
	[FactorWithLift] [decimal](5, 2) NULL,
	[FactorWithoutLift] [decimal](5, 2) NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,

	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FloorFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[FloorFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster]
FOREIGN KEY([FloorID]) REFERENCES [PTIS].[FloorMaster]([FloorID]);
GO

ALTER TABLE [PTIS].[FloorFactorCVMaster] CHECK CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster];
GO

/****** Object:  Table [PTIS].[RoomWiseSubmissionDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RoomWiseSubmissionDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[PDNId] [int] NULL,
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
 CONSTRAINT [PK_RoomWiseSubmissionDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH CHECK
ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyDetails]
FOREIGN KEY([PDNId])
REFERENCES [PTIS].[PropertyDetails] ([Id]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyDetails];
GO

ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH CHECK
ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast]
FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast];
GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster]
-- FOREIGN KEY([ConstructionId])
-- REFERENCES [PTIS].[ConstructionTypeMaster] ([ConstructionId]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_FloorMaster]
-- FOREIGN KEY([FloorID])
-- REFERENCES [PTIS].[FloorMaster] ([FloorID]);
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
-- FOREIGN KEY([SubFloorID])
-- REFERENCES [PTIS].[SubFloorMaster] ([SubFloorID]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_SubFloorMaster];
-- GO
/****** Object:  Table [PTIS].[FloorSubmissionRoomNoDetail]******/
 SET ANSI_NULLS ON
 GO
 SET QUOTED_IDENTIFIER ON
 GO
 CREATE TABLE [PTIS].[RoomNoCountMaster](
 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 	[RoomNo] [nvarchar](100) NOT NULL,
 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomNoCountMaster_IsActive] DEFAULT (1),
 	[CreatedBy] [int] NULL,
 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomNoCountMaster_CreatedDate DEFAULT (GETDATE()),
 	[UpdatedBy] [int] NULL,
 	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_RoomNoCountMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
 ) ON [PRIMARY]
 GO

/****** Object:  Table [PTIS].[NatureFactorCVMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[NatureFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionId] [varchar](7) NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[EffectiveFrom] [date] NOT NULL,
	[EffectiveTo] [date] NOT NULL,
	[Code] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_NatureFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_NatureFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NatureFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionId]);
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] CHECK CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster];
GO


/****** Object:  Table [PTIS].[RateSectionDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateSectionDetails](
	[RateSectionDetailsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RateSectionNo] [nvarchar](20) NOT NULL,
	[WardNo] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionDetails_IsActive] DEFAULT (1),
	[CreatedBy] int NULL,
    [CreatedDate] datetime NOT NULL CONSTRAINT DF_RateSectionDetails_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] int NULL,
    [UpdatedDate] datetime NULL,
    CONSTRAINT [PK_RateSectionDetails] PRIMARY KEY CLUSTERED ([RateSectionDetailsID] ASC)
);
GO

alter table [PTIS].[RateSectionDetails] with check add constraint [FK_RateSectionDetails_RateSectionMaster]	
foreign key([RateSectionNo]) references [PTIS].[RateSectionMaster] ([RateSectionNo]);
GO
alter table [PTIS].[RateSectionDetails] check constraint [FK_RateSectionDetails_RateSectionMaster];


ALTER TABLE [PTIS].[RateSectionDetails] ADD CONSTRAINT [UQ_RateSectionDetails_RateSection_Ward]
UNIQUE ([RateSectionNo], [WardNo]);
GO

/****** Object:  Table [PTIS].[ParkingTypeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[ParkingTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [varchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
	[Type] [varchar](5) NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ParkingTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ParkingTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ParkingTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[ParkingTypeMaster] WITH CHECK ADD CONSTRAINT [FK_ParkingTypeMaster_TypeOfUseMaster]
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([TypeOfUseId]);
GO

ALTER TABLE [PTIS].[ParkingTypeMaster] CHECK CONSTRAINT [FK_ParkingTypeMaster_TypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[PartTypeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PartTypeMaster](
	[PartTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PartType] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PartTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PartTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartTypeMaster_1] PRIMARY KEY CLUSTERED ([PartTypeID] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PenaltyDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PenaltyDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FinanceYear] [int] NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_PenaltyDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PenaltyDetails]  WITH CHECK ADD  CONSTRAINT [FK_PenaltyDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

/****** Object:  Table [PTIS].[PropertyDescriptionAndTypeOfUseValidation]******/

ALTER TABLE [PTIS].[PenaltyDetails] CHECK CONSTRAINT [FK_PenaltyDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PenaltyTaxesMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PenaltyTaxesMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FinanceYear] [int] NOT NULL,
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
 CONSTRAINT [PK_ApplyPenaltyTaxesMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
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

/****** Object:  Table [PTIS].[PlotDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PlotDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_PlotDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PlotDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlotDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PlotDetails] CHECK CONSTRAINT [FK_PlotDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyAssessmentDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyAssessmentDetails](
	[OwnerID] [int] NOT NULL,
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
 CONSTRAINT [PK_PropertyAssessmentDetails] PRIMARY KEY CLUSTERED ([OwnerID] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails] CHECK CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast]
GO


CREATE TABLE [PTIS].[PropertyDescriptionAndTypeOfUseValidation](
	[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	-- [PropertyDescription] [nvarchar](100) NULL,
	-- [Type] [varchar](5) NULL,
	-- [TypeDescription] [nvarchar](100) NULL,
	[First] [varchar](7) NULL ,
	[Second] [varchar](7) NULL ,
	[Third] [varchar](7) NULL ,
	[Fourth] [varchar](7) NULL ,
	[Fifth] [varchar](7) NULL ,
	[Sixth] [varchar](7) NULL ,
	[Seventh] [varchar](7) NULL ,
	[Eighth] [varchar](7) NULL ,
	[Ninth] [varchar](7) NULL ,
	[Tenth] [varchar](7) NULL ,
	[Eleventh] [varchar](7) NULL ,
	[Twelfth] [varchar](7) NULL ,
	[Thirteenth] [varchar](7) NULL ,
	[Fourteenth] [varchar](7) NULL ,
	[Fifteenth] [varchar](7) NULL ,
	[Sixteenth] [varchar](7) NULL ,
	[Seventeenth] [varchar](7) NULL ,
	[Eighteenth] [varchar](7) NULL ,
	[Nineteenth] [varchar](7) NULL ,
	[Twentieth] [varchar](7) NULL ,
	[TwentyFirst] [varchar](7) NULL ,
	[TwentySecond] [varchar](7) NULL ,
	[TwentyThird] [varchar](7) NULL ,
	[TwentyFourth] [varchar](7) NULL ,
	[TwentyFifth] [varchar](7) NULL ,
	[TwentySixth]   [varchar](7) NULL ,
    [TwentySeventh] [varchar](7) NULL ,
    [TwentyEighth]  [varchar](7) NULL ,
    [TwentyNinth]   [varchar](7) NULL ,
    [Thirtieth]     [varchar](7) NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDescriptionAndTypeOfUseValidation_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDescriptionAndTypeOfUseValidation_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_PropertyDescriptionAndTypeOfUseValidation] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PropertyDescriptionAndTypeOfUseValidation_PropertyType]
        FOREIGN KEY ([PropertyTypeID]) 
        REFERENCES [PTIS].[PropertyTypeMaster]([PropertyTypeID])
		
) ON [PRIMARY];
GO

/****** Object:  Table [PTIS].[PropertyDetailsOld]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyDetailsOld](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[OldFloorID] [nvarchar](10) NULL,
	[OldConstructionYear] [varchar](4) NULL,
	[OldConstructionId] [varchar](7) NULL,
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
 CONSTRAINT [PK_OldPropertyDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyDetailsOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyDetailsOld_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyDetailsOld] CHECK CONSTRAINT [FK_PropertyDetailsOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyImagesMast]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyImagesMast](
	[OwnerID] [int] NOT NULL,
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
 CONSTRAINT [PK_PropertyImagesMast] PRIMARY KEY CLUSTERED ([OwnerID] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyImagesMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyImagesMast_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyImagesMast] CHECK CONSTRAINT [FK_PropertyImagesMast_PropertyMast]
GO



/****** Object:  Table [PTIS].[UsageCategoryMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[UsageCategoryMaster](
	[UsageCategoryID] [int] NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UsageCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_UsageCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UsageCategoryMaster] PRIMARY KEY CLUSTERED ([UsageCategoryID] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyMastDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyMastDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[OwnerType] [nvarchar](30) NULL,
	[WingName] [nvarchar](30) NULL,
	[WingID] [int] NULL,
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
	[UsageCategoryID] [int] NULL,
	[AlternetivEmailID] [varchar](100) NULL,
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
 CONSTRAINT [PK_PropertyMastDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_PropertyMast_OwnerId] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_PropertyMast_OwnerId]
GO

alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster] FOREIGN KEY([OwnerType])
REFERENCES [PTIS].[OwnerTypeMaster] ([OwnerType])	
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster]


GO
alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster] FOREIGN KEY([UsageCategoryID])
REFERENCES [PTIS].[UsageCategoryMaster] ([UsageCategoryID])
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster]	
GO	

/****** Object:  Table [PTIS].[PropertyMastOld]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyMastOld](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[OldWardNo] [nvarchar](10) NULL,
	[OldPropertyNo] [nvarchar](10) NULL,
	[OldPartitionNo] [nvarchar](10) NULL,
	[OldEgovNo] [nvarchar](10) NULL,
	[OldPropertyTypeID] [int] NULL,
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
	[OldEmailID] [nvarchar](100) NULL,
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
 CONSTRAINT [PK_PropertyMastOld] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastOld_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyMastOld] CHECK CONSTRAINT [FK_PropertyMastOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertySocialDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
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
 CONSTRAINT [PK_PropertySocialDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertySocialDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertySocialDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertySocialDetails] CHECK CONSTRAINT [FK_PropertySocialDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetailsSequenceMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertySocialDetailsSequenceMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FeildName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SequenceNo] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertySocialDetailsSequenceMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyTaxCalculationRVResults]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyTaxCalculationRVResults](
	[TaxCalcID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[PDNID] [int] NOT NULL,
	[FloorID] [nvarchar](5) NULL,
	[RenterYesNO] [bit] NULL,
	[ConstructionYear] [varchar](4) NULL,
	[ConstructionId] [varchar](7) NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[Type] [varchar](5) NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[CarpetAreaInMtr] [float] NULL,
	[BuiltUpAreaInSqft] [float] NULL,
	[BuiltUpAreaInSqMtr] [float] NULL,
	[Rooms] [int] NULL,
	[YearlyRate] [float] NULL,
	[MonthlyRate] [float] NULL,
	[RentFromRenterPerMonth] [float] NULL,
	[YearlyRentSqft] [float] NULL,
	[YearlyRentFormRenter] [float] NULL,
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
 CONSTRAINT [PK_PropertyTaxCalculationRVResults] PRIMARY KEY CLUSTERED ([TaxCalcID] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationRVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationRVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyMast]
GO

ALTER TABLE PTIS.PropertyTaxCalculationRVResults ADD CONSTRAINT FK_PropertyTaxCalculationRVResults_TypeOfUseMaster FOREIGN KEY (TypeOfUseId)
REFERENCES PTIS.TypeOfUseMaster (TypeOfUseId);
GO
ALTER TABLE PTIS.PropertyTaxCalculationRVResults CHECK CONSTRAINT FK_PropertyTaxCalculationRVResults_TypeOfUseMaster
GO	


alter table PTIS.PropertyTaxCalculationRVResults ADD CONSTRAINT FK_PropertyTaxCalculationRVResults_ConstructionTypeMaster FOREIGN KEY (ConstructionId)
REFERENCES PTIS.ConstructionTypeMaster (ConstructionId);
GO
alter table PTIS.PropertyTaxCalculationRVResults CHECK CONSTRAINT FK_PropertyTaxCalculationRVResults_ConstructionTypeMaster
GO

alter table PTIS.PropertyTaxCalculationRVResults add constraint FK_PropertyTaxCalculationRVResults_FloorMaster FOREIGN KEY (FloorID)
REFERENCES PTIS.FloorMaster (FloorID);
GO
alter table PTIS.PropertyTaxCalculationRVResults CHECK CONSTRAINT FK_PropertyTaxCalculationRVResults_FloorMaster
GO


ALTER TABLE PTIS.PropertyTaxCalculationRVResults ADD CONSTRAINT FK_PropertyTaxCalculationRVResults_PropertyDetails FOREIGN KEY (PDNID)
REFERENCES PTIS.PropertyDetails (Id);
GO
ALTER TABLE PTIS.PropertyTaxCalculationRVResults CHECK CONSTRAINT FK_PropertyTaxCalculationRVResults_PropertyDetails
GO


---****** Object:  Table [PTIS].[PropertyTaxCalculationCVResults]******/
SET ANSI_NULLS ON		
GO	
SET QUOTED_IDENTIFIER ON
GO	

------------------------------------------------------------------------------
CREATE TABLE [PTIS].[PropertyTaxCalculationCVResults](
	[TaxCalcID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PDNID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FloorID] [nvarchar](5) NULL,
	[ConstructionYear] [varchar](4) NULL,
	[ConstructionId] [varchar](7) NULL,
	[TypeOfUseId] [varchar](10) NULL,
	[Type] [varchar](5) NULL,
	[CarpetAreaSqFeet] [float] NULL,
	[CarpetAreaInMtr] [float] NULL,
	[BuiltUpAreaInSqft] [float] NULL,
	[BuiltUpAreaInSqMtr] [float] NULL,
	[NoOfRooms] [int] NULL,
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
 CONSTRAINT [PK_PropertyTaxCalculationCVResults] PRIMARY KEY CLUSTERED ([TaxCalcID] ASC) 
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationCVResults_ConstructionTypeMaster] FOREIGN KEY([ConstructionId])
REFERENCES [PTIS].[ConstructionTypeMaster] ([ConstructionId])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationCVResults_ConstructionTypeMaster]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationCVResults_FloorMaster] FOREIGN KEY([FloorID])
REFERENCES [PTIS].[FloorMaster] ([FloorID])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationCVResults_FloorMaster]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyMast]
GO

ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationCVResults_TypeOfUseMaster] FOREIGN KEY([TypeOfUseId])
REFERENCES [PTIS].[TypeOfUseMaster] ([TypeOfUseId])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationCVResults] CHECK CONSTRAINT [FK_PropertyTaxCalculationCVResults_TypeOfUseMaster]
GO

ALTER TABLE PTIS.PropertyTaxCalculationCVResults ADD CONSTRAINT FK_PropertyTaxCalculationCVResults_PropertyDetails FOREIGN KEY (PDNID)
REFERENCES PTIS.PropertyDetails (Id);
GO
ALTER TABLE PTIS.PropertyTaxCalculationCVResults CHECK CONSTRAINT FK_PropertyTaxCalculationCVResults_PropertyDetails
GO


------****** Object:  Table [PTIS].[PropertyTaxCalculationSection129Results]******/

CREATE TABLE [PTIS].[PropertyTaxCalculationSection129Results](
	[TaxCalcID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
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
 CONSTRAINT [PK_PropertyTaxCalculationSection129Results] PRIMARY KEY CLUSTERED  ([TaxCalcID] ASC ) 
 )
 
ALTER TABLE [PTIS].[PropertyTaxCalculationSection129Results]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO
ALTER TABLE [PTIS].[PropertyTaxCalculationSection129Results] CHECK CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyTaxSlabWiseMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[PropertyTaxSlabWiseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](5) NULL,
	[Year] [int] NULL,
	[MinRV] [money] NULL,
	[MaxRV] [money] NULL,
	[Rate] [money] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxSlabWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTaxSlabWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTaxSlabWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

GO



/****** Object:  Table [PTIS].[TaxZoneMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxZoneMaster](
	[TaxZoneNo] [nvarchar](10) NOT NULL,
	[TaxZoneType] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxZoneMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxZoneMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxZoneMaster] PRIMARY KEY CLUSTERED ([TaxZoneNo] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[RateChartDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateChartDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NULL,
	[TaxZoneNo] [nvarchar](10) NULL,
	[ConstructionId] [varchar](7) NULL,
	[Rate] [money] NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[RateSectionNo] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateChartDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateChartDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RateChartDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[RateChartDetails] WITH CHECK ADD CONSTRAINT [FK_RateChartDetails_ConstructionTypeMaster]
FOREIGN KEY([ConstructionId]) REFERENCES [PTIS].[ConstructionTypeMaster]([ConstructionId]);
GO

ALTER TABLE [PTIS].[RateChartDetails] CHECK CONSTRAINT [FK_RateChartDetails_ConstructionTypeMaster];
GO

alter table [PTIS].[RateChartDetails] WITH CHECK ADD CONSTRAINT [FK_RateChartDetails_TaxZoneMaster]
FOREIGN KEY([TaxZoneNo]) REFERENCES [PTIS].[TaxZoneMaster]([TaxZoneNo]);
GO
ALTER TABLE [PTIS].[RateChartDetails] CHECK CONSTRAINT [FK_RateChartDetails_TaxZoneMaster];
GO
/****** Object:  Table [PTIS].[RateChartMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateChartMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NOT NULL,
	[CommercialMultiplier] [float] NULL,
	[IndustrialMultiplier] [float] NULL,
	[CommercialMultiplier2] [float] NULL,
	[CommMultiplierAppliedToZone] [nvarchar](100) NULL,
	[CommMultiplier1AppliedToZone] [nvarchar](100) NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[RateSectionNo] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateChartMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateChartMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_RateChartMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

alter table [PTIS].[RateChartMaster] WITH CHECK ADD CONSTRAINT [FK_RateChartMaster_RateSectionMaster]
FOREIGN KEY([RateSectionNo]) REFERENCES [PTIS].[RateSectionMaster]([RateSectionNo]);	
GO
ALTER TABLE [PTIS].[RateChartMaster] CHECK CONSTRAINT [FK_RateChartMaster_RateSectionMaster];

/****** Object:  Table [PTIS].[RateMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NULL,
	[TaxZoneNo] [nvarchar](10) NULL,
	[FloorID] [nvarchar](5) NULL,
	[ConstructionId] [varchar](7) NULL,
	[TypeOfUseGroupID] [varchar](10) NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[RateSquareMeter] [money] NULL,
	[RateSquareFeet] [money] NULL,
	[RateSectionNo] [nvarchar](20) NULL,
	[RateRemark] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_RateMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]


ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT FK_RateMaster_TaxZoneMaster
FOREIGN KEY (TaxZoneNo) REFERENCES PTIS.TaxZoneMaster(TaxZoneNo);
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT FK_RateMaster_TaxZoneMaster;
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_FloorID] 
FOREIGN KEY (FloorID) REFERENCES [PTIS].[FloorMaster](FloorID);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_FloorID];
GO


ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_ConstructionID]
FOREIGN KEY (ConstructionId) REFERENCES [PTIS].[ConstructionTypeMaster](ConstructionId);
GO	
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_ConstructionID];
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_TypeOfUseGroupID]
FOREIGN KEY (TypeOfUseGroupID) REFERENCES [PTIS].[TypeOfUseGroupMaster](TypeOfUseGroupID);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_TypeOfUseGroupID];
GO

ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT [FK_RateMaster_RateSectionMaster]
FOREIGN KEY (RateSectionNo) REFERENCES PTIS.RateSectionMaster(RateSectionNo);
GO
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT [FK_RateMaster_RateSectionMaster];
GO


ALTER TABLE PTIS.RateMaster ADD CONSTRAINT UQ_RateMaster_TaxZone_Construction_UseGroup_Year_Section
UNIQUE (Year,TaxZoneNo,ConstructionId, TypeOfUseGroupID, MinYear, MaxYear, RateSectionNo);
GO


/****** Object:  Table [PTIS].[MoujaMaster]******/
CREATE TABLE [PTIS].[MoujaMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NOT NULL,
	[MoujaName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_MoujaMaster] PRIMARY KEY CLUSTERED 	([Id] ASC)	
)

/****** Object:  Table [PTIS].[RateMasterForCV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RateMasterForCV](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_RateMasterForCV] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[RateMasterForCV]  WITH CHECK ADD  CONSTRAINT [FK_RateMasterForCV_MoujaMaster] FOREIGN KEY([MoujaId])
REFERENCES [PTIS].[MoujaMaster] ([Id])
GO
 
ALTER TABLE [PTIS].[RateMasterForCV] CHECK CONSTRAINT [FK_RateMasterForCV_MoujaMaster]
GO



/****** Object:  Table [PTIS].[RetentionFactMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RetentionFactMaster](
	[FactorID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionFactMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionFactMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionFactMaster] PRIMARY KEY CLUSTERED ([FactorID] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[RetentionPolicyFactWiseMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RetentionPolicyFactWiseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromFactor] [float] NULL,
	[ToFactor] [float] NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionPolicyFactWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionPolicyFactWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionPolicyFactWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[RetentionPolicyYearWiseMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[RetentionPolicyYearWiseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NULL,
	[ToYear] [int] NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionPolicyYearWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionPolicyYearWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionPolicyYearWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SocietyPartitionNo]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[SocietyPartitionNo](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PartitionNo] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SocietyPartitionNo_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SocietyPartitionNo_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SocietyPartitionNo] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_SocietyPartitionNo_PartitionNo] UNIQUE ([PartitionNo])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SubmissionRemarkMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[SubmissionRemarkMaster](
	[SubmissionRemarkMasterID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubmissionRemark] [nvarchar](200) NULL,
	[RemarkType] [nvarchar](200) NULL,
	[IsAreaRemark] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionRemarkMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionRemarkMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SubmissionRemarkMaster] PRIMARY KEY CLUSTERED ([SubmissionRemarkMasterID] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SubmissionSameAsUserHistory]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[SubmissionSameAsUserHistory](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CopyOn] [int] NULL,
	[SameAs] [int] NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_MarkedForDeletion] DEFAULT (0),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionSameAsUserHistory_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[TaxNameMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxNameMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxName] [nvarchar](100) NULL,
	[AliseName] [nvarchar](100) NULL,
	
	[Interest] [nvarchar](50) NULL,
	[ExcelAliasName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxNameMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxNameMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxNameMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
/****** Object:  Table [PTIS].[TaxPendingDetails]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetails](
	[TaxPendingID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_TaxPendingDetails] PRIMARY KEY CLUSTERED ([TaxPendingID] ASC),
 CONSTRAINT [UQ__TaxPendi__314945C924D2692A] UNIQUE NONCLUSTERED ([OwnerID] ASC, [PendingYear] ASC)
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

ALTER TABLE [PTIS].[TaxPendingDetails] ADD  CONSTRAINT [DF_TaxPendingDetails_Inserted_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[TaxPendingDetails]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetails_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetails] CHECK CONSTRAINT [FK_TaxPendingDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsArchive]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetailsArchive](
	[TaxPendingPrevious_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
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
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsArchive] PRIMARY KEY CLUSTERED ([TaxPendingPrevious_ID] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsArchive] ADD  CONSTRAINT [DF_TaxPendingDetailsArchive_Inserted_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsArchive] ADD  CONSTRAINT [DF_TaxPendingDetailsArchive_Inserted_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsArchive]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsArchive_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsArchive] CHECK CONSTRAINT [FK_TaxPendingDetailsArchive_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsCV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetailsCV](
	[TaxPendingCVID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_TaxPendingDetailsCV] PRIMARY KEY CLUSTERED ([TaxPendingCVID] ASC),
 CONSTRAINT [UQ__TaxPendicv__314945C924D2692A] UNIQUE NONCLUSTERED ([OwnerID] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsCV]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsCV_PropertyMast_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsCV] CHECK CONSTRAINT [FK_TaxPendingDetailsCV_PropertyMast_OwnerID]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsLookup]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetailsLookup](
	[Id] [int] NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_TaxPendingDetailsLookup] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsLookup]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsLookup_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsLookup] CHECK CONSTRAINT [FK_TaxPendingDetailsLookup_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsRetro]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetailsRetro](
	[RetroID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
	[FinanceYear] [int] NULL,
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
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxPendingDetailsRetro] PRIMARY KEY CLUSTERED ([RetroID] ASC),
 CONSTRAINT [UQ__TaxPendiRetro__314945C924D2692A] UNIQUE NONCLUSTERED ([OwnerID] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRetro] ADD  CONSTRAINT [DF_TaxPendingDetailsRetro_Inserted_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRetro] ADD  CONSTRAINT [DF_TaxPendingDetailsRetro_Inserted_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRetro]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsRetro_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRetro] CHECK CONSTRAINT [FK_TaxPendingDetailsRetro_PropertyMast]
GO

/****** Object:  Table [PTIS].[TaxPendingDetailsRV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TaxPendingDetailsRV](
	[TaxPendingRVID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NULL,
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
 CONSTRAINT [PK_TaxPendingDetailsRV] PRIMARY KEY CLUSTERED ([TaxPendingRVID] ASC),
 CONSTRAINT [UQ__TaxPendiRV__314945C924D2692A] UNIQUE NONCLUSTERED ([OwnerID] ASC, [PendingYear] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRV]  WITH CHECK ADD  CONSTRAINT [FK_TaxPendingDetailsRV_PropertyMast_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TaxPendingDetailsRV] CHECK CONSTRAINT [FK_TaxPendingDetailsRV_PropertyMast_OwnerID]
GO



/****** Object:  Table [PTIS].[TransMast]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TransMast](
	[TransMastID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FinanceYear] [int] NULL,
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
 CONSTRAINT [PK_TransMast] PRIMARY KEY CLUSTERED ([TransMastID] ASC)
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

ALTER TABLE [PTIS].[TransMast]  WITH CHECK ADD  CONSTRAINT [FK_TransMast_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TransMast] CHECK CONSTRAINT [FK_TransMast_PropertyMast]
GO

ALTER TABLE [PTIS].[TransMast]  WITH CHECK ADD FOREIGN KEY([FinanceYear])
REFERENCES [PTIS].[YearMaster] ([Year])
GO



CREATE NONCLUSTERED INDEX [Ind_NC_TR_1] 
ON [ptis].[TransMast] ([OwnerID]);


CREATE NONCLUSTERED INDEX [Ind_NC_TR_2] 
ON [ptis].[TransMast] ([FinanceYear]) INCLUDE([OwnerID]);
GO
/****** Object:  Table [PTIS].[TransMastArchive]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TransMastArchive](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FinanceYear] [int] NULL,
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
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TransMastArchive] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastArchive] ADD  CONSTRAINT [DF_TransMastArchive_Inserted_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [PTIS].[TransMastArchive] ADD  CONSTRAINT [DF_TransMastArchive_Inserted_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [PTIS].[TransMastArchive]  WITH CHECK ADD  CONSTRAINT [FK_TransMastArchive_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TransMastArchive] CHECK CONSTRAINT [FK_TransMastArchive_PropertyMast]
GO

/****** Object:  Table [PTIS].[TransMastCV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TransMastCV](
	[TransMastCVID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FinanceYear] [int] NULL,
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
 CONSTRAINT [PK_TransMastCV] PRIMARY KEY CLUSTERED ([TransMastCVID] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastCV]  WITH CHECK ADD  CONSTRAINT [FK_TransMastCV_PropertyMast_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TransMastCV] CHECK CONSTRAINT [FK_TransMastCV_PropertyMast_OwnerID]
GO

ALTER TABLE [PTIS].[TransMastCV] WITH CHECK ADD CONSTRAINT [FK_TransMastCV_YearMaster]
FOREIGN KEY([FinanceYear]) REFERENCES [PTIS].[YearMaster]([Year]);
GO

ALTER TABLE [PTIS].[TransMastCV] CHECK CONSTRAINT [FK_TransMastCV_YearMaster];
GO

/****** Object:  Table [PTIS].[TransMastLookup]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TransMastLookup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FinanceYear] [int] NULL,
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
 CONSTRAINT [PK_TransMastLookup] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastLookup]  WITH CHECK ADD  CONSTRAINT [FK_TransMastLookup_PropertyMast] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TransMastLookup] CHECK CONSTRAINT [FK_TransMastLookup_PropertyMast]
GO

/****** Object:  Table [PTIS].[TransMastRV]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TransMastRV](
	[TransMastRVID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[FinanceYear] [int] NULL,
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
 CONSTRAINT [PK_TransMastRV] PRIMARY KEY CLUSTERED ([TransMastRVID] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[TransMastRV]  WITH CHECK ADD  CONSTRAINT [FK_TransMastRV_PropertyMast_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [PTIS].[PropertyMast] ([OwnerID])
GO

ALTER TABLE [PTIS].[TransMastRV] CHECK CONSTRAINT [FK_TransMastRV_PropertyMast_OwnerID]
GO

ALTER TABLE [PTIS].[TransMastRV] WITH CHECK ADD CONSTRAINT [FK_TransMastRV_YearMaster]
FOREIGN KEY([FinanceYear]) REFERENCES [PTIS].[YearMaster]([Year]);
GO

ALTER TABLE [PTIS].[TransMastRV] CHECK CONSTRAINT [FK_TransMastRV_YearMaster];
GO

/****** Object:  Table [PTIS].[TypeOfUsePrimeMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[TypeOfUsePrimeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Type] [varchar](5) NULL,
	[Description] [nvarchar](80) NULL,
	[TypeTaxableStaus] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUsePrimeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TypeOfUsePrimeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	

 CONSTRAINT [PK_TypeOfUsePrimeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[UseFactorCVMaster]******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [PTIS].[UseFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [varchar](10) NOT NULL,
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
 CONSTRAINT [PK__UseFacto__3214EC27DFB51781] PRIMARY KEY CLUSTERED ([Id] ASC)
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



CREATE TABLE [PTIS].[AssessmentYearRangeMaster](
	[YearId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AssessmentYearRangeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AssessmentYearRangeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_AssessmentYearRangeMaster] PRIMARY KEY CLUSTERED ([YearId] ASC),
	CONSTRAINT [UQ_AssessmentYearRangeMaster_FromYear_ToYear] UNIQUE ([FromYear], [ToYear]),
	CONSTRAINT [CK_AssessmentYearRange_ValidYear] CHECK (FromYear <= ToYear)
)



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PTIS].[RoomWiseMinusData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerID] [int] NOT NULL,
	[IDFSD] [int] NULL,
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
CONSTRAINT [PK_RoomWiseMinusData] PRIMARY KEY CLUSTERED ( [Id] ASC )
) ON [PRIMARY]
GO	

ALTER TABLE [PTIS].[RoomWiseMinusData]  WITH CHECK ADD  CONSTRAINT [FK_FSDM_FSD] FOREIGN KEY([IDFSD])
REFERENCES [PTIS].[RoomWiseSubmissionDetails] ([Id])
GO

ALTER TABLE [PTIS].[RoomWiseMinusData] CHECK CONSTRAINT [FK_FSDM_FSD]
GO



CREATE TABLE [PTIS].[RenterDetails] (
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PDNId] [INT] NOT NULL,
    [AgreementID] [Nvarchar](25) NULL, 
    -- [AgreementDate] [DATETIME] NULL,
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
	CONSTRAINT Pk_RenterDetails PRIMARY KEY CLUSTERED ([Id] ASC	)
    );

ALTER TABLE PTIS.RenterDetails  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_PropertyDetails] FOREIGN KEY([PDNId])
REFERENCES [PTIS].[PropertyDetails] ([Id])
GO	
ALTER TABLE PTIS.RenterDetails CHECK CONSTRAINT [FK_RenterDetails_PropertyDetails]
GO	



CREATE TABLE  [PTIS].[RenterMast] (
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PDNId] [INT] NOT NULL,
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
	CONSTRAINT Pk_RenterMast PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
ALTER TABLE PTIS.RenterMast  WITH CHECK ADD  CONSTRAINT [FK_RenterMast_PropertyDetails] FOREIGN KEY([PDNId])
REFERENCES [PTIS].[PropertyDetails] ([Id])
GO	
ALTER TABLE PTIS.RenterMast CHECK CONSTRAINT [FK_RenterMast_PropertyDetails]
GO



----------- Master For Global Survey App ----Start----------
GO


GO
CREATE TABLE [PTIS].[GenderMaster](
	[GenderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GenderName] NVARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_GenderMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_GenderMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT UQ_GenderMaster_GenderName UNIQUE ([GenderName]),
 	CONSTRAINT [PK_GenderMaster] PRIMARY KEY CLUSTERED ( [GenderID] ASC )
) ON [PRIMARY]
GO


CREATE TABLE [PTIS].[DocumentMaster](
	[DocId] [int] IDENTITY(1,1) not FOR REPLICATION NOT NULL,
	[DocumentName] [nvarchar](100) NOT null, 
	[DocPrefix] [varchar](50) not null, 
	[IsActive] BIT NOT NULl CONSTRAINT DF_documentmaster_IsActive DEFAULT (1),
	[CreatedBy] [int] null,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_documentmaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] null,
	[UpdatedDate] [datetime] null,
PRIMARY KEY CLUSTERED ([DocId] ASC)
) ON [primary]
GO

CREATE TABLE [PTIS].[PropertyVisitMeasurementMaster](
	[PropertyVisitMeasurementID] int NOT NULL IDENTITY(1,1) NOT FOR REPLICATION,
	[PropertyVisitAndMeasurement] [nvarchar](200) NULL,
	[BillAcceptStatus] [varchar](20) NULL,
	[Remark] [varchar](100) NULL,
	[Flag] [varchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_PropertyVisitMeasurementMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyVisitMeasurement_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	PRIMARY KEY CLUSTERED ([PropertyVisitMeasurementID] ASC )

) ON [PRIMARY]
GO

GO
CREATE TABLE [PTIS].[MobileScreenValidationMaster](
	[TabScreenID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_TabScreenMaster] PRIMARY KEY CLUSTERED  (	[TabScreenID] ASC )
) ON [PRIMARY]


GO
CREATE TABLE [PTIS].[BlockMaster](
	[BlockMasterID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardNo] [nvarchar](10) NULL,
	[BlockNo] [nvarchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_BlockMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BlockMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BlockMaster] PRIMARY KEY CLUSTERED  ([BlockMasterID] ASC)
) ON [PRIMARY]
GO
----------- Master For Global Survey App ----End----------



CREATE TABLE [PTIS].[RuleMaster]
(
    [RuleCode] SYSNAME NOT NULL,
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
    CONSTRAINT [PK_RuleMaster] PRIMARY KEY CLUSTERED ([RuleCode] ASC)
);
GO
