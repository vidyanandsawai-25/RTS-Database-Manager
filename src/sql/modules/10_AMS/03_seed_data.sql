-- ============================================================================
-- LEVEL 0: Base Lookup Tables
-- ============================================================================

MERGE [AMS].[AssetCategoryMaster] AS T
USING (VALUES 
    (N'CAT-BLDG', N'Buildings', N'All types of building structures', N'CapitalValue', 0, 1, 0, 0, 1),
    (N'CAT-LAND', N'Land & Plots', N'Land parcels, plots, and open spaces', N'MarketValue', 0, 0, 0, 0, 1),
    (N'CAT-VEHICLE', N'Vehicles', N'All types of vehicles', N'DepreciatedValue', 1, 0, 1, 1, 1),
    (N'CAT-FURNITURE', N'Furniture & Fixtures', N'Office and institutional furniture', N'DepreciatedValue', 1, 0, 1, 0, 0),
    (N'CAT-IT', N'IT Equipment', N'Computers, servers, and IT infrastructure', N'DepreciatedValue', 1, 0, 1, 1, 0),
    (N'CAT-MACHINERY', N'Machinery & Equipment', N'Heavy machinery and equipment', N'DepreciatedValue', 1, 0, 1, 1, 1)
) AS S (CategoryCode, CategoryName, [Description], ValuationType, IsMovable, HasFloorDetails, HasInventory, IsInventoryMandatory, HasLegalCompliance)
ON T.CategoryCode = S.CategoryCode
WHEN NOT MATCHED THEN 
    INSERT (CategoryCode, CategoryName, [Description], ValuationType, IsMovable, HasFloorDetails, HasInventory, IsInventoryMandatory, HasLegalCompliance, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate) 
    VALUES (S.CategoryCode, S.CategoryName, S.[Description], S.ValuationType, S.IsMovable, S.HasFloorDetails, S.HasInventory, S.IsInventoryMandatory, S.HasLegalCompliance, 1, 1, GETDATE(), 0, NULL);
GO


MERGE [AMS].[AuthorityMaster] AS T
USING (VALUES 
    (N'AUTH-MMC', N'Mumbai Municipal Corporation', N'Maharashtra'),
    (N'AUTH-PMC', N'Pune Municipal Corporation', N'Maharashtra'),
    (N'AUTH-NMC', N'Nagpur Municipal Corporation', N'Maharashtra')
) AS S (AuthorityCode, AuthorityName, [State])
ON T.AuthorityCode = S.AuthorityCode
WHEN NOT MATCHED THEN 
    INSERT (AuthorityCode, AuthorityName, [State], IsActive, CreatedDate, CreatedBy, MarkedForDeletion, MarkedForDeletionDate) 
    VALUES (S.AuthorityCode, S.AuthorityName, S.[State], 1, GETDATE(), 1, 0, NULL);
GO

MERGE [AMS].[InventoryItemCategoryMaster] AS T
USING (VALUES 
    (N'INV-FURN', N'Furniture', N'Office and institutional furniture', 0.1000, 1),
    (N'INV-ELECT', N'Electronics', N'Electronic equipment and appliances', 0.1000, 2),
    (N'INV-STATION', N'Stationery', N'Office stationery items', 0.1000, 3),
    (N'INV-TOOLS', N'Tools', N'Hand tools and equipment', 0.1000, 4),
    (N'INV-VEHICLE', N'Vehicle', N'Vehicles and transport related assets', 0.1000, 5)
) AS S (TypeCode, TypeName, [Description], DepreciationRate, DisplayOrder)
ON T.TypeCode = S.TypeCode
WHEN NOT MATCHED THEN 
    INSERT (TypeCode, TypeName, [Description], DepreciationRate, DisplayOrder, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate) 
    VALUES (S.TypeCode, S.TypeName, S.[Description], S.DepreciationRate, S.DisplayOrder, 1, 1, GETDATE(), 0, NULL);
GO

MERGE [AMS].[OwnershipTypeMaster] AS T
USING (VALUES 
    (N'Owned', N'Fully owned by the authority'),
    (N'Leased In', N'Leased from external party'),
    (N'Leased Out', N'Leased to external party'),
    (N'Public-Private Partnership', N'Joint ownership arrangement'),
    (N'Under Litigation', N'Ownership under legal dispute')
) AS S (OwnershipTypeName, [Description])
ON T.OwnershipTypeName = S.OwnershipTypeName
WHEN NOT MATCHED THEN 
    INSERT (OwnershipTypeName, [Description], IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate) 
    VALUES (S.OwnershipTypeName, S.[Description], 1, 1, GETDATE(), 0, NULL);
GO

MERGE [AMS].[OwningDepartmentMaster] AS T
USING (VALUES 
    (N'Public Works Department', N'Manages public infrastructure'),
    (N'Revenue Department', N'Handles revenue properties'),
    (N'Housing Department', N'Manages residential properties'),
    (N'Education Department', N'Manages educational facilities'),
    (N'Health Department', N'Manages health facilities')
) AS S (OwningDepartmentName, [Description])
ON T.OwningDepartmentName = S.OwningDepartmentName
WHEN NOT MATCHED THEN 
    INSERT (OwningDepartmentName, [Description], IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate) 
    VALUES (S.OwningDepartmentName, S.[Description], 1, 1, GETDATE(), 0, NULL);
GO

-- ============================================================================
-- LEVEL 1: Tables With 1 Foreign Key
-- ============================================================================

;WITH AssetTypeSeed (CategoryCode, TypeCode, TypeName, TypeNameLocal, [Description], Icon, CodeFormat, IsSubUnit) AS (
    SELECT * FROM (VALUES 
        (N'CAT-BLDG', N'BLDG-RESI', N'Residential Building', N'निवासी इमारत', N'Multi-story residential buildings', N'building.png', N'RB-{YYYY}-{####}', 0),
        (N'CAT-BLDG', N'BLDG-COMM', N'Commercial Building', N'व्यावसायिक इमारत', N'Commercial and office buildings', N'office.png', N'CB-{YYYY}-{####}', 0),
        (N'CAT-BLDG', N'BLDG-GOVT', N'Government Building', N'शासकीय इमारत', N'Government office buildings', N'govt.png', N'GB-{YYYY}-{####}', 0),
        (N'CAT-BLDG', N'BLDG-UNIT', N'Building Unit/Flat', N'फ्लॅट', N'Individual units within buildings', N'unit.png', N'UN-{YYYY}-{####}', 1),
        (N'CAT-LAND', N'LAND-RESI', N'Residential Plot', N'निवासी भूखंड', N'Plots for residential construction', N'plot.png', N'RP-{YYYY}-{####}', 0),
        (N'CAT-LAND', N'LAND-COMM', N'Commercial Plot', N'व्यावसायिक भूखंड', N'Plots for commercial use', N'plot.png', N'CP-{YYYY}-{####}', 0),
        (N'CAT-LAND', N'LAND-OPEN', N'Open Land', N'खुली जागा', N'Open land and gardens', N'land.png', N'OL-{YYYY}-{####}', 0),
        (N'CAT-VEHICLE', N'VEH-CAR', N'Car', N'कार', N'Passenger cars', N'car.png', N'CAR-{YYYY}-{####}', 0),
        (N'CAT-VEHICLE', N'VEH-BUS', N'Bus', N'बस', N'Buses for public transport', N'bus.png', N'BUS-{YYYY}-{####}', 0),
        (N'CAT-VEHICLE', N'VEH-TRUCK', N'Truck', N'ट्रक', N'Heavy goods vehicles', N'truck.png', N'TRK-{YYYY}-{####}', 0)
    ) v(CategoryCode, TypeCode, TypeName, TypeNameLocal, [Description], Icon, CodeFormat, IsSubUnit)
)
INSERT [AMS].[AssetTypeMaster] (AssetCategoryId, TypeCode, TypeName, TypeNameLocal, [Description], Icon, CodeFormat, IsSubUnit, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT c.Id, s.TypeCode, s.TypeName, s.TypeNameLocal, s.[Description], s.Icon, s.CodeFormat, s.IsSubUnit, 1, 1, GETDATE(), 0, NULL
FROM AssetTypeSeed s
JOIN [AMS].[AssetCategoryMaster] c ON c.CategoryCode = s.CategoryCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetTypeMaster] t WHERE t.TypeCode = s.TypeCode);
GO

;WITH OrgSeed (AuthorityCode, OrganizationCode, OrganizationName) AS (
    SELECT * FROM (VALUES 
        (N'AUTH-MMC', N'ORG-ADM', N'Administration'),
        (N'AUTH-MMC', N'ORG-FIN', N'Finance Department'),
        (N'AUTH-PMC', N'ORG-PWD', N'Public Works Department')
    ) v(AuthorityCode, OrganizationCode, OrganizationName)
)
INSERT [AMS].[OrganizationMaster] (AuthorityId, OrganizationCode, OrganizationName, IsActive, CreatedDate, CreatedBy, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, s.OrganizationCode, s.OrganizationName, 1, GETDATE(), 1, 0, NULL
FROM OrgSeed s
JOIN [AMS].[AuthorityMaster] a ON a.AuthorityCode = s.AuthorityCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[OrganizationMaster] o WHERE o.OrganizationCode = s.OrganizationCode);
GO

;WITH ConditionSeed (InvTypeCode, ConditionName, [Description], ConditionFactor, DisplayOrder) AS (
    SELECT * FROM (VALUES 
        (N'INV-FURN', N'New', N'Brand new condition', 1.0000, 1),
        (N'INV-FURN', N'Good', N'Good working condition', 1.0000, 2),
        (N'INV-FURN', N'Fair', N'Fair condition with minor wear', 1.0000, 3),
        (N'INV-FURN', N'Poor', N'Poor condition, needs repair', 1.0000, 4),
        (N'INV-FURN', N'Scrap', N'Not usable furniture item', 0.1000, 5),
        (N'INV-ELECT', N'New', N'Brand new electronic item', 1.0000, 1),
        (N'INV-ELECT', N'Working', N'Working condition', 1.0000, 2),
        (N'INV-ELECT', N'Needs Repair', N'Requires maintenance', 1.0000, 3)
    ) v(InvTypeCode, ConditionName, [Description], ConditionFactor, DisplayOrder)
)
INSERT [AMS].[InventoryItemConditionMaster] (InventoryItemCategoryId, ConditionName, [Description], ConditionFactor, DisplayOrder, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT c.Id, s.ConditionName, s.[Description], s.ConditionFactor, s.DisplayOrder, 1, 1, GETDATE(), 0, NULL
FROM ConditionSeed s
JOIN [AMS].[InventoryItemCategoryMaster] c ON c.TypeCode = s.InvTypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[InventoryItemConditionMaster] i WHERE i.InventoryItemCategoryId = c.Id AND i.ConditionName = s.ConditionName);
GO

;WITH ItemNameSeed (InvTypeCode, SubTypeCode, SubTypeName, [Description], DisplayOrder) AS (
    SELECT * FROM (VALUES 
        (N'INV-FURN', N'FURN-DESK', N'Office Desk', N'Standard office desk', 1),
        (N'INV-FURN', N'FURN-CHAIR', N'Office Chair', N'Ergonomic office chair', 2),
        (N'INV-FURN', N'FURN-TABLE', N'Conference Table', N'Meeting room table', 3),
        (N'INV-FURN', N'FURN-CABINET', N'Filing Cabinet', N'Document storage cabinet', 4),
        (N'INV-ELECT', N'ELEC-COMP', N'Computer', N'Desktop computer', 1),
        (N'INV-ELECT', N'ELEC-LAPTOP', N'Laptop', N'Portable laptop computer', 2),
        (N'INV-ELECT', N'ELEC-PRINTER', N'Printer', N'Multi-function printer', 3)
    ) v(InvTypeCode, SubTypeCode, SubTypeName, [Description], DisplayOrder)
)
INSERT [AMS].[InventoryItemNameMaster] (InventoryItemCategoryId, SubTypeCode, SubTypeName, [Description], DisplayOrder, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT c.Id, s.SubTypeCode, s.SubTypeName, s.[Description], s.DisplayOrder, 1, 1, GETDATE(), 0, NULL
FROM ItemNameSeed s
JOIN [AMS].[InventoryItemCategoryMaster] c ON c.TypeCode = s.InvTypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[InventoryItemNameMaster] i WHERE i.InventoryItemCategoryId = c.Id AND i.SubTypeCode = s.SubTypeCode);
GO

-- ============================================================================
-- LEVEL 2: Tables With Multiple Foreign Keys
-- ============================================================================

;WITH DeptSeed (OrgCode, DeptCode, DeptName) AS (
    SELECT * FROM (VALUES 
        (N'ORG-ADM', N'DEPT-ASSET', N'Asset Management'),
        (N'ORG-ADM', N'DEPT-PROP', N'Property Division'),
        (N'ORG-FIN', N'DEPT-ACC', N'Accounts Department'),
        (N'ORG-FIN', N'DEPT-REV', N'Revenue Department'),
        (N'ORG-PWD', N'DEPT-INFRA', N'Infrastructure Department')
    ) v(OrgCode, DeptCode, DeptName)
)
INSERT [AMS].[DepartmentMaster] (OrganizationId, DepartmentCode, DepartmentName, IsActive, CreatedDate, CreatedBy, MarkedForDeletion, MarkedForDeletionDate)
SELECT o.Id, s.DeptCode, s.DeptName, 1, GETDATE(), 1, 0, NULL
FROM DeptSeed s
JOIN [AMS].[OrganizationMaster] o ON o.OrganizationCode = s.OrgCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[DepartmentMaster] d WHERE d.OrganizationId = o.Id AND d.DepartmentCode = s.DeptCode);
GO

;WITH ModelSeed (SubTypeCode, ModelName, [Description], DisplayOrder) AS (
    SELECT * FROM (VALUES 
        (N'FURN-DESK', N'Executive Desk XL', N'Large executive desk with drawers', 1),
        (N'FURN-DESK', N'Standard Desk M', N'Medium sized standard desk', 2),
        (N'FURN-CHAIR', N'ErgoChair Pro', N'Professional ergonomic chair', 1),
        (N'FURN-CHAIR', N'Basic Office Chair', N'Standard office seating', 2),
        (N'ELEC-COMP', N'Dell OptiPlex 7080', N'Business desktop computer', 1),
        (N'ELEC-LAPTOP', N'HP EliteBook 840', N'Business laptop', 1),
        (N'ELEC-PRINTER', N'HP LaserJet Pro MFP', N'Multi-function laser printer', 1)
    ) v(SubTypeCode, ModelName, [Description], DisplayOrder)
)
INSERT [AMS].[InventoryItemModelMaster] (InventoryItemNameId, ModelName, [Description], DisplayOrder, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT i.Id, s.ModelName, s.[Description], s.DisplayOrder, 1, 1, GETDATE(), 0, NULL
FROM ModelSeed s
JOIN [AMS].[InventoryItemNameMaster] i ON i.SubTypeCode = s.SubTypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[InventoryItemModelMaster] m WHERE m.InventoryItemNameId = i.Id AND m.ModelName = s.ModelName);
GO

;WITH DocDefSeed (CatCode, TypeCode, DocCode, DocName, [Desc], Req, MaxMB, Ext, DispOrd) AS (
    SELECT * FROM (VALUES 
        (N'CAT-BLDG', N'BLDG-RESI', N'DOC-TITLE', N'Title Deed', N'Property title deed document', 1, 10, N'.pdf,.jpg,.jpeg,.png', 1),
        (N'CAT-BLDG', N'BLDG-RESI', N'DOC-PLAN', N'Building Plan', N'Approved building plan', 1, 15, N'.pdf,.dwg', 2),
        (N'CAT-BLDG', N'BLDG-RESI', N'DOC-OCC', N'Occupancy Certificate', N'Occupancy certificate from authority', 0, 10, N'.pdf', 3),
        (N'CAT-BLDG', N'BLDG-COMM', N'DOC-TITLE', N'Title Deed', N'Commercial property title deed', 1, 10, N'.pdf,.jpg,.jpeg,.png', 1),
        (N'CAT-BLDG', N'BLDG-COMM', N'DOC-LEASE', N'Lease Agreement', N'Lease agreement documents', 0, 10, N'.pdf,.doc,.docx', 2),
        (N'CAT-BLDG', N'BLDG-GOVT', N'DOC-TITLE', N'Title Deed', N'Government property title deed', 1, 10, N'.pdf,.jpg,.jpeg,.png', 1),
        (N'CAT-BLDG', N'BLDG-GOVT', N'DOC-PLAN', N'Building Plan', N'Approved government building plan', 1, 15, N'.pdf,.dwg', 2),
        (N'CAT-LAND', N'LAND-RESI', N'DOC-7-12', N'7/12 Extract', N'Land record extract', 1, 5, N'.pdf', 1),
        (N'CAT-LAND', N'LAND-RESI', N'DOC-SURVEY', N'Survey Document', N'Land survey report', 1, 10, N'.pdf,.jpg', 2),
        (N'CAT-VEHICLE', N'VEH-CAR', N'DOC-RC', N'Registration Certificate', N'Vehicle RC book', 1, 5, N'.pdf,.jpg', 1),
        (N'CAT-VEHICLE', N'VEH-CAR', N'DOC-INS', N'Insurance Policy', N'Vehicle insurance papers', 1, 5, N'.pdf', 2)
    ) v(CatCode, TypeCode, DocCode, DocName, [Desc], Req, MaxMB, Ext, DispOrd)
)
INSERT [AMS].[AssetDocumentDefinition] (AssetCategoryId, AssetTypeId, DocumentCode, DocumentName, [Description], IsRequired, MaxFileSizeMB, AllowedExtensions, DisplayOrder, IsActive, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT c.Id, t.Id, s.DocCode, s.DocName, s.[Desc], s.Req, s.MaxMB, s.Ext, s.DispOrd, 1, GETDATE(), 0, NULL
FROM DocDefSeed s
JOIN [AMS].[AssetCategoryMaster] c ON c.CategoryCode = s.CatCode
JOIN [AMS].[AssetTypeMaster] t ON t.TypeCode = s.TypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetDocumentDefinition] d WHERE d.DocumentCode = s.DocCode AND d.AssetCategoryId = c.Id AND d.AssetTypeId = t.Id);
GO

;WITH FieldDefSeed (CatCode, TypeCode, FldCode, FldName, FldLbl, FldTyp, FldGrp, Req, DispOrd, ValRules, MinV, MaxV, MaxL) AS (
    SELECT * FROM (VALUES 
        (N'CAT-BLDG', N'BLDG-RESI', N'FLD-FLOORS', N'NumberOfFloors', N'Number of Floors', N'Number', N'Building Details', 1, 1, N'min:1,max:100', 1.0, 100.0, NULL),
        (N'CAT-BLDG', N'BLDG-RESI', N'FLD-YEAR', N'ConstructionYear', N'Year of Construction', N'Number', N'Building Details', 1, 2, N'min:1900,max:2100', 1900.0, 2100.0, NULL),
        (N'CAT-BLDG', N'BLDG-RESI', N'FLD-STRUCT', N'StructureType', N'Structure Type', N'Text', N'Building Details', 0, 3, N'maxlength:50', NULL, NULL, 50),
        (N'CAT-BLDG', N'BLDG-GOVT', N'FLD-FLOORS', N'NumberOfFloors', N'Number of Floors', N'Number', N'Building Details', 1, 1, N'min:1,max:100', 1.0, 100.0, NULL),
        (N'CAT-BLDG', N'BLDG-GOVT', N'FLD-YEAR', N'ConstructionYear', N'Year of Construction', N'Number', N'Building Details', 1, 2, N'min:1900,max:2100', 1900.0, 2100.0, NULL),
        (N'CAT-BLDG', N'BLDG-GOVT', N'FLD-STRUCT', N'StructureType', N'Structure Type', N'Text', N'Building Details', 0, 3, N'maxlength:50', NULL, NULL, 50),
        (N'CAT-VEHICLE', N'VEH-CAR', N'FLD-REGNO', N'RegistrationNumber', N'Registration Number', N'Text', N'Vehicle Info', 1, 1, N'required,maxlength:20', NULL, NULL, 20),
        (N'CAT-VEHICLE', N'VEH-CAR', N'FLD-MAKE', N'ManufacturerName', N'Manufacturer', N'Text', N'Vehicle Info', 1, 2, N'required,maxlength:50', NULL, NULL, 50),
        (N'CAT-VEHICLE', N'VEH-CAR', N'FLD-MODEL', N'ModelName', N'Model', N'Text', N'Vehicle Info', 1, 3, N'required,maxlength:50', NULL, NULL, 50),
        (N'CAT-VEHICLE', N'VEH-CAR', N'FLD-YEAR', N'ManufactureYear', N'Year of Manufacture', N'Number', N'Vehicle Info', 1, 4, N'min:2000,max:2100', 2000.0, 2100.0, NULL)
    ) v(CatCode, TypeCode, FldCode, FldName, FldLbl, FldTyp, FldGrp, Req, DispOrd, ValRules, MinV, MaxV, MaxL)
)
INSERT [AMS].[AssetFieldDefinition] (AssetCategoryId, AssetTypeId, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, IsRequired, DisplayOrder, ValidationRules, MinValue, MaxValue, MaxLength, IsActive, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT c.Id, t.Id, s.FldCode, s.FldName, s.FldLbl, s.FldTyp, s.FldGrp, s.Req, s.DispOrd, s.ValRules, s.MinV, s.MaxV, s.MaxL, 1, GETDATE(), 0, NULL
FROM FieldDefSeed s
JOIN [AMS].[AssetCategoryMaster] c ON c.CategoryCode = s.CatCode
JOIN [AMS].[AssetTypeMaster] t ON t.TypeCode = s.TypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetFieldDefinition] f WHERE f.FieldCode = s.FldCode AND f.AssetCategoryId = c.Id AND f.AssetTypeId = t.Id);
GO


-- ============================================================================
-- LEVEL 3: Transactional Core (AssetMaster)
-- ============================================================================

;WITH AssetSeed (AuthCode, OrgCode, DeptCode, CatCode, TypeCode, AssetNo, AssetName, Lvl, Addr, BuiltArea, Carpet, LandArea, Lift, PurchVal, PurchDate, MktVal, OwnType, Stat, RevGen) AS (
    SELECT * FROM (VALUES 
        (N'AUTH-MMC', N'ORG-ADM', N'DEPT-ASSET', N'CAT-BLDG', N'BLDG-GOVT', N'GB-2020-0001', N'Mumbai Municipal Head Office', 0, N'Fort, Mumbai', 5000.0, 4200.0, 2000.0, 1, 150000000.0, '2010-01-15', 250000000.0, N'Owned', N'Active', 0),
        (N'AUTH-MMC', N'ORG-ADM', N'DEPT-ASSET', N'CAT-BLDG', N'BLDG-GOVT', N'GB-2021-0002', N'Andheri Community Hall', 0, N'Andheri West, Mumbai', 1500.0, 1200.0, 500.0, 0, 25000000.0, '2015-06-20', 35000000.0, N'Owned', N'Active', 1),
        (N'AUTH-MMC', N'ORG-FIN', N'DEPT-REV', N'CAT-BLDG', N'BLDG-COMM', N'CB-2019-0003', N'Nariman Point Tower', 0, N'Nariman Point, Mumbai', 8000.0, 6800.0, 1000.0, 1, 500000000.0, '2005-03-10', 800000000.0, N'Owned', N'Active', 1),
        (N'AUTH-MMC', N'ORG-ADM', N'DEPT-PROP', N'CAT-LAND', N'LAND-RESI', N'RP-2022-0004', N'Bandra Residential Plot A1', 0, N'Bandra West, Mumbai', NULL, NULL, 1000.0, 0, 80000000.0, '2018-09-01', 120000000.0, N'Owned', N'Active', 0),
        (N'AUTH-MMC', N'ORG-ADM', N'DEPT-PROP', N'CAT-LAND', N'LAND-OPEN', N'OL-2020-0005', N'Juhu Beach Open Space', 0, N'Juhu Beach, Mumbai', NULL, NULL, 5000.0, 0, 200000000.0, '2000-01-01', 500000000.0, N'Owned', N'Active', 0)
    ) v(AuthCode, OrgCode, DeptCode, CatCode, TypeCode, AssetNo, AssetName, Lvl, Addr, BuiltArea, Carpet, LandArea, Lift, PurchVal, PurchDate, MktVal, OwnType, Stat, RevGen)
)
INSERT [AMS].[AssetMaster] (AuthorityId, OrganizationId, DepartmentId, AssetCategoryId, AssetTypeId, AssetNo, AssetName, HierarchyLevel, [Address], BuiltupAreaSqMeter, CarpetAreaSqMeter, LandAreaSqMeter, HasLift, PurchaseValue, PurchaseDate, MarketValue, OwnershipType, [Status], IsRevenueGenerating, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, o.Id, d.Id, c.Id, t.Id, s.AssetNo, s.AssetName, s.Lvl, s.Addr, s.BuiltArea, s.Carpet, s.LandArea, s.Lift, s.PurchVal, s.PurchDate, s.MktVal, s.OwnType, s.Stat, s.RevGen, 1, 1, GETDATE(), 0, NULL
FROM AssetSeed s
JOIN [AMS].[AuthorityMaster] a ON a.AuthorityCode = s.AuthCode
JOIN [AMS].[OrganizationMaster] o ON o.OrganizationCode = s.OrgCode
JOIN [AMS].[DepartmentMaster] d ON d.OrganizationId = o.Id AND d.DepartmentCode = s.DeptCode
JOIN [AMS].[AssetCategoryMaster] c ON c.CategoryCode = s.CatCode
JOIN [AMS].[AssetTypeMaster] t ON t.TypeCode = s.TypeCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetMaster] m WHERE m.AssetNo = s.AssetNo);
GO

-- ============================================================================
-- LEVEL 4: Transactional Details (Batches, Floors, Forms, Plots)
-- ============================================================================

;WITH BatchSeed (AssetNo, InvType, ItemName, ModelBrand, Specs, PurchDate, Cond, Qty, UnitVal, TotVal, OwningDept, Prefix) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'Furniture', N'Office Chair', N'ErgoChair Pro', N'Ergonomic chair', '2026-05-27', N'Good', 5, 1000.0, 5000.0, N'Public Works Department', N'FUR'),
        (N'GB-2020-0001', N'Furniture', N'Office Desk', N'Executive Desk XL', N'Executive desk', '2026-05-27', N'Good', 10, 50.0, 500.0, N'Public Works Department', N'FUR'),
        (N'CB-2019-0003', N'Furniture', N'Standard Desk M', N'Standard Desk M', N'Standard desk', '2026-05-26', N'Fair', 3, 15.0, 45.0, N'Revenue Department', N'FUR'),
        (N'GB-2020-0001', N'Electronics', N'Computer', N'Dell OptiPlex 7080', N'Desktop computer', '2025-01-14', N'Poor', 1, 1000.0, 1000.0, NULL, N'ITE'),
        (N'GB-2020-0001', N'Vehicle', N'Car', N'Maruti Suzuki Swift', N'Hatchback car', '2026-05-29', N'Scrap', 10, 1000.0, 10000.0, NULL, N'VEH')
    ) v(AssetNo, InvType, ItemName, ModelBrand, Specs, PurchDate, Cond, Qty, UnitVal, TotVal, OwningDept, Prefix)
)
INSERT [AMS].[InventoryBatch] (ParentAssetId, InventoryType, ItemName, ModelBrand, Specifications, PurchaseDate, Condition, Quantity, UnitValue, TotalBatchValue, OwningDepartment, AssetNoPrefix, IsRegistered, IsActive, CreatedDate, CreatedBy, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, s.InvType, s.ItemName, s.ModelBrand, s.Specs, s.PurchDate, s.Cond, s.Qty, s.UnitVal, s.TotVal, s.OwningDept, s.Prefix, 0, 1, GETDATE(), 1, 0, NULL
FROM BatchSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[InventoryBatch] b WHERE b.ParentAssetId = a.Id AND b.ItemName = s.ItemName AND b.ModelBrand = s.ModelBrand);
GO

;WITH FloorSeed (AssetNo, FloorCode, ConstrYear, ConstrCode, TypeOfUseCode, CarpetM, CarpetFt, BuiltM, BuiltFt, Rooms, CapVal, MktVal) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'GF', N'2010', N'A', N'R', 800.0, 8611.13, 1000.0, 10763.91, 15, 25000000.0, 40000000.0),
        (N'GB-2020-0001', N'F1', N'2010', N'A', N'R', 800.0, 8611.13, 1000.0, 10763.91, 15, 25000000.0, 40000000.0),
        (N'GB-2021-0002', N'GF', N'2015', N'A', N'C', 1000.0, 10763.91, 1200.0, 12916.69, 5, 15000000.0, 20000000.0),
        (N'CB-2019-0003', N'F1', N'2005', N'A', N'I', 600.0, 6458.35, 750.0, 8072.93, 10, 50000000.0, 75000000.0),
        (N'CB-2019-0003', N'F2', N'2005', N'A', N'I', 600.0, 6458.35, 750.0, 8072.93, 10, 50000000.0, 75000000.0)
    ) v(AssetNo, FloorCode, ConstrYear, ConstrCode, TypeOfUseCode, CarpetM, CarpetFt, BuiltM, BuiltFt, Rooms, CapVal, MktVal)
)
INSERT [AMS].[AssetFloorDetails] (AssetId, FloorId, ConstructionYear, ConstructionTypeId, TypeOfUseId, CarpetAreaSqMeter, CarpetAreaSqFeet, BuiltupAreaSqMeter, BuiltupAreaSqFeet, NoOfRooms, CapitalValue, MarketValue, IsActive, CreatedDate, CreatedBy, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, fm.Id, s.ConstrYear, ct.Id, tou.Id, s.CarpetM, s.CarpetFt, s.BuiltM, s.BuiltFt, s.Rooms, s.CapVal, s.MktVal, 1, GETDATE(), 1, 0, NULL
FROM FloorSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [PTIS].[FloorMaster] fm ON fm.FloorCode = s.FloorCode
JOIN [PTIS].[ConstructionTypeMaster] ct ON ct.ConstructionCode = s.ConstrCode
JOIN [PTIS].[TypeOfUseMaster] tou ON tou.TypeOfUseCode = s.TypeOfUseCode
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetFloorDetails] f WHERE f.AssetId = a.Id AND f.FloorId = fm.Id);
GO

;WITH FormSeed (AssetNo, SectionCode, SectionName, FormData, DisplayOrder) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'MAINT-INFO', N'Maintenance Information', N'{"lastMaintenanceDate":"2023-12-15"}', 1),
        (N'GB-2020-0001', N'UTIL-INFO', N'Utility Information', N'{"electricConnection":"Yes"}', 2),
        (N'CB-2019-0003', N'TENANT-INFO', N'Tenant Information', N'{"hasActiveTenants":"Yes"}', 1)
    ) v(AssetNo, SectionCode, SectionName, FormData, DisplayOrder)
)
INSERT [AMS].[AssetFormData] (AssetId, SectionCode, SectionName, FormData, DisplayOrder, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, s.SectionCode, s.SectionName, s.FormData, s.DisplayOrder, 1, 1, GETDATE(), 0, NULL
FROM FormSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetFormData] f WHERE f.AssetId = a.Id AND f.SectionCode = s.SectionCode);
GO

;WITH FieldValSeed (AssetNo, FieldCode, FieldName, TextVal, NumVal) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'FLD-FLOORS', N'NumberOfFloors', NULL, 10.0),
        (N'GB-2020-0001', N'FLD-YEAR', N'ConstructionYear', NULL, 2010.0),
        (N'GB-2020-0001', N'FLD-STRUCT', N'StructureType', N'RCC', NULL),
        (N'GB-2021-0002', N'FLD-FLOORS', N'NumberOfFloors', NULL, 3.0),
        (N'GB-2021-0002', N'FLD-YEAR', N'ConstructionYear', NULL, 2015.0)
    ) v(AssetNo, FieldCode, FieldName, TextVal, NumVal)
)
INSERT [AMS].[AssetFieldValue] (AssetId, FieldDefinitionId, FieldName, TextValue, NumberValue, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, fd.Id, s.FieldName, s.TextVal, s.NumVal, 1, 1, GETDATE(), 0, NULL
FROM FieldValSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [AMS].[AssetFieldDefinition] fd ON fd.FieldCode = s.FieldCode 
    AND fd.AssetCategoryId = a.AssetCategoryId 
    AND fd.AssetTypeId = a.AssetTypeId
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetFieldValue] v WHERE v.AssetId = a.Id AND v.FieldName = s.FieldName);
GO

;WITH PlotSeed (AssetNo, PlotArea, PlotTaxFt, PlotTaxM, PlotAreaM, L, W, LFt, WFt) AS (
    SELECT * FROM (VALUES 
        (N'RP-2022-0004', 10763.91, 10000, 929.03, 1000, 40, 25, 131.23, 82.02),
        (N'OL-2020-0005', 53819.55, 50000, 4645.15, 5000, 100, 50, 328.08, 164.04)
    ) v(AssetNo, PlotArea, PlotTaxFt, PlotTaxM, PlotAreaM, L, W, LFt, WFt)
)
INSERT [AMS].[PlotDetails] (AssetId, PlotArea, PlotTaxableAreaSqFt, PlotTaxableAreaSqMtr, PlotAreaSqMtr, PlotAreaMtrLength, PlotAreaMtrWidth, PlotAreaFtLength, PlotAreaFtWidth, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, s.PlotArea, s.PlotTaxFt, s.PlotTaxM, s.PlotAreaM, s.L, s.W, s.LFt, s.WFt, 1, 1, GETDATE(), 0, NULL
FROM PlotSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[PlotDetails] p WHERE p.AssetId = a.Id);
GO

-- ============================================================================
-- LEVEL 5: Granular Details (Documents, Rents, CV, Submissions)
-- ============================================================================

;WITH RoomSeed (AssetNo, FloorCode, L, W, Area, H, Rooms, TotArea, Shape, RoomNo, OutYN, RoomType, SubType) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'GF', 5.0, 4.0, 20.0, 3.0, 1, 20.0, N'Rectangle', N'Living Room', 0, N'Living Room', N'Manual'),
        (N'GB-2020-0001', N'GF', 4.0, 3.5, 14.0, 3.0, 1, 14.0, N'Rectangle', N'Bedroom 1', 0, N'Bedroom', N'Manual'),
        (N'GB-2020-0001', N'F1', 3.5, 3.0, 10.5, 3.0, 1, 10.5, N'Rectangle', N'Bedroom 2', 0, N'Bedroom', N'Manual'),
        (N'GB-2020-0001', N'F1', 2.5, 2.0, 5.0, 3.0, 1, 5.0, N'Rectangle', N'Kitchen', 0, N'Kitchen', N'Manual'),
        (N'GB-2021-0002', N'GF', 5.0, 4.0, 20.0, 3.0, 1, 20.0, N'Rectangle', N'Living Room', 0, N'Living Room', N'Manual')
    ) v(AssetNo, FloorCode, L, W, Area, H, Rooms, TotArea, Shape, RoomNo, OutYN, RoomType, SubType)
)
INSERT [AMS].[RoomWiseSubmissionDetails] (ParentAssetId, AssetId, FloorDetailsId, LengthMtr, WidthMtr, AreaSqMtr, HeightMtr, NoOfRooms, TotalAreaSqMtr, Shape, RoomNo, OuterYesNo, RoomType, SubmissionType, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, a.Id, fd.Id, s.L, s.W, s.Area, s.H, s.Rooms, s.TotArea, s.Shape, s.RoomNo, s.OutYN, s.RoomType, s.SubType, 1, 1, GETDATE(), 0, NULL
FROM RoomSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [PTIS].[FloorMaster] fm ON fm.FloorCode = s.FloorCode
JOIN [AMS].[AssetFloorDetails] fd ON fd.AssetId = a.Id AND fd.FloorId = fm.Id
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[RoomWiseSubmissionDetails] r WHERE r.FloorDetailsId = fd.Id AND r.RoomNo = s.RoomNo);
GO

;WITH InvAssetSeed (AssetNo, ItemName, Brand, UnitNo, InvType, Cond, CondFactor, PurchVal, CapVal, DepRate, Formula) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'Office Chair', N'ErgoChair Pro', 1, N'Furniture', N'Good', 1.0, 1000.0, 1000.0, 0.1, N'CV Formula'),
        (N'CB-2019-0003', N'Standard Desk M', N'Standard Desk M', 1, N'Furniture', N'Fair', 1.0, 15.0, 15.0, 0.1, N'CV Formula')
    ) v(AssetNo, ItemName, Brand, UnitNo, InvType, Cond, CondFactor, PurchVal, CapVal, DepRate, Formula)
)
INSERT [AMS].[InventoryAssetDetail] (AssetId, BatchId, UnitNumber, InventoryType, ItemName, ModelBrand, Condition, ConditionFactor, UnitPurchaseValue, UnitCapitalValue, DepreciationRate, CVFormula, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, b.Id, s.UnitNo, s.InvType, s.ItemName, s.Brand, s.Cond, s.CondFactor, s.PurchVal, s.CapVal, s.DepRate, s.Formula, 1, 1, GETDATE(), 0, NULL
FROM InvAssetSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [AMS].[InventoryBatch] b ON b.ParentAssetId = a.Id AND b.ItemName = s.ItemName AND b.ModelBrand = s.Brand
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[InventoryAssetDetail] d WHERE d.AssetId = a.Id);
GO

;WITH DocSeed (AssetNo, DocCode, FileName, StoredName, Path, Size, Mime, Ext, Title) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'DOC-TITLE', N'MMC_Title_Deed.pdf', N'DOC_20240101_001.pdf', N'/documents/assets/', 2048576, N'application/pdf', N'.pdf', N'Municipal Title Deed'),
        (N'GB-2020-0001', N'DOC-PLAN', N'MMC_Building_Plan.pdf', N'DOC_20240101_002.pdf', N'/documents/assets/', 5242880, N'application/pdf', N'.pdf', N'Building Plan'),
        (N'RP-2022-0004', N'DOC-7-12', N'Bandra_712_Extract.pdf', N'DOC_20240101_003.pdf', N'/documents/assets/', 1048576, N'application/pdf', N'.pdf', N'7/12 Land Extract'),
        (N'RP-2022-0004', N'DOC-SURVEY', N'Bandra_Survey_Report.pdf', N'DOC_20240101_004.pdf', N'/documents/assets/', 2048576, N'application/pdf', N'.pdf', N'Land Survey Report')
    ) v(AssetNo, DocCode, FileName, StoredName, Path, Size, Mime, Ext, Title)
)
INSERT [AMS].[AssetDocument] (AssetId, DocumentDefinitionId, FileName, StoredFileName, FilePath, FileSize, MimeType, FileExtension, DocumentTitle, IsVerified, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, dd.Id, s.FileName, s.StoredName, s.Path, s.Size, s.Mime, s.Ext, s.Title, 0, 1, 1, GETDATE(), 0, NULL
FROM DocSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [AMS].[AssetDocumentDefinition] dd
    ON dd.DocumentCode = s.DocCode
    AND dd.AssetCategoryId = a.AssetCategoryId
    AND (dd.AssetTypeId = a.AssetTypeId OR dd.AssetTypeId IS NULL)
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetDocument] d WHERE d.AssetId = a.Id AND d.DocumentDefinitionId = dd.Id);
GO

;WITH CVSeed (AssetNo, FinYear, BuiltArea, BaseRate, AgeFac, FloorFac, NatureFac, UseFac, CapVal) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'2024-25', 5000.0, 45000.0, 0.85, 1.0, 1.0, 1.0, 191250000.0),
        (N'GB-2021-0002', N'2024-25', 1500.0, 20000.0, 0.90, 1.0, 1.0, 1.0, 27000000.0),
        (N'CB-2019-0003', N'2024-25', 8000.0, 95000.0, 0.75, 1.0, 1.0, 1.2, 684000000.0),
        (N'RP-2022-0004', N'2026', 66.2398, 6000.0, 1.0, 1.0, 1.0, 0.90, 357695.13),
        (N'OL-2020-0005', N'2026', 3.6232, 6000.0, 1.0, 1.05, 0.85, 0.90, 17462.09)
    ) v(AssetNo, FinYear, BuiltArea, BaseRate, AgeFac, FloorFac, NatureFac, UseFac, CapVal)
)
INSERT [AMS].[AssetCVCalculationHistory] (AssetId, CalculationDate, FinancialYear, BuiltupAreaSqMeter, BaseRate, AgeFactor, FloorFactor, NatureFactor, UseFactor, CapitalValue, IsLatest, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, GETDATE(), s.FinYear, s.BuiltArea, s.BaseRate, s.AgeFac, s.FloorFac, s.NatureFac, s.UseFac, s.CapVal, 1, 1, 1, GETDATE(), 0, NULL
FROM CVSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[AssetCVCalculationHistory] c WHERE c.AssetId = a.Id AND c.FinancialYear = s.FinYear);
GO

;WITH RentSeed (AssetNo, FloorCode, RenterName, TotArea, RentType, FDate, TDate, Dur, Freq, RAmount, SDeposit, DepType, RMonthly) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'GF', N'Ramesh Kumar Sharma', 1076.39, N'Residential Rent', '2023-04-01', '2026-03-31', 36, N'Monthly', 35000.0, 105000.0, N'Security Deposit', 35000),
        (N'CB-2019-0003', N'F1', N'ABC Retail Stores Pvt Ltd', 8072.93, N'Commercial Rent', '2023-01-01', '2028-12-31', 72, N'Monthly', 125000.0, 750000.0, N'Fixed Deposit', 125000),
        (N'CB-2019-0003', N'F2', N'XYZ Technologies Limited', 8072.93, N'Commercial Rent', '2023-01-01', '2025-12-31', 36, N'Monthly', 150000.0, 900000.0, N'Bank Guarantee', 150000),
        (N'GB-2021-0002', N'GF', N'Mumbai Events & Catering Services', 12916.69, N'Commercial Rent', '2024-01-01', '2027-12-31', 48, N'Monthly', 50000.0, 200000.0, N'Security Deposit', 50000),
        (N'GB-2020-0001', N'F1', N'Hiroko Mercado', 200.00, N'Commercial Lease', '2018-03-26', '2026-07-22', 100, N'Monthly', 77.0, 72.0, N'Refundable', 77)
    ) v(AssetNo, FloorCode, RenterName, TotArea, RentType, FDate, TDate, Dur, Freq, RAmount, SDeposit, DepType, RMonthly)
)
INSERT [AMS].[RenterDetails] (AssetId, FloorDetailsId, RenterName, TotalAreaSqFt, LeaseRentType, FromDate, ToDate, Duration, RentFrequency, RentAmount, SecurityDeposit, DepositType, RentMonthly, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT a.Id, fd.Id, s.RenterName, s.TotArea, s.RentType, s.FDate, s.TDate, s.Dur, s.Freq, s.RAmount, s.SDeposit, s.DepType, s.RMonthly, 1, 1, GETDATE(), 0, NULL
FROM RentSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [PTIS].[FloorMaster] fm ON fm.FloorCode = s.FloorCode
JOIN [AMS].[AssetFloorDetails] fd ON fd.AssetId = a.Id AND fd.FloorId = fm.Id
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[RenterDetails] r WHERE r.FloorDetailsId = fd.Id AND r.RenterName = s.RenterName);
GO

;WITH MinusSeed (AssetNo, FloorCode, RoomNo, LMtr, WMtr, AreaMtr, HMtr, Shape) AS (
    SELECT * FROM (VALUES 
        (N'GB-2020-0001', N'GF', N'Living Room', 0.8, 0.6, 0.48, 3.0, N'Rectangle'),
        (N'GB-2020-0001', N'GF', N'Bedroom 1', 0.5, 0.4, 0.2, 3.0, N'Rectangle')
    ) v(AssetNo, FloorCode, RoomNo, LMtr, WMtr, AreaMtr, HMtr, Shape)
)
INSERT [AMS].[RoomWiseMinusData] (RoomWiseSubmissionId, LengthMtr, WidthMtr, AreaSqMtr, HeightMtr, Shape, IsActive, CreatedBy, CreatedDate, MarkedForDeletion, MarkedForDeletionDate)
SELECT rw.Id, s.LMtr, s.WMtr, s.AreaMtr, s.HMtr, s.Shape, 1, 1, GETDATE(), 0, NULL
FROM MinusSeed s
JOIN [AMS].[AssetMaster] a ON a.AssetNo = s.AssetNo
JOIN [PTIS].[FloorMaster] fm ON fm.FloorCode = s.FloorCode
JOIN [AMS].[AssetFloorDetails] fd ON fd.AssetId = a.Id AND fd.FloorId = fm.Id
JOIN [AMS].[RoomWiseSubmissionDetails] rw ON rw.FloorDetailsId = fd.Id AND rw.RoomNo = s.RoomNo
WHERE NOT EXISTS (SELECT 1 FROM [AMS].[RoomWiseMinusData] md WHERE md.RoomWiseSubmissionId = rw.Id);
GO