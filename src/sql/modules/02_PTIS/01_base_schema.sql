SET ANSI_NULLS ON
GO


SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [PTIS].[ZoneMaster] ******/
CREATE TABLE [PTIS].[ZoneMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ZoneNo] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SequenceNo] int null,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ZoneMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_ZoneMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_ZoneMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_ZoneMaster_ZoneNo] UNIQUE ([ZoneNo]),
	CONSTRAINT [UQ_ZoneMaster_Description] UNIQUE ([Description] ASC)
) ON [PRIMARY]

GO


/****** Object:  Table [PTIS].[WardMaster] ******/
CREATE TABLE [PTIS].[WardMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardNo] [nvarchar](10) NOT NULL,
	[Description] [nvarchar] (100) NOT NULL,
	[ZoneId] Int NOT NULL,
	[SequenceNo] int null,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_WardMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_WardMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_WardMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_WardMaster_WardNo] UNIQUE ([WardNo] ASC),
	CONSTRAINT [UQ_WardMaster_Description] UNIQUE ([Description] ASC)
) ON [PRIMARY]

GO

ALTER TABLE [PTIS].[WardMaster]  WITH CHECK ADD  CONSTRAINT [FK_WardMaster_ZoneMaster]
FOREIGN KEY([ZoneId]) REFERENCES [PTIS].[ZoneMaster] ([Id])
GO
ALTER TABLE [PTIS].[WardMaster] CHECK CONSTRAINT [FK_WardMaster_ZoneMaster]
GO	


/****** Object:  Table [PTIS].[OwnerTypeMaster]******/

CREATE TABLE [PTIS].[OwnerTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnerType] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_OwnerTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_OwnerTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OwnerTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_OwnerTypeMaster_OwnerType] UNIQUE ([OwnerType])
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[PropertyTypeCategoryMaster]******/

CREATE TABLE [PTIS].[PropertyTypeCategoryMaster](
	[Id] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeCategory] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTypeCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_PropertyTypeCategoryMaster_PropertyTypeCategory] UNIQUE ([PropertyTypeCategory] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[PropertyTypeMaster]******/

CREATE TABLE [PTIS].[PropertyTypeMaster](
	[Id] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyDescription] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[PropertyTypeGroup] [nvarchar](50) NULL,
	[SearchSequence] [int] NULL,
	[PropertyTypeCategoryId] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_PropertyTypeMaster_PropertyDescription] UNIQUE ([PropertyDescription] ASC)
)

GO
ALTER TABLE [PTIS].[PropertyTypeMaster] WITH CHECK ADD CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster]
FOREIGN KEY ([PropertyTypeCategoryId]) REFERENCES [PTIS].[PropertyTypeCategoryMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyTypeMaster] CHECK CONSTRAINT [FK_PropertyTypeMaster_PropertyTypeCategoryMaster];
GO




/****** Object:  Table [PTIS].[PropertyCategoryMaster]******/

CREATE TABLE [PTIS].[PropertyCategoryMaster](
	[Id] int IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyCategoryName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_PropertyCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_PropertyCategoryMaster_PropertyCategoryName] UNIQUE ([PropertyCategoryName] ASC)
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

CREATE TABLE [PTIS].[WingMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WingNo] [nvarchar](10) NOT NULL,
	[SequenceNo] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_WingMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_WingMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_WingMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
)

/****** Object:  Table [PTIS].[SocietyDetailsMast] ******/
CREATE TABLE [PTIS].[SocietyDetailsMast](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[WingId] [int] NULL,
	[WingName] [nvarchar](30) NULL,
	[SocietyName] [nvarchar](500) NULL,
	[SocietyAddress] [nvarchar](200) NULL,
	[SecretaryName] [nvarchar](200) NULL,
	[ManagerName] [nvarchar](200) NULL,
	[LandOwnerName] [nvarchar](200) NULL,
	[BuilderName] [nvarchar](200) NULL,
	[SocietyNameEnglish] [nvarchar](500) NULL,
	[SocietyAddressEnglish] [nvarchar](200) NULL,
	[SecretaryNameEnglish] [nvarchar](200) NULL,
	[ManagerNameEnglish] [nvarchar](200) NULL,
	[LandOwnerNameEnglish] [nvarchar](200) NULL,
	[BuilderNameEnglish] [nvarchar](200) NULL,
	[ManagerMobileNo] [varchar](13) NULL,
	[SecretaryMobileNo] [varchar](13) NULL,
	[SocietyEmailId] [nvarchar](100) NULL,
	[SecretaryEmailId] [nvarchar](100) NULL,
	[ManagerEmailId] [nvarchar](100) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_SocietyDetailsMaster_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SocietyDetailsMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SocietyDetailsMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SocietyDetailsMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[SocietyDetailsMast] WITH CHECK ADD CONSTRAINT [FK_SocietyDetailsMast_WingMaster] FOREIGN KEY([WingId])
REFERENCES [PTIS].[WingMaster] ([Id]) 
GO
ALTER TABLE [PTIS].[SocietyDetailsMast] CHECK CONSTRAINT [FK_SocietyDetailsMast_WingMaster] 
GO

-- ALTER TABLE [PTIS].[SocietyDetailsMast]  WITH CHECK ADD  CONSTRAINT [FK_SocietyDetailsMast_PropertyMast] FOREIGN KEY([PropertyId]) 
-- REFERENCES [PTIS].[PropertyMast] ([Id])	
-- GO
-- ALTER TABLE [PTIS].[SocietyDetailsMast] CHECK CONSTRAINT [FK_SocietyDetailsMast_PropertyMast]
-- GO



-- CREATE UNIQUE INDEX [UQ_SocietyDetailsMaster_WingName]
-- ON [PTIS].[SocietyDetailsMast] ([WingName])
-- WHERE [WingName] IS NOT NULL;
-- GO



/****** Object:  Table [PTIS].[TaxZoneMaster]******/

CREATE TABLE [PTIS].[TaxZoneMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxZoneNo] [nvarchar](10) NOT NULL,
	[TaxZoneType] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxZoneMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TaxZoneMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxZoneMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_TaxZoneMaster_TaxZoneNo] UNIQUE ([TaxZoneNo] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[MoujaMaster]******/
CREATE TABLE [PTIS].[MoujaMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NOT NULL,
	[MoujaName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MoujaMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_MoujaMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_MoujaMaster] PRIMARY KEY CLUSTERED 	([Id] ASC)	,
 CONSTRAINT UQ_MoujaMaster_Year UNIQUE (Year,MoujaName)
)
GO
ALTER TABLE [PTIS].[MoujaMaster] ADD CONSTRAINT UQ_MoujaMaster_Year_MoujaName UNIQUE (Year, MoujaName);
GO



/****** Object:  Table [PTIS].[PropertyMast]******/
CREATE TABLE [PTIS].[PropertyMast](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxZoneId] int NOT NULL,
	[WardId] int NOT NULL,
	[PropertyNo] [nvarchar](10) NULL,
	[PartitionNo] [nvarchar](10) NULL,
	[PropertySeqNo] [int] NULL,
	[PropertyTypeId] [int] NULL,
	[UPICId] [nvarchar](30) NULL,
	[OpenPlot] [bit] NULL,
	[MoujaId] [int] NULL,
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
    [MarkedForDeletionDate] [datetime] NULL  ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_PropertyMast] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyMast] WITH CHECK ADD CONSTRAINT [FK_PropertyMast_PropertyTypeMaster]
FOREIGN KEY([PropertyTypeId]) REFERENCES [PTIS].[PropertyTypeMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_PropertyTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyMast] WITH CHECK ADD CONSTRAINT [FK_PropertyMast_TaxZoneMaster_TaxZoneId]
FOREIGN KEY([TaxZoneId]) REFERENCES [PTIS].[TaxZoneMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_TaxZoneMaster_TaxZoneId];
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_PropertyCategoryMaster] FOREIGN KEY([CategoryId])
REFERENCES [PTIS].[PropertyCategoryMaster] ([Id])
GO	
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_PropertyCategoryMaster]
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_WardMaster] FOREIGN KEY([WardId])
REFERENCES [PTIS].[WardMaster] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_WardMaster]
GO


ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_SocietyDetailsMast] FOREIGN KEY([SocietyDetailId])
REFERENCES [PTIS].[SocietyDetailsMast] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_SocietyDetailsMast]
GO

ALTER TABLE [PTIS].[PropertyMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMast_MoujaMaster] FOREIGN KEY([MoujaId])
REFERENCES [PTIS].[MoujaMaster] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMast] CHECK CONSTRAINT [FK_PropertyMast_MoujaMaster]
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
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorCode] nvarchar(5) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SequenceNo] [int] NULL,
	[MaxFloorNo] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_FloorMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
  CONSTRAINT [UQ_FloorMaster_Code] UNIQUE ([FloorCode]),
  CONSTRAINT [UQ_FloorMaster_Description] UNIQUE ([Description])
);

GO

/****** Object:  Table [PTIS].[ConstructionTypeMaster]******/

CREATE TABLE [PTIS].[ConstructionTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionCode] [varchar](7) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ConstructionTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ConstructionTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ConstructionTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_ConstructionTypeMaster_ConstructionCode] UNIQUE ([ConstructionCode]),
 CONSTRAINT [UQ_ConstructionTypeMaster_Description] UNIQUE ([Description])
  );
GO



/****** Object:  Table [PTIS].[TypeOfUseGroupMaster]******/

CREATE TABLE [PTIS].[TypeOfUseGroupMaster](
	[Id]  [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseGroupCode]  [varchar](10) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
    [GroupIcon] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseGroupMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime]  NOT NULL CONSTRAINT DF_TypeOfUseGroupMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_TypeOfUseGroupMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_TypeOfUseGroupMaster_TypeOfUseGroupCode] UNIQUE ([TypeOfUseGroupCode]),
    CONSTRAINT [UQ_TypeOfUseGroupMaster] UNIQUE ([GroupName])
  )

GO


/****** Object:  Table [PTIS].[TypeOfUseMaster]******/

CREATE TABLE [PTIS].[TypeOfUseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseCode] [varchar](10) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Type] [varchar](5) NULL,
	[TypeOfUseGroupId] int NOT NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TypeOfUseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_TypeOfUseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TypeOfUseMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_TypeOfUseMaster_TypeOfUseCode] UNIQUE ([TypeOfUseCode]),
 CONSTRAINT [UQ_TypeOfUseMaster_Description] UNIQUE ([Description])
)
GO
alter table [PTIS].[TypeOfUseMaster]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster] FOREIGN KEY([TypeOfUseGroupId])	
REFERENCES [PTIS].[TypeOfUseGroupMaster] ([Id])
GO
ALTER TABLE [PTIS].[TypeOfUseMaster] CHECK CONSTRAINT [FK_TypeOfUseMaster_TypeOfUseGroupMaster]
GO



/****** Object:  Table [PTIS].[SubTypeOfUseMaster]******/

CREATE TABLE [PTIS].[SubTypeOfUseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [nvarchar](80) NULL,
	[TypeOfUseId] [int] NOT NULL,
	[SearchSequence] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubTypeOfUseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubTypeOfUseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_SubTypeOfUseMaster]  PRIMARY KEY CLUSTERED ([Id] ASC),
CONSTRAINT [FK_SubTypeOfUseMaster_TypeOfUseMaster]  FOREIGN KEY ([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([Id]),
CONSTRAINT [UQ_SubTypeOfUseMaster_Type_Desc]  UNIQUE ([Description])
)

GO


/****** Object:  Table [PTIS].[RateSectionMaster]******/

CREATE TABLE [PTIS].[RateSectionMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RateSectionNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RateSectionMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_RateSectionMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_RateSectionMaster_RateSectionCode] UNIQUE ([RateSectionNo]),
	CONSTRAINT [UQ_RateSectionMaster_Description] UNIQUE ([Description])
)
GO




/****** Object:  Table [PTIS].[SubZoneDetailsForCV]******/
CREATE TABLE [PTIS].[SubZoneDetailsForCV](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MoujaName] [nvarchar](300) NULL,
	[SubZoneNo] [nvarchar](20) NULL,
	[SubZoneName] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubZoneDetailsForCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubZoneDetailsForCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_SubZoneDetailsForCV] PRIMARY KEY CLUSTERED  ([Id] ASC)
)
GO


/****** Object:  Table [PTIS].[SubFloorMaster]******/

CREATE TABLE [PTIS].[SubFloorMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubFloorCode] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[SubFloorPercentage] [money] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubFloorMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubFloorMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_SubFloorMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
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
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
    [MarkedForDeletionDate] [datetime] NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_PropertyMast] 
FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_SubFloorMaster] 
FOREIGN KEY([SubFloorId]) REFERENCES [PTIS].[SubFloorMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster] 
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_FloorMaster] 
FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_FloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_TypeOfUseMaster] 
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[PropertyDetails] WITH CHECK ADD CONSTRAINT [FK_PropertyDetails_SubTypeOfUseMaster]
FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetails] CHECK CONSTRAINT [FK_PropertyDetails_SubTypeOfUseMaster];
GO



/****** Object:  Table [PTIS].[PropertyDetailsReassessment]******/
CREATE TABLE [PTIS].[PropertyDetailsReassessment](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
    [MarkedForDeletionDate] [datetime]  NULL  ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsReassessment_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetailsReassessment_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyDetailsReassessment] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_PropertyMast] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_PropertyMast];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_SubFloorMaster] FOREIGN KEY([SubFloorId]) REFERENCES [PTIS].[SubFloorMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_SubFloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_ConstructionTypeMaster] FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_FloorMaster] FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_FloorMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_TypeOfUseMaster] FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[PropertyDetailsReassessment] WITH CHECK
ADD CONSTRAINT [FK_PropertyDetailsReassessment_SubTypeOfUseMaster] FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([Id]);
GO
ALTER TABLE [PTIS].[PropertyDetailsReassessment] CHECK CONSTRAINT [FK_PropertyDetailsReassessment_SubTypeOfUseMaster];
GO




CREATE TABLE PTIS.TaxCategoryMaster (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [CategoryCode] NVARCHAR(50) NOT NULL,
    [CategoryName] NVARCHAR(100) NOT NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxCategoryMaster_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_TaxCategoryMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_TaxCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_TaxCategoryMaster_CategoryCode] UNIQUE ([CategoryCode])
);

CREATE TABLE PTIS.TaxMaster (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [TaxCode] NVARCHAR(20) NOT NULL,
    [TaxName] NVARCHAR(200) NOT NULL,
    [TaxNameAlias] NVARCHAR(200) NULL,
    [TaxCategoryId] INT NOT NULL,
    [DisplayOrder] INT NOT NULL CONSTRAINT [DF_TaxMaster_DisplayOrder] DEFAULT (0),
    [TaxOnUnit] [bit] NOT NULL CONSTRAINT [DF_TaxMaster_TaxOnUnit] DEFAULT (0),
	[AssessmentStatus] [bit] NOT NULL CONSTRAINT [DF_TaxMaster_AssessmentStatus] DEFAULT (1),
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxMaster_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_TaxMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_TaxMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_TaxMaster_TaxCode] UNIQUE ([TaxCode]),
	CONSTRAINT [UQ_TaxMaster_TaxName] UNIQUE ([TaxName]),
    CONSTRAINT [FK_TaxMaster_Category] FOREIGN KEY ([TaxCategoryId])
    REFERENCES PTIS.TaxCategoryMaster([Id])
);
/****** Object:  Table [PTIS].[ActiveTaxesMaster]******/

-- CREATE TABLE [PTIS].[ActiveTaxesMaster](
-- 	[ActiveTaxesId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[TaxName] [nvarchar](200) NOT NULL,
-- 	[TaxNameAlias] [nvarchar](200) NULL,
-- 	[DisplayOrder] [int] NULL,
-- 	[TaxOnUnit] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_TaxOnUnit] DEFAULT (0),
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ActiveTaxesMaster_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_ActiveTaxesMaster_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
-- CONSTRAINT [PK_ActiveTaxesMaster] PRIMARY KEY CLUSTERED ([ActiveTaxesId] ASC)
-- )
-- GO

-- ALTER TABLE [PTIS].[ActiveTaxesMaster]
-- ADD CONSTRAINT UQ_ActiveTaxesMaster_TaxName UNIQUE (TaxName);
-- GO



CREATE TABLE [PTIS].[AssessmentYearRangeMasterCV](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AssessmentYearRangeMasterCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AssessmentYearRangeMasterCV_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_AssessmentYearRangeMasterCV] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_AssessmentYearRangeMasterCV_FromYear_ToYear] UNIQUE ([FromYear], [ToYear]),
	CONSTRAINT [CK_AssessmentYearRangeMasterCV_ValidYear] CHECK (FromYear <= ToYear)
)

GO

/****** Object:  Table [PTIS].[AgeFactorCVMaster]******/

CREATE TABLE [PTIS].[AgeFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] int NOT NULL,
	[AgeFrom] [int] NOT NULL,
	[AgeTo] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[YearRangeCVId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_AgeFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_AgeFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_AgeFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
CONSTRAINT [UQ_AgeFactorCVMaster] UNIQUE ([ConstructionTypeId], [AgeFrom], [AgeTo], [YearRangeCVId])
	)
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster] FOREIGN KEY([ConstructionTypeId])
REFERENCES [PTIS].[ConstructionTypeMaster] ([Id])
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster] CHECK CONSTRAINT [FK_AgeFactorCVMaster_ConstructionTypeMaster]
GO

ALTER TABLE [PTIS].[AgeFactorCVMaster]  WITH CHECK ADD  CONSTRAINT [FK_AgeFactorCVMaster_AssessmentYearRangeMasterCV] FOREIGN KEY([YearRangeCVId])
REFERENCES [PTIS].[AssessmentYearRangeMasterCV] ([Id])
GO
ALTER TABLE [PTIS].[AgeFactorCVMaster] CHECK CONSTRAINT [FK_AgeFactorCVMaster_AssessmentYearRangeMasterCV]
GO



/****** Object:  Table [PTIS].[PolicyTaxDetails] ******/

CREATE TABLE [PTIS].[PolicyTaxDetails]
(
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PolicyCode] VARCHAR(20) NOT NULL,   -- 'NETTAX','APPEAL','HEARING','COMMITTEE','REMISSION'
    [PolicyDate] DATETIME NULL,
    [PolicyYear] SMALLINT NULL,
    [PolicyReason] NVARCHAR(200) NULL,
    [PolicyRVorCVvalue] MONEY NULL,
    [TaxId] INT NOT NULL,
    [TaxAmount] MONEY NULL,
    [MarkedForDeletion] BIT NOT NULL CONSTRAINT [DF_PolicyTaxDetails_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] DATETIME  NULL  ,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_PolicyTaxDetails_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_PolicyTaxDetails_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_PolicyTaxDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PolicyTaxDetails_PropertyMast_PropertyId] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([Id]),
    CONSTRAINT [FK_PolicyTaxDetails_TaxMaster_TaxId] FOREIGN KEY([TaxId]) REFERENCES [PTIS].[TaxMaster] ([Id]),
    CONSTRAINT [CK_PolicyTaxDetails_PolicyCode] CHECK ([PolicyCode] IN ('NETTAX','APPEAL','HEARING','COMMITTEE','REMISSION'))
);
GO

CREATE UNIQUE INDEX [UX_PolicyTaxDetails_Property_Year_PolicyCode_TaxId]
ON [PTIS].[PolicyTaxDetails]([PropertyId], [PolicyYear], [PolicyCode], [TaxId]) WHERE [IsActive] = 1 AND [MarkedForDeletion] = 0;
GO
CREATE INDEX [IX_PolicyTaxDetails_PropertyId] ON [PTIS].[PolicyTaxDetails]([PropertyId]);
CREATE INDEX [IX_PolicyTaxDetails_PropertyYear] ON [PTIS].[PolicyTaxDetails]([PropertyId], [PolicyYear]) INCLUDE ([TaxId], [TaxAmount], [PolicyCode]);
CREATE INDEX [IX_PolicyTaxDetails_TaxId] ON [PTIS].[PolicyTaxDetails]([TaxId]);
GO



/****** Object:  Table [PTIS].[ApplyTaxesMaster]******/

CREATE TABLE [PTIS].[ApplyTaxesMaster](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] [int] NOT NULL,
    [TaxId] [int] NOT NULL,
    -- [IsTaxForPlot] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_IsTaxForPlot] DEFAULT ((0)),
    -- [IsPolicyApplicable] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_IsPolicyApplicable] DEFAULT ((0)),	
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL ,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ApplyTaxesMaster_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_ApplyTaxesMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ApplyTaxesMaster_PropertyMast_PropertyId] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([Id]),
    CONSTRAINT [FK_ApplyTaxesMaster_TaxMaster_TaxId] FOREIGN KEY([TaxId]) REFERENCES [PTIS].[TaxMaster] ([Id]),
	CONSTRAINT [UQ_ApplyTaxesMaster_PropertyId_TaxId] UNIQUE ([PropertyId], [TaxId])
);
GO


/****** Object:  Table [PTIS].[AssessmentMaster] ******/
CREATE TABLE [PTIS].[AssessmentMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_AssessmentMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO


/****** Object:  Table [PTIS].[BillBookMaster]******/

CREATE TABLE [PTIS].[BillBookMaster](
	[Id] [int]  IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_BillBookMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
ALTER TABLE PTIS.BillBookMaster ADD CONSTRAINT UQ_BillBookMaster_EmpName_Year UNIQUE (EmpName, Year);
GO



/****** Object:  Table [PTIS].[AssessmentYearRangeMaster] ******/
CREATE TABLE [PTIS].[AssessmentYearRangeMasterRV](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromYear] [int] NOT NULL,
	[ToYear] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RVAssessmentYearRangeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RVAssessmentYearRangeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_AssessmentYearRangeMasterRV] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [UQ_AssessmentYearRangeMasterRV_FromYear_ToYear] UNIQUE ([FromYear], [ToYear]),
	CONSTRAINT [CK_AssessmentYearRangeMasterRV_ValidYear] CHECK (FromYear <= ToYear)
)

GO



/****** Object:  Table [PTIS].[TaxPercentageMasterCV]******/

CREATE TABLE PTIS.TaxPercentageMasterCV (
		[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[TaxId] INT NOT NULL,
		[TypeOfUseId] INT NOT NULL,
		[YearRangeCVId] INT NOT NULL,
		[TaxPercentage] DECIMAL(10,4) NOT NULL,
		[IsActive] BIT NOT NULL CONSTRAINT DF_TaxPercentageMasterCV_IsActive DEFAULT (1),
		[CreatedBy] INT NULL,
		[CreatedDate] DATETIME NOT NULL CONSTRAINT DF_TaxPercentageMasterCV_CreatedDate DEFAULT (GETDATE()),
		[UpdatedBy] INT NULL,
		[UpdatedDate] DATETIME NULL,
		CONSTRAINT PK_TaxPercentageMasterCV PRIMARY KEY CLUSTERED ([Id] ASC),
		CONSTRAINT FK_TaxPercentageMasterCV_TaxMaster FOREIGN KEY (TaxId) REFERENCES PTIS.TaxMaster(Id),
		CONSTRAINT FK_TaxPercentageMasterCV_TypeOfUseId FOREIGN KEY (TypeOfUseId) REFERENCES PTIS.TypeOfUseMaster(Id),
		CONSTRAINT FK_TaxPercentageMasterCV_AssessmentYearRangeCVId FOREIGN KEY (YearRangeCVId) REFERENCES PTIS.AssessmentYearRangeMasterCV(Id),
		CONSTRAINT UQ_TaxPercentageMasterCV_TypeOfUseId_YearRangeCVId UNIQUE (TypeOfUseId, YearRangeCVId, TaxId)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[TaxPercentageMasterRV]******/
CREATE TABLE PTIS.TaxPercentageMasterRV (
		[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
		[TaxId] INT NOT NULL,
		[TypeOfUseId] INT NOT NULL,
		[YearRangeRVId] INT NOT NULL,
		[TaxPercentage] DECIMAL(10,4) NOT NULL,
		[IsActive] BIT NOT NULL CONSTRAINT DF_TaxPercentageMasterRV_IsActive DEFAULT (1),
		[CreatedBy] INT NULL,
		[CreatedDate] DATETIME NOT NULL CONSTRAINT DF_TaxPercentageMasterRV_CreatedDate DEFAULT (GETDATE()),
		[UpdatedBy] INT NULL,
		[UpdatedDate] DATETIME NULL,
		CONSTRAINT PK_TaxPercentageMasterRV PRIMARY KEY CLUSTERED ([Id] ASC),
		CONSTRAINT FK_TaxPercentageMasterRV_TaxMaster FOREIGN KEY (TaxId) REFERENCES PTIS.TaxMaster(Id),
		CONSTRAINT FK_TaxPercentageMasterRV_TypeOfUseId FOREIGN KEY (TypeOfUseId) REFERENCES PTIS.TypeOfUseMaster(Id),
		CONSTRAINT FK_TaxPercentageMasterRV_AssessmentYearRangeRVId FOREIGN KEY (YearRangeRVId) REFERENCES PTIS.AssessmentYearRangeMasterRV(Id),
		CONSTRAINT UQ_TaxPercentageMasterRV_TaxId_TypeOfUseId_YearRangeRVId UNIQUE (TaxId, TypeOfUseId, YearRangeRVId)
) ON [PRIMARY]
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

CREATE TABLE [PTIS].[DepreciationMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[YearRangeRVId] [int] NOT NULL,
	[MinYear] [int] NULL,
	[MaxYear] [int] NULL,
	[Rate] [money] NULL,
	-- [Year] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_DepreciationMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_DepreciationMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
 CONSTRAINT [PK_DepreciationMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_DepreciationMaster] UNIQUE ([ConstructionTypeId], [YearRangeRVId], [MinYear], [MaxYear])
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[DepreciationMaster] WITH CHECK ADD CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([Id]);
GO

ALTER TABLE [PTIS].[DepreciationMaster] CHECK CONSTRAINT [FK_DepreciationMaster_ConstructionTypeMaster];
GO


ALTER TABLE [PTIS].[DepreciationMaster] WITH CHECK ADD CONSTRAINT [FK_DepreciationMaster_AssessmentYearRangeMasterRV]
FOREIGN KEY([YearRangeRVId]) REFERENCES [PTIS].[AssessmentYearRangeMasterRV]([Id]);
GO
ALTER TABLE [PTIS].[DepreciationMaster] CHECK CONSTRAINT [FK_DepreciationMaster_AssessmentYearRangeMasterRV];

/****** Object:  Table [PTIS].[EducationTaxMaster]******/

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

CREATE TABLE [PTIS].[FlagMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_FlagMaster_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL ,
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

ALTER TABLE [PTIS].[FlagMaster]  WITH CHECK ADD  CONSTRAINT [FK_FlagMaster_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[FlagMaster] CHECK CONSTRAINT [FK_FlagMaster_PropertyMast]
GO

/****** Object:  Table [PTIS].[FloorFactorCVMaster]******/

CREATE TABLE [PTIS].[FloorFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorId] [int] NOT NULL,
	[FactorWithLift] [decimal](5, 2) NULL,
	[FactorWithoutLift] [decimal](5, 2) NULL,
	[YearRangeCVId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FloorFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_FloorFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FloorFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_FloorFactorCVMaster] UNIQUE ([FloorId], [YearRangeCVId])
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[FloorFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster]
FOREIGN KEY([FloorId]) REFERENCES [PTIS].[FloorMaster]([Id]);
GO

ALTER TABLE [PTIS].[FloorFactorCVMaster] CHECK CONSTRAINT [FK_FloorFactorCVMaster_FloorMaster];
GO

ALTER TABLE [PTIS].[FloorFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_FloorFactorCVMaster_AssessmentYearRangeCVMaster]
FOREIGN KEY([YearRangeCVId]) REFERENCES [PTIS].[AssessmentYearRangeMasterCV]([Id]);
GO	
ALTER TABLE [PTIS].[FloorFactorCVMaster] CHECK CONSTRAINT [FK_FloorFactorCVMaster_AssessmentYearRangeCVMaster];
GO



/****** Object:  Table [PTIS].[RoomWiseSubmissionDetails]******/

CREATE TABLE [PTIS].[RoomWiseSubmissionDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime] NULL ,
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
FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([Id]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyDetails];
GO

ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH CHECK
ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast]
FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id]);
GO
ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_PropertyMast];
GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster]
-- FOREIGN KEY([ConstructionTypeId])
-- REFERENCES [PTIS].[ConstructionTypeMaster] ([Id]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_ConstructionTypeMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_FloorMaster]
-- FOREIGN KEY([FloorId])
-- REFERENCES [PTIS].[FloorMaster] ([Id]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- WITH CHECK CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_FloorMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_TypeOfUseMaster]
-- FOREIGN KEY([TypeOfUseId])
-- REFERENCES [PTIS].[TypeOfUseMaster] ([Id]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- WITH CHECK CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_TypeOfUseMaster];
-- GO

-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails] WITH NOCHECK
-- ADD CONSTRAINT [FK_RoomWiseSubmissionDetails_SubFloorMaster]
-- FOREIGN KEY([SubFloorId])
-- REFERENCES [PTIS].[SubFloorMaster] ([Id]);
-- GO
-- ALTER TABLE [PTIS].[RoomWiseSubmissionDetails]
-- CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_SubFloorMaster];
-- GO
/****** Object:  Table [PTIS].[FloorSubmissionRoomNoDetail]******/
/****** Object:  Table [PTIS].[RoomNoCountMaster] ******/
 CREATE TABLE [PTIS].[RoomNoCountMaster](
 	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
 	[RoomNo] [nvarchar](100) NOT NULL,
 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomNoCountMaster_IsActive] DEFAULT (1),
 	[CreatedBy] [int] NULL,
 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomNoCountMaster_CreatedDate DEFAULT (GETDATE()),
 	[UpdatedBy] [int] NULL,
 	[UpdatedDate] [datetime] NULL,
  CONSTRAINT [PK_RoomNoCountMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
  CONSTRAINT UQ_RoomNoCountMaster_RoomNo UNIQUE (RoomNo)
 ) ON [PRIMARY]
 GO


/****** Object:  Table [PTIS].[NatureFactorCVMaster]******/

CREATE TABLE [PTIS].[NatureFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[YearRangeCVId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_NatureFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_NatureFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NatureFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_NatureFactorCVMaster] UNIQUE ([ConstructionTypeId], [YearRangeCVId])
) ON [PRIMARY]
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster]
FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([Id]);
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] CHECK CONSTRAINT [FK_NatureFactorCVMaster_ConstructionTypeMaster];
GO

ALTER TABLE [PTIS].[NatureFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_NatureFactorCVMaster_AssessmentYearRangeMasterCV] FOREIGN KEY([YearRangeCVId]) 
REFERENCES [PTIS].[AssessmentYearRangeMasterCV]([Id]);
GO
ALTER TABLE [PTIS].[NatureFactorCVMaster] CHECK CONSTRAINT [FK_NatureFactorCVMaster_AssessmentYearRangeMasterCV];
GO

/****** Object:  Table [PTIS].[RateSectionDetails]******/

CREATE TABLE [PTIS].[RateSectionDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RateSectionId] [int] NOT NULL,
	[WardId] int NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RateSectionDetails_IsActive] DEFAULT (1),
	[CreatedBy] int NULL,
    [CreatedDate] datetime NOT NULL CONSTRAINT DF_RateSectionDetails_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] int NULL,
    [UpdatedDate] datetime NULL,
    CONSTRAINT [PK_RateSectionDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

alter table [PTIS].[RateSectionDetails] with check add constraint [FK_RateSectionDetails_RateSectionMaster]	
foreign key([RateSectionId]) references [PTIS].[RateSectionMaster] ([Id]);
GO
alter table [PTIS].[RateSectionDetails] check constraint [FK_RateSectionDetails_RateSectionMaster];

ALTER TABLE [PTIS].[RateSectionDetails] WITH CHECK ADD CONSTRAINT [FK_RateSectionDetails_WardMaster]
FOREIGN KEY([WardId]) REFERENCES [PTIS].[WardMaster] ([Id]);
GO
ALTER TABLE [PTIS].[RateSectionDetails] CHECK CONSTRAINT [FK_RateSectionDetails_WardMaster];
GO	



ALTER TABLE [PTIS].[RateSectionDetails] ADD CONSTRAINT [UQ_RateSectionDetails_RateSection_Ward]
UNIQUE ([RateSectionId], [WardId]);
GO

/****** Object:  Table [PTIS].[ParkingTypeMaster]******/

CREATE TABLE [PTIS].[ParkingTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
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
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([Id]);
GO

ALTER TABLE [PTIS].[ParkingTypeMaster] CHECK CONSTRAINT [FK_ParkingTypeMaster_TypeOfUseMaster];
GO

/****** Object:  Table [PTIS].[PartTypeMaster]******/

CREATE TABLE [PTIS].[PartTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PartType] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PartTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PartTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartTypeMaster_1] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_PartTypeMaster_PartType] UNIQUE ([PartType])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PenaltyDetails]******/

-- CREATE TABLE [PTIS].[PenaltyDetails](
-- 	[PenaltyId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
-- 	[YearId] [int] NOT NULL,
-- 	[PropertyId] [int] NULL,
-- 	[CurrentPenalty] [money] NULL,
-- 	[PendingPenalty] [money] NULL,
-- 	[PaidPendPenalty] [money] NULL,
-- 	[PaidCurrentPenalty] [money] NULL,
-- 	[PreviousYearCurrentPenalty] [money] NULL,
-- 	[PreviousYearPendingPenalty] [money] NULL,
-- 	[PayablePendingPenalty] [money] NULL,
-- 	[PayablePreviousYearPendingPenalty] [money] NULL,
-- 	[PayablePreviousYearCurrentPenalty] [money] NULL,
-- 	[PayableCurrentPenalty] [money] NULL,
-- 	[LastDate] [datetime] NULL,
-- 	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PenaltyDetails_MarkedForDeletion] DEFAULT (0),
-- 	[MarkedForDeletionDate] [datetime]  NULL ,
-- 	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PenaltyDetails_IsActive] DEFAULT (1),
-- 	[CreatedBy] [int] NULL,
-- 	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PenaltyDetails_CreatedDate DEFAULT (GETDATE()),
-- 	[UpdatedBy] [int] NULL,
-- 	[UpdatedDate] [datetime] NULL,
--  CONSTRAINT [PK_PenaltyDetails] PRIMARY KEY CLUSTERED ([PenaltyId] ASC),
--  CONSTRAINT FK_PenaltyMaster_YearMaster  FOREIGN KEY (YearId) REFERENCES [CORE].[YearMaster](YearId)
-- ) ON [PRIMARY]
-- GO

-- ALTER TABLE [PTIS].[PenaltyDetails]  WITH CHECK ADD  CONSTRAINT [FK_PenaltyDetails_PropertyMast] FOREIGN KEY([PropertyId])
-- REFERENCES [PTIS].[PropertyMast] ([Id])
-- GO
-- ALTER TABLE [PTIS].[PenaltyDetails] CHECK CONSTRAINT [FK_PenaltyDetails_PropertyMast]
-- GO

-- /****** Object:  Table [PTIS].[PlotDetails]******/

CREATE TABLE [PTIS].[PlotDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime]  NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PlotDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PlotDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PlotDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PlotDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlotDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PlotDetails] CHECK CONSTRAINT [FK_PlotDetails_PropertyMast]
GO



CREATE TABLE [PTIS].[PlotTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PlotTypeName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PlotTypeMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PlotTypeMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PlotTypeMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[PropertyAssessmentDetails]******/

CREATE TABLE [PTIS].[PropertyAssessmentDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime]  NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyAssessmentDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyAssessmentDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyAssessmentDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertyAssessmentDetails] CHECK CONSTRAINT [FK_PropertyAssessmentDetails_PropertyMast]
GO
ALTER TABLE [PTIS].[PropertyAssessmentDetails] ADD CONSTRAINT UQ_PropertyAssessmentDetails_PropertyId UNIQUE (PropertyId);
GO


/****** Object:  Table [PTIS].[PropertyDescriptionAndTypeOfUseValidation] ******/
CREATE TABLE [PTIS].[PropertyDescriptionAndTypeOfUseValidation](
	[Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDescriptionAndTypeOfUseValidation_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDescriptionAndTypeOfUseValidation_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_PropertyDescriptionAndTypeOfUseValidation] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_PropertyDescriptionAndTypeOfUseValidation_PropertyType]
        FOREIGN KEY ([PropertyTypeId]) 
        REFERENCES [PTIS].[PropertyTypeMaster]([Id]),
	CONSTRAINT [FK_PropertyDescriptionAndTypeOfUseValidation_TypeOfUse]
		FOREIGN KEY ([TypeOfUseId]) 
		REFERENCES [PTIS].[TypeOfUseMaster]([Id]),
	CONSTRAINT [UQ_PropertyDescriptionAndTypeOfUseValidation] UNIQUE ([PropertyTypeId], [TypeOfUseId])
	
) ON [PRIMARY];
GO

/****** Object:  Table [PTIS].[PropertyDetailsOld]******/

CREATE TABLE [PTIS].[PropertyDetailsOld](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NOT NULL,
	[OldFloorId] [nvarchar](10) NULL,
	[OldConstructionYear] [varchar](4) NULL,
	[OldConstructionTypeId] [varchar](7) NULL,
	[OldTypeOfUseId] [nvarchar](20) NULL,
	[OldCarpetAreaSqfeet] [float] NULL,
	[OldCarpetAreaSqMeter] [float] NULL,
	[OldRegistration] [bit] NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsOld_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime]  NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyDetailsOld_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyDetailsOld_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OldPropertyDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertyDetailsOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyDetailsOld_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertyDetailsOld] CHECK CONSTRAINT [FK_PropertyDetailsOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertyImagesMast]******/

CREATE TABLE [PTIS].[PropertyImagesMast](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime] NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyImagesMast_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyImagesMast_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyImagesMast] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO
ALTER TABLE [PTIS].[PropertyImagesMast]  WITH CHECK ADD  CONSTRAINT [FK_PropertyImagesMast_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertyImagesMast] CHECK CONSTRAINT [FK_PropertyImagesMast_PropertyMast]
GO



/****** Object:  Table [PTIS].[UsageCategoryMaster]******/

CREATE TABLE [PTIS].[UsageCategoryMaster](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](80) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UsageCategoryMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_UsageCategoryMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UsageCategoryMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT UQ_UsageCategoryMaster_Description UNIQUE (Description)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyMastDetails]******/

CREATE TABLE [PTIS].[PropertyMastDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PropertyId] [int] NULL,
	[OwnerTypeId] int NULL,
	-- [WingName] [nvarchar](30) NULL,
	-- [WingId] [int] NULL,
	-- [WingNo] [nvarchar](20) NULL,
	[AssessmentRemark] [nvarchar](400) NULL,
	[SurveyRemark] [nvarchar](400) NULL,
	[FlatSystemRemark] [nvarchar](400) NULL,
	[CombPropRemark] [nvarchar](400) NULL,
	[AdharCardNo] [varchar](12) NULL,
	-- [ManagerMobileNo] [varchar](13) NULL,
	[RenterMobileNo] [varchar](13) NULL,
	-- [SecretaryMobileNo] [varchar](13) NULL,
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
	[MarkedForDeletionDate] [datetime] NULL ,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMastDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMastDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyMastDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_PropertyMast_PropertyId] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_PropertyMast_PropertyId]
GO

alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster] FOREIGN KEY([OwnerTypeId])
REFERENCES [PTIS].[OwnerTypeMaster] ([Id])	
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_OwnerTypeMaster]


GO
alter table [PTIS].[PropertyMastDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster] FOREIGN KEY([UsageCategoryId])
REFERENCES [PTIS].[UsageCategoryMaster] ([Id])
GO
ALTER TABLE [PTIS].[PropertyMastDetails] CHECK CONSTRAINT [FK_PropertyMastDetails_UsageCategoryMaster]	
GO

/****** Object:  Table [PTIS].[PropertyMastOld]******/

CREATE TABLE [PTIS].[PropertyMastOld](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyMastOld_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyMastOld_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyMastOld] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY] 
GO

ALTER TABLE [PTIS].[PropertyMastOld]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMastOld_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertyMastOld] CHECK CONSTRAINT [FK_PropertyMastOld_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetails]******/

CREATE TABLE [PTIS].[PropertySocialDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertySocialDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertySocialDetails_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertySocialDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[PropertySocialDetails]  WITH CHECK ADD  CONSTRAINT [FK_PropertySocialDetails_PropertyMast] FOREIGN KEY([PropertyId])
REFERENCES [PTIS].[PropertyMast] ([Id])
GO

ALTER TABLE [PTIS].[PropertySocialDetails] CHECK CONSTRAINT [FK_PropertySocialDetails_PropertyMast]
GO

/****** Object:  Table [PTIS].[PropertySocialDetailsSequenceMaster]******/

CREATE TABLE [PTIS].[PropertySocialDetailsSequenceMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FieldName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertySocialDetailsSequenceMaster_IsActive] DEFAULT (1),
	[SequenceNo] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertySocialDetailsSequenceMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT UQ_PropertySocialDetailsSequenceMaster_FieldName UNIQUE (FieldName)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[PropertyTaxCalculationRVResults]******/

CREATE TABLE [PTIS].[PropertyTaxCalculationRVResults](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] [int] NOT NULL,
    [PropertyDetailsId] [int] NOT NULL,
    [MonthlyRate] [float] NULL,
    [YearlyRate] [float] NULL,
    [YearlyRent] [float] NULL,
    [Depreciation] [money] NULL,
    [AnnualRentalValue] [float] NULL,
    [Maintenance] [money] NULL,
    [RateableValue] [money] NULL,
    [TaxId] [int] NOT NULL,
    [TaxPercentage] [money] NULL,
    [TaxAmount] [money] NULL,
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
	[MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationRVResults_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationRVResults_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,
    CONSTRAINT [PK_PropertyTaxCalculationRVResults] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyMast] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationRVResults_PropertyDetails] FOREIGN KEY ([PropertyDetailsId]) REFERENCES [PTIS].[PropertyDetails] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationRVResults_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES [PTIS].[TaxMaster] ([Id])
);
GO

---****** Object:  Table [PTIS].[PropertyTaxCalculationCVResults]******/
CREATE TABLE [PTIS].[PropertyTaxCalculationCVResults](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyDetailsId] [int] NOT NULL,
    [PropertyId] [int] NOT NULL,
    [SDRR] [float] NULL,
    [BaseValue] [float] NULL,
    [FloorFactor] [float] NULL,
    [AgeFactor] [float] NULL,
    [NTBFactor] [float] NULL,
    [UseFactor] [float] NULL,
    [CapitalValue] [money] NULL,
    [TaxId] [int] NOT NULL,
    [TaxPercentage] [money] NULL,
    [TaxAmount] [money] NULL,
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
	[MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationCVResults_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationCVResults_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_PropertyTaxCalculationCVResults] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyMast] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationCVResults_PropertyDetails] FOREIGN KEY ([PropertyDetailsId]) REFERENCES [PTIS].[PropertyDetails] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationCVResults_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES [PTIS].[TaxMaster] ([Id])	
) ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_PropertyTaxCalculationCVResults_PropertyDetails_TaxId]
ON [PTIS].[PropertyTaxCalculationCVResults]([PropertyDetailsId], [TaxId])
WHERE [IsActive] = 1 AND [MarkedForDeletion] = 0
GO



/****** Object:  Table [PTIS].[PropertyTaxCalculationSection129Results] ******/
CREATE TABLE [PTIS].[PropertyTaxCalculationSection129Results](
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyDetailsId] [int] NOT NULL,
    [PropertyId] [int] NOT NULL,
    [RateableValue] [money] NULL,
    [CapitalValue] [money] NULL,
    [TaxId] [int] NOT NULL,
    [TaxPercentage] [money] NULL,
    [TaxAmount] [money] NULL,
    [EducationTax] [money] NULL,
    [EducationTaxPercentage] [money] NULL,
    [EmploymentTax] [money] NULL,
    [EmploymentTaxPercentage] [money] NULL,
    [TotalAreaSqMtr] [float] NULL,
    [RAreaSqMtr] [float] NULL,
    [CAreaSqlMtr] [float] NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationSection129Results_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationSection129Results_IsActive] DEFAULT (1),
    [CreatedBy] [int] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_PropertyTaxCalculationSection129Results_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] [int] NULL,
    [UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_PropertyTaxCalculationSection129Results] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyMast] FOREIGN KEY([PropertyId]) REFERENCES [PTIS].[PropertyMast] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationSection129Results_PropertyDetails] FOREIGN KEY ([PropertyDetailsId]) REFERENCES [PTIS].[PropertyDetails] ([Id]),
    CONSTRAINT [FK_PropertyTaxCalculationSection129Results_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES [PTIS].[TaxMaster] ([Id])
);
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
-- FOREIGN KEY([ConstructionTypeId]) REFERENCES [PTIS].[ConstructionTypeMaster]([Id]);
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
-- FOREIGN KEY([RateSectionId]) REFERENCES [PTIS].[RateSectionMaster]([Id]);	
-- GO
-- ALTER TABLE [PTIS].[RateChartMaster] CHECK CONSTRAINT [FK_RateChartMaster_RateSectionMaster];

/****** Object:  Table [PTIS].[RateMaster]******/

CREATE TABLE [PTIS].[RateMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
--	[Year] [int] NOT NULL,
	[TaxZoneId] [int] NOT NULL,
	[FloorId] [int] NOT NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[TypeOfUseGroupId] [int] NOT NULL,
	[YearRangeRVId] [int] NOT NULL,
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
	
 CONSTRAINT [PK_RateMaster] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]

GO


ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT FK_RateMaster_TaxZoneMaster
FOREIGN KEY (TaxZoneId) REFERENCES PTIS.TaxZoneMaster(Id);
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT FK_RateMaster_TaxZoneMaster;
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_FloorId] 
FOREIGN KEY (FloorId) REFERENCES [PTIS].[FloorMaster](Id);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_FloorId];
GO


ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_ConstructionTypeId]
FOREIGN KEY (ConstructionTypeId) REFERENCES [PTIS].[ConstructionTypeMaster](Id);
GO	
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_ConstructionTypeId];
GO

ALTER TABLE [PTIS].[RateMaster] ADD CONSTRAINT [FK_RateMaster_TypeOfUseGroupId]
FOREIGN KEY (TypeOfUseGroupId) REFERENCES [PTIS].[TypeOfUseGroupMaster](Id);
GO
ALTER TABLE [PTIS].[RateMaster] CHECK CONSTRAINT [FK_RateMaster_TypeOfUseGroupId];
GO

ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT [FK_RateMaster_RateSectionMaster]
FOREIGN KEY (RateSectionId) REFERENCES PTIS.RateSectionMaster(Id);
GO
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT [FK_RateMaster_RateSectionMaster];
GO

ALTER TABLE PTIS.RateMaster WITH CHECK ADD CONSTRAINT FK_RateMaster_AssessmentYearRangeMasterRV
FOREIGN KEY (YearRangeRVId) REFERENCES PTIS.AssessmentYearRangeMasterRV(Id);
GO
ALTER TABLE PTIS.RateMaster CHECK CONSTRAINT FK_RateMaster_AssessmentYearRangeMasterRV;
GO	


ALTER TABLE PTIS.RateMaster ADD CONSTRAINT UQ_RateMaster_TaxZone_Construction_UseGroup_Year_Section
UNIQUE (TaxZoneId,ConstructionTypeId, TypeOfUseGroupId, YearRangeRVId, RateSectionId);
GO

/****** Object:  Table [PTIS].[RateMasterForCV]******/

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



/****** Object:  Table [PTIS].[RetentionFactorMaster] ******/
CREATE TABLE [PTIS].[RetentionFactorMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionFactMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionFactMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionFactMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
  CONSTRAINT UQ_RetentionFactorMaster_FactorValue UNIQUE (FactorValue)
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[RetentionPolicyFactorWiseMaster] ******/
CREATE TABLE [PTIS].[RetentionPolicyFactorWiseMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FromFactor] [float] NULL,
	[ToFactor] [float] NULL,
	[FactorValue] [float] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RetentionPolicyFactWiseMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RetentionPolicyFactWiseMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RetentionPolicyFactWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT UQ_RetentionPolicyFactorWiseMaster_FactorRange UNIQUE (FromFactor, ToFactor),
 CONSTRAINT CK_RetentionPolicyFactorWiseMaster_Range  CHECK (ToFactor >= FromFactor)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[RetentionPolicyYearWiseMaster]******/

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
 CONSTRAINT [PK_RetentionPolicyYearWiseMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT UQ_RetentionPolicyYearWiseMaster_YearRange UNIQUE (FromYear, ToYear),
 CONSTRAINT CK_RetentionPolicyYearWiseMaster_Range  CHECK (ToYear >= FromYear)
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SocietyPartitionNo]******/

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

CREATE TABLE [PTIS].[SubmissionRemarkMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubmissionRemark] [nvarchar](200) NULL,
	[RemarkType] [nvarchar](200) NULL,
	[IsAreaRemark] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionRemarkMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionRemarkMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SubmissionRemarkMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_SubmissionRemarkMaster_SubmissionRemark] UNIQUE ([SubmissionRemark])
) ON [PRIMARY]
GO

/****** Object:  Table [PTIS].[SubmissionSameAsUserHistory]******/

CREATE TABLE [PTIS].[SubmissionSameAsUserHistory](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CopyOn] [int] NULL,
	[SameAs] [int] NULL,
	[Remark] [nvarchar](400) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SubmissionSameAsUserHistory_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_SubmissionSameAsUserHistory_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	
PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO



/****** Object:  Table [PTIS].[TaxNameMaster]******/

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
 CONSTRAINT [PK_TaxNameMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [UQ_TaxNameMaster_TaxName] UNIQUE ([TaxName])
) ON [PRIMARY]
GO





/****** Object:  Table [PTIS].[TaxPendingDetails]******/

CREATE TABLE PTIS.TaxPendingDetails (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetails_ArrearsAmount] DEFAULT (0),
  	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetails_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetails_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_TaxPendingDetails_CreatedDate] DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_TaxPendingDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetails_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetails_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetails_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);

/****** Object:  Table [PTIS].[TaxPendingDetailsArchive]******/


CREATE TABLE  [PTIS].[TaxPendingDetailsArchive](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_ArrearsAmount] DEFAULT (0),
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_TaxPendingDetailsArchive_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TaxPendingDetailsArchive] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetailsArchive_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetailsArchive_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetailsArchive_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);


/****** Object:  Table [PTIS].[TaxPendingDetailsCV]******/

CREATE TABLE  [PTIS].[TaxPendingDetailsCV](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_ArrearsAmount] DEFAULT (0),
   	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_TaxPendingDetailsCV_CreatedDate] DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,

    CONSTRAINT [PK_TaxPendingDetailsCV] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetailsCV_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetailsCV_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetailsCV_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);

/****** Object:  Table [PTIS].[TaxPendingDetailsLookup]******/
CREATE TABLE  [PTIS].[TaxPendingDetailsLookup](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_ArrearsAmount] DEFAULT (0),
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_TaxPendingDetailsLookup_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TaxPendingDetailsLookup] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetailsLookup_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetailsLookup_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetailsLookup_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);

/****** Object:  Table [PTIS].[TaxPendingDetailsRetro]******/

CREATE TABLE  [PTIS].[TaxPendingDetailsRetro](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_ArrearsAmount] DEFAULT (0),
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_TaxPendingDetailsRetro_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TaxPendingDetailsRetro] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetailsRetro_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetailsRetro_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetailsRetro_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);

/****** Object:  Table [PTIS].[TaxPendingDetailsRV]******/

CREATE TABLE  [PTIS].[TaxPendingDetailsRV](
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [PendingYearId] INT NOT NULL,
    [TaxId] INT NOT NULL,
    [PendingAmount] DECIMAL(18,2) NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_ArrearsAmount] DEFAULT (0),
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL CONSTRAINT [DF_TaxPendingDetailsRV_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TaxPendingDetailsRV] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TaxPendingDetailsRV_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TaxPendingDetailsRV_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TaxPendingDetailsRV_YearMaster]  FOREIGN KEY ([PendingYearId]) REFERENCES CORE.YearMaster([Id])
);

/****** Object:  Table [PTIS].[TransMast]******/

CREATE TABLE PTIS.TransMast (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [FinanceYearId] INT NOT NULL,
    [RVorCV] CHAR(2) NOT NULL,                -- RV or CV
    [RVorCVValue] DECIMAL(18,2) NOT NULL,
    [TaxId] INT NOT NULL,                     -- FK to TaxMaster
    [TaxAmount] DECIMAL(18,2) NOT NULL   CONSTRAINT [DF_TransMast_TaxAmount] DEFAULT (0),
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMast_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMast_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME NOT NULL  CONSTRAINT [DF_TransMast_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TransMast]  PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_TransMast_TaxMaster] FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
	CONSTRAINT [FK_TransMast_PropertyMast] FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
	CONSTRAINT [FK_TransMast_YearMaster] FOREIGN KEY ([FinanceYearId]) REFERENCES CORE.YearMaster([Id])
	);

ALTER TABLE PTIS.TransMast ADD CONSTRAINT [UQ_TransMast_Property_Year_Tax] UNIQUE (PropertyId, FinanceYearId, TaxId);
CREATE NONCLUSTERED INDEX IX_TransMast_PropertyYear ON PTIS.TransMast(PropertyId, FinanceYearId)  INCLUDE (TaxId, TaxAmount);
CREATE NONCLUSTERED INDEX IX_TransMast_TaxId ON PTIS.TransMast(TaxId);

/****** Object:  Table [PTIS].[TransMastArchive]******/
CREATE TABLE PTIS.TransMastArchive (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [FinanceYearId] INT NOT NULL,
    [RVorCV] CHAR(2) NOT NULL,
    [RVorCVValue] DECIMAL(18,2) NOT NULL,
    [TaxId] INT NOT NULL,
    [TaxAmount] DECIMAL(18,2) NOT NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastArchive_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastArchive_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME  NOT NULL  CONSTRAINT [DF_TransMastArchive_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TransMastArchive]  PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_TransMastArchive_TaxMaster]  FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TransMastArchive_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TransMastArchive_YearMaster]  FOREIGN KEY ([FinanceYearId]) REFERENCES CORE.YearMaster([Id])    
); 

ALTER TABLE PTIS.TransMastArchive ADD CONSTRAINT [UQ_TransMastArchive_Property_Year_Tax] UNIQUE (PropertyId, FinanceYearId, TaxId);
CREATE NONCLUSTERED INDEX IX_TransMastArchive_PropertyYear ON PTIS.TransMastArchive(PropertyId, FinanceYearId)  INCLUDE (TaxId, TaxAmount);
CREATE NONCLUSTERED INDEX IX_TransMastArchive_TaxId ON PTIS.TransMastArchive(TaxId);


/****** Object:  Table [PTIS].[TransMastCV]******/

CREATE TABLE PTIS.TransMastCV (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [FinanceYearId] INT NOT NULL,
    [CapitalValue] [money] NULL,
    [TaxId] INT NOT NULL,
    [TaxAmount] DECIMAL(18,2) NOT NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastCV_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastCV_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME  NOT NULL  CONSTRAINT [DF_TransMastCV_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TransMastCV]  PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_TransMastCV_TaxMaster]  FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TransMastCV_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TransMastCV_YearMaster]  FOREIGN KEY ([FinanceYearId]) REFERENCES CORE.YearMaster([Id])    
); 


ALTER TABLE PTIS.TransMastCV ADD CONSTRAINT [UQ_TransMastCV_Property_Year_Tax] UNIQUE (PropertyId, FinanceYearId, TaxId);
CREATE NONCLUSTERED INDEX IX_TransMastCV_PropertyYear ON PTIS.TransMastCV(PropertyId, FinanceYearId)  INCLUDE (TaxId, TaxAmount);
CREATE NONCLUSTERED INDEX IX_TransMastCV_TaxId ON PTIS.TransMastCV(TaxId);


/****** Object:  Table [PTIS].[TransMastLookup]******/
CREATE TABLE PTIS.TransMastLookup (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [FinanceYearId] INT NOT NULL,
    [RVorCV] CHAR(2) NOT NULL,
    [RVorCVValue] DECIMAL(18,2) NOT NULL,
    [TaxId] INT NOT NULL,
    [TaxAmount] DECIMAL(18,2) CONSTRAINT [DF_TransMastLookup_TaxAmount] DEFAULT (0),
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastLookup_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastLookup_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME  NOT NULL  CONSTRAINT [DF_TransMastLookup_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TransMastLookup]  PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_TransMastLookup_TaxMaster]  FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TransMastLookup_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TransMastLookup_YearMaster]  FOREIGN KEY ([FinanceYearId]) REFERENCES CORE.YearMaster([Id])    
); 


ALTER TABLE PTIS.TransMastLookup ADD CONSTRAINT [UQ_TransMastLookup_Property_Year_Tax] UNIQUE (PropertyId, FinanceYearId, TaxId);
CREATE NONCLUSTERED INDEX IX_TransMastLookup_PropertyYear ON PTIS.TransMastLookup(PropertyId, FinanceYearId)  INCLUDE (TaxId, TaxAmount);
CREATE NONCLUSTERED INDEX IX_TransMastLookup_TaxId ON PTIS.TransMastLookup(TaxId);


/****** Object:  Table [PTIS].[TransMastRV]******/
CREATE TABLE PTIS.TransMastRV (
    [Id] INT IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyId] INT NOT NULL,
    [FinanceYearId] INT NOT NULL,
    [RateableValue] [money] NULL,
    [TaxId] INT NOT NULL,
    [TaxAmount] DECIMAL(18,2) NOT NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_TransMastRV_MarkedForDeletion] DEFAULT (0),
    [MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_TransMastRV_IsActive] DEFAULT (1),
    [CreatedBy] INT NULL,
    [CreatedDate] DATETIME  NOT NULL  CONSTRAINT [DF_TransMastRV_CreatedDate] DEFAULT (GETDATE()),
    [UpdatedBy] INT NULL,
    [UpdatedDate] DATETIME NULL,

    CONSTRAINT [PK_TransMastRV]  PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_TransMastRV_TaxMaster]  FOREIGN KEY ([TaxId]) REFERENCES PTIS.TaxMaster([Id]),
    CONSTRAINT [FK_TransMastRV_PropertyMast]  FOREIGN KEY ([PropertyId]) REFERENCES PTIS.PropertyMast([Id]),
    CONSTRAINT [FK_TransMastRV_YearMaster]  FOREIGN KEY ([FinanceYearId]) REFERENCES CORE.YearMaster([Id])    
); 

ALTER TABLE PTIS.TransMastRV ADD CONSTRAINT [UQ_TransMastRV_Property_Year_Tax] UNIQUE (PropertyId, FinanceYearId, TaxId);
CREATE NONCLUSTERED INDEX IX_TransMastRV_PropertyYear ON PTIS.TransMastRV(PropertyId, FinanceYearId)  INCLUDE (TaxId, TaxAmount);
CREATE NONCLUSTERED INDEX IX_TransMastRV_TaxId ON PTIS.TransMastRV(TaxId);


/****** Object:  Table [PTIS].[TypeOfUsePrimeMaster]******/

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
	

 CONSTRAINT [PK_TypeOfUsePrimeMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
  CONSTRAINT [UQ_TypeOfUsePrimeMaster_Type] UNIQUE ([Type])
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[UseFactorCVMaster]******/

CREATE TABLE [PTIS].[UseFactorCVMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[SubTypeOfUseId] [int] NOT NULL,
	[Factor] [decimal](5, 2) NOT NULL,
	[YearRangeCVId] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_UseFactorCVMaster_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_UseFactorCVMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UseFactorCVMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT UQ_UseFactorCVMaster_Type_SubType UNIQUE (TypeOfUseId, SubTypeOfUseId,YearRangeCVId)
) ON [PRIMARY]
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_UseFactorCVMaster_TypeOfUseMaster]
FOREIGN KEY([TypeOfUseId]) REFERENCES [PTIS].[TypeOfUseMaster]([Id]);
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] CHECK CONSTRAINT [FK_UseFactorCVMaster_TypeOfUseMaster];
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_UseFactorCVMaster_SubTypeOfUseMaster]
FOREIGN KEY([SubTypeOfUseId]) REFERENCES [PTIS].[SubTypeOfUseMaster]([Id]);
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] CHECK CONSTRAINT [FK_UseFactorCVMaster_SubTypeOfUseMaster];
GO

ALTER TABLE [PTIS].[UseFactorCVMaster] WITH CHECK ADD CONSTRAINT [FK_UseFactorCVMaster_AssessmentYearRangeCVMaster] FOREIGN KEY([YearRangeCVId])
REFERENCES [PTIS].[AssessmentYearRangeMasterCV] ([Id])
GO
ALTER TABLE [PTIS].[UseFactorCVMaster] CHECK CONSTRAINT [FK_UseFactorCVMaster_AssessmentYearRangeCVMaster]
GO

/****** Object:  Table [PTIS].[RoomWiseMinusData] ******/ 
CREATE TABLE [PTIS].[RoomWiseMinusData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RoomWiseSubmissionId] [int] NULL,
	[LengthMtr] [decimal](18, 2) NULL,
	[WidthMtr] [decimal](18, 2) NULL,
	[AreaSqMtr] [decimal](18, 2) NULL,
	[HeightMtr] [decimal](18, 2) NULL,
	[Base1Mtr] [decimal](18, 2) NULL,
	[Base2Mtr] [decimal](18, 2) NULL,
	[Shape] [nvarchar](25) NULL,
	[MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RoomWiseMinusData_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomWiseMinusData_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RoomWiseMinusData_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
CONSTRAINT [PK_RoomWiseMinusData] PRIMARY KEY CLUSTERED ( [Id] ASC )
) ON [PRIMARY]
GO	

ALTER TABLE [PTIS].[RoomWiseMinusData]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails] FOREIGN KEY([RoomWiseSubmissionId])
REFERENCES [PTIS].[RoomWiseSubmissionDetails] ([Id])
GO

ALTER TABLE [PTIS].[RoomWiseMinusData] CHECK CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails]
GO


/****** Object:  Table [PTIS].[RenterDetails] ******/
CREATE TABLE [PTIS].[RenterDetails] (
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_RenterDetails_IsActive] DEFAULT (1),
    [CreatedBy] [INT] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RenterDetails_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] [INT] NULL,
    [UpdatedDate] [DATETIME] NULL,
	CONSTRAINT Pk_RenterDetails PRIMARY KEY CLUSTERED ([Id] ASC	)
    );

GO

ALTER TABLE PTIS.RenterDetails  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_PropertyDetails] FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([Id])
GO	
ALTER TABLE PTIS.RenterDetails CHECK CONSTRAINT [FK_RenterDetails_PropertyDetails]
GO	



/****** Object:  Table [PTIS].[RenterMast] ******/
CREATE TABLE  [PTIS].[RenterMast] (
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
    [PropertyDetailsId] [INT] NOT NULL,
    [FinalRent] [float] NULL,
    [FinancialYear] [nvarchar](4) NULL,
    [DurationFrom] [DATETIME] NULL,
    [DurationTo] [DATETIME] NULL,
    [MarkedForDeletion] [bit] NOT NULL CONSTRAINT [DF_RenterMast_MarkedForDeletion] DEFAULT (0),
	[MarkedForDeletionDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL CONSTRAINT [DF_RenterMast_IsActive] DEFAULT (1),
    [CreatedBy] [INT] NULL,
    [CreatedDate] [datetime] NOT NULL CONSTRAINT DF_RenterMast_CreatedDate DEFAULT (GETDATE()),
    [UpdatedBy] [INT] NULL,
    [UpdatedDate] [DATETIME] NULL,
	CONSTRAINT Pk_RenterMast PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]

GO
ALTER TABLE PTIS.RenterMast  WITH CHECK ADD  CONSTRAINT [FK_RenterMast_PropertyDetails] FOREIGN KEY([PropertyDetailsId])
REFERENCES [PTIS].[PropertyDetails] ([Id])
GO	
ALTER TABLE PTIS.RenterMast CHECK CONSTRAINT [FK_RenterMast_PropertyDetails]
GO



----------- Master For Global Survey App ----Start----------
GO


GO
/****** Object:  Table [PTIS].[GenderMaster] ******/
CREATE TABLE [PTIS].[GenderMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GenderName] NVARCHAR(50) NOT NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_GenderMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_GenderMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT UQ_GenderMaster_GenderName UNIQUE ([GenderName]),
 	CONSTRAINT [PK_GenderMaster] PRIMARY KEY CLUSTERED ( [Id] ASC )
) ON [PRIMARY]
GO


/****** Object:  Table [PTIS].[DocumentMaster] ******/
CREATE TABLE [PTIS].[DocumentMaster](
	[Id] [int] IDENTITY(1,1) not FOR REPLICATION NOT NULL,
	[DocumentName] [nvarchar](100) NOT null, 
	[DocPrefix] [varchar](50) not null, 
	[IsActive] BIT NOT NULl CONSTRAINT DF_documentmaster_IsActive DEFAULT (1),
	[CreatedBy] [int] null,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_documentmaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] null,
	[UpdatedDate] [datetime] null,
PRIMARY KEY CLUSTERED ([Id] ASC),
CONSTRAINT UQ_DocumentMaster_DocumentName UNIQUE (DocumentName)
) ON [primary]
GO

/****** Object:  Table [PTIS].[PropertyVisitMeasurementMaster] ******/
CREATE TABLE [PTIS].[PropertyVisitMeasurementMaster](
	[Id] int NOT NULL IDENTITY(1,1) NOT FOR REPLICATION,
	[PropertyVisitAndMeasurement] [nvarchar](200) NULL,
	[BillAcceptStatus] [varchar](20) NULL,
	[Remark] [varchar](100) NULL,
	[Flag] [varchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_PropertyVisitMeasurementMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_PropertyVisitMeasurement_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC ),
	CONSTRAINT UQ_PropertyVisitMeasurementMaster_PropertyVisitAndMeasurement  UNIQUE (PropertyVisitAndMeasurement)
) ON [PRIMARY]
GO

GO
/****** Object:  Table [PTIS].[MobileScreenValidationMaster] ******/
CREATE TABLE [PTIS].[MobileScreenValidationMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
 CONSTRAINT [PK_TabScreenMaster] PRIMARY KEY CLUSTERED  (	[Id] ASC ),
 CONSTRAINT UQ_MobileScreenValidationMaster_TabScreenName_Flag UNIQUE (TabScreenName, Flag)
) ON [PRIMARY]
 

GO
/****** Object:  Table [PTIS].[BlockMaster] ******/
CREATE TABLE [PTIS].[BlockMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WardId] int NULL,
	[BlockNo] [nvarchar](20) NULL,
	[IsActive] BIT NOT NULl CONSTRAINT DF_BlockMaster_IsActive DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_BlockMaster_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BlockMaster] PRIMARY KEY CLUSTERED  ([Id] ASC),
 CONSTRAINT UQ_BlockMaster_Ward_BlockNo  UNIQUE (WardId, BlockNo),
 CONSTRAINT [FK_BlockMaster_WardMaster] FOREIGN KEY ([WardId]) REFERENCES [PTIS].[WardMaster]([Id])
) ON [PRIMARY]
GO
----------- Master For Global Survey App ----End----------



CREATE TABLE [PTIS].[RuleMaster]
(
    [Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
    CONSTRAINT [PK_RuleMaster] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT UQ_RuleMaster_RuleCode  UNIQUE ([RuleCode])
);
GO

