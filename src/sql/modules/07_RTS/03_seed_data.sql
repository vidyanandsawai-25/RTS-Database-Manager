SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS Project Master Seed Data - 100% Genuine Live Database Backup (192.168.1.13:RTS_Akola)
   Idempotent and safe to run on any environment.
   ============================================================================ */

DECLARE @RtsDepartmentId INT;
DECLARE @RtsModuleId INT;
DECLARE @AdminUserId INT;

SELECT @AdminUserId = [Id]
FROM [CORE].[UserMaster]
WHERE [UserName] = N'ADMIN';

IF @AdminUserId IS NULL
    SELECT @AdminUserId = 1;

IF NOT EXISTS (SELECT 1 FROM [CORE].[DepartmentMaster] WHERE [DepartmentCode] = 'RTS')
BEGIN
    INSERT INTO [CORE].[DepartmentMaster] ([DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DepartmentDescription], [IsActive], [CreatedBy], [CreatedDate])
    VALUES ('RTS', 'RTS Department', N'लोकसेवा हक्क', 'Landmark', N'Maharashtra Right to Public Services', 1, @AdminUserId, GETDATE());
END;

SELECT @RtsDepartmentId = [Id] FROM [CORE].[DepartmentMaster] WHERE [DepartmentCode] = 'RTS';

UPDATE [CORE].[DepartmentMaster]
SET [DepartmentName] = 'RTS Department',
    [DepartmentNameLocal] = N'लोकसेवा हक्क',
    [DepartmentIcon] = 'Landmark',
    [DepartmentDescription] = N'Maharashtra Right to Public Services',
    [IsActive] = 1,
    [UpdatedBy] = @AdminUserId,
    [UpdatedDate] = GETDATE()
WHERE [Id] = @RtsDepartmentId;

IF NOT EXISTS (SELECT 1 FROM [CORE].[ModuleMaster] WHERE [ModuleCode] = N'RTS_M')
BEGIN
    INSERT INTO [CORE].[ModuleMaster] ([DepartmentId], [ModuleCode], [ModuleName], [ModuleNameLocal], [ModuleIcon], [ModuleLabel], [ModuleDescription], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (@RtsDepartmentId, N'RTS_M', N'Right to Service', N'लोकसेवा हक्क', N'Landmark', N'RTS', N'Right to Service administration module', 1, @AdminUserId, GETDATE());
END;

SELECT @RtsModuleId = [Id] FROM [CORE].[ModuleMaster] WHERE [ModuleCode] = N'RTS_M';

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

DECLARE @ScreenGroups TABLE (
    [ScreenGroupCode] VARCHAR(50),
    [ScreenGroupName] VARCHAR(100),
    [ScreenGroupNameLocal] NVARCHAR(100),
    [ScreenGroupIcon] VARCHAR(50),
    [DisplayOrder] INT
);

INSERT INTO @ScreenGroups ([ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal], [ScreenGroupIcon], [DisplayOrder])
VALUES
    ('RTS_CITIZEN',       'Citizen Services',      N'नागरिक सेवा',           'Users',           1),
    ('RTS_OFFICER',       'Officer Workplace',     N'अधिकारी कार्यस्थळ',     'Briefcase',       2),
    ('RTS_CONFIGURATION', 'System Configuration',  N'प्रणाली संरचना',        'Settings',        3),
    ('RTS_REPORTS',       'Reports & Analytics',   N'अहवाल व विश्लेषण',      'BarChart3',       4);

MERGE [CORE].[ScreenGroupMaster] AS target
USING @ScreenGroups AS source
ON target.[ScreenGroupCode] = source.[ScreenGroupCode]
WHEN MATCHED THEN
    UPDATE SET
        target.[ScreenGroupName] = source.[ScreenGroupName],
        target.[ScreenGroupNameLocal] = source.[ScreenGroupNameLocal],
        target.[ScreenGroupIcon] = source.[ScreenGroupIcon],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = 1,
        target.[UpdatedBy] = @AdminUserId,
        target.[UpdatedDate] = GETDATE()
WHEN NOT MATCHED THEN
    INSERT ([ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal], [ScreenGroupIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (source.[ScreenGroupCode], source.[ScreenGroupName], source.[ScreenGroupNameLocal], source.[ScreenGroupIcon], source.[DisplayOrder], 1, @AdminUserId, GETDATE());

DECLARE @Screens TABLE (
    [ScreenGroupCode] VARCHAR(50),
    [ScreenCode] VARCHAR(50),
    [ScreenName] VARCHAR(100),
    [ScreenNameLocal] NVARCHAR(100),
    [ScreenIcon] NVARCHAR(50),
    [RoutePath] NVARCHAR(200),
    [DisplayOrder] INT
);

INSERT INTO @Screens ([ScreenGroupCode], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [DisplayOrder])
VALUES
    ('RTS_CITIZEN',       'RTS_SERVICES_PORTAL',  'Service Catalog',     N'सेवा सूची',                N'LayoutGrid',      N'/rts/services',                                 1),
    ('RTS_CITIZEN',       'RTS_TRACK_STATUS',     'Track Application',   N'अर्जाची स्थिती ट्रॅक करा', N'Search',          N'/rts/track',                                    2),
    ('RTS_OFFICER',       'RTS_OFFICER_DASHBOARD','Officer Dashboard',   N'अधिकारी डॅशबोर्ड',         N'LayoutDashboard', N'/rts/officer-dashboard',                        1),
    ('RTS_OFFICER',       'RTS_APPEAL_DASHBOARD', 'Appeals Management',  N'अपील व्यवस्थापन',          N'Gavel',           N'/rts/appeals',                                  2),
    ('RTS_CONFIGURATION', 'RTS_DEPARTMENTS',     'Department Master',   N'विभाग व्यवस्थापन',         N'Building2',       N'/rts/configuration-settings/rts-departments',   1),
    ('RTS_CONFIGURATION', 'RTS_SERVICES',        'RTS Services',        N'आरटीएस सेवा',             N'Activity',        N'/rts/services',                                 2),
    ('RTS_CONFIGURATION', 'RTS_FIELDS',          'RTS Fields',          N'आरटीएस फील्ड्स',          N'Sliders',         N'/rts/fields',                                   3),
    ('RTS_CONFIGURATION', 'RTS_APPROVAL_FLOW',   'Approval Flow Master',N'मंजुरी प्रवाह मास्टर',     N'GitMerge',        N'/rts/configuration-settings/rts-workflows',     4),
    ('RTS_CONFIGURATION', 'RTS_CERTIFICATES',    'Certificate Master',  N'प्रमाणपत्र संरचना',       N'Award',           N'/rts/configuration-settings/rts-certificates',   5),
    ('RTS_CONFIGURATION', 'RTS_USERS',           'RTS User Management', N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users',       N'/rts/users',                                    6);

INSERT INTO [CORE].[ScreenMaster] ([ScreenGroupId], [ModuleId], [DepartmentId], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [IsMenu], [IsAuthenticationRequired], [IsPropertyLockable], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate])
SELECT
    g.[Id], @RtsModuleId, @RtsDepartmentId, s.[ScreenCode], s.[ScreenName], s.[ScreenNameLocal], s.[ScreenIcon], s.[RoutePath], 1, 0, 0, s.[DisplayOrder], 1, @AdminUserId, GETDATE()
FROM @Screens s
INNER JOIN [CORE].[ScreenGroupMaster] g
    ON g.[ScreenGroupCode] = s.[ScreenGroupCode]
WHERE NOT EXISTS (
    SELECT 1 FROM [CORE].[ScreenMaster] existing
    WHERE existing.[ScreenCode] = s.[ScreenCode]
);
GO
-- =========================================================
-- 1. RTS.DepartmentMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[DepartmentMaster] ON;
GO
;WITH LiveDepts AS (
    SELECT * FROM (VALUES
        (1, N'Property Tax', N'मालमत्ता कर', N'Home', 1, 1, 0, N'2026-07-15 16:26:57.467')
       ,(2, N'Water Connection', N'पाणी पुरवठा', N'Droplets', 2, 1, 0, N'2026-07-15 16:26:57.467')
       ,(3, N'Trade License', N'व्यवसाय परवाना', N'Briefcase', 3, 1, 0, N'2026-07-15 16:26:57.467')
       ,(4, N'Town Planning', N'नगर रचना', N'Map', 4, 1, 0, N'2026-07-15 16:26:57.467')
       ,(5, N'Birth & Death', N'जन्म आणि मृत्यू', N'HeartPulse', 5, 1, 0, N'2026-07-15 16:26:57.467')
       ,(6, N'Education', N'शिक्षण', N'GraduationCap', 6, 1, 0, N'2026-07-15 16:26:57.467')
       ,(7, N'Health', N'आरोग्य', N'Activity', 7, 1, 0, N'2026-07-15 16:26:57.467')
       ,(8, N'Fire', N'अग्निशमन', N'Flame', 8, 1, 0, N'2026-07-15 16:26:57.467')
       ,(9, N'Marriage Certificate', N'लग्न नोंदणी प्रमाणपत्र', N'Heart', 9, 1, 0, N'2026-07-15 16:26:57.467')
       ,(10, N'Tree', N'वृक्ष प्राधिकरण', N'TreePine', 10, 1, 0, N'2026-07-15 16:26:57.467')
       ,(11, N'Sanitation', N'स्वच्छता विभाग', N'Trash2', 11, 1, 0, N'2026-07-15 16:26:57.467')
       ,(12, N'PWD', N'सार्वजनिक बांधकाम विभाग', N'Building', 12, 1, 0, N'2026-08-17 13:30:48.017')
    ) AS V (Id, DepartmentName, DepartmentNameLocal, DepartmentIcon, DisplayOrder, IsActive, CreatedBy, CreatedDate)
)
MERGE [RTS].[DepartmentMaster] AS Target
USING LiveDepts AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.DepartmentName = Source.DepartmentName, Target.DepartmentNameLocal = Source.DepartmentNameLocal,
    Target.DepartmentIcon = Source.DepartmentIcon, Target.DisplayOrder = Source.DisplayOrder, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, DepartmentName, DepartmentNameLocal, DepartmentIcon, DisplayOrder, IsActive, CreatedBy, CreatedDate)
VALUES (Source.Id, Source.DepartmentName, Source.DepartmentNameLocal, Source.DepartmentIcon, Source.DisplayOrder, Source.IsActive, Source.CreatedBy, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[DepartmentMaster] OFF;
GO

-- =========================================================
-- 2. RTS.ServiceMaster (100% Live Records with Classification)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ServiceMaster] ON;
GO
;WITH LiveServices AS (
    SELECT * FROM (VALUES
        (19, 2, 7165, N'Change of Water Connection Usage Type', N'वापरामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 39, N'15 Days', 0.00, 0, 1, 1, N'2026-07-20 13:31:33.447')
       ,(20, 2, 7166, N'Preparation of Water Bill', N'पाणी देयक तयार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileText', 40, N'3 Days', 0.00, 0, 1, 1, N'2026-07-20 13:31:33.447')
       ,(26, 2, 7172, N'Complaint Regarding Water Pressure Capacity', N'पाण्याच्या दाब क्षमता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=19&upicid=', N'AlertTriangle', 46, N'3 Days', 0.00, 0, 1, 0, N'2026-07-15 16:26:57.497')
       ,(33, 3, 13, N'Changing Occupations / Business Type', N'व्यवसाय बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 13, N'15 Days', 200.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(36, 3, 16, N'Cancellation of License', N'परवाना रद्द करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 16, N'15 Days', 0.00, 0, 1, 1, N'2026-07-20 13:31:33.447')
       ,(43, 4, 3, N'Issuance of Zone Certificate', N'झोन दाखला देणे', NULL, NULL, N'Map', 3, N'7 Days', 500.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(44, 4, 4, N'Giving Part Map', N'भाग नकाशा देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'Map', 4, N'3 Days', 700.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(45, 4, 5, N'Issuance of Construction Permit', N'बांधकाम परवाना देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'HardHat', 5, N'7 Days', 500.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(46, 4, 6, N'Issuance of plinth certificate', N'जोते प्रमाणपत्र देणे', NULL, NULL, N'MapPin', 6, N'7 Days', 200.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(47, 4, 7, N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'Key', 7, N'7 Days', 0.00, 0, 1, 0, N'2026-07-15 16:26:57.497')
       ,(48, 12, 61, N'Underground OFC Cable Permission', N'भुमिगत दुरसंचार वाहिनी (ऑप्टीकल फायबर केबल) टाकण्याकरीता परवानगी देणे', NULL, N'#', N'Cable', 61, N'60 Days', 120.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(49, 12, 63, N'Filling Potholes on City Roads', N'रस्त्यांवरील खड्डे बुजविणे', NULL, N'#', N'Wrench', 63, N'5 Days', 50.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(50, 12, 64, N'Maintaining & Securing Sewer Covers', N'गटारांवरील झाकणे सुस्थितीत ठेवणे', NULL, N'#', N'Shield', 64, N'5 Days', 50.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(53, 5, 20, N'Birth Certificate', N'जन्म प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'Baby', 20, N'3 Days', 10.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(54, 5, 21, N'Death Certificate', N'मृत्यु प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'HeartOff', 21, N'3 Days', 10.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(55, 6, 50, N'School Leaving / Duplicate Certificate', N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे', NULL, NULL, N'GraduationCap', 50, N'3 Days', 25.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(56, 6, 51, N'Issuance of transfer certificate', N'स्थलांतर दाखला देणे', NULL, NULL, N'GraduationCap', 51, N'15 Days', 25.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(57, 6, 52, N'Issuance of duplicate mark sheet', N'गुणपत्रिकेची दुय्यम प्रत देणे', NULL, NULL, N'GraduationCap', 52, N'7 Days', 25.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(58, 7, 53, N'Nursing home license', N'शुश्रूषा-गृह परवाना देणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 53, N'30 Days', 3500.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(59, 7, 54, N'Renewal of nursing home license', N'शुश्रूषा-गृह परवान्याचे नुतनीकरण करणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 54, N'30 Days', 3500.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(60, 7, 55, N'Change of nursing home license holder / partner name', N'शुश्रूषा-गृह परवान्यावर परवानाधारक/भागीदाराचे नाव बदलणे', NULL, N'https://maha-mnhregistration.co.in/', N'UserPlus', 55, N'30 Days', 200.00, 1, 1, 1, N'2026-07-20 13:31:33.447')
       ,(61, 4, 1, N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'ShieldCheck', 1, N'7 Days', 120.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(62, 4, 2, N'Mandap NOC', N'मंडपासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'Building2', 2, N'7 Days', 200.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(63, 8, 18, N'Issuance of Fire Safety NOC', N'अग्निशमन नाहरकत दाखला देणे', NULL, N'#', N'Flame', 18, N'7 Days', 1000.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(64, 8, 19, N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला देणे', NULL, N'#', N'Flame', 19, N'15 Days', 200.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(65, 9, 22, N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र देणे', NULL, N'https://mahaulb.in/MahaULB/index', N'Heart', 22, N'3 Days', 100.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(66, 10, 62, N'Tree Felling Permission', N'वृक्षतोड परवानगी देणे', NULL, NULL, N'TreePine', 62, N'45 Days', 2000.00, 1, 1, 0, N'2026-07-15 16:26:57.497')
       ,(68, 11, 65, N'Maintaining cleanliness', N'शहरात स्वच्छता राखणे', NULL, N'#', N'Trash2', 65, N'1 Days', 0.00, 0, 1, 1, N'2026-07-20 13:31:33.447')
       ,(69, 2, 7175, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=21&upicid=', N'Droplet', 49, N'15 Days', 0.00, 0, 1, 0, N'2026-07-15 16:26:57.497')
       ,(80, 2, 7174, N'Provision of New Water Tap Connection', N'नळ जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=6&upicid=', N'Droplets', 48, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(81, 2, 7162, N'Changing the Water Connection Size', N'नळ जोडणी आकारामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 36, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(82, 2, 7163, N'Temporary / Permanent Disconnection of Water Connection', N'तात्पुरते/कायमस्वरूपी नळ जोडणी खंडीत करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=10&upicid=', N'Droplets', 37, N'7 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(83, 2, 7164, N'Reconnection of Water Tap', N'पुनः जोडणी करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=14&upicid=', N'Droplets', 38, N'15 Days', 1000.00, 1, 1, 0, N'2026-07-21 18:44:51.083')
       ,(84, 2, 43, N'Water Bill No Dues Certificate', N'थकबाकी नसल्याचा दाखला', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileCheck', 43, N'3 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(85, 2, 7170, N'Complaint Regarding Faulty Water Meter', N'नादुरुस्त मीटर तक्रार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=17&upicid=', N'AlertTriangle', 44, N'7 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(86, 2, 7171, N'Complaint Regarding Unauthorized Water Tap Connection', N'अनधिकृत नळ जोडणी तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=18&upicid=', N'AlertTriangle', 45, N'7 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(87, 2, 7173, N'Complaint Regarding Water Quality', N'पाण्याची गुणवत्ता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=20&upicid=', N'AlertTriangle', 47, N'3 Days', 0.00, 0, 1, 0, N'2026-07-21 18:44:51.083')
       ,(100, 2, 7167, N'Issuance of Plumber License', N'प्लंबर परवाना', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=15&upicid=', N'Wrench', 41, N'15 Days', 1000.00, 1, 1, 0, N'2026-07-21 18:44:51.083')
       ,(101, 2, 7168, N'Renewal of Plumber License', N'प्लंबर परवाना नुतनीकरण करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=16&upicid=', N'Wrench', 42, N'15 Days', 1000.00, 1, 1, 0, N'2026-07-21 18:44:51.083')
       ,(137, 3, 8, N'Obtaining New Trade License', N'नविन परवाना मिळणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 8, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(138, 3, 9, N'Renewal of Trade License', N'परवान्याचे नुतनीकरण', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 9, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(139, 3, 10, N'Transfer of Trade License', N'परवाना हस्तांतर', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 10, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(140, 3, 11, N'Duplicate Copy of Trade License', N'परवाना दुय्यम प्रत', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 11, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(141, 3, 12, N'Change of Business Name / Establishment / Address', N'व्यवसायाचे नाव बदलणे/प्रतिष्ठानात/पत्यात बदल', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 12, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(142, 3, 14, N'Change of License Holder / Partner Name', N'परवाना धारक/भागीदाराचे नाव बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 14, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(143, 3, 15, N'Change in Number of Partners (Increase/Decrease)', N'भागीदाराच्या संख्येत बदल (वाढ/कमी)', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 15, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(144, 3, 17, N'Notice on Renewal of Expired License', N'कालबाह्य परवानासाठी नुतनीकरण सुचना', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 17, N'15 Days', 200.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(145, 1, 7176, N'New Property Tax Assessment', N'नव्याने कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/selfAssessment/index', N'Home', 23, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(146, 1, 7177, N'Re-Assessment of Property Tax', N'पुनः कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/21?upicNo=', N'Home', 24, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(147, 1, 7178, N'Preparation of Tax Demand Notice', N'कराचे मागणी पत्र तयार करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 25, N'3 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(148, 1, 7179, N'Avail Property Tax Exemption', N'कर माफी मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/9?upicNo=', N'Receipt', 26, N'7 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(149, 1, 7180, N'Tax Exemption for Non-Resident Properties', N'रहिवास नसल्यास मालमत्तांना करात सुट मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/20?upicNo=', N'Receipt', 27, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(150, 1, 7181, N'Property Tax Self-Assessment', N'स्वयंमुल्यांकन', NULL, N'https://onesolutionakola.tabamc.in/selfAssessment/index', N'Calculator', 28, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(151, 1, 7182, N'Registration of Objection on Tax Assessment', N'आक्षेप नोंदविणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/19?upicNo=', N'AlertTriangle', 29, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(152, 1, 7183, N'Sub-division of Property', N'उपविभागामध्ये मालमत्ता विभाजन', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/PropertySplit?upicNo=', N'GitFork', 30, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(153, 1, 7184, N'Re-assessment After Demolition and Reconstruction', N'मालमत्ता पाडणे व पुनःबांधणी कर आकारणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/ChangeInUse?upicNo=', N'Hammer', 31, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(154, 1, 7185, N'Issuance of Property Tax Assessment Copy (8A)', N'मालमत्ता कर उतारा देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 32, N'3 Days', 25.00, 1, 1, 0, N'2026-07-21 18:57:16.223')
       ,(155, 1, 7186, N'Issuance of No Dues Certificate', N'थकबाकी नसल्याचा दाखला देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileCheck', 33, N'3 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(156, 1, 7187, N'Property Transfer Registration Certificate', N'अ) दस्ताऐवजाच्या आधारे मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे ब) वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/MutationView?upicNo=', N'UserCheck', 34, N'15 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(157, 1, 7189, N'Change of Ownership Name', N'मालकी हक्कात बदल करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/MutationView?upicNo=', N'UserPlus', 35, N'7 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(158, 3, 56, N'Issuance of Lodging House License', N'लॉजिंग हाऊस परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 56, N'30 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(159, 3, 57, N'Renewal of Lodging House License', N'लॉजिंग हाऊस परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 57, N'30 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(160, 3, 58, N'Issuance of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 58, N'30 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(161, 3, 59, N'Renewal of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 59, N'30 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
       ,(162, 3, 60, N'Issuance of Hawker Registration Certificate', N'फेरीवाले नोंदणी प्रमाणपत्र देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Store', 60, N'30 Days', 0.00, 0, 1, 0, N'2026-07-21 18:57:16.223')
    ) AS V (Id, DepartmentId, GovtServiceCode, ServiceName, ServiceNameLocal, Description, ServiceUrl, ServiceIcon, DisplayOrder, Sla, Fees, FeesRequired, IsActive, CreatedBy, CreatedDate)
)
MERGE [RTS].[ServiceMaster] AS Target
USING LiveServices AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.DepartmentId = Source.DepartmentId, Target.GovtServiceCode = Source.GovtServiceCode,
    Target.ServiceName = Source.ServiceName, Target.ServiceNameLocal = Source.ServiceNameLocal, Target.Description = Source.Description,
    Target.ServiceUrl = Source.ServiceUrl, Target.ServiceIcon = Source.ServiceIcon,
    Target.DisplayOrder = Source.DisplayOrder, Target.Sla = Source.Sla,
    Target.Fees = Source.Fees, Target.FeesRequired = Source.FeesRequired, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, DepartmentId, GovtServiceCode, ServiceName, ServiceNameLocal, Description, ServiceUrl, ServiceIcon, DisplayOrder, Sla, Fees, FeesRequired, IsActive, CreatedBy, CreatedDate)
VALUES (Source.Id, Source.DepartmentId, Source.GovtServiceCode, Source.ServiceName, Source.ServiceNameLocal, Source.Description, Source.ServiceUrl, Source.ServiceIcon, Source.DisplayOrder, Source.Sla, Source.Fees, Source.FeesRequired, Source.IsActive, Source.CreatedBy, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[ServiceMaster] OFF;
GO

-- =========================================================
-- 3. RTS.FieldDefinition (100% Live Records with Clean Unicode)
-- =========================================================
SET IDENTITY_INSERT [RTS].[FieldDefinition] ON;
GO
;WITH LiveFields AS (
    SELECT * FROM (VALUES
        (1, 4, 61, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(2, 4, 61, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(3, 4, 61, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(4, 4, 61, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(5, 4, 61, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(6, 4, 61, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(7, 4, 61, N'ownerFirstName', N'Owner First Name', N'मालकाचे पहिले नाव', N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(8, 4, 61, N'ownerMiddleName', N'Owner Middle Name', N'मालकाचे मधले नाव', N'text', N'Owner Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(9, 4, 61, N'ownerLastName', N'Owner Last Name', N'मालकाचे आडनाव', N'text', N'Owner Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(10, 4, 61, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, 1, 10, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(11, 4, 61, N'ownerEmail', N'Owner Email', N'मालकाचा ई-मेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(12, 4, 61, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(13, 4, 61, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', 0, 13, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(14, 4, 61, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(15, 4, 61, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(16, 4, 61, N'businessName', N'Business / Trade Name', N'व्यवसाय / व्यापाराचे नाव', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(17, 4, 61, N'workers', N'Number of Employees', N'कर्मचाऱ्यांची संख्या', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(18, 4, 61, N'propertyTaxNo', N'Property Tax Assessment Number', N'मालमत्ता कर आकारणी उतारा क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(19, 4, 61, N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'मालमत्ता कर पावती क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(20, 4, 61, N'businessAddress', N'Business Address', N'पत्ता', N'textarea', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(21, 4, 61, N'activityType', N'Type of Activity', N'व्यवसायाचा प्रकार', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(22, 4, 61, N'licenseCategory', N'Licensing Category', N'परवाना वर्ग', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(23, 4, 61, N'specialCategory', N'Specify License Category (if Special)', N'परवाना श्रेणी नमूद करा (विशेष असल्यास)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(24, 4, 61, N'newBusinessProposal', N'New Business Proposal?', N'नवीन व्यवसाय परवाना प्रस्ताव?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(25, 4, 61, N'workingHours', N'Working Hours', N'कामाच्या वेळा', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(26, 4, 61, N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(27, 4, 61, N'natureOfGoods', N'Nature of Goods Stored / Traded', N'साठवलेल्या मालाचे प्रकार', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(28, 4, 61, N'flammableGoods', N'Flammable/Explosive Goods?', N'ज्वलनशील / स्फोटक माल आहे का?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(29, 4, 61, N'flammableGoodsDetail', N'Flammable Material Details', N'ज्वलनशील मालाचे तपशील', N'text', N'Storage, Safety & Hazard Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(30, 9, 65, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(31, 9, 65, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(32, 9, 65, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(33, 9, 65, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(34, 9, 65, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(35, 9, 65, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(36, 9, 65, N'groomFirstName', N'Groom First Name', N'वराचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(37, 9, 65, N'groomMiddleName', N'Groom Middle Name', N'वराचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(38, 9, 65, N'groomLastName', N'Groom Last Name', N'वराचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(39, 9, 65, N'groomAge', N'Age', N'वय', N'number', N'Bridegroom Details', NULL, NULL, N'{"min":21,"max":100}', 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(40, 9, 65, N'groomDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bridegroom Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(41, 9, 65, N'groomAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bridegroom Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(42, 9, 65, N'groomFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(43, 9, 65, N'groomFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(44, 9, 65, N'groomFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(45, 9, 65, N'groomMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(46, 9, 65, N'groomMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(47, 9, 65, N'groomMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(48, 9, 65, N'groomparentCity', N'groomParent City', N'वराच्या पालकांचे शहर', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(49, 9, 65, N'groomparentState', N'groomParent State', N'वराच्या पालकांचे राज्य', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(50, 9, 65, N'groomOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(51, 9, 65, N'groomReligion', N'Religion', N'धर्म', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(52, 9, 65, N'brideFirstName', N'Bride First Name', N'वधूचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(53, 9, 65, N'brideMiddleName', N'Bride Middle Name', N'वधूचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(54, 9, 65, N'brideLastName', N'Bride Last Name', N'वधूचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(55, 9, 65, N'brideAge', N'Age', N'वय', N'number', N'Bride Details', NULL, NULL, N'{"min":18,"max":100}', 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(56, 9, 65, N'brideDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bride Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(57, 9, 65, N'brideAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bride Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 28, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(58, 9, 65, N'brideFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(59, 9, 65, N'brideFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(60, 9, 65, N'brideFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(61, 9, 65, N'brideMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(62, 9, 65, N'brideMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(63, 9, 65, N'brideMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(64, 9, 65, N'brideparentCity', N'brideParent City', N'वधूच्या पालकांचे शहर', N'text', N'Bride Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(65, 9, 65, N'brideparentState', N'brideParent State', N'वधूच्या पालकांचे राज्य', N'text', N'Bride Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(66, 9, 65, N'brideOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bride Details', NULL, NULL, NULL, 0, 37, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(67, 9, 65, N'brideReligion', N'Religion', N'धर्म', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(68, 9, 65, N'marriageDate', N'Date of Marriage', N'लग्न तारीख', N'date', N'Marriage Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 39, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(69, 9, 65, N'marriagePlace', N'Place of Marriage', N'लग्न ठिकाण', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(70, 9, 65, N'marriageCity', N'marriage City', N'विवाहाचे शहर', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(71, 9, 65, N'marriageState', N'marriage State', N'विवाहाचे राज्य', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(72, 9, 65, N'witness1FirstName', N'Witness 1 First Name', N'साक्षीदार १ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(73, 9, 65, N'witness1MiddleName', N'Witness 1 Middle Name', N'साक्षीदार १ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(74, 9, 65, N'witness1LastName', N'Witness 1 Last Name', N'साक्षीदार १ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(75, 9, 65, N'witness2FirstName', N'Witness 2 First Name', N'साक्षीदार २ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 46, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(76, 9, 65, N'witness2MiddleName', N'Witness 2 Middle Name', N'साक्षीदार २ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 47, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(77, 9, 65, N'witness2LastName', N'Witness 2 Last Name', N'साक्षीदार २ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(78, 9, 65, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(79, 11, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(80, 11, 69, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(81, 11, 69, N'email', N'Email (optional)', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(82, 11, 69, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(83, 11, 69, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(84, 11, 69, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(85, 11, 69, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property / Location Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(86, 11, 69, N'wardId', N'Ward', N'प्रभाग', N'select', N'Property / Location Details', N'[
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
]', NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(87, 11, 69, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 9, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.547')
       ,(88, 11, 69, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Property / Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(89, 11, 69, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Property / Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(90, 11, 69, N'premisesOccupancyType', N'Premises Type', N'जागेचा प्रकार', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(91, 11, 69, N'connectionType', N'Connection Type', N'जोडणीचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(92, 11, 69, N'useType', N'Use Type', N'वापराचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(93, 11, 69, N'noOfUnits', N'No. of Units (optional)', N'युनिट्सची संख्या (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(94, 11, 69, N'existingArrangement', N'Current Wastewater Arrangement', N'सांडपाण्याची सध्याची व्यवस्था', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(95, 11, 69, N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(96, 11, 69, N'roadCuttingRequired', N'Road Cutting Required?', N'रस्ता खोदाई आवश्यक आहे का?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(97, 11, 69, N'roadCuttingDetails', N'Road Cutting Details (optional)', N'रस्ता खोदाईचे तपशील (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(98, 11, 69, N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, 50, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(99, 11, 69, N'tradeLicenseNo', N'Trade License No (optional)', N'व्यवसाय परवाना क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 21, NULL, NULL, 50, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(100, 11, 69, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.547')
       ,(101, 4, 61, N'fireNocUpdated', N'Fire NOC Up-to-date?', N'अग्निशामक परवाना अद्ययावत आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(102, 4, 61, N'policeNocSubmitted', N'Police NOC Submitted?', N'पोलीस परवाना सादर केला आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(103, 4, 61, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(104, 4, 62, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(105, 4, 62, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(106, 4, 62, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(107, 4, 62, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(108, 4, 62, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(109, 4, 62, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(110, 4, 62, N'ownerFullName', N'Owner Full Name', N'मालकाचे पूर्ण नाव', N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(113, 4, 62, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, 1, 10, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(114, 4, 62, N'ownerEmail', N'Owner Email', N'मालकाचा ई-मेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(115, 4, 62, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(116, 4, 62, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', 0, 13, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(117, 4, 62, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(118, 4, 62, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(119, 4, 62, N'mandalName', N'Mandal Name (Reg. Charity Comm.)', N'मंडळाचे नाव (नोंदणीकृत धर्मादाय संस्था)', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(120, 4, 62, N'registrationNo', N'Registration Number', N'नोंदणी क्रमांक', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(121, 4, 62, N'registrationYear', N'Registration Year', N'नोंदणी वर्ष', N'year', N'Event & Permission Info', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(122, 4, 62, N'chairmanName', N'Name of Chairman/Secretary', N'अध्यक्ष / सचिव यांचे नाव', N'text', N'Event & Permission Info', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(123, 4, 62, N'contactNo', N'Contact No. (President/Secretary)', N'संपर्क क्रमांक (अध्यक्ष / सचिव)', N'tel', N'Event & Permission Info', NULL, NULL, NULL, 0, 20, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(124, 4, 62, N'eventType', N'Type of Event', N'कार्यक्रमाचा प्रकार', N'select', N'Event & Permission Info', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(125, 4, 62, N'eventStartDate', N'Event Start Date', N'कार्यक्रम सुरू होण्याची तारीख', N'date', N'Event & Permission Info', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(126, 4, 62, N'eventEndDate', N'Event End Date', N'कार्यक्रम समाप्तीची तारीख', N'date', N'Event & Permission Info', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(127, 4, 62, N'placeOwnership', N'Ownership of Tent Place', N'कार्यक्रम स्थळाची मालकी', N'select', N'Event & Permission Info', N'[{"value":"Private","label":{"en":"Private","hi":"निजी","mr":"खाजगी"}},{"value":"Municipal","label":{"en":"Municipal/Council","hi":"नगर निगम","mr":"महापालिका/परिषद"}},{"value":"Public","label":{"en":"Public Road","hi":"सार्वजनिक सड़क","mr":"सार्वजनिक रस्ता"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(128, 4, 62, N'zoneNo', N'Zone', N'झोन', N'select', N'Event & Permission Info', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 25, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.597')
       ,(129, 4, 62, N'wardArea', N'Ward Area', N'प्रभाग क्षेत्र', N'text', N'Event & Permission Info', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(130, 4, 62, N'plotNo', N'Plot No', N'प्लॉट क्रमांक', N'text', N'Event & Permission Info', NULL, NULL, N'{
  "maxLength": 6,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(131, 4, 62, N'pandolAddress', N'Pandol / Stage Address', N'मंडप / स्टेजचा पत्ता', N'textarea', N'Event & Permission Info', NULL, NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(132, 4, 62, N'mandapType', N'Mandap Type', N'मंडपाचा प्रकार', N'select', N'Mandap Structural Details', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(133, 4, 62, N'mandapArea', N'Mandap Area (sq.ft.)', N'मंडप क्षेत्रफळ (चौ. फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(134, 4, 62, N'areaSqFt', N'Area (Sq Ft)', N'क्षेत्रफळ (चौ. फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(135, 4, 62, N'volunteers', N'No. of Volunteers', N'स्वयंसेवकांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(136, 4, 62, N'numberOfPillars', N'No. of Pillars / Support Beams', N'खांब / आधार बीमची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 33, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(137, 4, 62, N'beamMaterial', N'Material Used (Wood/Iron/Steel/Aluminum)', N'वापरलेले साहित्य (लाकूड / लोखंड / स्टील / ॲल्युमिनियम)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 34, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(138, 4, 62, N'structuralEngineerName', N'Structural Engineer / Fabricator Name', N'स्ट्रक्चरल अभियंता / फॅब्रिकेटरचे नाव', N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(139, 4, 62, N'mandapHeight', N'Mandap Height (feet)', N'मंडपाची उंची (फूट)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 36, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(140, 4, 62, N'windLoadResistance', N'Wind Load Resistance Tested?', N'वाऱ्याच्या भाराची प्रतिकार क्षमता तपासली आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(141, 4, 62, N'fireExtinguishersAvailable', N'Fire Extinguishers Available?', N'अग्निशामक यंत्रे उपलब्ध आहेत का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(142, 4, 62, N'extinguisherCount', N'Number of Extinguishers', N'अग्निशामक यंत्रांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 0, 39, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(143, 4, 62, N'electricalLoad', N'Electrical Load Installed (kW)', N'स्थापित विद्युत भार (kW)', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 40, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(144, 4, 62, N'earthingProvided', N'Earthing Provided?', N'अर्थिंगची व्यवस्था केली आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(145, 4, 62, N'crowdCapacity', N'Expected Crowd Capacity', N'अपेक्षित गर्दीची क्षमता', N'text', N'Mandap Structural Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(146, 4, 62, N'emergencyExits', N'Number of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Mandap Structural Details', NULL, NULL, N'{"min":0}', 1, 43, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(147, 4, 62, N'generatorUsed', N'Generator to be Used?', N'जनरेटर वापरणार आहे का?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(148, 4, 62, N'contractorAddress', N'Pandol Contractor Address', N'मंडप ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(149, 4, 62, N'contractorContact', N'Pandol Contractor Contact', N'मंडप ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 46, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(150, 4, 62, N'decoratorName', N'Decorator/Electrical Name', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचे नाव', N'text', N'Contractors Info', NULL, NULL, NULL, 1, 47, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(151, 4, 62, N'decoratorAddress', N'Decorator/Electrical Address', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(152, 4, 62, N'decoratorContact', N'Decorator/Electrical Contact', N'डेकोरेटर / इलेक्ट्रिकल ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 49, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(153, 4, 62, N'soundName', N'Sound/Speaker Contractor Name', N'ध्वनी / स्पीकर ठेकेदाराचे नाव', N'text', N'Contractors Info', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(154, 4, 62, N'soundAddress', N'Sound/Speaker Address', N'ध्वनी / स्पीकर ठेकेदाराचा पत्ता', N'textarea', N'Contractors Info', NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(155, 4, 62, N'soundContact', N'Sound/Speaker Contact', N'ध्वनी / स्पीकर ठेकेदाराचा संपर्क क्रमांक', N'tel', N'Contractors Info', NULL, NULL, NULL, 1, 52, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(156, 4, 62, N'soundType', N'Sound/Speaker Type', N'ध्वनी / स्पीकरचा प्रकार', N'select', N'Contractors Info', N'[{"value":"DJ","label":{"en":"DJ System","hi":"डीजे सिस्टम","mr":"डीजे सिस्टम"}},{"value":"Loudspeaker","label":{"en":"Loudspeaker","hi":"लाउडस्पीकर","mr":"लाउडस्पीकर"}},{"value":"Traditional","label":{"en":"Traditional Instruments","hi":"पारंपरिक वाद्ययंत्र","mr":"पारंपारिक वाद्ये"}}]', NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(157, 4, 62, N'policeStation', N'Concerned Police Station', N'संबंधित पोलीस स्टेशन', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 54, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(158, 4, 62, N'trafficPoliceStation', N'Concerned Traffic Police Station', N'संबंधित वाहतूक पोलीस स्टेशन', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(159, 4, 62, N'fireStation', N'Nearest Fire Station', N'जवळचे अग्निशमन केंद्र', N'textarea', N'Applicant Undertaking & Compliance', NULL, NULL, NULL, 1, 56, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(160, 4, 62, N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'सार्वजनिक मालमत्तेचे कोणतेही नुकसान होणार नाही याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 57, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(161, 4, 62, N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'कार्यक्रमानंतर परिसर स्वच्छ करण्याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(162, 4, 62, N'declaration', N'I hereby declare that the information provided is true and correct.', N'मी घोषित करतो / करते की दिलेली माहिती खरी व अचूक आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(163, 8, 63, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(164, 8, 63, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(165, 8, 63, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(166, 8, 63, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(167, 8, 63, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(168, 8, 63, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(169, 8, 63, N'ownerName', N'Name of Owner', N'मालकाचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(170, 8, 63, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(171, 8, 63, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(172, 8, 63, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(173, 8, 63, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(174, 8, 63, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(175, 8, 63, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(176, 8, 63, N'zoneWard', N'Zone/Ward', N'झोन / प्रभाग', N'select', N'Owner & Premises details', N'[
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
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(177, 8, 63, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(178, 8, 63, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(179, 8, 63, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(180, 8, 63, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(181, 8, 63, N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'प्रस्तावित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(182, 8, 63, N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'प्रस्तावित आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(183, 8, 63, N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'प्रस्तावित एकत्रीकरण / मस्टर पॉईंट तपशील', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(184, 8, 63, N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'अत्यंत ज्वलनशील साहित्य साठविण्यात येणार आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(185, 8, 63, N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(186, 8, 63, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(187, 8, 63, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(188, 8, 64, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(189, 8, 64, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(190, 8, 64, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(191, 8, 64, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(192, 8, 64, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(193, 8, 64, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(194, 8, 64, N'ownerName', N'Name of Owner', NULL, N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(195, 8, 64, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(196, 8, 64, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(197, 8, 64, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(198, 8, 64, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(199, 8, 64, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(200, 8, 64, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.597')
       ,(201, 5, 53, N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'जन्मतारीख (दि-महा-वर्ष)', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(202, 5, 53, N'gender', N'Sex', N'लिंग', N'select', N'Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(203, 5, 53, N'childFirstName', N'Child First Name', N'बालकाचे पहिले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(204, 5, 53, N'childMiddleName', N'Child Middle Name', N'बालकाचे मधले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(205, 5, 53, N'childLastName', N'Child Last Name', N'बालकाचे आडनाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(206, 5, 53, N'childAadhaar', N'Aadhaar No. (Optional)', N'बालकाचा आधार क्रमांक (ऐच्छिक)', N'text', N'Child, Birth & Registrar Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 12, NULL, NULL, 14, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(207, 5, 53, N'placeOfBirthType', N'Place of Birth Type', N'जन्मस्थळाचा प्रकार', N'select', N'Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(208, 5, 53, N'hospitalName', N'Hospital / Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(209, 5, 53, N'birthPlaceAddress', N'Complete Birth Address', N'संपूर्ण जन्मस्थळाचा पत्ता', N'textarea', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(210, 5, 53, N'birthPlaceSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(211, 5, 53, N'birthPlaceDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(212, 5, 53, N'birthPlaceState', N'State / UT', N'राज्य / केंद्रशासित प्रदेश', N'Select', N'Child, Birth & Registrar Details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(213, 5, 53, N'birthPlacePinCode', N'PIN Code', N'पिन कोड', N'number', N'Child, Birth & Registrar Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, 6, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(214, 5, 53, N'_registrar_header', N'Registrar Details', NULL, N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(215, 5, 53, N'registrationNo', N'Registration No.', N'नोंदणी क्रमांक', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(216, 5, 53, N'registrationDate', N'Registration Date', N'नोंदणी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(217, 5, 53, N'registrationUnit', N'Registration Unit', N'नोंदणी युनिट', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(218, 5, 53, N'registrarTownVillage', N'Town / Village', N'शहर / गाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(219, 5, 53, N'registrarDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(220, 5, 53, N'registrarSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(221, 5, 53, N'registrarName', N'Registrar Name', N'निबंधकाचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(222, 5, 53, N'registrarSignatureDate', N'Registrar Signature Date', N'निबंधक स्वाक्षरी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(223, 5, 53, N'registrarRemarks', N'Remarks', N'शेरा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(224, 5, 53, N'permanentHouseNo', N'House No.', N'कायमचा घर क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(225, 5, 53, N'permanentLocality', N'Locality', N'कायमचा परिसर / वस्ती', N'text', N'Address Information', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(226, 5, 53, N'permanentWard', N'Ward No.', N'कायमचा प्रभाग क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(227, 5, 53, N'permanentTownVillage', N'Town / Village', N'कायमचे शहर / गाव', N'text', N'Address Information', NULL, NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(228, 5, 53, N'permanentSubDistrict', N'Sub-district', N'कायमचा उपजिल्हा', N'text', N'Address Information', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(229, 5, 53, N'permanentDistrict', N'District', N'कायमचा जिल्हा', N'text', N'Address Information', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(230, 5, 53, N'permanentState', N'State / UT', N'कायमचे राज्य / केंद्रशासित प्रदेश', N'Select', N'Address Information', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(231, 5, 53, N'permanentPinCode', N'PIN Code', N'कायमचा पिन कोड', N'text', N'Address Information', NULL, NULL, NULL, 1, 37, NULL, NULL, 6, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(232, 5, 53, N'permanentAddressProofType', N'Permanent Address Proof Type', N'कायमच्या पत्त्याच्या पुराव्याचा प्रकार', N'select', N'Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(233, 5, 53, N'addressProofLast4Digits', N'Last 4 Digits', N'पत्ता पुराव्याचे शेवटचे 4 अंक', N'text', N'Address Information', NULL, NULL, NULL, 1, 39, NULL, NULL, 4, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(234, 5, 53, N'motherFirstName', N'Mother First Name', N'आईचे पहिले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(235, 5, 53, N'motherMiddleName', N'Mother Middle Name', N'आईचे मधले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 41, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(236, 5, 53, N'motherLastName', N'Mother Last Name', N'आईचे आडनाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 42, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(237, 5, 53, N'motherAadhaar', N'Mother Aadhaar No.', N'आईचा आधार क्रमांक', N'text', N'Mother''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 43, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(238, 5, 53, N'motherMobile', N'Mother Mobile No.', N'आईचा मोबाईल क्रमांक', N'tel', N'Mother''s Information', NULL, NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(239, 5, 53, N'motherEmail', N'Mother Email ID', N'आईचा ई-मेल आयडी', N'email', N'Mother''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 45, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(240, 5, 53, N'motherAgeAtMarriage', N'Age at First Marriage', N'पहिल्या विवाहावेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 46, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(241, 5, 53, N'motherAgeAtBirth', N'Age at This Birth', N'या प्रसूतीवेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 47, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(242, 5, 53, N'childrenBornAlive', N'Children Born Alive', N'जिवंत जन्मलेल्या बालकांची संख्या', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 48, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(243, 5, 53, N'fatherFirstName', N'Father First Name', N'वडिलांचे पहिले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(244, 5, 53, N'fatherMiddleName', N'Father Middle Name', N'वडिलांचे मधले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(245, 5, 53, N'fatherLastName', N'Father Last Name', N'वडिलांचे आडनाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(246, 5, 53, N'fatherAadhaar', N'Father Aadhaar No.', N'वडिलांचा आधार क्रमांक', N'text', N'Father''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 52, NULL, NULL, 12, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(247, 5, 53, N'fatherMobile', N'Father Mobile No.', N'वडिलांचा मोबाईल क्रमांक', N'tel', N'Father''s Information', NULL, NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(248, 5, 53, N'fatherEmail', N'Father Email ID', N'वडिलांचा ई-मेल आयडी', N'email', N'Father''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 54, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(249, 5, 53, N'informantFirstName', N'Informant First Name', N'माहिती देणाऱ्याचे पहिले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(250, 5, 53, N'informantMiddleName', N'Informant Middle Name', N'माहिती देणाऱ्याचे मधले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 56, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(251, 5, 53, N'informantLastName', N'Informant Last Name', N'माहिती देणाऱ्याचे आडनाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 57, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(252, 5, 53, N'informantMobile', N'Informant Mobile', N'माहिती देणाऱ्याचा मोबाईल क्रमांक', N'tel', N'Informant Details', NULL, NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(253, 5, 53, N'informantAddress', N'Informant Address', N'माहिती देणाऱ्याचा पत्ता', N'textarea', N'Informant Details', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(254, 5, 53, N'declarationAccuracy', N'I confirm info is accurate', N'मी पुष्टी करतो / करते की दिलेली माहिती अचूक आहे', N'select', N'Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 60, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(255, 5, 53, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 61, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(256, 5, 54, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(257, 5, 54, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(258, 5, 54, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(259, 5, 54, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(260, 5, 54, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(261, 5, 54, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(262, 5, 54, N'deceasedFirstName', N'Deceased First Name', N'मृत व्यक्तीचे पहिले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(263, 5, 54, N'deceasedMiddleName', N'Deceased Middle Name', N'मृत व्यक्तीचे मधले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(264, 5, 54, N'deceasedLastName', N'Deceased Last Name', N'मृत व्यक्तीचे आडनाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(265, 5, 54, N'dateOfDeath', N'Date of Death', N'मृत्यूची तारीख', N'date', N'Deceased Person Information', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(266, 5, 54, N'timeOfDeath', N'Time of Death', N'मृत्यूची वेळ', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(267, 5, 54, N'age', N'Age at Death', N'मृत्यूसमयी वय', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(268, 5, 54, N'gender', N'Gender', N'लिंग', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(269, 5, 54, N'deathType', N'Type of Death', N'मृत्यूचा प्रकार', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(270, 5, 54, N'deathNature', N'Nature of Death (If Accidental)', N'मृत्यूचे स्वरूप (अपघाती असल्यास)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(271, 5, 54, N'incidentPlaceHouseNo', N'Incident House No.', N'घटनास्थळाचा घर क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(272, 5, 54, N'incidentPlaceLocality', N'Incident Locality/Area', N'घटनास्थळाचा परिसर / क्षेत्र', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(273, 5, 54, N'incidentPlaceTown', N'Town/City', N'घटनास्थळाचे शहर / गाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(274, 5, 54, N'incidentPlaceDistrict', N'District', N'घटनास्थळाचा जिल्हा', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(275, 5, 54, N'incidentPlaceState', N'State', N'घटनास्थळाचे राज्य', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(276, 5, 54, N'incidentPlacePinCode', N'PIN Code', N'घटनास्थळाचा पिन कोड', N'number', N'Death Circumstance Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, 6, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(277, 8, 64, N'zoneWard', N'Zone/Ward', N'झोन / प्रभाग', N'select', N'Owner & Premises details', N'[
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
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(278, 8, 64, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(279, 8, 64, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(280, 8, 64, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(281, 8, 64, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(282, 8, 64, N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'स्थापित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(283, 8, 64, N'extinguisherType', N'Type of Extinguishers', N'अग्निशामक यंत्रांचा प्रकार', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(284, 8, 64, N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'प्रति 100 चौ. फूट अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(285, 8, 64, N'lastRefillDate', N'Last Refill/Service Date', N'शेवटची रिफिल / सर्व्हिस तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(286, 8, 64, N'nextRefillDueDate', N'Next Service Due Date', N'पुढील सर्व्हिसची नियोजित तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(287, 8, 64, N'installerAgency', N'Installer/Service Agency Name', N'इंस्टॉलर / सेवा संस्थेचे नाव', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(288, 8, 64, N'serviceAgencyLicenseNo', N'Service Agency License No.', N'सेवा संस्थेचा परवाना क्रमांक', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(289, 8, 64, N'emergencyExitCount', N'No. of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(290, 8, 64, N'exitSignage', N'Exit Direction Signage Installed', N'बाहेर पडण्याचे दिशादर्शक फलक बसवले आहेत का?', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(291, 8, 64, N'routeMarking', N'Evacuation Route Marked', N'बाहेर पडण्याचा मार्ग चिन्हांकित केला आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(292, 8, 64, N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'स्वतंत्र अग्निसुरक्षा जिना उपलब्ध आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(293, 8, 64, N'musterPoint', N'Assembly / Muster Point Details', N'एकत्रीकरण / मस्टर पॉईंट तपशील', N'textarea', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(294, 8, 64, N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'फायर अलार्म प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(295, 8, 64, N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'हायड्रंट / स्प्रिंकलर प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(296, 8, 64, N'earthingCertified', N'Earthing System Certified?', N'अर्थिंग प्रणाली प्रमाणित आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(297, 8, 64, N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'अत्यंत ज्वलनशील साहित्य साठवले आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(298, 8, 64, N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 35, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(299, 8, 64, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(300, 8, 64, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.647')
       ,(301, 4, 43, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(302, 4, 43, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(303, 4, 43, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(304, 4, 43, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(305, 4, 43, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(306, 4, 43, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(307, 4, 43, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(308, 4, 43, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(309, 4, 43, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.690')
       ,(310, 4, 43, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(311, 4, 43, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(312, 4, 43, N'purpose', N'Purpose', N'उद्देश', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(313, 4, 43, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(314, 4, 43, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(315, 4, 44, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(316, 4, 44, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(317, 4, 44, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(318, 4, 44, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(319, 4, 44, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(320, 4, 44, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(321, 4, 44, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(322, 4, 44, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(323, 4, 44, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.690')
       ,(324, 4, 44, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(325, 4, 44, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(326, 4, 44, N'purpose', N'Purpose', N'उद्देश', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(327, 4, 44, N'partMapType', N'Part Map Type', N'भाग नकाशाचा प्रकार', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(328, 4, 44, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(329, 4, 44, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(330, 4, 45, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(331, 4, 45, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(332, 4, 45, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(333, 4, 45, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(334, 4, 45, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(335, 4, 45, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(336, 4, 45, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(337, 4, 45, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(338, 4, 45, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.690')
       ,(339, 4, 45, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(340, 4, 45, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(341, 4, 45, N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'प्लॉटचे क्षेत्रफळ (चौ. मी.)', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(342, 4, 45, N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'सीटीएस / सर्व्हे क्रमांक', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(343, 4, 45, N'typeOfWork', N'Type of Work', N'कामाचा प्रकार', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(344, 4, 45, N'buildingUse', N'Building Use', N'इमारतीचा वापर', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(345, 4, 45, N'proposedFloors', N'Total Floors (Proposed)', N'प्रस्तावित एकूण मजले', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(346, 4, 45, N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'प्रस्तावित एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(347, 4, 45, N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'तळघर / स्टिल्ट पार्किंग आहे का?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(348, 4, 45, N'buildingHeightM', N'Building Height (m) (if known)', N'इमारतीची उंची (मी.) (माहित असल्यास)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(349, 4, 45, N'briefWorkDescription', N'Brief Description (optional)', N'कामाचे संक्षिप्त वर्णन (ऐच्छिक)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(350, 4, 45, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(351, 4, 45, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(352, 4, 45, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(353, 4, 45, N'architectMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 24, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(354, 4, 45, N'architectEmail', N'Email (optional)', N'ईमेल', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(355, 4, 45, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(356, 4, 47, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(357, 4, 47, N'mobileNo', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(358, 4, 47, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(359, 4, 47, N'applicantAddress', N'Residential Address', N'निवासी पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(360, 4, 47, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(361, 4, 47, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(362, 4, 47, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(363, 4, 47, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(364, 4, 47, N'wardId', N'Ward', N'प्रभाग', N'select', N'Ward / Zone & Property Details', N'[
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
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(365, 4, 47, N'zoneId', N'Zone', N'झोन', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.690')
       ,(366, 4, 47, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(367, 4, 47, N'fetchedPropertyAddress', N'Property Address (Auto)', N'मालमत्तेचा पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(368, 4, 47, N'ocType', N'OC Type', N'भोगवटा प्रमाणपत्राचा प्रकार', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(369, 4, 47, N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'बांधकाम परवानगी / सीसी संदर्भ क्रमांक', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 14, NULL, NULL, 50, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(370, 4, 47, N'completionDate', N'Completion Date', N'पूर्णत्वाची तारीख', N'date', N'OC Request Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(371, 4, 47, N'totalFloorsConstructed', N'Total Floors Constructed', N'बांधलेल्या एकूण मजल्यांची संख्या', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(372, 4, 47, N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(373, 4, 47, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'OC Request Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(374, 4, 47, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(375, 4, 47, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(376, 4, 47, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(377, 5, 54, N'policeStation', N'Police Station Name', N'पोलीस स्टेशनचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(378, 5, 54, N'firCaseNumber', N'FIR / Case Number', N'एफआयआर / प्रकरण क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(379, 5, 54, N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'प्रथम वैद्यकीय उपचार केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(380, 5, 54, N'firstTreatmentAddress', N'First Treatment Hospital Address', N'प्रथम उपचार रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(381, 5, 54, N'deathDeclaredHospital', N'Death Declared Hospital Name', N'मृत्यू घोषित केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(382, 5, 54, N'deathDeclaredAddress', N'Death Declared Hospital Address', N'मृत्यू घोषित केलेल्या रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(383, 5, 54, N'placeOfDeathType', N'Place of Death', N'मृत्यूस्थळाचा प्रकार', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(384, 5, 54, N'hospitalName', N'Hospital/Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Place of Death', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(385, 5, 54, N'deathAddress', N'Complete Death Address', N'मृत्यूस्थळाचा संपूर्ण पत्ता', N'textarea', N'Place of Death', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(386, 5, 54, N'deathPinCode', N'PIN Code', N'पिन कोड', N'number', N'Place of Death', NULL, NULL, N'{"min":0}', 0, 31, NULL, NULL, 6, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(387, 5, 54, N'deactivateAadhaar', N'Aadhaar Deactivation', N'आधार निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(388, 5, 54, N'deactivatePAN', N'PAN Deactivation', N'पॅन निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(389, 5, 54, N'cancelPassport', N'Passport Cancellation', N'पासपोर्ट रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(390, 5, 54, N'deleteVoterID', N'Voter ID Deletion', N'मतदार ओळखपत्र रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(391, 5, 54, N'terminatePension', N'Pension Account Termination', N'पेन्शन खाते बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(392, 5, 54, N'freezeBankAccount', N'Bank Account Freeze Notification', N'बँक खाते गोठविण्याची सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(393, 5, 54, N'deactivateSIM', N'SIM/Telecom Deactivation', N'सिम / दूरसंचार सेवा निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(394, 5, 54, N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'यूपीआय / डिजिटल वॉलेट बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 39, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(395, 5, 54, N'notifyInsurance', N'Insurance Company Notification', N'विमा कंपनीला सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(396, 5, 54, N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'कर्ज / क्रेडिट दायित्वाबाबत सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(397, 5, 54, N'digitalDeactivationConsent', N'Consent Declaration', N'डिजिटल सेवा निष्क्रिय करण्यास संमती', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(398, 5, 54, N'addressVerifiedUsing', N'Permanent Address Verified Using', N'कायमचा पत्ता पडताळणीचा आधार', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(399, 5, 54, N'verifiedByRegistrar', N'Verified by Registrar', N'निबंधकाद्वारे पडताळणी', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(400, 5, 54, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.690')
       ,(401, 4, 47, N'architectMobile', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 22, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(402, 4, 47, N'architectEmail', N'Email (optional)', N'ई-मेल (ऐच्छिक)', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(403, 4, 47, N'declaration', N'I hereby declare that the construction has been completed as per the approved plan and applicable rules.', N'मी घोषित करतो की बांधकाम मंजूर नकाशा व लागू नियमांनुसार पूर्ण झाले आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(404, 12, 48, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(405, 12, 48, N'organizationName', N'Organization / Company Name', N'संस्था / कंपनीचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(406, 12, 48, N'authorizedSignatoryName', N'Authorized Signatory Name', N'अधिकृत स्वाक्षरीकर्त्याचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(407, 12, 48, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(408, 12, 48, N'email', N'Email', N'ईमेल', N'email', N'Applicant / Organization Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(409, 12, 48, N'officeAddress', N'Office Address', N'कार्यालयाचा पत्ता', N'textarea', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(410, 12, 48, N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'परवाना / नोंदणी क्रमांक (असल्यास)', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 0, 7, NULL, NULL, 50, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(411, 12, 48, N'gstNo', N'GST No (if any)', N'जीएसटी क्रमांक (असल्यास)', N'number', N'Applicant / Organization Details', NULL, NULL, N'{"min":0}', 0, 8, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(412, 12, 48, N'wardId', N'Ward', N'प्रभाग', N'select', N'Work Location Details', N'[
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
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(413, 12, 48, N'zoneId', N'Zone', N'झोन', N'select', N'Work Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.730')
       ,(414, 12, 48, N'workAreaType', N'Work Area Type', N'कार्यक्षेत्राचा प्रकार', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(415, 12, 48, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(416, 12, 48, N'fromLocation', N'From Location', N'सुरुवातीचे ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(417, 12, 48, N'toLocation', N'To Location', N'अंतिम ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(418, 12, 48, N'landmark', N'Landmark (optional)', N'जवळची खूण (ऐच्छिक)', N'text', N'Work Location Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(419, 12, 48, N'totalRouteLengthMeters', N'Total Route Length (meters)', N'मार्गाची एकूण लांबी (मीटरमध्ये)', N'number', N'Work Location Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(420, 12, 48, N'methodOfLaying', N'Method of Laying', N'वाहिनी टाकण्याची पद्धत', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(421, 12, 48, N'trenchWidthCm', N'Trench Width (cm)', N'चराची रुंदी (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(422, 12, 48, N'trenchDepthCm', N'Trench Depth (cm)', N'चराची खोली (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(423, 12, 48, N'roadCrossingsCount', N'No. of Road Crossings', N'रस्ता ओलांडण्यांची संख्या', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(424, 12, 48, N'ductPipeSize', N'Duct / HDPE Pipe Size', N'डक्ट / एचडीपीई पाईपचा आकार', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 21, NULL, NULL, 50, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(425, 12, 48, N'noOfDucts', N'No. of Ducts (optional)', N'डक्टची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(426, 12, 48, N'handholesChambersCount', N'Handholes / Chambers (optional)', N'हँडहोल्स / चेंबर्सची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(427, 12, 48, N'expectedStartDate', N'Expected Start Date', N'अपेक्षित सुरू तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(428, 12, 48, N'expectedEndDate', N'Expected End Date', N'अपेक्षित अंतिम तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(429, 12, 48, N'trafficManagementRequired', N'Traffic Management Required?', N'रहदारी व्यवस्थापन आवश्यक आहे का?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(430, 6, 55, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(431, 6, 55, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(432, 6, 55, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(433, 6, 55, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(434, 6, 55, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(435, 6, 55, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(436, 6, 55, N'relationshipToStudent', N'Relationship to Student', N'विद्यार्थ्याशी नाते', N'select', N'Applicant Information', N'[{"value":"self","label":{"en":"Self (Student)","hi":"स्वयं (छात्र)","mr":"स्वतः (विद्यार्थी)"}},{"value":"parent","label":{"en":"Parent","hi":"अभिभावक","mr":"पालक"}},{"value":"guardian","label":{"en":"Guardian","hi":"संरक्षक","mr":"संरक्षक"}}]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(437, 6, 55, N'guardianFullName', N'Parent/Guardian Full Name', N'पालक / संरक्षकाचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(438, 6, 55, N'rollNumber', N'Roll Number', N'अनुक्रमांक', N'text', N'Student Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(439, 6, 55, N'studentName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(440, 6, 55, N'dateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(441, 6, 55, N'gender', N'Gender', N'लिंग', N'select', N'Student Details', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(442, 6, 55, N'motherName', N'Mother''s Name', N'आईचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(443, 6, 55, N'fatherName', N'Father''s Name', N'वडिलांचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(444, 6, 55, N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'आधार क्रमांकाचे शेवटचे 4 अंक (ऐच्छिक)', N'text', N'Student Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 4,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 15, NULL, NULL, 4, 0, 0, 0, N'2026-07-15 16:26:57.730')
       ,(445, 6, 55, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(446, 6, 55, N'lastStandardStudied', N'Last Standard/Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"१ ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"२ री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"३ री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"४ थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"५ वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"६ वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"७ वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"८ वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"९ वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"१० वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(447, 6, 55, N'yearOfLeaving', N'Year of Leaving', N'शाळा सोडल्याचे वर्ष', N'number', N'School Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, 4, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(448, 6, 55, N'certificateType', N'Certificate Type', N'प्रमाणपत्राचा प्रकार', N'select', N'School Details', N'[{"value":"leaving","label":{"en":"Leaving Certificate","hi":"शालांत प्रमाणपत्र","mr":"शाळा सोडल्याचा दाखला"}},{"value":"duplicate","label":{"en":"Duplicate Certificate","hi":"दुय्यम प्रमाणपत्र","mr":"द्वितीय दाखला"}},{"value":"migration","label":{"en":"Migration Certificate","hi":"स्थानांतरण प्रमाणपत्र","mr":"स्थलांतर प्रमाणपत्र"}}]', NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(449, 6, 55, N'lastAttendanceDate', N'Last Attendance Date', N'शेवटची उपस्थिती तारीख', N'date', N'School Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(450, 6, 55, N'boardOrUniversity', N'Board / University', N'मंडळ / विद्यापीठ', N'text', N'School Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(451, 6, 55, N'reasonForLeaving', N'Reason for Leaving', N'शाळा सोडण्याचे कारण', N'select', N'Certificate Details', N'[{"value":"transfer","label":{"en":"Transfer","hi":"स्थानांतरण","mr":"बदली"}},{"value":"higherStudies","label":{"en":"Higher Studies","hi":"उच्च शिक्षा","mr":"उच्च शिक्षण"}},{"value":"familyShift","label":{"en":"Family Shift","hi":"परिवार स्थानांतरण","mr":"कुटुंब स्थलांतर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(452, 6, 55, N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'सर्व थकीत देणी भरली आहेत का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(453, 6, 55, N'duplicateReason', N'Reason for Duplicate', N'डुप्लिकेट प्रमाणपत्राचे कारण', N'select', N'Certificate Details', N'[{"value":"lost","label":{"en":"Original Certificate Lost","hi":"मूल प्रमाणपत्र खो गया","mr":"मूळ प्रमाणपत्र हरवले"}},{"value":"damaged","label":{"en":"Original Certificate Damaged","hi":"मूल प्रमाणपत्र क्षतिग्रस्त हो गया","mr":"मूळ प्रमाणपत्र खराब झाले"}},{"value":"destroyed","label":{"en":"Original Certificate Destroyed","hi":"मूल प्रमाणपत्र नष्ट हो गया","mr":"मूळ प्रमाणपत्र नष्ट झाले"}},{"value":"misplaced","label":{"en":"Certificate Misplaced","hi":"प्रमाणपत्र गुम हो गया","mr":"प्रमाणपत्र सापडत नाही"}},{"value":"correction","label":{"en":"Name / Details Correction","hi":"नाम / विवरण सुधार","mr":"नाव / माहिती दुरुस्ती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(454, 6, 55, N'originalCertificateNumber', N'Original Certificate No. (if known)', NULL, N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(455, 6, 55, N'policeComplaintFiled', N'Police Complaint Filed?', N'पोलीस तक्रार दाखल केली आहे का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(456, 6, 55, N'affidavitProvided', N'Affidavit Provided?', N'प्रतिज्ञापत्र सादर केले आहे का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(457, 6, 55, N'lastExamPassed', N'Last Exam Passed', N'शेवटची उत्तीर्ण परीक्षा', N'number', N'Certificate Details', NULL, NULL, N'{"min":0}', 0, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(458, 6, 55, N'seatOrRegNo', N'Seat No / Registration No', N'आसन क्रमांक / नोंदणी क्रमांक', N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(459, 6, 55, N'destinationInstituteName', N'Destination Institute (optional)', NULL, N'text', N'Certificate Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(460, 6, 55, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(461, 10, 66, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(462, 10, 66, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(463, 10, 66, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 3, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(464, 10, 66, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(465, 10, 66, N'applicantAddress', N'Address (optional)', N'पत्ता (ऐच्छिक)', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(466, 10, 66, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(467, 10, 66, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, 20, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(468, 10, 66, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी असलेले नाते', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(469, 10, 66, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Location / Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(470, 10, 66, N'wardId', N'Ward', N'प्रभाग', N'select', N'Location / Property Details', N'[
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
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(471, 10, 66, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Location / Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 11, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.730')
       ,(472, 10, 66, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(473, 10, 66, N'fetchedPropertyAddress', N'Address', N'पत्ता', N'textarea', N'Location / Property Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(474, 10, 66, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(475, 10, 66, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(476, 10, 66, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(477, 10, 66, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(478, 10, 66, N'actionRequested', N'What do you want to do?', N'आपण कोणती कार्यवाही करू इच्छिता?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(479, 10, 66, N'noOfTrees', N'How many trees?', N'झाडांची संख्या', N'number', N'Tree Request Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(480, 10, 66, N'treeLocationType', N'Where is the tree located?', N'झाड कोणत्या ठिकाणी आहे?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(481, 10, 66, N'reasonCategory', N'Reason', N'कारण', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(482, 10, 66, N'isImmediateDanger', N'Is it an emergency danger?', N'तातडीचा धोका आहे का?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(483, 10, 66, N'dangerExplanation', N'Explain the danger (if yes)', N'धोक्याचे स्पष्टीकरण द्या (होय असल्यास)', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(484, 10, 66, N'treeDetails', N'Tree Details', N'झाडाचा तपशील', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(485, 10, 66, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.730')
       ,(501, 12, 48, N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(502, 12, 48, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(503, 12, 48, N'restorationResponsibility', N'Restoration Responsibility', N'पुनर्स्थापना जबाबदारी', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(504, 12, 48, N'restorationType', N'Restoration Type', N'पुनर्स्थापना प्रकार', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(505, 12, 48, N'undertakingConsent', N'Undertaking / Indemnity Consent', N'हमीपत्र / स्वीकृती पत्र', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(506, 12, 49, N'accidentOrDamage', N'Any accident/vehicle damage?', N'कोणताही अपघात किंवा वाहनाचे नुकसान झाले आहे का?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(507, 12, 49, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(508, 12, 49, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(509, 12, 49, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(510, 12, 49, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(511, 12, 49, N'fromLocation', N'From (optional)', N'सुरुवातीचे ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(512, 12, 49, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(513, 12, 49, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(514, 12, 49, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(515, 12, 49, N'potholeCount', N'Number of Potholes', N'खड्ड्यांची संख्या', N'number', N'Pothole Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(516, 12, 49, N'potholeSize', N'Pothole Size', N'खड्ड्याचा आकार', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(517, 12, 49, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Pothole Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(518, 12, 49, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(519, 12, 49, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(520, 12, 49, N'toLocation', N'To (optional)', N'अंतिम ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(521, 12, 49, N'wardId', N'Ward', N'प्रभाग', N'select', N'Pothole Location Details', N'[
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
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(522, 12, 49, N'zoneId', N'Zone', N'झोन', N'select', N'Pothole Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.763')
       ,(523, 12, 50, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(524, 12, 50, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(525, 12, 50, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(526, 12, 50, N'coverCount', N'Number of Covers', N'झाकणांची संख्या', N'number', N'Sewer Cover Issue Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(527, 12, 50, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(528, 12, 50, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(529, 12, 50, N'issueType', N'Issue Type', N'समस्येचा प्रकार', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(530, 12, 50, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(531, 12, 50, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(532, 12, 50, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Sewer Cover Issue Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(533, 12, 50, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(534, 12, 50, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(535, 12, 50, N'wardId', N'Ward', N'प्रभाग', N'select', N'Sewer Cover Location Details', N'[
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
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.763')
       ,(536, 12, 50, N'zoneId', N'Zone', N'झोन', N'select', N'Sewer Cover Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, 0, N'2026-07-15 16:26:57.763')
       ,(597, 5, 53, N'dischargeCardDoc', N'Hospital Discharge Card', N'रुग्णालयाचा डिस्चार्ज कार्ड दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 62, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(598, 5, 53, N'informantIdDoc', N'Informant ID Proof', N'माहिती देणाऱ्याचा ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 63, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(599, 5, 54, N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 58, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(600, 5, 54, N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'स्मशानभूमी किंवा दफनभूमीचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 59, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(601, 9, 65, N'groomAgeProofDoc', N'Groom Age Proof Document', N'नवरदेवाच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(602, 9, 65, N'brideAgeProofDoc', N'Bride Age Proof Document', N'नवरीच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(603, 9, 65, N'weddingInvitationDoc', N'Wedding Invitation Card', N'लग्नपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 52, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(604, 9, 65, N'witness1IdProofDoc', N'Witness 1 ID Proof', N'साक्षीदार १ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(605, 9, 65, N'witness2IdProofDoc', N'Witness 2 ID Proof', N'साक्षीदार २ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 54, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(606, 11, 69, N'idProofDoc', N'Applicant ID Proof Document', N'अर्जदाराच्या ओळखपत्राचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 23, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(607, 11, 69, N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 24, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(608, 11, 69, N'premisesMapDoc', N'Premises Layout Map', N'जागेचा नकाशा / आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 25, NULL, NULL, NULL, 1, 0, 0, N'2026-07-15 16:26:57.780')
       ,(1114, 4, 44, N'propertyTaxDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1115, 4, 45, N'buildingPlanDoc', N'Ownership Documents', N'मालकी हक्काची कागदपत्रे', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1116, 4, 45, N'architectCertDoc', N'Architect’s Certificate', N'वास्तुविशारदाचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1117, 4, 47, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1118, 4, 47, N'PlinthCertificateDoc', N'Plinth Certificate', N'जोते प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1119, 4, 43, N'ownershipDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1124, 12, 48, N'routeMapDoc', N'Proposed OFC Cable Route Diagram', N'प्रस्तावित ओएफसी केबल मार्गाचा नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1125, 6, 55, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1126, 6, 55, N'previousMarksheetDoc', N'Previous Class Marksheet', NULL, N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1134, 8, 64, N'fireSafetyBlueprintDoc', N'Approved Fire Safety Blueprint', N'मंजूर अग्निसुरक्षा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1135, 8, 63, N'equipmentInvoiceDoc', N'Fire Equipment Purchase / Inspection Receipt', N'अग्निशमन उपकरण खरेदी / तपासणी पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1136, 4, 62, N'mandapLayoutDoc', N'Mandap Site Layout Diagram', N'मंडप स्थळाचा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1138, 4, 61, N'propertyTaxDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1139, 10, 66, N'treePhotosDoc', N'Clear Photographs of Tree(s)', N'झाडाचे स्पष्ट छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1140, 10, 66, N'ownershipDoc', N'Property Ownership / 7-12 Extract', N'मालमत्ता मालकीचा पुरावा / ७/१२ उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:44:51.360')
       ,(1141, 4, 46, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1142, 4, 46, N'architectName', N'Licensed Architect Name', N'परवानाधारक वास्तुविशारदाचे नाव', N'text', N'Architect Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1143, 4, 46, N'buildingPermitRefNo', N'Sanctioned Building Permit Ref No', N'मंजूर बांधकाम परवाना संदर्भ क्रमांक', N'text', N'Permit Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1144, 4, 46, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1145, 4, 46, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1146, 4, 46, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1147, 4, 46, N'wardId', N'Ward', N'प्रभाग', N'select', N'Property Details', N'[
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
]', NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1148, 4, 46, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 5, NULL, NULL, NULL, 0, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1149, 7, 58, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1150, 7, 58, N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'जैव वैद्यकीय कचरा मंजुरी क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1151, 7, 58, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1152, 7, 58, N'doctorName', N'Chief Medical Officer / Doctor Name', N'मुख्य वैद्यकीय अधिकारी / डॉक्टरचे नाव', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1153, 7, 58, N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'डॉक्टर एमएमसी / वैद्यकीय नोंदणी क्रमांक', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1154, 7, 58, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1155, 7, 58, N'fireNocNo', N'Fire Safety NOC Number', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1156, 7, 58, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1157, 7, 58, N'nursingHomeAddress', N'Nursing Home Address', N'नर्सिंग होमचा पत्ता', N'textarea', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1158, 7, 58, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1159, 7, 58, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1160, 7, 58, N'wardId', N'Ward', N'प्रभाग', N'select', N'Nursing Home Details', N'[
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
}', 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1161, 7, 58, N'zoneId', N'Zone', N'झोन', N'select', N'Nursing Home Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, N'{
  "dependsOn":"zoneId",
  "filterByPrefix":true
}', 1, 7, NULL, NULL, NULL, 0, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1162, 7, 59, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1163, 7, 59, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1164, 7, 59, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1165, 7, 59, N'licenseExpiryDate', N'License Expiry Date', N'परवाना समाप्ती तारीख', N'date', N'License Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1166, 7, 59, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1167, 7, 59, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1168, 7, 59, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1169, 7, 59, N'wardId', N'Ward', N'प्रभाग', N'select', N'Nursing Home Details', N'[
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
]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1170, 7, 60, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1171, 7, 60, N'currentHolderName', N'Current License Holder Name', N'सध्याच्या परवानाधारकाचे नाव', N'text', N'License Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1172, 7, 60, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1173, 7, 60, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1174, 7, 60, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1175, 7, 60, N'proposedHolderName', N'Proposed New Holder / Partner Name', N'प्रस्तावित नवीन परवानाधारक / भागीदाराचे नाव', N'text', N'Update Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1176, 7, 60, N'reasonForChange', N'Reason for Change', N'बदलाचे कारण', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:34.910')
       ,(1177, 11, 68, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1178, 11, 68, N'cleanlinessIssueType', N'Cleanliness Issue Type', N'स्वच्छतेशी संबंधित समस्येचा प्रकार', N'select', N'Complaint Details', N'[{"value":"garbage","label":{"en":"Garbage Accumulation","hi":"कचरा साचणे","mr":"कचरा साचणे"}},{"value":"open_dumping","label":{"en":"Open Dumping","hi":"उघड्यावर कचरा","mr":"उघड्यावर कचरा टाकणे"}},{"value":"drainage_overflow","label":{"en":"Drainage Overflow","hi":"ड्रेनेज ओव्हरफ्लो","mr":"ड्रेनेज ओव्हरफ्लो"}},{"value":"sweeping_req","label":{"en":"Street Sweeping Required","hi":"रस्ता सफाई आवश्यक","mr":"रस्ता सफाई आवश्यक"}}]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1179, 11, 68, N'complainantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Complainant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1180, 11, 68, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1181, 11, 68, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1182, 11, 68, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Complainant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1183, 11, 68, N'wardId', N'Ward', N'प्रभाग', N'select', N'Location Details', N'[
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
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1184, 11, 68, N'zoneId', N'Zone', N'झोन', N'select', N'Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, 0, N'2026-07-21 18:45:49.343')
       ,(1185, 6, 56, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1186, 6, 56, N'dateOfBirth', N'Student Date of Birth', N'विद्यार्थ्याची जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1187, 6, 56, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1188, 6, 56, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1189, 6, 56, N'fatherFullName', N'Father / Guardian Full Name', N'वडील / पालक यांचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1190, 6, 56, N'grNumber', N'General Register (G.R.) / Roll No', N'जनरल रजिस्टर (जी.आर.) / रोल क्रमांक', N'text', N'School Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1191, 6, 56, N'lastStandardStudied', N'Last Standard / Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"१ ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"२ री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"३ री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"४ थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"५ वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"६ वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"७ वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"८ वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"९ वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"१० वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1192, 6, 56, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1193, 6, 56, N'motherFullName', N'Mother Full Name', N'आईचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1194, 6, 56, N'reasonForTC', N'Reason for Transfer Certificate', N'बदली प्रमाणपत्राचे कारण', N'select', N'Request Details', N'[{"value":"parent_transfer","label":{"en":"Parent Job Transfer","hi":"पालकांची बदली","mr":"पालकांची नोकरीतील बदली"}},{"value":"higher_studies","label":{"en":"Higher Studies / Admission","hi":"पुढील शिक्षण","mr":"पुढील शिक्षण / प्रवेश"}},{"value":"residence_shift","label":{"en":"Change of Residence","hi":"रहिवास बदल","mr":"रहिवास बदल"}},{"value":"other","label":{"en":"Other Reason","hi":"इतर कारण","mr":"इतर कारण"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1195, 6, 56, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1196, 6, 56, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1197, 6, 57, N'affidavitDetails', N'FIR / Affidavit Registration Details', N'एफआयआर / प्रतिज्ञापत्र नोंदणी तपशील', N'textarea', N'Request Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1198, 6, 57, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1199, 6, 57, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1200, 6, 57, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1201, 6, 57, N'examinationPassed', N'Examination Name', N'परीक्षेचे नाव', N'select', N'Exam Details', N'[{"value":"ssc","label":{"en":"10th Board (SSC)","hi":"10वीं बोर्ड (SSC)","mr":"इयत्ता १० वी (SSC)"}},{"value":"std_5_scholarship","label":{"en":"5th Std Scholarship Exam","hi":"5वीं शिष्यवृत्ती","mr":"इयत्ता ५ वी शिष्यवृत्ती"}},{"value":"std_8_scholarship","label":{"en":"8th Std Scholarship Exam","hi":"8वीं शिष्यवृत्ती","mr":"इयत्ता ८ वी शिष्यवृत्ती"}},{"value":"primary_exam","label":{"en":"Annual Primary Exam","hi":"वार्षिक परीक्षा","mr":"वार्षिक परीक्षा"}},{"value":"other","label":{"en":"Other Exam","hi":"अन्य","mr":"इतर परीक्षा"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1202, 6, 57, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1203, 6, 57, N'passingYear', N'Passing Year', N'उत्तीर्ण वर्ष', N'number', N'Exam Details', NULL, NULL, N'{"min":0}', 1, 8, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1204, 6, 57, N'reasonForDuplicate', N'Reason for Duplicate Marksheet', N'डुप्लिकेट गुणपत्रिकेचे कारण', N'select', N'Request Details', N'[{"value":"lost","label":{"en":"Original Lost","hi":"गहाळ झाले","mr":"मूळ गुणपत्रक गहाळ झाले"}},{"value":"damaged","label":{"en":"Original Damaged / Torn","hi":"खराब / फाटले","mr":"खराब / फाटले आहे"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"सापडत नाही","mr":"सापडत नाही"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1205, 6, 57, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
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
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1206, 6, 57, N'seatNumber', N'Seat / Roll Number', N'आसन क्रमांक / रोल क्रमांक', N'text', N'Exam Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1207, 6, 57, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.123')
       ,(1208, 4, 46, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1210, 6, 56, N'previousMarksheetDoc', N'Previous Class Marksheet', N'मागील इयत्तेची गुणपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1211, 6, 56, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1212, 6, 57, N'firOrAffidavitDoc', N'Police FIR / Notarized Affidavit Document', N'पोलीस एफआयआर / नोटरीकृत प्रतिज्ञापत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1213, 6, 57, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1214, 7, 58, N'bmwAgreementDoc', N'Bio Medical Waste Disposal Agreement', N'जैव वैद्यकीय कचरा विल्हेवाट करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1215, 7, 58, N'doctorDegreeDoc', N'Chief Doctor MMC / Degree Certificate', N'मुख्य डॉक्टर एमएमसी / पदवी प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1216, 7, 58, N'fireNocDoc', N'Fire Safety NOC Document', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1217, 7, 59, N'fireNocDoc', N'Valid Fire Safety NOC', N'वैध अग्निसुरक्षा ना हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1218, 7, 59, N'oldLicenseDoc', N'Previous Nursing Home License Copy', N'मागील नर्सिंग होम परवान्याची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1219, 7, 60, N'newHolderIdDoc', N'ID Proof of New License Holder', N'नवीन परवानाधारकाचा ओळखपत्र पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1220, 7, 60, N'transferAgreementDoc', N'Transfer Agreement / Partnership Deed', N'हस्तांतरण करार / भागीदारी करारनामा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(1221, 11, 68, N'spotPhotoDoc', N'Spot Photograph of Location', N'ठिकाणाचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 9, NULL, NULL, NULL, 1, 0, 0, N'2026-07-21 18:51:28.150')
       ,(3004, 2, 19, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3005, 2, 20, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3006, 2, 26, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3007, 2, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3008, 2, 80, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3009, 2, 81, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3010, 2, 82, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3011, 2, 83, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3012, 2, 84, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3013, 2, 85, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3014, 2, 86, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3015, 2, 87, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3016, 2, 100, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3017, 2, 101, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:37.940')
       ,(3018, 3, 33, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3019, 3, 36, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3020, 3, 137, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3021, 3, 138, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3022, 3, 139, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3023, 3, 140, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3024, 3, 141, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3025, 3, 142, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3026, 3, 143, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3027, 3, 144, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3028, 3, 158, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3029, 3, 159, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3030, 3, 160, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3031, 3, 161, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3032, 3, 162, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 17:59:44.977')
       ,(3033, 1, 145, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3034, 1, 146, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3035, 1, 147, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3036, 1, 148, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3037, 1, 149, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3038, 1, 150, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3039, 1, 151, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3040, 1, 152, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3041, 1, 153, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3042, 1, 154, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3043, 1, 155, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3044, 1, 156, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(3045, 1, 157, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-12 18:00:25.820')
       ,(4002, 12, 49, N'DOC_POTHOLE_PHOTO', N'Photo of Pothole Location', N'खड्ड्याचे छायाचित्र / फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.233')
       ,(4003, 12, 50, N'DOC_SEWER_PHOTO', N'Photo of Damaged / Open Sewer Cover', N'उघड्या / तुटलेल्या मॅनहोलचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 14, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.253')
       ,(4004, 2, 19, N'DOC_WATER_BILL_19', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.277')
       ,(4005, 2, 19, N'DOC_APPLICANT_ID_19', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.287')
       ,(4006, 2, 20, N'DOC_WATER_BILL_20', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.290')
       ,(4007, 2, 20, N'DOC_APPLICANT_ID_20', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.293')
       ,(4008, 2, 26, N'DOC_WATER_BILL_26', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.297')
       ,(4009, 2, 26, N'DOC_APPLICANT_ID_26', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.300')
       ,(4010, 3, 33, N'DOC_RENT_AGREEMENT_33', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.307')
       ,(4011, 3, 33, N'DOC_APPLICANT_ID_33', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.310')
       ,(4012, 3, 33, N'DOC_NOC_CERTIFICATE_33', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.317')
       ,(4013, 3, 36, N'DOC_RENT_AGREEMENT_36', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.320')
       ,(4014, 3, 36, N'DOC_APPLICANT_ID_36', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.327')
       ,(4015, 3, 36, N'DOC_NOC_CERTIFICATE_36', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.330')
       ,(4016, 2, 80, N'DOC_WATER_BILL_80', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.330')
       ,(4017, 2, 80, N'DOC_APPLICANT_ID_80', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.370')
       ,(4018, 2, 81, N'DOC_WATER_BILL_81', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.373')
       ,(4019, 2, 81, N'DOC_APPLICANT_ID_81', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.377')
       ,(4020, 2, 82, N'DOC_WATER_BILL_82', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.380')
       ,(4021, 2, 82, N'DOC_APPLICANT_ID_82', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.380')
       ,(4022, 2, 83, N'DOC_WATER_BILL_83', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.383')
       ,(4023, 2, 83, N'DOC_APPLICANT_ID_83', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.387')
       ,(4024, 2, 84, N'DOC_WATER_BILL_84', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.390')
       ,(4025, 2, 84, N'DOC_APPLICANT_ID_84', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.393')
       ,(4026, 2, 85, N'DOC_WATER_BILL_85', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.397')
       ,(4027, 2, 85, N'DOC_APPLICANT_ID_85', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.403')
       ,(4028, 2, 86, N'DOC_WATER_BILL_86', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.407')
       ,(4029, 2, 86, N'DOC_APPLICANT_ID_86', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.407')
       ,(4030, 2, 87, N'DOC_WATER_BILL_87', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.410')
       ,(4031, 2, 87, N'DOC_APPLICANT_ID_87', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.413')
       ,(4032, 2, 100, N'DOC_WATER_BILL_100', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.420')
       ,(4033, 2, 100, N'DOC_APPLICANT_ID_100', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.473')
       ,(4034, 2, 101, N'DOC_WATER_BILL_101', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.477')
       ,(4035, 2, 101, N'DOC_APPLICANT_ID_101', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.480')
       ,(4036, 3, 137, N'DOC_RENT_AGREEMENT_137', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.483')
       ,(4037, 3, 137, N'DOC_APPLICANT_ID_137', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.487')
       ,(4038, 3, 137, N'DOC_NOC_CERTIFICATE_137', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.490')
       ,(4039, 3, 138, N'DOC_RENT_AGREEMENT_138', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.493')
       ,(4040, 3, 138, N'DOC_APPLICANT_ID_138', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.493')
       ,(4041, 3, 138, N'DOC_NOC_CERTIFICATE_138', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.497')
       ,(4042, 3, 139, N'DOC_RENT_AGREEMENT_139', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.503')
       ,(4043, 3, 139, N'DOC_APPLICANT_ID_139', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.503')
       ,(4044, 3, 139, N'DOC_NOC_CERTIFICATE_139', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.507')
       ,(4045, 3, 140, N'DOC_RENT_AGREEMENT_140', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.510')
       ,(4046, 3, 140, N'DOC_APPLICANT_ID_140', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.510')
       ,(4047, 3, 140, N'DOC_NOC_CERTIFICATE_140', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.513')
       ,(4048, 3, 141, N'DOC_RENT_AGREEMENT_141', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.517')
       ,(4049, 3, 141, N'DOC_APPLICANT_ID_141', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.520')
       ,(4050, 3, 141, N'DOC_NOC_CERTIFICATE_141', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.523')
       ,(4051, 3, 142, N'DOC_RENT_AGREEMENT_142', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.527')
       ,(4052, 3, 142, N'DOC_APPLICANT_ID_142', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.530')
       ,(4053, 3, 142, N'DOC_NOC_CERTIFICATE_142', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.530')
       ,(4054, 3, 143, N'DOC_RENT_AGREEMENT_143', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.533')
       ,(4055, 3, 143, N'DOC_APPLICANT_ID_143', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.537')
       ,(4056, 3, 143, N'DOC_NOC_CERTIFICATE_143', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.540')
       ,(4057, 3, 144, N'DOC_RENT_AGREEMENT_144', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.543')
       ,(4058, 3, 144, N'DOC_APPLICANT_ID_144', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.543')
       ,(4059, 3, 144, N'DOC_NOC_CERTIFICATE_144', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.547')
       ,(4060, 1, 145, N'DOC_PROP_OWNERSHIP_145', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.550')
       ,(4061, 1, 145, N'DOC_APPLICANT_ID_145', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.557')
       ,(4062, 1, 146, N'DOC_PROP_OWNERSHIP_146', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.560')
       ,(4063, 1, 146, N'DOC_APPLICANT_ID_146', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.563')
       ,(4064, 1, 147, N'DOC_PROP_OWNERSHIP_147', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.567')
       ,(4065, 1, 147, N'DOC_APPLICANT_ID_147', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.570')
       ,(4066, 1, 148, N'DOC_PROP_OWNERSHIP_148', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.570')
       ,(4067, 1, 148, N'DOC_APPLICANT_ID_148', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.573')
       ,(4068, 1, 149, N'DOC_PROP_OWNERSHIP_149', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.577')
       ,(4069, 1, 149, N'DOC_APPLICANT_ID_149', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.580')
       ,(4070, 1, 150, N'DOC_PROP_OWNERSHIP_150', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.580')
       ,(4071, 1, 150, N'DOC_APPLICANT_ID_150', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.583')
       ,(4072, 1, 151, N'DOC_PROP_OWNERSHIP_151', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.587')
       ,(4073, 1, 151, N'DOC_APPLICANT_ID_151', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.587')
       ,(4074, 1, 152, N'DOC_PROP_OWNERSHIP_152', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.637')
       ,(4075, 1, 152, N'DOC_APPLICANT_ID_152', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.640')
       ,(4076, 1, 153, N'DOC_PROP_OWNERSHIP_153', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.640')
       ,(4077, 1, 153, N'DOC_APPLICANT_ID_153', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.643')
       ,(4078, 1, 154, N'DOC_PROP_OWNERSHIP_154', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.643')
       ,(4079, 1, 154, N'DOC_APPLICANT_ID_154', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.647')
       ,(4080, 1, 155, N'DOC_PROP_OWNERSHIP_155', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.683')
       ,(4081, 1, 155, N'DOC_APPLICANT_ID_155', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.730')
       ,(4082, 1, 156, N'DOC_PROP_OWNERSHIP_156', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.730')
       ,(4083, 1, 156, N'DOC_APPLICANT_ID_156', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.733')
       ,(4084, 1, 157, N'DOC_PROP_OWNERSHIP_157', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.733')
       ,(4085, 1, 157, N'DOC_APPLICANT_ID_157', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.737')
       ,(4086, 3, 158, N'DOC_RENT_AGREEMENT_158', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.737')
       ,(4087, 3, 158, N'DOC_APPLICANT_ID_158', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.740')
       ,(4088, 3, 158, N'DOC_NOC_CERTIFICATE_158', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.740')
       ,(4089, 3, 159, N'DOC_RENT_AGREEMENT_159', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.743')
       ,(4090, 3, 159, N'DOC_APPLICANT_ID_159', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.747')
       ,(4091, 3, 159, N'DOC_NOC_CERTIFICATE_159', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.747')
       ,(4092, 3, 160, N'DOC_RENT_AGREEMENT_160', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.750')
       ,(4093, 3, 160, N'DOC_APPLICANT_ID_160', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.750')
       ,(4094, 3, 160, N'DOC_NOC_CERTIFICATE_160', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.753')
       ,(4095, 3, 161, N'DOC_RENT_AGREEMENT_161', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.757')
       ,(4096, 3, 161, N'DOC_APPLICANT_ID_161', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.760')
       ,(4097, 3, 161, N'DOC_NOC_CERTIFICATE_161', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.760')
       ,(4098, 3, 162, N'DOC_RENT_AGREEMENT_162', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.763')
       ,(4099, 3, 162, N'DOC_APPLICANT_ID_162', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.767')
       ,(4100, 3, 162, N'DOC_NOC_CERTIFICATE_162', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, N'2026-08-17 13:01:13.770')
       ,(4101, 4, 61, N'approvedPlanDocument', N'Approved Plan / Map', N'मंजूर नकाशाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 21:57:15.420')
       ,(4102, 4, 61, N'sevenTwelveOrSaleDeedDocument', N'7/12 Extract / Sale Deed', N'७/१२ उतारा / खरेदी खत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 21:57:15.420')
       ,(4103, 4, 61, N'rentAgreementDocument', N'Rent Agreement', N'भाडे करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 54, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 21:57:15.420')
       ,(4104, 4, 44, N'measurementMapDocument', N'Measurement Map / City Survey Map', N'मोजणी नकाशा / सिटी सर्व्हे नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 22:31:22.380')
       ,(4105, 4, 45, N'buildingPlanDrawingDoc', N'Building Plan / Construction Drawing', N'बांधकाम आराखडा / नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 22:56:11.760')
       ,(4106, 4, 45, N'approvedDrawingCopyDoc', N'Copy of Approved Drawing', N'मंजूर रेखांकनाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, 0, N'2026-08-17 22:56:11.760')
       ,(5102, 5, 53, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(5103, 5, 53, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(5104, 5, 53, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(5105, 5, 53, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(5106, 5, 53, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(5107, 5, 53, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, 0, N'2026-08-22 19:09:03.640')
       ,(6101, 4, 46, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-08-23 12:58:35.560')
       ,(6102, 7, 59, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-08-23 13:00:21.937')
       ,(6103, 7, 60, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-08-23 13:01:31.673')
       ,(6104, 11, 68, N'email', N'Email', N'ईमेल', N'email', N'Complainant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, 0, N'2026-08-23 13:06:20.847')
       ,(6105, 12, 48, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, 0, N'2026-08-23 18:28:41.520')
    ) AS V (Id, DepartmentId, ServiceId, FieldCode, FieldLabel, FieldLabelLocal, FieldType, FieldGroup, OptionsJson, DefaultValue, ValidationRules, IsRequired, DisplayOrder, MinValue, MaxValue, MaxLength, IsActive, MarkedForDeletion, CreatedBy, CreatedDate)
)
MERGE [RTS].[FieldDefinition] AS Target
USING LiveFields AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.DepartmentId = Source.DepartmentId, Target.ServiceId = Source.ServiceId,
    Target.FieldCode = Source.FieldCode, Target.FieldLabel = Source.FieldLabel,
    Target.FieldLabelLocal = Source.FieldLabelLocal, Target.FieldType = Source.FieldType,
    Target.FieldGroup = Source.FieldGroup, Target.OptionsJson = Source.OptionsJson,
    Target.DefaultValue = Source.DefaultValue, Target.ValidationRules = Source.ValidationRules,
    Target.IsRequired = Source.IsRequired, Target.DisplayOrder = Source.DisplayOrder,
    Target.MinValue = Source.MinValue, Target.MaxValue = Source.MaxValue,
    Target.MaxLength = Source.MaxLength, Target.IsActive = Source.IsActive, Target.MarkedForDeletion = Source.MarkedForDeletion
WHEN NOT MATCHED THEN INSERT (Id, DepartmentId, ServiceId, FieldCode, FieldLabel, FieldLabelLocal, FieldType, FieldGroup, OptionsJson, DefaultValue, ValidationRules, IsRequired, DisplayOrder, MinValue, MaxValue, MaxLength, IsActive, MarkedForDeletion, CreatedBy, CreatedDate)
VALUES (Source.Id, Source.DepartmentId, Source.ServiceId, Source.FieldCode, Source.FieldLabel, Source.FieldLabelLocal, Source.FieldType, Source.FieldGroup, Source.OptionsJson, Source.DefaultValue, Source.ValidationRules, Source.IsRequired, Source.DisplayOrder, Source.MinValue, Source.MaxValue, Source.MaxLength, Source.IsActive, Source.MarkedForDeletion, Source.CreatedBy, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[FieldDefinition] OFF;
GO

-- =========================================================
-- 4. RTS.ApprovalFlowMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] ON;
GO
;WITH LiveFlows AS (
    SELECT * FROM (VALUES
        (36, 43, N'Issuance of Zone Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(37, 44, N'Giving Part Map Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(38, 45, N'Issuance of Construction Permit Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(39, 46, N'Issuance of plinth certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(40, 47, N'Issuance of Occupancy Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(41, 48, N'Underground OFC Cable Permission Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(42, 49, N'Filling Potholes on City Roads Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(43, 50, N'Maintaining & Securing Sewer Covers Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(44, 53, N'Birth Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(45, 54, N'Death Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(46, 55, N'School Leaving / Duplicate Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(47, 56, N'Issuance of transfer certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(48, 57, N'Issuance of duplicate mark sheet Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(49, 58, N'Nursing home license under Registration Act, 1949 Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(50, 59, N'Renewal of nursing home license Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(51, 60, N'Change of nursing home license holder / partner name Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(52, 61, N'Trade / Business / Storage Non-Revocation NOC Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(53, 62, N'Mandap NOC Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(54, 63, N'Issuance of Fire Safety NOC Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(55, 64, N'Issuance of Final Fire Exemption Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(56, 65, N'Marriage Registration Certificate Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(57, 66, N'Tree Felling Permission (Sec 8) Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(58, 68, N'Maintaining cleanliness Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(59, 69, N'Providing drainage connections Default Workflow', 1, 0, N'2026-07-21 19:02:56.547')
       ,(1006, 19, N'Change of Water Connection Usage Type Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1007, 20, N'Preparation of Water Bill Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1008, 26, N'Complaint Regarding Water Pressure Capacity Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1009, 33, N'Changing Occupations / Business Type Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1010, 36, N'Cancellation of License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1011, 80, N'Provision of New Water Tap Connection Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1012, 81, N'Changing the Water Connection Size Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1013, 82, N'Temporary / Permanent Disconnection of Water Connection Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1014, 83, N'Reconnection of Water Tap Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1015, 84, N'Water Bill No Dues Certificate Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1016, 85, N'Complaint Regarding Faulty Water Meter Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1017, 86, N'Complaint Regarding Unauthorized Water Tap Connection Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1018, 87, N'Complaint Regarding Water Quality Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1019, 100, N'Issuance of Plumber License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1020, 101, N'Renewal of Plumber License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1021, 137, N'Obtaining New Trade License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1022, 138, N'Renewal of Trade License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1023, 139, N'Transfer of Trade License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1024, 140, N'Duplicate Copy of Trade License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1025, 141, N'Change of Business Name / Establishment / Address Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1026, 142, N'Change of License Holder / Partner Name Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1027, 143, N'Change in Number of Partners (Increase/Decrease) Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1028, 144, N'Notice on Renewal of Expired License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1029, 145, N'New Property Tax Assessment Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1030, 146, N'Re-Assessment of Property Tax Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1031, 147, N'Preparation of Tax Demand Notice Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1032, 148, N'Avail Property Tax Exemption Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1033, 149, N'Tax Exemption for Non-Resident Properties Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1034, 150, N'Property Tax Self-Assessment Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1035, 151, N'Registration of Objection on Tax Assessment Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1036, 152, N'Sub-division of Property Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1037, 153, N'Re-assessment After Demolition and Reconstruction Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1038, 154, N'Issuance of Property Tax Assessment Copy (8A) Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1039, 155, N'Issuance of No Dues Certificate Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1040, 156, N'Property Transfer Registration Certificate Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1041, 157, N'Change of Ownership Name Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1042, 158, N'Issuance of Lodging House License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1043, 159, N'Renewal of Lodging House License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1044, 160, N'Issuance of Marriage Hall / Auditorium License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1045, 161, N'Renewal of Marriage Hall / Auditorium License Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
       ,(1046, 162, N'Issuance of Hawker Registration Certificate Default Workflow', 1, 0, N'2026-08-12 19:17:56.673')
    ) AS V (Id, ServiceId, ApprovalFlowName, IsActive, CreatedBy, CreatedDate)
)
MERGE [RTS].[ApprovalFlowMaster] AS Target
USING LiveFlows AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.ServiceId = Source.ServiceId, Target.ApprovalFlowName = Source.ApprovalFlowName, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, ServiceId, ApprovalFlowName, IsActive, CreatedBy, CreatedDate)
VALUES (Source.Id, Source.ServiceId, Source.ApprovalFlowName, Source.IsActive, Source.CreatedBy, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] OFF;
GO

-- =========================================================
-- 5. RTS.ApprovalFlowStageMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] ON;
GO
;WITH LiveStages AS (
    SELECT * FROM (VALUES
        (1077, 36, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1078, 37, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1079, 38, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1080, 39, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1081, 40, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1082, 41, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1083, 42, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1084, 43, 1, N'Ass. Town Planner', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1085, 44, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1086, 45, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1087, 46, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1088, 47, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1089, 48, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1090, 49, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1091, 50, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1092, 51, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1093, 52, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1094, 53, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1095, 54, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1096, 55, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1097, 56, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1098, 57, 1, N'Zone Officer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1099, 58, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1100, 59, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0)
       ,(1101, 36, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1102, 37, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1103, 38, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1104, 39, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1105, 40, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1106, 41, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1107, 42, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1108, 43, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1109, 44, 2, N'Senior Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1110, 45, 2, N'Senior Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1111, 46, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1112, 47, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1113, 48, 2, N'Education Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1114, 49, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1115, 50, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1116, 51, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1117, 52, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1118, 53, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1119, 54, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1120, 55, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1121, 56, 2, N'Senior Clerk', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1122, 57, 2, N'Clerk', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1)
       ,(1123, 58, 2, N'Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1124, 59, 2, N'Ass. Town Planner', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1125, 36, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1126, 37, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1127, 38, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1128, 39, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1129, 40, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1131, 49, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1132, 57, 3, N'Deputy Commissioner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(1133, 59, 3, N'Ass. Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(2077, 1029, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2078, 1029, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2079, 1029, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2080, 1029, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2081, 1030, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2082, 1030, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2083, 1030, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2084, 1030, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2085, 1031, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2086, 1031, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2087, 1031, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2088, 1031, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2089, 1032, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2090, 1032, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2091, 1032, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2092, 1032, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2093, 1033, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2094, 1033, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2095, 1033, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2096, 1033, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2097, 1034, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2098, 1034, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2099, 1034, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2100, 1034, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2101, 1035, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2102, 1035, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2103, 1035, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2104, 1035, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2105, 1036, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2106, 1036, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2107, 1036, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2108, 1036, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2109, 1037, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2110, 1037, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2111, 1037, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2112, 1037, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2113, 1038, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2114, 1038, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2115, 1038, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2116, 1038, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2117, 1039, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2118, 1039, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2119, 1039, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2120, 1039, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2121, 1040, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2122, 1040, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2123, 1040, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2124, 1040, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2125, 1041, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2126, 1041, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0)
       ,(2127, 1041, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2128, 1041, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2129, 1006, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2130, 1006, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2131, 1006, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2132, 1007, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2133, 1007, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2134, 1007, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2135, 1008, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2136, 1008, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2137, 1008, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2138, 1011, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2139, 1011, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2140, 1011, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2141, 1012, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2142, 1012, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2143, 1012, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2144, 1013, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2145, 1013, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2146, 1013, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2147, 1014, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2148, 1014, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2149, 1014, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2150, 1015, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2151, 1015, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2152, 1015, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2153, 1016, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2154, 1016, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2155, 1016, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2156, 1017, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2157, 1017, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2158, 1017, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2159, 1018, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2160, 1018, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2161, 1018, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2162, 1019, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2163, 1019, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2164, 1019, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2165, 1020, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2166, 1020, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2167, 1020, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2168, 1009, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2169, 1009, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2170, 1009, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2171, 1010, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2172, 1010, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2173, 1010, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2174, 1021, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2175, 1021, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2176, 1021, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2177, 1022, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2178, 1022, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2179, 1022, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2180, 1023, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2181, 1023, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2182, 1023, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2183, 1024, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2184, 1024, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2185, 1024, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2186, 1025, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2187, 1025, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2188, 1025, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2189, 1026, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2190, 1026, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2191, 1026, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2192, 1027, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2193, 1027, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2194, 1027, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2195, 1028, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2196, 1028, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2197, 1028, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2198, 1042, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2199, 1042, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2200, 1042, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2201, 1043, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2202, 1043, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2203, 1043, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2204, 1044, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2205, 1044, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2206, 1044, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2207, 1045, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2208, 1045, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2209, 1045, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2210, 1046, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0)
       ,(2211, 1046, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0)
       ,(2212, 1046, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0)
       ,(2213, 50, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(2214, 51, 3, N'Medical Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(2215, 54, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(2216, 55, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(3077, 52, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
       ,(3078, 53, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1)
    ) AS V (Id, ApprovalFlowId, StageOrder, StageName, UserId, SLADays, CanVerifyDocument, CanApprove, CanReject, CanReturn, CanPay, IsFinalStage, CanEdit, CanViewNoteSheet)
)
MERGE [RTS].[ApprovalFlowStageMaster] AS Target
USING LiveStages AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.ApprovalFlowId = Source.ApprovalFlowId, Target.StageOrder = Source.StageOrder,
    Target.StageName = Source.StageName, Target.UserId = Source.UserId,
    Target.SLADays = Source.SLADays, Target.CanVerifyDocument = Source.CanVerifyDocument,
    Target.CanApprove = Source.CanApprove, Target.CanReject = Source.CanReject,
    Target.CanReturn = Source.CanReturn, Target.CanPay = Source.CanPay,
    Target.IsFinalStage = Source.IsFinalStage, Target.CanEdit = Source.CanEdit, Target.CanViewNoteSheet = Source.CanViewNoteSheet
WHEN NOT MATCHED THEN INSERT (Id, ApprovalFlowId, StageOrder, StageName, UserId, SLADays, CanVerifyDocument, CanApprove, CanReject, CanReturn, CanPay, IsFinalStage, CanEdit, CanViewNoteSheet)
VALUES (Source.Id, Source.ApprovalFlowId, Source.StageOrder, Source.StageName, Source.UserId, Source.SLADays, Source.CanVerifyDocument, Source.CanApprove, Source.CanReject, Source.CanReturn, Source.CanPay, Source.IsFinalStage, Source.CanEdit, Source.CanViewNoteSheet);
GO
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] OFF;
GO

-- =========================================================
-- 6. RTS.AppealTypeMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] ON;
GO
;WITH LiveAppealTypes AS (
    SELECT * FROM (VALUES
        (1, N'Rejected', N'REJECTED', 1, N'2026-08-11 12:21:38.987')
       ,(2, N'Disagreed', N'DISAGREED', 1, N'2026-08-11 12:21:38.987')
       ,(3, N'SLA Due', N'SLA_DUE', 1, N'2026-08-11 12:21:38.987')
    ) AS V (Id, AppealTypeName, Code, IsActive, CreatedDate)
)
MERGE [RTS].[AppealTypeMaster] AS Target
USING LiveAppealTypes AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.AppealTypeName = Source.AppealTypeName, Target.Code = Source.Code, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, AppealTypeName, Code, IsActive, CreatedDate)
VALUES (Source.Id, Source.AppealTypeName, Source.Code, Source.IsActive, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] OFF;
GO

-- =========================================================
-- 7. RTS.AppealFlowMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealFlowMaster] ON;
GO
;WITH LiveAppealFlows AS (
    SELECT * FROM (VALUES
        (1, 53, N'Birth Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(2, 54, N'Death Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(3, 65, N'Marriage Registration Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(4, 43, N'Zone Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(5, 44, N'Part Map Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(6, 45, N'Construction Permit Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(7, 46, N'Plinth Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(8, 47, N'Occupancy Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(9, 63, N'Fire Safety NOC Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
       ,(10, 64, N'Final Fire Exemption Certificate Appeal Workflow', 1, 0, N'2026-08-04 17:32:58.053')
    ) AS V (Id, ServiceId, AppealFlowName, IsActive, CreatedBy, CreatedDate)
)
MERGE [RTS].[AppealFlowMaster] AS Target
USING LiveAppealFlows AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.ServiceId = Source.ServiceId, Target.AppealFlowName = Source.AppealFlowName, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, ServiceId, AppealFlowName, IsActive, CreatedBy, CreatedDate)
VALUES (Source.Id, Source.ServiceId, Source.AppealFlowName, Source.IsActive, Source.CreatedBy, Source.CreatedDate);
GO
SET IDENTITY_INSERT [RTS].[AppealFlowMaster] OFF;
GO

-- =========================================================
-- 8. RTS.AppealFlowStageMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] ON;
GO
;WITH LiveAppealStages AS (
    SELECT * FROM (VALUES
        (1, 1, 1, N'Assistant Health Executive Officer', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(2, 1, 2, N'Health Executive Officer (MOH)', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(3, 2, 1, N'Assistant Health Executive Officer', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(4, 2, 2, N'Health Executive Officer (MOH)', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(5, 3, 1, N'Deputy Commissioner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(6, 3, 2, N'Divisional Officer', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(7, 4, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(8, 4, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(9, 5, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(10, 5, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(11, 6, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(12, 6, 2, N'Assistant Director of Town Planning / Executive Engineer / City Engineer', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(13, 7, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(14, 7, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(15, 8, 1, N'Town Planner', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(16, 8, 2, N'Assistant Director of Town Planning', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(17, 9, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(18, 9, 2, N'Deputy Commissioner (Fire)', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(19, 10, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, 0, 1, 1, 0, 0, 0)
       ,(20, 10, 2, N'Deputy Commissioner (Fire)', NULL, 45, 0, 1, 1, 0, 1, 0)
       ,(1050, 36, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1051, 36, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1052, 37, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1053, 37, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1054, 38, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1055, 38, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1056, 39, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1057, 39, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1058, 40, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1059, 40, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1060, 41, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1061, 41, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1062, 42, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1063, 42, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1064, 43, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1065, 43, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1066, 44, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1067, 44, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1068, 45, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1069, 45, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1070, 46, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1071, 46, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1072, 47, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1073, 47, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1074, 48, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1075, 48, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1076, 49, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1077, 49, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1078, 50, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1079, 50, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1080, 51, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1081, 51, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1082, 52, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1083, 52, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1084, 53, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1085, 53, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1086, 54, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1087, 54, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1088, 55, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1089, 55, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1090, 56, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1091, 56, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1092, 57, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1093, 57, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1094, 58, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1095, 58, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
       ,(1096, 59, 1, N'First Appellate Officer (neha Puri)', 2004, 30, 0, 1, 1, 0, 0, 0)
       ,(1097, 59, 2, N'Second Appellate Officer (test Puri)', 2005, 45, 0, 1, 1, 0, 1, 0)
    ) AS V (Id, AppealFlowId, StageOrder, StageName, UserId, SLADays, CanVerifyDocument, CanApprove, CanReject, CanReturn, IsFinalStage, CanEdit)
)
MERGE [RTS].[AppealFlowStageMaster] AS Target
USING LiveAppealStages AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.AppealFlowId = Source.AppealFlowId, Target.StageOrder = Source.StageOrder,
    Target.StageName = Source.StageName, Target.UserId = Source.UserId,
    Target.SLADays = Source.SLADays, Target.CanVerifyDocument = Source.CanVerifyDocument,
    Target.CanApprove = Source.CanApprove, Target.CanReject = Source.CanReject,
    Target.CanReturn = Source.CanReturn, Target.IsFinalStage = Source.IsFinalStage, Target.CanEdit = Source.CanEdit
WHEN NOT MATCHED THEN INSERT (Id, AppealFlowId, StageOrder, StageName, UserId, SLADays, CanVerifyDocument, CanApprove, CanReject, CanReturn, IsFinalStage, CanEdit)
VALUES (Source.Id, Source.AppealFlowId, Source.StageOrder, Source.StageName, Source.UserId, Source.SLADays, Source.CanVerifyDocument, Source.CanApprove, Source.CanReject, Source.CanReturn, Source.IsFinalStage, Source.CanEdit);
GO
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] OFF;
GO

-- =========================================================
-- 9. RTS.PaymentStatusMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] ON;
GO
;WITH LivePaymentStatuses AS (
    SELECT * FROM (VALUES
        (1, N'INITIATED', N'Initiated', N'सुरू केले', N'bg-amber-50 text-amber-700', 1, 1, N'2026-08-17 15:10:23.983', NULL)
       ,(2, N'PENDING', N'Pending', N'प्रलंबित', N'bg-yellow-50 text-yellow-800', 2, 1, N'2026-08-17 15:10:23.983', NULL)
       ,(3, N'SUCCESS', N'Success', N'यशस्वी', N'bg-emerald-50 text-emerald-700', 3, 1, N'2026-08-17 15:10:23.983', NULL)
       ,(4, N'FAILED', N'Failed', N'अयशस्वी', N'bg-rose-50 text-rose-700', 4, 1, N'2026-08-17 15:10:23.983', NULL)
       ,(5, N'REFUNDED', N'Refunded', N'परतावा केला', N'bg-purple-50 text-purple-700', 5, 1, N'2026-08-17 15:10:23.983', NULL)
       ,(6, N'EXPIRED', N'Expired', N'कालबाह्य', N'bg-slate-50 text-slate-700', 6, 1, N'2026-08-17 15:10:23.983', NULL)
    ) AS V (Id, StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive, CreatedDate, CreatedBy)
)
MERGE [RTS].[PaymentStatusMaster] AS Target
USING LivePaymentStatuses AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.StatusCode = Source.StatusCode, Target.StatusNameEn = Source.StatusNameEn,
    Target.StatusNameMr = Source.StatusNameMr, Target.BadgeColor = Source.BadgeColor,
    Target.DisplayOrder = Source.DisplayOrder, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, StatusCode, StatusNameEn, StatusNameMr, BadgeColor, DisplayOrder, IsActive, CreatedDate, CreatedBy)
VALUES (Source.Id, Source.StatusCode, Source.StatusNameEn, Source.StatusNameMr, Source.BadgeColor, Source.DisplayOrder, Source.IsActive, Source.CreatedDate, Source.CreatedBy);
GO
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] OFF;
GO

-- =========================================================
-- 10. RTS.PaymentModeMaster (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] ON;
GO
;WITH LivePaymentModes AS (
    SELECT * FROM (VALUES
        (1, N'UPI', N'UPI / QR Code', N'युपीआय / क्यूआर कोड', N'QrCode', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(2, N'NETBANKING', N'Internet Banking', N'नेट बँकिंग', N'Building', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(3, N'CREDIT_CARD', N'Credit Card', N'क्रेडिट कार्ड', N'CreditCard', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(4, N'DEBIT_CARD', N'Debit Card', N'डेबिट कार्ड', N'CreditCard', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(5, N'WALLET', N'Digital Wallet', N'डिजिटल वॉलेट', N'Wallet', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(6, N'OFFLINE_CHALLAN', N'Offline Challan', N'ऑफलाइन चलन', N'FileText', 1, N'2026-08-17 15:10:23.990', NULL)
       ,(7, N'CASH', N'Cash (???)', N'रोख', N'Banknote', 1, N'2026-08-19 16:55:31.167', NULL)
       ,(8, N'CHEQUE', N'Cheque (??????)', N'धनादेश', N'FileText', 1, N'2026-08-23 19:38:42.020', NULL)
    ) AS V (Id, ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive, CreatedDate, CreatedBy)
)
MERGE [RTS].[PaymentModeMaster] AS Target
USING LivePaymentModes AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.ModeCode = Source.ModeCode, Target.ModeNameEn = Source.ModeNameEn,
    Target.ModeNameMr = Source.ModeNameMr, Target.IconName = Source.IconName, Target.IsActive = Source.IsActive
WHEN NOT MATCHED THEN INSERT (Id, ModeCode, ModeNameEn, ModeNameMr, IconName, IsActive, CreatedDate, CreatedBy)
VALUES (Source.Id, Source.ModeCode, Source.ModeNameEn, Source.ModeNameMr, Source.IconName, Source.IsActive, Source.CreatedDate, Source.CreatedBy);
GO
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] OFF;
GO

-- =========================================================
-- 11. RTS.PaymentGatewayConfig (100% Live Records)
-- =========================================================
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] ON;
GO
;WITH LiveGatewayConfig AS (
    SELECT * FROM (VALUES
        (1, N'RAZORPAY', N'Razorpay Smart Gateway', NULL, N'rzp_test_SZLId8MmrfQwTX', N'd1TPunImUMBxcPDStAGUnOdj', N'd1TPunImUMBxcPDStAGUnOdj', N'https://api.razorpay.com/v1/checkout/embedded', N'INR', 1, 1, N'2026-08-17 15:10:24.000', NULL)
    ) AS V (Id, GatewayCode, GatewayName, MerchantId, KeyId, SecretKey, WebhookSecret, ServiceUrl, Currency, IsActive, IsDefault, CreatedDate, CreatedBy)
)
MERGE [RTS].[PaymentGatewayConfig] AS Target
USING LiveGatewayConfig AS Source ON Target.Id = Source.Id
WHEN MATCHED THEN UPDATE SET
    Target.GatewayCode = Source.GatewayCode, Target.GatewayName = Source.GatewayName,
    Target.MerchantId = Source.MerchantId, Target.KeyId = Source.KeyId, Target.SecretKey = Source.SecretKey,
    Target.WebhookSecret = Source.WebhookSecret, Target.ServiceUrl = Source.ServiceUrl,
    Target.Currency = Source.Currency, Target.IsActive = Source.IsActive, Target.IsDefault = Source.IsDefault
WHEN NOT MATCHED THEN INSERT (Id, GatewayCode, GatewayName, MerchantId, KeyId, SecretKey, WebhookSecret, ServiceUrl, Currency, IsActive, IsDefault, CreatedDate, CreatedBy)
VALUES (Source.Id, Source.GatewayCode, Source.GatewayName, Source.MerchantId, Source.KeyId, Source.SecretKey, Source.WebhookSecret, Source.ServiceUrl, Source.Currency, Source.IsActive, Source.IsDefault, Source.CreatedDate, Source.CreatedBy);
GO
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] OFF;
GO

-- ============================================================================
-- 12. RTS.CertificateTemplateMaster Seed Data
--     Strictly configured for internal RTS services where ServiceUrl IS NULL.
-- ============================================================================
;WITH SeedCertificateTemplates AS (
    SELECT * FROM (VALUES
        -- 1. Zone Certificate (Service 43 - Town Planning)
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
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"जावक / आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ZoneType\",\"fieldLabelMarathi\":\"झोन प्रकार व आरक्षण\",\"fieldLabelEnglish\":\"Zone Type & Reservation\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ValidityPeriod\",\"fieldLabelMarathi\":\"वैधता मुदत\",\"fieldLabelEnglish\":\"Validity Period\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["सदर दाखला केवळ नगररचना विकास नियंत्रण नियमावलीच्या अनुषंगाने माहितीस्तव आहे.","सदर दाखल्यावरून जागेच्या मालकी हक्काचा कोणताही दावा करता येणार नाही."]'
        ),

        -- 2. Plinth Certificate (Service 46 - Town Planning)
        (N'Issuance of plinth certificate', N'जोते प्रमाणपत्र (Plinth Certificate)', 'CERT_PLINTH',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या इमारत बांधकामाचे जोते (Plinth Level) मंजूर नकाशाप्रमाणे पूर्ण झाल्याची खात्री करून जोते प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जोते तपासणी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"जोते तपासणी आदेश क्रमांक\",\"fieldLabelEnglish\":\"Plinth Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["पुढील बांधकाम मंजूर नकाशा व नियमांनुसारच करणे बंधनकारक आहे."]'
        ),

        -- 3. School Leaving Certificate (Service 55 - Education)
        (N'School Leaving / Duplicate Certificate', N'शाळा सोडल्याचा दाखला (School Leaving Certificate)', 'CERT_SCHOOL_LEAVING',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शाळेतील नोंदींची पडताळणी करून शाळा सोडल्याचा अधिकृत दाखला जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला / रजिस्टर क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"दाखला / रजिस्टर क्रमांक\",\"fieldLabelEnglish\":\"Certificate / Register No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित करून दिला आहे."]'
        ),

        -- 4. Transfer Certificate (Service 56 - Education)
        (N'Issuance of transfer certificate', N'स्थलांतर दाखला (Transfer Certificate)', 'CERT_TRANSFER_CERT',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय नोंदीनुसार स्थलांतर दाखला (TC) जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>दाखला क्र.:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"दाखला क्रमांक\",\"fieldLabelEnglish\":\"Certificate No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["सदर दाखला शालेय अधिकृत अभिलेखावरून प्रमाणित केला आहे."]'
        ),

        -- 5. Duplicate Mark Sheet (Service 57 - Education)
        (N'Issuance of duplicate mark sheet', N'द्वितीय गुणपत्रक (Duplicate Mark Sheet)', 'CERT_MARK_SHEET',
         N'<div class="certificate-body space-y-4">
    <p>प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय परीक्षा अभिलेखावरून द्वितीय गुणपत्रक प्रमाणित करून देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>गुणपत्रक अनुक्रमांक:</strong> [[OrderNo]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"गुणपत्रक अनुक्रमांक\",\"fieldLabelEnglish\":\"Mark Sheet Serial No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["सदर गुणपत्रक मूळ अभिलेखावरून पडताळून दिले आहे."]'
        ),

        -- 6. Trade NOC (Service 61 - Town Planning)
        (N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार / व्यवसाय ना-हरकत प्रमाणपत्र (Trade NOC)', 'CERT_TRADE_NOC',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र खालील अटींच्या अधीन राहून जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>जावक / आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>वैधता मुदत:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"जावक / आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ValidityPeriod\",\"fieldLabelMarathi\":\"वैधता मुदत\",\"fieldLabelEnglish\":\"Validity Period\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["परिसरातील नागरिकांना किंवा वाहतुकीस कोणताही त्रास होणार नाही याची दक्षता घ्यावी.","प्रदूषण नियंत्रण व मनपाच्या सर्व नियमांचे पालन करणे बंधनकारक राहील."]'
        ),

        -- 7. Mandap NOC (Service 62 - Town Planning)
        (N'Mandap NOC', N'मंडप ना-हरकत / ना-नुकसान प्रमाणपत्र (Mandap NOC)', 'CERT_MANDAP_NOC',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये मंडप उभारणीसाठी ना-हरकत प्रमाणपत्र जारी करण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>परवानगी कालावधी:</strong> [[ValidityPeriod]]</div>
        <div><strong>शुल्क / अनामत पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"परवानगी आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ValidityPeriod\",\"fieldLabelMarathi\":\"परवानगी कालावधी\",\"fieldLabelEnglish\":\"Validity Period\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["रस्त्यावर वाहतुकीस अडथळा निर्माण होणार नाही अशा पद्धतीने मंडप उभारणे आवश्यक आहे.","मुदत संपताच मंडप काढून रस्ता पूर्ववत करणे बंधनकारक आहे."]'
        ),

        -- 8. Tree Felling Permission (Service 66 - Tree Authority)
        (N'Tree Felling Permission', N'वृक्षतोड / छाटणी परवानगी (Tree Permission)', 'CERT_TREE_PERMIT',
         N'<div class="certificate-body space-y-4">
    <p>अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये वृक्ष प्राधिकरणाच्या पाहणी अहवालानुसार वृक्षतोड/फांद्या छाटणी परवानगी खालील अटींवर देण्यात येत आहे.</p>
    <div class="bg-slate-50 p-4 rounded border border-slate-200 text-sm space-y-2">
        <div><strong>परवानगी आदेश क्र.:</strong> [[OrderNo]]</div>
        <div><strong>तोडण्यास/छाटण्यास मंजूर वृक्षांची संख्या:</strong> [[TreeCount]]</div>
        <div><strong>पुनर्लागवड करावयाची वृक्षांची संख्या:</strong> [[ReplantCount]]</div>
        <div><strong>शुल्क पावती क्र.:</strong> [[ChallanNo]]</div>
    </div>
</div>',
         N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"परवानगी आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"TreeCount\",\"fieldLabelMarathi\":\"मंजूर वृक्षांची संख्या\",\"fieldLabelEnglish\":\"Approved Tree Count\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ReplantCount\",\"fieldLabelMarathi\":\"पुनर्लागवड करावयाची झाडे\",\"fieldLabelEnglish\":\"Replant Trees Count\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]',
         N'["तोडलेल्या प्रत्येक वृक्षाच्या बदल्यात नियमानुसार नवीन वृक्षांची लागवड करून त्यांचे संवर्धन करणे बंधनकारक आहे."]'
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

-- Clean up any obsolete certificate templates if the service is an external redirect or complaint (#)
DELETE ctm
FROM [RTS].[CertificateTemplateMaster] ctm
JOIN [RTS].[ServiceMaster] sm ON sm.Id = ctm.ServiceId
WHERE sm.ServiceUrl IS NOT NULL AND sm.ServiceUrl <> '';
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

-- 2. Unified Dynamic SMS Templates
MERGE [CORE].[SMSMaster] AS Target
USING (VALUES
    (1, N'RTS_SUBMITTED', '1207161987654321001',
     N'प्रिय {CitizenName}, तुमचा आरटीएस अर्ज क्र. {ApplicationNo} ({ServiceName}) अकोला महानगरपालिकेकडे प्राप्त झाला आहे. ट्रॅकिंग लिंक: https://citizen.scipl.info.in/service?track={ApplicationNo} - अकोला मनपा',
     1),

    (8, N'RTS_STAGE_FORWARDED', '1207161987654321002',
     N'प्रिय {CitizenName}, तुमचा अर्ज क्र. {ApplicationNo} पुढील टप्प्यावर पडताळणीसाठी पाठवला आहे. - अकोला मनपा',
     1),

    (3, N'RTS_PAYMENT_REQUEST', '1207161987654321003',
     N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) साठी शुल्क भरणे आवश्यक आहे. भरण्यासाठी लिंक: https://citizen.scipl.info.in/service?pay={ApplicationNo} - अकोला मनपा',
     1),

    (3, N'RTS_PAYMENT_SUCCESS', '1207161987654321004',
     N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} साठी रु. {Amount}/- चे शुल्क यशस्वीरीत्या प्राप्त झाले. पावती क्र.: {ReceiptNo}. - अकोला मनपा',
     1),

    (8, N'RTS_APPROVED', '1207161987654321005',
     N'अभिनंदन {CitizenName}! तुमचा अर्ज क्र. {ApplicationNo} ({ServiceName}) मंजूर करण्यात आला आहे. आपले अधिकृत प्रमाणपत्र डाउनलोड करा: https://citizen.scipl.info.in/service?cert={ApplicationNo} - अकोला मनपा',
     1),

    (8, N'RTS_REJECTED', '1207161987654321006',
     N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) नामंजूर केला आहे. आपण ३० दिवसांत प्रथम अपील करू शकता: https://citizen.scipl.info.in/service?appeal={ApplicationNo} - अकोला मनपा',
     1),

    (8, N'RTS_RETURNED', '1207161987654321007',
     N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} मधील त्रुटींच्या पूर्ततेसाठी अर्ज परत पाठवला आहे. दुरुस्तीसाठी लिंक: https://citizen.scipl.info.in/service?edit={ApplicationNo} - अकोला मनपा',
     1),

    (8, N'RTS_APPEAL_FILED', '1207161987654321008',
     N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} वरील आपले अपील नोंदवले गेले आहे. सुनावणीची तारीख लवकरच कळवली जाईल. - अकोला मनपा',
     1)
) AS Source (SMSTypeID, TemplateName, TemplateID, SmsText, IsActive)
ON Target.[TemplateName] = Source.[TemplateName]
WHEN MATCHED THEN
    UPDATE SET
        Target.[SMSGatewayMasterID] = @SmsGatewayId,
        Target.[SMSTypeID] = Source.[SMSTypeID],
        Target.[TemplateID] = Source.[TemplateID],
        Target.[SmsText] = Source.[SmsText],
        Target.[IsActive] = Source.[IsActive],
        Target.[UpdatedDate] = GETDATE()
WHEN NOT MATCHED THEN
    INSERT ([SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (@SmsGatewayId, Source.[SMSTypeID], Source.[TemplateName], Source.[TemplateID], Source.[SmsText], Source.[IsActive], 1, GETDATE());
GO
