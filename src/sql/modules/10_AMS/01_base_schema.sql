SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================
-- LEVEL 0: Base tables with no foreign keys
-- ============================================================================

/****** Object:  Table [AMS].[AssetCategoryMaster] ******/
CREATE TABLE [AMS].[AssetCategoryMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CategoryCode] [varchar](100) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ValuationType] [varchar](20) NOT NULL,
	[IsMovable] [bit] NOT NULL,
	[HasFloorDetails] [bit] NOT NULL,
	[HasInventory] [bit] NOT NULL,
	[IsInventoryMandatory] [bit] NOT NULL,
	[HasLegalCompliance] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_AssetCategoryMaster_CategoryCode] UNIQUE NONCLUSTERED 
(
	[CategoryCode] ASC
),
 CONSTRAINT [UQ_AssetCategoryMaster_CategoryName] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetCategoryMaster] ADD  CONSTRAINT [DF_AssetCategoryMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetCategoryMaster] ADD  CONSTRAINT [DF_AssetCategoryMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetCategoryMaster] ADD  CONSTRAINT [DF_AssetCategoryMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO


/****** Object:  Table [AMS].[AuthorityMaster] ******/
CREATE TABLE [AMS].[AuthorityMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorityCode] [varchar](20) NOT NULL,
	[AuthorityName] [nvarchar](200) NOT NULL,
	[State] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AuthorityMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_AuthorityMaster_AuthorityCode] UNIQUE NONCLUSTERED 
(
	[AuthorityCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AuthorityMaster] ADD  CONSTRAINT [DF_AuthorityMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AuthorityMaster] ADD  CONSTRAINT [DF_AuthorityMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AuthorityMaster] ADD  CONSTRAINT [DF_AuthorityMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

/****** Object:  Table [AMS].[InventoryItemCategoryMaster] ******/
CREATE TABLE [AMS].[InventoryItemCategoryMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeCode] [varchar](20) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DepreciationRate] [decimal](5, 4) NOT NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryItemCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_InventoryItemCategoryMaster_TypeCode] UNIQUE NONCLUSTERED 
(
	[TypeCode] ASC
),
 CONSTRAINT [UQ_InventoryItemCategoryMaster_TypeName] UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryItemCategoryMaster] ADD  CONSTRAINT [DF_InventoryItemCategoryMaster_DepreciationRate]  DEFAULT ((0.10)) FOR [DepreciationRate]
GO

ALTER TABLE [AMS].[InventoryItemCategoryMaster] ADD  CONSTRAINT [DF_InventoryItemCategoryMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryItemCategoryMaster] ADD  CONSTRAINT [DF_InventoryItemCategoryMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryItemCategoryMaster] ADD  CONSTRAINT [DF_InventoryItemCategoryMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

/****** Object:  Table [AMS].[OwnershipTypeMaster] ******/
CREATE TABLE [AMS].[OwnershipTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwnershipTypeName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_OwnershipTypeMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_OwnershipTypeMaster_OwnershipTypeName] UNIQUE NONCLUSTERED 
(
	[OwnershipTypeName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[OwnershipTypeMaster] ADD  CONSTRAINT [DF_OwnershipTypeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[OwnershipTypeMaster] ADD  CONSTRAINT [DF_OwnershipTypeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[OwnershipTypeMaster] ADD  CONSTRAINT [DF_OwnershipTypeMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

/****** Object:  Table [AMS].[OwningDepartmentMaster] ******/
CREATE TABLE [AMS].[OwningDepartmentMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OwningDepartmentName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_OwningDepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_OwningDepartmentMaster_OwningDepartmentName] UNIQUE NONCLUSTERED 
(
	[OwningDepartmentName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[OwningDepartmentMaster] ADD  CONSTRAINT [DF_OwningDepartmentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[OwningDepartmentMaster] ADD  CONSTRAINT [DF_OwningDepartmentMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[OwningDepartmentMaster] ADD  CONSTRAINT [DF_OwningDepartmentMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

-- ============================================================================
-- LEVEL 1: Tables depending only on Level 0 tables
-- ============================================================================

/****** Object:  Table [AMS].[AssetTypeMaster] ******/
CREATE TABLE [AMS].[AssetTypeMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AssetCategoryId] [int] NOT NULL,
	[TypeCode] [varchar](50) NOT NULL,
	[TypeName] [nvarchar](200) NOT NULL,
	[TypeNameLocal] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [varchar](100) NULL,
	[CodeFormat] [varchar](100) NOT NULL,
	[LastSequence] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[IsSubUnit] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetTypeMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_AssetTypeMaster_TypeCode] UNIQUE NONCLUSTERED 
(
	[TypeCode] ASC
),
 CONSTRAINT [UQ_AssetTypeMaster_TypeName] UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetTypeMaster] ADD  CONSTRAINT [DF_AssetTypeMaster_LastSequence]  DEFAULT ((0)) FOR [LastSequence]
GO

ALTER TABLE [AMS].[AssetTypeMaster] ADD  CONSTRAINT [DF_AssetTypeMaster_IsSubUnit]  DEFAULT ((0)) FOR [IsSubUnit]
GO

ALTER TABLE [AMS].[AssetTypeMaster] ADD  CONSTRAINT [DF_AssetTypeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetTypeMaster] ADD  CONSTRAINT [DF_AssetTypeMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetTypeMaster] ADD  CONSTRAINT [DF_AssetTypeMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetTypeMaster]  WITH CHECK ADD  CONSTRAINT [FK_AssetTypeMaster_AssetCategoryMaster] FOREIGN KEY([AssetCategoryId])
REFERENCES [AMS].[AssetCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetTypeMaster] CHECK CONSTRAINT [FK_AssetTypeMaster_AssetCategoryMaster]
GO

/****** Object:  Table [AMS].[OrganizationMaster] ******/
CREATE TABLE [AMS].[OrganizationMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorityId] [int] NOT NULL,
	[OrganizationCode] [varchar](20) NOT NULL,
	[OrganizationName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_OrganizationMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_OrganizationMaster_OrgCode] UNIQUE NONCLUSTERED 
(
	[OrganizationCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[OrganizationMaster] ADD  CONSTRAINT [DF_OrganizationMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[OrganizationMaster] ADD  CONSTRAINT [DF_OrganizationMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[OrganizationMaster] ADD  CONSTRAINT [DF_OrganizationMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[OrganizationMaster]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Authority] FOREIGN KEY([AuthorityId])
REFERENCES [AMS].[AuthorityMaster] ([Id])
GO

ALTER TABLE [AMS].[OrganizationMaster] CHECK CONSTRAINT [FK_Organization_Authority]
GO

/****** Object:  Table [AMS].[InventoryItemConditionMaster] ******/
CREATE TABLE [AMS].[InventoryItemConditionMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InventoryItemCategoryId] [int] NOT NULL,
	[ConditionName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ConditionFactor] [decimal](5, 4) NOT NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryItemConditionMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_InventoryItemConditionMaster_CategoryCondition] UNIQUE NONCLUSTERED 
(
	[InventoryItemCategoryId] ASC,
	[ConditionName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster] ADD  CONSTRAINT [DF_InventoryItemConditionMaster_ConditionFactor]  DEFAULT ((1.0)) FOR [ConditionFactor]
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster] ADD  CONSTRAINT [DF_InventoryItemConditionMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster] ADD  CONSTRAINT [DF_InventoryItemConditionMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster] ADD  CONSTRAINT [DF_InventoryItemConditionMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemConditionMaster_InventoryItemCategoryMaster] FOREIGN KEY([InventoryItemCategoryId])
REFERENCES [AMS].[InventoryItemCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[InventoryItemConditionMaster] CHECK CONSTRAINT [FK_InventoryItemConditionMaster_InventoryItemCategoryMaster]
GO

/****** Object:  Table [AMS].[InventoryItemNameMaster] ******/
CREATE TABLE [AMS].[InventoryItemNameMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InventoryItemCategoryId] [int] NOT NULL,
	[SubTypeCode] [varchar](50) NOT NULL,
	[SubTypeName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryItemNameMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_InventoryItemNameMaster_CategorySubTypeCode] UNIQUE NONCLUSTERED 
(
	[InventoryItemCategoryId] ASC,
	[SubTypeCode] ASC
),
 CONSTRAINT [UQ_InventoryItemNameMaster_CategorySubTypeName] UNIQUE NONCLUSTERED 
(
	[InventoryItemCategoryId] ASC,
	[SubTypeName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryItemNameMaster] ADD  CONSTRAINT [DF_InventoryItemNameMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryItemNameMaster] ADD  CONSTRAINT [DF_InventoryItemNameMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryItemNameMaster] ADD  CONSTRAINT [DF_InventoryItemNameMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[InventoryItemNameMaster]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemNameMaster_InventoryItemCategoryMaster] FOREIGN KEY([InventoryItemCategoryId])
REFERENCES [AMS].[InventoryItemCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[InventoryItemNameMaster] CHECK CONSTRAINT [FK_InventoryItemNameMaster_InventoryItemCategoryMaster]
GO

-- ============================================================================
-- LEVEL 2: Tables depending on Level 1 tables
-- ============================================================================

/****** Object:  Table [AMS].[AssetDocumentDefinition] ******/
CREATE TABLE [AMS].[AssetDocumentDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetCategoryId] [int] NOT NULL,
	[AssetTypeId] [int] NULL,
	[DocumentCode] [varchar](50) NOT NULL,
	[DocumentName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsRequired] [bit] NOT NULL,
	[MaxFileSizeMB] [int] NOT NULL,
	[AllowedExtensions] [varchar](200) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetDocumentDefinition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_DocDef_CategoryTypeCode] UNIQUE NONCLUSTERED 
(
	[AssetCategoryId] ASC,
	[AssetTypeId] ASC,
	[DocumentCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_IsRequired]  DEFAULT ((0)) FOR [IsRequired]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_MaxFileSizeMB]  DEFAULT ((10)) FOR [MaxFileSizeMB]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_AllowedExtensions]  DEFAULT ('.pdf,.jpg,.jpeg,.png,.doc,.docx') FOR [AllowedExtensions]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] ADD  CONSTRAINT [DF_AssetDocumentDefinition_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition]  WITH CHECK ADD  CONSTRAINT [FK_DocDef_Category] FOREIGN KEY([AssetCategoryId])
REFERENCES [AMS].[AssetCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] CHECK CONSTRAINT [FK_DocDef_Category]
GO

ALTER TABLE [AMS].[AssetDocumentDefinition]  WITH CHECK ADD  CONSTRAINT [FK_DocDef_Type] FOREIGN KEY([AssetTypeId])
REFERENCES [AMS].[AssetTypeMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetDocumentDefinition] CHECK CONSTRAINT [FK_DocDef_Type]
GO

/****** Object:  Table [AMS].[AssetFieldDefinition] ******/
CREATE TABLE [AMS].[AssetFieldDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetCategoryId] [int] NOT NULL,
	[AssetTypeId] [int] NOT NULL,
	[FieldCode] [varchar](50) NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[FieldLabel] [varchar](200) NOT NULL,
	[FieldType] [varchar](50) NOT NULL,
	[FieldGroup] [varchar](100) NULL,
	[IsRequired] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ValidationRules] [varchar](max) NULL,
	[DefaultValue] [varchar](500) NULL,
	[MinValue] [decimal](18, 4) NULL,
	[MaxValue] [decimal](18, 4) NULL,
	[MaxLength] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetFieldDefinition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_FieldDef_CategoryTypeField] UNIQUE NONCLUSTERED 
(
	[AssetCategoryId] ASC,
	[AssetTypeId] ASC,
	[FieldCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetFieldDefinition] ADD  CONSTRAINT [DF_AssetFieldDefinition_IsRequired]  DEFAULT ((0)) FOR [IsRequired]
GO

ALTER TABLE [AMS].[AssetFieldDefinition] ADD  CONSTRAINT [DF_AssetFieldDefinition_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO

ALTER TABLE [AMS].[AssetFieldDefinition] ADD  CONSTRAINT [DF_AssetFieldDefinition_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetFieldDefinition] ADD  CONSTRAINT [DF_AssetFieldDefinition_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetFieldDefinition] ADD  CONSTRAINT [DF_AssetFieldDefinition_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetFieldDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FieldDef_Category] FOREIGN KEY([AssetCategoryId])
REFERENCES [AMS].[AssetCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFieldDefinition] CHECK CONSTRAINT [FK_FieldDef_Category]
GO

ALTER TABLE [AMS].[AssetFieldDefinition]  WITH CHECK ADD  CONSTRAINT [FK_FieldDef_Type] FOREIGN KEY([AssetTypeId])
REFERENCES [AMS].[AssetTypeMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFieldDefinition] CHECK CONSTRAINT [FK_FieldDef_Type]
GO

/****** Object:  Table [AMS].[DepartmentMaster] ******/
CREATE TABLE [AMS].[DepartmentMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[DepartmentCode] [varchar](20) NOT NULL,
	[DepartmentName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_DepartmentMaster_DeptCode] UNIQUE NONCLUSTERED 
(
	[OrganizationId] ASC,
	[DepartmentCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[DepartmentMaster] ADD  CONSTRAINT [DF_DepartmentMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[DepartmentMaster]  WITH CHECK ADD  CONSTRAINT [FK_Department_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [AMS].[OrganizationMaster] ([Id])
GO

ALTER TABLE [AMS].[DepartmentMaster] CHECK CONSTRAINT [FK_Department_Organization]
GO

/****** Object:  Table [AMS].[InventoryItemModelMaster] ******/
CREATE TABLE [AMS].[InventoryItemModelMaster](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InventoryItemNameId] [int] NOT NULL,
	[ModelName] [varchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryItemModelMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_InventoryItemModelMaster_ItemNameModel] UNIQUE NONCLUSTERED 
(
	[InventoryItemNameId] ASC,
	[ModelName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryItemModelMaster] ADD  CONSTRAINT [DF_InventoryItemModelMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryItemModelMaster] ADD  CONSTRAINT [DF_InventoryItemModelMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryItemModelMaster] ADD  CONSTRAINT [DF_InventoryItemModelMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[InventoryItemModelMaster]  WITH CHECK ADD  CONSTRAINT [FK_InventoryItemModelMaster_InventoryItemNameMaster] FOREIGN KEY([InventoryItemNameId])
REFERENCES [AMS].[InventoryItemNameMaster] ([Id])
GO

ALTER TABLE [AMS].[InventoryItemModelMaster] CHECK CONSTRAINT [FK_InventoryItemModelMaster_InventoryItemNameMaster]
GO

-- ============================================================================
-- LEVEL 3: AssetMaster table (depends on Level 0-2 tables, plus external PTIS tables)
-- NOTE: AssetMaster has a circular dependency with InventoryBatch
-- We create AssetMaster first without the InventoryBatch FK constraint
-- ============================================================================

/****** Object:  Table [AMS].[AssetMaster] ******/
CREATE TABLE [AMS].[AssetMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorityId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[DepartmentId] [int] NULL,
	[AssetNo] [varchar](50) NOT NULL,
	[AssetName] [nvarchar](200) NOT NULL,
	[AssetCategoryId] [int] NOT NULL,
	[AssetTypeId] [int] NOT NULL,
	[ParentAssetId] [int] NULL,
	[HierarchyLevel] [int] NOT NULL,
	[HierarchyPath] [varchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[WardId] [int] NULL,
	[ZoneId] [int] NULL,
	[SubZoneId] [int] NULL,
	[MoujaId] [int] NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[CSN] [varchar](30) NULL,
	[TypeOfUseId] [int] NULL,
	[SubTypeOfUseId] [int] NULL,
	[BuiltupAreaSqMeter] [decimal](18, 4) NULL,
	[CarpetAreaSqMeter] [decimal](18, 4) NULL,
	[LandAreaSqMeter] [decimal](18, 4) NULL,
	[HasLift] [bit] NOT NULL,
	[PurchaseValue] [decimal](18, 2) NULL,
	[PurchaseDate] [date] NULL,
	[MarketValue] [decimal](18, 2) NULL,
	[MarketValueDate] [date] NULL,
	[CapitalValue] [decimal](18, 2) NULL,
	[LastCVCalculationDate] [datetime] NULL,
	[CurrentBookValue] [decimal](18, 2) NULL,
	[DepreciationRate] [decimal](5, 2) NULL,
	[OwnershipType] [varchar](50) NULL,
	[Status] [varchar](50) NOT NULL,
	[OccupancyStatus] [varchar](50) NULL,
	[IsRevenueGenerating] [bit] NOT NULL,
	[OperationalControl] [nvarchar](100) NULL,
	[AssetCondition] [varchar](100) NULL,
	[InventoryBatchId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
	[FloorDetailsId] [int] NULL,
 CONSTRAINT [PK_AssetMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_AssetMaster_AssetNo] UNIQUE NONCLUSTERED 
(
	[AssetNo] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_HierarchyLevel]  DEFAULT ((0)) FOR [HierarchyLevel]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_HasLift]  DEFAULT ((0)) FOR [HasLift]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_Status]  DEFAULT ('Active') FOR [Status]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_IsRevenueGenerating]  DEFAULT ((0)) FOR [IsRevenueGenerating]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetMaster] ADD  CONSTRAINT [DF_AssetMaster_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Authority] FOREIGN KEY([AuthorityId])
REFERENCES [AMS].[AuthorityMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Authority]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Category] FOREIGN KEY([AssetCategoryId])
REFERENCES [AMS].[AssetCategoryMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Category]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Department] FOREIGN KEY([DepartmentId])
REFERENCES [AMS].[DepartmentMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Department]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Mouja] FOREIGN KEY([MoujaId])
REFERENCES [PTIS].[MoujaMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Mouja]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [AMS].[OrganizationMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Organization]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Parent] FOREIGN KEY([ParentAssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Parent]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SubTypeOfUse] FOREIGN KEY([SubTypeOfUseId])
REFERENCES [PTIS].[SubTypeOfUseMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_SubTypeOfUse]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SubZone] FOREIGN KEY([SubZoneId])
REFERENCES [PTIS].[SubZoneDetailsForCV] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_SubZone]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Type] FOREIGN KEY([AssetTypeId])
REFERENCES [AMS].[AssetTypeMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Type]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_TypeOfUse] FOREIGN KEY([TypeOfUseId])
REFERENCES [PTIS].[TypeOfUseMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_TypeOfUse]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Ward] FOREIGN KEY([WardId])
REFERENCES [PTIS].[WardMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Ward]
GO

ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Zone] FOREIGN KEY([ZoneId])
REFERENCES [PTIS].[ZoneMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_Asset_Zone]
GO

-- ============================================================================
-- LEVEL 4: Tables depending on AssetMaster (and other lower-level tables)
-- ============================================================================

/****** Object:  Table [AMS].[InventoryBatch] ******/
CREATE TABLE [AMS].[InventoryBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentAssetId] [int] NOT NULL,
	[InventoryType] [nvarchar](50) NOT NULL,
	[ItemName] [nvarchar](200) NOT NULL,
	[ModelBrand] [varchar](200) NOT NULL,
	[Specifications] [varchar](500) NULL,
	[PurchaseDate] [date] NOT NULL,
	[Condition] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitValue] [decimal](18, 2) NOT NULL,
	[TotalBatchValue] [decimal](18, 2) NOT NULL,
	[TotalBatchCV] [decimal](18, 2) NULL,
	[InvoiceNumber] [nvarchar](100) NULL,
	[InvoiceDate] [date] NULL,
	[InvoiceFileName] [varchar](200) NULL,
	[OwningDepartment] [nvarchar](200) NULL,
	[PhotoFileName] [varchar](200) NULL,
	[AssetNoPrefix] [varchar](20) NOT NULL,
	[IsRegistered] [bit] NOT NULL,
	[RegisteredDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryBatch] ADD  CONSTRAINT [DF_InventoryBatch_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO

ALTER TABLE [AMS].[InventoryBatch] ADD  CONSTRAINT [DF_InventoryBatch_IsRegistered]  DEFAULT ((0)) FOR [IsRegistered]
GO

ALTER TABLE [AMS].[InventoryBatch] ADD  CONSTRAINT [DF_InventoryBatch_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryBatch] ADD  CONSTRAINT [DF_InventoryBatch_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryBatch] ADD  CONSTRAINT [DF_InventoryBatch_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[InventoryBatch]  WITH CHECK ADD  CONSTRAINT [FK_InventoryBatch_ParentAsset] FOREIGN KEY([ParentAssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[InventoryBatch] CHECK CONSTRAINT [FK_InventoryBatch_ParentAsset]
GO

-- Now add the circular FK from AssetMaster to InventoryBatch
ALTER TABLE [AMS].[AssetMaster]  WITH CHECK ADD  CONSTRAINT [FK_AssetMaster_InventoryBatch] FOREIGN KEY([InventoryBatchId])
REFERENCES [AMS].[InventoryBatch] ([Id])
GO

ALTER TABLE [AMS].[AssetMaster] CHECK CONSTRAINT [FK_AssetMaster_InventoryBatch]
GO

/****** Object:  Table [AMS].[AssetFloorDetails] ******/
CREATE TABLE [AMS].[AssetFloorDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[FloorId] [int] NOT NULL,
	[SubFloorId] [int] NULL,
	[ConstructionYear] [varchar](4) NULL,
	[AssessmentYear] [nvarchar](4) NULL,
	[ConstructionTypeId] [int] NOT NULL,
	[TypeOfUseId] [int] NOT NULL,
	[SubTypeOfUseId] [int] NULL,
	[CarpetAreaSqMeter] [decimal](18, 4) NULL,
	[CarpetAreaSqFeet] [decimal](18, 4) NULL,
	[BuiltupAreaSqMeter] [decimal](18, 4) NULL,
	[BuiltupAreaSqFeet] [decimal](18, 4) NULL,
	[NoOfRooms] [int] NULL,
	[CapitalValue] [decimal](18, 2) NULL,
	[MarketValue] [decimal](18, 2) NULL,
	[BaseValue] [decimal](18, 2) NULL,
	[CVBaseRate] [decimal](18, 2) NULL,
	[CVAgeFactor] [decimal](5, 4) NULL,
	[CVFloorFactor] [decimal](5, 4) NULL,
	[CVNatureFactor] [decimal](5, 4) NULL,
	[CVUseFactor] [decimal](5, 4) NULL,
	[CVCalculationFormula] [varchar](500) NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[LastCVCalculationDate] [datetime] NULL,
	[AgreementDate] [datetime] NULL,
	[AgreementFromDate] [datetime] NULL,
	[AgreementToDate] [datetime] NULL,
	[IsRented] [bit] NULL,
	[NonCalculateRentMonthly] [decimal](18, 2) NULL,
	[OccupancyApplied] [bit] NULL,
	[OccupancyDate] [datetime] NULL,
	[OccupancyNumber] [varchar](30) NULL,
	[RentMonthly] [decimal](18, 2) NULL,
	[RentYearly] [decimal](18, 2) NULL,
	[RenterNameEnglish] [varchar](500) NULL,
	[RenterNameLocal] [nvarchar](500) NULL,
 CONSTRAINT [PK_AssetFloorDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_AssetFloorDetails_AssetFloor] UNIQUE NONCLUSTERED 
(
	[AssetId] ASC,
	[FloorId] ASC,
	[SubFloorId] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetFloorDetails] ADD  CONSTRAINT [DF_AssetFloorDetails_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetFloorDetails] ADD  CONSTRAINT [DF_AssetFloorDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetFloorDetails] ADD  CONSTRAINT [DF_AssetFloorDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_Asset]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_ConstructionType] FOREIGN KEY([ConstructionTypeId])
REFERENCES [PTIS].[ConstructionTypeMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_ConstructionType]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_Floor] FOREIGN KEY([FloorId])
REFERENCES [PTIS].[FloorMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_Floor]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_SubFloor] FOREIGN KEY([SubFloorId])
REFERENCES [PTIS].[SubFloorMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_SubFloor]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_SubTypeOfUse] FOREIGN KEY([SubTypeOfUseId])
REFERENCES [PTIS].[SubTypeOfUseMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_SubTypeOfUse]
GO

ALTER TABLE [AMS].[AssetFloorDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetFloorDetails_TypeOfUse] FOREIGN KEY([TypeOfUseId])
REFERENCES [PTIS].[TypeOfUseMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFloorDetails] CHECK CONSTRAINT [FK_AssetFloorDetails_TypeOfUse]
GO

/****** Object:  Table [AMS].[AssetFormData] ******/
CREATE TABLE [AMS].[AssetFormData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[SectionCode] [varchar](50) NOT NULL,
	[SectionName] [nvarchar](200) NOT NULL,
	[FormData] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetFormData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_FormData_AssetSection] UNIQUE NONCLUSTERED 
(
	[AssetId] ASC,
	[SectionCode] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetFormData] ADD  CONSTRAINT [DF_AssetFormData_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO

ALTER TABLE [AMS].[AssetFormData] ADD  CONSTRAINT [DF_AssetFormData_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetFormData] ADD  CONSTRAINT [DF_AssetFormData_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetFormData] ADD  CONSTRAINT [DF_AssetFormData_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetFormData]  WITH CHECK ADD  CONSTRAINT [FK_FormData_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFormData] CHECK CONSTRAINT [FK_FormData_Asset]
GO

/****** Object:  Table [AMS].[AssetFieldValue] ******/
CREATE TABLE [AMS].[AssetFieldValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[FieldDefinitionId] [int] NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[TextValue] [nvarchar](max) NULL,
	[NumberValue] [decimal](18, 4) NULL,
	[DateValue] [datetime] NULL,
	[BooleanValue] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetFieldValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_FieldValue_AssetField] UNIQUE NONCLUSTERED 
(
	[AssetId] ASC,
	[FieldName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetFieldValue] ADD  CONSTRAINT [DF_AssetFieldValue_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetFieldValue] ADD  CONSTRAINT [DF_AssetFieldValue_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetFieldValue] ADD  CONSTRAINT [DF_AssetFieldValue_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetFieldValue]  WITH CHECK ADD  CONSTRAINT [FK_FieldValue_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetFieldValue] CHECK CONSTRAINT [FK_FieldValue_Asset]
GO

ALTER TABLE [AMS].[AssetFieldValue]  WITH CHECK ADD  CONSTRAINT [FK_FieldValue_FieldDef] FOREIGN KEY([FieldDefinitionId])
REFERENCES [AMS].[AssetFieldDefinition] ([Id])
GO

ALTER TABLE [AMS].[AssetFieldValue] CHECK CONSTRAINT [FK_FieldValue_FieldDef]
GO

/****** Object:  Table [AMS].[PlotDetails] ******/
CREATE TABLE [AMS].[PlotDetails](
	[PlotId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AssetId] [int] NULL,
	[PlotArea] [float] NULL,
	[PlotTaxableAreaSqFt] [float] NULL,
	[OpenPlotType] [varchar](10) NULL,
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
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PlotDetails] PRIMARY KEY CLUSTERED 
(
	[PlotId] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[PlotDetails] ADD  CONSTRAINT [DF_PlotDetails_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[PlotDetails] ADD  CONSTRAINT [DF_PlotDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[PlotDetails] ADD  CONSTRAINT [DF_PlotDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[PlotDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlotDetails_AssetMaster] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[PlotDetails] CHECK CONSTRAINT [FK_PlotDetails_AssetMaster]
GO

/****** Object:  Table [AMS].[RoomWiseSubmissionDetails] ******/
CREATE TABLE [AMS].[RoomWiseSubmissionDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentAssetId] [int] NULL,
	[AssetId] [int] NULL,
	[FloorDetailsId] [int] NULL,
	[LengthMtr] [float] NULL,
	[WidthMtr] [float] NULL,
	[AreaSqMtr] [float] NULL,
	[HeightMtr] [float] NULL,
	[Base1Mtr] [float] NULL,
	[Base2Mtr] [float] NULL,
	[NoOfRooms] [int] NULL,
	[TotalAreaSqMtr] [float] NULL,
	[Shape] [varchar](25) NULL,
	[RoomNo] [nvarchar](100) NULL,
	[OuterYesNo] [bit] NOT NULL,
	[RoomType] [varchar](100) NULL,
	[SubmissionType] [varchar](100) NULL,
	[MinusYesNo] [bit] NOT NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_RoomWiseSubmissionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] ADD  CONSTRAINT [DF_RoomWiseSubmissionDetails_OuterYesNo]  DEFAULT ((0)) FOR [OuterYesNo]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] ADD  CONSTRAINT [DF_RoomWiseSubmissionDetails_MinusYesNo]  DEFAULT ((0)) FOR [MinusYesNo]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] ADD  CONSTRAINT [DF_RoomWiseSubmissionDetails_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] ADD  CONSTRAINT [DF_RoomWiseSubmissionDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] ADD  CONSTRAINT [DF_RoomWiseSubmissionDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseSubmissionDetails_AssetFloorDetails] FOREIGN KEY([FloorDetailsId])
REFERENCES [AMS].[AssetFloorDetails] ([Id])
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_AssetFloorDetails]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseSubmissionDetails_AssetMaster] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_AssetMaster]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseSubmissionDetails_ParentAsset] FOREIGN KEY([ParentAssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [FK_RoomWiseSubmissionDetails_ParentAsset]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveArea] CHECK  (([AreaSqMtr] IS NULL OR [AreaSqMtr]>(0)))
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveArea]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveRooms] CHECK  (([NoOfRooms] IS NULL OR [NoOfRooms]>(0)))
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveRooms]
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails]  WITH CHECK ADD  CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveTotalArea] CHECK  (([TotalAreaSqMtr] IS NULL OR [TotalAreaSqMtr]>(0)))
GO

ALTER TABLE [AMS].[RoomWiseSubmissionDetails] CHECK CONSTRAINT [CK_RoomWiseSubmissionDetails_PositiveTotalArea]
GO

/****** Object:  Table [AMS].[InventoryAssetDetail] ******/
CREATE TABLE [AMS].[InventoryAssetDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[BatchId] [int] NOT NULL,
	[UnitNumber] [int] NOT NULL,
	[InventoryType] [nvarchar](50) NOT NULL,
	[ItemName] [nvarchar](200) NULL,
	[ModelBrand] [varchar](200) NULL,
	[Specifications] [varchar](500) NULL,
	[Condition] [varchar](50) NULL,
	[ConditionFactor] [decimal](5, 4) NULL,
	[OwningDepartment] [nvarchar](200) NULL,
	[PhotoFileName] [varchar](300) NULL,
	[SerialNumber] [varchar](100) NULL,
	[AssetTag] [varchar](100) NULL,
	[DynamicAttributes] [nvarchar](max) NULL,
	[UnitPurchaseValue] [decimal](18, 2) NOT NULL,
	[UnitCapitalValue] [decimal](18, 2) NULL,
	[DepreciationRate] [decimal](5, 4) NULL,
	[CVFormula] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_InventoryAssetDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
),
 CONSTRAINT [UQ_InventoryAssetDetail_AssetId] UNIQUE NONCLUSTERED 
(
	[AssetId] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[InventoryAssetDetail] ADD  CONSTRAINT [DF_InventoryAssetDetail_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[InventoryAssetDetail] ADD  CONSTRAINT [DF_InventoryAssetDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[InventoryAssetDetail] ADD  CONSTRAINT [DF_InventoryAssetDetail_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[InventoryAssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryAssetDetail_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [AMS].[InventoryAssetDetail] CHECK CONSTRAINT [FK_InventoryAssetDetail_Asset]
GO

ALTER TABLE [AMS].[InventoryAssetDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryAssetDetail_Batch] FOREIGN KEY([BatchId])
REFERENCES [AMS].[InventoryBatch] ([Id])
GO

ALTER TABLE [AMS].[InventoryAssetDetail] CHECK CONSTRAINT [FK_InventoryAssetDetail_Batch]
GO

-- ============================================================================
-- LEVEL 5: Tables depending on Level 4 tables
-- ============================================================================

/****** Object:  Table [AMS].[AssetDocument] ******/
CREATE TABLE [AMS].[AssetDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[DocumentDefinitionId] [int] NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[StoredFileName] [varchar](255) NOT NULL,
	[FilePath] [varchar](500) NOT NULL,
	[FileSize] [int] NOT NULL,
	[MimeType] [varchar](100) NOT NULL,
	[FileExtension] [varchar](20) NOT NULL,
	[DocumentTitle] [varchar](200) NULL,
	[DocumentDate] [date] NULL,
	[DocumentNumber] [varchar](100) NULL,
	[Remarks] [nvarchar](500) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetDocument] PRIMARY KEY CLUSTERED
(
	[Id] ASC
),
 CONSTRAINT [UQ_AssetDocument_AssetId_DocumentDefinitionId_FileName] UNIQUE NONCLUSTERED 
(
	[AssetId] ASC,
	[DocumentDefinitionId] ASC,
	[FileName] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetDocument] ADD  CONSTRAINT [DF_AssetDocument_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO

ALTER TABLE [AMS].[AssetDocument] ADD  CONSTRAINT [DF_AssetDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetDocument] ADD  CONSTRAINT [DF_AssetDocument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetDocument] ADD  CONSTRAINT [DF_AssetDocument_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetDocument]  WITH CHECK ADD  CONSTRAINT [FK_AssetDoc_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetDocument] CHECK CONSTRAINT [FK_AssetDoc_Asset]
GO

ALTER TABLE [AMS].[AssetDocument]  WITH CHECK ADD  CONSTRAINT [FK_AssetDoc_DocDef] FOREIGN KEY([DocumentDefinitionId])
REFERENCES [AMS].[AssetDocumentDefinition] ([Id])
GO

ALTER TABLE [AMS].[AssetDocument] CHECK CONSTRAINT [FK_AssetDoc_DocDef]
GO

/****** Object:  Table [AMS].[AssetCVCalculationHistory] ******/
CREATE TABLE [AMS].[AssetCVCalculationHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[CalculationDate] [datetime] NOT NULL,
	[FinancialYear]  VARCHAR(9) NOT NULL,
	[SubZoneId] [int] NULL,
	[FloorId] [int] NULL,
	[ConstructionTypeId] [int] NULL,
	[TypeOfUseId] [int] NULL,
	[SubTypeOfUseId] [int] NULL,
	[ConstructionYear] [int] NULL,
	[BuildingAge] [int] NULL,
	[BuiltupAreaSqMeter] [decimal](18, 4) NULL,
	[HasLift] [bit] NULL,
	[BaseRate] [decimal](18, 2) NULL,
	[AgeFactor] [decimal](5, 4) NULL,
	[FloorFactor] [decimal](5, 4) NULL,
	[NatureFactor] [decimal](5, 4) NULL,
	[UseFactor] [decimal](5, 4) NULL,
	[CapitalValue] [decimal](18, 2) NOT NULL,
	[AnnualTaxAmount] [decimal](18, 2) NULL,
	[CalculationFormula] [varchar](500) NULL,
	[CalculatedBy] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[IsLatest] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetCVCalculationHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory] ADD  CONSTRAINT [DF_AssetCVCalculationHistory_CalculationDate]  DEFAULT (getdate()) FOR [CalculationDate]
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory] ADD  CONSTRAINT [DF_AssetCVCalcHist_IsLatest]  DEFAULT ((1)) FOR [IsLatest]
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory] ADD  CONSTRAINT [DF_AssetCVCalculationHistory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory] ADD  CONSTRAINT [DF_AssetCVCalculationHistory_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory]  WITH CHECK ADD  CONSTRAINT [FK_CVHistory_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[AssetCVCalculationHistory] CHECK CONSTRAINT [FK_CVHistory_Asset]
GO

/****** Object:  Table [AMS].[RenterDetails] ******/
CREATE TABLE [AMS].[RenterDetails](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FloorDetailsId] [int] NOT NULL,
	[RoomWiseSubmissionDetailsId] [int] NULL,
	[ParentAssetId] [int] NULL,
	[AssetId] [int] NOT NULL,
	[RenterName] [nvarchar](500) NULL,
	[GSTNo] [varchar](50) NULL,
	[TotalAreaSqFt] [decimal](18, 4) NULL,
	[AadhaarCardNo] [varchar](20) NULL,
	[PANCardNo] [varchar](10) NULL,
    [MobileNo] [varchar](10) NULL,
	[EmailId]  [varchar](100) NULL,
	[LeaseRentType] [varchar](50) NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[Duration] [int] NULL,
	[RentFrequency] [varchar](50) NULL,
	[RentAmount] [decimal](18, 2) NULL,
	[SecurityDeposit] [decimal](18, 2) NULL,
	[DepositType] [varchar](50) NULL,
	[AgreementId] [varchar](25) NULL,
	[IncrementFrequency] [varchar](35) NULL,
	[IncrementType] [varchar](35) NULL,
	[IncrementValue] [float] NULL,
	[IncrementMethod] [varchar](35) NULL,
	[DurationFrom] [datetime] NULL,
	[DurationTo] [datetime] NULL,
	[Increment] [float] NULL,
	[IncrementStatus] [bit] NULL,
	[RentMonthly] [float] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [Pk_RenterDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[RenterDetails] ADD  CONSTRAINT [DF_RenterDetails_IncrementStatus]  DEFAULT ((0)) FOR [IncrementStatus]
GO

ALTER TABLE [AMS].[RenterDetails] ADD  CONSTRAINT [DF_RenterDetails_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[RenterDetails] ADD  CONSTRAINT [DF_RenterDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[RenterDetails] ADD  CONSTRAINT [DF_RenterDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_Asset] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [FK_RenterDetails_Asset]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_AssetFloorDetails] FOREIGN KEY([FloorDetailsId])
REFERENCES [AMS].[AssetFloorDetails] ([Id])
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [FK_RenterDetails_AssetFloorDetails]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_ParentAsset] FOREIGN KEY([ParentAssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [FK_RenterDetails_ParentAsset]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [FK_RenterDetails_RoomWiseSubmission] FOREIGN KEY([RoomWiseSubmissionDetailsId])
REFERENCES [AMS].[RoomWiseSubmissionDetails] ([Id])
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [FK_RenterDetails_RoomWiseSubmission]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveDuration] CHECK  (([Duration] IS NULL OR [Duration]>=(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveDuration]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveIncrement] CHECK  (([IncrementValue] IS NULL OR [IncrementValue]>=(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveIncrement]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveMonthlyRent] CHECK  (([RentMonthly] IS NULL OR [RentMonthly]>=(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveMonthlyRent]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveRent] CHECK  (([RentAmount] IS NULL OR [RentAmount]>=(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveRent]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveSecurityDeposit] CHECK  (([SecurityDeposit] IS NULL OR [SecurityDeposit]>=(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveSecurityDeposit]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_PositiveTotalArea] CHECK  (([TotalAreaSqFt] IS NULL OR [TotalAreaSqFt]>(0)))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_PositiveTotalArea]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_ValidDuration] CHECK  (([DurationFrom] IS NULL OR [DurationTo] IS NULL OR [DurationTo]>=[DurationFrom]))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_ValidDuration]
GO

ALTER TABLE [AMS].[RenterDetails]  WITH CHECK ADD  CONSTRAINT [CK_RenterDetails_ValidLeaseRange] CHECK  (([FromDate] IS NULL OR [ToDate] IS NULL OR [ToDate]>=[FromDate]))
GO

ALTER TABLE [AMS].[RenterDetails] CHECK CONSTRAINT [CK_RenterDetails_ValidLeaseRange]
GO

/****** Object:  Table [AMS].[RoomWiseMinusData] ******/
CREATE TABLE [AMS].[RoomWiseMinusData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RoomWiseSubmissionId] [int] NULL,
	[LengthMtr] [float] NULL,
	[WidthMtr] [float] NULL,
	[AreaSqMtr] [float] NULL,
	[HeightMtr] [float] NULL,
	[Base1Mtr] [float] NULL,
	[Base2Mtr] [float] NULL,
	[Shape] [varchar](25) NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_RoomWiseMinusData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[RoomWiseMinusData] ADD  CONSTRAINT [DF_RoomWiseMinusData_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[RoomWiseMinusData] ADD  CONSTRAINT [DF_RoomWiseMinusData_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[RoomWiseMinusData] ADD  CONSTRAINT [DF_RoomWiseMinusData_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[RoomWiseMinusData]  WITH CHECK ADD  CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails] FOREIGN KEY([RoomWiseSubmissionId])
REFERENCES [AMS].[RoomWiseSubmissionDetails] ([Id])
GO

ALTER TABLE [AMS].[RoomWiseMinusData] CHECK CONSTRAINT [FK_RoomWiseMinusData_RoomWiseSubmissionDetails]
GO

/****** Object:  Table [AMS].[AssetDetails]    Script Date: 07-06-2026 15:17:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AMS].[AssetDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NOT NULL,
	[InChargeName] [nvarchar](200) NULL,
	[InChargeDesignation] nvarchar(100) NULL,
    [InChargeMobile] varchar(20) NULL,
    [InChargeEmail] varchar(100) NULL,
	[Locality] [nvarchar](255) NULL,
	[PinCode] [varchar](10) NULL,
	[LandRate] [decimal](18, 2) NULL,
	[DevelopmentCost] [decimal](18, 2) NULL,
	[MarketAppreciation] [decimal](5, 2) NULL,
	[TotalLength] [decimal](18, 2) NULL,
	[AverageWidth] [decimal](18, 2) NULL,
	[CapacityInLiters] [decimal](18, 2) NULL,
	[YearOfConstruction] [int] NULL,
	[ConstructionCostPerUnit] [decimal](18, 2) NULL,
	[TotalReplacementCost] [decimal](18, 2) NULL,
	[Depreciation] [decimal](18, 2) NULL,
	[CurrentAssetValue] [decimal](18, 2) NULL,
	[AnnualMaintenanceCost] [decimal](18, 2) NULL,
	[ShopName] [nvarchar] (200) NULL,
	[GstNo] varchar (50) NULL, -- GST Number
	[ShopActNo] varchar (50) NULL, -- Shop Act Number
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[MarkedForDeletion] [bit] NOT NULL,
	[MarkedForDeletionDate] [datetime] NULL,
 CONSTRAINT [PK_AssetDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [AMS].[AssetDetails] ADD  CONSTRAINT [DF_AssetDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [AMS].[AssetDetails] ADD  CONSTRAINT [DF_AssetDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [AMS].[AssetDetails] ADD  CONSTRAINT [DF_AssetDetails_MarkedForDeletion]  DEFAULT ((0)) FOR [MarkedForDeletion]
GO

ALTER TABLE [AMS].[AssetDetails]  WITH CHECK ADD  CONSTRAINT [FK_AssetDetails_AssetMaster] FOREIGN KEY([AssetId])
REFERENCES [AMS].[AssetMaster] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [AMS].[AssetDetails] CHECK CONSTRAINT [FK_AssetDetails_AssetMaster]
GO

