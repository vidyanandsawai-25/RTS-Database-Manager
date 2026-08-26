SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS project registration in CORE

   Keeps all Right-to-Service department, module, screen groups, screens and
   administrator permissions with the RTS project seed instead of CORE/PTIS.
   The seed is idempotent and can be safely re-run.
   ============================================================================ */
DECLARE @RtsDepartmentId INT;
DECLARE @RtsModuleId INT;
DECLARE @RtsAdminRoleId INT;
DECLARE @AdminUserId INT;

SELECT @AdminUserId = [Id]
FROM [CORE].[UserMaster]
WHERE [UserName] = N'ADMIN';

IF @AdminUserId IS NULL
    THROW 51000, 'The seed ADMIN user is required before the RTS project seed runs.', 1;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[DepartmentMaster]
    WHERE [DepartmentCode] = 'RTS'
)
BEGIN
    INSERT INTO [CORE].[DepartmentMaster]
    (
        [DepartmentCode],
        [DepartmentName],
        [DepartmentNameLocal],
        [DepartmentIcon],
        [DepartmentDescription],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        'RTS',
        'RTS Department',
        N'लोकसेवा हक्क',
        N'Landmark',
        N'Maharashtra Right to Public Services',
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsDepartmentId = [Id]
FROM [CORE].[DepartmentMaster]
WHERE [DepartmentCode] = 'RTS';

UPDATE [CORE].[DepartmentMaster]
SET [DepartmentName] = 'RTS Department',
    [DepartmentNameLocal] = N'लोकसेवा हक्क',
    [DepartmentIcon] = N'Landmark',
    [DepartmentDescription] = N'Maharashtra Right to Public Services',
    [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsDepartmentId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ModuleMaster]
    WHERE [ModuleCode] = N'RTS_M'
)
BEGIN
    INSERT INTO [CORE].[ModuleMaster]
    (
        [DepartmentId],
        [ModuleCode],
        [ModuleName],
        [ModuleNameLocal],
        [ModuleIcon],
        [ModuleLabel],
        [ModuleDescription],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @RtsDepartmentId,
        N'RTS_M',
        N'Right to Service',
        N'लोकसेवा हक्क',
        N'Landmark',
        N'RTS',
        N'Right to Service administration module',
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsModuleId = [Id]
FROM [CORE].[ModuleMaster]
WHERE [ModuleCode] = N'RTS_M';

UPDATE [CORE].[ModuleMaster]
SET [DepartmentId] = @RtsDepartmentId,
    [ModuleName] = N'Right to Service',
    [ModuleNameLocal] = N'लोकसेवा हक्क',
    [ModuleIcon] = N'Landmark',
    [ModuleLabel] = N'RTS',
    [ModuleDescription] = N'Right to Service administration module',
    [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsModuleId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserRoleMaster]
    WHERE [DepartmentId] = @RtsDepartmentId
      AND [UserRoleName] = N'Admin'
)
BEGIN
    INSERT INTO [CORE].[UserRoleMaster]
    (
        [UserRoleName],
        [DepartmentId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        N'Admin',
        @RtsDepartmentId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsAdminRoleId = [Id]
FROM [CORE].[UserRoleMaster]
WHERE [DepartmentId] = @RtsDepartmentId
  AND [UserRoleName] = N'Admin';

UPDATE [CORE].[UserRoleMaster]
SET [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsAdminRoleId;

/* Remove the legacy cross-department Admin allocation for RTS. */
DELETE allocation
FROM [CORE].[UserRoleAllocation] allocation
INNER JOIN [CORE].[UserRoleMaster] roleMaster
    ON roleMaster.[Id] = allocation.[UserRoleId]
WHERE allocation.[UserId] = @AdminUserId
  AND allocation.[DepartmentId] = @RtsDepartmentId
  AND roleMaster.[DepartmentId] <> @RtsDepartmentId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserDepartmentAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
)
BEGIN
    INSERT INTO [CORE].[UserDepartmentAllocation]
    (
        [UserId],
        [DepartmentId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserDepartmentAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId;
END;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserModuleAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [ModuleId] = @RtsModuleId
)
BEGIN
    INSERT INTO [CORE].[UserModuleAllocation]
    (
        [UserId],
        [DepartmentId],
        [ModuleId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        @RtsModuleId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserModuleAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [ModuleId] = @RtsModuleId;
END;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserRoleAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [UserRoleId] = @RtsAdminRoleId
)
BEGIN
    INSERT INTO [CORE].[UserRoleAllocation]
    (
        [UserId],
        [DepartmentId],
        [UserRoleId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        @RtsAdminRoleId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserRoleAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [UserRoleId] = @RtsAdminRoleId;
END;

DECLARE @RtsScreenGroups TABLE
(
    [ScreenGroupCode] NVARCHAR(200) NOT NULL,
    [ScreenGroupName] NVARCHAR(200) NOT NULL,
    [ScreenGroupNameLocal] NVARCHAR(200) NOT NULL,
    [ScreenGroupIcon] NVARCHAR(100) NOT NULL,
    [DisplayOrder] INT NOT NULL
);

INSERT INTO @RtsScreenGroups
(
    [ScreenGroupCode],
    [ScreenGroupName],
    [ScreenGroupNameLocal],
    [ScreenGroupIcon],
    [DisplayOrder]
)
VALUES
    (N'RTS_DASHBOARD',     N'RTS Dashboard',     N'आरटीएस डॅशबोर्ड', N'LayoutDashboard', 70),
    (N'RTS_OPERATIONS',    N'RTS Operations',    N'आरटीएस कामकाज',   N'Files',           71),
    (N'RTS_CONFIGURATION', N'RTS Configuration', N'आरटीएस संरचना',   N'Settings',        72);

INSERT INTO [CORE].[ScreenGroupMaster]
(
    [ScreenGroupCode],
    [ScreenGroupName],
    [ScreenGroupNameLocal],
    [ScreenGroupIcon],
    [DisplayOrder],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    seed.[ScreenGroupCode],
    seed.[ScreenGroupName],
    seed.[ScreenGroupNameLocal],
    seed.[ScreenGroupIcon],
    seed.[DisplayOrder],
    1,
    @AdminUserId,
    GETDATE()
FROM @RtsScreenGroups seed
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenGroupMaster] existing
    WHERE existing.[ScreenGroupCode] = seed.[ScreenGroupCode]
);

UPDATE existing
SET existing.[ScreenGroupName] = seed.[ScreenGroupName],
    existing.[ScreenGroupNameLocal] = seed.[ScreenGroupNameLocal],
    existing.[ScreenGroupIcon] = seed.[ScreenGroupIcon],
    existing.[DisplayOrder] = seed.[DisplayOrder],
    existing.[IsActive] = 1,
    existing.[UpdatedBy] = @AdminUserId,
    existing.[UpdatedDate] = GETDATE()
FROM [CORE].[ScreenGroupMaster] existing
INNER JOIN @RtsScreenGroups seed
    ON seed.[ScreenGroupCode] = existing.[ScreenGroupCode];

DECLARE @RtsScreens TABLE
(
    [ScreenGroupCode] NVARCHAR(200) NOT NULL,
    [ScreenCode] VARCHAR(200) NOT NULL,
    [ScreenName] VARCHAR(200) NOT NULL,
    [ScreenNameLocal] NVARCHAR(200) NOT NULL,
    [ScreenIcon] NVARCHAR(100) NOT NULL,
    [RoutePath] NVARCHAR(300) NOT NULL,
    [DisplayOrder] INT NOT NULL
);

INSERT INTO @RtsScreens
(
    [ScreenGroupCode],
    [ScreenCode],
    [ScreenName],
    [ScreenNameLocal],
    [ScreenIcon],
    [RoutePath],
    [DisplayOrder]
)
VALUES
    (N'RTS_DASHBOARD',     'RTS_MIS',           'RTS MIS Dashboard',   N'आरटीएस एमआयएस डॅशबोर्ड', N'LayoutDashboard', N'/rts/dashboard/rts-mis',                        1),
    (N'RTS_OPERATIONS',    'RTS_APP',           'RTS Applications',    N'आरटीएस अर्ज',             N'Files',           N'/rts/dashboard/rts-applications',               1),
    (N'RTS_CONFIGURATION', 'RTS_DEPT',          'RTS Departments',     N'आरटीएस विभाग',            N'Building2',       N'/rts/departments',                              1),
    (N'RTS_CONFIGURATION', 'RTS_SERVICES',      'RTS Services',        N'आरटीएस सेवा',             N'Activity',        N'/rts/services',                                 2),
    (N'RTS_CONFIGURATION', 'RTS_FIELDS',        'RTS Fields',          N'आरटीएस फील्ड्स',          N'Sliders',         N'/rts/fields',                                   3),
    (N'RTS_CONFIGURATION', 'RTS_APPROVAL_FLOW', 'Approval Flow Master',N'मंजुरी प्रवाह मास्टर',     N'GitMerge',        N'/rts/configuration-settings/rts-workflows',     4),
    (N'RTS_CONFIGURATION', 'RTS_CERTIFICATES',  'Certificate Master',  N'प्रमाणपत्र संरचना',       N'Award',           N'/rts/configuration-settings/rts-certificates',   5),
    (N'RTS_CONFIGURATION', 'RTS_USERS',         'RTS User Management', N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users',       N'/rts/users',                                    6);

INSERT INTO [CORE].[ScreenMaster]
(
    [ScreenGroupId],
    [ModuleId],
    [DepartmentId],
    [ScreenCode],
    [ScreenName],
    [ScreenNameLocal],
    [ScreenIcon],
    [RoutePath],
    [IsMenu],
    [IsAuthenticationRequired],
    [IsPropertyLockable],
    [DisplayOrder],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    screenGroup.[Id],
    @RtsModuleId,
    @RtsDepartmentId,
    seed.[ScreenCode],
    seed.[ScreenName],
    seed.[ScreenNameLocal],
    seed.[ScreenIcon],
    seed.[RoutePath],
    1,
    1,
    0,
    seed.[DisplayOrder],
    1,
    @AdminUserId,
    GETDATE()
FROM @RtsScreens seed
INNER JOIN [CORE].[ScreenGroupMaster] screenGroup
    ON screenGroup.[ScreenGroupCode] = seed.[ScreenGroupCode]
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenMaster] existing
    WHERE existing.[ScreenCode] = seed.[ScreenCode]
);

UPDATE existing
SET existing.[ScreenGroupId] = screenGroup.[Id],
    existing.[ModuleId] = @RtsModuleId,
    existing.[DepartmentId] = @RtsDepartmentId,
    existing.[ScreenName] = seed.[ScreenName],
    existing.[ScreenNameLocal] = seed.[ScreenNameLocal],
    existing.[ScreenIcon] = seed.[ScreenIcon],
    existing.[RoutePath] = seed.[RoutePath],
    existing.[IsMenu] = 1,
    existing.[IsAuthenticationRequired] = 1,
    existing.[IsPropertyLockable] = 0,
    existing.[DisplayOrder] = seed.[DisplayOrder],
    existing.[IsActive] = 1,
    existing.[UpdatedBy] = @AdminUserId,
    existing.[UpdatedDate] = GETDATE()
FROM [CORE].[ScreenMaster] existing
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = existing.[ScreenCode]
INNER JOIN [CORE].[ScreenGroupMaster] screenGroup
    ON screenGroup.[ScreenGroupCode] = seed.[ScreenGroupCode];

UPDATE access
SET access.[CanView] = 1,
    access.[CanEdit] = 1,
    access.[CanDelete] = 1,
    access.[HaveFullAccess] = 1,
    access.[HaveNoAccess] = 0,
    access.[IsActive] = 1,
    access.[UpdatedBy] = @AdminUserId,
    access.[UpdatedDate] = GETDATE()
FROM [CORE].[RoleWiseScreenAccessMaster] access
INNER JOIN [CORE].[ScreenMaster] screen
    ON screen.[Id] = access.[ScreenId]
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = screen.[ScreenCode]
WHERE access.[UserRoleId] = @RtsAdminRoleId;

INSERT INTO [CORE].[RoleWiseScreenAccessMaster]
(
    [UserRoleId],
    [ScreenId],
    [CanView],
    [CanEdit],
    [CanDelete],
    [HaveFullAccess],
    [HaveNoAccess],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    @RtsAdminRoleId,
    screen.[Id],
    1,
    1,
    1,
    1,
    0,
    1,
    @AdminUserId,
    GETDATE()
FROM [CORE].[ScreenMaster] screen
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = screen.[ScreenCode]
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[RoleWiseScreenAccessMaster] existing
    WHERE existing.[UserRoleId] = @RtsAdminRoleId
      AND existing.[ScreenId] = screen.[Id]
);

PRINT 'RTS project registration, screens and Admin access seeded successfully.';
GO

GO

-- =========================================================
-- [RTS].[DepartmentMaster] Live Data Seed (13 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[DepartmentMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, N'Property Tax', N'मालमत्ता कर', N'Home', 1, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (2, N'Water Connection', N'पाणी पुरवठा', N'Droplets', 2, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (3, N'Trade License', N'व्यवसाय परवाना', N'Briefcase', 3, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (4, N'Town Planning', N'नगर रचना', N'Map', 4, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (5, N'Birth & Death', N'जन्म आणि मृत्यू', N'HeartPulse', 5, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (6, N'Education', N'शिक्षण', N'GraduationCap', 6, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (7, N'Health', N'आरोग्य', N'Activity', 7, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (8, N'Fire', N'अग्निशमन', N'Flame', 8, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (9, N'Marriage Certificate', N'लग्न नोंदणी प्रमाणपत्र', N'Heart', 9, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (10, N'Tree', N'वृक्ष प्राधिकरण', N'TreePine', 10, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (11, N'Sanitation', N'स्वच्छता विभाग', N'Trash2', 11, 1, 0, '2026-07-15 16:26:57.467', NULL, NULL),
        (12, N'PWD', N'सार्वजनिक बांधकाम विभाग', N'Building', 12, 1, 0, '2026-08-17 13:30:48.017', NULL, NULL),
        (13, N'NOC', N'ना हरकत प्रमाणपत्र (NOC)', N'ShieldCheck', 8, 1, 0, '2026-08-26 14:56:19.970', NULL, NULL)
    ) AS V ([Id], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[DepartmentMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[DepartmentName] = Source.[DepartmentName],
        Target.[DepartmentNameLocal] = Source.[DepartmentNameLocal],
        Target.[DepartmentIcon] = Source.[DepartmentIcon],
        Target.[DisplayOrder] = Source.[DisplayOrder],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[DepartmentName], Source.[DepartmentNameLocal], Source.[DepartmentIcon], Source.[DisplayOrder], Source.[IsActive], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[DepartmentMaster] OFF;
GO


-- =========================================================
-- [RTS].[ServiceMaster] Live Data Seed (66 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ServiceMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (19, 2, 39, N'Change of Water Connection Usage Type', N'वापरामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 39, N'7 Days', 100.00, 1, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (20, 2, 40, N'Preparation of Water Bill', N'पाणी देयक तयार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'FileText', 40, N'7 Days', 0.00, 0, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (26, 2, 46, N'Complaint Regarding Water Pressure Capacity', N'पाण्याच्या दाब क्षमता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 46, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (33, 3, 13, N'Changing Occupations / Business Type', N'व्यवसाय बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 13, N'7 Days', 150.00, 1, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (36, 3, 16, N'Cancellation of License', N'परवाना रद्द करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 16, N'7 Days', 0.00, 0, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (43, 4, 3, N'Issuance of Zone Certificate', N'झोन दाखला देणे', NULL, NULL, N'Map', 3, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (44, 4, 4, N'Giving Part Map', N'भाग नकाशा देणे', NULL, NULL, N'Map', 4, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (45, 4, 5, N'Issuance of Construction Permit', N'बांधकाम परवाना देणे', NULL, NULL, N'HardHat', 5, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (46, 4, 6, N'Issuance of plinth certificate', N'जोते प्रमाणपत्र देणे', NULL, NULL, N'MapPin', 6, N'7 Days', 0.00, 0, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (47, 4, 7, N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र देणे', NULL, NULL, N'Key', 7, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (48, 4, 61, N'Underground OFC Cable Permission', N'भुमिगत दुरसंचार वाहिनी (ऑप्टीकल फायबर केबल) टाकण्याकरीता परवानगी देणे (Permission for establishment of under-ground Cable Infrastructure - Optical Fibre Cable)', NULL, NULL, N'Cable', 61, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (49, 4, 63, N'Filling Potholes on City Roads', N'रस्त्यांवरील खड्डे बुजविणे', NULL, N'#', N'Wrench', 63, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (50, 4, 64, N'Maintaining & Securing Sewer Covers', N'गटारांवरील झाकणे सुस्थितीत ठेवणे', NULL, N'#', N'Shield', 64, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (53, 5, 20, N'Birth Certificate', N'जन्म प्रमाणपत्र देणे', NULL, NULL, N'Baby', 20, N'7 Days', 50.00, 1, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (54, 5, 21, N'Death Certificate', N'मृत्यु प्रमाणपत्र देणे', NULL, NULL, N'HeartOff', 21, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (55, 6, 50, N'School Leaving / Duplicate Certificate', N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व व्दितीय दाखला देणे', NULL, NULL, N'GraduationCap', 50, N'7 Days', 30.00, 1, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (56, 6, 51, N'Issuance of transfer certificate', N'स्थलांतर दाखला देणे', NULL, NULL, N'GraduationCap', 51, N'7 Days', 0.00, 0, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (57, 6, 52, N'Issuance of duplicate mark sheet', N'व्दितीय गुणपत्रक देणे', NULL, NULL, N'GraduationCap', 52, N'7 Days', 30.00, 1, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (58, 7, 53, N'Nursing home license under Registration Act, 1949', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत शुश्रूषा-गृह परवाना देणे', NULL, NULL, N'PlusSquare', 53, N'30 Days', 500.00, 1, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (59, 7, 54, N'Renewal of nursing home license', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत शुश्रूषा-गृह परवान्याचे नुतनीकरण करणे', NULL, NULL, N'PlusSquare', 54, N'30 Days', 300.00, 1, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (60, 7, 55, N'Change of nursing home license holder / partner name', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत परवान्यावर परवानाधारक/भागीदाराचे नाव बदलणे', NULL, NULL, N'UserPlus', 55, N'15 Days', 200.00, 1, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (61, 13, 1, N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'ShieldCheck', 1, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (62, 13, 2, N'Mandap No-Damage Certificate', N'मंडपासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'Building2', 2, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (63, 13, 18, N'Issuance of Fire Safety NOC', N'अग्निशमन नाहरकत दाखला देणे', NULL, NULL, N'Flame', 18, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (64, 13, 19, N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला देणे', NULL, NULL, N'Flame', 19, N'7 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (65, 9, 22, N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र देणे', NULL, NULL, N'Heart', 22, N'15 Days', 100.00, 1, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (66, 10, 62, N'Tree Felling Permission (Sec 8)', N'महाराष्ट्र (नागरी क्षेत्रे) वृक्ष संरक्षण आणि संवर्धन अधिनियम, 1975 मधील कलम 8 मधील तरतुदीनुसार वृक्षतोड परवानगी देणे', NULL, NULL, N'TreePine', 62, N'15 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (68, 11, 65, N'Maintaining cleanliness', N'शहरात स्वच्छता राखणे', NULL, N'#', N'Trash2', 65, N'7 Days', 0.00, 0, 1, 1, '2026-07-20 13:31:33.447', NULL, NULL),
        (69, 2, 7175, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=21&upicid=', N'Droplet', 49, N'15 Days', 0.00, 0, 1, 0, '2026-07-15 16:26:57.497', NULL, NULL),
        (80, 2, 48, N'Provision of New Water Tap Connection', N'नळ जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 48, N'15 Days', 150.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (81, 2, 36, N'Changing the Water Connection Size', N'नळ जोडणी आकारामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 36, N'7 Days', 100.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (82, 2, 37, N'Temporary / Permanent Disconnection of Water Connection', N'तात्पुरते/कायमस्वरूपी नळ जोडणी खंडीत करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 37, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (83, 2, 38, N'Reconnection of Water Tap', N'पुनः जोडणी करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 38, N'7 Days', 100.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (84, 2, 43, N'Water Bill No Dues Certificate', N'थकबाकी नसल्याचा दाखला', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'FileCheck', 43, N'7 Days', 50.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (85, 2, 44, N'Complaint Regarding Faulty Water Meter', N'नादुरुस्त मीटर तक्रार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 44, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (86, 2, 45, N'Complaint Regarding Unauthorized Water Tap Connection', N'अनधिकृत नळ जोडणी तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 45, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (87, 2, 47, N'Complaint Regarding Water Quality', N'पाण्याची गुणवत्ता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 47, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (100, 2, 41, N'Issuance of Plumber License', N'प्लंबर परवाना', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Wrench', 41, N'15 Days', 300.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (101, 2, 42, N'Renewal of Plumber License', N'प्लंबर परवाना नुतनीकरण करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Wrench', 42, N'15 Days', 200.00, 1, 1, 0, '2026-07-21 18:44:51.083', NULL, NULL),
        (137, 3, 8, N'Obtaining New Trade License', N'नविन परवाना मिळणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 8, N'30 Days', 500.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (138, 3, 9, N'Renewal of Trade License', N'परवान्याचे नुतनीकरण', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 9, N'15 Days', 300.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (139, 3, 10, N'Transfer of Trade License', N'परवाना हस्तांतर', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 10, N'15 Days', 200.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (140, 3, 11, N'Duplicate Copy of Trade License', N'परवाना दुय्यम प्रत', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 11, N'7 Days', 100.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (141, 3, 12, N'Change of Business Name / Establishment / Address', N'व्यवसायाचे नाव बदलणे/प्रतिष्ठानात/पत्यात बदल', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 12, N'7 Days', 150.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (142, 3, 14, N'Change of License Holder / Partner Name', N'परवाना धारक/भागीदाराचे नाव बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 14, N'7 Days', 150.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (143, 3, 15, N'Change in Number of Partners (Increase/Decrease)', N'भागीदाराच्या संख्येत बदल (वाढ/कमी)', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 15, N'7 Days', 150.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (144, 3, 17, N'Notice on Renewal of Expired License', N'कालबाह्य परवानासाठी नुतनीकरण सुचना', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 17, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (145, 1, 23, N'New Property Tax Assessment', N'नव्याने कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Home', 23, N'30 Days', 200.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (146, 1, 24, N'Re-Assessment of Property Tax', N'पुनः कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Home', 24, N'30 Days', 150.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (147, 1, 25, N'Preparation of Tax Demand Notice', N'कराचे मागणी पत्र तयार करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileText', 25, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (148, 1, 26, N'Avail Property Tax Exemption', N'कर माफी मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Receipt', 26, N'15 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (149, 1, 27, N'Tax Exemption for Non-Resident Properties', N'रहिवास नलेल्यास मालमत्तांना करात सुट मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Receipt', 27, N'15 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (150, 1, 28, N'Property Tax Self-Assessment', N'स्वयंमुल्यांकन', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Calculator', 28, N'7 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (151, 1, 29, N'Registration of Objection on Tax Assessment', N'आक्षेप नोंदविणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'AlertTriangle', 29, N'15 Days', 0.00, 0, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (152, 1, 30, N'Sub-division of Property', N'उपविभागामध्ये मालमत्ता विभाजन', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'GitFork', 30, N'15 Days', 100.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (153, 1, 31, N'Re-assessment After Demolition and Reconstruction', N'मालमत्ता पाडणे व पुनःबांधणी कर आकारणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Hammer', 31, N'30 Days', 200.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (154, 1, 32, N'Issuance of Property Tax Assessment Copy (8A)', N'मालमत्ता कर उतारा देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileText', 32, N'7 Days', 50.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (155, 1, 33, N'Issuance of No Dues Certificate', N'थकबाकी नसल्याचा दाखला देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileCheck', 33, N'7 Days', 50.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (156, 1, 34, N'Property Transfer Registration Certificate', N'अ) दस्ताऐवजाच्या आधारे मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे ब) वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'UserCheck', 34, N'15 Days', 200.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (157, 1, 35, N'Change of Ownership Name', N'मालकी हक्कात बदल करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'UserPlus', 35, N'15 Days', 200.00, 1, 1, 0, '2026-07-21 18:57:16.223', 1, '2026-07-23 16:27:10.443'),
        (158, 3, 56, N'Issuance of Lodging House License', N'लॉजिंग हाऊस परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 56, N'15 Days', 500.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (159, 3, 57, N'Renewal of Lodging House License', N'लॉजिंग हाऊस परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 57, N'15 Days', 300.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (160, 3, 58, N'Issuance of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 58, N'15 Days', 500.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (161, 3, 59, N'Renewal of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 59, N'15 Days', 300.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (162, 3, 60, N'Issuance of Hawker Registration Certificate', N'फेरीवाले नोंदणी प्रमाणपत्र देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Store', 60, N'7 Days', 100.00, 1, 1, 0, '2026-07-21 18:57:16.223', NULL, NULL),
        (167, 11, 49, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, NULL, N'Droplet', 49, N'15 Days', 100.00, 1, 1, 0, '2026-08-26 14:56:19.990', NULL, NULL)
    ) AS V ([Id], [DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[ServiceMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[DepartmentId] = Source.[DepartmentId],
        Target.[GovtServiceCode] = Source.[GovtServiceCode],
        Target.[ServiceName] = Source.[ServiceName],
        Target.[ServiceNameLocal] = Source.[ServiceNameLocal],
        Target.[Description] = Source.[Description],
        Target.[ServiceUrl] = Source.[ServiceUrl],
        Target.[ServiceIcon] = Source.[ServiceIcon],
        Target.[DisplayOrder] = Source.[DisplayOrder],
        Target.[Sla] = Source.[Sla],
        Target.[Fees] = Source.[Fees],
        Target.[FeesRequired] = Source.[FeesRequired],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[DepartmentId], Source.[GovtServiceCode], Source.[ServiceName], Source.[ServiceNameLocal], Source.[Description], Source.[ServiceUrl], Source.[ServiceIcon], Source.[DisplayOrder], Source.[Sla], Source.[Fees], Source.[FeesRequired], Source.[IsActive], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[ServiceMaster] OFF;
GO


-- =========================================================
-- [RTS].[FieldDefinition] Live Data Seed (938 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[FieldDefinition] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, 4, 61, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (2, 4, 61, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (3, 4, 61, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (4, 4, 61, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (5, 4, 61, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (6, 4, 61, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (7, 4, 61, N'ownerFirstName', N'Owner First Name', N'मालकाचे पहिले नाव', N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (8, 4, 61, N'ownerMiddleName', N'Owner Middle Name', N'मालकाचे मधले नाव', N'text', N'Owner Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (9, 4, 61, N'ownerLastName', N'Owner Last Name', N'मालकाचे आडनाव', N'text', N'Owner Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (10, 4, 61, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, 1, 10, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (11, 4, 61, N'ownerEmail', N'Owner Email', N'ईमेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (12, 4, 61, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (13, 4, 61, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', 0, 13, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (14, 4, 61, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (15, 4, 61, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (16, 4, 61, N'businessName', N'Business / Trade Name', N'व्यवसाय / व्यापाराचे नाव', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (17, 4, 61, N'workers', N'Number of Employees', N'कर्मचाऱ्यांची संख्या', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (18, 4, 61, N'propertyTaxNo', N'Property Tax Assessment Number', N'मालमत्ता कर आकारणी उतारा क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (19, 4, 61, N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'मालमत्ता कर पावती क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (20, 4, 61, N'businessAddress', N'Business Address', N'पत्ता', N'textarea', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (21, 4, 61, N'activityType', N'Type of Activity', N'व्यवसायाचा प्रकार', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (22, 4, 61, N'licenseCategory', N'Licensing Category', N'परवाना वर्ग', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (23, 4, 61, N'specialCategory', N'Specify License Category (if Special)', N'परवाना श्रेणी नमूद करा (विशेष असल्यास)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (24, 4, 61, N'newBusinessProposal', N'New Business Proposal?', N'नवीन व्यवसाय परवाना प्रस्ताव?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (25, 4, 61, N'workingHours', N'Working Hours', N'कामाच्या वेळा', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (26, 4, 61, N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (27, 4, 61, N'natureOfGoods', N'Nature of Goods Stored / Traded', N'साठवलेल्या मालाचे प्रकार', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (28, 4, 61, N'flammableGoods', N'Flammable/Explosive Goods?', N'ज्वलनशील / स्फोटक माल आहे का?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (29, 4, 61, N'flammableGoodsDetail', N'Flammable Material Details', N'ज्वलनशील मालाचे तपशील', N'text', N'Storage, Safety & Hazard Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (30, 9, 65, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (31, 9, 65, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (32, 9, 65, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (33, 9, 65, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (34, 9, 65, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (35, 9, 65, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (36, 9, 65, N'groomFirstName', N'Groom First Name', N'वराचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (37, 9, 65, N'groomMiddleName', N'Groom Middle Name', N'वराचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (38, 9, 65, N'groomLastName', N'Groom Last Name', N'वराचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (39, 9, 65, N'groomAge', N'Age', N'वय', N'number', N'Bridegroom Details', NULL, NULL, N'{"min":21,"max":100}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (40, 9, 65, N'groomDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bridegroom Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (41, 9, 65, N'groomAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bridegroom Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (42, 9, 65, N'groomFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (43, 9, 65, N'groomFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (44, 9, 65, N'groomFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (45, 9, 65, N'groomMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (46, 9, 65, N'groomMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (47, 9, 65, N'groomMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (48, 9, 65, N'groomparentCity', N'groomParent City', N'वराच्या पालकांचे शहर', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (49, 9, 65, N'groomparentState', N'groomParent State', N'वराच्या पालकांचे राज्य', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (50, 9, 65, N'groomOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (51, 9, 65, N'groomReligion', N'Religion', N'धर्म', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (52, 9, 65, N'brideFirstName', N'Bride First Name', N'वधूचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (53, 9, 65, N'brideMiddleName', N'Bride Middle Name', N'वधूचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (54, 9, 65, N'brideLastName', N'Bride Last Name', N'वधूचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (55, 9, 65, N'brideAge', N'Age', N'वय', N'number', N'Bride Details', NULL, NULL, N'{"min":18,"max":100}', 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (56, 9, 65, N'brideDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bride Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (57, 9, 65, N'brideAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bride Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 28, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (58, 9, 65, N'brideFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (59, 9, 65, N'brideFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (60, 9, 65, N'brideFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (61, 9, 65, N'brideMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (62, 9, 65, N'brideMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (63, 9, 65, N'brideMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (64, 9, 65, N'brideparentCity', N'brideParent City', N'वधूच्या पालकांचे शहर', N'text', N'Bride Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (65, 9, 65, N'brideparentState', N'brideParent State', N'वधूच्या पालकांचे राज्य', N'text', N'Bride Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (66, 9, 65, N'brideOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bride Details', NULL, NULL, NULL, 0, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (67, 9, 65, N'brideReligion', N'Religion', N'धर्म', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (68, 9, 65, N'marriageDate', N'Date of Marriage', N'लग्न तारीख', N'date', N'Marriage Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (69, 9, 65, N'marriagePlace', N'Place of Marriage', N'लग्न ठिकाण', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (70, 9, 65, N'marriageCity', N'marriage City', N'विवाहाचे शहर', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (71, 9, 65, N'marriageState', N'marriage State', N'विवाहाचे राज्य', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (72, 9, 65, N'witness1FirstName', N'Witness 1 First Name', N'साक्षीदार १ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (73, 9, 65, N'witness1MiddleName', N'Witness 1 Middle Name', N'साक्षीदार १ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (74, 9, 65, N'witness1LastName', N'Witness 1 Last Name', N'साक्षीदार १ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (75, 9, 65, N'witness2FirstName', N'Witness 2 First Name', N'साक्षीदार २ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 46, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (76, 9, 65, N'witness2MiddleName', N'Witness 2 Middle Name', N'साक्षीदार २ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (77, 9, 65, N'witness2LastName', N'Witness 2 Last Name', N'साक्षीदार २ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (78, 9, 65, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (79, 11, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (80, 11, 69, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (81, 11, 69, N'email', N'Email (optional)', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (82, 11, 69, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (83, 11, 69, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (84, 11, 69, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (85, 11, 69, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property / Location Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (86, 11, 69, N'wardId', N'Ward', N'प्रभाग', N'select', N'Property / Location Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (87, 11, 69, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (88, 11, 69, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Property / Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (89, 11, 69, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Property / Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (90, 11, 69, N'premisesOccupancyType', N'Premises Type', N'जागेचा प्रकार', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (91, 11, 69, N'connectionType', N'Connection Type', N'जोडणीचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (92, 11, 69, N'useType', N'Use Type', N'वापराचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (93, 11, 69, N'noOfUnits', N'No. of Units (optional)', N'युनिट्सची संख्या (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (94, 11, 69, N'existingArrangement', N'Current Wastewater Arrangement', N'सांडपाण्याची सध्याची व्यवस्था', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (95, 11, 69, N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (96, 11, 69, N'roadCuttingRequired', N'Road Cutting Required?', N'रस्ता खोदाई आवश्यक आहे का?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (97, 11, 69, N'roadCuttingDetails', N'Road Cutting Details (optional)', N'रस्ता खोदाईचे तपशील (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (98, 11, 69, N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (99, 11, 69, N'tradeLicenseNo', N'Trade License No (optional)', N'व्यवसाय परवाना क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (100, 11, 69, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.547', NULL, NULL),
        (101, 4, 61, N'fireNocUpdated', N'Fire NOC Up-to-date?', N'अग्निशामक परवाना अद्ययावत आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (102, 4, 61, N'policeNocSubmitted', N'Police NOC Submitted?', N'पोलीस परवाना सादर केला आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (103, 4, 61, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (104, 4, 62, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (105, 4, 62, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (106, 4, 62, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (107, 4, 62, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (108, 4, 62, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (109, 4, 62, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (110, 4, 62, N'ownerFullName', N'Owner Full Name', N'मालकाचे पूर्ण नाव', N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (113, 4, 62, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, 1, 10, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (114, 4, 62, N'ownerEmail', N'Owner Email', N'ईमेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (115, 4, 62, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (116, 4, 62, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', 0, 13, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (117, 4, 62, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (118, 4, 62, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (119, 4, 62, N'mandalName', N'Mandal Name (Reg. Charity Comm.)', N'मंडळाचे नाव (नोंदणीकृत धर्मादाय संस्था)', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (120, 4, 62, N'registrationNo', N'Registration Number', N'नोंदणी क्रमांक', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (121, 4, 62, N'registrationYear', N'Registration Year', N'नोंदणी वर्ष', N'year', N'Event & Permission Info', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (122, 4, 62, N'chairmanName', N'Name of Chairman/Secretary', N'अध्यक्ष / सचिव यांचे नाव', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (123, 4, 62, N'contactNo', N'Contact No. (President/Secretary)', N'संपर्क क्रमांक (अध्यक्ष / सचिव)', N'tel', N'Event & Permission Info', NULL, NULL, NULL, 0, 20, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (124, 4, 62, N'eventType', N'Type of Event', N'कार्यक्रमाचा प्रकार', N'select', N'Event & Permission Info', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (125, 4, 62, N'eventStartDate', N'Event Start Date', N'कार्यक्रम सुरू होण्याची तारीख', N'date', N'Event & Permission Info', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (126, 4, 62, N'eventEndDate', N'Event End Date', N'कार्यक्रम समाप्तीची तारीख', N'date', N'Event & Permission Info', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (127, 4, 62, N'placeOwnership', N'Ownership of Tent Place', N'कार्यक्रम स्थळाची मालकी', N'select', N'Event & Permission Info', N'[{"value":"Private","label":{"en":"Private","hi":"निजी","mr":"खाजगी"}},{"value":"Municipal","label":{"en":"Municipal/Council","hi":"नगर निगम","mr":"महापालिका/परिषद"}},{"value":"Public","label":{"en":"Public Road","hi":"सार्वजनिक सड़क","mr":"सार्वजनिक रस्ता"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (128, 4, 62, N'zoneNo', N'Zone', N'झोन', N'select', N'Event & Permission Info', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 25, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (129, 4, 62, N'wardArea', N'Ward Area', N'प्रभाग क्षेत्र', N'text', N'Event & Permission Info', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (130, 4, 62, N'plotNo', N'Plot No', N'प्लॉट क्रमांक', N'text', N'Event & Permission Info', NULL, NULL, N'{
  "maxLength": 6,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (131, 4, 62, N'pandolAddress', N'Pandol / Stage Address', N'मंडप / स्टेजचा पत्ता', N'textarea', N'Event & Permission Info', NULL, NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (132, 4, 62, N'mandapType', N'Mandap Type', N'मंडपाचा प्रकार', N'select', N'Mandap Structural Details', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (133, 4, 62, N'mandapArea', N'Mandap Area (sq.ft.)', N'मंडप क्षेत्रफळ (चौ. फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (134, 4, 62, N'areaSqFt', N'Area (Sq Ft)', N'क्षेत्रफळ (चौ. फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (135, 4, 62, N'volunteers', N'No. of Volunteers', N'स्वयंसेवकांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (136, 4, 62, N'numberOfPillars', N'No. of Pillars / Support Beams', N'खांब / आधार बीमची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (137, 4, 62, N'beamMaterial', N'Material Used (Wood/Iron/Steel/Aluminum)', N'वापरलेले साहित्य (लाकूड / लोखंड / स्टील / ॲल्युमिनियम)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (138, 4, 62, N'structuralEngineerName', N'Structural Engineer / Fabricator Name', N'स्ट्रक्चरल अभियंता / फॅब्रिकेटरचे नाव', N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (139, 4, 62, N'mandapHeight', N'Mandap Height (feet)', N'मंडपाची उंची (फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (140, 4, 62, N'windLoadResistance', N'Wind Load Resistance Tested?', N'वाऱ्याच्या भाराची प्रतिकार क्षमता तपासली आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (141, 4, 62, N'fireExtinguishersAvailable', N'Fire Extinguishers Available?', N'अग्निशामक यंत्रे उपलब्ध आहेत का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (142, 4, 62, N'extinguisherCount', N'Number of Extinguishers', N'अग्निशामक यंत्रांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 0, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (143, 4, 62, N'electricalLoad', N'Electrical Load Installed (kW)', N'स्थापित विद्युत भार (kW)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (144, 4, 62, N'earthingProvided', N'Earthing Provided?', N'अर्थिंगची व्यवस्था केली आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (145, 4, 62, N'crowdCapacity', N'Expected Crowd Capacity', N'अपेक्षित गर्दीची क्षमता', N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (146, 4, 62, N'emergencyExits', N'Number of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (147, 4, 62, N'generatorUsed', N'Generator to be Used?', N'जनरेटर वापरणार आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (148, 4, 62, N'contractorAddress', N'Pandol Contractor Address', N'मंडप ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (149, 4, 62, N'contractorContact', N'Pandol Contractor Contact', N'मंडप ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 46, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (150, 4, 62, N'decoratorName', N'Decorator/Electrical Name', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचे नाव', N'text', N'Contractors Info', NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (151, 4, 62, N'decoratorAddress', N'Decorator/Electrical Address', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (152, 4, 62, N'decoratorContact', N'Decorator/Electrical Contact', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 49, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (153, 4, 62, N'soundName', N'Sound/Speaker Contractor Name', N'ध्वनी / स्पीकर ठेकेदाराचे नाव', N'text', N'Contractors Info', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (154, 4, 62, N'soundAddress', N'Sound/Speaker Address', N'ध्वनी / स्पीकर ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (155, 4, 62, N'soundContact', N'Sound/Speaker Contact', N'ध्वनी / स्पीकर ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 52, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (156, 4, 62, N'soundType', N'Sound/Speaker Type', N'ध्वनी / स्पीकरचा प्रकार', N'select', N'Contractors Info', N'[{"value":"DJ","label":{"en":"DJ System","hi":"डीजे सिस्टम","mr":"डीजे सिस्टम"}},{"value":"Loudspeaker","label":{"en":"Loudspeaker","hi":"लाउडस्पीकर","mr":"लाउडस्पीकर"}},{"value":"Traditional","label":{"en":"Traditional Instruments","hi":"पारंपरिक वाद्ययंत्र","mr":"पारंपारिक वाद्ये"}}]', NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (157, 4, 62, N'policeStation', N'Concerned Police Station', N'संबंधित पोलीस स्टेशन', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (158, 4, 62, N'trafficPoliceStation', N'Concerned Traffic Police Station', N'संबंधित वाहतूक पोलीस स्टेशन', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (159, 4, 62, N'fireStation', N'Nearest Fire Station', N'जवळचे अग्निशमन केंद्र', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (160, 4, 62, N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'सार्वजनिक मालमत्तेचे कोणतेही नुकसान होणार नाही याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (161, 4, 62, N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'कार्यक्रमानंतर परिसर स्वच्छ करण्याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (162, 4, 62, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (163, 8, 63, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (164, 8, 63, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (165, 8, 63, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (166, 8, 63, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (167, 8, 63, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (168, 8, 63, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:05:28.417'),
        (169, 8, 63, N'ownerName', N'Name of Owner', N'मालकाचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (170, 8, 63, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (171, 8, 63, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:05:28.417'),
        (172, 8, 63, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (173, 8, 63, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (174, 8, 63, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:12:38.640'),
        (175, 8, 63, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (176, 8, 63, N'zoneWard', N'Zone/Ward', N'झोन / प्रभाग', N'select', N'Owner & Premises details', N'[
      {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
      {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
      {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
      {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
      {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
      {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
      {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
      {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
      {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
      {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
      {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

      {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
      {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
      {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
      {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
      {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
      {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
      {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
      {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
      {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
      {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
      {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
      {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
      {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
      {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

      {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
      {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
      {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
      {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
      {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
      {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
      {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
      {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
      {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
      {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
      {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

      {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
      {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
      {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
      {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
      {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
      {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
      {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
      {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
      {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
      {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
      {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
      {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:18:27.640'),
        (177, 8, 63, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (178, 8, 63, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (179, 8, 63, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (180, 8, 63, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (181, 8, 63, N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'प्रस्तावित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (182, 8, 63, N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'प्रस्तावित आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (183, 8, 63, N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'प्रस्तावित एकत्रीकरण / मस्टर पॉईंट तपशील', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:27:43.313'),
        (184, 8, 63, N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'अत्यंत ज्वलनशील साहित्य साठविण्यात येणार आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (185, 8, 63, N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (186, 8, 63, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (187, 8, 63, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (188, 8, 64, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (189, 8, 64, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (190, 8, 64, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (191, 8, 64, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (192, 8, 64, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (193, 8, 64, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (194, 8, 64, N'ownerName', N'Name of Owner', NULL, N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (195, 8, 64, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (196, 8, 64, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (197, 8, 64, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (198, 8, 64, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (199, 8, 64, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', 0, '2026-08-18 19:12:38.640'),
        (200, 8, 64, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.597', NULL, NULL),
        (201, 5, 53, N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'जन्मतारीख (दि-महा-वर्ष)', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (202, 5, 53, N'gender', N'Sex', N'लिंग', N'select', N'Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (203, 5, 53, N'childFirstName', N'Child First Name', N'बालकाचे पहिले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (204, 5, 53, N'childMiddleName', N'Child Middle Name', N'बालकाचे मधले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (205, 5, 53, N'childLastName', N'Child Last Name', N'बालकाचे आडनाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (206, 5, 53, N'childAadhaar', N'Aadhaar No. (Optional)', N'बालकाचा आधार क्रमांक (ऐच्छिक)', N'text', N'Child, Birth & Registrar Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 12, NULL, NULL, 14, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (207, 5, 53, N'placeOfBirthType', N'Place of Birth Type', N'जन्मस्थळाचा प्रकार', N'select', N'Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (208, 5, 53, N'hospitalName', N'Hospital / Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (209, 5, 53, N'birthPlaceAddress', N'Complete Birth Address', N'संपूर्ण जन्मस्थळाचा पत्ता', N'textarea', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (210, 5, 53, N'birthPlaceSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (211, 5, 53, N'birthPlaceDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (212, 5, 53, N'birthPlaceState', N'State / UT', N'राज्य / केंद्रशासित प्रदेश', N'Select', N'Child, Birth & Registrar Details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 17:39:22.510'),
        (213, 5, 53, N'birthPlacePinCode', N'PIN Code', N'पिन कोड', N'number', N'Child, Birth & Registrar Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (214, 5, 53, N'_registrar_header', N'Registrar Details', NULL, N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (215, 5, 53, N'registrationNo', N'Registration No.', N'नोंदणी क्रमांक', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (216, 5, 53, N'registrationDate', N'Registration Date', N'नोंदणी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (217, 5, 53, N'registrationUnit', N'Registration Unit', N'नोंदणी युनिट', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (218, 5, 53, N'registrarTownVillage', N'Town / Village', N'शहर / गाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (219, 5, 53, N'registrarDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (220, 5, 53, N'registrarSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (221, 5, 53, N'registrarName', N'Registrar Name', N'निबंधकाचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (222, 5, 53, N'registrarSignatureDate', N'Registrar Signature Date', N'निबंधक स्वाक्षरी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (223, 5, 53, N'registrarRemarks', N'Remarks', N'शेरा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (224, 5, 53, N'permanentHouseNo', N'House No.', N'कायमचा घर क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (225, 5, 53, N'permanentLocality', N'Locality', N'कायमचा परिसर / वस्ती', N'text', N'Address Information', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (226, 5, 53, N'permanentWard', N'Ward No.', N'कायमचा प्रभाग क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (227, 5, 53, N'permanentTownVillage', N'Town / Village', N'कायमचे शहर / गाव', N'text', N'Address Information', NULL, NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (228, 5, 53, N'permanentSubDistrict', N'Sub-district', N'कायमचा उपजिल्हा', N'text', N'Address Information', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (229, 5, 53, N'permanentDistrict', N'District', N'कायमचा जिल्हा', N'text', N'Address Information', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (230, 5, 53, N'permanentState', N'State / UT', N'कायमचे राज्य / केंद्रशासित प्रदेश', N'Select', N'Address Information', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 17:39:22.510'),
        (231, 5, 53, N'permanentPinCode', N'PIN Code', N'कायमचा पिन कोड', N'text', N'Address Information', NULL, NULL, NULL, 1, 37, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (232, 5, 53, N'permanentAddressProofType', N'Permanent Address Proof Type', N'कायमच्या पत्त्याच्या पुराव्याचा प्रकार', N'select', N'Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (233, 5, 53, N'addressProofLast4Digits', N'Last 4 Digits', N'पत्ता पुराव्याचे शेवटचे 4 अंक', N'text', N'Address Information', NULL, NULL, NULL, 1, 39, NULL, NULL, 4, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (234, 5, 53, N'motherFirstName', N'Mother First Name', N'आईचे पहिले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (235, 5, 53, N'motherMiddleName', N'Mother Middle Name', N'आईचे मधले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (236, 5, 53, N'motherLastName', N'Mother Last Name', N'आईचे आडनाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (237, 5, 53, N'motherAadhaar', N'Mother Aadhaar No.', N'आईचा आधार क्रमांक', N'text', N'Mother''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 43, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 18:01:18.293'),
        (238, 5, 53, N'motherMobile', N'Mother Mobile No.', N'आईचा मोबाईल क्रमांक', N'tel', N'Mother''s Information', NULL, NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (239, 5, 53, N'motherEmail', N'Mother Email ID', N'आईचा ई-मेल आयडी', N'email', N'Mother''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (240, 5, 53, N'motherAgeAtMarriage', N'Age at First Marriage', N'पहिल्या विवाहावेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 46, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (241, 5, 53, N'motherAgeAtBirth', N'Age at This Birth', N'या प्रसूतीवेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (242, 5, 53, N'childrenBornAlive', N'Children Born Alive', N'जिवंत जन्मलेल्या बालकांची संख्या', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (243, 5, 53, N'fatherFirstName', N'Father First Name', N'वडिलांचे पहिले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (244, 5, 53, N'fatherMiddleName', N'Father Middle Name', N'वडिलांचे मधले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (245, 5, 53, N'fatherLastName', N'Father Last Name', N'वडिलांचे आडनाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (246, 5, 53, N'fatherAadhaar', N'Father Aadhaar No.', N'वडिलांचा आधार क्रमांक', N'text', N'Father''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 52, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 18:25:46.050'),
        (247, 5, 53, N'fatherMobile', N'Father Mobile No.', N'वडिलांचा मोबाईल क्रमांक', N'tel', N'Father''s Information', NULL, NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (248, 5, 53, N'fatherEmail', N'Father Email ID', N'वडिलांचा ई-मेल आयडी', N'email', N'Father''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (249, 5, 53, N'informantFirstName', N'Informant First Name', N'माहिती देणाऱ्याचे पहिले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (250, 5, 53, N'informantMiddleName', N'Informant Middle Name', N'माहिती देणाऱ्याचे मधले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (251, 5, 53, N'informantLastName', N'Informant Last Name', N'माहिती देणाऱ्याचे आडनाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (252, 5, 53, N'informantMobile', N'Informant Mobile', N'माहिती देणाऱ्याचा मोबाईल क्रमांक', N'tel', N'Informant Details', NULL, NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (253, 5, 53, N'informantAddress', N'Informant Address', N'माहिती देणाऱ्याचा पत्ता', N'textarea', N'Informant Details', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (254, 5, 53, N'declarationAccuracy', N'I confirm info is accurate', N'मी पुष्टी करतो / करते की दिलेली माहिती अचूक आहे', N'select', N'Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (255, 5, 53, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 61, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (256, 5, 54, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (257, 5, 54, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (258, 5, 54, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (259, 5, 54, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (260, 5, 54, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (261, 5, 54, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (262, 5, 54, N'deceasedFirstName', N'Deceased First Name', N'मृत व्यक्तीचे पहिले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (263, 5, 54, N'deceasedMiddleName', N'Deceased Middle Name', N'मृत व्यक्तीचे मधले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (264, 5, 54, N'deceasedLastName', N'Deceased Last Name', N'मृत व्यक्तीचे आडनाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (265, 5, 54, N'dateOfDeath', N'Date of Death', N'मृत्यूची तारीख', N'date', N'Deceased Person Information', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (266, 5, 54, N'timeOfDeath', N'Time of Death', N'मृत्यूची वेळ', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (267, 5, 54, N'age', N'Age at Death', N'मृत्यूसमयी वय', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (268, 5, 54, N'gender', N'Gender', N'लिंग', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (269, 5, 54, N'deathType', N'Type of Death', N'मृत्यूचा प्रकार', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (270, 5, 54, N'deathNature', N'Nature of Death (If Accidental)', N'मृत्यूचे स्वरूप (अपघाती असल्यास)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (271, 5, 54, N'incidentPlaceHouseNo', N'Incident House No.', N'घटनास्थळाचा घर क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (272, 5, 54, N'incidentPlaceLocality', N'Incident Locality/Area', N'घटनास्थळाचा परिसर / क्षेत्र', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (273, 5, 54, N'incidentPlaceTown', N'Town/City', N'घटनास्थळाचे शहर / गाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (274, 5, 54, N'incidentPlaceDistrict', N'District', N'घटनास्थळाचा जिल्हा', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (275, 5, 54, N'incidentPlaceState', N'State', N'घटनास्थळाचे राज्य', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (276, 5, 54, N'incidentPlacePinCode', N'PIN Code', N'घटनास्थळाचा पिन कोड', N'number', N'Death Circumstance Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (277, 8, 64, N'zoneWard', N'Zone/Ward', N'झोन / प्रभाग', N'select', N'Owner & Premises details', N'[
      {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
      {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
      {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
      {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
      {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
      {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
      {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
      {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
      {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
      {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
      {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

      {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
      {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
      {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
      {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
      {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
      {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
      {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
      {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
      {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
      {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
      {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
      {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
      {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
      {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

      {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
      {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
      {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
      {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
      {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
      {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
      {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
      {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
      {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
      {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
      {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

      {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
      {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
      {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
      {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
      {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
      {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
      {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
      {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
      {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
      {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
      {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
      {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 19:18:27.640'),
        (278, 8, 64, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (279, 8, 64, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (280, 8, 64, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (281, 8, 64, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (282, 8, 64, N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'स्थापित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (283, 8, 64, N'extinguisherType', N'Type of Extinguishers', N'अग्निशामक यंत्रांचा प्रकार', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (284, 8, 64, N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'प्रति 100 चौ. फूट अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (285, 8, 64, N'lastRefillDate', N'Last Refill/Service Date', N'शेवटची रिफिल / सर्व्हिस तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (286, 8, 64, N'nextRefillDueDate', N'Next Service Due Date', N'पुढील सर्व्हिसची नियोजित तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (287, 8, 64, N'installerAgency', N'Installer/Service Agency Name', N'इंस्टॉलर / सेवा संस्थेचे नाव', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', 0, '2026-08-18 19:41:05.413'),
        (288, 8, 64, N'serviceAgencyLicenseNo', N'Service Agency License No.', N'सेवा संस्थेचा परवाना क्रमांक', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (289, 8, 64, N'emergencyExitCount', N'No. of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (290, 8, 64, N'exitSignage', N'Exit Direction Signage Installed', N'बाहेर पडण्याचे दिशादर्शक फलक बसवले आहेत का?', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (291, 8, 64, N'routeMarking', N'Evacuation Route Marked', N'बाहेर पडण्याचा मार्ग चिन्हांकित केला आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (292, 8, 64, N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'स्वतंत्र अग्निसुरक्षा जिना उपलब्ध आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (293, 8, 64, N'musterPoint', N'Assembly / Muster Point Details', N'एकत्रीकरण / मस्टर पॉईंट तपशील', N'textarea', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (294, 8, 64, N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'फायर अलार्म प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (295, 8, 64, N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'हायड्रंट / स्प्रिंकलर प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (296, 8, 64, N'earthingCertified', N'Earthing System Certified?', N'अर्थिंग प्रणाली प्रमाणित आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (297, 8, 64, N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'अत्यंत ज्वलनशील साहित्य साठवले आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (298, 8, 64, N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (299, 8, 64, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (300, 8, 64, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.647', NULL, NULL),
        (301, 4, 43, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (302, 4, 43, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (303, 4, 43, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (304, 4, 43, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (305, 4, 43, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (306, 4, 43, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (307, 4, 43, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (308, 4, 43, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (309, 4, 43, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (310, 4, 43, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (311, 4, 43, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (312, 4, 43, N'purpose', N'Purpose', N'उद्देश', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (313, 4, 43, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (314, 4, 43, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (315, 4, 44, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (316, 4, 44, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (317, 4, 44, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (318, 4, 44, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (319, 4, 44, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (320, 4, 44, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (321, 4, 44, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (322, 4, 44, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (323, 4, 44, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (324, 4, 44, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (325, 4, 44, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (326, 4, 44, N'purpose', N'Purpose', N'उद्देश', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (327, 4, 44, N'partMapType', N'Part Map Type', N'भाग नकाशाचा प्रकार', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (328, 4, 44, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (329, 4, 44, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (330, 4, 45, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (331, 4, 45, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (332, 4, 45, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (333, 4, 45, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (334, 4, 45, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (335, 4, 45, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (336, 4, 45, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (337, 4, 45, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (338, 4, 45, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (339, 4, 45, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (340, 4, 45, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (341, 4, 45, N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'प्लॉटचे क्षेत्रफळ (चौ. मी.)', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (342, 4, 45, N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'सीटीएस / सर्व्हे क्रमांक', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (343, 4, 45, N'typeOfWork', N'Type of Work', N'कामाचा प्रकार', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (344, 4, 45, N'buildingUse', N'Building Use', N'इमारतीचा वापर', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (345, 4, 45, N'proposedFloors', N'Total Floors (Proposed)', N'प्रस्तावित एकूण मजले', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (346, 4, 45, N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'प्रस्तावित एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (347, 4, 45, N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'तळघर / स्टिल्ट पार्किंग आहे का?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (348, 4, 45, N'buildingHeightM', N'Building Height (m) (if known)', N'इमारतीची उंची (मी.) (माहित असल्यास)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (349, 4, 45, N'briefWorkDescription', N'Brief Description (optional)', N'कामाचे संक्षिप्त वर्णन (ऐच्छिक)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (350, 4, 45, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (351, 4, 45, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (352, 4, 45, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (353, 4, 45, N'architectMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 24, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (354, 4, 45, N'architectEmail', N'Email (optional)', N'ईमेल', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (355, 4, 45, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (356, 4, 47, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (357, 4, 47, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (358, 4, 47, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (359, 4, 47, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (360, 4, 47, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (361, 4, 47, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (362, 4, 47, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (363, 4, 47, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (364, 4, 47, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (365, 4, 47, N'zoneId', N'Zone', N'झोन', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (366, 4, 47, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (367, 4, 47, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (368, 4, 47, N'ocType', N'OC Type', N'भोगवटा प्रमाणपत्राचा प्रकार', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (369, 4, 47, N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'बांधकाम परवानगी / सीसी संदर्भ क्रमांक', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 14, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (370, 4, 47, N'completionDate', N'Completion Date', N'पूर्णत्वाची तारीख', N'date', N'OC Request Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (371, 4, 47, N'totalFloorsConstructed', N'Total Floors Constructed', N'बांधलेल्या एकूण मजल्यांची संख्या', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (372, 4, 47, N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (373, 4, 47, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'OC Request Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (374, 4, 47, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (375, 4, 47, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (376, 4, 47, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (377, 5, 54, N'policeStation', N'Police Station Name', N'पोलीस स्टेशनचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (378, 5, 54, N'firCaseNumber', N'FIR / Case Number', N'एफआयआर / प्रकरण क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (379, 5, 54, N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'प्रथम वैद्यकीय उपचार केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (380, 5, 54, N'firstTreatmentAddress', N'First Treatment Hospital Address', N'प्रथम उपचार रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (381, 5, 54, N'deathDeclaredHospital', N'Death Declared Hospital Name', N'मृत्यू घोषित केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (382, 5, 54, N'deathDeclaredAddress', N'Death Declared Hospital Address', N'मृत्यू घोषित केलेल्या रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (383, 5, 54, N'placeOfDeathType', N'Place of Death', N'मृत्यूस्थळाचा प्रकार', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (384, 5, 54, N'hospitalName', N'Hospital/Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Place of Death', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (385, 5, 54, N'deathAddress', N'Complete Death Address', N'मृत्यूस्थळाचा संपूर्ण पत्ता', N'textarea', N'Place of Death', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (386, 5, 54, N'deathPinCode', N'PIN Code', N'पिन कोड', N'number', N'Place of Death', NULL, NULL, N'{"min":0}', 0, 31, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (387, 5, 54, N'deactivateAadhaar', N'Aadhaar Deactivation', N'आधार निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (388, 5, 54, N'deactivatePAN', N'PAN Deactivation', N'पॅन निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (389, 5, 54, N'cancelPassport', N'Passport Cancellation', N'पासपोर्ट रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (390, 5, 54, N'deleteVoterID', N'Voter ID Deletion', N'मतदार ओळखपत्र रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (391, 5, 54, N'terminatePension', N'Pension Account Termination', N'पेन्शन खाते बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (392, 5, 54, N'freezeBankAccount', N'Bank Account Freeze Notification', N'बँक खाते गोठविण्याची सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (393, 5, 54, N'deactivateSIM', N'SIM/Telecom Deactivation', N'सिम / दूरसंचार सेवा निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (394, 5, 54, N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'यूपीआय / डिजिटल वॉलेट बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (395, 5, 54, N'notifyInsurance', N'Insurance Company Notification', N'विमा कंपनीला सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (396, 5, 54, N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'कर्ज / क्रेडिट दायित्वाबाबत सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (397, 5, 54, N'digitalDeactivationConsent', N'Consent Declaration', N'डिजिटल सेवा निष्क्रिय करण्यास संमती', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (398, 5, 54, N'addressVerifiedUsing', N'Permanent Address Verified Using', N'कायमचा पत्ता पडताळणीचा आधार', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (399, 5, 54, N'verifiedByRegistrar', N'Verified by Registrar', N'निबंधकाद्वारे पडताळणी', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (400, 5, 54, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.690', NULL, NULL),
        (401, 4, 47, N'architectMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 22, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (402, 4, 47, N'architectEmail', N'Email (optional)', N'ईमेल', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (403, 4, 47, N'declaration', N'I hereby declare that the construction has been completed as per the approved plan and applicable rules.', N'मी घोषित करतो की बांधकाम मंजूर नकाशा व लागू नियमांनुसार पूर्ण झाले आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (404, 12, 48, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (405, 12, 48, N'organizationName', N'Organization / Company Name', N'संस्था / कंपनीचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (406, 12, 48, N'authorizedSignatoryName', N'Authorized Signatory Name', N'अधिकृत स्वाक्षरीकर्त्याचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (407, 12, 48, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (408, 12, 48, N'email', N'Email', N'ईमेल', N'email', N'Applicant / Organization Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (409, 12, 48, N'officeAddress', N'Office Address', N'कार्यालयाचा पत्ता', N'textarea', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (410, 12, 48, N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'परवाना / नोंदणी क्रमांक (असल्यास)', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 0, 7, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (411, 12, 48, N'gstNo', N'GST No (if any)', N'जीएसटी क्रमांक (असल्यास)', N'number', N'Applicant / Organization Details', NULL, NULL, N'{"min":0}', 0, 8, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (412, 12, 48, N'wardId', N'Ward', N'प्रभाग', N'select', N'Work Location Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (413, 12, 48, N'zoneId', N'Zone', N'झोन', N'select', N'Work Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (414, 12, 48, N'workAreaType', N'Work Area Type', N'कार्यक्षेत्राचा प्रकार', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (415, 12, 48, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (416, 12, 48, N'fromLocation', N'From Location', N'सुरुवातीचे ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (417, 12, 48, N'toLocation', N'To Location', N'अंतिम ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (418, 12, 48, N'landmark', N'Landmark (optional)', N'जवळची खूण (ऐच्छिक)', N'text', N'Work Location Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (419, 12, 48, N'totalRouteLengthMeters', N'Total Route Length (meters)', N'मार्गाची एकूण लांबी (मीटरमध्ये)', N'number', N'Work Location Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (420, 12, 48, N'methodOfLaying', N'Method of Laying', N'वाहिनी टाकण्याची पद्धत', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (421, 12, 48, N'trenchWidthCm', N'Trench Width (cm)', N'चराची रुंदी (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (422, 12, 48, N'trenchDepthCm', N'Trench Depth (cm)', N'चराची खोली (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (423, 12, 48, N'roadCrossingsCount', N'No. of Road Crossings', N'रस्ता ओलांडण्यांची संख्या', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (424, 12, 48, N'ductPipeSize', N'Duct / HDPE Pipe Size', N'डक्ट / एचडीपीई पाईपचा आकार', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (425, 12, 48, N'noOfDucts', N'No. of Ducts (optional)', N'डक्टची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (426, 12, 48, N'handholesChambersCount', N'Handholes / Chambers (optional)', N'हँडहोल्स / चेंबर्सची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (427, 12, 48, N'expectedStartDate', N'Expected Start Date', N'अपेक्षित सुरू तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (428, 12, 48, N'expectedEndDate', N'Expected End Date', N'अपेक्षित अंतिम तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (429, 12, 48, N'trafficManagementRequired', N'Traffic Management Required?', N'रहदारी व्यवस्थापन आवश्यक आहे का?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (430, 6, 55, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (431, 6, 55, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (432, 6, 55, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (433, 6, 55, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (434, 6, 55, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (435, 6, 55, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (436, 6, 55, N'relationshipToStudent', N'Relationship to Student', N'विद्यार्थ्याशी नाते', N'select', N'Applicant Information', N'[

  {"value":"father","label":{"en":"Father","hi":"????","mr":"????"}},

  {"value":"mother","label":{"en":"Mother","hi":"????","mr":"??"}},

  {"value":"self","label":{"en":"Self","hi":"?????","mr":"?????"}},

  {"value":"other","label":{"en":"Other","hi":"????","mr":"???"}}

]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (437, 6, 55, N'guardianFullName', N'Parent/Guardian Full Name', N'पालक / संरक्षकाचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (438, 6, 55, N'rollNumber', N'Roll Number', N'अनुक्रमांक', N'text', N'Student Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (439, 6, 55, N'studentName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (440, 6, 55, N'dateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (441, 6, 55, N'gender', N'Gender', N'लिंग', N'select', N'Student Details', N'[{"value":"male","label":{"en":"Male","hi":"?????","mr":"?????"}},{"value":"female","label":{"en":"Female","hi":"?????","mr":"?????"}},{"value":"other","label":{"en":"Other","hi":"????","mr":"???"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (442, 6, 55, N'motherName', N'Mother''s Name', N'आईचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (443, 6, 55, N'fatherName', N'Father''s Name', N'वडिलांचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (444, 6, 55, N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'आधार क्रमांकाचे शेवटचे 4 अंक (ऐच्छिक)', N'text', N'Student Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 4,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 15, NULL, NULL, 4, 0, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (445, 6, 55, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[    {"value":"Marathi Boys School No. 4","label":{"en":"Marathi Boys School No. 4","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Marathi Boys School No. 7","label":{"en":"Marathi Boys School No. 7","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Marathi Boys School No. 9","label":{"en":"Marathi Boys School No. 9","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Marathi Boys School No. 12","label":{"en":"Marathi Boys School No. 12","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 14","label":{"en":"Marathi Boys School No. 14","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 16","label":{"en":"Marathi Boys School No. 16","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 17","label":{"en":"Marathi Boys School No. 17","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 18","label":{"en":"Marathi Boys School No. 18","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 19","label":{"en":"Marathi Boys School No. 19","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 22","label":{"en":"Marathi Boys School No. 22","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Marathi Boys School No. 26","label":{"en":"Marathi Boys School No. 26","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},      {"value":"Marathi Girls School No. 7","label":{"en":"Marathi Girls School No. 7","hi":"????? ?????? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}},      {"value":"Hindi Boys School No. 1","label":{"en":"Hindi Boys School No. 1","hi":"????? ???? ???????? ???. ?","mr":"????? ???? ???? ???. ?"}},    {"value":"Hindi Boys School No. 2","label":{"en":"Hindi Boys School No. 2","hi":"????? ???? ???????? ???. ?","mr":"????? ???? ???? ???. ?"}},    {"value":"Hindi Boys School No. 6","label":{"en":"Hindi Boys School No. 6","hi":"????? ???? ???????? ???. ?","mr":"????? ???? ???? ???. ?"}},    {"value":"Hindi Boys School No. 8","label":{"en":"Hindi Boys School No. 8","hi":"????? ???? ???????? ???. ?","mr":"????? ???? ???? ???. ?"}},      {"value":"Sindhi Hindi School No. 1","label":{"en":"Sindhi Hindi School No. 1","hi":"????? ????? ???? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}},    {"value":"Gujarati Boys School No. 1","label":{"en":"Gujarati Boys School No. 1","hi":"??????? ???? ???????? ???. ?","mr":"??????? ???? ???? ???. ?"}},      {"value":"Urdu Boys School No. 1","label":{"en":"Urdu Boys School No. 1","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 2","label":{"en":"Urdu Boys School No. 2","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 6","label":{"en":"Urdu Boys School No. 6","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 7","label":{"en":"Urdu Boys School No. 7","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 8","label":{"en":"Urdu Boys School No. 8","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 9","label":{"en":"Urdu Boys School No. 9","hi":"????? ???? ???????? ???. ?","mr":"????? ??????? ???? ???. ?"}},    {"value":"Urdu Boys School No. 10","label":{"en":"Urdu Boys School No. 10","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Urdu Boys School No. 11","label":{"en":"Urdu Boys School No. 11","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},    {"value":"Urdu Boys School No. 12","label":{"en":"Urdu Boys School No. 12","hi":"????? ???? ???????? ???. ??","mr":"????? ??????? ???? ???. ??"}},      {"value":"Urdu Girls School No. 1","label":{"en":"Urdu Girls School No. 1","hi":"????? ???? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}},    {"value":"Urdu Girls School No. 3","label":{"en":"Urdu Girls School No. 3","hi":"????? ???? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}},    {"value":"Urdu Girls School No. 4","label":{"en":"Urdu Girls School No. 4","hi":"????? ???? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}},    {"value":"Urdu Girls School No. 5","label":{"en":"Urdu Girls School No. 5","hi":"????? ???? ???????? ???. ?","mr":"????? ????? ???? ???. ?"}}  ]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (446, 6, 55, N'lastStandardStudied', N'Last Standard/Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"1??","mr":"?????? ? ??"}},{"value":"std_2","label":{"en":"2nd Std","hi":"2??","mr":"?????? ? ??"}},{"value":"std_3","label":{"en":"3rd Std","hi":"3??","mr":"?????? ? ??"}},{"value":"std_4","label":{"en":"4th Std","hi":"4??","mr":"?????? ? ??"}},{"value":"std_5","label":{"en":"5th Std","hi":"5??","mr":"?????? ? ??"}},{"value":"std_6","label":{"en":"6th Std","hi":"6??","mr":"?????? ? ??"}},{"value":"std_7","label":{"en":"7th Std","hi":"7??","mr":"?????? ? ??"}},{"value":"std_8","label":{"en":"8th Std","hi":"8??","mr":"?????? ? ??"}},{"value":"std_9","label":{"en":"9th Std","hi":"9??","mr":"?????? ? ??"}},{"value":"std_10","label":{"en":"10th Std","hi":"10??","mr":"?????? ?? ??"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (447, 6, 55, N'yearOfLeaving', N'Year of Leaving', N'शाळा सोडल्याचे वर्ष', N'number', N'School Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, 4, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (448, 6, 55, N'certificateType', N'Certificate Type', N'प्रमाणपत्राचा प्रकार', N'select', N'School Details', N'[
  {
    "value": "School Leaving Certificate",
    "label": {
      "en": "School Leaving Certificate",
      "hi": "???????? ?????? ?? ??????????",
      "mr": "???? ????????? ?????"
    }
  },
  {
    "value": "Duplicate Certificate",
    "label": {
      "en": "Duplicate Certificate",
      "hi": "????????? ??????????",
      "mr": "?????? ??????????"
    }
  }
]', NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (449, 6, 55, N'lastAttendanceDate', N'Last Attendance Date', N'शेवटची उपस्थिती तारीख', N'date', N'School Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (450, 6, 55, N'boardOrUniversity', N'Board / University', N'मंडळ / विद्यापीठ', N'text', N'School Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (451, 6, 55, N'reasonForLeaving', N'Reason for Leaving', N'शाळा सोडण्याचे कारण', N'select', N'Certificate Details', N'[
  {
    "value": "Completed Studies",
    "label": {
      "en": "Completed Studies",
      "hi": "?????? ????? ???",
      "mr": "?????? ????? ????"
    }
  },
  {
    "value": "Admission to Another School",
    "label": {
      "en": "Admission to Another School",
      "hi": "???? ???????? ??? ??????",
      "mr": "??????? ????? ??????"
    }
  },
  {
    "value": "Higher Education",
    "label": {
      "en": "Higher Education",
      "hi": "???? ??????",
      "mr": "???? ??????"
    }
  },
  {
    "value": "Transfer of Parent / Guardian",
    "label": {
      "en": "Transfer of Parent / Guardian",
      "hi": "????-???? / ??????? ?? ??????????",
      "mr": "???????? ????"
    }
  },
  {
    "value": "Relocation",
    "label": {
      "en": "Relocation",
      "hi": "????? ????????",
      "mr": "????????"
    }
  },
  {
    "value": "Personal Reason",
    "label": {
      "en": "Personal Reason",
      "hi": "????????? ????",
      "mr": "???????? ????"
    }
  },
  {
    "value": "Financial Reason",
    "label": {
      "en": "Financial Reason",
      "hi": "?????? ????",
      "mr": "?????? ????"
    }
  },
  {
    "value": "Other",
    "label": {
      "en": "Other",
      "hi": "????",
      "mr": "???"
    }
  }
]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (452, 6, 55, N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'सर्व थकीत देणी भरली आहेत का?', N'select', N'Certificate Details', N'[
  {
    "value": "Yes",
    "label": {
      "en": "Yes",
      "hi": "???",
      "mr": "???"
    }
  },
  {
    "value": "No",
    "label": {
      "en": "No",
      "hi": "????",
      "mr": "????"
    }
  }
]', NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (453, 6, 55, N'duplicateReason', N'Reason for Duplicate', N'डुप्लिकेट प्रमाणपत्राचे कारण', N'select', N'Certificate Details', N'[
  {
    "value": "Original Certificate Lost",
    "label": {
      "en": "Original Certificate Lost",
      "hi": "??? ?????????? ?? ???",
      "mr": "??? ?????????? ?????"
    }
  },
  {
    "value": "Original Certificate Damaged",
    "label": {
      "en": "Original Certificate Damaged",
      "hi": "??? ?????????? ??????????? ?? ???",
      "mr": "??? ?????????? ???? ????"
    }
  },
  {
    "value": "Original Certificate Destroyed",
    "label": {
      "en": "Original Certificate Destroyed",
      "hi": "??? ?????????? ???? ?? ???",
      "mr": "??? ?????????? ???? ????"
    }
  },
  {
    "value": "Certificate Misplaced",
    "label": {
      "en": "Certificate Misplaced",
      "hi": "?????????? ??? ?? ???",
      "mr": "?????????? ???? ????"
    }
  },
  {
    "value": "Name / Details Correction",
    "label": {
      "en": "Name / Details Correction",
      "hi": "??? / ????? ??? ?????",
      "mr": "??? / ????? ????????"
    }
  },
  {
    "value": "Other",
    "label": {
      "en": "Other",
      "hi": "????",
      "mr": "???"
    }
  }
]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (454, 6, 55, N'originalCertificateNumber', N'Original Certificate No. (if known)', NULL, N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (455, 6, 55, N'policeComplaintFiled', N'Police Complaint Filed?', N'पोलीस तक्रार दाखल केली आहे का?', N'select', N'Certificate Details', N'[
  {
    "value": "Yes",
    "label": {
      "en": "Yes",
      "hi": "???",
      "mr": "???"
    }
  },
  {
    "value": "No",
    "label": {
      "en": "No",
      "hi": "????",
      "mr": "????"
    }
  }
]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (456, 6, 55, N'affidavitProvided', N'Affidavit Provided?', N'प्रतिज्ञापत्र सादर केले आहे का?', N'select', N'Certificate Details', N'[
  {
    "value": "Yes",
    "label": {
      "en": "Yes",
      "hi": "???",
      "mr": "???"
    }
  },
  {
    "value": "No",
    "label": {
      "en": "No",
      "hi": "????",
      "mr": "????"
    }
  }
]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (457, 6, 55, N'lastExamPassed', N'Last Exam Passed', N'शेवटची उत्तीर्ण परीक्षा', N'number', N'Certificate Details', NULL, NULL, N'{"min":0}', 0, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (458, 6, 55, N'seatOrRegNo', N'Seat No / Registration No', N'आसन क्रमांक / नोंदणी क्रमांक', N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (459, 6, 55, N'destinationInstituteName', N'Destination Institute (optional)', NULL, N'text', N'Certificate Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (460, 6, 55, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (461, 10, 66, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (462, 10, 66, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (463, 10, 66, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (464, 10, 66, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (465, 10, 66, N'applicantAddress', N'Address (optional)', N'पत्ता (ऐच्छिक)', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (466, 10, 66, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (467, 10, 66, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (468, 10, 66, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी असलेले नाते', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (469, 10, 66, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Location / Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (470, 10, 66, N'wardId', N'Ward', N'प्रभाग', N'select', N'Location / Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (471, 10, 66, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Location / Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 11, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (472, 10, 66, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (473, 10, 66, N'fetchedPropertyAddress', N'Address', N'पत्ता', N'textarea', N'Location / Property Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (474, 10, 66, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (475, 10, 66, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (476, 10, 66, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (477, 10, 66, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (478, 10, 66, N'actionRequested', N'What do you want to do?', N'आपण कोणती कार्यवाही करू इच्छिता?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (479, 10, 66, N'noOfTrees', N'How many trees?', N'झाडांची संख्या', N'number', N'Tree Request Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (480, 10, 66, N'treeLocationType', N'Where is the tree located?', N'झाड कोणत्या ठिकाणी आहे?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (481, 10, 66, N'reasonCategory', N'Reason', N'कारण', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (482, 10, 66, N'isImmediateDanger', N'Is it an emergency danger?', N'तातडीचा धोका आहे का?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (483, 10, 66, N'dangerExplanation', N'Explain the danger (if yes)', N'धोक्याचे स्पष्टीकरण द्या (होय असल्यास)', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (484, 10, 66, N'treeDetails', N'Tree Details', N'झाडाचा तपशील', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (485, 10, 66, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.730', NULL, NULL),
        (501, 12, 48, N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (502, 12, 48, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (503, 12, 48, N'restorationResponsibility', N'Restoration Responsibility', N'पुनर्स्थापना जबाबदारी', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (504, 12, 48, N'restorationType', N'Restoration Type', N'पुनर्स्थापना प्रकार', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (505, 12, 48, N'undertakingConsent', N'Undertaking / Indemnity Consent', N'हमीपत्र / स्वीकृती पत्र', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (506, 12, 49, N'accidentOrDamage', N'Any accident/vehicle damage?', N'कोणताही अपघात किंवा वाहनाचे नुकसान झाले आहे का?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (507, 12, 49, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (508, 12, 49, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (509, 12, 49, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (510, 12, 49, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (511, 12, 49, N'fromLocation', N'From (optional)', N'सुरुवातीचे ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (512, 12, 49, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (513, 12, 49, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (514, 12, 49, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (515, 12, 49, N'potholeCount', N'Number of Potholes', N'खड्ड्यांची संख्या', N'number', N'Pothole Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (516, 12, 49, N'potholeSize', N'Pothole Size', N'खड्ड्याचा आकार', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (517, 12, 49, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Pothole Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (518, 12, 49, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (519, 12, 49, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (520, 12, 49, N'toLocation', N'To (optional)', N'अंतिम ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (521, 12, 49, N'wardId', N'Ward', N'प्रभाग', N'select', N'Pothole Location Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (522, 12, 49, N'zoneId', N'Zone', N'झोन', N'select', N'Pothole Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (523, 12, 50, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (524, 12, 50, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (525, 12, 50, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (526, 12, 50, N'coverCount', N'Number of Covers', N'झाकणांची संख्या', N'number', N'Sewer Cover Issue Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (527, 12, 50, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (528, 12, 50, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (529, 12, 50, N'issueType', N'Issue Type', N'समस्येचा प्रकार', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (530, 12, 50, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (531, 12, 50, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (532, 12, 50, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Sewer Cover Issue Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (533, 12, 50, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (534, 12, 50, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (535, 12, 50, N'wardId', N'Ward', N'प्रभाग', N'select', N'Sewer Cover Location Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (536, 12, 50, N'zoneId', N'Zone', N'झोन', N'select', N'Sewer Cover Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15 16:26:57.763', NULL, NULL),
        (597, 5, 53, N'dischargeCardDoc', N'Hospital Discharge Card', N'रुग्णालयाचा डिस्चार्ज कार्ड दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 62, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (598, 5, 53, N'informantIdDoc', N'Informant ID Proof', N'माहिती देणाऱ्याचा ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 63, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (599, 5, 54, N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (600, 5, 54, N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'स्मशानभूमी किंवा दफनभूमीचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (601, 9, 65, N'groomAgeProofDoc', N'Groom Age Proof Document', N'नवरदेवाच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (602, 9, 65, N'brideAgeProofDoc', N'Bride Age Proof Document', N'नवरीच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (603, 9, 65, N'weddingInvitationDoc', N'Wedding Invitation Card', N'लग्नपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (604, 9, 65, N'witness1IdProofDoc', N'Witness 1 ID Proof', N'साक्षीदार १ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (605, 9, 65, N'witness2IdProofDoc', N'Witness 2 ID Proof', N'साक्षीदार २ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (606, 11, 69, N'idProofDoc', N'Applicant ID Proof Document', N'अर्जदाराच्या ओळखपत्राचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (607, 11, 69, N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (608, 11, 69, N'premisesMapDoc', N'Premises Layout Map', N'जागेचा नकाशा / आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15 16:26:57.780', NULL, NULL),
        (1114, 4, 44, N'propertyTaxDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1115, 4, 45, N'buildingPlanDoc', N'Ownership Documents', N'मालकी हक्काची कागदपत्रे', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1116, 4, 45, N'architectCertDoc', N'Architect’s Certificate', N'वास्तुविशारदाचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1117, 4, 47, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1118, 4, 47, N'PlinthCertificateDoc', N'Plinth Certificate', N'जोते प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1119, 4, 43, N'ownershipDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1124, 12, 48, N'routeMapDoc', N'Proposed OFC Cable Route Diagram', N'प्रस्तावित ओएफसी केबल मार्गाचा नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1125, 6, 55, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1126, 6, 55, N'previousMarksheetDoc', N'Previous Class Marksheet', NULL, N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1134, 8, 64, N'fireSafetyBlueprintDoc', N'Approved Fire Safety Blueprint', N'मंजूर अग्निसुरक्षा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1135, 8, 63, N'equipmentInvoiceDoc', N'Fire Equipment Purchase / Inspection Receipt', N'अग्निशमन उपकरण खरेदी / तपासणी पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1136, 4, 62, N'mandapLayoutDoc', N'Mandap Site Layout Diagram', N'मंडप स्थळाचा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1138, 4, 61, N'propertyTaxDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1139, 10, 66, N'treePhotosDoc', N'Clear Photographs of Tree(s)', N'झाडाचे स्पष्ट छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1140, 10, 66, N'ownershipDoc', N'Property Ownership / 7-12 Extract', N'मालमत्ता मालकीचा पुरावा / ७/१२ उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:44:51.360', NULL, NULL),
        (1141, 4, 46, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1142, 4, 46, N'architectName', N'Licensed Architect Name', N'परवानाधारक वास्तुविशारदाचे नाव', N'text', N'Architect Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1143, 4, 46, N'buildingPermitRefNo', N'Sanctioned Building Permit Ref No', N'मंजूर बांधकाम परवाना संदर्भ क्रमांक', N'text', N'Permit Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1144, 4, 46, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1145, 4, 46, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1146, 4, 46, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1147, 4, 46, N'wardId', N'Ward', N'प्रभाग', N'select', N'Property Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1148, 4, 46, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 5, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1149, 7, 58, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1150, 7, 58, N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'जैव वैद्यकीय कचरा मंजुरी क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1151, 7, 58, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1152, 7, 58, N'doctorName', N'Chief Medical Officer / Doctor Name', N'मुख्य वैद्यकीय अधिकारी / डॉक्टरचे नाव', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1153, 7, 58, N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'डॉक्टर एमएमसी / वैद्यकीय नोंदणी क्रमांक', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1154, 7, 58, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', 0, '2026-08-18 18:36:51.673'),
        (1155, 7, 58, N'fireNocNo', N'Fire Safety NOC Number', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1156, 7, 58, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1157, 7, 58, N'nursingHomeAddress', N'Nursing Home Address', N'नर्सिंग होमचा पत्ता', N'textarea', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1158, 7, 58, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1159, 7, 58, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1160, 7, 58, N'wardId', N'Ward', N'प्रभाग', N'select', N'Nursing Home Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, N'{
  "dependsOn":"zoneId",
  "filterByPrefix":true
}', 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1161, 7, 58, N'zoneId', N'Zone', N'झोन', N'select', N'Nursing Home Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, N'{
  "dependsOn":"zoneId",
  "filterByPrefix":true
}', 1, 7, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1162, 7, 59, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1163, 7, 59, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1164, 7, 59, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1165, 7, 59, N'licenseExpiryDate', N'License Expiry Date', N'परवाना समाप्ती तारीख', N'date', N'License Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1166, 7, 59, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1167, 7, 59, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1168, 7, 59, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1169, 7, 59, N'wardId', N'Ward', N'प्रभाग', N'select', N'Nursing Home Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1170, 7, 60, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1171, 7, 60, N'currentHolderName', N'Current License Holder Name', N'सध्याच्या परवानाधारकाचे नाव', N'text', N'License Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1172, 7, 60, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1173, 7, 60, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1174, 7, 60, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1175, 7, 60, N'proposedHolderName', N'Proposed New Holder / Partner Name', N'प्रस्तावित नवीन परवानाधारक / भागीदाराचे नाव', N'text', N'Update Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1176, 7, 60, N'reasonForChange', N'Reason for Change', N'बदलाचे कारण', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:34.910', NULL, NULL),
        (1177, 11, 68, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1178, 11, 68, N'cleanlinessIssueType', N'Cleanliness Issue Type', N'स्वच्छतेशी संबंधित समस्येचा प्रकार', N'select', N'Complaint Details', N'[{"value":"garbage","label":{"en":"Garbage Accumulation","hi":"कचरा साचणे","mr":"कचरा साचणे"}},{"value":"open_dumping","label":{"en":"Open Dumping","hi":"उघड्यावर कचरा","mr":"उघड्यावर कचरा टाकणे"}},{"value":"drainage_overflow","label":{"en":"Drainage Overflow","hi":"ड्रेनेज ओव्हरफ्लो","mr":"ड्रेनेज ओव्हरफ्लो"}},{"value":"sweeping_req","label":{"en":"Street Sweeping Required","hi":"रस्ता सफाई आवश्यक","mr":"रस्ता सफाई आवश्यक"}}]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1179, 11, 68, N'complainantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Complainant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1180, 11, 68, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1181, 11, 68, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1182, 11, 68, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Complainant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1183, 11, 68, N'wardId', N'Ward', N'प्रभाग', N'select', N'Location Details', N'[
  {"value":"A1","label":{"en":"A1","hi":"A1","mr":"A1"}},
  {"value":"A2","label":{"en":"A2","hi":"A2","mr":"A2"}},
  {"value":"A3","label":{"en":"A3","hi":"A3","mr":"A3"}},
  {"value":"A4","label":{"en":"A4","hi":"A4","mr":"A4"}},
  {"value":"A5","label":{"en":"A5","hi":"A5","mr":"A5"}},
  {"value":"A6","label":{"en":"A6","hi":"A6","mr":"A6"}},
  {"value":"A7","label":{"en":"A7","hi":"A7","mr":"A7"}},
  {"value":"A8","label":{"en":"A8","hi":"A8","mr":"A8"}},
  {"value":"A9","label":{"en":"A9","hi":"A9","mr":"A9"}},
  {"value":"A10","label":{"en":"A10","hi":"A10","mr":"A10"}},
  {"value":"A11","label":{"en":"A11","hi":"A11","mr":"A11"}},

  {"value":"B1","label":{"en":"B1","hi":"B1","mr":"B1"}},
  {"value":"B2","label":{"en":"B2","hi":"B2","mr":"B2"}},
  {"value":"B3","label":{"en":"B3","hi":"B3","mr":"B3"}},
  {"value":"B4","label":{"en":"B4","hi":"B4","mr":"B4"}},
  {"value":"B5","label":{"en":"B5","hi":"B5","mr":"B5"}},
  {"value":"B6","label":{"en":"B6","hi":"B6","mr":"B6"}},
  {"value":"B7","label":{"en":"B7","hi":"B7","mr":"B7"}},
  {"value":"B8","label":{"en":"B8","hi":"B8","mr":"B8"}},
  {"value":"B9","label":{"en":"B9","hi":"B9","mr":"B9"}},
  {"value":"B10","label":{"en":"B10","hi":"B10","mr":"B10"}},
  {"value":"B11","label":{"en":"B11","hi":"B11","mr":"B11"}},
  {"value":"B12","label":{"en":"B12","hi":"B12","mr":"B12"}},
  {"value":"B13","label":{"en":"B13","hi":"B13","mr":"B13"}},
  {"value":"B14","label":{"en":"B14","hi":"B14","mr":"B14"}},

  {"value":"C1","label":{"en":"C1","hi":"C1","mr":"C1"}},
  {"value":"C2","label":{"en":"C2","hi":"C2","mr":"C2"}},
  {"value":"C3","label":{"en":"C3","hi":"C3","mr":"C3"}},
  {"value":"C4","label":{"en":"C4","hi":"C4","mr":"C4"}},
  {"value":"C5","label":{"en":"C5","hi":"C5","mr":"C5"}},
  {"value":"C6","label":{"en":"C6","hi":"C6","mr":"C6"}},
  {"value":"C7","label":{"en":"C7","hi":"C7","mr":"C7"}},
  {"value":"C8","label":{"en":"C8","hi":"C8","mr":"C8"}},
  {"value":"C9","label":{"en":"C9","hi":"C9","mr":"C9"}},
  {"value":"C10","label":{"en":"C10","hi":"C10","mr":"C10"}},
  {"value":"C11","label":{"en":"C11","hi":"C11","mr":"C11"}},

  {"value":"D1","label":{"en":"D1","hi":"D1","mr":"D1"}},
  {"value":"D2","label":{"en":"D2","hi":"D2","mr":"D2"}},
  {"value":"D3","label":{"en":"D3","hi":"D3","mr":"D3"}},
  {"value":"D4","label":{"en":"D4","hi":"D4","mr":"D4"}},
  {"value":"D5","label":{"en":"D5","hi":"D5","mr":"D5"}},
  {"value":"D6","label":{"en":"D6","hi":"D6","mr":"D6"}},
  {"value":"D7","label":{"en":"D7","hi":"D7","mr":"D7"}},
  {"value":"D8","label":{"en":"D8","hi":"D8","mr":"D8"}},
  {"value":"D9","label":{"en":"D9","hi":"D9","mr":"D9"}},
  {"value":"D10","label":{"en":"D10","hi":"D10","mr":"D10"}},
  {"value":"D11","label":{"en":"D11","hi":"D11","mr":"D11"}},
  {"value":"D12","label":{"en":"D12","hi":"D12","mr":"D12"}}
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1184, 11, 68, N'zoneId', N'Zone', N'झोन', N'select', N'Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21 18:45:49.343', NULL, NULL),
        (1185, 6, 56, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1186, 6, 56, N'dateOfBirth', N'Student Date of Birth', N'विद्यार्थ्याची जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1187, 6, 56, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1188, 6, 56, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1189, 6, 56, N'fatherFullName', N'Father / Guardian Full Name', N'वडील / पालक यांचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1190, 6, 56, N'grNumber', N'General Register (G.R.) / Roll No', N'जनरल रजिस्टर (जी.आर.) / रोल क्रमांक', N'text', N'School Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1191, 6, 56, N'lastStandardStudied', N'Last Standard / Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"1ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"2री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"3री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"4थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"5वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"6वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"7वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"8वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"9वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"10वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1192, 6, 56, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1193, 6, 56, N'motherFullName', N'Mother Full Name', N'आईचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1194, 6, 56, N'reasonForTC', N'Reason for Transfer Certificate', N'बदली प्रमाणपत्राचे कारण', N'select', N'Request Details', N'[{"value":"parent_transfer","label":{"en":"Parent Job Transfer","hi":"पालकांची बदली","mr":"पालकांची नोकरीतील बदली"}},{"value":"higher_studies","label":{"en":"Higher Studies / Admission","hi":"पुढील शिक्षण","mr":"पुढील शिक्षण / प्रवेश"}},{"value":"residence_shift","label":{"en":"Change of Residence","hi":"रहिवास बदल","mr":"रहिवास बदल"}},{"value":"other","label":{"en":"Other Reason","hi":"इतर कारण","mr":"इतर कारण"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1195, 6, 56, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {"value":"Marathi Boys School No. 4","label":{"en":"Marathi Boys School No. 4","hi":"मराठी बालक विद्यालय क्र. ४","mr":"मराठी मुलांची शाळा क्र. ४"}},
  {"value":"Marathi Boys School No. 7","label":{"en":"Marathi Boys School No. 7","hi":"मराठी बालक विद्यालय क्र. ७","mr":"मराठी मुलांची शाळा क्र. ७"}},
  {"value":"Marathi Boys School No. 9","label":{"en":"Marathi Boys School No. 9","hi":"मराठी बालक विद्यालय क्र. ९","mr":"मराठी मुलांची शाळा क्र. ९"}},
  {"value":"Marathi Boys School No. 12","label":{"en":"Marathi Boys School No. 12","hi":"मराठी बालक विद्यालय क्र. १२","mr":"मराठी मुलांची शाळा क्र. १२"}},
  {"value":"Marathi Boys School No. 14","label":{"en":"Marathi Boys School No. 14","hi":"मराठी बालक विद्यालय क्र. १४","mr":"मराठी मुलांची शाळा क्र. १४"}},
  {"value":"Marathi Boys School No. 16","label":{"en":"Marathi Boys School No. 16","hi":"मराठी बालक विद्यालय क्र. १६","mr":"मराठी मुलांची शाळा क्र. १६"}},
  {"value":"Marathi Boys School No. 17","label":{"en":"Marathi Boys School No. 17","hi":"मराठी बालक विद्यालय क्र. १७","mr":"मराठी मुलांची शाळा क्र. १७"}},
  {"value":"Marathi Boys School No. 18","label":{"en":"Marathi Boys School No. 18","hi":"मराठी बालक विद्यालय क्र. १८","mr":"मराठी मुलांची शाळा क्र. १८"}},
  {"value":"Marathi Boys School No. 19","label":{"en":"Marathi Boys School No. 19","hi":"मराठी बालक विद्यालय क्र. १९","mr":"मराठी मुलांची शाळा क्र. १९"}},
  {"value":"Marathi Boys School No. 22","label":{"en":"Marathi Boys School No. 22","hi":"मराठी बालक विद्यालय क्र. २२","mr":"मराठी मुलांची शाळा क्र. २२"}},
  {"value":"Marathi Boys School No. 26","label":{"en":"Marathi Boys School No. 26","hi":"मराठी बालक विद्यालय क्र. २६","mr":"मराठी मुलांची शाळा क्र. २६"}},

  {"value":"Marathi Girls School No. 7","label":{"en":"Marathi Girls School No. 7","hi":"मराठी बालिका विद्यालय क्र. ७","mr":"मराठी कन्या शाळा क्र. ७"}},

  {"value":"Hindi Boys School No. 1","label":{"en":"Hindi Boys School No. 1","hi":"हिंदी बालक विद्यालय क्र. १","mr":"हिंदी बालक शाळा क्र. १"}},
  {"value":"Hindi Boys School No. 2","label":{"en":"Hindi Boys School No. 2","hi":"हिंदी बालक विद्यालय क्र. २","mr":"हिंदी बालक शाळा क्र. २"}},
  {"value":"Hindi Boys School No. 6","label":{"en":"Hindi Boys School No. 6","hi":"हिंदी बालक विद्यालय क्र. ६","mr":"हिंदी बालक शाळा क्र. ६"}},
  {"value":"Hindi Boys School No. 8","label":{"en":"Hindi Boys School No. 8","hi":"हिंदी बालक विद्यालय क्र. ८","mr":"हिंदी बालक शाळा क्र. ८"}},

  {"value":"Sindhi Hindi School No. 1","label":{"en":"Sindhi Hindi School No. 1","hi":"सिंधी हिंदी बालक विद्यालय क्र. १","mr":"सिंधी हिंदी शाळा क्र. १"}},
  {"value":"Gujarati Boys School No. 1","label":{"en":"Gujarati Boys School No. 1","hi":"गुजराती बालक विद्यालय क्र. १","mr":"गुजराती बालक शाळा क्र. १"}},

  {"value":"Urdu Boys School No. 1","label":{"en":"Urdu Boys School No. 1","hi":"उर्दु बालक विद्यालय क्र. १","mr":"उर्दु मुलांची शाळा क्र. १"}},
  {"value":"Urdu Boys School No. 2","label":{"en":"Urdu Boys School No. 2","hi":"उर्दु बालक विद्यालय क्र. २","mr":"उर्दु मुलांची शाळा क्र. २"}},
  {"value":"Urdu Boys School No. 6","label":{"en":"Urdu Boys School No. 6","hi":"उर्दु बालक विद्यालय क्र. ६","mr":"उर्दु मुलांची शाळा क्र. ६"}},
  {"value":"Urdu Boys School No. 7","label":{"en":"Urdu Boys School No. 7","hi":"उर्दु बालक विद्यालय क्र. ७","mr":"उर्दु मुलांची शाळा क्र. ७"}},
  {"value":"Urdu Boys School No. 8","label":{"en":"Urdu Boys School No. 8","hi":"उर्दु बालक विद्यालय क्र. ८","mr":"उर्दु मुलांची शाळा क्र. ८"}},
  {"value":"Urdu Boys School No. 9","label":{"en":"Urdu Boys School No. 9","hi":"उर्दु बालक विद्यालय क्र. ९","mr":"उर्दु मुलांची शाळा क्र. ९"}},
  {"value":"Urdu Boys School No. 10","label":{"en":"Urdu Boys School No. 10","hi":"उर्दु बालक विद्यालय क्र. १०","mr":"उर्दु मुलांची शाळा क्र. १०"}},
  {"value":"Urdu Boys School No. 11","label":{"en":"Urdu Boys School No. 11","hi":"उर्दु बालक विद्यालय क्र. ११","mr":"उर्दु मुलांची शाळा क्र. ११"}},
  {"value":"Urdu Boys School No. 12","label":{"en":"Urdu Boys School No. 12","hi":"उर्दु बालक विद्यालय क्र. १२","mr":"उर्दु मुलांची शाळा क्र. १२"}},

  {"value":"Urdu Girls School No. 1","label":{"en":"Urdu Girls School No. 1","hi":"उर्दु बालक विद्यालय क्र. १","mr":"उर्दु कन्या शाळा क्र. १"}},
  {"value":"Urdu Girls School No. 3","label":{"en":"Urdu Girls School No. 3","hi":"उर्दु बालक विद्यालय क्र. ३","mr":"उर्दु कन्या शाळा क्र. ३"}},
  {"value":"Urdu Girls School No. 4","label":{"en":"Urdu Girls School No. 4","hi":"उर्दु बालक विद्यालय क्र. ४","mr":"उर्दु कन्या शाळा क्र. ४"}},
  {"value":"Urdu Girls School No. 5","label":{"en":"Urdu Girls School No. 5","hi":"उर्दु बालक विद्यालय क्र. ५","mr":"उर्दु कन्या शाळा क्र. ५"}}
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1196, 6, 56, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1197, 6, 57, N'affidavitDetails', N'FIR / Affidavit Registration Details', N'एफआयआर / प्रतिज्ञापत्र नोंदणी तपशील', N'textarea', N'Request Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1198, 6, 57, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1199, 6, 57, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1200, 6, 57, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1201, 6, 57, N'examinationPassed', N'Examination Name', N'परीक्षेचे नाव', N'select', N'Exam Details', N'[{"value":"ssc","label":{"en":"10th Board (SSC)","hi":"10वीं बोर्ड (SSC)","mr":"इयत्ता १० वी (SSC)"}},{"value":"std_5_scholarship","label":{"en":"5th Std Scholarship Exam","hi":"5वीं शिष्यवृत्ती","mr":"इयत्ता ५ वी शिष्यवृत्ती"}},{"value":"std_8_scholarship","label":{"en":"8th Std Scholarship Exam","hi":"8वीं शिष्यवृत्ती","mr":"इयत्ता ८ वी शिष्यवृत्ती"}},{"value":"primary_exam","label":{"en":"Annual Primary Exam","hi":"वार्षिक परीक्षा","mr":"वार्षिक परीक्षा"}},{"value":"other","label":{"en":"Other Exam","hi":"अन्य","mr":"इतर परीक्षा"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1202, 6, 57, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1203, 6, 57, N'passingYear', N'Passing Year', N'उत्तीर्ण वर्ष', N'number', N'Exam Details', NULL, NULL, N'{"min":0}', 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1204, 6, 57, N'reasonForDuplicate', N'Reason for Duplicate Marksheet', N'डुप्लिकेट गुणपत्रिकेचे कारण', N'select', N'Request Details', N'[{"value":"lost","label":{"en":"Original Lost","hi":"गहाळ झाले","mr":"मूळ गुणपत्रक गहाळ झाले"}},{"value":"damaged","label":{"en":"Original Damaged / Torn","hi":"खराब / फाटले","mr":"खराब / फाटले आहे"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"सापडत नाही","mr":"सापडत नाही"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1205, 6, 57, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {"value":"Marathi Boys School No. 4","label":{"en":"Marathi Boys School No. 4","hi":"मराठी बालक विद्यालय क्र. ४","mr":"मराठी मुलांची शाळा क्र. ४"}},
  {"value":"Marathi Boys School No. 7","label":{"en":"Marathi Boys School No. 7","hi":"मराठी बालक विद्यालय क्र. ७","mr":"मराठी मुलांची शाळा क्र. ७"}},
  {"value":"Marathi Boys School No. 9","label":{"en":"Marathi Boys School No. 9","hi":"मराठी बालक विद्यालय क्र. ९","mr":"मराठी मुलांची शाळा क्र. ९"}},
  {"value":"Marathi Boys School No. 12","label":{"en":"Marathi Boys School No. 12","hi":"मराठी बालक विद्यालय क्र. १२","mr":"मराठी मुलांची शाळा क्र. १२"}},
  {"value":"Marathi Boys School No. 14","label":{"en":"Marathi Boys School No. 14","hi":"मराठी बालक विद्यालय क्र. १४","mr":"मराठी मुलांची शाळा क्र. १४"}},
  {"value":"Marathi Boys School No. 16","label":{"en":"Marathi Boys School No. 16","hi":"मराठी बालक विद्यालय क्र. १६","mr":"मराठी मुलांची शाळा क्र. १६"}},
  {"value":"Marathi Boys School No. 17","label":{"en":"Marathi Boys School No. 17","hi":"मराठी बालक विद्यालय क्र. १७","mr":"मराठी मुलांची शाळा क्र. १७"}},
  {"value":"Marathi Boys School No. 18","label":{"en":"Marathi Boys School No. 18","hi":"मराठी बालक विद्यालय क्र. १८","mr":"मराठी मुलांची शाळा क्र. १८"}},
  {"value":"Marathi Boys School No. 19","label":{"en":"Marathi Boys School No. 19","hi":"मराठी बालक विद्यालय क्र. १९","mr":"मराठी मुलांची शाळा क्र. १९"}},
  {"value":"Marathi Boys School No. 22","label":{"en":"Marathi Boys School No. 22","hi":"मराठी बालक विद्यालय क्र. २२","mr":"मराठी मुलांची शाळा क्र. २२"}},
  {"value":"Marathi Boys School No. 26","label":{"en":"Marathi Boys School No. 26","hi":"मराठी बालक विद्यालय क्र. २६","mr":"मराठी मुलांची शाळा क्र. २६"}},

  {"value":"Marathi Girls School No. 7","label":{"en":"Marathi Girls School No. 7","hi":"मराठी बालिका विद्यालय क्र. ७","mr":"मराठी कन्या शाळा क्र. ७"}},

  {"value":"Hindi Boys School No. 1","label":{"en":"Hindi Boys School No. 1","hi":"हिंदी बालक विद्यालय क्र. १","mr":"हिंदी बालक शाळा क्र. १"}},
  {"value":"Hindi Boys School No. 2","label":{"en":"Hindi Boys School No. 2","hi":"हिंदी बालक विद्यालय क्र. २","mr":"हिंदी बालक शाळा क्र. २"}},
  {"value":"Hindi Boys School No. 6","label":{"en":"Hindi Boys School No. 6","hi":"हिंदी बालक विद्यालय क्र. ६","mr":"हिंदी बालक शाळा क्र. ६"}},
  {"value":"Hindi Boys School No. 8","label":{"en":"Hindi Boys School No. 8","hi":"हिंदी बालक विद्यालय क्र. ८","mr":"हिंदी बालक शाळा क्र. ८"}},

  {"value":"Sindhi Hindi School No. 1","label":{"en":"Sindhi Hindi School No. 1","hi":"सिंधी हिंदी बालक विद्यालय क्र. १","mr":"सिंधी हिंदी शाळा क्र. १"}},
  {"value":"Gujarati Boys School No. 1","label":{"en":"Gujarati Boys School No. 1","hi":"गुजराती बालक विद्यालय क्र. १","mr":"गुजराती बालक शाळा क्र. १"}},

  {"value":"Urdu Boys School No. 1","label":{"en":"Urdu Boys School No. 1","hi":"उर्दु बालक विद्यालय क्र. १","mr":"उर्दु मुलांची शाळा क्र. १"}},
  {"value":"Urdu Boys School No. 2","label":{"en":"Urdu Boys School No. 2","hi":"उर्दु बालक विद्यालय क्र. २","mr":"उर्दु मुलांची शाळा क्र. २"}},
  {"value":"Urdu Boys School No. 6","label":{"en":"Urdu Boys School No. 6","hi":"उर्दु बालक विद्यालय क्र. ६","mr":"उर्दु मुलांची शाळा क्र. ६"}},
  {"value":"Urdu Boys School No. 7","label":{"en":"Urdu Boys School No. 7","hi":"उर्दु बालक विद्यालय क्र. ७","mr":"उर्दु मुलांची शाळा क्र. ७"}},
  {"value":"Urdu Boys School No. 8","label":{"en":"Urdu Boys School No. 8","hi":"उर्दु बालक विद्यालय क्र. ८","mr":"उर्दु मुलांची शाळा क्र. ८"}},
  {"value":"Urdu Boys School No. 9","label":{"en":"Urdu Boys School No. 9","hi":"उर्दु बालक विद्यालय क्र. ९","mr":"उर्दु मुलांची शाळा क्र. ९"}},
  {"value":"Urdu Boys School No. 10","label":{"en":"Urdu Boys School No. 10","hi":"उर्दु बालक विद्यालय क्र. १०","mr":"उर्दु मुलांची शाळा क्र. १०"}},
  {"value":"Urdu Boys School No. 11","label":{"en":"Urdu Boys School No. 11","hi":"उर्दु बालक विद्यालय क्र. ११","mr":"उर्दु मुलांची शाळा क्र. ११"}},
  {"value":"Urdu Boys School No. 12","label":{"en":"Urdu Boys School No. 12","hi":"उर्दु बालक विद्यालय क्र. १२","mr":"उर्दु मुलांची शाळा क्र. १२"}},

  {"value":"Urdu Girls School No. 1","label":{"en":"Urdu Girls School No. 1","hi":"उर्दु बालक विद्यालय क्र. १","mr":"उर्दु कन्या शाळा क्र. १"}},
  {"value":"Urdu Girls School No. 3","label":{"en":"Urdu Girls School No. 3","hi":"उर्दु बालक विद्यालय क्र. ३","mr":"उर्दु कन्या शाळा क्र. ३"}},
  {"value":"Urdu Girls School No. 4","label":{"en":"Urdu Girls School No. 4","hi":"उर्दु बालक विद्यालय क्र. ४","mr":"उर्दु कन्या शाळा क्र. ४"}},
  {"value":"Urdu Girls School No. 5","label":{"en":"Urdu Girls School No. 5","hi":"उर्दु बालक विद्यालय क्र. ५","mr":"उर्दु कन्या शाळा क्र. ५"}}
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1206, 6, 57, N'seatNumber', N'Seat / Roll Number', N'आसन क्रमांक / रोल क्रमांक', N'text', N'Exam Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1207, 6, 57, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.123', NULL, NULL),
        (1208, 4, 46, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1210, 6, 56, N'previousMarksheetDoc', N'Previous Class Marksheet', N'मागील इयत्तेची गुणपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1211, 6, 56, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1212, 6, 57, N'firOrAffidavitDoc', N'Police FIR / Notarized Affidavit Document', N'पोलीस एफआयआर / नोटरीकृत प्रतिज्ञापत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1213, 6, 57, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1214, 7, 58, N'bmwAgreementDoc', N'Bio Medical Waste Disposal Agreement', N'जैव वैद्यकीय कचरा विल्हेवाट करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1215, 7, 58, N'doctorDegreeDoc', N'Chief Doctor MMC / Degree Certificate', N'मुख्य डॉक्टर एमएमसी / पदवी प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1216, 7, 58, N'fireNocDoc', N'Fire Safety NOC Document', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1217, 7, 59, N'fireNocDoc', N'Valid Fire Safety NOC', N'वैध अग्निसुरक्षा ना हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1218, 7, 59, N'oldLicenseDoc', N'Previous Nursing Home License Copy', N'मागील नर्सिंग होम परवान्याची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1219, 7, 60, N'newHolderIdDoc', N'ID Proof of New License Holder', N'नवीन परवानाधारकाचा ओळखपत्र पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1220, 7, 60, N'transferAgreementDoc', N'Transfer Agreement / Partnership Deed', N'हस्तांतरण करार / भागीदारी करारनामा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (1221, 11, 68, N'spotPhotoDoc', N'Spot Photograph of Location', N'ठिकाणाचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21 18:51:28.150', NULL, NULL),
        (3004, 2, 19, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3005, 2, 20, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3006, 2, 26, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3007, 2, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3008, 2, 80, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3009, 2, 81, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3010, 2, 82, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3011, 2, 83, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3012, 2, 84, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3013, 2, 85, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3014, 2, 86, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3015, 2, 87, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3016, 2, 100, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3017, 2, 101, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:37.940', NULL, NULL),
        (3018, 3, 33, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3019, 3, 36, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3020, 3, 137, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3021, 3, 138, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3022, 3, 139, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3023, 3, 140, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3024, 3, 141, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3025, 3, 142, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3026, 3, 143, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3027, 3, 144, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3028, 3, 158, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3029, 3, 159, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3030, 3, 160, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3031, 3, 161, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3032, 3, 162, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 17:59:44.977', NULL, NULL),
        (3033, 1, 145, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3034, 1, 146, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3035, 1, 147, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3036, 1, 148, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3037, 1, 149, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3038, 1, 150, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3039, 1, 151, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3040, 1, 152, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3041, 1, 153, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3042, 1, 154, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3043, 1, 155, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3044, 1, 156, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (3045, 1, 157, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12 18:00:25.820', NULL, NULL),
        (4002, 12, 49, N'DOC_POTHOLE_PHOTO', N'Photo of Pothole Location', N'खड्ड्याचे छायाचित्र / फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.233', NULL, NULL),
        (4003, 12, 50, N'DOC_SEWER_PHOTO', N'Photo of Damaged / Open Sewer Cover', N'उघड्या / तुटलेल्या मॅनहोलचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 14, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.253', NULL, NULL),
        (4004, 2, 19, N'DOC_WATER_BILL_19', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.277', NULL, NULL),
        (4005, 2, 19, N'DOC_APPLICANT_ID_19', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.287', NULL, NULL),
        (4006, 2, 20, N'DOC_WATER_BILL_20', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.290', NULL, NULL),
        (4007, 2, 20, N'DOC_APPLICANT_ID_20', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.293', NULL, NULL),
        (4008, 2, 26, N'DOC_WATER_BILL_26', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.297', NULL, NULL),
        (4009, 2, 26, N'DOC_APPLICANT_ID_26', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.300', NULL, NULL),
        (4010, 3, 33, N'DOC_RENT_AGREEMENT_33', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.307', NULL, NULL),
        (4011, 3, 33, N'DOC_APPLICANT_ID_33', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.310', NULL, NULL),
        (4012, 3, 33, N'DOC_NOC_CERTIFICATE_33', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.317', NULL, NULL),
        (4013, 3, 36, N'DOC_RENT_AGREEMENT_36', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.320', NULL, NULL),
        (4014, 3, 36, N'DOC_APPLICANT_ID_36', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.327', NULL, NULL),
        (4015, 3, 36, N'DOC_NOC_CERTIFICATE_36', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.330', NULL, NULL),
        (4016, 2, 80, N'DOC_WATER_BILL_80', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.330', NULL, NULL),
        (4017, 2, 80, N'DOC_APPLICANT_ID_80', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.370', NULL, NULL),
        (4018, 2, 81, N'DOC_WATER_BILL_81', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.373', NULL, NULL),
        (4019, 2, 81, N'DOC_APPLICANT_ID_81', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.377', NULL, NULL),
        (4020, 2, 82, N'DOC_WATER_BILL_82', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.380', NULL, NULL),
        (4021, 2, 82, N'DOC_APPLICANT_ID_82', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.380', NULL, NULL),
        (4022, 2, 83, N'DOC_WATER_BILL_83', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.383', NULL, NULL),
        (4023, 2, 83, N'DOC_APPLICANT_ID_83', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.387', NULL, NULL),
        (4024, 2, 84, N'DOC_WATER_BILL_84', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.390', NULL, NULL),
        (4025, 2, 84, N'DOC_APPLICANT_ID_84', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.393', NULL, NULL),
        (4026, 2, 85, N'DOC_WATER_BILL_85', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.397', NULL, NULL),
        (4027, 2, 85, N'DOC_APPLICANT_ID_85', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.403', NULL, NULL),
        (4028, 2, 86, N'DOC_WATER_BILL_86', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.407', NULL, NULL),
        (4029, 2, 86, N'DOC_APPLICANT_ID_86', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.407', NULL, NULL),
        (4030, 2, 87, N'DOC_WATER_BILL_87', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.410', NULL, NULL),
        (4031, 2, 87, N'DOC_APPLICANT_ID_87', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.413', NULL, NULL),
        (4032, 2, 100, N'DOC_WATER_BILL_100', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.420', NULL, NULL),
        (4033, 2, 100, N'DOC_APPLICANT_ID_100', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.473', NULL, NULL),
        (4034, 2, 101, N'DOC_WATER_BILL_101', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.477', NULL, NULL),
        (4035, 2, 101, N'DOC_APPLICANT_ID_101', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.480', NULL, NULL),
        (4036, 3, 137, N'DOC_RENT_AGREEMENT_137', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.483', NULL, NULL),
        (4037, 3, 137, N'DOC_APPLICANT_ID_137', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.487', NULL, NULL),
        (4038, 3, 137, N'DOC_NOC_CERTIFICATE_137', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.490', NULL, NULL),
        (4039, 3, 138, N'DOC_RENT_AGREEMENT_138', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.493', NULL, NULL),
        (4040, 3, 138, N'DOC_APPLICANT_ID_138', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.493', NULL, NULL),
        (4041, 3, 138, N'DOC_NOC_CERTIFICATE_138', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.497', NULL, NULL),
        (4042, 3, 139, N'DOC_RENT_AGREEMENT_139', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.503', NULL, NULL),
        (4043, 3, 139, N'DOC_APPLICANT_ID_139', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.503', NULL, NULL),
        (4044, 3, 139, N'DOC_NOC_CERTIFICATE_139', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.507', NULL, NULL),
        (4045, 3, 140, N'DOC_RENT_AGREEMENT_140', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.510', NULL, NULL),
        (4046, 3, 140, N'DOC_APPLICANT_ID_140', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.510', NULL, NULL),
        (4047, 3, 140, N'DOC_NOC_CERTIFICATE_140', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.513', NULL, NULL),
        (4048, 3, 141, N'DOC_RENT_AGREEMENT_141', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.517', NULL, NULL),
        (4049, 3, 141, N'DOC_APPLICANT_ID_141', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.520', NULL, NULL),
        (4050, 3, 141, N'DOC_NOC_CERTIFICATE_141', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.523', NULL, NULL),
        (4051, 3, 142, N'DOC_RENT_AGREEMENT_142', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.527', NULL, NULL),
        (4052, 3, 142, N'DOC_APPLICANT_ID_142', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.530', NULL, NULL),
        (4053, 3, 142, N'DOC_NOC_CERTIFICATE_142', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.530', NULL, NULL),
        (4054, 3, 143, N'DOC_RENT_AGREEMENT_143', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.533', NULL, NULL),
        (4055, 3, 143, N'DOC_APPLICANT_ID_143', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.537', NULL, NULL),
        (4056, 3, 143, N'DOC_NOC_CERTIFICATE_143', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.540', NULL, NULL),
        (4057, 3, 144, N'DOC_RENT_AGREEMENT_144', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.543', NULL, NULL),
        (4058, 3, 144, N'DOC_APPLICANT_ID_144', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.543', NULL, NULL),
        (4059, 3, 144, N'DOC_NOC_CERTIFICATE_144', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.547', NULL, NULL),
        (4060, 1, 145, N'DOC_PROP_OWNERSHIP_145', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.550', NULL, NULL),
        (4061, 1, 145, N'DOC_APPLICANT_ID_145', N'Registered Sale Deed / Purchase Deed', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.557', NULL, NULL),
        (4062, 1, 146, N'DOC_PROP_OWNERSHIP_146', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.560', NULL, NULL),
        (4063, 1, 146, N'DOC_APPLICANT_ID_146', N'Site Inspection Report.', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.563', NULL, NULL),
        (4064, 1, 147, N'DOC_PROP_OWNERSHIP_147', N'No mandatory supporting document specified.', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.567', NULL, NULL),
        (4065, 1, 147, N'DOC_APPLICANT_ID_147', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.570', NULL, NULL),
        (4066, 1, 148, N'DOC_PROP_OWNERSHIP_148', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.570', NULL, NULL),
        (4067, 1, 148, N'DOC_APPLICANT_ID_148', N'Document proving eligibility for the requested tax exemption (as applicable).', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.573', NULL, NULL),
        (4068, 1, 149, N'DOC_PROP_OWNERSHIP_149', N'No mandatory document required.', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.577', NULL, NULL),
        (4069, 1, 149, N'DOC_APPLICANT_ID_149', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.580', NULL, NULL),
        (4070, 1, 150, N'DOC_PROP_OWNERSHIP_150', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.580', NULL, NULL),
        (4071, 1, 150, N'DOC_APPLICANT_ID_150', N'Ownership / Title Document.', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.583', NULL, NULL),
        (4072, 1, 151, N'DOC_PROP_OWNERSHIP_151', N'Application form.', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.587', NULL, NULL),
        (4073, 1, 151, N'DOC_APPLICANT_ID_151', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.587', NULL, NULL),
        (4074, 1, 152, N'DOC_PROP_OWNERSHIP_152', N'Application form.', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.637', NULL, NULL),
        (4075, 1, 152, N'DOC_APPLICANT_ID_152', N'Ownership / Title Document.', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.640', NULL, NULL),
        (4076, 1, 153, N'DOC_PROP_OWNERSHIP_153', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.640', NULL, NULL),
        (4077, 1, 153, N'DOC_APPLICANT_ID_153', N'Ownership / Title Document', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.643', NULL, NULL),
        (4078, 1, 154, N'DOC_PROP_OWNERSHIP_154', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.643', NULL, NULL),
        (4079, 1, 154, N'DOC_APPLICANT_ID_154', N'Current Financial Year''s Property Tax Paid Receipt.', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.647', NULL, NULL),
        (4080, 1, 155, N'DOC_PROP_OWNERSHIP_155', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.683', NULL, NULL),
        (4081, 1, 155, N'DOC_APPLICANT_ID_155', N'Current Financial Year''s Property Tax Paid Receipt.', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.730', NULL, NULL),
        (4082, 1, 156, N'DOC_PROP_OWNERSHIP_156', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.730', NULL, NULL),
        (4083, 1, 156, N'DOC_APPLICANT_ID_156', N'Registered Sale Deed / Purchase Deed', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.733', NULL, NULL),
        (4084, 1, 157, N'DOC_PROP_OWNERSHIP_157', N'Application form', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.733', NULL, NULL),
        (4085, 1, 157, N'DOC_APPLICANT_ID_157', N'Registered Sale Deed / Purchase Deed', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.737', NULL, NULL),
        (4086, 3, 158, N'DOC_RENT_AGREEMENT_158', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.737', NULL, NULL),
        (4087, 3, 158, N'DOC_APPLICANT_ID_158', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.740', NULL, NULL),
        (4088, 3, 158, N'DOC_NOC_CERTIFICATE_158', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.740', NULL, NULL),
        (4089, 3, 159, N'DOC_RENT_AGREEMENT_159', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.743', NULL, NULL),
        (4090, 3, 159, N'DOC_APPLICANT_ID_159', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.747', NULL, NULL),
        (4091, 3, 159, N'DOC_NOC_CERTIFICATE_159', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.747', NULL, NULL),
        (4092, 3, 160, N'DOC_RENT_AGREEMENT_160', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.750', NULL, NULL),
        (4093, 3, 160, N'DOC_APPLICANT_ID_160', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.750', NULL, NULL),
        (4094, 3, 160, N'DOC_NOC_CERTIFICATE_160', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.753', NULL, NULL),
        (4095, 3, 161, N'DOC_RENT_AGREEMENT_161', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.757', NULL, NULL),
        (4096, 3, 161, N'DOC_APPLICANT_ID_161', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.760', NULL, NULL),
        (4097, 3, 161, N'DOC_NOC_CERTIFICATE_161', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.760', NULL, NULL),
        (4098, 3, 162, N'DOC_RENT_AGREEMENT_162', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.763', NULL, NULL),
        (4099, 3, 162, N'DOC_APPLICANT_ID_162', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.767', NULL, NULL),
        (4100, 3, 162, N'DOC_NOC_CERTIFICATE_162', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17 13:01:13.770', NULL, NULL),
        (4101, 4, 61, N'approvedPlanDocument', N'Approved Plan / Map', N'मंजूर नकाशाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 21:57:15.420', NULL, NULL),
        (4102, 4, 61, N'sevenTwelveOrSaleDeedDocument', N'7/12 Extract / Sale Deed', N'७/१२ उतारा / खरेदी खत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 21:57:15.420', NULL, NULL),
        (4103, 4, 61, N'rentAgreementDocument', N'Rent Agreement', N'भाडे करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 21:57:15.420', NULL, NULL),
        (4104, 4, 44, N'measurementMapDocument', N'Measurement Map / City Survey Map', N'मोजणी नकाशा / सिटी सर्व्हे नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 22:31:22.380', NULL, NULL),
        (4105, 4, 45, N'buildingPlanDrawingDoc', N'Building Plan / Construction Drawing', N'बांधकाम आराखडा / नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 22:56:11.760', NULL, NULL),
        (4106, 4, 45, N'approvedDrawingCopyDoc', N'Copy of Approved Drawing', N'मंजूर रेखांकनाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17 22:56:11.760', NULL, NULL),
        (5102, 5, 53, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (5103, 5, 53, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (5104, 5, 53, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (5105, 5, 53, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (5106, 5, 53, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (5107, 5, 53, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22 19:09:03.640', NULL, NULL),
        (6101, 4, 46, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23 12:58:35.560', NULL, NULL),
        (6102, 7, 59, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23 13:00:21.937', NULL, NULL),
        (6103, 7, 60, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23 13:01:31.673', NULL, NULL),
        (6104, 11, 68, N'email', N'Email', N'ईमेल', N'email', N'Complainant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23 13:06:20.847', NULL, NULL),
        (6105, 12, 48, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23 18:28:41.520', NULL, NULL),
        (7115, 11, 167, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7116, 11, 167, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'text', N'Applicant Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7117, 11, 167, N'email', N'Email (optional)', N'ईमेल', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7118, 11, 167, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7119, 11, 167, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7120, 11, 167, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{"maxLength":20}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7121, 11, 167, N'propertyNo', N'Select Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'select', N'Property / Location Details', N'[]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7122, 11, 167, N'wardId', N'Ward (Auto)', N'प्रभाग क्रमांक (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[]', NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7123, 11, 167, N'zoneId', N'Zone (Auto)', N'झोन (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[]', NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7124, 11, 167, N'fetchedOwnerName', N'Owner Name (Auto)', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Property / Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7125, 11, 167, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Property / Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7126, 11, 167, N'premisesOccupancyType', N'Premises Type', N'जागेचा प्रकार', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7127, 11, 167, N'connectionType', N'Connection Type', N'जोडणीचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7128, 11, 167, N'useType', N'Use Type', N'वापराचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7129, 11, 167, N'noOfUnits', N'No. of Units (optional)', N'युनिट्सची संख्या (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7130, 11, 167, N'existingArrangement', N'Current Wastewater Arrangement', N'सांडपाण्याची सध्याची व्यवस्था', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7131, 11, 167, N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7132, 11, 167, N'roadCuttingRequired', N'Road Cutting Required?', N'रस्ता खोदाई आवश्यक आहे का?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7133, 11, 167, N'roadCuttingDetails', N'Road Cutting Details (optional)', N'रस्ता खोदाईचे तपशील (पर्यायी)', N'textarea', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7134, 11, 167, N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"maxLength":50}', 0, 20, NULL, NULL, 50, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7135, 11, 167, N'tradeLicenseNo', N'Trade License No (optional)', N'व्यवसाय परवाना क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"maxLength":50}', 0, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7136, 11, 167, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.033', NULL, NULL),
        (7137, 13, 62, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7138, 13, 62, N'areaSqFt', N'Area (Sq Ft)', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7139, 13, 62, N'beamMaterial', N'Material Used (Wood/Iron/Steel/Aluminum)', NULL, N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7140, 13, 62, N'chairmanName', N'Name of Chairman/Secretary', NULL, N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7141, 13, 62, N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', NULL, N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7142, 13, 62, N'contactNo', N'Contact No. (President/Secretary)', NULL, N'tel', N'Event & Permission Info', NULL, NULL, N'{"pattern":"^[0-9]{10}$","maxLength":10}', 0, 20, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7143, 13, 62, N'contractorAddress', N'Pandol Contractor Address', NULL, N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7144, 13, 62, N'contractorContact', N'Pandol Contractor Contact', NULL, N'tel', N'Contractors Info', NULL, NULL, N'{"pattern":"^[0-9]{10}$","maxLength":10}', 1, 46, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7145, 13, 62, N'crowdCapacity', N'Expected Crowd Capacity', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7146, 13, 62, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7147, 13, 62, N'decoratorAddress', N'Decorator/Electrical Address', NULL, N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7148, 13, 62, N'decoratorContact', N'Decorator/Electrical Contact', NULL, N'tel', N'Contractors Info', NULL, NULL, N'{"pattern":"^[0-9]{10}$","maxLength":10}', 1, 49, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7149, 13, 62, N'decoratorName', N'Decorator/Electrical Name', NULL, N'text', N'Contractors Info', NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7150, 13, 62, N'earthingProvided', N'Earthing Provided?', NULL, N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7151, 13, 62, N'electricalLoad', N'Electrical Load Installed (kW)', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7152, 13, 62, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, NULL, 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7153, 13, 62, N'emergencyExits', N'Number of Emergency Exits', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7154, 13, 62, N'eventEndDate', N'Event End Date', NULL, N'date', N'Event & Permission Info', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7155, 13, 62, N'eventStartDate', N'Event Start Date', NULL, N'date', N'Event & Permission Info', NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7156, 13, 62, N'eventType', N'Type of Event', NULL, N'select', N'Event & Permission Info', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7157, 13, 62, N'extinguisherCount', N'Number of Extinguishers', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 0, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7158, 13, 62, N'fireExtinguishersAvailable', N'Fire Extinguishers Available?', NULL, N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7159, 13, 62, N'fireStation', N'Nearest Fire Station', NULL, N'text', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7160, 13, 62, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7161, 13, 62, N'generatorUsed', N'Generator to be Used?', NULL, N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7162, 13, 62, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7163, 13, 62, N'mandalName', N'Mandal Name (Reg. Charity Comm.)', NULL, N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7164, 13, 62, N'mandapArea', N'Mandap Area (sq.ft.)', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7165, 13, 62, N'mandapHeight', N'Mandap Height (feet)', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7166, 13, 62, N'mandapType', N'Mandap Type', NULL, N'select', N'Mandap Structural Details', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7167, 13, 62, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7168, 13, 62, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7169, 13, 62, N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', NULL, N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7170, 13, 62, N'numberOfPillars', N'No. of Pillars / Support Beams', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7171, 13, 62, N'ownerAadhar', N'Owner Aadhar Number', NULL, N'text', N'Owner Details', NULL, NULL, N'{"pattern":"^[0-9]{12}$","maxLength":12}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7172, 13, 62, N'ownerCity', N'Owner City', NULL, N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7173, 13, 62, N'ownerEmail', N'Owner Email', N'ईमेल', N'email', N'Owner Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7174, 13, 62, N'ownerFirstName', N'Owner First Name', NULL, N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7175, 13, 62, N'ownerLastName', N'Owner Last Name', NULL, N'text', N'Owner Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7176, 13, 62, N'ownerMiddleName', N'Owner Middle Name', NULL, N'text', N'Owner Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7177, 13, 62, N'ownerMobile', N'Owner Mobile Number', NULL, N'tel', N'Owner Details', NULL, NULL, N'{"pattern":"^[0-9]{10}$","maxLength":10}', 1, 10, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7178, 13, 62, N'ownerState', N'Owner State', NULL, N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7179, 13, 62, N'pandolAddress', N'Pandol / Stage Address', NULL, N'textarea', N'Event & Permission Info', NULL, NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7180, 13, 62, N'panNumber', N'Owner PAN Number', NULL, N'text', N'Owner Details', NULL, NULL, N'{"pattern":"^[A-Z]{5}[0-9]{4}[A-Z]{1}$","maxLength":10}', 0, 13, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7181, 13, 62, N'placeOwnership', N'Ownership of Tent Place', NULL, N'select', N'Event & Permission Info', N'[{"value":"Private","label":{"en":"Private","hi":"निजी","mr":"खाजगी"}},{"value":"Municipal","label":{"en":"Municipal/Council","hi":"नगर निगम","mr":"महापालिका/परिषद"}},{"value":"Public","label":{"en":"Public Road","hi":"सार्वजनिक सड़क","mr":"सार्वजनिक रस्ता"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7182, 13, 62, N'plotNo', N'Plot No', NULL, N'text', N'Event & Permission Info', NULL, NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7183, 13, 62, N'policeStation', N'Concerned Police Station', NULL, N'text', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7184, 13, 62, N'registrationNo', N'Registration Number', NULL, N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7185, 13, 62, N'registrationYear', N'Registration Year', NULL, N'number', N'Event & Permission Info', NULL, NULL, N'{"min":1900,"max":2100}', 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7186, 13, 62, N'soundAddress', N'Sound/Speaker Address', NULL, N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7187, 13, 62, N'soundContact', N'Sound/Speaker Contact', NULL, N'tel', N'Contractors Info', NULL, NULL, N'{"pattern":"^[0-9]{10}$","maxLength":10}', 1, 52, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7188, 13, 62, N'soundName', N'Sound/Speaker Contractor Name', NULL, N'text', N'Contractors Info', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7189, 13, 62, N'soundType', N'Sound/Speaker Type', NULL, N'select', N'Contractors Info', N'[{"value":"DJ","label":{"en":"DJ System","hi":"डीजे सिस्टम","mr":"डीजे सिस्टम"}},{"value":"Loudspeaker","label":{"en":"Loudspeaker","hi":"लाउडस्पीकर","mr":"लाउडस्पीकर"}},{"value":"Traditional","label":{"en":"Traditional Instruments","hi":"पारंपरिक वाद्ययंत्र","mr":"पारंपारिक वाद्ये"}}]', NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7190, 13, 62, N'structuralEngineerName', N'Structural Engineer / Fabricator Name', NULL, N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7191, 13, 62, N'trafficPoliceStation', N'Concerned Traffic Police Station', NULL, N'text', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7192, 13, 62, N'volunteers', N'No. of Volunteers', NULL, N'number', N'Mandap Structural Details', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7193, 13, 62, N'wardArea', N'Ward Area', NULL, N'text', N'Event & Permission Info', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7194, 13, 62, N'windLoadResistance', N'Wind Load Resistance Tested?', NULL, N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7195, 13, 62, N'zoneNo', N'Zone', NULL, N'select', N'Event & Permission Info', N'[{"value":"East","label":{"en":"East Zone","hi":"पूर्व ज़ोन","mr":"पूर्व झोन"}},{"value":"West","label":{"en":"West Zone","hi":"पश्चिम ज़ोन","mr":"पश्चिम झोन"}},{"value":"North","label":{"en":"North Zone","hi":"उत्तर ज़ोन","mr":"उत्तर झोन"}},{"value":"South","label":{"en":"South Zone","hi":"दक्षिण ज़ोन","mr":"दक्षिण झोन"}}]', NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.073', NULL, NULL),
        (7196, 4, 43, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Applicant Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.153', NULL, NULL),
        (7197, 4, 44, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Applicant Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.153', NULL, NULL),
        (7198, 4, 45, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Applicant Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.153', NULL, NULL),
        (7199, 4, 47, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Applicant Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.153', NULL, NULL),
        (7200, 4, 48, N'applicantType', N'Applicant Type', NULL, N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7201, 4, 48, N'organizationName', N'Organization / Company Name', NULL, N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7202, 4, 48, N'authorizedSignatoryName', N'Authorized Signatory Name', NULL, N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7203, 4, 48, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'text', N'Applicant / Organization Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 1, 4, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7204, 4, 48, N'email', N'Email (recommended)', NULL, N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 0, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7205, 4, 48, N'officeAddress', N'Office Address', NULL, N'textarea', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7206, 4, 48, N'licenseOrRegistrationNo', N'License / Registration No (if any)', NULL, N'text', N'Applicant / Organization Details', NULL, NULL, N'{"maxLength":50}', 0, 7, NULL, NULL, 50, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7207, 4, 48, N'gstNo', N'GST No (if any)', NULL, N'text', N'Applicant / Organization Details', NULL, NULL, N'{"maxLength":20}', 0, 8, NULL, NULL, 20, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7208, 4, 48, N'wardId', N'Ward', NULL, N'select', N'Work Location Details', N'[]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7209, 4, 48, N'zoneId', N'Zone', NULL, N'select', N'Work Location Details', N'[]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7210, 4, 48, N'workAreaType', N'Work Area Type', NULL, N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7211, 4, 48, N'roadStreetName', N'Road / Street Name', NULL, N'text', N'Work Location Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7212, 4, 48, N'fromLocation', N'From Location', NULL, N'text', N'Work Location Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7213, 4, 48, N'toLocation', N'To Location', NULL, N'text', N'Work Location Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7214, 4, 48, N'landmark', N'Landmark (optional)', NULL, N'text', N'Work Location Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7215, 4, 48, N'totalRouteLengthMeters', N'Total Route Length (meters)', NULL, N'number', N'Work Location Details', NULL, NULL, N'{"min":1}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7216, 4, 48, N'methodOfLaying', N'Method of Laying', NULL, N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7217, 4, 48, N'trenchWidthCm', N'Trench Width (cm)', NULL, N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":1}', 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7218, 4, 48, N'trenchDepthCm', N'Trench Depth (cm)', NULL, N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":1}', 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7219, 4, 48, N'roadCrossingsCount', N'No. of Road Crossings', NULL, N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7220, 4, 48, N'ductPipeSize', N'Duct / HDPE Pipe Size', NULL, N'text', N'Excavation / Laying Details', NULL, NULL, N'{"maxLength":50}', 1, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7221, 4, 48, N'noOfDucts', N'No. of Ducts (optional)', NULL, N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7222, 4, 48, N'handholesChambersCount', N'Handholes / Chambers (optional)', NULL, N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7223, 4, 48, N'expectedStartDate', N'Expected Start Date', N'अपेक्षित सुरू तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7224, 4, 48, N'expectedEndDate', N'Expected End Date', N'अपेक्षित अंतिम तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7225, 4, 48, N'trafficManagementRequired', N'Traffic Management Required?', N'रहदारी व्यवस्थापन आवश्यक आहे का?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.193', NULL, NULL),
        (7226, 4, 48, N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7227, 4, 48, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7228, 4, 48, N'restorationResponsibility', N'Restoration Responsibility', N'पुनर्स्थापना जबाबदारी', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7229, 4, 48, N'restorationType', N'Restoration Type', N'पुनर्स्थापना प्रकार', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7230, 4, 48, N'undertakingConsent', N'Undertaking / Indemnity Consent', N'हमीपत्र / स्वीकृती पत्र', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7231, 4, 49, N'accidentOrDamage', N'Any accident/vehicle damage?', NULL, N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7232, 4, 49, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Citizen Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7233, 4, 49, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7234, 4, 49, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7235, 4, 49, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7236, 4, 49, N'fromLocation', N'From (optional)', NULL, N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7237, 4, 49, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7238, 4, 49, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7239, 4, 49, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'text', N'Citizen Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7240, 4, 49, N'potholeCount', N'Number of Potholes', NULL, N'number', N'Pothole Details', NULL, NULL, N'{"min":1}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7241, 4, 49, N'potholeSize', N'Pothole Size', NULL, N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7242, 4, 49, N'remarks', N'Remarks (optional)', NULL, N'textarea', N'Pothole Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7243, 4, 49, N'riskLevel', N'Risk Level', NULL, N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7244, 4, 49, N'roadStreetName', N'Road / Street Name', NULL, N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7245, 4, 49, N'toLocation', N'To (optional)', NULL, N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7246, 4, 49, N'wardId', N'Ward', NULL, N'select', N'Pothole Location Details', N'[]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7247, 4, 49, N'zoneId', N'Zone', NULL, N'select', N'Pothole Location Details', N'[]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7248, 4, 50, N'alternateMobileNo', N'Alternate Mobile (optional)', NULL, N'text', N'Citizen Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 0, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7249, 4, 50, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7250, 4, 50, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7251, 4, 50, N'coverCount', N'Number of Covers', NULL, N'number', N'Sewer Cover Issue Details', NULL, NULL, N'{"min":1}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7252, 4, 50, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7253, 4, 50, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7254, 4, 50, N'issueType', N'Issue Type', NULL, N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7255, 4, 50, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7256, 4, 50, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'text', N'Citizen Details', NULL, NULL, N'{"minLength":10,"maxLength":10}', 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7257, 4, 50, N'remarks', N'Remarks (optional)', NULL, N'textarea', N'Sewer Cover Issue Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7258, 4, 50, N'riskLevel', N'Risk Level', NULL, N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7259, 4, 50, N'roadStreetName', N'Road / Street Name', NULL, N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7260, 4, 50, N'wardId', N'Ward', NULL, N'select', N'Sewer Cover Location Details', N'[]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7261, 4, 50, N'zoneId', N'Zone', NULL, N'select', N'Sewer Cover Location Details', N'[]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.260', NULL, NULL),
        (7262, 4, 47, N'architectCompletionDoc', N'Architect Completion Certificate', NULL, N'file', N'Document Uploads', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7263, 4, 47, N'structuralSafetyDoc', N'Structural Stability Certificate', NULL, N'file', N'Document Uploads', NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7264, 4, 48, N'routeMapDoc', N'Proposed OFC Cable Route Diagram', NULL, N'file', N'Document Uploads', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7265, 11, 167, N'idProofDoc', N'Applicant ID Proof Document', N'अर्जदाराच्या ओळखपत्राचा पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7266, 11, 167, N'premisesMapDoc', N'Premises Layout Map', N'जागेचा नकाशा / आराखडा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7267, 11, 167, N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL),
        (7268, 13, 62, N'mandapLayoutDoc', N'Mandap Site Layout Diagram', NULL, N'file', N'Document Uploads', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-26 14:56:20.283', NULL, NULL)
    ) AS V ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[FieldDefinition] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[DepartmentId] = Source.[DepartmentId],
        Target.[ServiceId] = Source.[ServiceId],
        Target.[FieldCode] = Source.[FieldCode],
        Target.[FieldLabel] = Source.[FieldLabel],
        Target.[FieldLabelLocal] = Source.[FieldLabelLocal],
        Target.[FieldType] = Source.[FieldType],
        Target.[FieldGroup] = Source.[FieldGroup],
        Target.[OptionsJson] = Source.[OptionsJson],
        Target.[DefaultValue] = Source.[DefaultValue],
        Target.[ValidationRules] = Source.[ValidationRules],
        Target.[IsRequired] = Source.[IsRequired],
        Target.[DisplayOrder] = Source.[DisplayOrder],
        Target.[MinValue] = Source.[MinValue],
        Target.[MaxValue] = Source.[MaxValue],
        Target.[MaxLength] = Source.[MaxLength],
        Target.[IsActive] = Source.[IsActive],
        Target.[MarkedForDeletion] = Source.[MarkedForDeletion],
        Target.[MarkedForDeletionDate] = Source.[MarkedForDeletionDate],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[DepartmentId], Source.[ServiceId], Source.[FieldCode], Source.[FieldLabel], Source.[FieldLabelLocal], Source.[FieldType], Source.[FieldGroup], Source.[OptionsJson], Source.[DefaultValue], Source.[ValidationRules], Source.[IsRequired], Source.[DisplayOrder], Source.[MinValue], Source.[MaxValue], Source.[MaxLength], Source.[IsActive], Source.[MarkedForDeletion], Source.[MarkedForDeletionDate], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[FieldDefinition] OFF;
GO


-- =========================================================
-- [RTS].[ApprovalFlowMaster] Live Data Seed (66 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (36, 43, N'Issuance of Zone Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (37, 44, N'Giving Part Map Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (38, 45, N'Issuance of Construction Permit Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (39, 46, N'Issuance of plinth certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (40, 47, N'Issuance of Occupancy Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (41, 48, N'Underground OFC Cable Permission Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (42, 49, N'Filling Potholes on City Roads Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (43, 50, N'Maintaining & Securing Sewer Covers Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (44, 53, N'Birth Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (45, 54, N'Death Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (46, 55, N'School Leaving / Duplicate Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (47, 56, N'Issuance of transfer certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (48, 57, N'Issuance of duplicate mark sheet Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (49, 58, N'Nursing home license under Registration Act, 1949 Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (50, 59, N'Renewal of nursing home license Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (51, 60, N'Change of nursing home license holder / partner name Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (52, 61, N'Trade / Business / Storage Non-Revocation NOC Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (53, 62, N'Mandap NOC Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (54, 63, N'Issuance of Fire Safety NOC Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (55, 64, N'Issuance of Final Fire Exemption Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (56, 65, N'Marriage Registration Certificate Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (57, 66, N'Tree Felling Permission (Sec 8) Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (58, 68, N'Maintaining cleanliness Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (59, 69, N'Providing drainage connections Default Workflow', 1, 0, '2026-07-21 19:02:56.547', NULL, NULL),
        (60, 167, N'Drainage Connection Approval Flow', 1, 0, '2026-08-26 14:56:20.483', NULL, NULL),
        (1006, 19, N'Change of Water Connection Usage Type Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1007, 20, N'Preparation of Water Bill Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1008, 26, N'Complaint Regarding Water Pressure Capacity Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1009, 33, N'Changing Occupations / Business Type Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1010, 36, N'Cancellation of License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1011, 80, N'Provision of New Water Tap Connection Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1012, 81, N'Changing the Water Connection Size Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1013, 82, N'Temporary / Permanent Disconnection of Water Connection Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1014, 83, N'Reconnection of Water Tap Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1015, 84, N'Water Bill No Dues Certificate Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1016, 85, N'Complaint Regarding Faulty Water Meter Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1017, 86, N'Complaint Regarding Unauthorized Water Tap Connection Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1018, 87, N'Complaint Regarding Water Quality Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1019, 100, N'Issuance of Plumber License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1020, 101, N'Renewal of Plumber License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1021, 137, N'Obtaining New Trade License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1022, 138, N'Renewal of Trade License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1023, 139, N'Transfer of Trade License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1024, 140, N'Duplicate Copy of Trade License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1025, 141, N'Change of Business Name / Establishment / Address Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1026, 142, N'Change of License Holder / Partner Name Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1027, 143, N'Change in Number of Partners (Increase/Decrease) Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1028, 144, N'Notice on Renewal of Expired License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1029, 145, N'New Property Tax Assessment Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1030, 146, N'Re-Assessment of Property Tax Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1031, 147, N'Preparation of Tax Demand Notice Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1032, 148, N'Avail Property Tax Exemption Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1033, 149, N'Tax Exemption for Non-Resident Properties Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1034, 150, N'Property Tax Self-Assessment Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1035, 151, N'Registration of Objection on Tax Assessment Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1036, 152, N'Sub-division of Property Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1037, 153, N'Re-assessment After Demolition and Reconstruction Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1038, 154, N'Issuance of Property Tax Assessment Copy (8A) Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1039, 155, N'Issuance of No Dues Certificate Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1040, 156, N'Property Transfer Registration Certificate Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1041, 157, N'Change of Ownership Name Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1042, 158, N'Issuance of Lodging House License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1043, 159, N'Renewal of Lodging House License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1044, 160, N'Issuance of Marriage Hall / Auditorium License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1045, 161, N'Renewal of Marriage Hall / Auditorium License Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL),
        (1046, 162, N'Issuance of Hawker Registration Certificate Default Workflow', 1, 0, '2026-08-12 19:17:56.673', NULL, NULL)
    ) AS V ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[ApprovalFlowMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[ServiceId] = Source.[ServiceId],
        Target.[ApprovalFlowName] = Source.[ApprovalFlowName],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[ServiceId], Source.[ApprovalFlowName], Source.[IsActive], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] OFF;
GO


-- =========================================================
-- [RTS].[ApprovalFlowStageMaster] Live Data Seed (202 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1077, 36, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1078, 37, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1079, 38, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1080, 39, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1081, 40, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1082, 41, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1083, 42, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1084, 43, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1085, 44, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1086, 45, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1087, 46, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1088, 47, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1089, 48, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1090, 49, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1091, 50, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1092, 51, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1093, 52, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1094, 53, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1095, 54, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1096, 55, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1097, 56, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1098, 57, 1, N'Zone Officer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1099, 58, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1100, 59, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
        (1101, 36, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1102, 37, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1103, 38, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1104, 39, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1105, 40, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1106, 41, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1107, 42, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1108, 43, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1109, 44, 2, N'Senior Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1110, 45, 2, N'Senior Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1111, 46, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1112, 47, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1113, 48, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1114, 49, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1115, 50, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1116, 51, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1117, 52, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1118, 53, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1119, 54, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1120, 55, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1121, 56, 2, N'Senior Clerk', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1122, 57, 2, N'Clerk', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
        (1123, 58, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1124, 59, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1125, 36, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1126, 37, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1127, 38, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1128, 39, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1129, 40, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1131, 49, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1132, 57, 3, N'Deputy Commissioner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (1133, 59, 3, N'Ass. Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (2077, 1029, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2078, 1029, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2079, 1029, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2080, 1029, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2081, 1030, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2082, 1030, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2083, 1030, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2084, 1030, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2085, 1031, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2086, 1031, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2087, 1031, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2088, 1031, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2089, 1032, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2090, 1032, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2091, 1032, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2092, 1032, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2093, 1033, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2094, 1033, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2095, 1033, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2096, 1033, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2097, 1034, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2098, 1034, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2099, 1034, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2100, 1034, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2101, 1035, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2102, 1035, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2103, 1035, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2104, 1035, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2105, 1036, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2106, 1036, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2107, 1036, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2108, 1036, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2109, 1037, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2110, 1037, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2111, 1037, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2112, 1037, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2113, 1038, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2114, 1038, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2115, 1038, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2116, 1038, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2117, 1039, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2118, 1039, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2119, 1039, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2120, 1039, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2121, 1040, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2122, 1040, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2123, 1040, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2124, 1040, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2125, 1041, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2126, 1041, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
        (2127, 1041, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2128, 1041, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2129, 1006, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2130, 1006, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2131, 1006, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2132, 1007, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2133, 1007, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2134, 1007, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2135, 1008, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2136, 1008, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2137, 1008, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2138, 1011, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2139, 1011, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2140, 1011, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2141, 1012, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2142, 1012, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2143, 1012, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2144, 1013, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2145, 1013, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2146, 1013, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2147, 1014, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2148, 1014, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2149, 1014, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2150, 1015, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2151, 1015, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2152, 1015, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2153, 1016, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2154, 1016, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2155, 1016, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2156, 1017, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2157, 1017, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2158, 1017, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2159, 1018, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2160, 1018, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2161, 1018, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2162, 1019, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2163, 1019, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2164, 1019, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2165, 1020, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2166, 1020, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2167, 1020, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2168, 1009, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2169, 1009, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2170, 1009, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2171, 1010, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2172, 1010, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2173, 1010, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2174, 1021, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2175, 1021, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2176, 1021, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2177, 1022, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2178, 1022, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2179, 1022, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2180, 1023, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2181, 1023, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2182, 1023, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2183, 1024, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2184, 1024, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2185, 1024, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2186, 1025, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2187, 1025, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2188, 1025, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2189, 1026, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2190, 1026, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2191, 1026, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2192, 1027, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2193, 1027, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2194, 1027, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2195, 1028, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2196, 1028, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2197, 1028, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2198, 1042, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2199, 1042, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2200, 1042, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2201, 1043, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2202, 1043, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2203, 1043, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2204, 1044, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2205, 1044, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2206, 1044, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2207, 1045, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2208, 1045, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2209, 1045, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2210, 1046, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
        (2211, 1046, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
        (2212, 1046, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
        (2213, 50, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (2214, 51, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (2215, 54, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (2216, 55, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (3077, 52, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (3078, 53, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
        (4077, 41, 3, N'Final Approval (Senior Officer)', 3, 2, 0, 1, 1, 1, 0, 1, NULL, 0, 0, 0),
        (4078, 60, 1, N'Application Verification (Clerk)', 1, 2, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0),
        (4079, 60, 2, N'Site Inspection (Junior Officer)', 2, 5, 1, 0, 0, 1, 0, 0, NULL, 0, 0, 0),
        (4080, 60, 3, N'Connection Approval (Senior Officer)', 3, 3, 0, 1, 1, 1, 0, 1, NULL, 0, 0, 0)
    ) AS V ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
)
MERGE [RTS].[ApprovalFlowStageMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[ApprovalFlowId] = Source.[ApprovalFlowId],
        Target.[StageOrder] = Source.[StageOrder],
        Target.[StageName] = Source.[StageName],
        Target.[UserId] = Source.[UserId],
        Target.[SLADays] = Source.[SLADays],
        Target.[CanVerifyDocument] = Source.[CanVerifyDocument],
        Target.[CanApprove] = Source.[CanApprove],
        Target.[CanReject] = Source.[CanReject],
        Target.[CanReturn] = Source.[CanReturn],
        Target.[CanPay] = Source.[CanPay],
        Target.[IsFinalStage] = Source.[IsFinalStage],
        Target.[CanEdit] = Source.[CanEdit],
        Target.[CanViewNoteSheet] = Source.[CanViewNoteSheet],
        Target.[CanIssueCertificate] = Source.[CanIssueCertificate],
        Target.[CanEditCertificate] = Source.[CanEditCertificate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
    VALUES (Source.[Id], Source.[ApprovalFlowId], Source.[StageOrder], Source.[StageName], Source.[UserId], Source.[SLADays], Source.[CanVerifyDocument], Source.[CanApprove], Source.[CanReject], Source.[CanReturn], Source.[CanPay], Source.[IsFinalStage], Source.[CanEdit], Source.[CanViewNoteSheet], Source.[CanIssueCertificate], Source.[CanEditCertificate]);
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] OFF;
GO


-- =========================================================
-- [RTS].[AppealTypeMaster] Live Data Seed (3 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, N'प्रथम अपील (First Appeal)', N'FIRST_APPEAL', 1, '2026-08-11 12:21:38.987'),
        (2, N'द्वितीय अपील (Second Appeal)', N'SECOND_APPEAL', 1, '2026-08-11 12:21:38.987'),
        (3, N'तक्रार (Grievance)', N'GRIEVANCE', 1, '2026-08-11 12:21:38.987')
    ) AS V ([Id], [AppealTypeName], [Code], [IsActive], [CreatedDate])
)
MERGE [RTS].[AppealTypeMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AppealTypeName] = Source.[AppealTypeName],
        Target.[Code] = Source.[Code],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedDate] = Source.[CreatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [AppealTypeName], [Code], [IsActive], [CreatedDate])
    VALUES (Source.[Id], Source.[AppealTypeName], Source.[Code], Source.[IsActive], Source.[CreatedDate]);
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] OFF;
GO


-- =========================================================
-- [RTS].[AppealFlowMaster] Live Data Seed (10 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealFlowMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, 53, N'Birth Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (2, 54, N'Death Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (3, 65, N'Marriage Registration Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (4, 43, N'Zone Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (5, 44, N'Part Map Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (6, 45, N'Construction Permit Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (7, 46, N'Plinth Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (8, 47, N'Occupancy Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (9, 63, N'Fire Safety NOC Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL),
        (10, 64, N'Final Fire Exemption Certificate Appeal Workflow', 1, 0, '2026-08-04 17:32:58.053', NULL, NULL)
    ) AS V ([Id], [ServiceId], [AppealFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[AppealFlowMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[ServiceId] = Source.[ServiceId],
        Target.[AppealFlowName] = Source.[AppealFlowName],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [ServiceId], [AppealFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[ServiceId], Source.[AppealFlowName], Source.[IsActive], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[AppealFlowMaster] OFF;
GO


-- =========================================================
-- [RTS].[AppealFlowStageMaster] Live Data Seed (68 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, 1, 1, N'Assistant Health Executive Officer', NULL, 30, 0, 1, 1, 0, 0, 0),
        (2, 1, 2, N'Health Executive Officer (MOH)', NULL, 45, 0, 1, 1, 0, 1, 0),
        (3, 2, 1, N'Assistant Health Executive Officer', NULL, 30, 0, 1, 1, 0, 0, 0),
        (4, 2, 2, N'Health Executive Officer (MOH)', NULL, 45, 0, 1, 1, 0, 1, 0),
        (5, 3, 1, N'Deputy Commissioner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (6, 3, 2, N'Divisional Officer', NULL, 45, 0, 1, 1, 0, 1, 0),
        (7, 4, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (8, 4, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0),
        (9, 5, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (10, 5, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0),
        (11, 6, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (12, 6, 2, N'Assistant Director of Town Planning / Executive Engineer / City Engineer', NULL, 45, 0, 1, 1, 0, 1, 0),
        (13, 7, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (14, 7, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0),
        (15, 8, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0),
        (16, 8, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0),
        (17, 9, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, 0, 1, 1, 0, 0, 0),
        (18, 9, 2, N'Deputy Commissioner (Fire)', NULL, 45, 0, 1, 1, 0, 1, 0),
        (19, 10, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, 0, 1, 1, 0, 0, 0),
        (20, 10, 2, N'Deputy Commissioner (Fire)', NULL, 45, 0, 1, 1, 0, 1, 0),
        (1050, 36, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1051, 36, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1052, 37, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1053, 37, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1054, 38, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1055, 38, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1056, 39, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1057, 39, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1058, 40, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1059, 40, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1060, 41, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1061, 41, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1062, 42, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1063, 42, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1064, 43, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1065, 43, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1066, 44, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1067, 44, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1068, 45, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1069, 45, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1070, 46, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1071, 46, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1072, 47, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1073, 47, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1074, 48, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1075, 48, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1076, 49, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1077, 49, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1078, 50, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1079, 50, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1080, 51, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1081, 51, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1082, 52, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1083, 52, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1084, 53, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1085, 53, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1086, 54, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1087, 54, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1088, 55, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1089, 55, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1090, 56, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1091, 56, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1092, 57, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1093, 57, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1094, 58, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1095, 58, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0),
        (1096, 59, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0),
        (1097, 59, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
    ) AS V ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
)
MERGE [RTS].[AppealFlowStageMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AppealFlowId] = Source.[AppealFlowId],
        Target.[StageOrder] = Source.[StageOrder],
        Target.[StageName] = Source.[StageName],
        Target.[UserId] = Source.[UserId],
        Target.[SLADays] = Source.[SLADays],
        Target.[CanVerifyDocument] = Source.[CanVerifyDocument],
        Target.[CanApprove] = Source.[CanApprove],
        Target.[CanReject] = Source.[CanReject],
        Target.[CanReturn] = Source.[CanReturn],
        Target.[IsFinalStage] = Source.[IsFinalStage],
        Target.[CanEdit] = Source.[CanEdit]
WHEN NOT MATCHED THEN
    INSERT ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
    VALUES (Source.[Id], Source.[AppealFlowId], Source.[StageOrder], Source.[StageName], Source.[UserId], Source.[SLADays], Source.[CanVerifyDocument], Source.[CanApprove], Source.[CanReject], Source.[CanReturn], Source.[IsFinalStage], Source.[CanEdit]);
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] OFF;
GO


-- =========================================================
-- [RTS].[PaymentStatusMaster] Live Data Seed (6 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, N'INITIATED', N'Initiated', N'सुरू केले', N'bg-amber-50 text-amber-700', 1, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL),
        (2, N'PENDING', N'Pending', N'प्रलंबित', N'bg-yellow-50 text-yellow-800', 2, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL),
        (3, N'SUCCESS', N'Success', N'यशस्वी', N'bg-emerald-50 text-emerald-700', 3, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL),
        (4, N'FAILED', N'Failed', N'अयशस्वी', N'bg-rose-50 text-rose-700', 4, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL),
        (5, N'REFUNDED', N'Refunded', N'परतावा केला', N'bg-purple-50 text-purple-700', 5, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL),
        (6, N'EXPIRED', N'Expired', N'कालबाह्य', N'bg-slate-50 text-slate-700', 6, 1, '2026-08-17 15:10:23.983', NULL, NULL, NULL)
    ) AS V ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[PaymentStatusMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[StatusCode] = Source.[StatusCode],
        Target.[StatusNameEn] = Source.[StatusNameEn],
        Target.[StatusNameMr] = Source.[StatusNameMr],
        Target.[BadgeColor] = Source.[BadgeColor],
        Target.[DisplayOrder] = Source.[DisplayOrder],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[StatusCode], Source.[StatusNameEn], Source.[StatusNameMr], Source.[BadgeColor], Source.[DisplayOrder], Source.[IsActive], Source.[CreatedDate], Source.[CreatedBy], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] OFF;
GO


-- =========================================================
-- [RTS].[PaymentModeMaster] Live Data Seed (8 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, N'UPI', N'UPI / QR Code', N'युपीआय / क्यूआर कोड', N'QrCode', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (2, N'NETBANKING', N'Internet Banking', N'नेट बँकिंग', N'Building', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (3, N'CREDIT_CARD', N'Credit Card', N'क्रेडिट कार्ड', N'CreditCard', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (4, N'DEBIT_CARD', N'Debit Card', N'डेबिट कार्ड', N'CreditCard', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (5, N'WALLET', N'Digital Wallet', N'डिजिटल वॉलेट', N'Wallet', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (6, N'OFFLINE_CHALLAN', N'Offline Challan', N'ऑफलाइन चलन', N'FileText', 1, '2026-08-17 15:10:23.990', NULL, NULL, NULL),
        (7, N'CASH', N'Cash (???)', N'रोख', N'Banknote', 1, '2026-08-19 16:55:31.167', NULL, NULL, NULL),
        (8, N'CHEQUE', N'Cheque (??????)', N'धनादेश', N'FileText', 1, '2026-08-23 19:38:42.020', NULL, NULL, NULL)
    ) AS V ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[PaymentModeMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[ModeCode] = Source.[ModeCode],
        Target.[ModeNameEn] = Source.[ModeNameEn],
        Target.[ModeNameMr] = Source.[ModeNameMr],
        Target.[IconName] = Source.[IconName],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[ModeCode], Source.[ModeNameEn], Source.[ModeNameMr], Source.[IconName], Source.[IsActive], Source.[CreatedDate], Source.[CreatedBy], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] OFF;
GO


-- =========================================================
-- [RTS].[PaymentGatewayConfig] Live Data Seed (1 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, N'RAZORPAY', N'Razorpay Smart Gateway', NULL, N'rzp_test_SZLId8MmrfQwTX', N'd1TPunImUMBxcPDStAGUnOdj', N'd1TPunImUMBxcPDStAGUnOdj', N'https://api.razorpay.com/v1/checkout/embedded', N'INR', 1, 1, '2026-08-17 15:10:24.000', NULL, NULL, NULL)
    ) AS V ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
)
MERGE [RTS].[PaymentGatewayConfig] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[GatewayCode] = Source.[GatewayCode],
        Target.[GatewayName] = Source.[GatewayName],
        Target.[MerchantId] = Source.[MerchantId],
        Target.[KeyId] = Source.[KeyId],
        Target.[SecretKey] = Source.[SecretKey],
        Target.[WebhookSecret] = Source.[WebhookSecret],
        Target.[ServiceUrl] = Source.[ServiceUrl],
        Target.[Currency] = Source.[Currency],
        Target.[IsActive] = Source.[IsActive],
        Target.[IsDefault] = Source.[IsDefault],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy]
WHEN NOT MATCHED THEN
    INSERT ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
    VALUES (Source.[Id], Source.[GatewayCode], Source.[GatewayName], Source.[MerchantId], Source.[KeyId], Source.[SecretKey], Source.[WebhookSecret], Source.[ServiceUrl], Source.[Currency], Source.[IsActive], Source.[IsDefault], Source.[CreatedDate], Source.[CreatedBy], Source.[UpdatedDate], Source.[UpdatedBy]);
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] OFF;
GO


-- =========================================================
-- [RTS].[CertificateTemplateMaster] Live Data Seed (22 rows)
-- =========================================================
SET IDENTITY_INSERT [RTS].[CertificateTemplateMaster] ON;
;WITH SourceData AS (
    SELECT * FROM (VALUES
        (1, 43, N'झोन दाखला (Zone Certificate)', N'CERT_ZONE', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांनी सादर केलेल्या अर्जानुसार (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) विकास योजना व नगररचना नियमावलीनुसार संबंधित भूखंड/जागेचा झोन दाखला खालील तपशिलानुसार जारी करण्यात येत आहे:</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>झोन प्रकार व आरक्षण:</strong> [[ZoneType]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर दाखला केवळ नगररचना विकास नियंत्रण नियमावलीच्या अनुषंगाने माहितीस्तव आहे.","सदर दाखल्यावरून जागेच्या मालकी हक्काचा कोणताही दावा करता येणार नाही."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ZoneType","fieldLabelMarathi":"झोन प्रकार व आरक्षण","fieldLabelEnglish":"Zone Type & Reservation","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (2, 45, N'बांधकाम परवाना (Building Construction Permit)', N'CERT_CONSTRUCTION_PERMIT', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये सादर केलेल्या इमारत बांधकामाच्या नकाशांची व कागदपत्रांची छाननी करण्यात आली असून, मंजूर नकाशा व अटी-शर्तींनुसार बांधकाम करण्यास परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवाना / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवाना वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>मंजूर चटई क्षेत्र (Built-up Area):</strong> [[BuiltUpArea]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["बांधकाम केवळ मंजूर नकाशाप्रमाणेच करणे बंधनकारक आहे.","बांधकामादरम्यान सुरक्षेच्या सर्व नियमांचे पालन करणे आवश्यक आहे.","अनधिकृत बांधकाम आढळल्यास परवाना रद्द करून कारवाई केली जाईल."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवाना / आदेश क्रमांक","fieldLabelEnglish":"Permit / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवाना वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"BuiltUpArea","fieldLabelMarathi":"मंजूर क्षेत्रफळ (Built-up Area)","fieldLabelEnglish":"Approved Area","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (3, 47, N'भोगवटा प्रमाणपत्र (Occupancy Certificate)', N'CERT_OCCUPANCY', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारत बांधकामाची प्रत्यक्ष पाहणी करण्यात आली असून बांधकाम मंजूर नकाशा व नियमांनुसार पूर्ण झाल्याने इमारतीचा वापर करण्यास भोगवटा प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>भोगवटा आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["इमारतीचा वापर केवळ मंजूर वापरासाठीच (Approved Use) करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"भोगवटा आदेश क्रमांक","fieldLabelEnglish":"Occupancy Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (4, 53, N'जन्म प्रमाणपत्र (Official Birth Certificate)', N'CERT_BIRTH', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, खालील नोंदणी माहिती अकोला महानगरपालिकेच्या जन्म नोंदवहीनुसार अधिकृत असून, <strong>{{ApplicantName}}</strong> यांच्या अर्जावरून (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) हे जन्म प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नोंदणी क्रमांक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर प्रमाणपत्र जन्म आणि मृत्यू नोंदणी अधिनियम, १९६९ अंतर्गत अधिकृत आहे.","प्रमाणपत्रातील नोंदी अधिकृत महानगरपालिका जन्म नोंदवहीवरून प्रमाणित केलेल्या आहेत."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नोंदणी / आदेश क्रमांक","fieldLabelEnglish":"Registration / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (5, 54, N'मृत्यू प्रमाणपत्र (Official Death Certificate)', N'CERT_DEATH', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, खालील नोंदणी माहिती अकोला महानगरपालिकेच्या मृत्यू नोंदवहीनुसार अधिकृत असून, <strong>{{ApplicantName}}</strong> यांच्या अर्जावरून (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) हे मृत्यू प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नोंदणी क्रमांक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर प्रमाणपत्र जन्म आणि मृत्यू नोंदणी अधिनियम, १९६९ अंतर्गत अधिकृत आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नोंदणी / आदेश क्रमांक","fieldLabelEnglish":"Registration / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (6, 55, N'शाळा सोडल्याचा दाखला (School Leaving Certificate)', N'CERT_SCHOOL_LEAVING', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शाळेतील नोंदींची पडताळणी करून शाळा सोडल्याचा अधिकृत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला / रजिस्टर क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित करून दिला आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"दाखला / रजिस्टर क्रमांक","fieldLabelEnglish":"Certificate / Register No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (7, 58, N'शुश्रूषा-गृह परवाना (Nursing Home License)', N'CERT_NURSING_HOME', NULL, N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, १९४९ अंतर्गत अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये आरोग्य विभागामार्फत शुश्रूषा-गृह चालविण्याचा परवाना जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवाना क्रमांक:</strong> [[OrderNo]]</div>
        <div><strong>मंजूर खाटांची संख्या (Beds):</strong> [[BedCapacity]]</div>
        <div><strong>परवाना वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["बायो-मेडिकल कचरा व्यवस्थापन नियमांचे काटेकोर पालन करणे बंधनकारक आहे.","अग्निशमन व प्रदूषण नियंत्रण नियमांचे पालन करणे आवश्यक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवाना क्रमांक","fieldLabelEnglish":"License No","fieldType":"text","isMandatory":true},{"fieldKey":"BedCapacity","fieldLabelMarathi":"मंजूर खाटांची संख्या (Bed Capacity)","fieldLabelEnglish":"Bed Capacity","fieldType":"text","isMandatory":false},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (8, 61, N'व्यापार / व्यवसाय ना-हरकत प्रमाणपत्र (Trade NOC)', N'CERT_TRADE_NOC', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र खालील अटींच्या अधीन राहून जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["परिसरातील नागरिकांना किंवा वाहतुकीस कोणताही त्रास होणार नाही याची दक्षता घ्यावी.","प्रदूषण नियंत्रण व मनपाच्या सर्व नियमांचे पालन करणे बंधनकारक राहील."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (9, 62, N'मंडप ना-हरकत / ना-नुकसान प्रमाणपत्र (Mandap NOC)', N'CERT_MANDAP_NOC', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मंडप उभारणीसाठी ना-हरकत प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवानगी कालावधी:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क / अनामत पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["रस्त्यावर वाहतुकीस अडथळा निर्माण होणार नाही अशा पद्धतीने मंडप उभारणे आवश्यक आहे.","मुदत संपताच मंडप काढून रस्ता पूर्ववत करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवानगी कालावधी","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (10, 63, N'अग्निशमन ना-हरकत दाखला (Fire Safety NOC)', N'CERT_FIRE_NOC', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये अग्निशमन यंत्रणेची प्राथमिक पाहणी करण्यात आली असून अग्निशमन ना-हरकत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>अग्निशमन जावक क्र.:</strong> [[OrderNo]]</div>
        <div><strong>दाखला वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["अग्निशामक उपकरणे नेहमी सुस्थितीत व कार्यान्वित ठेवणे आवश्यक आहे.","दरवर्षी नियमानुसार अग्निशमन लेखापरीक्षण (Fire Audit) सादर करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"अग्निशमन जावक क्रमांक","fieldLabelEnglish":"Fire Outward No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (11, 65, N'विवाह नोंदणी प्रमाणपत्र (Marriage Certificate)', N'CERT_MARRIAGE', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांनी सादर केलेल्या विवाह नोंदणी अर्जाची (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) नियमानुसार पडताळणी करण्यात येऊन विवाह नोंदणी प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>विवाह नोंदणी क्र.:</strong> [[OrderNo]]</div>
        <div><strong>विवाह नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर विवाह नोंदणी महाराष्ट्र विवाह मंडळांचे विनियमन आणि विवाह नोंदणी अधिनियम अंतर्गत वैध आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"विवाह नोंदणी क्रमांक","fieldLabelEnglish":"Marriage Reg No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (12, 66, N'वृक्षतोड / छाटणी परवानगी (Tree Permission)', N'CERT_TREE_PERMIT', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये वृक्ष प्राधिकरणाच्या पाहणी अहवालानुसार वृक्षतोड/फांद्या छाटणी परवानगी खालील अटींवर देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>तोडण्यास/छाटण्यास मंजूर वृक्षांची संख्या:</strong> [[TreeCount]]</div>
        <div><strong>पुनर्लागवड करावयाची वृक्षांची संख्या:</strong> [[ReplantCount]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["तोडलेल्या प्रत्येक वृक्षाच्या बदल्यात नियमानुसार नवीन वृक्षांची लागवड करून त्यांचे संवर्धन करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"TreeCount","fieldLabelMarathi":"मंजूर वृक्षांची संख्या","fieldLabelEnglish":"Approved Tree Count","fieldType":"text","isMandatory":true},{"fieldKey":"ReplantCount","fieldLabelMarathi":"पुनर्लागवड करावयाची झाडे","fieldLabelEnglish":"Replant Trees Count","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (13, 69, N'जलनिःसारण / ड्रेनेज जोडणी प्रमाणपत्र (Drainage Connection)', N'CERT_DRAINAGE', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मनपाच्या मुख्य ड्रेनेज लाईनला जलनिःसारण जोडणी घेण्यास अधिकृत परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोडणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["जोडणी काम केवळ अधिकृत प्लंबरमार्फतच करणे आवश्यक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोडणी आदेश क्रमांक","fieldLabelEnglish":"Connection Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (14, 167, N'जलनिःसारण / ड्रेनेज जोडणी प्रमाणपत्र (Drainage Connection)', N'CERT_DRAINAGE', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मनपाच्या मुख्य ड्रेनेज लाईनला जलनिःसारण जोडणी घेण्यास अधिकृत परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोडणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["जोडणी काम केवळ अधिकृत प्लंबरमार्फतच करणे आवश्यक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोडणी आदेश क्रमांक","fieldLabelEnglish":"Connection Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:03:44.843', NULL, '2026-08-26 15:12:49.523'),
        (15, 44, N'भाग नकाशा दाखला (Part Map Certificate)', N'CERT_PART_MAP', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये विकास योजनेनुसार संबंधित क्षेत्राचा अधिकृत भाग नकाशा प्रमाणित करून देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर भाग नकाशा केवळ विकास योजना माहितीस्तव असून मालकी हक्काचा पुरावा नाही."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (16, 46, N'जोते प्रमाणपत्र (Plinth Certificate)', N'CERT_PLINTH', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारत बांधकामाचे जोते (Plinth Level) मंजूर नकाशाप्रमाणे पूर्ण झाल्याची खात्री करून जोते प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोते तपासणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["पुढील बांधकाम मंजूर नकाशा व नियमांनुसारच करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोते तपासणी आदेश क्रमांक","fieldLabelEnglish":"Plinth Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (17, 48, N'भूमिगत ओएफसी केबल परवानगी (OFC Cable Permission)', N'CERT_OFC_CABLE', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये भूमिगत दूरसंचार वाहिनी (OFC Cable) टाकण्यास खालील अटींवर परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवानगी वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>खोदकाम लांबी (मीटर):</strong> [[TrenchLength]]</div>
        <div><strong>शुल्क / पुनर्भरण पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["काम पूर्ण झाल्यानंतर रस्ता त्वरित पूर्ववत करणे बंधनकारक राहील."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवानगी मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"TrenchLength","fieldLabelMarathi":"खोदकाम लांबी (मीटर)","fieldLabelEnglish":"Trench Length (Meters)","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (18, 56, N'स्थलांतर दाखला (Transfer Certificate)', N'CERT_TRANSFER_CERT', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय नोंदीनुसार स्थलांतर दाखला (TC) जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित केला आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"दाखला क्रमांक","fieldLabelEnglish":"Certificate No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (19, 57, N'द्वितीय गुणपत्रक (Duplicate Mark Sheet)', N'CERT_MARK_SHEET', NULL, N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय परीक्षा अभिलेखावरून द्वितीय गुणपत्रक प्रमाणित करून देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>गुणपत्रक अनुक्रमांक:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर गुणपत्रक मूळ अभिलेखावरून पडताळून दिले आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"गुणपत्रक अनुक्रमांक","fieldLabelEnglish":"Mark Sheet Serial No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (20, 59, N'शुश्रूषा-गृह परवाना नूतनीकरण (Nursing Home Renewal)', N'CERT_NURSING_HOME_RENEWAL', NULL, N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियमान्वये अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शुश्रूषा-गृह परवान्याचे नूतनीकरण करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नूतनीकरण आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नवीन वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["आरोग्य व सुरक्षेच्या सर्व नियमांचे पालन करणे आवश्यक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नूतनीकरण आदेश क्रमांक","fieldLabelEnglish":"Renewal Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"नवीन वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (21, 60, N'शुश्रूषा-गृह परवानाधारक नाव बदल दाखला (Nursing Home Name Change)', N'CERT_NURSING_HOME_NAME_CHANGE', NULL, N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियमान्वये अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शुश्रूषा-गृह परवान्यावरील परवानाधारक/भागीदार नाव बदल मंजुरी दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नाव बदल आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["सदर बदल मनपा आरोग्य विभागाच्या अधिकृत नोंदवहीत नोंदविण्यात आला आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नाव बदल आदेश क्रमांक","fieldLabelEnglish":"Change Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL),
        (22, 64, N'अग्निशमन अंतिम नाहरकत दाखला (Final Fire NOC)', N'CERT_FINAL_FIRE_EXEMPTION', NULL, N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारतीमधील अग्निशमन यंत्रणेची अंतिम पाहणी यशस्वी झाल्याने अंतिम अग्निशमन नाहरकत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>अंतिम अग्निशमन आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>', NULL, N'["अग्निशामक यंत्रणा सदैव कार्यरत ठेवणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"अंतिम अग्निशमन आदेश क्रमांक","fieldLabelEnglish":"Final Fire Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', 1, NULL, '2026-08-26 15:12:49.523', NULL, NULL)
    ) AS V ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
)
MERGE [RTS].[CertificateTemplateMaster] AS Target
USING SourceData AS Source
ON Target.[Id] = Source.[Id]
WHEN MATCHED THEN
    UPDATE SET
        Target.[ServiceId] = Source.[ServiceId],
        Target.[TemplateName] = Source.[TemplateName],
        Target.[TemplateCode] = Source.[TemplateCode],
        Target.[HeaderContent] = Source.[HeaderContent],
        Target.[BodyContent] = Source.[BodyContent],
        Target.[FooterContent] = Source.[FooterContent],
        Target.[DefaultConditionsJson] = Source.[DefaultConditionsJson],
        Target.[OfficerFieldsJson] = Source.[OfficerFieldsJson],
        Target.[IsActive] = Source.[IsActive],
        Target.[CreatedBy] = Source.[CreatedBy],
        Target.[CreatedDate] = Source.[CreatedDate],
        Target.[UpdatedBy] = Source.[UpdatedBy],
        Target.[UpdatedDate] = Source.[UpdatedDate]
WHEN NOT MATCHED THEN
    INSERT ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (Source.[Id], Source.[ServiceId], Source.[TemplateName], Source.[TemplateCode], Source.[HeaderContent], Source.[BodyContent], Source.[FooterContent], Source.[DefaultConditionsJson], Source.[OfficerFieldsJson], Source.[IsActive], Source.[CreatedBy], Source.[CreatedDate], Source.[UpdatedBy], Source.[UpdatedDate]);
SET IDENTITY_INSERT [RTS].[CertificateTemplateMaster] OFF;
GO


/* ============================================================================
   RTS project registration in CORE

   Keeps all Right-to-Service department, module, screen groups, screens and
   administrator permissions with the RTS project seed instead of CORE/PTIS.
   The seed is idempotent and can be safely re-run.
   ============================================================================ */
DECLARE @RtsDepartmentId INT;
DECLARE @RtsModuleId INT;
DECLARE @RtsAdminRoleId INT;
DECLARE @AdminUserId INT;

SELECT @AdminUserId = [Id]
FROM [CORE].[UserMaster]
WHERE [UserName] = N'ADMIN';

IF @AdminUserId IS NULL
    THROW 51000, 'The seed ADMIN user is required before the RTS project seed runs.', 1;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[DepartmentMaster]
    WHERE [DepartmentCode] = 'RTS'
)
BEGIN
    INSERT INTO [CORE].[DepartmentMaster]
    (
        [DepartmentCode],
        [DepartmentName],
        [DepartmentNameLocal],
        [DepartmentIcon],
        [DepartmentDescription],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        'RTS',
        'RTS Department',
        N'लोकसेवा हक्क',
        N'Landmark',
        N'Maharashtra Right to Public Services',
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsDepartmentId = [Id]
FROM [CORE].[DepartmentMaster]
WHERE [DepartmentCode] = 'RTS';

UPDATE [CORE].[DepartmentMaster]
SET [DepartmentName] = 'RTS Department',
    [DepartmentNameLocal] = N'लोकसेवा हक्क',
    [DepartmentIcon] = N'Landmark',
    [DepartmentDescription] = N'Maharashtra Right to Public Services',
    [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsDepartmentId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ModuleMaster]
    WHERE [ModuleCode] = N'RTS_M'
)
BEGIN
    INSERT INTO [CORE].[ModuleMaster]
    (
        [DepartmentId],
        [ModuleCode],
        [ModuleName],
        [ModuleNameLocal],
        [ModuleIcon],
        [ModuleLabel],
        [ModuleDescription],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @RtsDepartmentId,
        N'RTS_M',
        N'Right to Service',
        N'लोकसेवा हक्क',
        N'Landmark',
        N'RTS',
        N'Right to Service administration module',
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsModuleId = [Id]
FROM [CORE].[ModuleMaster]
WHERE [ModuleCode] = N'RTS_M';

UPDATE [CORE].[ModuleMaster]
SET [DepartmentId] = @RtsDepartmentId,
    [ModuleName] = N'Right to Service',
    [ModuleNameLocal] = N'लोकसेवा हक्क',
    [ModuleIcon] = N'Landmark',
    [ModuleLabel] = N'RTS',
    [ModuleDescription] = N'Right to Service administration module',
    [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsModuleId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserRoleMaster]
    WHERE [DepartmentId] = @RtsDepartmentId
      AND [UserRoleName] = N'Admin'
)
BEGIN
    INSERT INTO [CORE].[UserRoleMaster]
    (
        [UserRoleName],
        [DepartmentId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        N'Admin',
        @RtsDepartmentId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;

SELECT @RtsAdminRoleId = [Id]
FROM [CORE].[UserRoleMaster]
WHERE [DepartmentId] = @RtsDepartmentId
  AND [UserRoleName] = N'Admin';

UPDATE [CORE].[UserRoleMaster]
SET [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsAdminRoleId;

/* Remove the legacy cross-department Admin allocation for RTS. */
DELETE allocation
FROM [CORE].[UserRoleAllocation] allocation
INNER JOIN [CORE].[UserRoleMaster] roleMaster
    ON roleMaster.[Id] = allocation.[UserRoleId]
WHERE allocation.[UserId] = @AdminUserId
  AND allocation.[DepartmentId] = @RtsDepartmentId
  AND roleMaster.[DepartmentId] <> @RtsDepartmentId;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserDepartmentAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
)
BEGIN
    INSERT INTO [CORE].[UserDepartmentAllocation]
    (
        [UserId],
        [DepartmentId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserDepartmentAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId;
END;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserModuleAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [ModuleId] = @RtsModuleId
)
BEGIN
    INSERT INTO [CORE].[UserModuleAllocation]
    (
        [UserId],
        [DepartmentId],
        [ModuleId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        @RtsModuleId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserModuleAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [ModuleId] = @RtsModuleId;
END;

IF NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserRoleAllocation]
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [UserRoleId] = @RtsAdminRoleId
)
BEGIN
    INSERT INTO [CORE].[UserRoleAllocation]
    (
        [UserId],
        [DepartmentId],
        [UserRoleId],
        [IsActive],
        [CreatedBy],
        [CreatedDate]
    )
    VALUES
    (
        @AdminUserId,
        @RtsDepartmentId,
        @RtsAdminRoleId,
        1,
        @AdminUserId,
        GETDATE()
    );
END;
ELSE
BEGIN
    UPDATE [CORE].[UserRoleAllocation]
    SET [IsActive] = 1,
        [UpdatedBy] = @AdminUserId,
        [UpdatedDate] = GETDATE()
    WHERE [UserId] = @AdminUserId
      AND [DepartmentId] = @RtsDepartmentId
      AND [UserRoleId] = @RtsAdminRoleId;
END;

DECLARE @RtsScreenGroups TABLE
(
    [ScreenGroupCode] NVARCHAR(200) NOT NULL,
    [ScreenGroupName] NVARCHAR(200) NOT NULL,
    [ScreenGroupNameLocal] NVARCHAR(200) NOT NULL,
    [ScreenGroupIcon] NVARCHAR(100) NOT NULL,
    [DisplayOrder] INT NOT NULL
);

INSERT INTO @RtsScreenGroups
(
    [ScreenGroupCode],
    [ScreenGroupName],
    [ScreenGroupNameLocal],
    [ScreenGroupIcon],
    [DisplayOrder]
)
VALUES
    (N'RTS_DASHBOARD',     N'RTS Dashboard',     N'आरटीएस डॅशबोर्ड', N'LayoutDashboard', 70),
    (N'RTS_OPERATIONS',    N'RTS Operations',    N'आरटीएस कामकाज',   N'Files',           71),
    (N'RTS_CONFIGURATION', N'RTS Configuration', N'आरटीएस संरचना',   N'Settings',        72);

INSERT INTO [CORE].[ScreenGroupMaster]
(
    [ScreenGroupCode],
    [ScreenGroupName],
    [ScreenGroupNameLocal],
    [ScreenGroupIcon],
    [DisplayOrder],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    seed.[ScreenGroupCode],
    seed.[ScreenGroupName],
    seed.[ScreenGroupNameLocal],
    seed.[ScreenGroupIcon],
    seed.[DisplayOrder],
    1,
    @AdminUserId,
    GETDATE()
FROM @RtsScreenGroups seed
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenGroupMaster] existing
    WHERE existing.[ScreenGroupCode] = seed.[ScreenGroupCode]
);

UPDATE existing
SET existing.[ScreenGroupName] = seed.[ScreenGroupName],
    existing.[ScreenGroupNameLocal] = seed.[ScreenGroupNameLocal],
    existing.[ScreenGroupIcon] = seed.[ScreenGroupIcon],
    existing.[DisplayOrder] = seed.[DisplayOrder],
    existing.[IsActive] = 1,
    existing.[UpdatedBy] = @AdminUserId,
    existing.[UpdatedDate] = GETDATE()
FROM [CORE].[ScreenGroupMaster] existing
INNER JOIN @RtsScreenGroups seed
    ON seed.[ScreenGroupCode] = existing.[ScreenGroupCode];

DECLARE @RtsScreens TABLE
(
    [ScreenGroupCode] NVARCHAR(200) NOT NULL,
    [ScreenCode] VARCHAR(200) NOT NULL,
    [ScreenName] VARCHAR(200) NOT NULL,
    [ScreenNameLocal] NVARCHAR(200) NOT NULL,
    [ScreenIcon] NVARCHAR(100) NOT NULL,
    [RoutePath] NVARCHAR(300) NOT NULL,
    [DisplayOrder] INT NOT NULL
);

INSERT INTO @RtsScreens
(
    [ScreenGroupCode],
    [ScreenCode],
    [ScreenName],
    [ScreenNameLocal],
    [ScreenIcon],
    [RoutePath],
    [DisplayOrder]
)
VALUES
    (N'RTS_DASHBOARD',     'RTS_MIS',           'RTS MIS Dashboard',   N'आरटीएस एमआयएस डॅशबोर्ड', N'LayoutDashboard', N'/rts/dashboard/rts-mis',                        1),
    (N'RTS_OPERATIONS',    'RTS_APP',           'RTS Applications',    N'आरटीएस अर्ज',             N'Files',           N'/rts/dashboard/rts-applications',               1),
    (N'RTS_CONFIGURATION', 'RTS_DEPT',          'RTS Departments',     N'आरटीएस विभाग',            N'Building2',       N'/rts/departments',                              1),
    (N'RTS_CONFIGURATION', 'RTS_SERVICES',      'RTS Services',        N'आरटीएस सेवा',             N'Activity',        N'/rts/services',                                 2),
    (N'RTS_CONFIGURATION', 'RTS_FIELDS',        'RTS Fields',          N'आरटीएस फील्ड्स',          N'Sliders',         N'/rts/fields',                                   3),
    (N'RTS_CONFIGURATION', 'RTS_APPROVAL_FLOW', 'Approval Flow Master',N'मंजुरी प्रवाह मास्टर',     N'GitMerge',        N'/rts/configuration-settings/rts-workflows',     4),
    (N'RTS_CONFIGURATION', 'RTS_CERTIFICATES',  'Certificate Master',  N'प्रमाणपत्र संरचना',       N'Award',           N'/rts/configuration-settings/rts-certificates',   5),
    (N'RTS_CONFIGURATION', 'RTS_USERS',         'RTS User Management', N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users',       N'/rts/users',                                    6);

INSERT INTO [CORE].[ScreenMaster]
(
    [ScreenGroupId],
    [ModuleId],
    [DepartmentId],
    [ScreenCode],
    [ScreenName],
    [ScreenNameLocal],
    [ScreenIcon],
    [RoutePath],
    [IsMenu],
    [IsAuthenticationRequired],
    [IsPropertyLockable],
    [DisplayOrder],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    screenGroup.[Id],
    @RtsModuleId,
    @RtsDepartmentId,
    seed.[ScreenCode],
    seed.[ScreenName],
    seed.[ScreenNameLocal],
    seed.[ScreenIcon],
    seed.[RoutePath],
    1,
    1,
    0,
    seed.[DisplayOrder],
    1,
    @AdminUserId,
    GETDATE()
FROM @RtsScreens seed
INNER JOIN [CORE].[ScreenGroupMaster] screenGroup
    ON screenGroup.[ScreenGroupCode] = seed.[ScreenGroupCode]
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenMaster] existing
    WHERE existing.[ScreenCode] = seed.[ScreenCode]
);

UPDATE existing
SET existing.[ScreenGroupId] = screenGroup.[Id],
    existing.[ModuleId] = @RtsModuleId,
    existing.[DepartmentId] = @RtsDepartmentId,
    existing.[ScreenName] = seed.[ScreenName],
    existing.[ScreenNameLocal] = seed.[ScreenNameLocal],
    existing.[ScreenIcon] = seed.[ScreenIcon],
    existing.[RoutePath] = seed.[RoutePath],
    existing.[IsMenu] = 1,
    existing.[IsAuthenticationRequired] = 1,
    existing.[IsPropertyLockable] = 0,
    existing.[DisplayOrder] = seed.[DisplayOrder],
    existing.[IsActive] = 1,
    existing.[UpdatedBy] = @AdminUserId,
    existing.[UpdatedDate] = GETDATE()
FROM [CORE].[ScreenMaster] existing
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = existing.[ScreenCode]
INNER JOIN [CORE].[ScreenGroupMaster] screenGroup
    ON screenGroup.[ScreenGroupCode] = seed.[ScreenGroupCode];

UPDATE access
SET access.[CanView] = 1,
    access.[CanEdit] = 1,
    access.[CanDelete] = 1,
    access.[HaveFullAccess] = 1,
    access.[HaveNoAccess] = 0,
    access.[IsActive] = 1,
    access.[UpdatedBy] = @AdminUserId,
    access.[UpdatedDate] = GETDATE()
FROM [CORE].[RoleWiseScreenAccessMaster] access
INNER JOIN [CORE].[ScreenMaster] screen
    ON screen.[Id] = access.[ScreenId]
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = screen.[ScreenCode]
WHERE access.[UserRoleId] = @RtsAdminRoleId;

INSERT INTO [CORE].[RoleWiseScreenAccessMaster]
(
    [UserRoleId],
    [ScreenId],
    [CanView],
    [CanEdit],
    [CanDelete],
    [HaveFullAccess],
    [HaveNoAccess],
    [IsActive],
    [CreatedBy],
    [CreatedDate]
)
SELECT
    @RtsAdminRoleId,
    screen.[Id],
    1,
    1,
    1,
    1,
    0,
    1,
    @AdminUserId,
    GETDATE()
FROM [CORE].[ScreenMaster] screen
INNER JOIN @RtsScreens seed
    ON seed.[ScreenCode] = screen.[ScreenCode]
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[RoleWiseScreenAccessMaster] existing
    WHERE existing.[UserRoleId] = @RtsAdminRoleId
      AND existing.[ScreenId] = screen.[Id]
);

PRINT 'RTS project registration, screens and Admin access seeded successfully.';
GO

-- =========================================================
-- RTS DepartmentMaster Seed Data
-- =========================================================
;WITH SeedDepartments AS (
    SELECT * FROM (VALUES
        (N'Property Tax',          N'मालमत्ता कर',                         N'Home',           1),
        (N'Water Connection',      N'पाणी पुरवठा',                         N'Droplets',       2),
        (N'Trade License',         N'व्यवसाय परवाना',                       N'Briefcase',      3),
        (N'Town Planning',         N'नगर रचना',                             N'Map',            4),
        (N'Birth & Death',         N'जन्म आणि मृत्यू',                      N'HeartPulse',     5),
        (N'Education',             N'शिक्षण',                               N'GraduationCap',  6),
        (N'Health',                N'आरोग्य',                               N'Activity',       7),
        (N'NOC',                   N'ना हरकत प्रमाणपत्र (NOC)',             N'ShieldCheck',    8),
        (N'Marriage Certificate',  N'लग्न नोंदणी प्रमाणपत्र',              N'Heart',          9),
        (N'Tree',                  N'वृक्ष प्राधिकरण',                      N'TreePine',       10),
        (N'Sanitation',            N'स्वच्छता विभाग',                       N'Trash2',         11)
    ) AS V (DepartmentName, DepartmentNameLocal, DepartmentIcon, DisplayOrder)
)
INSERT INTO [RTS].[DepartmentMaster] ([DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate])
SELECT S.DepartmentName, S.DepartmentNameLocal, S.DepartmentIcon, S.DisplayOrder, 1, 0, GETDATE()
FROM SeedDepartments S
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[DepartmentMaster] D WHERE D.DepartmentName = S.DepartmentName
);
GO

-- =========================================================
-- RTS ServiceMaster Seed Data
-- =========================================================
;WITH SeedServices AS (
    SELECT * FROM (VALUES
        (N'NOC', 1, N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र', NULL, N'ShieldCheck', 1, N'7 Days', 0.00, 0),
        (N'NOC', 2, N'Mandap No-Damage Certificate', N'मंडपासाठी ना-हरकत प्रमाणपत्र', NULL, N'Building2', 2, N'7 Days', 0.00, 0),
        (N'Town Planning', 3, N'Issuance of Zone Certificate', N'झोन दाखला देणे', NULL, N'Map', 3, N'7 Days', 0.00, 0),
        (N'Town Planning', 4, N'Giving Part Map', N'भाग नकाशा देणे', NULL, N'Map', 4, N'7 Days', 0.00, 0),
        (N'Town Planning', 5, N'Issuance of Construction Permit', N'बांधकाम परवाना देणे', NULL, N'HardHat', 5, N'7 Days', 0.00, 0),
        (N'Town Planning', 6, N'Issuance of plinth certificate', N'जोते प्रमाणपत्र देणे', NULL, N'MapPin', 6, N'7 Days', 0.00, 0),
        (N'Town Planning', 7, N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र देणे', NULL, N'Key', 7, N'7 Days', 0.00, 0),
        (N'Trade License', 8, N'Obtaining New Trade License', N'नविन परवाना मिळणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 8, N'30 Days', 500.00, 1),
        (N'Trade License', 9, N'Renewal of Trade License', N'परवान्याचे नुतनीकरण', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 9, N'15 Days', 300.00, 1),
        (N'Trade License', 10, N'Transfer of Trade License', N'परवाना हस्तांतर', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 10, N'15 Days', 200.00, 1),
        (N'Trade License', 11, N'Duplicate Copy of Trade License', N'परवाना दुय्यम प्रत', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 11, N'7 Days', 100.00, 1),
        (N'Trade License', 12, N'Change of Business Name / Establishment / Address', N'व्यवसायाचे नाव बदलणे/प्रतिष्ठानात/पत्यात बदल', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 12, N'7 Days', 150.00, 1),
        (N'Trade License', 13, N'Changing Occupations / Business Type', N'व्यवसाय बदलणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 13, N'7 Days', 150.00, 1),
        (N'Trade License', 14, N'Change of License Holder / Partner Name', N'परवाना धारक/भागीदाराचे नाव बदलणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 14, N'7 Days', 150.00, 1),
        (N'Trade License', 15, N'Change in Number of Partners (Increase/Decrease)', N'भागीदाराच्या संख्येत बदल (वाढ/कमी)', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 15, N'7 Days', 150.00, 1),
        (N'Trade License', 16, N'Cancellation of License', N'परवाना रद्द करणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 16, N'7 Days', 0.00, 0),
        (N'Trade License', 17, N'Notice on Renewal of Expired License', N'कालबाह्य परवानासाठी नुतनीकरण सुचना', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 17, N'7 Days', 0.00, 0),
        (N'NOC', 18, N'Issuance of Fire Safety NOC', N'अग्निशमन नाहरकत दाखला देणे', NULL, N'Flame', 18, N'7 Days', 0.00, 0),
        (N'NOC', 19, N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला देणे', NULL, N'Flame', 19, N'7 Days', 0.00, 0),
        (N'Birth & Death', 20, N'Birth Certificate', N'जन्म प्रमाणपत्र देणे', NULL, N'Baby', 20, N'7 Days', 50.00, 1),
        (N'Birth & Death', 21, N'Death Certificate', N'मृत्यु प्रमाणपत्र देणे', NULL, N'HeartOff', 21, N'7 Days', 0.00, 0),
        (N'Marriage Certificate', 22, N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र देणे', NULL, N'Heart', 22, N'15 Days', 100.00, 1),
        (N'Property Tax', 23, N'New Property Tax Assessment', N'नव्याने कर आकारणी', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Home', 23, N'30 Days', 200.00, 1),
        (N'Property Tax', 24, N'Re-Assessment of Property Tax', N'पुनः कर आकारणी', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Home', 24, N'30 Days', 150.00, 1),
        (N'Property Tax', 25, N'Preparation of Tax Demand Notice', N'कराचे मागणी पत्र तयार करणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileText', 25, N'7 Days', 0.00, 0),
        (N'Property Tax', 26, N'Avail Property Tax Exemption', N'कर माफी मिळणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Receipt', 26, N'15 Days', 0.00, 0),
        (N'Property Tax', 27, N'Tax Exemption for Non-Resident Properties', N'रहिवास नलेल्यास मालमत्तांना करात सुट मिळणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Receipt', 27, N'15 Days', 0.00, 0),
        (N'Property Tax', 28, N'Property Tax Self-Assessment', N'स्वयंमुल्यांकन', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Calculator', 28, N'7 Days', 0.00, 0),
        (N'Property Tax', 29, N'Registration of Objection on Tax Assessment', N'आक्षेप नोंदविणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'AlertTriangle', 29, N'15 Days', 0.00, 0),
        (N'Property Tax', 30, N'Sub-division of Property', N'उपविभागामध्ये मालमत्ता विभाजन', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'GitFork', 30, N'15 Days', 100.00, 1),
        (N'Property Tax', 31, N'Re-assessment After Demolition and Reconstruction', N'मालमत्ता पाडणे व पुनःबांधणी कर आकारणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'Hammer', 31, N'30 Days', 200.00, 1),
        (N'Property Tax', 32, N'Issuance of Property Tax Assessment Copy (8A)', N'मालमत्ता कर उतारा देणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileText', 32, N'7 Days', 50.00, 1),
        (N'Property Tax', 33, N'Issuance of No Dues Certificate', N'थकबाकी नसल्याचा दाखला देणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'FileCheck', 33, N'7 Days', 50.00, 1),
        (N'Property Tax', 34, N'Property Transfer Registration Certificate', N'अ) दस्ताऐवजाच्या आधारे मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे ब) वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'UserCheck', 34, N'15 Days', 200.00, 1),
        (N'Property Tax', 35, N'Change of Ownership Name', N'मालकी हक्कात बदल करणे', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication?upicNo=', N'UserPlus', 35, N'15 Days', 200.00, 1),
        (N'Water Connection', 36, N'Changing the Water Connection Size', N'नळ जोडणी आकारामध्ये बदल करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 36, N'7 Days', 100.00, 1),
        (N'Water Connection', 37, N'Temporary / Permanent Disconnection of Water Connection', N'तात्पुरते/कायमस्वरूपी नळ जोडणी खंडीत करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 37, N'7 Days', 0.00, 0),
        (N'Water Connection', 38, N'Reconnection of Water Tap', N'पुनः जोडणी करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 38, N'7 Days', 100.00, 1),
        (N'Water Connection', 39, N'Change of Water Connection Usage Type', N'वापरामध्ये बदल करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 39, N'7 Days', 100.00, 1),
        (N'Water Connection', 40, N'Preparation of Water Bill', N'पाणी देयक तयार करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'FileText', 40, N'7 Days', 0.00, 0),
        (N'Water Connection', 41, N'Issuance of Plumber License', N'प्लंबर परवाना', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Wrench', 41, N'15 Days', 300.00, 1),
        (N'Water Connection', 42, N'Renewal of Plumber License', N'प्लंबर परवाना नुतनीकरण करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Wrench', 42, N'15 Days', 200.00, 1),
        (N'Water Connection', 43, N'Water Bill No Dues Certificate', N'थकबाकी नसल्याचा दाखला', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'FileCheck', 43, N'7 Days', 50.00, 1),
        (N'Water Connection', 44, N'Complaint Regarding Faulty Water Meter', N'नादुरुस्त मीटर तक्रार करणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 44, N'7 Days', 0.00, 0),
        (N'Water Connection', 45, N'Complaint Regarding Unauthorized Water Tap Connection', N'अनधिकृत नळ जोडणी तक्रार', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 45, N'7 Days', 0.00, 0),
        (N'Water Connection', 46, N'Complaint Regarding Water Pressure Capacity', N'पाण्याच्या दाब क्षमता तक्रार', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 46, N'7 Days', 0.00, 0),
        (N'Water Connection', 47, N'Complaint Regarding Water Quality', N'पाण्याची गुणवत्ता तक्रार', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'AlertTriangle', 47, N'7 Days', 0.00, 0),
        (N'Water Connection', 48, N'Provision of New Water Tap Connection', N'नळ जोडणी देणे', N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 48, N'15 Days', 150.00, 1),
        (N'Sanitation', 49, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, N'Droplet', 49, N'15 Days', 100.00, 1),
        (N'Education', 50, N'School Leaving / Duplicate Certificate', N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व व्दितीय दाखला देणे', NULL, N'GraduationCap', 50, N'7 Days', 30.00, 1),
        (N'Education', 51, N'Issuance of transfer certificate', N'स्थलांतर दाखला देणे', NULL, N'GraduationCap', 51, N'7 Days', 0.00, 0),
        (N'Education', 52, N'Issuance of duplicate mark sheet', N'व्दितीय गुणपत्रक देणे', NULL, N'GraduationCap', 52, N'7 Days', 30.00, 1),
        (N'Health', 53, N'Nursing home license under Registration Act, 1949', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत शुश्रूषा-गृह परवाना देणे', NULL, N'PlusSquare', 53, N'30 Days', 500.00, 1),
        (N'Health', 54, N'Renewal of nursing home license', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत शुश्रूषा-गृह परवान्याचे नुतनीकरण करणे', NULL, N'PlusSquare', 54, N'30 Days', 300.00, 1),
        (N'Health', 55, N'Change of nursing home license holder / partner name', N'महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, 1949 अंतर्गत परवान्यावर परवानाधारक/भागीदाराचे नाव बदलणे', NULL, N'UserPlus', 55, N'15 Days', 200.00, 1),
        (N'Trade License', 56, N'Issuance of Lodging House License', N'लॉजिंग हाऊस परवाना देणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 56, N'15 Days', 500.00, 1),
        (N'Trade License', 57, N'Renewal of Lodging House License', N'लॉजिंग हाऊस परवान्याचे नुतनीकरण करणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 57, N'15 Days', 300.00, 1),
        (N'Trade License', 58, N'Issuance of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवाना देणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 58, N'15 Days', 500.00, 1),
        (N'Trade License', 59, N'Renewal of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवान्याचे नुतनीकरण करणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 59, N'15 Days', 300.00, 1),
        (N'Trade License', 60, N'Issuance of Hawker Registration Certificate', N'फेरीवाले नोंदणी प्रमाणपत्र देणे', N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Store', 60, N'7 Days', 100.00, 1),
        (N'Town Planning', 61, N'Underground OFC Cable Permission', N'भुमिगत दुरसंचार वाहिनी (ऑप्टीकल फायबर केबल) टाकण्याकरीता परवानगी देणे (Permission for establishment of under-ground Cable Infrastructure - Optical Fibre Cable)', NULL, N'Cable', 61, N'7 Days', 0.00, 0),
        (N'Tree', 62, N'Tree Felling Permission (Sec 8)', N'महाराष्ट्र (नागरी क्षेत्रे) वृक्ष संरक्षण आणि संवर्धन अधिनियम, 1975 मधील कलम 8 मधील तरतुदीनुसार वृक्षतोड परवानगी देणे', NULL, N'TreePine', 62, N'15 Days', 0.00, 0),
        (N'Town Planning', 63, N'Filling Potholes on City Roads', N'रस्त्यांवरील खड्डे बुजविणे', N'#', N'Wrench', 63, N'7 Days', 0.00, 0),
        (N'Town Planning', 64, N'Maintaining & Securing Sewer Covers', N'गटारांवरील झाकणे सुस्थितीत ठेवणे', N'#', N'Shield', 64, N'7 Days', 0.00, 0),
        (N'Sanitation', 65, N'Maintaining cleanliness', N'शहरात स्वच्छता राखणे', N'#', N'Trash2', 65, N'7 Days', 0.00, 0)
    ) AS V (DeptName, GovtServiceCode, ServiceName, ServiceNameLocal, ServiceUrl, ServiceIcon, DisplayOrder, Sla, Fees, FeesRequired)
)
MERGE [RTS].[ServiceMaster] AS Target
USING (
    SELECT D.Id AS DepartmentId, S.GovtServiceCode, S.ServiceName, S.ServiceNameLocal, S.ServiceUrl, S.ServiceIcon, S.DisplayOrder, S.Sla, S.Fees, S.FeesRequired
    FROM SeedServices S
    INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
) AS Source
ON (Target.GovtServiceCode = Source.GovtServiceCode OR (Target.DepartmentId = Source.DepartmentId AND Target.ServiceName = Source.ServiceName))
WHEN MATCHED THEN
    UPDATE SET
        Target.GovtServiceCode = Source.GovtServiceCode,
        Target.DepartmentId = Source.DepartmentId,
        Target.ServiceName = Source.ServiceName,
        Target.ServiceNameLocal = Source.ServiceNameLocal,
        Target.ServiceUrl = Source.ServiceUrl,
        Target.ServiceIcon = Source.ServiceIcon,
        Target.DisplayOrder = Source.DisplayOrder,
        Target.Sla = Source.Sla,
        Target.Fees = Source.Fees,
        Target.FeesRequired = Source.FeesRequired,
        Target.IsActive = 1
WHEN NOT MATCHED THEN
    INSERT ([DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [ServiceUrl], [ServiceIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [Sla], [Fees], [FeesRequired])
    VALUES (Source.DepartmentId, Source.GovtServiceCode, Source.ServiceName, Source.ServiceNameLocal, Source.ServiceUrl, Source.ServiceIcon, Source.DisplayOrder, 1, 0, GETDATE(), Source.Sla, Source.Fees, Source.FeesRequired);
GO

-- =========================================================
-- RTS FieldDefinition Seed Data
-- =========================================================
;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFirstName', N'groomFirstName', N'Groom First Name', N'text', N'Bridegroom Details', NULL, 1, 7, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMiddleName', N'groomMiddleName', N'Groom Middle Name', N'text', N'Bridegroom Details', NULL, 0, 8, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomLastName', N'groomLastName', N'Groom Last Name', N'text', N'Bridegroom Details', NULL, 1, 9, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAge', N'groomAge', N'Age', N'number', N'Bridegroom Details', NULL, 1, 10, NULL, N'{"min":21,"max":120}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomDateOfBirth', N'groomDateOfBirth', N'Date of Birth', N'date', N'Bridegroom Details', NULL, 1, 11, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAadhaar', N'groomAadhaar', N'Aadhaar Number', N'text', N'Bridegroom Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherFirstName', N'groomFatherFirstName', N'Father''s First Name', N'text', N'Bridegroom Details', NULL, 1, 13, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherMiddleName', N'groomFatherMiddleName', N'Father''s Middle Name', N'text', N'Bridegroom Details', NULL, 0, 14, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherLastName', N'groomFatherLastName', N'Father''s Last Name', N'text', N'Bridegroom Details', NULL, 1, 15, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherFirstName', N'groomMotherFirstName', N'Mother''s First Name', N'text', N'Bridegroom Details', NULL, 1, 16, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherMiddleName', N'groomMotherMiddleName', N'Mother''s Middle Name', N'text', N'Bridegroom Details', NULL, 0, 17, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherLastName', N'groomMotherLastName', N'Mother''s Last Name', N'text', N'Bridegroom Details', NULL, 1, 18, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomparentCity', N'groomparentCity', N'groomParent City', N'text', N'Bridegroom Details', NULL, 1, 19, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomparentState', N'groomparentState', N'groomParent State', N'text', N'Bridegroom Details', NULL, 1, 20, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomOccupation', N'groomOccupation', N'Occupation', N'text', N'Bridegroom Details', NULL, 0, 21, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomReligion', N'groomReligion', N'Religion', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 22, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFirstName', N'brideFirstName', N'Bride First Name', N'text', N'Bride Details', NULL, 1, 23, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMiddleName', N'brideMiddleName', N'Bride Middle Name', N'text', N'Bride Details', NULL, 0, 24, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideLastName', N'brideLastName', N'Bride Last Name', N'text', N'Bride Details', NULL, 1, 25, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAge', N'brideAge', N'Age', N'number', N'Bride Details', NULL, 1, 26, NULL, N'{"min":18,"max":120}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideDateOfBirth', N'brideDateOfBirth', N'Date of Birth', N'date', N'Bride Details', NULL, 1, 27, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAadhaar', N'brideAadhaar', N'Aadhaar Number', N'text', N'Bride Details', NULL, 1, 28, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherFirstName', N'brideFatherFirstName', N'Father''s First Name', N'text', N'Bride Details', NULL, 1, 29, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherMiddleName', N'brideFatherMiddleName', N'Father''s Middle Name', N'text', N'Bride Details', NULL, 0, 30, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherLastName', N'brideFatherLastName', N'Father''s Last Name', N'text', N'Bride Details', NULL, 1, 31, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherFirstName', N'brideMotherFirstName', N'Mother''s First Name', N'text', N'Bride Details', NULL, 1, 32, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherMiddleName', N'brideMotherMiddleName', N'Mother''s Middle Name', N'text', N'Bride Details', NULL, 0, 33, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherLastName', N'brideMotherLastName', N'Mother''s Last Name', N'text', N'Bride Details', NULL, 1, 34, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideparentCity', N'brideparentCity', N'brideParent City', N'text', N'Bride Details', NULL, 1, 35, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideparentState', N'brideparentState', N'brideParent State', N'text', N'Bride Details', NULL, 1, 36, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideOccupation', N'brideOccupation', N'Occupation', N'text', N'Bride Details', NULL, 0, 37, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideReligion', N'brideReligion', N'Religion', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 38, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageDate', N'marriageDate', N'Date of Marriage', N'date', N'Marriage Details', NULL, 1, 39, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriagePlace', N'marriagePlace', N'Place of Marriage', N'text', N'Marriage Details', NULL, 1, 40, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageCity', N'marriageCity', N'marriage City', N'text', N'Marriage Details', NULL, 1, 41, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageState', N'marriageState', N'marriage State', N'text', N'Marriage Details', NULL, 1, 42, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1FirstName', N'witness1FirstName', N'Witness 1 First Name', N'text', N'Marriage Details', NULL, 1, 43, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1MiddleName', N'witness1MiddleName', N'Witness 1 Middle Name', N'text', N'Marriage Details', NULL, 0, 44, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1LastName', N'witness1LastName', N'Witness 1 Last Name', N'text', N'Marriage Details', NULL, 1, 45, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2FirstName', N'witness2FirstName', N'Witness 2 First Name', N'text', N'Marriage Details', NULL, 1, 46, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2MiddleName', N'witness2MiddleName', N'Witness 2 Middle Name', N'text', N'Marriage Details', NULL, 0, 47, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2LastName', N'witness2LastName', N'Witness 2 Last Name', N'text', N'Marriage Details', NULL, 1, 48, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 49, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Providing drainage connections', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 1, 5, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Sanitation', N'Providing drainage connections', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Property / Location Details', N'[]', 1, 7, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Property / Location Details', N'[]', 0, 8, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Property / Location Details', N'[]', 0, 9, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Property / Location Details', NULL, 0, 10, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Property / Location Details', NULL, 0, 11, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'premisesOccupancyType', N'premisesOccupancyType', N'Premises Type', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', 1, 12, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'connectionType', N'connectionType', N'Connection Type', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', 1, 13, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'useType', N'useType', N'Use Type', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', 1, 14, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'noOfUnits', N'noOfUnits', N'No. of Units (optional)', N'number', N'Drainage / Sewer Connection Request', NULL, 0, 15, NULL, N'{"min":0}'),
    (N'Sanitation', N'Providing drainage connections', N'existingArrangement', N'existingArrangement', N'Current Wastewater Arrangement', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 16, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'approxDistanceToSewerLineMeters', N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'number', N'Drainage / Sewer Connection Request', NULL, 0, 17, NULL, N'{"min":0}'),
    (N'Sanitation', N'Providing drainage connections', N'roadCuttingRequired', N'roadCuttingRequired', N'Road Cutting Required?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 18, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'roadCuttingDetails', N'roadCuttingDetails', N'Road Cutting Details (optional)', N'textarea', N'Drainage / Sewer Connection Request', NULL, 0, 19, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'oldConnectionRefNo', N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'text', N'Drainage / Sewer Connection Request', NULL, 0, 20, 50, N'{"maxLength":50}'),
    (N'Sanitation', N'Providing drainage connections', N'tradeLicenseNo', N'tradeLicenseNo', N'Trade License No (optional)', N'text', N'Drainage / Sewer Connection Request', NULL, 0, 21, 50, N'{"maxLength":50}'),
    (N'Sanitation', N'Providing drainage connections', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerFirstName', N'ownerFirstName', N'Owner First Name', N'text', N'Owner Details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerMiddleName', N'ownerMiddleName', N'Owner Middle Name', N'text', N'Owner Details', NULL, 0, 8, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerLastName', N'ownerLastName', N'Owner Last Name', N'text', N'Owner Details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerMobile', N'ownerMobile', N'Owner Mobile Number', N'tel', N'Owner Details', NULL, 1, 10, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerEmail', N'ownerEmail', N'Owner Email', N'email', N'Owner Details', NULL, 0, 11, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerAadhar', N'ownerAadhar', N'Owner Aadhar Number', N'text', N'Owner Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'panNumber', N'panNumber', N'Owner PAN Number', N'text', N'Owner Details', NULL, 0, 13, 10, N'{"pattern":"^[A-Z]{5}[0-9]{4}[A-Z]{1}$","maxLength":10}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerCity', N'ownerCity', N'Owner City', N'text', N'Owner Details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerState', N'ownerState', N'Owner State', N'text', N'Owner Details', NULL, 1, 15, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'businessName', N'businessName', N'Business / Trade Name', N'text', N'Business Activity & Licensing Details', NULL, 1, 16, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'workers', N'workers', N'Number of Employees', N'number', N'Business Activity & Licensing Details', NULL, 1, 17, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment Number', N'text', N'Business Activity & Licensing Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'propertyTaxReceiptNo', N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'text', N'Business Activity & Licensing Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'businessAddress', N'businessAddress', N'Business Address', N'textarea', N'Business Activity & Licensing Details', NULL, 1, 20, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'activityType', N'activityType', N'Type of Activity', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', 1, 21, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'licenseCategory', N'licenseCategory', N'Licensing Category', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', 1, 22, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'specialCategory', N'specialCategory', N'Specify License Category (if Special)', N'text', N'Business Activity & Licensing Details', NULL, 1, 23, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'newBusinessProposal', N'newBusinessProposal', N'New Business Proposal?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 24, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'workingHours', N'workingHours', N'Working Hours', N'text', N'Business Activity & Licensing Details', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'fssaiLicense', N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'text', N'Business Activity & Licensing Details', NULL, 0, 26, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'natureOfGoods', N'natureOfGoods', N'Nature of Goods Stored / Traded', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', 1, 27, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'flammableGoods', N'flammableGoods', N'Flammable/Explosive Goods?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 28, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'flammableGoodsDetail', N'flammableGoodsDetail', N'Flammable Material Details', N'textarea', N'Storage, Safety & Hazard Details', NULL, 0, 29, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'fireNocUpdated', N'fireNocUpdated', N'Fire NOC Up-to-date?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 30, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'policeNocSubmitted', N'policeNocSubmitted', N'Police NOC Submitted?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 31, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 32, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerFirstName', N'ownerFirstName', N'Owner First Name', N'text', N'Owner Details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerMiddleName', N'ownerMiddleName', N'Owner Middle Name', N'text', N'Owner Details', NULL, 0, 8, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerLastName', N'ownerLastName', N'Owner Last Name', N'text', N'Owner Details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerMobile', N'ownerMobile', N'Owner Mobile Number', N'tel', N'Owner Details', NULL, 1, 10, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerEmail', N'ownerEmail', N'Owner Email', N'email', N'Owner Details', NULL, 0, 11, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerAadhar', N'ownerAadhar', N'Owner Aadhar Number', N'text', N'Owner Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'panNumber', N'panNumber', N'Owner PAN Number', N'text', N'Owner Details', NULL, 0, 13, 10, N'{"pattern":"^[A-Z]{5}[0-9]{4}[A-Z]{1}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerCity', N'ownerCity', N'Owner City', N'text', N'Owner Details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerState', N'ownerState', N'Owner State', N'text', N'Owner Details', NULL, 1, 15, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandalName', N'mandalName', N'Mandal Name (Reg. Charity Comm.)', N'text', N'Event & Permission Info', NULL, 0, 16, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'registrationNo', N'registrationNo', N'Registration Number', N'text', N'Event & Permission Info', NULL, 0, 17, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'registrationYear', N'registrationYear', N'Registration Year', N'number', N'Event & Permission Info', NULL, 0, 18, NULL, N'{"min":1900,"max":2100}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'chairmanName', N'chairmanName', N'Name of Chairman/Secretary', N'text', N'Event & Permission Info', NULL, 0, 19, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contactNo', N'contactNo', N'Contact No. (President/Secretary)', N'tel', N'Event & Permission Info', NULL, 0, 20, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventType', N'eventType', N'Type of Event', N'select', N'Event & Permission Info', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', 1, 21, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventStartDate', N'eventStartDate', N'Event Start Date', N'date', N'Event & Permission Info', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventEndDate', N'eventEndDate', N'Event End Date', N'date', N'Event & Permission Info', NULL, 1, 23, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'placeOwnership', N'placeOwnership', N'Ownership of Tent Place', N'select', N'Event & Permission Info', N'[{"value":"Private","label":{"en":"Private","hi":"निजी","mr":"खाजगी"}},{"value":"Municipal","label":{"en":"Municipal/Council","hi":"नगर निगम","mr":"महापालिका/परिषद"}},{"value":"Public","label":{"en":"Public Road","hi":"सार्वजनिक सड़क","mr":"सार्वजनिक रस्ता"}}]', 1, 24, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'zoneNo', N'zoneNo', N'Zone', N'select', N'Event & Permission Info', N'[{"value":"East","label":{"en":"East Zone","hi":"पूर्व ज़ोन","mr":"पूर्व झोन"}},{"value":"West","label":{"en":"West Zone","hi":"पश्चिम ज़ोन","mr":"पश्चिम झोन"}},{"value":"North","label":{"en":"North Zone","hi":"उत्तर ज़ोन","mr":"उत्तर झोन"}},{"value":"South","label":{"en":"South Zone","hi":"दक्षिण ज़ोन","mr":"दक्षिण झोन"}}]', 1, 25, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'wardArea', N'wardArea', N'Ward Area', N'text', N'Event & Permission Info', NULL, 1, 26, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'plotNo', N'plotNo', N'Plot No', N'text', N'Event & Permission Info', NULL, 1, 27, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'pandolAddress', N'pandolAddress', N'Pandol / Stage Address', N'textarea', N'Event & Permission Info', NULL, 1, 28, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapType', N'mandapType', N'Mandap Type', N'select', N'Mandap Structural Details', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', 1, 29, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapArea', N'mandapArea', N'Mandap Area (sq.ft.)', N'number', N'Mandap Structural Details', NULL, 1, 30, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'areaSqFt', N'areaSqFt', N'Area (Sq Ft)', N'number', N'Mandap Structural Details', NULL, 1, 31, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'volunteers', N'volunteers', N'No. of Volunteers', N'number', N'Mandap Structural Details', NULL, 1, 32, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'numberOfPillars', N'numberOfPillars', N'No. of Pillars / Support Beams', N'number', N'Mandap Structural Details', NULL, 1, 33, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'beamMaterial', N'beamMaterial', N'Material Used (Wood/Iron/Steel/Aluminum)', N'text', N'Mandap Structural Details', NULL, 1, 34, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'structuralEngineerName', N'structuralEngineerName', N'Structural Engineer / Fabricator Name', N'text', N'Mandap Structural Details', NULL, 1, 35, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapHeight', N'mandapHeight', N'Mandap Height (feet)', N'number', N'Mandap Structural Details', NULL, 1, 36, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'windLoadResistance', N'windLoadResistance', N'Wind Load Resistance Tested?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 37, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'fireExtinguishersAvailable', N'fireExtinguishersAvailable', N'Fire Extinguishers Available?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 38, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'extinguisherCount', N'extinguisherCount', N'Number of Extinguishers', N'number', N'Mandap Structural Details', NULL, 0, 39, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'electricalLoad', N'electricalLoad', N'Electrical Load Installed (kW)', N'number', N'Mandap Structural Details', NULL, 1, 40, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'earthingProvided', N'earthingProvided', N'Earthing Provided?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 41, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'crowdCapacity', N'crowdCapacity', N'Expected Crowd Capacity', N'number', N'Mandap Structural Details', NULL, 1, 42, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'emergencyExits', N'emergencyExits', N'Number of Emergency Exits', N'number', N'Mandap Structural Details', NULL, 1, 43, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'generatorUsed', N'generatorUsed', N'Generator to be Used?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 44, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contractorAddress', N'contractorAddress', N'Pandol Contractor Address', N'textarea', N'Contractors Info', NULL, 1, 45, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contractorContact', N'contractorContact', N'Pandol Contractor Contact', N'tel', N'Contractors Info', NULL, 1, 46, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorName', N'decoratorName', N'Decorator/Electrical Name', N'text', N'Contractors Info', NULL, 1, 47, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorAddress', N'decoratorAddress', N'Decorator/Electrical Address', N'textarea', N'Contractors Info', NULL, 1, 48, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorContact', N'decoratorContact', N'Decorator/Electrical Contact', N'tel', N'Contractors Info', NULL, 1, 49, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundName', N'soundName', N'Sound/Speaker Contractor Name', N'text', N'Contractors Info', NULL, 1, 50, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundAddress', N'soundAddress', N'Sound/Speaker Address', N'textarea', N'Contractors Info', NULL, 1, 51, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundContact', N'soundContact', N'Sound/Speaker Contact', N'tel', N'Contractors Info', NULL, 1, 52, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundType', N'soundType', N'Sound/Speaker Type', N'select', N'Contractors Info', N'[{"value":"DJ","label":{"en":"DJ System","hi":"डीजे सिस्टम","mr":"डीजे सिस्टम"}},{"value":"Loudspeaker","label":{"en":"Loudspeaker","hi":"लाउडस्पीकर","mr":"लाउडस्पीकर"}},{"value":"Traditional","label":{"en":"Traditional Instruments","hi":"पारंपरिक वाद्ययंत्र","mr":"पारंपारिक वाद्ये"}}]', 1, 53, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'policeStation', N'policeStation', N'Concerned Police Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 54, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'trafficPoliceStation', N'trafficPoliceStation', N'Concerned Traffic Police Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 55, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'fireStation', N'fireStation', N'Nearest Fire Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 56, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'noDamageGuarantee', N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 57, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'cleanlinessAssurance', N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 58, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 59, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerName', N'ownerName', N'Name of Owner', N'text', N'Owner & Premises details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerMobile', N'ownerMobile', N'Mobile Number', N'tel', N'Owner & Premises details', NULL, 1, 8, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerEmail', N'ownerEmail', N'Email Address', N'email', N'Owner & Premises details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessName', N'businessName', N'Name of Industry / Business / Firm', N'text', N'Owner & Premises details', NULL, 1, 10, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessCity', N'businessCity', N'business City', N'text', N'Owner & Premises details', NULL, 1, 11, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessState', N'businessState', N'business State', N'text', N'Owner & Premises details', NULL, 1, 12, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment No.', N'text', N'Owner & Premises details', NULL, 1, 13, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'zoneWard', N'zoneWard', N'Zone/Ward', N'text', N'Owner & Premises details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'propertyType', N'propertyType', N'Occupancy Type', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', 1, 15, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'totalBuiltupArea', N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'number', N'Fire Safety & Building Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'floors', N'floors', N'No. of Floors', N'number', N'Fire Safety & Building Details', NULL, 1, 17, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'workers', N'workers', N'No. of Workers/Employees', N'number', N'Fire Safety & Building Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'extinguisherCountProposed', N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'number', N'Fire Safety & Building Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'emergencyExitCountProposed', N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'number', N'Fire Safety & Building Details', NULL, 1, 20, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'musterPointProposed', N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'textarea', N'Fire Safety & Building Details', NULL, 0, 21, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'flammableMaterialsProposed', N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 22, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'flammableMaterialDetailsProposed', N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'textarea', N'Fire Safety & Building Details', NULL, 0, 23, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'buildingDetailsAsMap', N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'textarea', N'Fire Safety & Building Details', NULL, 1, 24, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerName', N'ownerName', N'Name of Owner', N'text', N'Owner & Premises details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerMobile', N'ownerMobile', N'Mobile Number', N'tel', N'Owner & Premises details', NULL, 1, 8, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerEmail', N'ownerEmail', N'Email Address', N'email', N'Owner & Premises details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessName', N'businessName', N'Name of Industry / Business / Firm', N'text', N'Owner & Premises details', NULL, 1, 10, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessCity', N'businessCity', N'business City', N'text', N'Owner & Premises details', NULL, 1, 11, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessState', N'businessState', N'business State', N'text', N'Owner & Premises details', NULL, 1, 12, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment No.', N'text', N'Owner & Premises details', NULL, 1, 13, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'NOC', N'Final Fire Exemption Certificate', N'zoneWard', N'zoneWard', N'Zone/Ward', N'text', N'Owner & Premises details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'propertyType', N'propertyType', N'Occupancy Type', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', 1, 15, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'totalBuiltupArea', N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'number', N'Fire Safety & Building Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'floors', N'floors', N'No. of Floors', N'number', N'Fire Safety & Building Details', NULL, 1, 17, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'workers', N'workers', N'No. of Workers/Employees', N'number', N'Fire Safety & Building Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherCount', N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'number', N'Fire Safety & Building Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherType', N'extinguisherType', N'Type of Extinguishers', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', 1, 20, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherDensity', N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'number', N'Fire Safety & Building Details', NULL, 0, 21, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'lastRefillDate', N'lastRefillDate', N'Last Refill/Service Date', N'date', N'Fire Safety & Building Details', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'nextRefillDueDate', N'nextRefillDueDate', N'Next Service Due Date', N'date', N'Fire Safety & Building Details', NULL, 0, 23, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'installerAgency', N'installerAgency', N'Installer/Service Agency Name', N'text', N'Fire Safety & Building Details', NULL, 1, 24, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'serviceAgencyLicenseNo', N'serviceAgencyLicenseNo', N'Service Agency License No.', N'text', N'Fire Safety & Building Details', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'emergencyExitCount', N'emergencyExitCount', N'No. of Emergency Exits', N'number', N'Fire Safety & Building Details', NULL, 1, 26, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'exitSignage', N'exitSignage', N'Exit Direction Signage Installed', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', 1, 27, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'routeMarking', N'routeMarking', N'Evacuation Route Marked', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 28, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'fireStaircaseAvailable', N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 29, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'musterPoint', N'musterPoint', N'Assembly / Muster Point Details', N'textarea', N'Fire Safety & Building Details', NULL, 0, 30, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'fireAlarmInstalled', N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 31, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'hydrantSprinklerInstalled', N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 32, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'earthingCertified', N'earthingCertified', N'Earthing System Certified?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 33, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'flammableMaterials', N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 34, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'flammableMaterialDetails', N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'textarea', N'Fire Safety & Building Details', NULL, 0, 35, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'buildingDetailsAsMap', N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'textarea', N'Fire Safety & Building Details', NULL, 1, 36, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 37, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'dateOfBirth', N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 1, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'gender', N'gender', N'Sex', N'select', N'Section 1 — Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', 1, 2, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childFirstName', N'childFirstName', N'Child First Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 3, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childMiddleName', N'childMiddleName', N'Child Middle Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 4, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childLastName', N'childLastName', N'Child Last Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 5, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childAadhaar', N'childAadhaar', N'Aadhaar No. (Optional)', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 6, 14, N'{"pattern":"^[0-9]{12}$|^[0-9]{4}-[0-9]{4}-[0-9]{4}$","maxLength":14}'),
    (N'Birth & Death', N'Birth Certificate', N'placeOfBirthType', N'placeOfBirthType', N'Place of Birth Type', N'select', N'Section 1 — Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', 1, 7, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'hospitalName', N'hospitalName', N'Hospital / Institution Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 8, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceAddress', N'birthPlaceAddress', N'Complete Birth Address', N'textarea', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 9, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceSubDistrict', N'birthPlaceSubDistrict', N'Sub-district', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 10, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceDistrict', N'birthPlaceDistrict', N'District', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 11, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceState', N'birthPlaceState', N'State / UT', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 12, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlacePinCode', N'birthPlacePinCode', N'PIN Code', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 13, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Birth Certificate', N'_registrar_header', N'_registrar_header', N'--- Registrar Details ---', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 14, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationNo', N'registrationNo', N'Registration No.', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 15, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationDate', N'registrationDate', N'Registration Date', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 16, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationUnit', N'registrationUnit', N'Registration Unit', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 17, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarTownVillage', N'registrarTownVillage', N'Town / Village', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 18, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarDistrict', N'registrarDistrict', N'District', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 19, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarSubDistrict', N'registrarSubDistrict', N'Sub-district', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 20, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarName', N'registrarName', N'Registrar Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 21, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarSignatureDate', N'registrarSignatureDate', N'Registrar Signature Date', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 22, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarRemarks', N'registrarRemarks', N'Remarks', N'textarea', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 23, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentHouseNo', N'permanentHouseNo', N'House No.', N'text', N'Section 2 — Address Information', NULL, 1, 24, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentLocality', N'permanentLocality', N'Locality', N'text', N'Section 2 — Address Information', NULL, 1, 25, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentWard', N'permanentWard', N'Ward No.', N'text', N'Section 2 — Address Information', NULL, 0, 26, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentTownVillage', N'permanentTownVillage', N'Town / Village', N'text', N'Section 2 — Address Information', NULL, 1, 27, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentSubDistrict', N'permanentSubDistrict', N'Sub-district', N'text', N'Section 2 — Address Information', NULL, 1, 28, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentDistrict', N'permanentDistrict', N'District', N'text', N'Section 2 — Address Information', NULL, 1, 29, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentState', N'permanentState', N'State / UT', N'text', N'Section 2 — Address Information', NULL, 1, 30, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentPinCode', N'permanentPinCode', N'PIN Code', N'text', N'Section 2 — Address Information', NULL, 1, 31, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Birth Certificate', N'permanentAddressProofType', N'permanentAddressProofType', N'Permanent Address Proof Type', N'select', N'Section 2 — Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', 1, 32, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'addressProofLast4Digits', N'addressProofLast4Digits', N'Last 4 Digits', N'text', N'Section 2 — Address Information', NULL, 1, 33, 4, N'{"pattern":"^[0-9]{4}$","maxLength":4}'),
    (N'Birth & Death', N'Birth Certificate', N'motherFirstName', N'motherFirstName', N'Mother First Name', N'text', N'Section 3 — Mother''s Information', NULL, 1, 34, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherMiddleName', N'motherMiddleName', N'Mother Middle Name', N'text', N'Section 3 — Mother''s Information', NULL, 0, 35, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherLastName', N'motherLastName', N'Mother Last Name', N'text', N'Section 3 — Mother''s Information', NULL, 0, 36, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherAadhaar', N'motherAadhaar', N'Mother Aadhaar No.', N'text', N'Section 3 — Mother''s Information', NULL, 0, 37, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherMobile', N'motherMobile', N'Mother Mobile No.', N'tel', N'Section 3 — Mother''s Information', NULL, 1, 38, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherEmail', N'motherEmail', N'Mother Email ID', N'email', N'Section 3 — Mother''s Information', NULL, 0, 39, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherAgeAtMarriage', N'motherAgeAtMarriage', N'Age at First Marriage', N'number', N'Section 3 — Mother''s Information', NULL, 1, 40, NULL, N'{"min":18,"max":100}'),
    (N'Birth & Death', N'Birth Certificate', N'motherAgeAtBirth', N'motherAgeAtBirth', N'Age at This Birth', N'number', N'Section 3 — Mother''s Information', NULL, 1, 41, NULL, N'{"min":15,"max":100}'),
    (N'Birth & Death', N'Birth Certificate', N'childrenBornAlive', N'childrenBornAlive', N'Children Born Alive', N'number', N'Section 3 — Mother''s Information', NULL, 1, 42, NULL, N'{"min":1,"max":30}'),
    (N'Birth & Death', N'Birth Certificate', N'fatherFirstName', N'fatherFirstName', N'Father First Name', N'text', N'Section 4 — Father''s Information', NULL, 1, 43, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherMiddleName', N'fatherMiddleName', N'Father Middle Name', N'text', N'Section 4 — Father''s Information', NULL, 0, 44, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherLastName', N'fatherLastName', N'Father Last Name', N'text', N'Section 4 — Father''s Information', NULL, 0, 45, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherAadhaar', N'fatherAadhaar', N'Father Aadhaar No.', N'text', N'Section 4 — Father''s Information', NULL, 0, 46, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherMobile', N'fatherMobile', N'Father Mobile No.', N'tel', N'Section 4 — Father''s Information', NULL, 1, 47, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherEmail', N'fatherEmail', N'Father Email ID', N'email', N'Section 4 — Father''s Information', NULL, 0, 48, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantFirstName', N'informantFirstName', N'Informant First Name', N'text', N'Section 5 — Informant Details', NULL, 1, 49, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantMiddleName', N'informantMiddleName', N'Informant Middle Name', N'text', N'Section 5 — Informant Details', NULL, 0, 50, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantLastName', N'informantLastName', N'Informant Last Name', N'text', N'Section 5 — Informant Details', NULL, 0, 51, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantMobile', N'informantMobile', N'Informant Mobile', N'tel', N'Section 5 — Informant Details', NULL, 1, 52, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantAddress', N'informantAddress', N'Informant Address', N'textarea', N'Section 5 — Informant Details', NULL, 1, 53, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'declarationAccuracy', N'declarationAccuracy', N'I confirm info is accurate', N'select', N'Section 5 — Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 54, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 55, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedFirstName', N'deceasedFirstName', N'Deceased First Name', N'text', N'Deceased Person Information', NULL, 1, 7, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedMiddleName', N'deceasedMiddleName', N'Deceased Middle Name', N'text', N'Deceased Person Information', NULL, 0, 8, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedLastName', N'deceasedLastName', N'Deceased Last Name', N'text', N'Deceased Person Information', NULL, 1, 9, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'dateOfDeath', N'dateOfDeath', N'Date of Death', N'date', N'Deceased Person Information', NULL, 1, 10, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'timeOfDeath', N'timeOfDeath', N'Time of Death', N'text', N'Deceased Person Information', NULL, 1, 11, NULL, N'{"pattern":"^([01]?[0-9]|2[0-3]):[0-5][0-9]$"}'),
    (N'Birth & Death', N'Death Certificate', N'age', N'age', N'Age at Death', N'number', N'Deceased Person Information', NULL, 1, 12, NULL, N'{"min":0,"max":150}'),
    (N'Birth & Death', N'Death Certificate', N'gender', N'gender', N'Gender', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 13, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathType', N'deathType', N'Type of Death', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', 1, 14, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathNature', N'deathNature', N'Nature of Death (If Accidental)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 15, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceHouseNo', N'incidentPlaceHouseNo', N'Incident House No.', N'text', N'Death Circumstance Details', NULL, 0, 16, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceLocality', N'incidentPlaceLocality', N'Incident Locality/Area', N'textarea', N'Death Circumstance Details', NULL, 0, 17, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceTown', N'incidentPlaceTown', N'Town/City', N'text', N'Death Circumstance Details', NULL, 0, 18, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceDistrict', N'incidentPlaceDistrict', N'District', N'text', N'Death Circumstance Details', NULL, 0, 19, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceState', N'incidentPlaceState', N'State', N'text', N'Death Circumstance Details', NULL, 0, 20, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlacePinCode', N'incidentPlacePinCode', N'PIN Code', N'text', N'Death Circumstance Details', NULL, 0, 21, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}')
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Birth & Death', N'Death Certificate', N'policeStation', N'policeStation', N'Police Station Name', N'text', N'Death Circumstance Details', NULL, 0, 22, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firCaseNumber', N'firCaseNumber', N'FIR / Case Number', N'text', N'Death Circumstance Details', NULL, 0, 23, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstTreatmentHospital', N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'text', N'Death Circumstance Details', NULL, 0, 24, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstTreatmentAddress', N'firstTreatmentAddress', N'First Treatment Hospital Address', N'textarea', N'Death Circumstance Details', NULL, 0, 25, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathDeclaredHospital', N'deathDeclaredHospital', N'Death Declared Hospital Name', N'text', N'Death Circumstance Details', NULL, 0, 26, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathDeclaredAddress', N'deathDeclaredAddress', N'Death Declared Hospital Address', N'textarea', N'Death Circumstance Details', NULL, 0, 27, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'placeOfDeathType', N'placeOfDeathType', N'Place of Death', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', 1, 28, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'hospitalName', N'hospitalName', N'Hospital/Institution Name', N'text', N'Place of Death', NULL, 0, 29, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathAddress', N'deathAddress', N'Complete Death Address', N'textarea', N'Place of Death', NULL, 1, 30, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathPinCode', N'deathPinCode', N'PIN Code', N'text', N'Place of Death', NULL, 0, 31, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Death Certificate', N'deactivateAadhaar', N'deactivateAadhaar', N'Aadhaar Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 32, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deactivatePAN', N'deactivatePAN', N'PAN Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 33, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'cancelPassport', N'cancelPassport', N'Passport Cancellation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 34, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deleteVoterID', N'deleteVoterID', N'Voter ID Deletion', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 35, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'terminatePension', N'terminatePension', N'Pension Account Termination', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 36, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'freezeBankAccount', N'freezeBankAccount', N'Bank Account Freeze Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 37, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deactivateSIM', N'deactivateSIM', N'SIM/Telecom Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 38, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'closeDigitalWallet', N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 39, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'notifyInsurance', N'notifyInsurance', N'Insurance Company Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 40, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'notifyLoanCredit', N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 41, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'digitalDeactivationConsent', N'digitalDeactivationConsent', N'Consent Declaration', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', 1, 42, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'addressVerifiedUsing', N'addressVerifiedUsing', N'Permanent Address Verified Using', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 43, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'verifiedByRegistrar', N'verifiedByRegistrar', N'Verified by Registrar', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', 0, 44, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 45, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'purpose', N'purpose', N'Purpose', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Giving Part Map', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Giving Part Map', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Giving Part Map', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'purpose', N'purpose', N'Purpose', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'partMapType', N'partMapType', N'Part Map Type', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'plotAreaSqm', N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'number', N'Ward / Zone & Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'ctsSurveyNo', N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'typeOfWork', N'typeOfWork', N'Type of Work', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'buildingUse', N'buildingUse', N'Building Use', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'proposedFloors', N'proposedFloors', N'Total Floors (Proposed)', N'number', N'Construction Proposal Details', NULL, 1, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'proposedBuiltUpAreaSqm', N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'number', N'Construction Proposal Details', NULL, 1, 17, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'hasBasementOrStilt', N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 18, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'buildingHeightM', N'buildingHeightM', N'Building Height (m) (if known)', N'number', N'Construction Proposal Details', NULL, 0, 19, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'briefWorkDescription', N'briefWorkDescription', N'Brief Description (optional)', N'textarea', N'Construction Proposal Details', NULL, 0, 20, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'submittedThroughLicensedPerson', N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 21, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectName', N'architectName', N'Architect/Engineer Name', N'text', N'Architect / Engineer Details', NULL, 1, 22, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectLicenseNo', N'architectLicenseNo', N'License / Registration No', N'text', N'Architect / Engineer Details', NULL, 1, 23, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectMobile', N'architectMobile', N'Mobile Number', N'text', N'Architect / Engineer Details', NULL, 1, 24, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectEmail', N'architectEmail', N'Email (optional)', N'text', N'Architect / Engineer Details', NULL, 0, 25, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 26, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'ocType', N'ocType', N'OC Type', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'buildingPermissionRefNo', N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'text', N'OC Request Details', NULL, 1, 14, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'completionDate', N'completionDate', N'Completion Date', N'date', N'OC Request Details', NULL, 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'totalFloorsConstructed', N'totalFloorsConstructed', N'Total Floors Constructed', N'number', N'OC Request Details', NULL, 1, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'totalBuiltUpAreaSqm', N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'number', N'OC Request Details', NULL, 1, 17, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'OC Request Details', NULL, 0, 18, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'submittedThroughLicensedPerson', N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 19, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectName', N'architectName', N'Architect/Engineer Name', N'text', N'Architect / Engineer Details', NULL, 0, 20, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectLicenseNo', N'architectLicenseNo', N'License / Registration No', N'text', N'Architect / Engineer Details', NULL, 0, 21, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectMobile', N'architectMobile', N'Mobile Number', N'text', N'Architect / Engineer Details', NULL, 0, 22, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectEmail', N'architectEmail', N'Email (optional)', N'text', N'Architect / Engineer Details', NULL, 0, 23, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 24, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'complainantFullName', N'complainantFullName', N'Full Name', N'text', N'Complainant Details', NULL, 1, 1, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Complainant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Complainant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'complainantAddress', N'complainantAddress', N'Address (optional)', N'textarea', N'Complainant Details', NULL, 0, 4, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'wardId', N'wardId', N'Ward', N'select', N'Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'zoneId', N'zoneId', N'Zone', N'select', N'Location Details', N'[]', 1, 6, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'areaName', N'areaName', N'Area / Locality', N'text', N'Location Details', NULL, 1, 7, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Location Details', NULL, 1, 8, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'landmark', N'landmark', N'Landmark', N'text', N'Location Details', NULL, 1, 9, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Location Details', NULL, 0, 10, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'coverType', N'coverType', N'Cover Type', N'select', N'Issue Details', N'[{"value":"manhole","label":{"en":"Manhole Cover","hi":"मॅनहोल कव्हर","mr":"मॅनहोल कव्हर"}},{"value":"sewer","label":{"en":"Sewer Cover","hi":"सीवर कव्हर","mr":"सीवर कव्हर"}},{"value":"storm_water","label":{"en":"Storm Water Cover","hi":"स्टॉर्म वॉटर कव्हर","mr":"स्टॉर्म वॉटर कव्हर"}}]', 1, 11, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'issueType', N'issueType', N'Issue Type', N'select', N'Issue Details', N'[{"value":"missing","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब"}},{"value":"broken","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले"}},{"value":"loose","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल"}},{"value":"sunken","label":{"en":"Cover Sunken (Level mismatch)","hi":"कव्हर खाली बसले","mr":"कव्हर खाली बसले"}},{"value":"open","label":{"en":"Chamber Open","hi":"चेंबर उघडे","mr":"चेंबर उघडे"}},{"value":"noise","label":{"en":"Noise / Vibration","hi":"आवाज/कंपन","mr":"आवाज/कंपन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Issue Details', N'[{"value":"high","label":{"en":"High (Accident risk)","hi":"उच्च (अपघाताचा धोका)","mr":"उच्च (अपघाताचा धोका)"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}}]', 1, 13, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'issueDescription', N'issueDescription', N'Issue Description', N'textarea', N'Issue Details', NULL, 1, 14, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 15, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'relationshipToStudent', N'relationshipToStudent', N'Relationship to Student', N'select', N'Applicant Information', N'[{"value":"self","label":{"en":"Self (Student)","hi":"स्वयं (छात्र)","mr":"स्वतः (विद्यार्थी)"}},{"value":"parent","label":{"en":"Parent","hi":"अभिभावक","mr":"पालक"}},{"value":"guardian","label":{"en":"Guardian","hi":"संरक्षक","mr":"संरक्षक"}}]', 1, 7, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'guardianFullName', N'guardianFullName', N'Parent/Guardian Full Name', N'text', N'Applicant Information', NULL, 1, 8, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'rollNumber', N'rollNumber', N'Roll Number', N'text', N'Student Details', NULL, 0, 9, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'studentName', N'studentName', N'Student Full Name', N'text', N'Student Details', NULL, 1, 10, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'dateOfBirth', N'dateOfBirth', N'Date of Birth', N'date', N'Student Details', NULL, 1, 11, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'gender', N'gender', N'Gender', N'select', N'Student Details', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'motherName', N'motherName', N'Mother''s Name', N'text', N'Student Details', NULL, 1, 13, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'fatherName', N'fatherName', N'Father''s Name', N'text', N'Student Details', NULL, 1, 14, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'aadharLast4', N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'text', N'Student Details', NULL, 0, 15, 4, N'{"maxLength":4}'),
    (N'Education', N'School Leaving / Duplicate Certificate', N'schoolName', N'schoolName', N'School Name', N'text', N'School Details', NULL, 1, 16, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastStandardStudied', N'lastStandardStudied', N'Last Standard/Class Studied', N'text', N'School Details', NULL, 1, 17, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'yearOfLeaving', N'yearOfLeaving', N'Year of Leaving', N'text', N'School Details', NULL, 1, 18, 4, N'{"maxLength":4}'),
    (N'Education', N'School Leaving / Duplicate Certificate', N'certificateType', N'certificateType', N'Certificate Type', N'select', N'School Details', N'[{"value":"leaving","label":{"en":"Leaving Certificate","hi":"लीविंग प्रमाणपत्र","mr":"शाळा सोडल्याचा दाखला"}},{"value":"duplicate","label":{"en":"Duplicate Certificate","hi":"डुप्लिकेट प्रमाणपत्र","mr":"डुप्लिकेट प्रमाणपत्र"}},{"value":"migration","label":{"en":"Migration Certificate","hi":"स्थानांतरण प्रमाणपत्र","mr":"स्थलांतर प्रमाणपत्र"}}]', 1, 19, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastAttendanceDate', N'lastAttendanceDate', N'Last Attendance Date', N'date', N'School Details', NULL, 0, 20, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'boardOrUniversity', N'boardOrUniversity', N'Board / University', N'text', N'School Details', NULL, 0, 21, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'reasonForLeaving', N'reasonForLeaving', N'Reason for Leaving', N'select', N'Certificate Details', N'[{"value":"transfer","label":{"en":"Transfer","hi":"स्थानांतरण","mr":"बदली"}},{"value":"higherStudies","label":{"en":"Higher Studies","hi":"उच्च शिक्षा","mr":"उच्च शिक्षण"}},{"value":"familyShift","label":{"en":"Family Shift","hi":"परिवार स्थानांतरण","mr":"कुटुंब स्थलांतर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 22, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'pendingDuesCleared', N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 23, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'duplicateReason', N'duplicateReason', N'Reason for Duplicate', N'select', N'Certificate Details', N'[{"value":"lost","label":{"en":"Lost","hi":"खो गया","mr":"हरवले"}},{"value":"damaged","label":{"en":"Damaged","hi":"क्षतिग्रस्त","mr":"खराब झाले"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"गुम हो गया","mr":"ठेवले तेथे सापडत नाही"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 24, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'originalCertificateNumber', N'originalCertificateNumber', N'Original Certificate No. (if known)', N'text', N'Certificate Details', NULL, 0, 25, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'policeComplaintFiled', N'policeComplaintFiled', N'Police Complaint Filed?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 26, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'affidavitProvided', N'affidavitProvided', N'Affidavit Provided?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 27, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastExamPassed', N'lastExamPassed', N'Last Exam Passed', N'text', N'Certificate Details', NULL, 0, 28, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'seatOrRegNo', N'seatOrRegNo', N'Seat No / Registration No', N'text', N'Certificate Details', NULL, 0, 29, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'destinationInstituteName', N'destinationInstituteName', N'Destination Institute (optional)', N'text', N'Certificate Details', NULL, 0, 30, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 31, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 2, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 4, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantAddress', N'applicantAddress', N'Address (optional)', N'textarea', N'Applicant Details', NULL, 0, 5, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 1, 6, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 7, 20, N'{"maxLength":20}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 8, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Location / Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Location / Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Location / Property Details', N'[]', 0, 11, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Location / Property Details', NULL, 0, 12, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Address (Auto)', N'textarea', N'Location / Property Details', NULL, 0, 13, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'areaName', N'areaName', N'Area / Locality', N'text', N'Location / Property Details', NULL, 0, 14, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Location / Property Details', NULL, 0, 15, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'landmark', N'landmark', N'Landmark', N'text', N'Location / Property Details', NULL, 0, 16, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Location / Property Details', NULL, 0, 17, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'actionRequested', N'actionRequested', N'What do you want to do?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', 1, 18, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'noOfTrees', N'noOfTrees', N'How many trees?', N'number', N'Tree Request Details', NULL, 1, 19, NULL, N'{"min":1}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'treeLocationType', N'treeLocationType', N'Where is the tree located?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 20, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'reasonCategory', N'reasonCategory', N'Reason', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 21, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'isImmediateDanger', N'isImmediateDanger', N'Is it an emergency danger?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 22, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'dangerExplanation', N'dangerExplanation', N'Explain the danger (if yes)', N'textarea', N'Tree Request Details', NULL, 0, 23, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'treeDetails', N'treeDetails', N'Tree Details', N'textarea', N'Tree Request Details', NULL, 1, 24, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 25, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'organizationName', N'organizationName', N'Organization / Company Name', N'text', N'Applicant / Organization Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'authorizedSignatoryName', N'authorizedSignatoryName', N'Authorized Signatory Name', N'text', N'Applicant / Organization Details', NULL, 1, 3, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant / Organization Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'email', N'email', N'Email (recommended)', N'text', N'Applicant / Organization Details', NULL, 0, 5, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'officeAddress', N'officeAddress', N'Office Address', N'textarea', N'Applicant / Organization Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'licenseOrRegistrationNo', N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'text', N'Applicant / Organization Details', NULL, 0, 7, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'gstNo', N'gstNo', N'GST No (if any)', N'text', N'Applicant / Organization Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'wardId', N'wardId', N'Ward', N'select', N'Work Location Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'zoneId', N'zoneId', N'Zone', N'select', N'Work Location Details', N'[]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'workAreaType', N'workAreaType', N'Work Area Type', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 11, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Work Location Details', NULL, 1, 12, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'fromLocation', N'fromLocation', N'From Location', N'text', N'Work Location Details', NULL, 1, 13, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'toLocation', N'toLocation', N'To Location', N'text', N'Work Location Details', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'landmark', N'landmark', N'Landmark (optional)', N'text', N'Work Location Details', NULL, 0, 15, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'totalRouteLengthMeters', N'totalRouteLengthMeters', N'Total Route Length (meters)', N'number', N'Work Location Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'methodOfLaying', N'methodOfLaying', N'Method of Laying', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trenchWidthCm', N'trenchWidthCm', N'Trench Width (cm)', N'number', N'Excavation / Laying Details', NULL, 0, 18, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trenchDepthCm', N'trenchDepthCm', N'Trench Depth (cm)', N'number', N'Excavation / Laying Details', NULL, 0, 19, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'roadCrossingsCount', N'roadCrossingsCount', N'No. of Road Crossings', N'number', N'Excavation / Laying Details', NULL, 1, 20, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'ductPipeSize', N'ductPipeSize', N'Duct / HDPE Pipe Size', N'text', N'Excavation / Laying Details', NULL, 1, 21, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'noOfDucts', N'noOfDucts', N'No. of Ducts (optional)', N'number', N'Excavation / Laying Details', NULL, 0, 22, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'handholesChambersCount', N'handholesChambersCount', N'Handholes / Chambers (optional)', N'number', N'Excavation / Laying Details', NULL, 0, 23, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'expectedStartDate', N'expectedStartDate', N'Expected Start Date', N'date', N'Excavation / Laying Details', NULL, 1, 24, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'expectedEndDate', N'expectedEndDate', N'Expected End Date', N'date', N'Excavation / Laying Details', NULL, 1, 25, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trafficManagementRequired', N'trafficManagementRequired', N'Traffic Management Required?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 26, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Town Planning', N'Underground OFC Cable Permission', N'barricadingAndSafety', N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', 1, 27, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'restorationResponsibility', N'restorationResponsibility', N'Restoration Responsibility', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'restorationType', N'restorationType', N'Restoration Type', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 29, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'undertakingConsent', N'undertakingConsent', N'Undertaking / Indemnity Consent', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', 1, 30, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 31, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant / Company Details', N'[{"value":"telecom_operator","label":{"en":"Telecom Operator","hi":"टेलिकॉम ऑपरेटर","mr":"टेलिकॉम ऑपरेटर"}},{"value":"tower_infra","label":{"en":"Tower Infrastructure Company","hi":"टॉवर इन्फ्रा कंपनी","mr":"टॉवर इन्फ्रा कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'companyName', N'companyName', N'Company / Organization Name', N'text', N'Applicant / Company Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'authorizedSignatoryName', N'authorizedSignatoryName', N'Authorized Signatory Name', N'text', N'Applicant / Company Details', NULL, 1, 3, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant / Company Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Mobile Tower Permission', N'email', N'email', N'Email', N'text', N'Applicant / Company Details', NULL, 1, 5, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'officeAddress', N'officeAddress', N'Office Address', N'textarea', N'Applicant / Company Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'dotLicenseOrRegNo', N'dotLicenseOrRegNo', N'DoT/License/Registration No (if any)', N'text', N'Applicant / Company Details', NULL, 0, 7, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Mobile Tower Permission', N'gstNo', N'gstNo', N'GST No (optional)', N'text', N'Applicant / Company Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Mobile Tower Permission', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Site / Property Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Site / Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Site / Property Details', N'[]', 0, 11, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Site / Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Site / Property Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'siteType', N'siteType', N'Site Type', N'select', N'Site / Property Details', N'[{"value":"rooftop","label":{"en":"Rooftop (Terrace)","hi":"रूफटॉप (टेरेस)","mr":"रूफटॉप (टेरेस)"}},{"value":"ground_base","label":{"en":"Ground Base","hi":"ग्राउंड बेस","mr":"ग्राउंड बेस"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'buildingUse', N'buildingUse', N'Building Use (optional)', N'select', N'Site / Property Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"मिश्र"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 15, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'totalFloorsInBuilding', N'totalFloorsInBuilding', N'Total Floors in Building (optional)', N'number', N'Site / Property Details', NULL, 0, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Mobile Tower Permission', N'towerType', N'towerType', N'Tower Type', N'select', N'Tower / Equipment Details', N'[{"value":"rooftop_pole","label":{"en":"Rooftop Pole","hi":"रूफटॉप पोल","mr":"रूफटॉप पोल"}},{"value":"rooftop_tower","label":{"en":"Rooftop Tower","hi":"रूफटॉप टॉवर","mr":"रूफटॉप टॉवर"}},{"value":"ground_base_tower","label":{"en":"Ground Base Tower","hi":"ग्राउंड बेस टॉवर","mr":"ग्राउंड बेस टॉवर"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'towerHeightMeters', N'towerHeightMeters', N'Tower Height (meters)', N'number', N'Tower / Equipment Details', NULL, 1, 18, NULL, N'{"min":1}'),
    (N'Town Planning', N'Mobile Tower Permission', N'antennaCount', N'antennaCount', N'No. of Antennas', N'number', N'Tower / Equipment Details', NULL, 1, 19, NULL, N'{"min":1}'),
    (N'Town Planning', N'Mobile Tower Permission', N'dgSetAvailable', N'dgSetAvailable', N'DG Set Available?', N'select', N'Tower / Equipment Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 20, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'dgCapacityKva', N'dgCapacityKva', N'DG Capacity (kVA)', N'number', N'Tower / Equipment Details', NULL, 0, 21, NULL, N'{"min":0}'),
    (N'Town Planning', N'Mobile Tower Permission', N'equipmentRoomAvailable', N'equipmentRoomAvailable', N'Equipment/Shelter Room?', N'select', N'Tower / Equipment Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 22, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'proposedInstallationDate', N'proposedInstallationDate', N'Proposed Installation Date (optional)', N'date', N'Tower / Equipment Details', NULL, 0, 23, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'structuralSafetyCertificateAvailable', N'structuralSafetyCertificateAvailable', N'Structural Safety Certificate Available?', N'select', N'Safety / Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 24, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fireNocApplicable', N'fireNocApplicable', N'Fire NOC Applicable?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 25, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'sacfaClearanceAvailable', N'sacfaClearanceAvailable', N'SACFA Clearance Available?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 26, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'aaiNocApplicable', N'aaiNocApplicable', N'AAI/Airport NOC Applicable?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 27, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'nearSchoolHospital', N'nearSchoolHospital', N'Is there a School/Hospital within 100m?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Safety / Compliance', NULL, 0, 29, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 30, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'citizenFullName', N'citizenFullName', N'Full Name', N'text', N'Citizen Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Citizen Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Citizen Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'wardId', N'wardId', N'Ward', N'select', N'Pothole Location Details', N'[]', 1, 4, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'zoneId', N'zoneId', N'Zone', N'select', N'Pothole Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'areaName', N'areaName', N'Area / Locality', N'text', N'Pothole Location Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Pothole Location Details', NULL, 1, 7, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'landmark', N'landmark', N'Landmark', N'text', N'Pothole Location Details', NULL, 1, 8, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'fromLocation', N'fromLocation', N'From (optional)', N'text', N'Pothole Location Details', NULL, 0, 9, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'toLocation', N'toLocation', N'To (optional)', N'text', N'Pothole Location Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Pothole Location Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'potholeCount', N'potholeCount', N'Number of Potholes', N'number', N'Pothole Details', NULL, 1, 12, NULL, N'{"min":1}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'potholeSize', N'potholeSize', N'Pothole Size', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'accidentOrDamage', N'accidentOrDamage', N'Any accident/vehicle damage?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 15, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Pothole Details', NULL, 0, 16, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 17, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'citizenFullName', N'citizenFullName', N'Full Name', N'text', N'Citizen Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Citizen Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Citizen Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'wardId', N'wardId', N'Ward', N'select', N'Sewer Cover Location Details', N'[]', 1, 4, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'zoneId', N'zoneId', N'Zone', N'select', N'Sewer Cover Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'areaName', N'areaName', N'Area / Locality', N'text', N'Sewer Cover Location Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Sewer Cover Location Details', NULL, 1, 7, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'landmark', N'landmark', N'Landmark', N'text', N'Sewer Cover Location Details', NULL, 1, 8, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Sewer Cover Location Details', NULL, 0, 9, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'issueType', N'issueType', N'Issue Type', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', 1, 11, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'coverCount', N'coverCount', N'Number of Covers', N'number', N'Sewer Cover Issue Details', NULL, 1, 12, NULL, N'{"min":1}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Sewer Cover Issue Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant Details', N'[{"value":"citizen","label":{"en":"Citizen","hi":"नागरिक","mr":"नागरिक"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"utility_company","label":{"en":"Utility Company","hi":"युटिलिटी कंपनी","mr":"युटिलिटी कंपनी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantNameOrCompany', N'applicantNameOrCompany', N'Applicant / Company Name', N'text', N'Applicant Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'authorizedPersonName', N'authorizedPersonName', N'Authorized Person Name (if applicable)', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Road Cutting Permission', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 5, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantAddress', N'applicantAddress', N'Address', N'textarea', N'Applicant Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'idProofType', N'idProofType', N'ID Proof Type (for citizen)', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 0, 7, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'idProofNumber', N'idProofNumber', N'ID Proof Number (for citizen)', N'text', N'Applicant Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Road Cutting Permission', N'wardId', N'wardId', N'Ward', N'select', N'Work Location Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'zoneId', N'zoneId', N'Zone', N'select', N'Work Location Details', N'[]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Work Location Details', NULL, 1, 11, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'fromLocation', N'fromLocation', N'From Location', N'text', N'Work Location Details', NULL, 1, 12, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'toLocation', N'toLocation', N'To Location', N'text', N'Work Location Details', NULL, 1, 13, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'landmark', N'landmark', N'Landmark', N'text', N'Work Location Details', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'totalLengthMeters', N'totalLengthMeters', N'Total Length (meters)', N'number', N'Work Location Details', NULL, 1, 15, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Work Location Details', NULL, 0, 16, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'purpose', N'purpose', N'Purpose / Reason', N'select', N'Road Cutting Details', N'[{"value":"water_connection","label":{"en":"Water Connection","hi":"पाणी कनेक्शन","mr":"पाणी कनेक्शन"}},{"value":"sewer_connection","label":{"en":"Sewer/Drainage Connection","hi":"ड्रेनेज कनेक्शन","mr":"ड्रेनेज कनेक्शन"}},{"value":"electric_cable","label":{"en":"Electric Cable","hi":"विद्युत केबल","mr":"विद्युत केबल"}},{"value":"gas_pipeline","label":{"en":"Gas Pipeline","hi":"गॅस लाईन","mr":"गॅस लाईन"}},{"value":"ofc","label":{"en":"OFC / Telecom Cable","hi":"OFC / टेलिकॉम","mr":"OFC / टेलिकॉम"}},{"value":"repair","label":{"en":"Repair / Maintenance","hi":"दुरुस्ती","mr":"दुरुस्ती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'excavationMethod', N'excavationMethod', N'Method', N'select', N'Road Cutting Details', N'[{"value":"open_trench","label":{"en":"Open Trench","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"HDD (बोरिंग)","mr":"HDD (बोरिंग)"}},{"value":"micro_trench","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}}]', 1, 18, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'surfaceType', N'surfaceType', N'Surface Type', N'select', N'Road Cutting Details', N'[{"value":"asphalt","label":{"en":"Asphalt (Tar)","hi":"डांबर","mr":"डांबर"}},{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 19, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'cuttingWidthCm', N'cuttingWidthCm', N'Cutting Width (cm)', N'number', N'Road Cutting Details', NULL, 1, 20, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'cuttingDepthCm', N'cuttingDepthCm', N'Cutting Depth (cm)', N'number', N'Road Cutting Details', NULL, 1, 21, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'roadCrossingsCount', N'roadCrossingsCount', N'No. of Road Crossings (optional)', N'number', N'Road Cutting Details', NULL, 0, 22, NULL, N'{"min":0}'),
    (N'Town Planning', N'Road Cutting Permission', N'expectedStartDate', N'expectedStartDate', N'Expected Start Date', N'date', N'Road Cutting Details', NULL, 1, 23, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'expectedEndDate', N'expectedEndDate', N'Expected End Date', N'date', N'Road Cutting Details', NULL, 1, 24, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'trafficManagementRequired', N'trafficManagementRequired', N'Traffic Management Required?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 25, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'barricadingAndSafety', N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', 1, 26, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'restorationResponsibility', N'restorationResponsibility', N'Restoration Responsibility', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', 1, 27, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'restorationType', N'restorationType', N'Restoration Type', N'select', N'Safety & Restoration', N'[{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'undertakingConsent', N'undertakingConsent', N'Undertaking / Indemnity Consent', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', 1, 29, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 30, NULL, NULL),

    -- Health: New Nursing Home License (and alternate name)
    (N'Health', N'New Nursing Home License', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'New Nursing Home License', N'email', N'email', N'Email', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'nursingHomeName', N'nursingHomeName', N'Nursing Home Name', N'text', N'Nursing Home Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'nursingHomeAddress', N'nursingHomeAddress', N'Nursing Home Address', N'textarea', N'Nursing Home Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'wardId', N'wardId', N'Ward', N'select', N'Nursing Home Details', N'[]', 1, 6, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'zoneId', N'zoneId', N'Zone', N'select', N'Nursing Home Details', N'[]', 1, 7, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'doctorName', N'doctorName', N'Chief Medical Officer / Doctor Name', N'text', N'Medical Staff Details', NULL, 1, 8, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'doctorRegNo', N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'text', N'Medical Staff Details', NULL, 1, 9, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'totalBeds', N'totalBeds', N'Total Bed Capacity', N'number', N'Facility Details', NULL, 1, 10, NULL, N'{"min":1}'),
    (N'Health', N'New Nursing Home License', N'bmwClearanceNo', N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'text', N'Compliance Details', NULL, 1, 11, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'fireNocNo', N'fireNocNo', N'Fire Safety NOC Number', N'text', N'Compliance Details', NULL, 1, 12, NULL, NULL),
    (N'Health', N'New Nursing Home License', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 13, NULL, NULL),

    (N'Health', N'Nursing home license under Registration Act, 1949', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'email', N'email', N'Email', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'nursingHomeName', N'nursingHomeName', N'Nursing Home Name', N'text', N'Nursing Home Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'nursingHomeAddress', N'nursingHomeAddress', N'Nursing Home Address', N'textarea', N'Nursing Home Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'wardId', N'wardId', N'Ward', N'select', N'Nursing Home Details', N'[]', 1, 6, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'zoneId', N'zoneId', N'Zone', N'select', N'Nursing Home Details', N'[]', 1, 7, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'doctorName', N'doctorName', N'Chief Medical Officer / Doctor Name', N'text', N'Medical Staff Details', NULL, 1, 8, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'doctorRegNo', N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'text', N'Medical Staff Details', NULL, 1, 9, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'totalBeds', N'totalBeds', N'Total Bed Capacity', N'number', N'Facility Details', NULL, 1, 10, NULL, N'{"min":1}'),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'bmwClearanceNo', N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'text', N'Compliance Details', NULL, 1, 11, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'fireNocNo', N'fireNocNo', N'Fire Safety NOC Number', N'text', N'Compliance Details', NULL, 1, 12, NULL, NULL),
    (N'Health', N'Nursing home license under Registration Act, 1949', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 13, NULL, NULL),

    -- Health: Renew Nursing Home License (and alternate name)
    (N'Health', N'Renew Nursing Home License', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'Renew Nursing Home License', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'Renew Nursing Home License', N'existingLicenseNo', N'existingLicenseNo', N'Existing License Number', N'text', N'License Details', NULL, 1, 3, NULL, NULL),
    (N'Health', N'Renew Nursing Home License', N'licenseExpiryDate', N'licenseExpiryDate', N'License Expiry Date', N'date', N'License Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'Renew Nursing Home License', N'nursingHomeName', N'nursingHomeName', N'Nursing Home Name', N'text', N'Nursing Home Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'Renew Nursing Home License', N'wardId', N'wardId', N'Ward', N'select', N'Nursing Home Details', N'[]', 1, 6, NULL, NULL),
    (N'Health', N'Renew Nursing Home License', N'totalBeds', N'totalBeds', N'Total Bed Capacity', N'number', N'Facility Details', NULL, 1, 7, NULL, N'{"min":1}'),
    (N'Health', N'Renew Nursing Home License', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 8, NULL, NULL),

    (N'Health', N'Renewal of nursing home license', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'Renewal of nursing home license', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'Renewal of nursing home license', N'existingLicenseNo', N'existingLicenseNo', N'Existing License Number', N'text', N'License Details', NULL, 1, 3, NULL, NULL),
    (N'Health', N'Renewal of nursing home license', N'licenseExpiryDate', N'licenseExpiryDate', N'License Expiry Date', N'date', N'License Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'Renewal of nursing home license', N'nursingHomeName', N'nursingHomeName', N'Nursing Home Name', N'text', N'Nursing Home Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'Renewal of nursing home license', N'wardId', N'wardId', N'Ward', N'select', N'Nursing Home Details', N'[]', 1, 6, NULL, NULL),
    (N'Health', N'Renewal of nursing home license', N'totalBeds', N'totalBeds', N'Total Bed Capacity', N'number', N'Facility Details', NULL, 1, 7, NULL, N'{"min":1}'),
    (N'Health', N'Renewal of nursing home license', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 8, NULL, NULL),

    -- Health: Update Licensee / Partner Name (and alternate name)
    (N'Health', N'Update Licensee / Partner Name', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'Update Licensee / Partner Name', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'Update Licensee / Partner Name', N'existingLicenseNo', N'existingLicenseNo', N'Existing License Number', N'text', N'License Details', NULL, 1, 3, NULL, NULL),
    (N'Health', N'Update Licensee / Partner Name', N'currentHolderName', N'currentHolderName', N'Current License Holder Name', N'text', N'License Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'Update Licensee / Partner Name', N'proposedHolderName', N'proposedHolderName', N'Proposed New Holder / Partner Name', N'text', N'Update Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'Update Licensee / Partner Name', N'reasonForChange', N'reasonForChange', N'Reason for Change', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', 1, 6, NULL, NULL),
    (N'Health', N'Update Licensee / Partner Name', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 7, NULL, NULL),

    (N'Health', N'Change of nursing home license holder / partner name', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Health', N'Change of nursing home license holder / partner name', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Health', N'Change of nursing home license holder / partner name', N'existingLicenseNo', N'existingLicenseNo', N'Existing License Number', N'text', N'License Details', NULL, 1, 3, NULL, NULL),
    (N'Health', N'Change of nursing home license holder / partner name', N'currentHolderName', N'currentHolderName', N'Current License Holder Name', N'text', N'License Details', NULL, 1, 4, NULL, NULL),
    (N'Health', N'Change of nursing home license holder / partner name', N'proposedHolderName', N'proposedHolderName', N'Proposed New Holder / Partner Name', N'text', N'Update Details', NULL, 1, 5, NULL, NULL),
    (N'Health', N'Change of nursing home license holder / partner name', N'reasonForChange', N'reasonForChange', N'Reason for Change', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', 1, 6, NULL, NULL),
    (N'Health', N'Change of nursing home license holder / partner name', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 7, NULL, NULL),

    -- Town Planning: Tillage Certificate & Plinth Certificate
    (N'Town Planning', N'Tillage Certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Tillage Certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Property Details', N'[]', 1, 3, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Property Details', N'[]', 0, 4, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Property Details', N'[]', 0, 5, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'surveyNo', N'surveyNo', N'Land Survey / Gut Number', N'text', N'Land Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'areaInHectares', N'areaInHectares', N'Total Land Area (in Hectares/Sqm)', N'number', N'Land Details', NULL, 1, 7, NULL, N'{"min":0}'),
    (N'Town Planning', N'Tillage Certificate', N'purpose', N'purpose', N'Purpose of Measurement', N'select', N'Request Details', N'[{"value":"boundary","label":{"en":"Boundary Fixation","hi":"सीमा निश्चिती","mr":"हद्द निश्चिती"}},{"value":"division","label":{"en":"Land Sub-division","hi":"जमीन विभागणी","mr":"जमीन तुकडेबंदी/विभागणी"}},{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 8, NULL, NULL),
    (N'Town Planning', N'Tillage Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 9, NULL, NULL),

    (N'Town Planning', N'Issuance of plinth certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of plinth certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Property Details', N'[]', 1, 3, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Property Details', N'[]', 0, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Property Details', N'[]', 0, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'buildingPermitRefNo', N'buildingPermitRefNo', N'Sanctioned Building Permit Ref No', N'text', N'Permit Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'architectName', N'architectName', N'Licensed Architect Name', N'text', N'Architect Details', NULL, 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of plinth certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 8, NULL, NULL),

    -- Sanitation: Maintaining cleanliness
    (N'Sanitation', N'Maintaining cleanliness', N'complainantFullName', N'complainantFullName', N'Full Name', N'text', N'Complainant Details', NULL, 1, 1, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Complainant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Maintaining cleanliness', N'wardId', N'wardId', N'Ward', N'select', N'Location Details', N'[]', 1, 3, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'zoneId', N'zoneId', N'Zone', N'select', N'Location Details', N'[]', 1, 4, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'areaName', N'areaName', N'Area / Locality', N'text', N'Location Details', NULL, 1, 5, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'landmark', N'landmark', N'Landmark', N'text', N'Location Details', NULL, 1, 6, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'cleanlinessIssueType', N'cleanlinessIssueType', N'Cleanliness Issue Type', N'select', N'Complaint Details', N'[{"value":"garbage","label":{"en":"Garbage Accumulation","hi":"कचरा साचणे","mr":"कचरा साचणे"}},{"value":"open_dumping","label":{"en":"Open Dumping","hi":"उघड्यावर कचरा","mr":"उघड्यावर कचरा टाकणे"}},{"value":"drainage_overflow","label":{"en":"Drainage Overflow","hi":"ड्रेनेज ओव्हरफ्लो","mr":"ड्रेनेज ओव्हरफ्लो"}},{"value":"sweeping_req","label":{"en":"Street Sweeping Required","hi":"रस्ता सफाई आवश्यक","mr":"रस्ता सफाई आवश्यक"}}]', 1, 7, NULL, NULL),
    (N'Sanitation', N'Maintaining cleanliness', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 8, NULL, NULL)


    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder],
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder,
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

-- =========================================================
-- RTS Document Upload Fields Seed Data (file inputs)
-- =========================================================
;WITH SeedDocumentFields AS (
    SELECT * FROM (VALUES
        -- Marriage Registration Certificate Document Uploads
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAgeProofDoc', N'Groom Age Proof Document', N'file', N'Document Uploads', 1, 50),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAgeProofDoc', N'Bride Age Proof Document', N'file', N'Document Uploads', 1, 51),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'weddingInvitationDoc', N'Wedding Invitation Card', N'file', N'Document Uploads', 0, 52),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1IdProofDoc', N'Witness 1 ID Proof', N'file', N'Document Uploads', 1, 53),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2IdProofDoc', N'Witness 2 ID Proof', N'file', N'Document Uploads', 1, 54),
        -- Birth Certificate Document Uploads
        (N'Birth & Death',        N'Birth Certificate',                 N'dischargeCardDoc', N'Hospital Discharge Card', N'file', N'Document Uploads', 1, 56),
        (N'Birth & Death',        N'Birth Certificate',                 N'informantIdDoc', N'Informant ID Proof', N'file', N'Document Uploads', 1, 57),
        -- Death Certificate Document Uploads
        (N'Birth & Death',        N'Death Certificate',                 N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'file', N'Document Uploads', 1, 58),
        (N'Birth & Death',        N'Death Certificate',                 N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'file', N'Document Uploads', 1, 59),
        -- Education Document Uploads
        (N'Education',            N'School Leaving / Duplicate Certificate', N'studentIdDoc', N'Student ID Proof / Aadhaar', N'file', N'Document Uploads', 1, 50),
        (N'Education',            N'School Leaving / Duplicate Certificate', N'previousMarksheetDoc', N'Previous Class Marksheet', N'file', N'Document Uploads', 0, 51),
        -- Health Document Uploads
        (N'Health',               N'New Nursing Home License',           N'doctorDegreeDoc', N'Chief Doctor MMC / Degree Certificate', N'file', N'Document Uploads', 1, 50),
        (N'Health',               N'New Nursing Home License',           N'fireNocDoc', N'Fire Safety NOC Document', N'file', N'Document Uploads', 1, 51),
        (N'Health',               N'New Nursing Home License',           N'bmwAgreementDoc', N'Bio Medical Waste Disposal Agreement', N'file', N'Document Uploads', 1, 52),
        (N'Health',               N'Renew Nursing Home License',         N'oldLicenseDoc', N'Previous Nursing Home License Copy', N'file', N'Document Uploads', 1, 50),
        (N'Health',               N'Renew Nursing Home License',         N'fireNocDoc', N'Valid Fire Safety NOC', N'file', N'Document Uploads', 1, 51),
        (N'Health',               N'Update Licensee / Partner Name',     N'transferAgreementDoc', N'Transfer Agreement / Partnership Deed', N'file', N'Document Uploads', 1, 50),
        (N'Health',               N'Update Licensee / Partner Name',     N'newHolderIdDoc', N'ID Proof of New License Holder', N'file', N'Document Uploads', 1, 51),
        -- NOC Document Uploads
        (N'NOC',                  N'Trade / Business Non-Revocation NOC', N'applicantIdDoc', N'Applicant ID Proof', N'file', N'Document Uploads', 1, 50),
        (N'NOC',                  N'Trade / Business Non-Revocation NOC', N'propertyTaxDoc', N'Property Tax Receipt Document', N'file', N'Document Uploads', 1, 51),
        (N'NOC',                  N'Mandap No-Damage Certificate',       N'mandapLayoutDoc', N'Mandap Site Layout Diagram', N'file', N'Document Uploads', 1, 50),
        (N'NOC',                  N'Fire Extinguisher Certificate',      N'equipmentInvoiceDoc', N'Fire Equipment Purchase / Inspection Receipt', N'file', N'Document Uploads', 1, 50),
        (N'NOC',                  N'Final Fire Exemption Certificate',   N'fireSafetyBlueprintDoc', N'Approved Fire Safety Blueprint', N'file', N'Document Uploads', 1, 50),
        -- Town Planning Document Uploads
        (N'Town Planning',        N'Issuance of Zone Certificate',       N'ownershipDoc', N'Property 7/12 Extract / Ownership Proof', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Giving Part Map',                    N'propertyTaxDoc', N'Latest Property Tax Receipt', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Issuance of Construction Permit',    N'buildingPlanDoc', N'Sanctioned Building Plan Blueprint', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Issuance of Construction Permit',    N'architectCertDoc', N'Licensed Architect Structural Certificate', N'file', N'Document Uploads', 1, 51),
        (N'Town Planning',        N'Tillage Certificate',                N'land712Doc', N'Land 7/12 Extract / Record of Rights', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Issuance of Occupancy Certificate',  N'architectCompletionDoc', N'Architect Completion Certificate', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Issuance of Occupancy Certificate',  N'structuralSafetyDoc', N'Structural Stability Certificate', N'file', N'Document Uploads', 1, 51),
        (N'Town Planning',        N'Underground OFC Cable Permission',   N'routeMapDoc', N'Proposed OFC Cable Route Diagram', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Road Cutting Permission',            N'workSitePlanDoc', N'Road Cutting Site Diagram', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Mobile Tower Permission',            N'structuralSafetyDoc', N'Structural Safety Certificate of Building/Tower', N'file', N'Document Uploads', 1, 50),
        (N'Town Planning',        N'Mobile Tower Permission',            N'ownerNocDoc', N'Building Owner NOC / Rent Agreement', N'file', N'Document Uploads', 1, 51),
        -- Tree Document Uploads
        (N'Tree',                 N'Tree Felling Permission (Sec 8)',    N'treePhotosDoc', N'Clear Photographs of Tree(s)', N'file', N'Document Uploads', 1, 50),
        (N'Tree',                 N'Tree Felling Permission (Sec 8)',    N'ownershipDoc', N'Property Ownership / 7-12 Extract', N'file', N'Document Uploads', 1, 51),
        -- Drainage/Sanitation Connection Document Uploads
        (N'Sanitation',           N'Providing drainage connections',    N'idProofDoc', N'Applicant ID Proof Document', N'file', N'Document Uploads', 1, 23),
        (N'Sanitation',           N'Providing drainage connections',    N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'file', N'Document Uploads', 1, 24),
        (N'Sanitation',           N'Providing drainage connections',    N'premisesMapDoc', N'Premises Layout Map', N'file', N'Document Uploads', 0, 25)
    ) AS V (DeptName, SvcName, FieldCode, FieldLabel, FieldType, FieldGroup, IsRequired, DisplayOrder)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup],
    [IsRequired], [DisplayOrder], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup,
       S.IsRequired, S.DisplayOrder, 1, 0, 0, GETDATE()
FROM SeedDocumentFields S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO



-- =========================================================
-- RTS FieldDefinition Localized Labels Translations (Marathi)
-- =========================================================
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पहिले नाव' WHERE [FieldLabel] = 'First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मधले नाव' WHERE [FieldLabel] = 'Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आडनाव' WHERE [FieldLabel] = 'Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पूर्ण नाव' WHERE [FieldLabel] = 'Full Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मोबाईल नंबर' WHERE [FieldLabel] = 'Mobile Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ईमेल' WHERE [FieldLabel] = 'Email' OR [FieldLabel] = 'Email (optional)' OR [FieldLabel] = 'Owner Email';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आधार कार्ड क्रमांक' WHERE [FieldLabel] = 'Aadhar Card No' OR [FieldLabel] = 'Aadhaar Number' OR [FieldLabel] = 'Owner Aadhaar Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वय' WHERE [FieldLabel] = 'Age';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जन्मतारीख' WHERE [FieldLabel] = 'Date of Birth';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे पहिले नाव' WHERE [FieldLabel] = 'Father''s First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे मधले नाव' WHERE [FieldLabel] = 'Father''s Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे आडनाव' WHERE [FieldLabel] = 'Father''s Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे पहिले नाव' WHERE [FieldLabel] = 'Mother''s First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे मधले नाव' WHERE [FieldLabel] = 'Mother''s Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे आडनाव' WHERE [FieldLabel] = 'Mother''s Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पत्ता' WHERE [FieldLabel] = 'Residential Address' OR [FieldLabel] = 'Business Address' OR [FieldLabel] = 'Property Address (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय' WHERE [FieldLabel] = 'Occupation';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'धर्म' WHERE [FieldLabel] = 'Religion';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्न तारीख' WHERE [FieldLabel] = 'Date of Marriage';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्न ठिकाण' WHERE [FieldLabel] = 'Place of Marriage';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ पहिले नाव' WHERE [FieldLabel] = 'Witness 1 First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ मधले नाव' WHERE [FieldLabel] = 'Witness 1 Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ आडनाव' WHERE [FieldLabel] = 'Witness 1 Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ पहिले नाव' WHERE [FieldLabel] = 'Witness 2 First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ मधले नाव' WHERE [FieldLabel] = 'Witness 2 Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ आडनाव' WHERE [FieldLabel] = 'Witness 2 Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'घोषणापत्र / मी सहमत आहे' WHERE [FieldLabel] = 'I hereby declare that the information provided is true and correct.';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ओळखपत्राचा प्रकार' WHERE [FieldLabel] = 'ID Proof Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ओळखपत्र क्रमांक' WHERE [FieldLabel] = 'ID Proof Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता क्रमांक / युपीआयसी निवडा' WHERE [FieldLabel] = 'Select Property No / UPIC';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'प्रभाग क्रमांक (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Ward (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'झोन (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Zone (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालकाचे नाव (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Owner Name (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जागेचा प्रकार' WHERE [FieldLabel] = 'Premises Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जोडणीचा प्रकार' WHERE [FieldLabel] = 'Connection Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वापराचा प्रकार' WHERE [FieldLabel] = 'Use Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'युनिट्सची संख्या (पर्यायी)' WHERE [FieldLabel] = 'No. of Units (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'सांडपाण्याची सध्याची व्यवस्था' WHERE [FieldLabel] = 'Current Wastewater Arrangement';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)' WHERE [FieldLabel] = 'Approx. distance to nearest sewer line (meters) (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता खोदाई आवश्यक आहे का?' WHERE [FieldLabel] = 'Road Cutting Required?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता खोदाईचे तपशील (पर्यायी)' WHERE [FieldLabel] = 'Road Cutting Details (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)' WHERE [FieldLabel] = 'Old Connection Ref No (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय परवाना क्रमांक (पर्यायी)' WHERE [FieldLabel] = 'Trade License No (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय / व्यापाराचे नाव' WHERE [FieldLabel] = 'Business / Trade Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'कर्मचाऱ्यांची संख्या' WHERE [FieldLabel] = 'Number of Employees';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कर आकारणी उतारा क्रमांक' WHERE [FieldLabel] = 'Property Tax Assessment Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कर पावती क्रमांक' WHERE [FieldLabel] = 'Property Tax Receipt Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसायाचा प्रकार' WHERE [FieldLabel] = 'Type of Activity';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'परवाना वर्ग' WHERE [FieldLabel] = 'Licensing Category';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवीन व्यवसाय परवाना प्रस्ताव?' WHERE [FieldLabel] = 'New Business Proposal?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'कामाच्या वेळा' WHERE [FieldLabel] = 'Working Hours';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)' WHERE [FieldLabel] = 'FSSAI License No. (For Food Trade)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साठवलेल्या मालाचे प्रकार' WHERE [FieldLabel] = 'Nature of Goods Stored / Traded';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ज्वलनशील / स्फोटक माल आहे का?' WHERE [FieldLabel] = 'Flammable/Explosive Goods?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ज्वलनशील मालाचे तपशील' WHERE [FieldLabel] = 'Flammable Material Details';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अग्निशामक परवाना अद्ययावत आहे का?' WHERE [FieldLabel] = 'Fire NOC Up-to-date?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पोलीस परवाना सादर केला आहे का?' WHERE [FieldLabel] = 'Police NOC Submitted?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'भाग / परिसर' WHERE [FieldLabel] = 'Area / Locality';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लँडमार्क (जवळचे ठिकाण)' WHERE [FieldLabel] = 'Landmark';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'एकूण लांबी (मीटरमध्ये)' WHERE [FieldLabel] = 'Total Length (meters)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'गूगल मॅप लिंक (पर्यायी)' WHERE [FieldLabel] = 'Google Map Link (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदकाम पद्धत' WHERE [FieldLabel] = 'Method';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पृष्ठभाग प्रकार' WHERE [FieldLabel] = 'Surface Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदाई रुंदी (सेमी)' WHERE [FieldLabel] = 'Cutting Width (cm)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदाई खोली (सेमी)' WHERE [FieldLabel] = 'Cutting Depth (cm)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता ओलांडण्याची संख्या (पर्यायी)' WHERE [FieldLabel] = 'No. of Road Crossings (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अपेक्षित सुरू तारीख' WHERE [FieldLabel] = 'Expected Start Date';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अपेक्षित अंतिम तारीख' WHERE [FieldLabel] = 'Expected End Date';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रहदारी व्यवस्थापन आवश्यक आहे का?' WHERE [FieldLabel] = 'Traffic Management Required?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था' WHERE [FieldLabel] = 'Barricading & Safety Arrangement';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पुनर्स्थापना जबाबदारी' WHERE [FieldLabel] = 'Restoration Responsibility';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पुनर्स्थापना प्रकार' WHERE [FieldLabel] = 'Restoration Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'हमीपत्र / स्वीकृती पत्र' WHERE [FieldLabel] = 'Undertaking / Indemnity Consent';

-- Document Upload translations
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवरदेवाच्या वयाचा पुरावा' WHERE [FieldLabel] = 'Groom Age Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवरीच्या वयाचा पुरावा' WHERE [FieldLabel] = 'Bride Age Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्नपत्रिका' WHERE [FieldLabel] = 'Wedding Invitation Card';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ ओळख पुरावा' WHERE [FieldLabel] = 'Witness 1 ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ ओळख पुरावा' WHERE [FieldLabel] = 'Witness 2 ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रुग्णालयाचा डिस्चार्ज कार्ड दाखला' WHERE [FieldLabel] = 'Hospital Discharge Card';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'माहिती देणाऱ्याचा ओळख पुरावा' WHERE [FieldLabel] = 'Informant ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला' WHERE [FieldLabel] = 'Doctor Certificate of Cause of Death';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'स्मशानभूमी किंवा दफनभूमीचा दाखला' WHERE [FieldLabel] = 'Cremation / Burial Ground Certificate';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अर्जदाराच्या ओळखपत्राचा पुरावा' WHERE [FieldLabel] = 'Applicant ID Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कराची पावती' WHERE [FieldLabel] = 'Property Tax Receipt Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जागेचा नकाशा / आराखडा' WHERE [FieldLabel] = 'Premises Layout Map';
GO

-- =========================================================
-- RTS ApprovalFlowMaster Seed Data
-- Only for services with no redirect URL (internal RTS flow)
-- =========================================================
;WITH SeedApprovalFlows AS (
    SELECT * FROM (VALUES
        -- Dept 4: Town Planning
        (N'Town Planning',     N'Issuance of Zone Certificate',                          N'Zone Certificate Approval Flow'),
        (N'Town Planning',     N'Giving Part Map',                                       N'Part Map Issuance Flow'),
        (N'Town Planning',     N'Issuance of Construction Permit',                       N'Construction Permit Approval Flow'),
        (N'Town Planning',     N'Issuance of plinth certificate',                        N'Plinth Certificate Approval Flow'),
        (N'Town Planning',     N'Issuance of Occupancy Certificate',                     N'Occupancy Certificate Approval Flow'),
        (N'Town Planning',     N'Underground OFC Cable Permission',                      N'OFC Cable Permission Flow'),
        (N'Town Planning',     N'Filling Potholes on City Roads',                        N'Pothole Repair Request Flow'),
        (N'Town Planning',     N'Maintaining & Securing Sewer Covers',                   N'Sewer Cover Maintenance Request Flow'),
        (N'Town Planning',     N'Road Cutting Permission',                               N'Road Cutting Permission Flow'),
        (N'Town Planning',     N'Mobile Tower Permission',                               N'Mobile Tower Permission Flow'),
        -- Dept 5: Birth & Death
        (N'Birth & Death',     N'Birth Certificate',                                     N'Birth Certificate Issuance Flow'),
        (N'Birth & Death',     N'Death Certificate',                                     N'Death Certificate Issuance Flow'),
        -- Dept 6: Education
        (N'Education',         N'School Leaving / Duplicate Certificate',                N'School Leaving Certificate Flow'),
        (N'Education',         N'Issuance of transfer certificate',                      N'Transfer Certificate Issuance Flow'),
        (N'Education',         N'Issuance of duplicate mark sheet',                      N'Duplicate Mark Sheet Issuance Flow'),
        -- Dept 7: Health
        (N'Health',            N'Nursing home license under Registration Act, 1949',     N'Nursing Home License Approval Flow'),
        (N'Health',            N'Renewal of nursing home license',                       N'Nursing Home License Renewal Flow'),
        (N'Health',            N'Change of nursing home license holder / partner name',  N'Nursing Home License Holder Change Flow'),
        -- Dept 8: NOC
        (N'NOC',               N'Trade / Business Non-Revocation NOC',                   N'Trade NOC Approval Flow'),
        (N'NOC',               N'Mandap No-Damage Certificate',                          N'Mandap No-Damage Certificate Flow'),
        (N'NOC',               N'Fire Extinguisher Certificate',                         N'Fire Extinguisher Certificate Flow'),
        (N'NOC',               N'Final Fire Exemption Certificate',                      N'Fire Exemption Certificate Flow'),
        -- Dept 9: Marriage Certificate
        (N'Marriage Certificate', N'Marriage Registration Certificate',                  N'Marriage Registration Certificate Flow'),
        -- Dept 10: Tree
        (N'Tree',              N'Tree Felling Permission (Sec 8)',                        N'Tree Felling Permission Flow'),
        -- Dept 11: Sanitation
        (N'Sanitation',        N'Maintaining Manhole / Sewer Covers',                    N'Manhole Maintenance Request Flow'),
        (N'Sanitation',        N'Maintaining cleanliness',                               N'Cleanliness Complaint Flow'),
        (N'Sanitation',        N'Providing drainage connections',                        N'Drainage Connection Approval Flow')
    ) AS V (DeptName, SvcName, FlowName)
)
INSERT INTO [RTS].[ApprovalFlowMaster] ([ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate])
SELECT Svc.Id, S.FlowName, 1, 0, GETDATE()
FROM SeedApprovalFlows S
INNER JOIN [RTS].[DepartmentMaster] D  ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster]    Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ApprovalFlowMaster] F
    WHERE F.ServiceId = Svc.Id AND F.IsActive = 1
);
GO

-- =========================================================
-- RTS ApprovalFlowStageMaster Seed Data
-- Inserts stages per flow using service name lookup
-- =========================================================
;WITH SeedStages AS (
    SELECT * FROM (VALUES
        -- Town Planning: Zone Certificate (3 stages)
        (N'Town Planning', N'Issuance of Zone Certificate',                         1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Zone Certificate',                         2, N'Technical Review (Junior Officer)',      2, 3, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Zone Certificate',                         3, N'Final Approval (Senior Officer)',        3, 2, 0,1,1,1,0,1),
        -- Town Planning: Giving Part Map (3 stages)
        (N'Town Planning', N'Giving Part Map',                                      1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Giving Part Map',                                      2, N'Survey Verification (Junior Officer)',   2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Giving Part Map',                                      3, N'Final Approval (Senior Officer)',        3, 3, 0,1,1,1,0,1),
        -- Town Planning: Construction Permit (3 stages)
        (N'Town Planning', N'Issuance of Construction Permit',                      1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Construction Permit',                      2, N'Site Inspection (Junior Officer)',       2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Construction Permit',                      3, N'Final Approval (Senior Officer)',        3, 3, 0,1,1,1,0,1),
        -- Town Planning: Plinth Certificate (3 stages)
        (N'Town Planning', N'Issuance of plinth certificate',                       1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of plinth certificate',                       2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of plinth certificate',                       3, N'Plinth Approval (Senior Officer)',       3, 2, 0,1,1,1,0,1),
        -- Town Planning: Occupancy Certificate (3 stages)
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    2, N'Structural Inspection (Junior Officer)', 2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    3, N'Occupancy Approval (Senior Officer)',    3, 3, 0,1,1,1,0,1),
        -- Town Planning: OFC Cable (3 stages)
        (N'Town Planning', N'Underground OFC Cable Permission',                     1, N'Application Review (Clerk)',             1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Underground OFC Cable Permission',                     2, N'Technical Review (Junior Officer)',      2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Underground OFC Cable Permission',                     3, N'Final Approval (Senior Officer)',        3, 2, 0,1,1,1,0,1),
        -- Town Planning: Potholes (2 stages)
        (N'Town Planning', N'Filling Potholes on City Roads',                       1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Town Planning', N'Filling Potholes on City Roads',                       2, N'Field Inspection (Junior Officer)',      2, 3, 0,1,1,0,0,1),
        -- Town Planning: Sewer Covers (2 stages)
        (N'Town Planning', N'Maintaining & Securing Sewer Covers',                  1, N'Request Registration (Clerk)',           1, 1, 0,0,0,0,0,0),
        (N'Town Planning', N'Maintaining & Securing Sewer Covers',                  2, N'Field Verification (Junior Officer)',    2, 3, 0,1,1,0,0,1),
        -- Town Planning: Road Cutting (3 stages)
        (N'Town Planning', N'Road Cutting Permission',                              1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Road Cutting Permission',                              2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Road Cutting Permission',                              3, N'Permission Grant (Senior Officer)',      3, 2, 0,1,1,1,0,1),
        -- Town Planning: Mobile Tower (3 stages)
        (N'Town Planning', N'Mobile Tower Permission',                              1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Mobile Tower Permission',                              2, N'Technical Review (Junior Officer)',      2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Mobile Tower Permission',                              3, N'Final Approval (Senior Officer)',        3, 5, 0,1,1,1,0,1),
        -- Birth & Death: Birth Certificate (2 stages)
        (N'Birth & Death', N'Birth Certificate',                                    1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Birth & Death', N'Birth Certificate',                                    2, N'Registrar Approval',                    2, 2, 0,1,1,1,0,1),
        -- Birth & Death: Death Certificate (2 stages)
        (N'Birth & Death', N'Death Certificate',                                    1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Birth & Death', N'Death Certificate',                                    2, N'Registrar Approval',                    2, 2, 0,1,1,1,0,1),
        -- Education: School Leaving Certificate (2 stages)
        (N'Education',     N'School Leaving / Duplicate Certificate',               1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'School Leaving / Duplicate Certificate',               2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Education: Transfer Certificate (2 stages)
        (N'Education',     N'Issuance of transfer certificate',                     1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'Issuance of transfer certificate',                     2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Education: Duplicate Mark Sheet (2 stages)
        (N'Education',     N'Issuance of duplicate mark sheet',                     1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'Issuance of duplicate mark sheet',                     2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Health: Nursing Home License (3 stages)
        (N'Health',        N'Nursing home license under Registration Act, 1949',    1, N'Document Verification (Clerk)',          1, 3, 1,0,0,1,0,0),
        (N'Health',        N'Nursing home license under Registration Act, 1949',    2, N'Health Inspection (Junior Officer)',     2, 7, 1,0,0,1,0,0),
        (N'Health',        N'Nursing home license under Registration Act, 1949',    3, N'License Grant (Senior Officer)',         3, 5, 0,1,1,1,0,1),
        -- Health: Nursing Home Renewal (2 stages)
        (N'Health',        N'Renewal of nursing home license',                      1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Health',        N'Renewal of nursing home license',                      2, N'Renewal Approval (Senior Officer)',      3, 3, 0,1,1,1,0,1),
        -- Health: Nursing Home Holder Change (2 stages)
        (N'Health',        N'Change of nursing home license holder / partner name', 1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Health',        N'Change of nursing home license holder / partner name', 2, N'Change Approval (Senior Officer)',       3, 3, 0,1,1,1,0,1),
        -- NOC: Trade NOC (2 stages)
        (N'NOC',           N'Trade / Business Non-Revocation NOC',                  1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Trade / Business Non-Revocation NOC',                  2, N'NOC Approval (Senior Officer)',          3, 3, 0,1,1,1,0,1),
        -- NOC: Mandap No-Damage (2 stages)
        (N'NOC',           N'Mandap No-Damage Certificate',                         1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'NOC',           N'Mandap No-Damage Certificate',                         2, N'Certificate Approval (Senior Officer)', 3, 2, 0,1,1,1,0,1),
        -- NOC: Fire Extinguisher Certificate (3 stages)
        (N'NOC',           N'Fire Extinguisher Certificate',                        1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Fire Extinguisher Certificate',                        2, N'Fire Inspection (Junior Officer)',       2, 3, 1,0,0,1,0,0),
        (N'NOC',           N'Fire Extinguisher Certificate',                        3, N'Certificate Approval (Senior Officer)', 3, 2, 0,1,1,1,0,1),
        -- NOC: Final Fire Exemption (3 stages)
        (N'NOC',           N'Final Fire Exemption Certificate',                     1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Final Fire Exemption Certificate',                     2, N'Fire Safety Inspection (Junior Officer)',2, 5, 1,0,0,1,0,0),
        (N'NOC',           N'Final Fire Exemption Certificate',                     3, N'Exemption Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1),
        -- Marriage Certificate (2 stages)
        (N'Marriage Certificate', N'Marriage Registration Certificate',             1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Marriage Certificate', N'Marriage Registration Certificate',             2, N'Registrar Approval',                    2, 3, 0,1,1,1,0,1),
        -- Tree: Tree Felling (3 stages)
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      2, N'Site Inspection (Junior Officer)',       2, 7, 1,0,0,1,0,0),
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      3, N'Permission Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1),
        -- Sanitation: Manhole (2 stages)
        (N'Sanitation',    N'Maintaining Manhole / Sewer Covers',                   1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Sanitation',    N'Maintaining Manhole / Sewer Covers',                   2, N'Field Verification (Junior Officer)',    2, 3, 0,1,1,0,0,1),
        -- Sanitation: Cleanliness (2 stages)
        (N'Sanitation',    N'Maintaining cleanliness',                              1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Sanitation',    N'Maintaining cleanliness',                              2, N'Field Verification (Junior Officer)',    2, 2, 0,1,1,0,0,1),
        -- Sanitation: Drainage (3 stages)
        (N'Sanitation',    N'Providing drainage connections',                       1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Sanitation',    N'Providing drainage connections',                       2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Sanitation',    N'Providing drainage connections',                       3, N'Connection Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1)
    ) AS V (DeptName, SvcName, StageOrder, StageName, UserId, SLADays,
            CanVerifyDocument, CanApprove, CanReject, CanReturn, CanPay, IsFinalStage)
)
INSERT INTO [RTS].[ApprovalFlowStageMaster]
    ([ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays],
     [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage])
SELECT
    F.Id,
    S.StageOrder,
    S.StageName,
    S.UserId,
    S.SLADays,
    S.CanVerifyDocument,
    S.CanApprove,
    S.CanReject,
    S.CanReturn,
    S.CanPay,
    S.IsFinalStage
FROM SeedStages S
INNER JOIN [RTS].[DepartmentMaster] D   ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster]    Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
INNER JOIN [RTS].[ApprovalFlowMaster] F ON F.ServiceId = Svc.Id AND F.IsActive = 1
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ApprovalFlowStageMaster] ST
    WHERE ST.ApprovalFlowId = F.Id AND ST.StageOrder = S.StageOrder
);
GO

/* ============================================================================
   RTS Payment Module Reference Masters and Gateway Config Seed
   ============================================================================ */

-- 1. PaymentStatusMaster
MERGE [RTS].[PaymentStatusMaster] AS target
USING (VALUES
    ('INITIATED', 'Initiated', N'सुरू केले', 'bg-amber-50 text-amber-700', 1, 1),
    ('PENDING',   'Pending',   N'प्रलंबित',   'bg-yellow-50 text-yellow-800', 2, 1),
    ('SUCCESS',   'Success',   N'यशस्वी',     'bg-emerald-50 text-emerald-700', 3, 1),
    ('FAILED',    'Failed',    N'अयशस्वी',   'bg-rose-50 text-rose-700', 4, 1),
    ('REFUNDED',  'Refunded',  N'परतावा केला', 'bg-purple-50 text-purple-700', 5, 1),
    ('EXPIRED',   'Expired',   N'कालबाह्य',   'bg-slate-50 text-slate-700', 6, 1)
) AS source (StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive)
ON target.StatusCode = source.StatusCode
WHEN MATCHED THEN
    UPDATE SET
        target.StatusNameEn = source.StatusNameEn,
        target.StatusNameMr = source.StatusNameMr,
        target.BadgeColor = source.BadgeColor,
        target.DisplayOrder = source.DisplayOrder,
        target.IsActive = source.IsActive
WHEN NOT MATCHED THEN
    INSERT (StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive, CreatedDate)
    VALUES (source.StatusCode, source.StatusNameEn, source.StatusNameMr, source.BadgeColor, source.DisplayOrder, source.IsActive, GETDATE());
GO

-- 2. PaymentModeMaster
MERGE [RTS].[PaymentModeMaster] AS target
USING (VALUES
    ('UPI',             'UPI / QR Code',      N'युपीआय / क्यूआर कोड', 'QrCode', 1),
    ('NETBANKING',      'Internet Banking',  N'नेट बँकिंग',           'Building', 1),
    ('CREDIT_CARD',     'Credit Card',       N'क्रेडिट कार्ड',         'CreditCard', 1),
    ('DEBIT_CARD',      'Debit Card',        N'डेबिट कार्ड',          'CreditCard', 1),
    ('WALLET',          'Digital Wallet',    N'डिजिटल वॉलेट',         'Wallet', 1),
    ('OFFLINE_CHALLAN', 'Offline Challan',   N'ऑफलाइन चलन',          'FileText', 1)
) AS source (ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive)
ON target.ModeCode = source.ModeCode
WHEN MATCHED THEN
    UPDATE SET
        target.ModeNameEn = source.ModeNameEn,
        target.ModeNameMr = source.ModeNameMr,
        target.IconName = source.IconName,
        target.IsActive = source.IsActive
WHEN NOT MATCHED THEN
    INSERT (ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive, CreatedDate)
    VALUES (source.ModeCode, source.ModeNameEn, source.ModeNameMr, source.IconName, source.IsActive, GETDATE());
GO

-- 3. PaymentGatewayConfig
IF NOT EXISTS (SELECT 1 FROM [RTS].[PaymentGatewayConfig] WHERE [GatewayCode] = 'RAZORPAY')
BEGIN
    INSERT INTO [RTS].[PaymentGatewayConfig]
    (
        [GatewayCode],
        [GatewayName],
        [MerchantId],
        [KeyId],
        [SecretKey],
        [WebhookSecret],
        [ServiceUrl],
        [Currency],
        [IsActive],
        [IsDefault],
        [CreatedDate]
    )
    VALUES
    (
        'RAZORPAY',
        N'Razorpay Smart Payment Gateway',
        NULL,
        'rzp_test_SZLId8MmrfQwTX',
        'd1TPunImUMBxcPDStAGUnOdj',
        'd1TPunImUMBxcPDStAGUnOdj',
        'https://api.razorpay.com/v1/checkout/embedded',
        'INR',
        1,
        1,
        GETDATE()
    );
END;
GO

-- 4. AppealTypeMaster
MERGE [RTS].[AppealTypeMaster] AS target
USING (VALUES
    (1, N'प्रथम अपील (First Appeal)',  'FIRST_APPEAL', 1),
    (2, N'द्वितीय अपील (Second Appeal)', 'SECOND_APPEAL', 1),
    (3, N'तक्रार (Grievance)',          'GRIEVANCE', 1)
) AS source (Id, AppealTypeName, Code, IsActive)
ON target.Id = source.Id OR target.Code = source.Code
WHEN MATCHED THEN
    UPDATE SET
        target.AppealTypeName = source.AppealTypeName,
        target.Code = source.Code,
        target.IsActive = source.IsActive
WHEN NOT MATCHED THEN
    INSERT (AppealTypeName, Code, IsActive, CreatedDate)
    VALUES (source.AppealTypeName, source.Code, source.IsActive, GETDATE());
GO

-- =========================================================
-- 5. RTS CertificateTemplateMaster Seed Data (Internal Services)
-- =========================================================
;WITH SeedCertificateTemplates AS (
    SELECT * FROM (VALUES
        -- 1. Birth Certificate
        (N'Birth Certificate', N'जन्म प्रमाणपत्र (Official Birth Certificate)', 'CERT_BIRTH',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, खालील नोंदणी माहिती अकोला महानगरपालिकेच्या जन्म नोंदवहीनुसार अधिकृत असून, <strong>{{ApplicantName}}</strong> यांच्या अर्जावरून (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) हे जन्म प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नोंदणी क्रमांक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नोंदणी / आदेश क्रमांक","fieldLabelEnglish":"Registration / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर प्रमाणपत्र जन्म आणि मृत्यू नोंदणी अधिनियम, १९६९ अंतर्गत अधिकृत आहे.","प्रमाणपत्रातील नोंदी अधिकृत महानगरपालिका जन्म नोंदवहीवरून प्रमाणित केलेल्या आहेत."]'
        ),

        -- 2. Death Certificate
        (N'Death Certificate', N'मृत्यू प्रमाणपत्र (Official Death Certificate)', 'CERT_DEATH',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, खालील नोंदणी माहिती अकोला महानगरपालिकेच्या मृत्यू नोंदवहीनुसार अधिकृत असून, <strong>{{ApplicantName}}</strong> यांच्या अर्जावरून (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) हे मृत्यू प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नोंदणी क्रमांक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नोंदणी / आदेश क्रमांक","fieldLabelEnglish":"Registration / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर प्रमाणपत्र जन्म आणि मृत्यू नोंदणी अधिनियम, १९६९ अंतर्गत अधिकृत आहे."]'
        ),

        -- 3. Marriage Registration Certificate
        (N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र (Marriage Certificate)', 'CERT_MARRIAGE',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांनी सादर केलेल्या विवाह नोंदणी अर्जाची (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) नियमानुसार पडताळणी करण्यात येऊन विवाह नोंदणी प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>विवाह नोंदणी क्र.:</strong> [[OrderNo]]</div>
        <div><strong>विवाह नोंदणी दिनांक:</strong> {{AppliedDate}}</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"विवाह नोंदणी क्रमांक","fieldLabelEnglish":"Marriage Reg No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर विवाह नोंदणी महाराष्ट्र विवाह मंडळांचे विनियमन आणि विवाह नोंदणी अधिनियम अंतर्गत वैध आहे."]'
        ),

        -- 4. Zone Certificate
        (N'Issuance of Zone Certificate', N'झोन दाखला (Zone Certificate)', 'CERT_ZONE',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांनी सादर केलेल्या अर्जानुसार (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) विकास योजना व नगररचना नियमावलीनुसार संबंधित भूखंड/जागेचा झोन दाखला खालील तपशिलानुसार जारी करण्यात येत आहे:</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>झोन प्रकार व आरक्षण:</strong> [[ZoneType]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ZoneType","fieldLabelMarathi":"झोन प्रकार व आरक्षण","fieldLabelEnglish":"Zone Type & Reservation","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर दाखला केवळ नगररचना विकास नियंत्रण नियमावलीच्या अनुषंगाने माहितीस्तव आहे.","सदर दाखल्यावरून जागेच्या मालकी हक्काचा कोणताही दावा करता येणार नाही."]'
        ),

        -- 5. Construction Permit
        (N'Issuance of Construction Permit', N'बांधकाम परवाना (Building Construction Permit)', 'CERT_CONSTRUCTION_PERMIT',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये सादर केलेल्या इमारत बांधकामाच्या नकाशांची व कागदपत्रांची छाननी करण्यात आली असून, मंजूर नकाशा व अटी-शर्तींनुसार बांधकाम करण्यास परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवाना / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवाना वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>मंजूर चटई क्षेत्र (Built-up Area):</strong> [[BuiltUpArea]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवाना / आदेश क्रमांक","fieldLabelEnglish":"Permit / Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवाना वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"BuiltUpArea","fieldLabelMarathi":"मंजूर क्षेत्रफळ (Built-up Area)","fieldLabelEnglish":"Approved Area","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["बांधकाम केवळ मंजूर नकाशाप्रमाणेच करणे बंधनकारक आहे.","बांधकामादरम्यान सुरक्षेच्या सर्व नियमांचे पालन करणे आवश्यक आहे.","अनधिकृत बांधकाम आढळल्यास परवाना रद्द करून कारवाई केली जाईल."]'
        ),

        -- 6. Occupancy Certificate
        (N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र (Occupancy Certificate)', 'CERT_OCCUPANCY',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारत बांधकामाची प्रत्यक्ष पाहणी करण्यात आली असून बांधकाम मंजूर नकाशा व नियमांनुसार पूर्ण झाल्याने इमारतीचा वापर करण्यास भोगवटा प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>भोगवटा आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"भोगवटा आदेश क्रमांक","fieldLabelEnglish":"Occupancy Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["इमारतीचा वापर केवळ मंजूर वापरासाठीच (Approved Use) करणे बंधनकारक आहे."]'
        ),

        -- 7. Trade NOC
        (N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार / व्यवसाय ना-हरकत प्रमाणपत्र (Trade NOC)', 'CERT_TRADE_NOC',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र खालील अटींच्या अधीन राहून जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["परिसरातील नागरिकांना किंवा वाहतुकीस कोणताही त्रास होणार नाही याची दक्षता घ्यावी.","प्रदूषण नियंत्रण व मनपाच्या सर्व नियमांचे पालन करणे बंधनकारक राहील."]'
        ),

        -- 8. Mandap No-Damage Certificate
        (N'Mandap No-Damage Certificate', N'मंडप ना-हरकत / ना-नुकसान प्रमाणपत्र (Mandap NOC)', 'CERT_MANDAP_NOC',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मंडप उभारणीसाठी ना-हरकत प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवानगी कालावधी:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क / अनामत पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवानगी कालावधी","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["रस्त्यावर वाहतुकीस अडथळा निर्माण होणार नाही अशा पद्धतीने मंडप उभारणे आवश्यक आहे.","मुदत संपताच मंडप काढून रस्ता पूर्ववत करणे बंधनकारक आहे."]'
        ),

        -- 9. Fire Safety NOC
        (N'Issuance of Fire Safety NOC', N'अग्निशमन ना-हरकत दाखला (Fire Safety NOC)', 'CERT_FIRE_NOC',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये अग्निशमन यंत्रणेची प्राथमिक पाहणी करण्यात आली असून अग्निशमन ना-हरकत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>अग्निशमन जावक क्र.:</strong> [[OrderNo]]</div>
        <div><strong>दाखला वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"अग्निशमन जावक क्रमांक","fieldLabelEnglish":"Fire Outward No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["अग्निशामक उपकरणे नेहमी सुस्थितीत व कार्यान्वित ठेवणे आवश्यक आहे.","दरवर्षी नियमानुसार अग्निशमन लेखापरीक्षण (Fire Audit) सादर करणे बंधनकारक आहे."]'
        ),

        -- 10. Tree Felling Permission
        (N'Tree Felling Permission (Sec 8)', N'वृक्षतोड / छाटणी परवानगी (Tree Permission)', 'CERT_TREE_PERMIT',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये वृक्ष प्राधिकरणाच्या पाहणी अहवालानुसार वृक्षतोड/फांद्या छाटणी परवानगी खालील अटींवर देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>तोडण्यास/छाटण्यास मंजूर वृक्षांची संख्या:</strong> [[TreeCount]]</div>
        <div><strong>पुनर्लागवड करावयाची वृक्षांची संख्या:</strong> [[ReplantCount]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"TreeCount","fieldLabelMarathi":"मंजूर वृक्षांची संख्या","fieldLabelEnglish":"Approved Tree Count","fieldType":"text","isMandatory":true},{"fieldKey":"ReplantCount","fieldLabelMarathi":"पुनर्लागवड करावयाची झाडे","fieldLabelEnglish":"Replant Trees Count","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["तोडलेल्या प्रत्येक वृक्षाच्या बदल्यात नियमानुसार नवीन वृक्षांची लागवड करून त्यांचे संवर्धन करणे बंधनकारक आहे."]'
        ),

        -- 11. School Leaving Certificate
        (N'School Leaving / Duplicate Certificate', N'शाळा सोडल्याचा दाखला (School Leaving Certificate)', 'CERT_SCHOOL_LEAVING',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शाळेतील नोंदींची पडताळणी करून शाळा सोडल्याचा अधिकृत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला / रजिस्टर क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"दाखला / रजिस्टर क्रमांक","fieldLabelEnglish":"Certificate / Register No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित करून दिला आहे."]'
        ),

        -- 12. Nursing Home License
        (N'Nursing home license under Registration Act, 1949', N'शुश्रूषा-गृह परवाना (Nursing Home License)', 'CERT_NURSING_HOME',
         N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियम, १९४९ अंतर्गत अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये आरोग्य विभागामार्फत शुश्रूषा-गृह चालविण्याचा परवाना जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवाना क्रमांक:</strong> [[OrderNo]]</div>
        <div><strong>मंजूर खाटांची संख्या (Beds):</strong> [[BedCapacity]]</div>
        <div><strong>परवाना वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवाना क्रमांक","fieldLabelEnglish":"License No","fieldType":"text","isMandatory":true},{"fieldKey":"BedCapacity","fieldLabelMarathi":"मंजूर खाटांची संख्या (Bed Capacity)","fieldLabelEnglish":"Bed Capacity","fieldType":"text","isMandatory":false},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["बायो-मेडिकल कचरा व्यवस्थापन नियमांचे काटेकोर पालन करणे बंधनकारक आहे.","अग्निशमन व प्रदूषण नियंत्रण नियमांचे पालन करणे आवश्यक आहे."]'
        ),

        -- 13. Providing drainage connections
        (N'Providing drainage connections', N'जलनिःसारण / ड्रेनेज जोडणी प्रमाणपत्र (Drainage Connection)', 'CERT_DRAINAGE',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मनपाच्या मुख्य ड्रेनेज लाईनला जलनिःसारण जोडणी घेण्यास अधिकृत परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोडणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोडणी आदेश क्रमांक","fieldLabelEnglish":"Connection Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["जोडणी काम केवळ अधिकृत प्लंबरमार्फतच करणे आवश्यक आहे."]'
        ),

        -- 14. Giving Part Map
        (N'Giving Part Map', N'भाग नकाशा दाखला (Part Map Certificate)', 'CERT_PART_MAP',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये विकास योजनेनुसार संबंधित क्षेत्राचा अधिकृत भाग नकाशा प्रमाणित करून देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जावक / आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर भाग नकाशा केवळ विकास योजना माहितीस्तव असून मालकी हक्काचा पुरावा नाही."]'
        ),

        -- 15. Plinth Certificate
        (N'Issuance of plinth certificate', N'जोते प्रमाणपत्र (Plinth Certificate)', 'CERT_PLINTH',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारत बांधकामाचे जोते (Plinth Level) मंजूर नकाशाप्रमाणे पूर्ण झाल्याची खात्री करून जोते प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोते तपासणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोते तपासणी आदेश क्रमांक","fieldLabelEnglish":"Plinth Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["पुढील बांधकाम मंजूर नकाशा व नियमांनुसारच करणे बंधनकारक आहे."]'
        ),

        -- 16. Final Fire Exemption Certificate
        (N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला (Final Fire NOC)', 'CERT_FINAL_FIRE_EXEMPTION',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारतीमधील अग्निशमन यंत्रणेची अंतिम पाहणी यशस्वी झाल्याने अंतिम अग्निशमन नाहरकत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>अंतिम अग्निशमन आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"अंतिम अग्निशमन आदेश क्रमांक","fieldLabelEnglish":"Final Fire Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["अग्निशामक यंत्रणा सदैव कार्यरत ठेवणे बंधनकारक आहे."]'
        ),

        -- 17. Transfer Certificate
        (N'Issuance of transfer certificate', N'स्थलांतर दाखला (Transfer Certificate)', 'CERT_TRANSFER_CERT',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय नोंदीनुसार स्थलांतर दाखला (TC) जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"दाखला क्रमांक","fieldLabelEnglish":"Certificate No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित केला आहे."]'
        ),

        -- 18. Duplicate Mark Sheet
        (N'Issuance of duplicate mark sheet', N'द्वितीय गुणपत्रक (Duplicate Mark Sheet)', 'CERT_MARK_SHEET',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय परीक्षा अभिलेखावरून द्वितीय गुणपत्रक प्रमाणित करून देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>गुणपत्रक अनुक्रमांक:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"गुणपत्रक अनुक्रमांक","fieldLabelEnglish":"Mark Sheet Serial No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर गुणपत्रक मूळ अभिलेखावरून पडताळून दिले आहे."]'
        ),

        -- 19. Renewal of Nursing Home License
        (N'Renewal of nursing home license', N'शुश्रूषा-गृह परवाना नूतनीकरण (Nursing Home Renewal)', 'CERT_NURSING_HOME_RENEWAL',
         N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियमान्वये अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शुश्रूषा-गृह परवान्याचे नूतनीकरण करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नूतनीकरण आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>नवीन वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नूतनीकरण आदेश क्रमांक","fieldLabelEnglish":"Renewal Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"नवीन वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["आरोग्य व सुरक्षेच्या सर्व नियमांचे पालन करणे आवश्यक आहे."]'
        ),

        -- 20. Change of Nursing Home License Holder
        (N'Change of nursing home license holder / partner name', N'शुश्रूषा-गृह परवानाधारक नाव बदल दाखला (Nursing Home Name Change)', 'CERT_NURSING_HOME_NAME_CHANGE',
         N'<div class="certificate-body space-y-4">
    <p>महाराष्ट्र शुश्रूषा-गृह नोंदणी अधिनियमान्वये अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शुश्रूषा-गृह परवान्यावरील परवानाधारक/भागीदार नाव बदल मंजुरी दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>नाव बदल आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"नाव बदल आदेश क्रमांक","fieldLabelEnglish":"Change Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["सदर बदल मनपा आरोग्य विभागाच्या अधिकृत नोंदवहीत नोंदविण्यात आला आहे."]'
        ),

        -- 21. Underground OFC Cable Permission
        (N'Underground OFC Cable Permission', N'भूमिगत ओएफसी केबल परवानगी (OFC Cable Permission)', 'CERT_OFC_CABLE',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये भूमिगत दूरसंचार वाहिनी (OFC Cable) टाकण्यास खालील अटींवर परवानगी देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवानगी वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>खोदकाम लांबी (मीटर):</strong> [[TrenchLength]]</div>
        <div><strong>शुल्क / पुनर्भरण पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवानगी मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"TrenchLength","fieldLabelMarathi":"खोदकाम लांबी (मीटर)","fieldLabelEnglish":"Trench Length (Meters)","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]',
         N'["काम पूर्ण झाल्यानंतर रस्ता त्वरित पूर्ववत करणे बंधनकारक राहील."]'
        )
    ) AS V (ServiceName, TemplateName, TemplateCode, BodyContent, OfficerFieldsJson, DefaultConditionsJson)
)
MERGE [RTS].[CertificateTemplateMaster] AS Target
USING (
    SELECT Svc.Id AS ServiceId, Seed.TemplateName, Seed.TemplateCode, Seed.BodyContent, Seed.OfficerFieldsJson, Seed.DefaultConditionsJson
    FROM SeedCertificateTemplates Seed
    INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.ServiceName = Seed.ServiceName
) AS Source
ON Target.ServiceId = Source.ServiceId
WHEN MATCHED THEN
    UPDATE SET
        Target.TemplateName = Source.TemplateName,
        Target.TemplateCode = Source.TemplateCode,
        Target.BodyContent = Source.BodyContent,
        Target.OfficerFieldsJson = Source.OfficerFieldsJson,
        Target.DefaultConditionsJson = Source.DefaultConditionsJson,
        Target.IsActive = 1,
        Target.UpdatedDate = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (ServiceId, TemplateName, TemplateCode, BodyContent, OfficerFieldsJson, DefaultConditionsJson, IsActive, CreatedDate)
    VALUES (Source.ServiceId, Source.TemplateName, Source.TemplateCode, Source.BodyContent, Source.OfficerFieldsJson, Source.DefaultConditionsJson, 1, GETDATE());
GO

/* ============================================================================
   RTS / Core SMS Gateway Configuration & Unified Dynamic Templates Seed
   ============================================================================ */

-- 1. SMS Gateway Provider
IF NOT EXISTS (SELECT 1 FROM [CORE].[SMSGatewayMaster] WHERE [ProviderName] LIKE '%Akola%')
BEGIN
    INSERT INTO [CORE].[SMSGatewayMaster] ([ProviderName], [IsActive], [CreatedBy], [CreatedDate])
    VALUES ('Akola Municipal Corporation SMS Gateway', 1, 1, GETDATE());
END;
GO

DECLARE @SmsGatewayId INT = (SELECT TOP 1 [SMSGatewayMasterID] FROM [CORE].[SMSGatewayMaster] WHERE [IsActive] = 1 ORDER BY [SMSGatewayMasterID]);

-- 2. SMS Gateway Parameter Details
IF @SmsGatewayId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [CORE].[SmsGatewayDetails] WHERE [SMSGatewayMasterID] = @SmsGatewayId)
BEGIN
    INSERT INTO [CORE].[SmsGatewayDetails]
        ([SMSGatewayMasterID], [PropertyName], [Value], [SequenceNo], [IsURL], [IsMessage], [IsMobile], [IsTemplateID], [IsUnicode], [IsActive], [CreatedBy], [CreatedDate])
    VALUES
        (@SmsGatewayId, 'BaseURL',   'http://sms.ptaxcollection.com/sendsms.jsp', 1, 1, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'user',      'payakl',                                    2, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'password',  'fb05b4a701XX',                              3, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'senderid',  'AKOLMC',                                    4, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'mobiles',   '',                                          5, 0, 0, 1, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'sms',       '',                                          6, 0, 1, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'tempid',    '',                                          7, 0, 0, 0, 1, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'unicode',   '0',                                         8, 0, 0, 0, 0, 1, 1, 1, GETDATE()),
        (@SmsGatewayId, 'accusage',  '1',                                         9, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'entityid',  '1701161970302682421',                      10, 0, 0, 0, 0, 0, 1, 1, GETDATE()),
        (@SmsGatewayId, 'responsein','json',                                     11, 0, 0, 0, 0, 0, 1, 1, GETDATE());
END
ELSE IF @SmsGatewayId IS NOT NULL
BEGIN
    UPDATE [CORE].[SmsGatewayDetails] SET [Value] = 'AKOLMC' WHERE [SMSGatewayMasterID] = @SmsGatewayId AND [PropertyName] = 'senderid';
    UPDATE [CORE].[SmsGatewayDetails] SET [Value] = '1701161970302682421' WHERE [SMSGatewayMasterID] = @SmsGatewayId AND [PropertyName] = 'entityid';
END;
GO

-- 3. SMS Types
MERGE INTO [CORE].[SMSType] AS Target
USING (VALUES
    (1, 'OTP',                            'One Time Password for citizen login/verification'),
    (2, 'Online Fee Paid',                'Receipt notification for online fee payments'),
    (3, 'RTS Application Status Update',  'Unified status update notification for all RTS workflow steps')
) AS Source ([SMSTypeID], [TypeName], [Description])
ON Target.[TypeName] = Source.[TypeName]
WHEN MATCHED THEN
    UPDATE SET Target.[Description] = Source.[Description], Target.[IsActive] = 1
WHEN NOT MATCHED THEN
    INSERT ([TypeName], [Description], [IsActive])
    VALUES (Source.[TypeName], Source.[Description], 1);
GO

-- 4. Unified Dynamic Templates in SMSMaster
DECLARE @GatewayId INT = (SELECT TOP 1 [SMSGatewayMasterID] FROM [CORE].[SMSGatewayMaster] WHERE [IsActive] = 1 ORDER BY [SMSGatewayMasterID]);
DECLARE @OtpTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'OTP');
DECLARE @StatusUpdateTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'RTS Application Status Update');
DECLARE @FeePaidTypeId INT = (SELECT TOP 1 [SMSTypeID] FROM [CORE].[SMSType] WHERE [TypeName] = 'Online Fee Paid');

IF @GatewayId IS NOT NULL
BEGIN
    -- OTP Template
    IF NOT EXISTS (SELECT 1 FROM [CORE].[SMSMaster] WHERE [TemplateName] = 'RTS_CITIZEN_LOGIN_OTP')
    BEGIN
        INSERT INTO [CORE].[SMSMaster] ([SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate])
        VALUES (@GatewayId, ISNULL(@OtpTypeId, 1), 'RTS_CITIZEN_LOGIN_OTP', '1777178721904398497', 'Your RTS Citizen Portal login OTP is {Otp}. Please do not share this OTP with anyone. Akola Municipal Corporation', 1, 1, GETDATE());
    END
    ELSE
    BEGIN
        UPDATE [CORE].[SMSMaster]
        SET [TemplateID] = '1777178721904398497',
            [SmsText] = 'Your RTS Citizen Portal login OTP is {Otp}. Please do not share this OTP with anyone. Akola Municipal Corporation',
            [IsActive] = 1
        WHERE [TemplateName] = 'RTS_CITIZEN_LOGIN_OTP';
    END;

    -- Unified Dynamic Application Status Template (Used on all actions: submit, forward, approve, reject, revert)
    IF NOT EXISTS (SELECT 1 FROM [CORE].[SMSMaster] WHERE [TemplateName] = 'RTS_APP_STATUS_UPDATE')
    BEGIN
        INSERT INTO [CORE].[SMSMaster] ([SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate])
        VALUES (@GatewayId, ISNULL(@StatusUpdateTypeId, 3), 'RTS_APP_STATUS_UPDATE', '1777178721329285369', 'Dear {CitizenName}, Your RTS Application No: {ApplicationNo} for {ServiceName} is Currently {Status} Track Status: https://citizen.scipl.info.in/service?track={ApplicationNo} Akola Municipal Corporation', 1, 1, GETDATE());
    END
    ELSE
    BEGIN
        UPDATE [CORE].[SMSMaster]
        SET [TemplateID] = '1777178721329285369',
            [SmsText] = 'Dear {CitizenName}, Your RTS Application No: {ApplicationNo} for {ServiceName} is Currently {Status} Track Status: https://citizen.scipl.info.in/service?track={ApplicationNo} Akola Municipal Corporation',
            [IsActive] = 1
        WHERE [TemplateName] = 'RTS_APP_STATUS_UPDATE';
    END;

    -- Online Payment Receipt Template
    IF NOT EXISTS (SELECT 1 FROM [CORE].[SMSMaster] WHERE [TemplateName] = 'RTS_FEE_PAID')
    BEGIN
        INSERT INTO [CORE].[SMSMaster] ([SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate])
        VALUES (@GatewayId, ISNULL(@FeePaidTypeId, 2), 'RTS_FEE_PAID', '1777178721313405133', 'Dear {CitizenName}, Payment of Rs.{Amount} for RTS Application No: {ApplicationNo} is successful. Receipt No: {ReceiptNo}. Download Receipt: https://citizen.scipl.info.in/service?receipt={ReceiptNo} Akola Municipal Corporation', 1, 1, GETDATE());
    END
    ELSE
    BEGIN
        UPDATE [CORE].[SMSMaster]
        SET [TemplateID] = '1777178721313405133',
            [SmsText] = 'Dear {CitizenName}, Payment of Rs.{Amount} for RTS Application No: {ApplicationNo} is successful. Receipt No: {ReceiptNo}. Download Receipt: https://citizen.scipl.info.in/service?receipt={ReceiptNo} Akola Municipal Corporation',
            [IsActive] = 1
        WHERE [TemplateName] = 'RTS_FEE_PAID';
    END;
END;
GO
