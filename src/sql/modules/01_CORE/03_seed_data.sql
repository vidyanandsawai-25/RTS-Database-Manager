SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   CORE Platform Master Seed Data - 100% Live Reference Master Seed
   Source: 192.168.1.21:RTS (Extracted strictly read-only)
   Guaranteed 100% Idempotent, Full Unicode Devanagari/Marathi Preserved
   ============================================================================ */

/* ----------------------------------------------------------------------------
   Table: [CORE].[DepartmentMaster] (5 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[DepartmentMaster] ON;
GO
MERGE INTO [CORE].[DepartmentMaster] AS target
USING (VALUES
    (1, N'PTIS', N'Property Tax', N'string', N'string', N'string', 1, 0, '2026-07-15T16:26:53.477', NULL, NULL),
    (2, N'TL', N'Trade License', N'string', N'string', N'string', 1, 0, '2026-07-15T16:26:53.477', NULL, NULL),
    (3, N'AM', N'Asset Management', N'string', N'string', N'string', 1, 0, '2026-07-15T16:26:53.477', NULL, NULL),
    (4, N'WT', N'Water Tax', N'string', N'string', N'string', 1, 0, '2026-07-15T16:26:53.477', NULL, NULL),
    (5, N'RTS', N'RTS Department', N'लोकसेवा हक्क', N'Landmark', N'Maharashtra Right to Public Services', 1, 1, '2026-07-17T12:47:46.777', 1002, '2026-08-28T13:47:16.937')
) AS source ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DepartmentDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentCode] = source.[DepartmentCode],
        target.[DepartmentName] = source.[DepartmentName],
        target.[DepartmentNameLocal] = source.[DepartmentNameLocal],
        target.[DepartmentIcon] = source.[DepartmentIcon],
        target.[DepartmentDescription] = source.[DepartmentDescription],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DepartmentDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentCode], source.[DepartmentName], source.[DepartmentNameLocal], source.[DepartmentIcon], source.[DepartmentDescription], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[DepartmentMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ModuleMaster] (4 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ModuleMaster] ON;
GO
MERGE INTO [CORE].[ModuleMaster] AS target
USING (VALUES
    (1, 1, N'PTIS_M', N'Property Tax', N'Property Tax', N'home', N'PTIS', N'Property Tax Module', 1, 1, '2026-07-15T16:26:53.537', NULL, NULL),
    (1001, 2, N'TL_M', N'Trade License', N'Trade License', N'home', N'TL', N'Trade License Module', 1, 1, '2026-07-15T16:26:53.537', NULL, NULL),
    (1004, 3, N'AM_M', N'Asset Management', N'Asset Management', N'home', N'AM', N'Asset Management Module', 1, 1, '2026-07-15T16:26:53.537', NULL, NULL),
    (1005, 5, N'RTS_M', N'Right to Service', N'लोकसेवा हक्क', N'Landmark', N'RTS', N'Right to Service administration module', 1, 1, '2026-07-17T12:47:46.783', 1002, '2026-08-28T13:47:16.953')
) AS source ([Id], [DepartmentId], [ModuleCode], [ModuleName], [ModuleNameLocal], [ModuleIcon], [ModuleLabel], [ModuleDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ModuleCode] = source.[ModuleCode],
        target.[ModuleName] = source.[ModuleName],
        target.[ModuleNameLocal] = source.[ModuleNameLocal],
        target.[ModuleIcon] = source.[ModuleIcon],
        target.[ModuleLabel] = source.[ModuleLabel],
        target.[ModuleDescription] = source.[ModuleDescription],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ModuleCode], [ModuleName], [ModuleNameLocal], [ModuleIcon], [ModuleLabel], [ModuleDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ModuleCode], source.[ModuleName], source.[ModuleNameLocal], source.[ModuleIcon], source.[ModuleLabel], source.[ModuleDescription], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[ModuleMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ScreenGroupMaster] (13 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] ON;
GO
MERGE INTO [CORE].[ScreenGroupMaster] AS target
USING (VALUES
    (1, N'Masters', N'Masters', N'Masters', N'one', 1, 0, NULL, '2026-01-09T11:06:52.080', NULL, '2026-05-07T16:26:08.887'),
    (2, N'Configuration Setting', N'Configuration Setting', NULL, N'FolderTree', 1, 0, NULL, '2026-03-25T12:38:09.827', NULL, '2026-04-06T14:37:29.003'),
    (3, N'GRP_DASHBOARD', N'Dashboard', N'GRP', N'dashboard', 1, 1, 1, '2026-05-05T19:50:22.753', NULL, NULL),
    (1003, N'SG004_A', N'????????? ??????????', N'वापरकर्ता व्यवस्थापन', N'user-icon', 5, 1, 1, '2026-05-06T15:43:16.677', 1, '2026-05-07T18:51:57.687'),
    (1004, N'SG004_B', N'User Management', N'User_M', N'user-icon', 4, 1, 1, '2026-05-06T16:07:02.837', NULL, NULL),
    (1005, N'SG004_C', N'User Management', N'User_M', N'user-icon', 4, 1, 1, '2026-05-06T16:10:02.513', NULL, NULL),
    (1006, N'SG005', N'Reports', N'अहवाल', N'report-icon', 5, 0, 1, '2026-05-06T17:40:53.643', NULL, '2026-05-07T16:54:29.060'),
    (2003, N'RTS_DASHBOARD', N'RTS Dashboard', N'आरटीएस डॅशबोर्ड', N'LayoutDashboard', 70, 1, 1, '2026-07-27T17:15:41.550', 1002, '2026-08-26T15:31:32.030'),
    (2004, N'RTS_OPERATIONS', N'RTS Operations', N'आरटीएस कामकाज', N'Files', 71, 1, 1, '2026-07-27T17:15:41.550', 1002, '2026-08-26T15:31:32.030'),
    (2005, N'RTS_CONFIGURATION', N'System Configuration', N'प्रणाली संरचना', N'Settings', 3, 1, 1, '2026-07-27T17:15:41.550', 1002, '2026-08-28T13:47:16.957'),
    (3003, N'RTS_CITIZEN', N'Citizen Services', N'नागरिक सेवा', N'Users', 1, 1, 1002, '2026-08-26T16:07:54.227', 1002, '2026-08-28T13:47:16.957'),
    (3004, N'RTS_OFFICER', N'Officer Workplace', N'अधिकारी कार्यस्थळ', N'Briefcase', 2, 1, 1002, '2026-08-26T16:07:54.227', 1002, '2026-08-28T13:47:16.957'),
    (3005, N'RTS_REPORTS', N'Reports & Analytics', N'अहवाल व विश्लेषण', N'BarChart3', 4, 1, 1002, '2026-08-26T16:07:54.227', 1002, '2026-08-28T13:47:16.957')
) AS source ([Id], [ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal], [ScreenGroupIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ScreenGroupCode] = source.[ScreenGroupCode],
        target.[ScreenGroupName] = source.[ScreenGroupName],
        target.[ScreenGroupNameLocal] = source.[ScreenGroupNameLocal],
        target.[ScreenGroupIcon] = source.[ScreenGroupIcon],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal], [ScreenGroupIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ScreenGroupCode], source.[ScreenGroupName], source.[ScreenGroupNameLocal], source.[ScreenGroupIcon], source.[DisplayOrder], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ScreenMaster] (45 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ScreenMaster] ON;
GO
MERGE INTO [CORE].[ScreenMaster] AS target
USING (VALUES
    (1, 1, 1, N'M', N'Data Analytics', N'Data Analytics', N'', N'proprtytax/departmentmaster', 1, 0, 0, 1, 1, NULL, '2026-01-09T11:08:13.743', NULL, '2026-04-06T15:24:22.910', 1),
    (2, 2, 1, N'BM', N'Search Property', N'Search Property', NULL, N'/bank-master', 1, 0, 0, 2, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (3, 2, 1, N'SM', N'PTIS', N'PTIS', NULL, N'/screen-access', 1, 1, 0, 3, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (4, 2, 1, N'OM', N'Report Engine', N'Report Engine', NULL, N'/office-master', 1, 1, 0, 4, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (5, 2, 1, N'UC', N'GIS', N'GIS', NULL, N'/ulb-configuration', 1, 1, 0, 5, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (6, 2, 1, N'FY', N'Master', N'Master', NULL, N'/financial-year-master', 1, 1, 0, 6, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (7, 2, 1, N'PM', N'User Management', N'User Management', NULL, N'/payment-mode-master', 1, 1, 0, 7, 1, NULL, '2026-03-25T12:38:22.990', NULL, NULL, 1),
    (8, 1, 1, N'TEST', N'test', N'test', N'Monitor', N'/test', 1, 1, 0, 8, 1, NULL, '2026-04-06T14:38:12.743', 2, '2026-05-05T19:33:13.623', 1),
    (1008, 2, 1001, N'SRC101', N'Screen Name 101', N'Screen Name 101', N'Monitor', N'/scr-101', 1, 1, 0, 9, 1, NULL, '2026-04-09T16:03:50.443', NULL, NULL, 1),
    (1009, 1, 1, N'TEST1', N'test1', N'test1', N'Monitor', N'/tst1', 1, 1, 0, 10, 1, NULL, '2026-04-09T19:03:11.097', NULL, NULL, 1),
    (1010, 2, 1004, N'SRC103', N'Screen Name 103', N'Screen Name 103', N'Monitor', N'/scr-103', 1, 1, 0, 11, 1, NULL, '2026-04-09T16:03:50.443', NULL, NULL, 1),
    (1011, 1, 1, N'CT_01', N'Construction Type', N'बांधकाम प्रकार', NULL, N'/construction-type', 1, 1, 0, 1, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1012, 1, 1, N'FM_01', N'Floor Master', N'मजला मास्टर', NULL, N'/floor-master/floor', 1, 1, 0, 2, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1013, 1, 1, N'DM_01', N'Depreciation Master', N'घसारा मास्टर', NULL, N'/depreciationmaster', 1, 1, 0, 3, 0, NULL, '2026-04-28T15:46:49.360', NULL, '2026-05-08T16:24:38.507', 1),
    (1014, 1, 1, N'TU_01', N'Type of Use Master', N'वापर प्रकार मास्टर', NULL, N'/typeofusemaster', 1, 1, 0, 4, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1015, 1, 1, N'TZ_01', N'Tax Zone', N'कर क्षेत्र', NULL, N'/taxzone', 1, 1, 0, 5, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1016, 1, 1, N'RS_01', N'Rate Section Master', N'दर विभाग मास्टर', NULL, N'/rate-section-master', 1, 1, 0, 6, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1017, 1, 1, N'ZM_01_A', N'Zone Master', N'झोन मास्टर', NULL, N'/zone-master', 1, 1, 0, 7, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1018, 1, 1, N'RM_01', N'Rate Master (RV)', N'दर मास्टर (RV)', NULL, N'/rate-master/rvratemaster', 1, 1, 0, 8, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1019, 1, 1, N'RP_01', N'Retention Policy (Year)', N'रिटेन्शन पॉलिसी (वर्ष)', NULL, N'/retentionpolicy/yearwise', 1, 1, 0, 9, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1020, 1, 1, N'RP_02', N'Retention Policy (Factor)', N'रिटेन्शन पॉलिसी (फॅक्टर)', NULL, N'/retentionpolicy/factorwise', 1, 1, 0, 10, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1021, 1, 1, N'WM_01', N'Weightage Master', N'वेटेज मास्टर', NULL, N'/weightage-master', 1, 1, 0, 11, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1022, 1, 1, N'TN_01', N'Tax Zoning', N'कर झोनिंग', NULL, N'/taxzoning', 1, 1, 0, 12, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1023, 1, 1, N'AY_01', N'Assessment Year Range', N'मूल्यांकन वर्ष श्रेणी', NULL, N'/assessment-year-range/capitalvalue', 1, 1, 0, 13, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1024, 1, 1, N'MJ_01', N'Mouja Master', N'मौजा मास्टर', NULL, N'/moujamaster', 1, 1, 0, 14, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (1025, 1, 1, N'PY_01', N'Property Type', N'मालमत्ता प्रकार', NULL, N'/propertytype', 1, 1, 0, 15, 1, NULL, '2026-04-28T15:46:49.360', NULL, NULL, 1),
    (2011, 1, 1, N'ZM_01_B', N'Zone Master', N'झोन मास्टर', NULL, N'/zone-master', 1, 1, 0, 7, 1, 1, '2026-05-05T16:10:46.620', NULL, NULL, 1),
    (2012, 2, 1, N'T1', N'TestTest', N'TestTest', N'Monitor', N'/testtest', 0, 1, 0, 0, 1, 2, '2026-05-05T19:26:47.937', NULL, NULL, 1),
    (3011, 1, 1, N'SCR_DASHBOARD', N'Dashboard', N'मुख्यपृष्ठ', N'dashboard-icon', N'/dashboard', 1, 1, 0, 1, 1, 1, '2026-05-08T11:22:48.963', NULL, NULL, 1),
    (3012, 2, 1, N'AMC_A', N'???????????? ????????', N'म.न.पा. मुख्यपृष्ठ', N'AMC-icon', N'/amc', 1, 1, 0, 1, 1, 1, '2026-05-08T12:57:11.273', NULL, NULL, 1),
    (3013, 2, 1, N'AMC_B', N'????_????-????????', N'म.न_पा', N'AMC-icon', N'/amc', 1, 0, 0, 1, 1, 2, '2026-05-08T13:21:56.270', NULL, NULL, 1),
    (4016, 2003, 1005, N'RTS_MIS', N'RTS MIS Dashboard', N'आरटीएस एमआयएस डॅशबोर्ड', N'LayoutDashboard', N'/rts/dashboard/rts-mis', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4017, 2004, 1005, N'RTS_APP', N'RTS Applications', N'आरटीएस अर्ज', N'Files', N'/rts/dashboard/rts-applications', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4018, 2005, 1005, N'RTS_DEPT', N'RTS Departments', N'आरटीएस विभाग', N'Building2', N'/rts/configuration-settings/rts-departments', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4019, 2005, 1005, N'RTS_SERVICES', N'RTS Services', N'आरटीएस सेवा', N'Activity', N'/rts/configuration-settings/rts-services', 1, 1, 0, 2, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4020, 2005, 1005, N'RTS_FIELDS', N'RTS Fields', N'आरटीएस फील्ड्स', N'Sliders', N'/rts/configuration-settings/rts-fields', 1, 1, 0, 3, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4021, 2005, 1005, N'RTS_APPROVAL_FLOW', N'Approval Flow Master', N'मंजुरी प्रवाह मास्टर', N'GitMerge', N'/rts/configuration-settings/rts-workflows', 1, 1, 0, 4, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (4022, 2005, 1005, N'RTS_USERS', N'RTS User Management', N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users', N'/rts/users', 1, 1, 0, 6, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030', 5),
    (5014, 2005, 1005, N'RTS_CERTIFICATES', N'Certificate Master', N'प्रमाणपत्र संरचना', N'Award', N'/rts/configuration-settings/rts-certificates', 1, 1, 0, 5, 1, 1002, '2026-08-26T14:56:19.947', 1002, '2026-08-26T15:31:32.030', 5),
    (5015, 3003, 1005, N'RTS_SERVICES_PORTAL', N'Service Catalog', N'सेवा सूची', N'LayoutGrid', N'/rts/services', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL, 5),
    (5016, 3003, 1005, N'RTS_TRACK_STATUS', N'Track Application', N'अर्जाची स्थिती ट्रॅक करा', N'Search', N'/rts/track', 1, 0, 0, 2, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL, 5),
    (5017, 3004, 1005, N'RTS_OFFICER_DASHBOARD', N'Officer Dashboard', N'अधिकारी डॅशबोर्ड', N'LayoutDashboard', N'/rts/officer-dashboard', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL, 5),
    (5018, 3004, 1005, N'RTS_APPEAL_DASHBOARD', N'Appeals Management', N'अपील व्यवस्थापन', N'Gavel', N'/rts/appeals', 1, 0, 0, 2, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL, 5),
    (5019, 2005, 1005, N'RTS_DEPARTMENTS', N'Department Master', N'विभाग व्यवस्थापन', N'Building2', N'/rts/configuration-settings/rts-departments', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL, 5),
    (5020, 2005, 1005, N'RTS_OFFICERS', N'Service Officers', N'à¤¸à¥‡à¤µà¤¾ à¤…à¤§à¤¿à¤•à¤¾à¤°à¥€ à¤µà¤¾à¤Ÿà¤ª', N'UserCheck', N'/rts/configuration-settings/rts-officers', 1, 1, 0, 7, 1, 1002, '2026-09-04T18:51:00.677', NULL, NULL, 5)
) AS source ([Id], [ScreenGroupId], [ModuleId], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [IsMenu], [IsAuthenticationRequired], [IsPropertyLockable], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentId])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ScreenGroupId] = source.[ScreenGroupId],
        target.[ModuleId] = source.[ModuleId],
        target.[ScreenCode] = source.[ScreenCode],
        target.[ScreenName] = source.[ScreenName],
        target.[ScreenNameLocal] = source.[ScreenNameLocal],
        target.[ScreenIcon] = source.[ScreenIcon],
        target.[RoutePath] = source.[RoutePath],
        target.[IsMenu] = source.[IsMenu],
        target.[IsAuthenticationRequired] = source.[IsAuthenticationRequired],
        target.[IsPropertyLockable] = source.[IsPropertyLockable],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[DepartmentId] = source.[DepartmentId]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ScreenGroupId], [ModuleId], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [IsMenu], [IsAuthenticationRequired], [IsPropertyLockable], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentId])
    VALUES (source.[Id], source.[ScreenGroupId], source.[ModuleId], source.[ScreenCode], source.[ScreenName], source.[ScreenNameLocal], source.[ScreenIcon], source.[RoutePath], source.[IsMenu], source.[IsAuthenticationRequired], source.[IsPropertyLockable], source.[DisplayOrder], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[DepartmentId]);
GO

SET IDENTITY_INSERT [CORE].[ScreenMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserRoleMaster] (2 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserRoleMaster] ON;
GO
MERGE INTO [CORE].[UserRoleMaster] AS target
USING (VALUES
    (1, N'Admin', 1, 1, '2026-07-15T16:26:53.477', NULL, NULL, 1),
    (2, N'Admin', 1, 1, '2026-07-27T17:15:41.537', 1002, '2026-08-26T15:31:32.027', 5)
) AS source ([Id], [UserRoleName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentId])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserRoleName] = source.[UserRoleName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[DepartmentId] = source.[DepartmentId]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserRoleName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentId])
    VALUES (source.[Id], source.[UserRoleName], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[DepartmentId]);
GO

SET IDENTITY_INSERT [CORE].[UserRoleMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserMaster] (6 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserMaster] ON;
GO
MERGE INTO [CORE].[UserMaster] AS target
USING (VALUES
    (1, N'Clerk', N'Hrishikesh', NULL, N'Patekar', N'CK', N'Pune', N'7058601590', N'8625085936', N'HrishikeshPatekar@gmail.com', 0, N'en', 1, N'Test', NULL, 0, '2026-09-09T19:04:07.187', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', 1, '2026-08-24T12:57:33.160', 1, '2026-08-11T20:02:48.860', 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL),
    (2, N'HeadOfficer', N'Aditya', NULL, N'Fatke', N'HO', N'Pune', N'9876543210', NULL, N'Aditya55@gmail.com', 0, N'en', 1, N'Head Officer', NULL, 0, '2026-09-09T18:08:27.857', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', 1, '2026-08-24T12:57:33.160', NULL, '2026-08-12T12:23:16.203', 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL),
    (3, N'SeniorOfficer', N'Vidyanad', NULL, N'Sawai', N'SO', N'Amravati', N'9876543211', NULL, N'VidyanadSawai2508@gmail.com', 0, N'en', 1, N'Senior Officer', NULL, 1, '2026-09-09T16:19:45.040', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', 1, '2026-08-24T12:57:33.160', NULL, '2026-08-12T12:22:23.800', 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL),
    (1002, N'ADMIN', N'ADMIN', N'ADMIN', N'ADMIN', N'PB', N'Amravati', N'7058601590', N'8625085936', N'ashwineshmukh62@gmail.com', 0, N'en', 1, N'Test', NULL, 1, '2026-09-05T13:55:08.093', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', 1, '2026-08-24T12:57:33.160', NULL, '2026-08-12T12:24:08.297', 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL),
    (2004, N'FirstAppellateOfficer', N'neha', NULL, N'Puri', N'FAO', N'Amravarti', N'9370932047', NULL, N'nehap@gmail.com', 0, N'en', 1, N'Test', NULL, 0, '2026-09-09T18:29:22.020', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', NULL, '2026-08-24T12:57:33.160', NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL),
    (2005, N'SecondAppellateOfficer', N'test', NULL, N'Puri', N'SAO', N'Amravarti', N'9370932048', NULL, N'nehap19@gmail.com', 0, N'en', 1, N'Test', NULL, 1, '2026-09-07T20:06:03.940', 0, 1, N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC', NULL, '2026-08-24T12:57:33.160', NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL)
) AS source ([Id], [UserName], [FirstName], [MiddleName], [LastName], [UserCode], [Address], [MobileNo], [AlternateMobileNo], [Email], [MustChangePassword], [Language], [IsActive], [Remark], [LockedUntilAt], [FailedLoginCount], [LastLoginAt], [UserLocked], [EmployeeTypeId], [PasswordHash], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate], [SecurityStamp], [TwoFactorEnabled], [TwoFactorEnabledAt], [TwoFactorRequired], [TwoFactorSecretEncrypted], [OtpChallengeFailCount], [OtpChallengeLockedUntilAt], [PasswordChangedAt])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserName] = source.[UserName],
        target.[FirstName] = source.[FirstName],
        target.[MiddleName] = source.[MiddleName],
        target.[LastName] = source.[LastName],
        target.[UserCode] = source.[UserCode],
        target.[Address] = source.[Address],
        target.[MobileNo] = source.[MobileNo],
        target.[AlternateMobileNo] = source.[AlternateMobileNo],
        target.[Email] = source.[Email],
        target.[MustChangePassword] = source.[MustChangePassword],
        target.[Language] = source.[Language],
        target.[IsActive] = source.[IsActive],
        target.[Remark] = source.[Remark],
        target.[LockedUntilAt] = source.[LockedUntilAt],
        target.[FailedLoginCount] = source.[FailedLoginCount],
        target.[LastLoginAt] = source.[LastLoginAt],
        target.[UserLocked] = source.[UserLocked],
        target.[EmployeeTypeId] = source.[EmployeeTypeId],
        target.[PasswordHash] = source.[PasswordHash],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[SecurityStamp] = source.[SecurityStamp],
        target.[TwoFactorEnabled] = source.[TwoFactorEnabled],
        target.[TwoFactorEnabledAt] = source.[TwoFactorEnabledAt],
        target.[TwoFactorRequired] = source.[TwoFactorRequired],
        target.[TwoFactorSecretEncrypted] = source.[TwoFactorSecretEncrypted],
        target.[OtpChallengeFailCount] = source.[OtpChallengeFailCount],
        target.[OtpChallengeLockedUntilAt] = source.[OtpChallengeLockedUntilAt],
        target.[PasswordChangedAt] = source.[PasswordChangedAt]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserName], [FirstName], [MiddleName], [LastName], [UserCode], [Address], [MobileNo], [AlternateMobileNo], [Email], [MustChangePassword], [Language], [IsActive], [Remark], [LockedUntilAt], [FailedLoginCount], [LastLoginAt], [UserLocked], [EmployeeTypeId], [PasswordHash], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate], [SecurityStamp], [TwoFactorEnabled], [TwoFactorEnabledAt], [TwoFactorRequired], [TwoFactorSecretEncrypted], [OtpChallengeFailCount], [OtpChallengeLockedUntilAt], [PasswordChangedAt])
    VALUES (source.[Id], source.[UserName], source.[FirstName], source.[MiddleName], source.[LastName], source.[UserCode], source.[Address], source.[MobileNo], source.[AlternateMobileNo], source.[Email], source.[MustChangePassword], source.[Language], source.[IsActive], source.[Remark], source.[LockedUntilAt], source.[FailedLoginCount], source.[LastLoginAt], source.[UserLocked], source.[EmployeeTypeId], source.[PasswordHash], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[MarkedForDeletion], source.[MarkedForDeletionDate], source.[SecurityStamp], source.[TwoFactorEnabled], source.[TwoFactorEnabledAt], source.[TwoFactorRequired], source.[TwoFactorSecretEncrypted], source.[OtpChallengeFailCount], source.[OtpChallengeLockedUntilAt], source.[PasswordChangedAt]);
GO

SET IDENTITY_INSERT [CORE].[UserMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserRoleAllocation] (24 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserRoleAllocation] ON;
GO
MERGE INTO [CORE].[UserRoleAllocation] AS target
USING (VALUES
    (4, 1, 1, 1, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (5, 1, 2, 1, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (6, 1, 3, 1, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (2004, 1, 5, 2, 1, 1, '2026-07-27T17:15:41.540', NULL, NULL),
    (3004, 3, 1, 1, 1, NULL, '2026-08-12T12:22:23.953', NULL, NULL),
    (3005, 3, 2, 1, 1, NULL, '2026-08-12T12:22:23.957', NULL, NULL),
    (3006, 3, 3, 1, 1, NULL, '2026-08-12T12:22:23.957', NULL, NULL),
    (3007, 3, 5, 2, 1, NULL, '2026-08-12T12:22:23.957', NULL, NULL),
    (3008, 2, 1, 1, 1, NULL, '2026-08-12T12:23:16.337', NULL, NULL),
    (3009, 2, 2, 1, 1, NULL, '2026-08-12T12:23:16.337', NULL, NULL),
    (3010, 2, 3, 1, 1, NULL, '2026-08-12T12:23:16.337', NULL, NULL),
    (3011, 2, 5, 2, 1, NULL, '2026-08-12T12:23:16.337', NULL, NULL),
    (3012, 1002, 1, 1, 1, NULL, '2026-08-12T12:24:08.400', NULL, NULL),
    (3013, 1002, 2, 1, 1, NULL, '2026-08-12T12:24:08.400', NULL, NULL),
    (3014, 1002, 3, 1, 1, NULL, '2026-08-12T12:24:08.400', NULL, NULL),
    (3015, 1002, 5, 2, 1, NULL, '2026-08-12T12:24:08.400', 1002, '2026-08-26T15:31:32.027'),
    (3016, 2004, 1, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3017, 2004, 2, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3018, 2004, 3, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3019, 2004, 5, 2, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3020, 2005, 1, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3021, 2005, 2, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3022, 2005, 3, 1, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL),
    (3023, 2005, 5, 2, 1, NULL, '2026-08-12T17:30:17.143', NULL, NULL)
) AS source ([Id], [UserId], [DepartmentId], [UserRoleId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserId] = source.[UserId],
        target.[DepartmentId] = source.[DepartmentId],
        target.[UserRoleId] = source.[UserRoleId],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserId], [DepartmentId], [UserRoleId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserId], source.[DepartmentId], source.[UserRoleId], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[UserRoleAllocation] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserDepartmentAllocation] (24 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserDepartmentAllocation] ON;
GO
MERGE INTO [CORE].[UserDepartmentAllocation] AS target
USING (VALUES
    (7, 1, 1, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (8, 1, 2, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (9, 1, 3, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (1007, 1, 5, 1, 1, '2026-07-17T12:47:46.783', 1, '2026-07-27T17:15:41.540'),
    (2007, 3, 1, 1, NULL, '2026-08-12T12:22:23.850', NULL, NULL),
    (2008, 3, 2, 1, NULL, '2026-08-12T12:22:23.860', NULL, NULL),
    (2009, 3, 3, 1, NULL, '2026-08-12T12:22:23.860', NULL, NULL),
    (2010, 3, 5, 1, NULL, '2026-08-12T12:22:23.860', NULL, NULL),
    (2011, 2, 1, 1, NULL, '2026-08-12T12:23:16.267', NULL, NULL),
    (2012, 2, 2, 1, NULL, '2026-08-12T12:23:16.267', NULL, NULL),
    (2013, 2, 3, 1, NULL, '2026-08-12T12:23:16.267', NULL, NULL),
    (2014, 2, 5, 1, NULL, '2026-08-12T12:23:16.267', NULL, NULL),
    (2015, 1002, 1, 1, NULL, '2026-08-12T12:24:08.333', NULL, NULL),
    (2016, 1002, 2, 1, NULL, '2026-08-12T12:24:08.333', NULL, NULL),
    (2017, 1002, 3, 1, NULL, '2026-08-12T12:24:08.333', NULL, NULL),
    (2018, 1002, 5, 1, NULL, '2026-08-12T12:24:08.333', 1002, '2026-08-26T15:31:32.027'),
    (2019, 2004, 1, 1, NULL, '2026-08-12T17:29:30.660', NULL, NULL),
    (2020, 2004, 2, 1, NULL, '2026-08-12T17:29:30.660', NULL, NULL),
    (2021, 2004, 3, 1, NULL, '2026-08-12T17:29:30.660', NULL, NULL),
    (2022, 2004, 5, 1, NULL, '2026-08-12T17:29:30.660', NULL, NULL),
    (2023, 2005, 1, 1, NULL, '2026-08-12T17:29:30.663', NULL, NULL),
    (2024, 2005, 2, 1, NULL, '2026-08-12T17:29:30.663', NULL, NULL),
    (2025, 2005, 3, 1, NULL, '2026-08-12T17:29:30.663', NULL, NULL),
    (2026, 2005, 5, 1, NULL, '2026-08-12T17:29:30.663', NULL, NULL)
) AS source ([Id], [UserId], [DepartmentId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserId] = source.[UserId],
        target.[DepartmentId] = source.[DepartmentId],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserId], [DepartmentId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserId], source.[DepartmentId], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[UserDepartmentAllocation] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserModuleAllocation] (16 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserModuleAllocation] ON;
GO
MERGE INTO [CORE].[UserModuleAllocation] AS target
USING (VALUES
    (5, 1, 1, 1, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (6, 1, 2, 1001, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (7, 1, 3, 1004, 1, 1, '2026-07-15T16:26:53.480', NULL, NULL),
    (1007, 1, 5, 1005, 1, 1, '2026-07-27T17:15:41.540', NULL, NULL),
    (2005, 3, 1, 1, 1, NULL, '2026-08-12T12:22:23.910', NULL, NULL),
    (2006, 3, 2, 1001, 1, NULL, '2026-08-12T12:22:23.913', NULL, NULL),
    (2007, 3, 3, 1004, 1, NULL, '2026-08-12T12:22:23.913', NULL, NULL),
    (2008, 3, 5, 1005, 1, NULL, '2026-08-12T12:22:23.913', NULL, NULL),
    (2009, 2, 1, 1, 1, NULL, '2026-08-12T12:23:16.300', NULL, NULL),
    (2010, 2, 2, 1001, 1, NULL, '2026-08-12T12:23:16.303', NULL, NULL),
    (2011, 2, 3, 1004, 1, NULL, '2026-08-12T12:23:16.303', NULL, NULL),
    (2012, 2, 5, 1005, 1, NULL, '2026-08-12T12:23:16.303', NULL, NULL),
    (2013, 1002, 1, 1, 1, NULL, '2026-08-12T12:24:08.367', NULL, NULL),
    (2014, 1002, 2, 1001, 1, NULL, '2026-08-12T12:24:08.367', NULL, NULL),
    (2015, 1002, 3, 1004, 1, NULL, '2026-08-12T12:24:08.367', NULL, NULL),
    (2016, 1002, 5, 1005, 1, NULL, '2026-08-12T12:24:08.367', 1002, '2026-08-26T15:31:32.027')
) AS source ([Id], [UserId], [DepartmentId], [ModuleId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserId] = source.[UserId],
        target.[DepartmentId] = source.[DepartmentId],
        target.[ModuleId] = source.[ModuleId],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserId], [DepartmentId], [ModuleId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserId], source.[DepartmentId], source.[ModuleId], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[UserModuleAllocation] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[RoleWiseScreenAccessMaster] (22 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] ON;
GO
MERGE INTO [CORE].[RoleWiseScreenAccessMaster] AS target
USING (VALUES
    (1, 1, 1, 1, 0, 0, 0, 0, 1, NULL, '2026-07-15T16:26:53.540', 2, '2026-05-05T17:13:17.827'),
    (2, 1, 2, 1, 0, 0, 0, 0, 1, NULL, '2026-07-15T16:26:53.540', 2, '2026-04-23T16:23:59.647'),
    (3, 1, 3, 1, 1, 0, 0, 0, 1, NULL, '2026-07-15T16:26:53.540', 2, '2026-04-23T16:24:04.193'),
    (4, 1, 4, 1, 1, 1, 1, 0, 1, NULL, '2026-07-15T16:26:53.540', NULL, NULL),
    (5, 1, 5, 1, 1, 0, 0, 0, 1, NULL, '2026-07-15T16:26:53.540', 2, '2026-04-23T16:23:59.647'),
    (6, 1, 6, 1, 1, 1, 1, 0, 1, NULL, '2026-07-15T16:26:53.540', NULL, NULL),
    (7, 1, 7, 1, 0, 0, 0, 0, 1, NULL, '2026-07-15T16:26:53.540', 2, '2026-04-23T16:23:59.647'),
    (8, 1, 8, 1, 0, 0, 0, 0, 1, 2, '2026-04-23T16:24:04.243', NULL, NULL),
    (9, 1, 1010, 1, 1, 1, 0, 0, 1, 2, '2026-04-23T16:24:04.243', 2, '2026-05-05T17:13:17.827'),
    (10, 1, 1008, 1, 0, 0, 0, 0, 1, 2, '2026-04-23T16:24:04.243', NULL, NULL),
    (11, 1, 1009, 1, 1, 0, 0, 0, 1, 2, '2026-04-23T16:24:04.243', NULL, NULL),
    (1008, 1, 1012, 1, 0, 0, 0, 0, 1, 3, '2026-05-05T11:45:44.033', NULL, NULL),
    (1009, 1, 2012, 1, 1, 0, 0, 0, 1, 2, '2026-05-05T19:32:49.543', NULL, NULL),
    (3010, 2, 4016, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3011, 2, 4017, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3012, 2, 4018, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3013, 2, 4019, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3014, 2, 4020, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3015, 2, 4021, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3016, 2, 4022, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (4008, 2, 5014, 1, 1, 1, 1, 0, 1, 1002, '2026-08-26T14:56:19.960', 1002, '2026-08-26T15:31:32.030'),
    (4009, 2, 5020, 1, 1, 1, 1, 0, 1, 1002, '2026-09-04T18:52:06.060', NULL, NULL)
) AS source ([Id], [UserRoleId], [ScreenId], [CanView], [CanEdit], [CanDelete], [HaveFullAccess], [HaveNoAccess], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserRoleId] = source.[UserRoleId],
        target.[ScreenId] = source.[ScreenId],
        target.[CanView] = source.[CanView],
        target.[CanEdit] = source.[CanEdit],
        target.[CanDelete] = source.[CanDelete],
        target.[HaveFullAccess] = source.[HaveFullAccess],
        target.[HaveNoAccess] = source.[HaveNoAccess],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserRoleId], [ScreenId], [CanView], [CanEdit], [CanDelete], [HaveFullAccess], [HaveNoAccess], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserRoleId], source.[ScreenId], source.[CanView], source.[CanEdit], source.[CanDelete], source.[HaveFullAccess], source.[HaveNoAccess], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[EmployeeTypeMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[EmployeeTypeMaster] ON;
GO
MERGE INTO [CORE].[EmployeeTypeMaster] AS target
USING (VALUES
    (1, N'Office', 1, 1, '2026-07-15T16:26:53.477', NULL, NULL)
) AS source ([Id], [EmployeeType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[EmployeeType] = source.[EmployeeType],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [EmployeeType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[EmployeeType], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[EmployeeTypeMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[CommonRemarkTypeMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[CommonRemarkTypeMaster] ON;
GO
MERGE INTO [CORE].[CommonRemarkTypeMaster] AS target
USING (VALUES
    (1, N'MobileNoRemark', 1, NULL, '2026-05-05T17:23:40.557', NULL, NULL)
) AS source ([Id], [RemarkTypeName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[RemarkTypeName] = source.[RemarkTypeName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [RemarkTypeName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[RemarkTypeName], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[CommonRemarkTypeMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UlbType] (3 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UlbType] ON;
GO
MERGE INTO [CORE].[UlbType] AS target
USING (VALUES
    (1, N'Corporation', 1, NULL, '2026-07-15T16:26:53.477', NULL, NULL),
    (2, N'Council', 1, NULL, '2026-07-15T16:26:53.477', NULL, NULL),
    (3, N'Nagar Panchayat', 1, NULL, '2026-07-15T16:26:53.477', NULL, NULL)
) AS source ([Id], [UlbTypeName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UlbTypeName] = source.[UlbTypeName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UlbTypeName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UlbTypeName], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[UlbType] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UlbMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UlbMaster] ON;
GO
MERGE INTO [CORE].[UlbMaster] AS target
USING (VALUES
    (1, N'AK001', N'AKOLA MUNICIPAL CORPORATION', N'अकोला महानगरपालिका, अकोला', 1, N'/images/org_logo.png', N'akolamc@gmail.com', N'07242434412', N'110000', N'https://citizen.scipl.info.in', N'सक्षम अधिकारी', N'Competent Officer', N'एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर वाचनालय, शास्त्री पुतळ्याजवळ, जुना कापड बाजार, अकोला, महाराष्ट्र - ४४४००१', N'MH', N'Akola', N'444001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-15T16:26:53.477', NULL, NULL, NULL)
) AS source ([Id], [UlbCode], [UlbName], [UlbNameLocal], [UlbTypeId], [UlbLogo], [EmailId], [MobileNo], [AlternateMobileNo], [WebsiteUrl], [ContactPersonName], [ContactPersonDesignation], [UlbAddress], [State], [District], [PinCode], [ProjectStartDate], [FinancialYearStartDate], [ExpectedGoLiveDate], [PartnerName], [PMName], [PMEmailId], [PMMobileNo], [LicenceType], [LicenceStartDate], [LicenceEndDate], [LicenceDuration], [SupportType], [LicenceKey], [IsActive], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UlbCode] = source.[UlbCode],
        target.[UlbName] = source.[UlbName],
        target.[UlbNameLocal] = source.[UlbNameLocal],
        target.[UlbTypeId] = source.[UlbTypeId],
        target.[UlbLogo] = source.[UlbLogo],
        target.[EmailId] = source.[EmailId],
        target.[MobileNo] = source.[MobileNo],
        target.[AlternateMobileNo] = source.[AlternateMobileNo],
        target.[WebsiteUrl] = source.[WebsiteUrl],
        target.[ContactPersonName] = source.[ContactPersonName],
        target.[ContactPersonDesignation] = source.[ContactPersonDesignation],
        target.[UlbAddress] = source.[UlbAddress],
        target.[State] = source.[State],
        target.[District] = source.[District],
        target.[PinCode] = source.[PinCode],
        target.[ProjectStartDate] = source.[ProjectStartDate],
        target.[FinancialYearStartDate] = source.[FinancialYearStartDate],
        target.[ExpectedGoLiveDate] = source.[ExpectedGoLiveDate],
        target.[PartnerName] = source.[PartnerName],
        target.[PMName] = source.[PMName],
        target.[PMEmailId] = source.[PMEmailId],
        target.[PMMobileNo] = source.[PMMobileNo],
        target.[LicenceType] = source.[LicenceType],
        target.[LicenceStartDate] = source.[LicenceStartDate],
        target.[LicenceEndDate] = source.[LicenceEndDate],
        target.[LicenceDuration] = source.[LicenceDuration],
        target.[SupportType] = source.[SupportType],
        target.[LicenceKey] = source.[LicenceKey],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UlbCode], [UlbName], [UlbNameLocal], [UlbTypeId], [UlbLogo], [EmailId], [MobileNo], [AlternateMobileNo], [WebsiteUrl], [ContactPersonName], [ContactPersonDesignation], [UlbAddress], [State], [District], [PinCode], [ProjectStartDate], [FinancialYearStartDate], [ExpectedGoLiveDate], [PartnerName], [PMName], [PMEmailId], [PMMobileNo], [LicenceType], [LicenceStartDate], [LicenceEndDate], [LicenceDuration], [SupportType], [LicenceKey], [IsActive], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy])
    VALUES (source.[Id], source.[UlbCode], source.[UlbName], source.[UlbNameLocal], source.[UlbTypeId], source.[UlbLogo], source.[EmailId], source.[MobileNo], source.[AlternateMobileNo], source.[WebsiteUrl], source.[ContactPersonName], source.[ContactPersonDesignation], source.[UlbAddress], source.[State], source.[District], source.[PinCode], source.[ProjectStartDate], source.[FinancialYearStartDate], source.[ExpectedGoLiveDate], source.[PartnerName], source.[PMName], source.[PMEmailId], source.[PMMobileNo], source.[LicenceType], source.[LicenceStartDate], source.[LicenceEndDate], source.[LicenceDuration], source.[SupportType], source.[LicenceKey], source.[IsActive], source.[CreatedDate], source.[UpdatedDate], source.[CreatedBy], source.[UpdatedBy]);
GO

SET IDENTITY_INSERT [CORE].[UlbMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UlbImageMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UlbImageMaster] ON;
GO
MERGE INTO [CORE].[UlbImageMaster] AS target
USING (VALUES
    (1, N'Background', 31257, 1, 1, '2026-09-05T14:02:06.700', NULL, NULL)
) AS source ([Id], [ImageType], [ImageId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ImageType] = source.[ImageType],
        target.[ImageId] = source.[ImageId],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ImageType], [ImageId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ImageType], source.[ImageId], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[UlbImageMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[YearMaster] (4 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[YearMaster] ON;
GO
MERGE INTO [CORE].[YearMaster] AS target
USING (VALUES
    (1, 2022, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2026-07-15T16:26:56.290', NULL, NULL),
    (2, 2023, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2026-07-15T16:26:56.290', NULL, NULL),
    (3, 2024, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2026-07-15T16:26:56.290', NULL, NULL),
    (4, 2025, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2026-07-15T16:26:56.290', NULL, NULL)
) AS source ([Id], [Year], [YearCode], [Status], [StartDate], [EndDate], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[Year] = source.[Year],
        target.[YearCode] = source.[YearCode],
        target.[Status] = source.[Status],
        target.[StartDate] = source.[StartDate],
        target.[EndDate] = source.[EndDate],
        target.[Description] = source.[Description],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [Year], [YearCode], [Status], [StartDate], [EndDate], [Description], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[Year], source.[YearCode], source.[Status], source.[StartDate], source.[EndDate], source.[Description], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[YearMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[SMSGatewayMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[SMSGatewayMaster] ON;
GO
MERGE INTO [CORE].[SMSGatewayMaster] AS target
USING (VALUES
    (1, N'Akola Municipal Corporation SMS Gateway', 1, 1, '2026-08-17T16:57:18.413')
) AS source ([SMSGatewayMasterID], [ProviderName], [IsActive], [CreatedBy], [CreatedDate])
ON (target.[SMSGatewayMasterID] = source.[SMSGatewayMasterID])
WHEN MATCHED THEN
    UPDATE SET
        target.[ProviderName] = source.[ProviderName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSGatewayMasterID], [ProviderName], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (source.[SMSGatewayMasterID], source.[ProviderName], source.[IsActive], source.[CreatedBy], source.[CreatedDate]);
GO

SET IDENTITY_INSERT [CORE].[SMSGatewayMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[SmsGatewayDetails] (11 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[SmsGatewayDetails] ON;
GO
MERGE INTO [CORE].[SmsGatewayDetails] AS target
USING (VALUES
    (1, 1, N'BaseURL', N'http://sms.ptaxcollection.com/sendsms.jsp', 1, 1, 0, 0, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (2, 1, N'user', N'payakl', 2, 0, 0, 0, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (3, 1, N'password', N'fb05b4a701XX', 3, 0, 0, 0, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (4, 1, N'senderid', N'AKOLMC', 4, 0, 0, 0, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (5, 1, N'mobiles', N'', 5, 0, 0, 1, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (6, 1, N'sms', N'', 6, 0, 1, 0, 0, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (7, 1, N'tempid', N'', 7, 0, 0, 0, 1, 0, 1, 1, '2026-08-17T16:57:18.420'),
    (8, 1, N'unicode', N'0', 8, 0, 0, 0, 0, 1, 1, 1, '2026-08-17T16:57:18.420'),
    (9, 1, N'accusage', N'1', 8, 0, 0, 0, 0, 0, 1, 1, '2026-08-20T14:25:08.470'),
    (10, 1, N'entityid', N'1701161970302682421', 9, 0, 0, 0, 0, 0, 1, 1, '2026-08-20T14:25:08.470'),
    (11, 1, N'responsein', N'json', 10, 0, 0, 0, 0, 0, 1, 1, '2026-08-20T14:25:08.470')
) AS source ([SMSGatewayDetailsID], [SMSGatewayMasterID], [PropertyName], [Value], [SequenceNo], [IsURL], [IsMessage], [IsMobile], [IsTemplateID], [IsUnicode], [IsActive], [CreatedBy], [CreatedDate])
ON (target.[SMSGatewayDetailsID] = source.[SMSGatewayDetailsID])
WHEN MATCHED THEN
    UPDATE SET
        target.[SMSGatewayMasterID] = source.[SMSGatewayMasterID],
        target.[PropertyName] = source.[PropertyName],
        target.[Value] = source.[Value],
        target.[SequenceNo] = source.[SequenceNo],
        target.[IsURL] = source.[IsURL],
        target.[IsMessage] = source.[IsMessage],
        target.[IsMobile] = source.[IsMobile],
        target.[IsTemplateID] = source.[IsTemplateID],
        target.[IsUnicode] = source.[IsUnicode],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSGatewayDetailsID], [SMSGatewayMasterID], [PropertyName], [Value], [SequenceNo], [IsURL], [IsMessage], [IsMobile], [IsTemplateID], [IsUnicode], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (source.[SMSGatewayDetailsID], source.[SMSGatewayMasterID], source.[PropertyName], source.[Value], source.[SequenceNo], source.[IsURL], source.[IsMessage], source.[IsMobile], source.[IsTemplateID], source.[IsUnicode], source.[IsActive], source.[CreatedBy], source.[CreatedDate]);
GO

SET IDENTITY_INSERT [CORE].[SmsGatewayDetails] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[SMSType] (8 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[SMSType] ON;
GO
MERGE INTO [CORE].[SMSType] AS target
USING (VALUES
    (1, N'OTP', N'One Time Password for citizen login/verification', 1),
    (2, N'Change Password', N'Notification for password updates', 1),
    (3, N'Online Fee Paid', N'Receipt notification for online fee payments', 1),
    (4, N'RTS Application Submitted', N'Notification sent when RTS application is submitted', 1),
    (5, N'RTS Payment Pending', N'Notification requesting citizen to pay application fee', 1),
    (6, N'RTS Application Approved', N'Notification when RTS service is approved and ready', 1),
    (7, N'RTS Application Rejected', N'Notification when RTS application is rejected', 1),
    (8, N'RTS Application Status Update', N'Unified status update notification for all RTS workflow steps', 1)
) AS source ([SMSTypeID], [TypeName], [Description], [IsActive])
ON (target.[SMSTypeID] = source.[SMSTypeID])
WHEN MATCHED THEN
    UPDATE SET
        target.[TypeName] = source.[TypeName],
        target.[Description] = source.[Description],
        target.[IsActive] = source.[IsActive]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSTypeID], [TypeName], [Description], [IsActive])
    VALUES (source.[SMSTypeID], source.[TypeName], source.[Description], source.[IsActive]);
GO

SET IDENTITY_INSERT [CORE].[SMSType] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[SMSMaster] (11 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[SMSMaster] ON;
GO
MERGE INTO [CORE].[SMSMaster] AS target
USING (VALUES
    (9, 1, 3, N'RTS_FEE_PAID', N'1777178721313405133', N'Dear {CitizenName}, Payment of Rs.{Amount} for RTS Application No: {ApplicationNo} is successful. Receipt No: {ReceiptNo}. Download Receipt: https://citizen.scipl.info.in/service?receipt={ReceiptNo} Akola Municipal Corporation', 1, 1, '2026-08-17T16:57:18.437', NULL, '2026-08-20T13:26:49.787'),
    (11, 1, 1, N'RTS_CITIZEN_LOGIN_OTP', N'1777178721904398497', N'Your RTS Citizen Portal login OTP is {Otp}. Please do not share this OTP with anyone. Akola Municipal Corporation', 1, 1, '2026-08-18T17:46:57.223', NULL, '2026-08-20T13:26:49.783'),
    (12, 1, 8, N'RTS_APP_STATUS_UPDATE', N'1777178721329285369', N'Dear {CitizenName}, Your RTS Application No: {ApplicationNo} for {ServiceName} is Currently {Status} Track Status: https://citizen.scipl.info.in/service?track={ApplicationNo} Akola Municipal Corporation', 1, 1, '2026-08-18T17:46:57.223', NULL, '2026-08-20T13:26:49.783'),
    (1011, 1, 1, N'RTS_SUBMITTED', N'1207161987654321001', N'प्रिय {CitizenName}, तुमचा आरटीएस अर्ज क्र. {ApplicationNo} ({ServiceName}) अकोला महानगरपालिकेकडे प्राप्त झाला आहे. ट्रॅकिंग लिंक: https://citizen.scipl.info.in/service?track={ApplicationNo} - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1012, 1, 8, N'RTS_STAGE_FORWARDED', N'1207161987654321002', N'प्रिय {CitizenName}, तुमचा अर्ज क्र. {ApplicationNo} पुढील टप्प्यावर पडताळणीसाठी पाठवला आहे. - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1013, 1, 3, N'RTS_PAYMENT_REQUEST', N'1207161987654321003', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) साठी शुल्क भरणे आवश्यक आहे. भरण्यासाठी लिंक: https://citizen.scipl.info.in/service?pay={ApplicationNo} - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1014, 1, 3, N'RTS_PAYMENT_SUCCESS', N'1207161987654321004', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} साठी रु. {Amount}/- चे शुल्क यशस्वीरीत्या प्राप्त झाले. पावती क्र.: {ReceiptNo}. - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1015, 1, 8, N'RTS_APPROVED', N'1207161987654321005', N'अभिनंदन {CitizenName}! तुमचा अर्ज क्र. {ApplicationNo} ({ServiceName}) मंजूर करण्यात आला आहे. आपले अधिकृत प्रमाणपत्र डाउनलोड करा: https://citizen.scipl.info.in/service?cert={ApplicationNo} - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1016, 1, 8, N'RTS_REJECTED', N'1207161987654321006', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) नामंजूर केला आहे. आपण ३० दिवसांत प्रथम अपील करू शकता: https://citizen.scipl.info.in/service?appeal={ApplicationNo} - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1017, 1, 8, N'RTS_RETURNED', N'1207161987654321007', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} मधील त्रुटींच्या पूर्ततेसाठी अर्ज परत पाठवला आहे. दुरुस्तीसाठी लिंक: https://citizen.scipl.info.in/service?edit={ApplicationNo} - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1018, 1, 8, N'RTS_APPEAL_FILED', N'1207161987654321008', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} वरील आपले अपील नोंदवले गेले आहे. सुनावणीची तारीख लवकरच कळवली जाईल. - अकोला मनपा', 1, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467')
) AS source ([SmsID], [SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[SmsID] = source.[SmsID])
WHEN MATCHED THEN
    UPDATE SET
        target.[SMSGatewayMasterID] = source.[SMSGatewayMasterID],
        target.[SMSTypeID] = source.[SMSTypeID],
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateID] = source.[TemplateID],
        target.[SmsText] = source.[SmsText],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SmsID], [SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[SmsID], source.[SMSGatewayMasterID], source.[SMSTypeID], source.[TemplateName], source.[TemplateID], source.[SmsText], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[SMSMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[DocumentBinding] (2 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[DocumentBinding] ON;
GO
MERGE INTO [CORE].[DocumentBinding] AS target
USING (VALUES
    (1, 10041, 1, 1, N'string', NULL, '3fa85f64-5717-4562-b3fc-2c963f66afa6', N'string', N'string', 1, NULL, NULL, 1, 2, 1, 0, 1, '2026-08-10T17:54:39.670', 0, '2026-08-10T17:12:03.780', 0, '2026-08-10T17:54:39.670', N'System.Byte[]'),
    (2, 10042, 1, 1, N'string', NULL, '3fa85f64-5717-4562-b3fc-2c963f66afa6', N'string', N'string', 1, NULL, NULL, 1, 2, 1, 1, 0, NULL, 0, '2026-08-10T17:54:39.627', NULL, NULL, N'System.Byte[]')
) AS source ([Id], [DocumentId], [DepartmentId], [ModuleId], [ReferenceTableName], [ReferenceTableId], [ReferenceTableIdGuid], [ReferencePropertyName], [BindingPurpose], [IsPrimaryDocument], [Notes], [AccessPermission], [AuthDepartmentId], [AuthReferenceId], [IsReferenceValid], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [RowVersion])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DocumentId] = source.[DocumentId],
        target.[DepartmentId] = source.[DepartmentId],
        target.[ModuleId] = source.[ModuleId],
        target.[ReferenceTableName] = source.[ReferenceTableName],
        target.[ReferenceTableId] = source.[ReferenceTableId],
        target.[ReferenceTableIdGuid] = source.[ReferenceTableIdGuid],
        target.[ReferencePropertyName] = source.[ReferencePropertyName],
        target.[BindingPurpose] = source.[BindingPurpose],
        target.[IsPrimaryDocument] = source.[IsPrimaryDocument],
        target.[Notes] = source.[Notes],
        target.[AccessPermission] = source.[AccessPermission],
        target.[AuthDepartmentId] = source.[AuthDepartmentId],
        target.[AuthReferenceId] = source.[AuthReferenceId],
        target.[IsReferenceValid] = source.[IsReferenceValid],
        target.[IsActive] = source.[IsActive],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[RowVersion] = source.[RowVersion]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DocumentId], [DepartmentId], [ModuleId], [ReferenceTableName], [ReferenceTableId], [ReferenceTableIdGuid], [ReferencePropertyName], [BindingPurpose], [IsPrimaryDocument], [Notes], [AccessPermission], [AuthDepartmentId], [AuthReferenceId], [IsReferenceValid], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [RowVersion])
    VALUES (source.[Id], source.[DocumentId], source.[DepartmentId], source.[ModuleId], source.[ReferenceTableName], source.[ReferenceTableId], source.[ReferenceTableIdGuid], source.[ReferencePropertyName], source.[BindingPurpose], source.[IsPrimaryDocument], source.[Notes], source.[AccessPermission], source.[AuthDepartmentId], source.[AuthReferenceId], source.[IsReferenceValid], source.[IsActive], source.[MarkedForDeletion], source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[RowVersion]);
GO

SET IDENTITY_INSERT [CORE].[DocumentBinding] OFF;
GO

