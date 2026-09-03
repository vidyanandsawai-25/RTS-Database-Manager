SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS Module Master Seed Data - 100% Live Production Master Seed
   Source: 192.168.1.21:RTS
   Guaranteed 100% Idempotent and Non-Destructive to Live Application Data
   ============================================================================ */

/* ----------------------------------------------------------------------------
   Table: [CORE].[DepartmentMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[DepartmentMaster] ON;
GO
MERGE INTO [CORE].[DepartmentMaster] AS target
USING (VALUES
    (5, N'RTS', N'RTS Department', N'लोकसेवा हक्क', N'Landmark', N'Maharashtra Right to Public Services', 0, 1, 1, '2026-07-17T12:47:46.777', 1002, '2026-08-28T13:47:16.937')
) AS source ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DepartmentDescription], [IsProtected], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentCode] = source.[DepartmentCode],
        target.[DepartmentName] = source.[DepartmentName],
        target.[DepartmentNameLocal] = source.[DepartmentNameLocal],
        target.[DepartmentIcon] = source.[DepartmentIcon],
        target.[DepartmentDescription] = source.[DepartmentDescription],
        target.[IsProtected] = ISNULL(source.[IsProtected], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DepartmentDescription], [IsProtected], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentCode], source.[DepartmentName], source.[DepartmentNameLocal], source.[DepartmentIcon], source.[DepartmentDescription], ISNULL(source.[IsProtected], 0), ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[DepartmentMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ModuleMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ModuleMaster] ON;
GO
MERGE INTO [CORE].[ModuleMaster] AS target
USING (VALUES
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
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ModuleCode], [ModuleName], [ModuleNameLocal], [ModuleIcon], [ModuleLabel], [ModuleDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ModuleCode], source.[ModuleName], source.[ModuleNameLocal], source.[ModuleIcon], source.[ModuleLabel], source.[ModuleDescription], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[ModuleMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ScreenGroupMaster] (6 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] ON;
GO
MERGE INTO [CORE].[ScreenGroupMaster] AS target
USING (VALUES
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
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal], [ScreenGroupIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ScreenGroupCode], source.[ScreenGroupName], source.[ScreenGroupNameLocal], source.[ScreenGroupIcon], source.[DisplayOrder], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[ScreenMaster] (13 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[ScreenMaster] ON;
GO
MERGE INTO [CORE].[ScreenMaster] AS target
USING (VALUES
    (4016, 2003, 1005, N'RTS_MIS', N'RTS MIS Dashboard', N'आरटीएस एमआयएस डॅशबोर्ड', N'LayoutDashboard', N'/rts/dashboard/rts-mis', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4017, 2004, 1005, N'RTS_APP', N'RTS Applications', N'आरटीएस अर्ज', N'Files', N'/rts/dashboard/rts-applications', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4018, 2005, 1005, N'RTS_DEPT', N'RTS Departments', N'आरटीएस विभाग', N'Building2', N'/rts/configuration-settings/rts-departments', 1, 1, 0, 1, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4019, 2005, 1005, N'RTS_SERVICES', N'RTS Services', N'आरटीएस सेवा', N'Activity', N'/rts/configuration-settings/rts-services', 1, 1, 0, 2, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4020, 2005, 1005, N'RTS_FIELDS', N'RTS Fields', N'आरटीएस फील्ड्स', N'Sliders', N'/rts/configuration-settings/rts-fields', 1, 1, 0, 3, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4021, 2005, 1005, N'RTS_APPROVAL_FLOW', N'Approval Flow Master', N'मंजुरी प्रवाह मास्टर', N'GitMerge', N'/rts/configuration-settings/rts-workflows', 1, 1, 0, 4, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (4022, 2005, 1005, N'RTS_USERS', N'RTS User Management', N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users', N'/rts/users', 1, 1, 0, 6, 1, 1, '2026-07-27T17:15:41.573', 1002, '2026-08-26T15:31:32.030'),
    (5014, 2005, 1005, N'RTS_CERTIFICATES', N'Certificate Master', N'प्रमाणपत्र संरचना', N'Award', N'/rts/configuration-settings/rts-certificates', 1, 1, 0, 5, 1, 1002, '2026-08-26T14:56:19.947', 1002, '2026-08-26T15:31:32.030'),
    (5015, 3003, 1005, N'RTS_SERVICES_PORTAL', N'Service Catalog', N'सेवा सूची', N'LayoutGrid', N'/rts/services', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL),
    (5016, 3003, 1005, N'RTS_TRACK_STATUS', N'Track Application', N'अर्जाची स्थिती ट्रॅक करा', N'Search', N'/rts/track', 1, 0, 0, 2, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL),
    (5017, 3004, 1005, N'RTS_OFFICER_DASHBOARD', N'Officer Dashboard', N'अधिकारी डॅशबोर्ड', N'LayoutDashboard', N'/rts/officer-dashboard', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL),
    (5018, 3004, 1005, N'RTS_APPEAL_DASHBOARD', N'Appeals Management', N'अपील व्यवस्थापन', N'Gavel', N'/rts/appeals', 1, 0, 0, 2, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL),
    (5019, 2005, 1005, N'RTS_DEPARTMENTS', N'Department Master', N'विभाग व्यवस्थापन', N'Building2', N'/rts/configuration-settings/rts-departments', 1, 0, 0, 1, 1, 1002, '2026-08-26T16:07:54.230', NULL, NULL)
) AS source ([Id], [ScreenGroupId], [ModuleId], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [IsMenu], [IsAuthenticationRequired], [IsPropertyLockable], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
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
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ScreenGroupId], [ModuleId], [ScreenCode], [ScreenName], [ScreenNameLocal], [ScreenIcon], [RoutePath], [IsMenu], [IsAuthenticationRequired], [IsPropertyLockable], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ScreenGroupId], source.[ModuleId], source.[ScreenCode], source.[ScreenName], source.[ScreenNameLocal], source.[ScreenIcon], source.[RoutePath], source.[IsMenu], source.[IsAuthenticationRequired], source.[IsPropertyLockable], source.[DisplayOrder], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[ScreenMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[UserRoleMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[UserRoleMaster] ON;
GO
MERGE INTO [CORE].[UserRoleMaster] AS target
USING (VALUES
    (2, N'Admin', 5, 1, 1, '2026-07-27T17:15:41.577', NULL, NULL)
) AS source ([Id], [UserRoleName], [DepartmentId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserRoleName] = source.[UserRoleName],
        target.[DepartmentId] = source.[DepartmentId],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserRoleName], [DepartmentId], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserRoleName], source.[DepartmentId], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [CORE].[UserRoleMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[RoleWiseScreenAccessMaster] (8 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] ON;
GO
MERGE INTO [CORE].[RoleWiseScreenAccessMaster] AS target
USING (VALUES
    (3010, 2, 4016, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3011, 2, 4017, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3012, 2, 4018, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3013, 2, 4019, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3014, 2, 4020, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3015, 2, 4021, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (3016, 2, 4022, 1, 1, 1, 1, 0, 1, 1, '2026-07-27T17:15:41.577', 1002, '2026-08-26T15:31:32.030'),
    (4008, 2, 5014, 1, 1, 1, 1, 0, 1, 1002, '2026-08-26T14:56:19.960', 1002, '2026-08-26T15:31:32.030')
) AS source ([Id], [UserRoleId], [ScreenId], [CanView], [CanEdit], [CanDelete], [HaveFullAccess], [HaveNoAccess], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[UserRoleId] = source.[UserRoleId],
        target.[ScreenId] = source.[ScreenId],
        target.[CanView] = ISNULL(source.[CanView], 1),
        target.[CanEdit] = ISNULL(source.[CanEdit], 1),
        target.[CanDelete] = ISNULL(source.[CanDelete], 1),
        target.[HaveFullAccess] = ISNULL(source.[HaveFullAccess], 1),
        target.[HaveNoAccess] = ISNULL(source.[HaveNoAccess], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [UserRoleId], [ScreenId], [CanView], [CanEdit], [CanDelete], [HaveFullAccess], [HaveNoAccess], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[UserRoleId], source.[ScreenId], ISNULL(source.[CanView], 1), ISNULL(source.[CanEdit], 1), ISNULL(source.[CanDelete], 1), ISNULL(source.[HaveFullAccess], 1), ISNULL(source.[HaveNoAccess], 0), ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [CORE].[SMSGatewayMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [CORE].[SMSGatewayMaster] ON;
GO
MERGE INTO [CORE].[SMSGatewayMaster] AS target
USING (VALUES
    (1, N'Akola Municipal Corporation SMS Gateway', NULL, 1, '2026-08-17T16:57:18.413')
) AS source ([SMSGatewayMasterID], [ProviderName], [IsActive], [CreatedBy], [CreatedDate])
ON (target.[SMSGatewayMasterID] = source.[SMSGatewayMasterID])
WHEN MATCHED THEN
    UPDATE SET
        target.[ProviderName] = source.[ProviderName],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSGatewayMasterID], [ProviderName], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (source.[SMSGatewayMasterID], source.[ProviderName], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate]);
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
        target.[IsURL] = ISNULL(source.[IsURL], 0),
        target.[IsMessage] = ISNULL(source.[IsMessage], 0),
        target.[IsMobile] = ISNULL(source.[IsMobile], 0),
        target.[IsTemplateID] = ISNULL(source.[IsTemplateID], 0),
        target.[IsUnicode] = ISNULL(source.[IsUnicode], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSGatewayDetailsID], [SMSGatewayMasterID], [PropertyName], [Value], [SequenceNo], [IsURL], [IsMessage], [IsMobile], [IsTemplateID], [IsUnicode], [IsActive], [CreatedBy], [CreatedDate])
    VALUES (source.[SMSGatewayDetailsID], source.[SMSGatewayMasterID], source.[PropertyName], source.[Value], source.[SequenceNo], ISNULL(source.[IsURL], 0), ISNULL(source.[IsMessage], 0), ISNULL(source.[IsMobile], 0), ISNULL(source.[IsTemplateID], 0), ISNULL(source.[IsUnicode], 0), ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate]);
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
    (1, N'OTP', N'One Time Password for citizen login/verification', NULL),
    (2, N'Change Password', N'Notification for password updates', NULL),
    (3, N'Online Fee Paid', N'Receipt notification for online fee payments', NULL),
    (4, N'RTS Application Submitted', N'Notification sent when RTS application is submitted', NULL),
    (5, N'RTS Payment Pending', N'Notification requesting citizen to pay application fee', NULL),
    (6, N'RTS Application Approved', N'Notification when RTS service is approved and ready', NULL),
    (7, N'RTS Application Rejected', N'Notification when RTS application is rejected', NULL),
    (8, N'RTS Application Status Update', N'Unified status update notification for all RTS workflow steps', NULL)
) AS source ([SMSTypeID], [TypeName], [Description], [IsActive])
ON (target.[SMSTypeID] = source.[SMSTypeID])
WHEN MATCHED THEN
    UPDATE SET
        target.[TypeName] = source.[TypeName],
        target.[Description] = source.[Description],
        target.[IsActive] = ISNULL(source.[IsActive], 1)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SMSTypeID], [TypeName], [Description], [IsActive])
    VALUES (source.[SMSTypeID], source.[TypeName], source.[Description], ISNULL(source.[IsActive], 1));
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
    (9, 1, 3, N'RTS_FEE_PAID', N'1777178721313405133', N'Dear {CitizenName}, Payment of Rs.{Amount} for RTS Application No: {ApplicationNo} is successful. Receipt No: {ReceiptNo}. Download Receipt: https://citizen.scipl.info.in/service?receipt={ReceiptNo} Akola Municipal Corporation', NULL, 1, '2026-08-17T16:57:18.437', NULL, '2026-08-20T13:26:49.787'),
    (11, 1, 1, N'RTS_CITIZEN_LOGIN_OTP', N'1777178721904398497', N'Your RTS Citizen Portal login OTP is {Otp}. Please do not share this OTP with anyone. Akola Municipal Corporation', NULL, 1, '2026-08-18T17:46:57.223', NULL, '2026-08-20T13:26:49.783'),
    (12, 1, 8, N'RTS_APP_STATUS_UPDATE', N'1777178721329285369', N'Dear {CitizenName}, Your RTS Application No: {ApplicationNo} for {ServiceName} is Currently {Status} Track Status: https://citizen.scipl.info.in/service?track={ApplicationNo} Akola Municipal Corporation', NULL, 1, '2026-08-18T17:46:57.223', NULL, '2026-08-20T13:26:49.783'),
    (1011, 1, 1, N'RTS_SUBMITTED', N'1207161987654321001', N'प्रिय {CitizenName}, तुमचा आरटीएस अर्ज क्र. {ApplicationNo} ({ServiceName}) अकोला महानगरपालिकेकडे प्राप्त झाला आहे. ट्रॅकिंग लिंक: https://citizen.scipl.info.in/service?track={ApplicationNo} - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1012, 1, 8, N'RTS_STAGE_FORWARDED', N'1207161987654321002', N'प्रिय {CitizenName}, तुमचा अर्ज क्र. {ApplicationNo} पुढील टप्प्यावर पडताळणीसाठी पाठवला आहे. - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1013, 1, 3, N'RTS_PAYMENT_REQUEST', N'1207161987654321003', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) साठी शुल्क भरणे आवश्यक आहे. भरण्यासाठी लिंक: https://citizen.scipl.info.in/service?pay={ApplicationNo} - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1014, 1, 3, N'RTS_PAYMENT_SUCCESS', N'1207161987654321004', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} साठी रु. {Amount}/- चे शुल्क यशस्वीरीत्या प्राप्त झाले. पावती क्र.: {ReceiptNo}. - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1015, 1, 8, N'RTS_APPROVED', N'1207161987654321005', N'अभिनंदन {CitizenName}! तुमचा अर्ज क्र. {ApplicationNo} ({ServiceName}) मंजूर करण्यात आला आहे. आपले अधिकृत प्रमाणपत्र डाउनलोड करा: https://citizen.scipl.info.in/service?cert={ApplicationNo} - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1016, 1, 8, N'RTS_REJECTED', N'1207161987654321006', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} ({ServiceName}) नामंजूर केला आहे. आपण ३० दिवसांत प्रथम अपील करू शकता: https://citizen.scipl.info.in/service?appeal={ApplicationNo} - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1017, 1, 8, N'RTS_RETURNED', N'1207161987654321007', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} मधील त्रुटींच्या पूर्ततेसाठी अर्ज परत पाठवला आहे. दुरुस्तीसाठी लिंक: https://citizen.scipl.info.in/service?edit={ApplicationNo} - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467'),
    (1018, 1, 8, N'RTS_APPEAL_FILED', N'1207161987654321008', N'प्रिय {CitizenName}, अर्ज क्र. {ApplicationNo} वरील आपले अपील नोंदवले गेले आहे. सुनावणीची तारीख लवकरच कळवली जाईल. - अकोला मनपा', NULL, 1, '2026-08-26T16:09:35.657', NULL, '2026-08-28T13:47:17.467')
) AS source ([SmsID], [SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[SmsID] = source.[SmsID])
WHEN MATCHED THEN
    UPDATE SET
        target.[SMSGatewayMasterID] = source.[SMSGatewayMasterID],
        target.[SMSTypeID] = source.[SMSTypeID],
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateID] = source.[TemplateID],
        target.[SmsText] = source.[SmsText],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([SmsID], [SMSGatewayMasterID], [SMSTypeID], [TemplateName], [TemplateID], [SmsText], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[SmsID], source.[SMSGatewayMasterID], source.[SMSTypeID], source.[TemplateName], source.[TemplateID], source.[SmsText], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [CORE].[SMSMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[PaymentModeMaster] (8 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] ON;
GO
MERGE INTO [RTS].[PaymentModeMaster] AS target
USING (VALUES
    (1, N'UPI', N'UPI / QR Code', N'युपीआय / क्यूआर कोड', N'QrCode', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (2, N'NETBANKING', N'Internet Banking', N'नेट बँकिंग', N'Building', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (3, N'CREDIT_CARD', N'Credit Card', N'क्रेडिट कार्ड', N'CreditCard', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (4, N'DEBIT_CARD', N'Debit Card', N'डेबिट कार्ड', N'CreditCard', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (5, N'WALLET', N'Digital Wallet', N'डिजिटल वॉलेट', N'Wallet', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (6, N'OFFLINE_CHALLAN', N'Offline Challan', N'ऑफलाइन चलन', N'FileText', NULL, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (7, N'CASH', N'Cash (???)', N'रोख', N'Banknote', NULL, '2026-08-19T16:55:31.167', NULL, NULL, NULL),
    (8, N'CHEQUE', N'Cheque (??????)', N'धनादेश', N'FileText', NULL, '2026-08-23T19:38:42.020', NULL, NULL, NULL)
) AS source ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ModeCode] = source.[ModeCode],
        target.[ModeNameEn] = source.[ModeNameEn],
        target.[ModeNameMr] = source.[ModeNameMr],
        target.[IconName] = source.[IconName],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ModeCode], source.[ModeNameEn], source.[ModeNameMr], source.[IconName], ISNULL(source.[IsActive], 1), source.[CreatedDate], source.[CreatedBy], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [RTS].[PaymentModeMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[PaymentStatusMaster] (6 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] ON;
GO
MERGE INTO [RTS].[PaymentStatusMaster] AS target
USING (VALUES
    (1, N'INITIATED', N'Initiated', N'सुरू केले', N'bg-amber-50 text-amber-700', 1, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (2, N'PENDING', N'Pending', N'प्रलंबित', N'bg-yellow-50 text-yellow-800', 2, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (3, N'SUCCESS', N'Success', N'यशस्वी', N'bg-emerald-50 text-emerald-700', 3, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (4, N'FAILED', N'Failed', N'अयशस्वी', N'bg-rose-50 text-rose-700', 4, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (5, N'REFUNDED', N'Refunded', N'परतावा केला', N'bg-purple-50 text-purple-700', 5, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (6, N'EXPIRED', N'Expired', N'कालबाह्य', N'bg-slate-50 text-slate-700', 6, NULL, '2026-08-17T15:10:23.983', NULL, NULL, NULL)
) AS source ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[StatusCode] = source.[StatusCode],
        target.[StatusNameEn] = source.[StatusNameEn],
        target.[StatusNameMr] = source.[StatusNameMr],
        target.[BadgeColor] = source.[BadgeColor],
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[StatusCode], source.[StatusNameEn], source.[StatusNameMr], source.[BadgeColor], source.[DisplayOrder], ISNULL(source.[IsActive], 1), source.[CreatedDate], source.[CreatedBy], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[PaymentGatewayConfig] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] ON;
GO
MERGE INTO [RTS].[PaymentGatewayConfig] AS target
USING (VALUES
    (1, N'RAZORPAY', N'Razorpay Smart Gateway', NULL, N'rzp_test_SZLId8MmrfQwTX', N'd1TPunImUMBxcPDStAGUnOdj', N'd1TPunImUMBxcPDStAGUnOdj', N'https://api.razorpay.com/v1/checkout/embedded', N'INR', NULL, NULL, '2026-08-17T15:10:24.000', NULL, NULL, NULL)
) AS source ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[GatewayCode] = source.[GatewayCode],
        target.[GatewayName] = source.[GatewayName],
        target.[MerchantId] = source.[MerchantId],
        target.[KeyId] = source.[KeyId],
        target.[SecretKey] = source.[SecretKey],
        target.[WebhookSecret] = source.[WebhookSecret],
        target.[ServiceUrl] = source.[ServiceUrl],
        target.[Currency] = source.[Currency],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[IsDefault] = ISNULL(source.[IsDefault], 1),
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[UpdatedBy] = source.[UpdatedBy]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
    VALUES (source.[Id], source.[GatewayCode], source.[GatewayName], source.[MerchantId], source.[KeyId], source.[SecretKey], source.[WebhookSecret], source.[ServiceUrl], source.[Currency], ISNULL(source.[IsActive], 1), ISNULL(source.[IsDefault], 1), source.[CreatedDate], source.[CreatedBy], source.[UpdatedDate], source.[UpdatedBy]);
GO

SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[DepartmentMaster] (13 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[DepartmentMaster] ON;
GO
MERGE INTO [RTS].[DepartmentMaster] AS target
USING (VALUES
    (1, N'Property Tax', N'मालमत्ता कर', N'Home', 1, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'PTAX'),
    (2, N'Water Connection', N'पाणी पुरवठा', N'Droplets', 2, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'WATER'),
    (3, N'Trade License', N'व्यवसाय परवाना', N'Briefcase', 3, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'TRADE'),
    (4, N'Town Planning', N'नगर रचना', N'Map', 4, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'TP'),
    (5, N'Birth & Death', N'जन्म आणि मृत्यू', N'HeartPulse', 5, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'BND'),
    (6, N'Education', N'शिक्षण', N'GraduationCap', 6, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'EDU'),
    (7, N'Health', N'आरोग्य', N'Activity', 7, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'HLTH'),
    (8, N'Fire', N'अग्निशमन', N'Flame', 8, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'FIRE'),
    (9, N'Marriage Certificate', N'लग्न नोंदणी प्रमाणपत्र', N'Heart', 9, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'MARR'),
    (10, N'Tree', N'वृक्ष प्राधिकरण', N'TreePine', 10, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'TREE'),
    (11, N'Sanitation', N'स्वच्छता विभाग', N'Trash2', 11, NULL, 0, '2026-07-15T16:26:57.467', NULL, NULL, N'SANI'),
    (12, N'PWD', N'सार्वजनिक बांधकाम विभाग', N'Building', 12, NULL, 0, '2026-08-17T13:30:48.017', NULL, NULL, N'PWD'),
    (13, N'NULM', N'राष्ट्रीय नागरी उपजीविका अभियान (फेरीवाला विभाग)', N'ShoppingBag', 13, NULL, 1, '2026-08-26T12:00:00.000', NULL, NULL, N'NULM')
) AS source ([Id], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentCode])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentName] = source.[DepartmentName],
        target.[DepartmentNameLocal] = source.[DepartmentNameLocal],
        target.[DepartmentIcon] = source.[DepartmentIcon],
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[DepartmentCode] = source.[DepartmentCode]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DepartmentCode])
    VALUES (source.[Id], source.[DepartmentName], source.[DepartmentNameLocal], source.[DepartmentIcon], source.[DisplayOrder], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[DepartmentCode]);
GO

SET IDENTITY_INSERT [RTS].[DepartmentMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[ServiceMaster] (65 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ServiceMaster] ON;
GO
MERGE INTO [RTS].[ServiceMaster] AS target
USING (VALUES
    (19, 2, 7165, N'Change of Water Connection Usage Type', N'वापरामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 39, N'15 Days', 0.00, N'False', NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (20, 2, 7166, N'Preparation of Water Bill', N'पाणी देयक तयार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileText', 40, N'3 Days', 0.00, N'False', NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (26, 2, 7172, N'Complaint Regarding Water Pressure Capacity', N'पाण्याच्या दाब क्षमता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=19&upicid=', N'AlertTriangle', 46, N'3 Days', 0.00, N'False', NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (33, 3, 13, N'Changing Occupations / Business Type', N'व्यवसाय बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 13, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (36, 3, 16, N'Cancellation of License', N'परवाना रद्द करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 16, N'15 Days', 0.00, N'False', NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (43, 4, 3, N'Issuance of Zone Certificate', N'झोन दाखला देणे', NULL, NULL, N'Map', 3, N'7 Days', 500.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, NULL, NULL, NULL),
    (44, 4, 4, N'Giving Part Map', N'भाग नकाशा देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'Map', 4, N'3 Days', 700.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (45, 4, 5, N'Issuance of Construction Permit', N'बांधकाम परवाना देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'HardHat', 5, N'7 Days', 500.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (46, 4, 6, N'Issuance of plinth certificate', N'जोते प्रमाणपत्र देणे', NULL, NULL, N'MapPin', 6, N'7 Days', 200.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, NULL, NULL, NULL),
    (47, 4, 7, N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'Key', 7, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (48, 12, 61, N'Underground OFC Cable Permission', N'भुमिगत दुरसंचार वाहिनी (ऑप्टीकल फायबर केबल) टाकण्याकरीता परवानगी देणे', NULL, N'#', N'Cable', 61, N'60 Days', 120.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (49, 12, 63, N'Filling Potholes on City Roads', N'रस्त्यांवरील खड्डे बुजविणे', NULL, NULL, N'Wrench', 63, N'5 Days', 50.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', NULL, NULL),
    (50, 12, 64, N'Maintaining & Securing Sewer Covers', N'गटारांवरील झाकणे सुस्थितीत ठेवणे', NULL, NULL, N'Shield', 64, N'5 Days', 50.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', NULL, NULL),
    (53, 5, 20, N'Birth Certificate', N'जन्म प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'Baby', 20, N'3 Days', 10.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (54, 5, 21, N'Death Certificate', N'मृत्यु प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'HeartOff', 21, N'3 Days', 10.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (55, 6, 50, N'School Leaving / Duplicate Certificate', N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे', NULL, NULL, N'GraduationCap', 50, N'3 Days', 25.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, NULL, NULL, NULL),
    (56, 6, 51, N'Issuance of transfer certificate', N'स्थलांतर दाखला देणे', NULL, NULL, N'GraduationCap', 51, N'15 Days', 25.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, NULL, NULL, NULL),
    (57, 6, 52, N'Issuance of duplicate mark sheet', N'गुणपत्रिकेची दुय्यम प्रत देणे', NULL, NULL, N'GraduationCap', 52, N'7 Days', 25.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, NULL, NULL, NULL),
    (58, 7, 53, N'Nursing home license', N'शुश्रूषा-गृह परवाना देणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 53, N'30 Days', 3500.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (59, 7, 54, N'Renewal of nursing home license', N'शुश्रूषा-गृह परवान्याचे नुतनीकरण करणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 54, N'30 Days', 3500.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (60, 7, 55, N'Change of nursing home license holder / partner name', N'शुश्रूषा-गृह परवान्यावर परवानाधारक/भागीदाराचे नाव बदलणे', NULL, N'https://maha-mnhregistration.co.in/', N'UserPlus', 55, N'30 Days', 200.00, NULL, NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', N'False', NULL),
    (61, 4, 1, N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'ShieldCheck', 1, N'7 Days', 120.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, NULL, NULL, NULL),
    (62, 4, 2, N'Mandap NOC', N'मंडपासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'Building2', 2, N'7 Days', 200.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, NULL, NULL, NULL),
    (63, 8, 18, N'Issuance of Fire Safety NOC', N'अग्निशमन नाहरकत दाखला देणे', NULL, N'#', N'Flame', 18, N'7 Days', 1000.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (64, 8, 19, N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला देणे', NULL, N'#', N'Flame', 19, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (65, 9, 22, N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र देणे', NULL, N'https://mahaulb.in/MahaULB/index', N'Heart', 22, N'3 Days', 100.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (66, 10, 62, N'Tree Felling Permission', N'वृक्षतोड परवानगी देणे', NULL, NULL, N'TreePine', 62, N'45 Days', 2000.00, NULL, NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, NULL, NULL, NULL),
    (68, 11, 65, N'Maintaining cleanliness', N'शहरात स्वच्छता राखणे', NULL, NULL, N'Trash2', 65, N'1 Days', 0.00, N'False', NULL, 1, '2026-07-20T13:31:33.447', NULL, NULL, N'False', NULL, NULL),
    (69, 2, 7175, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=21&upicid=', N'Droplet', 49, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-15T16:26:57.497', NULL, NULL, N'False', N'False', NULL),
    (80, 2, 7174, N'Provision of New Water Tap Connection', N'नळ जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=6&upicid=', N'Droplets', 48, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (81, 2, 7162, N'Changing the Water Connection Size', N'नळ जोडणी आकारामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 36, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (82, 2, 7163, N'Temporary / Permanent Disconnection of Water Connection', N'तात्पुरते/कायमस्वरूपी नळ जोडणी खंडीत करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=10&upicid=', N'Droplets', 37, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (83, 2, 7164, N'Reconnection of Water Tap', N'पुनः जोडणी करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=14&upicid=', N'Droplets', 38, N'15 Days', 1000.00, NULL, NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (84, 2, 43, N'Water Bill No Dues Certificate', N'थकबाकी नसल्याचा दाखला', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileCheck', 43, N'3 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (85, 2, 7170, N'Complaint Regarding Faulty Water Meter', N'नादुरुस्त मीटर तक्रार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=17&upicid=', N'AlertTriangle', 44, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (86, 2, 7171, N'Complaint Regarding Unauthorized Water Tap Connection', N'अनधिकृत नळ जोडणी तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=18&upicid=', N'AlertTriangle', 45, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (87, 2, 7173, N'Complaint Regarding Water Quality', N'पाण्याची गुणवत्ता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=20&upicid=', N'AlertTriangle', 47, N'3 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (100, 2, 7167, N'Issuance of Plumber License', N'प्लंबर परवाना', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=15&upicid=', N'Wrench', 41, N'15 Days', 1000.00, NULL, NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (101, 2, 7168, N'Renewal of Plumber License', N'प्लंबर परवाना नुतनीकरण करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=16&upicid=', N'Wrench', 42, N'15 Days', 1000.00, NULL, NULL, 0, '2026-07-21T18:44:51.083', NULL, NULL, N'False', N'False', NULL),
    (137, 3, 8, N'Obtaining New Trade License', N'नविन परवाना मिळणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 8, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (138, 3, 9, N'Renewal of Trade License', N'परवान्याचे नुतनीकरण', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 9, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (139, 3, 10, N'Transfer of Trade License', N'परवाना हस्तांतर', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 10, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (140, 3, 11, N'Duplicate Copy of Trade License', N'परवाना दुय्यम प्रत', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 11, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (141, 3, 12, N'Change of Business Name / Establishment / Address', N'व्यवसायाचे नाव बदलणे/प्रतिष्ठानात/पत्यात बदल', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 12, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (142, 3, 14, N'Change of License Holder / Partner Name', N'परवाना धारक/भागीदाराचे नाव बदलणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 14, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (143, 3, 15, N'Change in Number of Partners (Increase/Decrease)', N'भागीदाराच्या संख्येत बदल (वाढ/कमी)', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 15, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (144, 3, 17, N'Notice on Renewal of Expired License', N'कालबाह्य परवानासाठी नुतनीकरण सुचना', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 17, N'15 Days', 200.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (145, 1, 7176, N'New Property Tax Assessment', N'नव्याने कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/selfAssessment/index', N'Home', 23, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (146, 1, 7177, N'Re-Assessment of Property Tax', N'पुनः कर आकारणी', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/21?upicNo=', N'Home', 24, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (147, 1, 7178, N'Preparation of Tax Demand Notice', N'कराचे मागणी पत्र तयार करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 25, N'3 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (148, 1, 7179, N'Avail Property Tax Exemption', N'कर माफी मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/9?upicNo=', N'Receipt', 26, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (149, 1, 7180, N'Tax Exemption for Non-Resident Properties', N'रहिवास नसल्यास मालमत्तांना करात सुट मिळणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/20?upicNo=', N'Receipt', 27, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (150, 1, 7181, N'Property Tax Self-Assessment', N'स्वयंमुल्यांकन', NULL, N'https://onesolutionakola.tabamc.in/selfAssessment/index', N'Calculator', 28, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (151, 1, 7182, N'Registration of Objection on Tax Assessment', N'आक्षेप नोंदविणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/19?upicNo=', N'AlertTriangle', 29, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (152, 1, 7183, N'Sub-division of Property', N'उपविभागामध्ये मालमत्ता विभाजन', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/PropertySplit?upicNo=', N'GitFork', 30, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (153, 1, 7184, N'Re-assessment After Demolition and Reconstruction', N'मालमत्ता पाडणे व पुनःबांधणी कर आकारणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication/ChangeInUse?upicNo=', N'Hammer', 31, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (154, 1, 7185, N'Issuance of Property Tax Assessment Copy (8A)', N'मालमत्ता कर उतारा देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 32, N'3 Days', 25.00, NULL, NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (155, 1, 7186, N'Issuance of No Dues Certificate', N'थकबाकी नसल्याचा दाखला देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileCheck', 33, N'3 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (156, 1, 7187, N'Property Transfer Registration Certificate', N'अ) दस्ताऐवजाच्या आधारे मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे ब) वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/MutationView?upicNo=', N'UserCheck', 34, N'15 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (157, 1, 7189, N'Change of Ownership Name', N'मालकी हक्कात बदल करणे', NULL, N'https://onesolutionakola.tabamc.in/Citizens/MutationView?upicNo=', N'UserPlus', 35, N'7 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443', N'False', N'False', NULL),
    (158, 3, 56, N'Issuance of Lodging House License', N'लॉजिंग हाऊस परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 56, N'30 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (159, 3, 57, N'Renewal of Lodging House License', N'लॉजिंग हाऊस परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 57, N'30 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (160, 3, 58, N'Issuance of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 58, N'30 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (161, 3, 59, N'Renewal of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 59, N'30 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, N'False', N'False', NULL),
    (162, 13, 60, N'Issuance of Hawker Registration Certificate', N'फेरीवाले नोंदणी प्रमाणपत्र देणे', NULL, NULL, N'Store', 60, N'30 Days', 0.00, N'False', NULL, 0, '2026-07-21T18:57:16.223', NULL, NULL, NULL, NULL, NULL)
) AS source ([Id], [DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsCertificateRequired], [IsSmsEnabled], [ServiceCode])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[GovtServiceCode] = source.[GovtServiceCode],
        target.[ServiceName] = source.[ServiceName],
        target.[ServiceNameLocal] = source.[ServiceNameLocal],
        target.[Description] = source.[Description],
        target.[ServiceUrl] = source.[ServiceUrl],
        target.[ServiceIcon] = source.[ServiceIcon],
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[Sla] = source.[Sla],
        target.[Fees] = source.[Fees],
        target.[FeesRequired] = ISNULL(source.[FeesRequired], 0),
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[IsCertificateRequired] = ISNULL(source.[IsCertificateRequired], 1),
        target.[IsSmsEnabled] = ISNULL(source.[IsSmsEnabled], 1),
        target.[ServiceCode] = source.[ServiceCode]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsCertificateRequired], [IsSmsEnabled], [ServiceCode])
    VALUES (source.[Id], source.[DepartmentId], source.[GovtServiceCode], source.[ServiceName], source.[ServiceNameLocal], source.[Description], source.[ServiceUrl], source.[ServiceIcon], source.[DisplayOrder], source.[Sla], source.[Fees], ISNULL(source.[FeesRequired], 0), ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], ISNULL(source.[IsCertificateRequired], 1), ISNULL(source.[IsSmsEnabled], 1), source.[ServiceCode]);
GO

SET IDENTITY_INSERT [RTS].[ServiceMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[FieldDefinition] (834 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[FieldDefinition] ON;
GO
MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (1, 4, 61, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (2, 4, 61, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (3, 4, 61, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (4, 4, 61, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (5, 4, 61, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (6, 4, 61, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (7, 4, 61, N'ownerFirstName', N'Owner First Name', N'मालकाचे पहिले नाव', N'text', N'Owner Details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (8, 4, 61, N'ownerMiddleName', N'Owner Middle Name', N'मालकाचे मधले नाव', N'text', N'Owner Details', NULL, NULL, NULL, N'False', 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (9, 4, 61, N'ownerLastName', N'Owner Last Name', N'मालकाचे आडनाव', N'text', N'Owner Details', NULL, NULL, NULL, N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (10, 4, 61, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, NULL, 10, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (11, 4, 61, N'ownerEmail', N'Owner Email', N'मालकाचा ई-मेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (12, 4, 61, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 12, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (13, 4, 61, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', N'False', 13, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (14, 4, 61, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (15, 4, 61, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (16, 4, 61, N'businessName', N'Business / Trade Name', N'व्यवसाय / व्यापाराचे नाव', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (17, 4, 61, N'workers', N'Number of Employees', N'कर्मचाऱ्यांची संख्या', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (18, 4, 61, N'propertyTaxNo', N'Property Tax Assessment Number', N'मालमत्ता कर आकारणी उतारा क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (19, 4, 61, N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'मालमत्ता कर पावती क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (20, 4, 61, N'businessAddress', N'Business Address', N'पत्ता', N'textarea', N'Business Activity & Licensing Details', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (21, 4, 61, N'activityType', N'Type of Activity', N'व्यवसायाचा प्रकार', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (22, 4, 61, N'licenseCategory', N'Licensing Category', N'परवाना वर्ग', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (23, 4, 61, N'specialCategory', N'Specify License Category (if Special)', N'परवाना श्रेणी नमूद करा (विशेष असल्यास)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (24, 4, 61, N'newBusinessProposal', N'New Business Proposal?', N'नवीन व्यवसाय परवाना प्रस्ताव?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (25, 4, 61, N'workingHours', N'Working Hours', N'कामाच्या वेळा', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (26, 4, 61, N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, N'False', 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (27, 4, 61, N'natureOfGoods', N'Nature of Goods Stored / Traded', N'साठवलेल्या मालाचे प्रकार', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (28, 4, 61, N'flammableGoods', N'Flammable/Explosive Goods?', N'ज्वलनशील / स्फोटक माल आहे का?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (29, 4, 61, N'flammableGoodsDetail', N'Flammable Material Details', N'ज्वलनशील मालाचे तपशील', N'text', N'Storage, Safety & Hazard Details', NULL, NULL, NULL, N'False', 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (30, 9, 65, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (31, 9, 65, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (32, 9, 65, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (33, 9, 65, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (34, 9, 65, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (35, 9, 65, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (36, 9, 65, N'groomFirstName', N'Groom First Name', N'वराचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (37, 9, 65, N'groomMiddleName', N'Groom Middle Name', N'वराचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, N'False', 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (38, 9, 65, N'groomLastName', N'Groom Last Name', N'वराचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (39, 9, 65, N'groomAge', N'Age', N'वय', N'number', N'Bridegroom Details', NULL, NULL, N'{"min":21,"max":100}', NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (40, 9, 65, N'groomDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bridegroom Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (41, 9, 65, N'groomAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bridegroom Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 12, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (42, 9, 65, N'groomFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (43, 9, 65, N'groomFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, N'False', 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (44, 9, 65, N'groomFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (45, 9, 65, N'groomMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (46, 9, 65, N'groomMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, N'False', 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (47, 9, 65, N'groomMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (48, 9, 65, N'groomparentCity', N'groomParent City', N'वराच्या पालकांचे शहर', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (49, 9, 65, N'groomparentState', N'groomParent State', N'वराच्या पालकांचे राज्य', N'text', N'Bridegroom Details', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (50, 9, 65, N'groomOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bridegroom Details', NULL, NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (51, 9, 65, N'groomReligion', N'Religion', N'धर्म', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (52, 9, 65, N'brideFirstName', N'Bride First Name', N'वधूचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (53, 9, 65, N'brideMiddleName', N'Bride Middle Name', N'वधूचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, N'False', 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (54, 9, 65, N'brideLastName', N'Bride Last Name', N'वधूचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (55, 9, 65, N'brideAge', N'Age', N'वय', N'number', N'Bride Details', NULL, NULL, N'{"min":18,"max":100}', NULL, 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (56, 9, 65, N'brideDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bride Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (57, 9, 65, N'brideAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bride Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 28, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (58, 9, 65, N'brideFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (59, 9, 65, N'brideFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, N'False', 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (60, 9, 65, N'brideFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (61, 9, 65, N'brideMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (62, 9, 65, N'brideMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, N'False', 33, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (63, 9, 65, N'brideMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (64, 9, 65, N'brideparentCity', N'brideParent City', N'वधूच्या पालकांचे शहर', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (65, 9, 65, N'brideparentState', N'brideParent State', N'वधूच्या पालकांचे राज्य', N'text', N'Bride Details', NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (66, 9, 65, N'brideOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bride Details', NULL, NULL, NULL, N'False', 37, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (67, 9, 65, N'brideReligion', N'Religion', N'धर्म', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (68, 9, 65, N'marriageDate', N'Date of Marriage', N'लग्न तारीख', N'date', N'Marriage Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 39, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (69, 9, 65, N'marriagePlace', N'Place of Marriage', N'लग्न ठिकाण', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (70, 9, 65, N'marriageCity', N'marriage City', N'विवाहाचे शहर', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (71, 9, 65, N'marriageState', N'marriage State', N'विवाहाचे राज्य', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (72, 9, 65, N'witness1FirstName', N'Witness 1 First Name', N'साक्षीदार १ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (73, 9, 65, N'witness1MiddleName', N'Witness 1 Middle Name', N'साक्षीदार १ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, N'False', 44, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (74, 9, 65, N'witness1LastName', N'Witness 1 Last Name', N'साक्षीदार १ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (75, 9, 65, N'witness2FirstName', N'Witness 2 First Name', N'साक्षीदार २ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (76, 9, 65, N'witness2MiddleName', N'Witness 2 Middle Name', N'साक्षीदार २ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, N'False', 47, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (77, 9, 65, N'witness2LastName', N'Witness 2 Last Name', N'साक्षीदार २ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (78, 9, 65, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (79, 11, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (80, 11, 69, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (81, 11, 69, N'email', N'Email (optional)', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (82, 11, 69, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (83, 11, 69, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (84, 11, 69, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (85, 11, 69, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property / Location Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
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
]', NULL, NULL, N'False', 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (87, 11, 69, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, N'False', 9, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (88, 11, 69, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Property / Location Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (89, 11, 69, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Property / Location Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (90, 11, 69, N'premisesOccupancyType', N'Premises Type', N'जागेचा प्रकार', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (91, 11, 69, N'connectionType', N'Connection Type', N'जोडणीचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (92, 11, 69, N'useType', N'Use Type', N'वापराचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (93, 11, 69, N'noOfUnits', N'No. of Units (optional)', N'युनिट्सची संख्या (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', N'False', 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (94, 11, 69, N'existingArrangement', N'Current Wastewater Arrangement', N'सांडपाण्याची सध्याची व्यवस्था', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (95, 11, 69, N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', N'False', 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (96, 11, 69, N'roadCuttingRequired', N'Road Cutting Required?', N'रस्ता खोदाई आवश्यक आहे का?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (97, 11, 69, N'roadCuttingDetails', N'Road Cutting Details (optional)', N'रस्ता खोदाईचे तपशील (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, N'False', 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (98, 11, 69, N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', N'False', 20, NULL, NULL, 50, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (99, 11, 69, N'tradeLicenseNo', N'Trade License No (optional)', N'व्यवसाय परवाना क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, N'False', 21, NULL, NULL, 50, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (100, 11, 69, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (101, 4, 61, N'fireNocUpdated', N'Fire NOC Up-to-date?', N'अग्निशामक परवाना अद्ययावत आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (102, 4, 61, N'policeNocSubmitted', N'Police NOC Submitted?', N'पोलीस परवाना सादर केला आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (103, 4, 61, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (158, 4, 62, N'trafficPoliceStation', N'Concerned Traffic Police Station', N'संबंधित वाहतूक पोलीस स्टेशन', N'select', N'Applicant Undertaking & Compliance', N'[
  {
    "value": "Akola City Traffic Police Branch",
    "label": {
      "en": "Akola City Traffic Police Branch",
      "hi": "????? ??? ??????? ????? ????",
      "mr": "????? ??? ?????? ????? ????"
    }
  }
]', NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (163, 8, 63, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (164, 8, 63, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (165, 8, 63, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (166, 8, 63, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (167, 8, 63, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (168, 8, 63, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:05:28.417'),
    (169, 8, 63, N'ownerName', N'Name of Owner', N'मालकाचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (170, 8, 63, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, NULL, 8, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (171, 8, 63, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:05:28.417'),
    (172, 8, 63, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (173, 8, 63, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (174, 8, 63, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:12:38.640'),
    (175, 8, 63, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
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
    ]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:18:27.640'),
    (177, 8, 63, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (178, 8, 63, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (179, 8, 63, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (180, 8, 63, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (181, 8, 63, N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'प्रस्तावित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (182, 8, 63, N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'प्रस्तावित आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (183, 8, 63, N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'प्रस्तावित एकत्रीकरण / मस्टर पॉईंट तपशील', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:27:43.313'),
    (184, 8, 63, N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'अत्यंत ज्वलनशील साहित्य साठविण्यात येणार आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (185, 8, 63, N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (186, 8, 63, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (187, 8, 63, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (188, 8, 64, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (189, 8, 64, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (190, 8, 64, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (191, 8, 64, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (192, 8, 64, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (193, 8, 64, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (194, 8, 64, N'ownerName', N'Name of Owner', NULL, N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (195, 8, 64, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, NULL, 8, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (196, 8, 64, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (197, 8, 64, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (198, 8, 64, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (199, 8, 64, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:12:38.640'),
    (200, 8, 64, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (201, 5, 53, N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'जन्मतारीख (दि-महा-वर्ष)', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (202, 5, 53, N'gender', N'Sex', N'लिंग', N'select', N'Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (203, 5, 53, N'childFirstName', N'Child First Name', N'बालकाचे पहिले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (204, 5, 53, N'childMiddleName', N'Child Middle Name', N'बालकाचे मधले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (205, 5, 53, N'childLastName', N'Child Last Name', N'बालकाचे आडनाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (206, 5, 53, N'childAadhaar', N'Aadhaar No. (Optional)', N'बालकाचा आधार क्रमांक (ऐच्छिक)', N'text', N'Child, Birth & Registrar Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', N'False', 12, NULL, NULL, 14, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (207, 5, 53, N'placeOfBirthType', N'Place of Birth Type', N'जन्मस्थळाचा प्रकार', N'select', N'Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (208, 5, 53, N'hospitalName', N'Hospital / Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (209, 5, 53, N'birthPlaceAddress', N'Complete Birth Address', N'संपूर्ण जन्मस्थळाचा पत्ता', N'textarea', N'Child, Birth & Registrar Details', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (210, 5, 53, N'birthPlaceSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (211, 5, 53, N'birthPlaceDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (212, 5, 53, N'birthPlaceState', N'State / UT', N'राज्य / केंद्रशासित प्रदेश', N'Select', N'Child, Birth & Registrar Details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T17:39:22.510'),
    (213, 5, 53, N'birthPlacePinCode', N'PIN Code', N'पिन कोड', N'number', N'Child, Birth & Registrar Details', NULL, NULL, N'{"min":0}', NULL, 19, NULL, NULL, 6, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (214, 5, 53, N'_registrar_header', N'Registrar Details', NULL, N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (215, 5, 53, N'registrationNo', N'Registration No.', N'नोंदणी क्रमांक', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (216, 5, 53, N'registrationDate', N'Registration Date', N'नोंदणी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', N'False', 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (217, 5, 53, N'registrationUnit', N'Registration Unit', N'नोंदणी युनिट', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (218, 5, 53, N'registrarTownVillage', N'Town / Village', N'शहर / गाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (219, 5, 53, N'registrarDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (220, 5, 53, N'registrarSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (221, 5, 53, N'registrarName', N'Registrar Name', N'निबंधकाचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (222, 5, 53, N'registrarSignatureDate', N'Registrar Signature Date', N'निबंधक स्वाक्षरी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', N'False', 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (223, 5, 53, N'registrarRemarks', N'Remarks', N'शेरा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, N'False', 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (224, 5, 53, N'permanentHouseNo', N'House No.', N'कायमचा घर क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (225, 5, 53, N'permanentLocality', N'Locality', N'कायमचा परिसर / वस्ती', N'text', N'Address Information', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (226, 5, 53, N'permanentWard', N'Ward No.', N'कायमचा प्रभाग क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, N'False', 32, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (227, 5, 53, N'permanentTownVillage', N'Town / Village', N'कायमचे शहर / गाव', N'text', N'Address Information', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (228, 5, 53, N'permanentSubDistrict', N'Sub-district', N'कायमचा उपजिल्हा', N'text', N'Address Information', NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (229, 5, 53, N'permanentDistrict', N'District', N'कायमचा जिल्हा', N'text', N'Address Information', NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (230, 5, 53, N'permanentState', N'State / UT', N'कायमचे राज्य / केंद्रशासित प्रदेश', N'Select', N'Address Information', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T17:39:22.510'),
    (231, 5, 53, N'permanentPinCode', N'PIN Code', N'कायमचा पिन कोड', N'text', N'Address Information', NULL, NULL, NULL, NULL, 37, NULL, NULL, 6, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (232, 5, 53, N'permanentAddressProofType', N'Permanent Address Proof Type', N'कायमच्या पत्त्याच्या पुराव्याचा प्रकार', N'select', N'Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (233, 5, 53, N'addressProofLast4Digits', N'Last 4 Digits', N'पत्ता पुराव्याचे शेवटचे 4 अंक', N'text', N'Address Information', NULL, NULL, NULL, NULL, 39, NULL, NULL, 4, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (234, 5, 53, N'motherFirstName', N'Mother First Name', N'आईचे पहिले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (235, 5, 53, N'motherMiddleName', N'Mother Middle Name', N'आईचे मधले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, N'False', 41, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (236, 5, 53, N'motherLastName', N'Mother Last Name', N'आईचे आडनाव', N'text', N'Mother''s Information', NULL, NULL, NULL, N'False', 42, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (237, 5, 53, N'motherAadhaar', N'Mother Aadhaar No.', N'आईचा आधार क्रमांक', N'text', N'Mother''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', N'False', 43, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T18:01:18.293'),
    (238, 5, 53, N'motherMobile', N'Mother Mobile No.', N'आईचा मोबाईल क्रमांक', N'tel', N'Mother''s Information', NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (239, 5, 53, N'motherEmail', N'Mother Email ID', N'आईचा ई-मेल आयडी', N'email', N'Mother''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 45, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (240, 5, 53, N'motherAgeAtMarriage', N'Age at First Marriage', N'पहिल्या विवाहावेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', NULL, 46, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (241, 5, 53, N'motherAgeAtBirth', N'Age at This Birth', N'या प्रसूतीवेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', NULL, 47, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (242, 5, 53, N'childrenBornAlive', N'Children Born Alive', N'जिवंत जन्मलेल्या बालकांची संख्या', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', NULL, 48, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (243, 5, 53, N'fatherFirstName', N'Father First Name', N'वडिलांचे पहिले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (244, 5, 53, N'fatherMiddleName', N'Father Middle Name', N'वडिलांचे मधले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, N'False', 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (245, 5, 53, N'fatherLastName', N'Father Last Name', N'वडिलांचे आडनाव', N'text', N'Father''s Information', NULL, NULL, NULL, N'False', 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (246, 5, 53, N'fatherAadhaar', N'Father Aadhaar No.', N'वडिलांचा आधार क्रमांक', N'text', N'Father''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', N'False', 52, NULL, NULL, 12, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T18:25:46.050'),
    (247, 5, 53, N'fatherMobile', N'Father Mobile No.', N'वडिलांचा मोबाईल क्रमांक', N'tel', N'Father''s Information', NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (248, 5, 53, N'fatherEmail', N'Father Email ID', N'वडिलांचा ई-मेल आयडी', N'email', N'Father''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 54, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (249, 5, 53, N'informantFirstName', N'Informant First Name', N'माहिती देणाऱ्याचे पहिले नाव', N'text', N'Informant Details', NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (250, 5, 53, N'informantMiddleName', N'Informant Middle Name', N'माहिती देणाऱ्याचे मधले नाव', N'text', N'Informant Details', NULL, NULL, NULL, N'False', 56, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (251, 5, 53, N'informantLastName', N'Informant Last Name', N'माहिती देणाऱ्याचे आडनाव', N'text', N'Informant Details', NULL, NULL, NULL, N'False', 57, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (252, 5, 53, N'informantMobile', N'Informant Mobile', N'माहिती देणाऱ्याचा मोबाईल क्रमांक', N'tel', N'Informant Details', NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (253, 5, 53, N'informantAddress', N'Informant Address', N'माहिती देणाऱ्याचा पत्ता', N'textarea', N'Informant Details', NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (254, 5, 53, N'declarationAccuracy', N'I confirm info is accurate', N'मी पुष्टी करतो / करते की दिलेली माहिती अचूक आहे', N'select', N'Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (255, 5, 53, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (256, 5, 54, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (257, 5, 54, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (258, 5, 54, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (259, 5, 54, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (260, 5, 54, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (261, 5, 54, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (262, 5, 54, N'deceasedFirstName', N'Deceased First Name', N'मृत व्यक्तीचे पहिले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (263, 5, 54, N'deceasedMiddleName', N'Deceased Middle Name', N'मृत व्यक्तीचे मधले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, N'False', 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (264, 5, 54, N'deceasedLastName', N'Deceased Last Name', N'मृत व्यक्तीचे आडनाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (265, 5, 54, N'dateOfDeath', N'Date of Death', N'मृत्यूची तारीख', N'date', N'Deceased Person Information', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (266, 5, 54, N'timeOfDeath', N'Time of Death', N'मृत्यूची वेळ', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (267, 5, 54, N'age', N'Age at Death', N'मृत्यूसमयी वय', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (268, 5, 54, N'gender', N'Gender', N'लिंग', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (269, 5, 54, N'deathType', N'Type of Death', N'मृत्यूचा प्रकार', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (270, 5, 54, N'deathNature', N'Nature of Death (If Accidental)', N'मृत्यूचे स्वरूप (अपघाती असल्यास)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, N'False', 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (271, 5, 54, N'incidentPlaceHouseNo', N'Incident House No.', N'घटनास्थळाचा घर क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (272, 5, 54, N'incidentPlaceLocality', N'Incident Locality/Area', N'घटनास्थळाचा परिसर / क्षेत्र', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (273, 5, 54, N'incidentPlaceTown', N'Town/City', N'घटनास्थळाचे शहर / गाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (274, 5, 54, N'incidentPlaceDistrict', N'District', N'घटनास्थळाचा जिल्हा', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (275, 5, 54, N'incidentPlaceState', N'State', N'घटनास्थळाचे राज्य', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (276, 5, 54, N'incidentPlacePinCode', N'PIN Code', N'घटनास्थळाचा पिन कोड', N'number', N'Death Circumstance Details', NULL, NULL, N'{"min":0}', N'False', 21, NULL, NULL, 6, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
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
    ]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T19:18:27.640'),
    (278, 8, 64, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (279, 8, 64, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (280, 8, 64, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (281, 8, 64, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (282, 8, 64, N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'स्थापित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (283, 8, 64, N'extinguisherType', N'Type of Extinguishers', N'अग्निशामक यंत्रांचा प्रकार', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (284, 8, 64, N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'प्रति 100 चौ. फूट अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (285, 8, 64, N'lastRefillDate', N'Last Refill/Service Date', N'शेवटची रिफिल / सर्व्हिस तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (286, 8, 64, N'nextRefillDueDate', N'Next Service Due Date', N'पुढील सर्व्हिसची नियोजित तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (287, 8, 64, N'installerAgency', N'Installer/Service Agency Name', N'इंस्टॉलर / सेवा संस्थेचे नाव', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T19:41:05.413'),
    (288, 8, 64, N'serviceAgencyLicenseNo', N'Service Agency License No.', N'सेवा संस्थेचा परवाना क्रमांक', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (289, 8, 64, N'emergencyExitCount', N'No. of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', NULL, 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (290, 8, 64, N'exitSignage', N'Exit Direction Signage Installed', N'बाहेर पडण्याचे दिशादर्शक फलक बसवले आहेत का?', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (291, 8, 64, N'routeMarking', N'Evacuation Route Marked', N'बाहेर पडण्याचा मार्ग चिन्हांकित केला आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (292, 8, 64, N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'स्वतंत्र अग्निसुरक्षा जिना उपलब्ध आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (293, 8, 64, N'musterPoint', N'Assembly / Muster Point Details', N'एकत्रीकरण / मस्टर पॉईंट तपशील', N'textarea', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', N'False', 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (294, 8, 64, N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'फायर अलार्म प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (295, 8, 64, N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'हायड्रंट / स्प्रिंकलर प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 32, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (296, 8, 64, N'earthingCertified', N'Earthing System Certified?', N'अर्थिंग प्रणाली प्रमाणित आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 33, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (297, 8, 64, N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'अत्यंत ज्वलनशील साहित्य साठवले आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (298, 8, 64, N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, N'False', 35, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (299, 8, 64, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (300, 8, 64, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (301, 4, 43, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (302, 4, 43, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (303, 4, 43, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (304, 4, 43, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (305, 4, 43, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (306, 4, 43, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (307, 4, 43, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (309, 4, 43, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 9, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (310, 4, 43, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (311, 4, 43, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (312, 4, 43, N'purpose', N'Purpose', N'उद्देश', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, N'False', 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (313, 4, 43, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (314, 4, 43, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (315, 4, 44, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (316, 4, 44, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (317, 4, 44, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (318, 4, 44, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (319, 4, 44, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (320, 4, 44, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (321, 4, 44, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (323, 4, 44, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 9, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (324, 4, 44, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (325, 4, 44, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (326, 4, 44, N'purpose', N'Purpose', N'उद्देश', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, N'False', 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (327, 4, 44, N'partMapType', N'Part Map Type', N'भाग नकाशाचा प्रकार', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (328, 4, 44, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (329, 4, 44, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (330, 4, 45, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (331, 4, 45, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (332, 4, 45, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (333, 4, 45, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (334, 4, 45, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (335, 4, 45, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (336, 4, 45, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', N'False', 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (338, 4, 45, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 9, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (339, 4, 45, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (340, 4, 45, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (341, 4, 45, N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'प्लॉटचे क्षेत्रफळ (चौ. मी.)', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', N'False', 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (342, 4, 45, N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'सीटीएस / सर्व्हे क्रमांक', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', N'False', 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (343, 4, 45, N'typeOfWork', N'Type of Work', N'कामाचा प्रकार', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (344, 4, 45, N'buildingUse', N'Building Use', N'इमारतीचा वापर', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (345, 4, 45, N'proposedFloors', N'Total Floors (Proposed)', N'प्रस्तावित एकूण मजले', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (346, 4, 45, N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'प्रस्तावित एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (347, 4, 45, N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'तळघर / स्टिल्ट पार्किंग आहे का?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (348, 4, 45, N'buildingHeightM', N'Building Height (m) (if known)', N'इमारतीची उंची (मी.) (माहित असल्यास)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', N'False', 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (349, 4, 45, N'briefWorkDescription', N'Brief Description (optional)', N'कामाचे संक्षिप्त वर्णन (ऐच्छिक)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', N'False', 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (350, 4, 45, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (351, 4, 45, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, N'False', 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (352, 4, 45, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (353, 4, 45, N'architectMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, NULL, 24, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (354, 4, 45, N'architectEmail', N'Email (optional)', N'ईमेल', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (355, 4, 45, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (356, 4, 47, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (357, 4, 47, N'mobileNo', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (358, 4, 47, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (359, 4, 47, N'applicantAddress', N'Residential Address', N'निवासी पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (360, 4, 47, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (361, 4, 47, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (362, 4, 47, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, N'False', 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (363, 4, 47, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (365, 4, 47, N'zoneId', N'Zone', N'झोन', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 10, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (366, 4, 47, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (367, 4, 47, N'fetchedPropertyAddress', N'Property Address (Auto)', N'मालमत्तेचा पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, N'False', 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (368, 4, 47, N'ocType', N'OC Type', N'भोगवटा प्रमाणपत्राचा प्रकार', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (369, 4, 47, N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'बांधकाम परवानगी / सीसी संदर्भ क्रमांक', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', NULL, 14, NULL, NULL, 50, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (370, 4, 47, N'completionDate', N'Completion Date', N'पूर्णत्वाची तारीख', N'date', N'OC Request Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (371, 4, 47, N'totalFloorsConstructed', N'Total Floors Constructed', N'बांधलेल्या एकूण मजल्यांची संख्या', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (372, 4, 47, N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (373, 4, 47, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'OC Request Details', NULL, NULL, NULL, N'False', 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (374, 4, 47, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, N'False', 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (375, 4, 47, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, N'False', 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (376, 4, 47, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (377, 5, 54, N'policeStation', N'Police Station Name', N'पोलीस स्टेशनचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (378, 5, 54, N'firCaseNumber', N'FIR / Case Number', N'एफआयआर / प्रकरण क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (379, 5, 54, N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'प्रथम वैद्यकीय उपचार केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (380, 5, 54, N'firstTreatmentAddress', N'First Treatment Hospital Address', N'प्रथम उपचार रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (381, 5, 54, N'deathDeclaredHospital', N'Death Declared Hospital Name', N'मृत्यू घोषित केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (382, 5, 54, N'deathDeclaredAddress', N'Death Declared Hospital Address', N'मृत्यू घोषित केलेल्या रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, N'False', 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (383, 5, 54, N'placeOfDeathType', N'Place of Death', N'मृत्यूस्थळाचा प्रकार', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (384, 5, 54, N'hospitalName', N'Hospital/Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Place of Death', NULL, NULL, NULL, N'False', 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (385, 5, 54, N'deathAddress', N'Complete Death Address', N'मृत्यूस्थळाचा संपूर्ण पत्ता', N'textarea', N'Place of Death', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (386, 5, 54, N'deathPinCode', N'PIN Code', N'पिन कोड', N'number', N'Place of Death', NULL, NULL, N'{"min":0}', N'False', 31, NULL, NULL, 6, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (387, 5, 54, N'deactivateAadhaar', N'Aadhaar Deactivation', N'आधार निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (388, 5, 54, N'deactivatePAN', N'PAN Deactivation', N'पॅन निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (389, 5, 54, N'cancelPassport', N'Passport Cancellation', N'पासपोर्ट रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (390, 5, 54, N'deleteVoterID', N'Voter ID Deletion', N'मतदार ओळखपत्र रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (391, 5, 54, N'terminatePension', N'Pension Account Termination', N'पेन्शन खाते बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (392, 5, 54, N'freezeBankAccount', N'Bank Account Freeze Notification', N'बँक खाते गोठविण्याची सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (393, 5, 54, N'deactivateSIM', N'SIM/Telecom Deactivation', N'सिम / दूरसंचार सेवा निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (394, 5, 54, N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'यूपीआय / डिजिटल वॉलेट बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (395, 5, 54, N'notifyInsurance', N'Insurance Company Notification', N'विमा कंपनीला सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (396, 5, 54, N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'कर्ज / क्रेडिट दायित्वाबाबत सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (397, 5, 54, N'digitalDeactivationConsent', N'Consent Declaration', N'डिजिटल सेवा निष्क्रिय करण्यास संमती', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (398, 5, 54, N'addressVerifiedUsing', N'Permanent Address Verified Using', N'कायमचा पत्ता पडताळणीचा आधार', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (399, 5, 54, N'verifiedByRegistrar', N'Verified by Registrar', N'निबंधकाद्वारे पडताळणी', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', NULL, NULL, N'False', 44, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (400, 5, 54, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (401, 4, 47, N'architectMobile', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, NULL, 22, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (402, 4, 47, N'architectEmail', N'Email (optional)', N'ई-मेल (ऐच्छिक)', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (403, 4, 47, N'declaration', N'I hereby declare that the construction has been completed as per the approved plan and applicable rules.', N'मी घोषित करतो की बांधकाम मंजूर नकाशा व लागू नियमांनुसार पूर्ण झाले आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (404, 12, 48, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (405, 12, 48, N'organizationName', N'Organization / Company Name', N'संस्था / कंपनीचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (406, 12, 48, N'authorizedSignatoryName', N'Authorized Signatory Name', N'अधिकृत स्वाक्षरीकर्त्याचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (407, 12, 48, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (408, 12, 48, N'email', N'Email', N'ईमेल', N'email', N'Applicant / Organization Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (409, 12, 48, N'officeAddress', N'Office Address', N'कार्यालयाचा पत्ता', N'textarea', N'Applicant / Organization Details', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (410, 12, 48, N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'परवाना / नोंदणी क्रमांक (असल्यास)', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, N'False', 7, NULL, NULL, 50, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (411, 12, 48, N'gstNo', N'GST No (if any)', N'जीएसटी क्रमांक (असल्यास)', N'number', N'Applicant / Organization Details', NULL, NULL, N'{"min":0}', N'False', 8, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
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
]', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (413, 12, 48, N'zoneId', N'Zone', N'झोन', N'select', N'Work Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 9, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (414, 12, 48, N'workAreaType', N'Work Area Type', N'कार्यक्षेत्राचा प्रकार', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (415, 12, 48, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Work Location Details', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (416, 12, 48, N'fromLocation', N'From Location', N'सुरुवातीचे ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (417, 12, 48, N'toLocation', N'To Location', N'अंतिम ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (418, 12, 48, N'landmark', N'Landmark (optional)', N'जवळची खूण (ऐच्छिक)', N'text', N'Work Location Details', NULL, NULL, NULL, N'False', 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (419, 12, 48, N'totalRouteLengthMeters', N'Total Route Length (meters)', N'मार्गाची एकूण लांबी (मीटरमध्ये)', N'number', N'Work Location Details', NULL, NULL, N'{"min":0}', NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (420, 12, 48, N'methodOfLaying', N'Method of Laying', N'वाहिनी टाकण्याची पद्धत', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (421, 12, 48, N'trenchWidthCm', N'Trench Width (cm)', N'चराची रुंदी (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', N'False', 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (422, 12, 48, N'trenchDepthCm', N'Trench Depth (cm)', N'चराची खोली (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', N'False', 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (423, 12, 48, N'roadCrossingsCount', N'No. of Road Crossings', N'रस्ता ओलांडण्यांची संख्या', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (424, 12, 48, N'ductPipeSize', N'Duct / HDPE Pipe Size', N'डक्ट / एचडीपीई पाईपचा आकार', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', NULL, 21, NULL, NULL, 50, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (425, 12, 48, N'noOfDucts', N'No. of Ducts (optional)', N'डक्टची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', N'False', 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (426, 12, 48, N'handholesChambersCount', N'Handholes / Chambers (optional)', N'हँडहोल्स / चेंबर्सची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (427, 12, 48, N'expectedStartDate', N'Expected Start Date', N'अपेक्षित सुरू तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (428, 12, 48, N'expectedEndDate', N'Expected End Date', N'अपेक्षित अंतिम तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (429, 12, 48, N'trafficManagementRequired', N'Traffic Management Required?', N'रहदारी व्यवस्थापन आवश्यक आहे का?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (430, 6, 55, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (431, 6, 55, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (432, 6, 55, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (433, 6, 55, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (434, 6, 55, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (435, 6, 55, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (436, 6, 55, N'relationshipToStudent', N'Relationship to Student', N'विद्यार्थ्याशी नाते', N'select', N'Applicant Information', N'[{"value":"self","label":{"en":"Self (Student)","hi":"स्वयं (छात्र)","mr":"स्वतः (विद्यार्थी)"}},{"value":"parent","label":{"en":"Parent","hi":"अभिभावक","mr":"पालक"}},{"value":"guardian","label":{"en":"Guardian","hi":"संरक्षक","mr":"संरक्षक"}}]', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (437, 6, 55, N'guardianFullName', N'Parent/Guardian Full Name', N'पालक / संरक्षकाचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (438, 6, 55, N'rollNumber', N'Roll Number', N'अनुक्रमांक', N'text', N'Student Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (439, 6, 55, N'studentName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (440, 6, 55, N'dateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (441, 6, 55, N'gender', N'Gender', N'लिंग', N'select', N'Student Details', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (442, 6, 55, N'motherName', N'Mother''s Name', N'आईचे नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (443, 6, 55, N'fatherName', N'Father''s Name', N'वडिलांचे नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (444, 6, 55, N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'आधार क्रमांकाचे शेवटचे 4 अंक (ऐच्छिक)', N'text', N'Student Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 4,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', N'False', 15, NULL, NULL, 4, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (445, 6, 55, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {
    "value": "Marathi Boys School No. 4",
    "label": {
      "en": "Marathi Boys School No. 4",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Marathi Boys School No. 7",
    "label": {
      "en": "Marathi Boys School No. 7",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Marathi Boys School No. 9",
    "label": {
      "en": "Marathi Boys School No. 9",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Marathi Boys School No. 12",
    "label": {
      "en": "Marathi Boys School No. 12",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 14",
    "label": {
      "en": "Marathi Boys School No. 14",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 16",
    "label": {
      "en": "Marathi Boys School No. 16",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 17",
    "label": {
      "en": "Marathi Boys School No. 17",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 18",
    "label": {
      "en": "Marathi Boys School No. 18",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 19",
    "label": {
      "en": "Marathi Boys School No. 19",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 22",
    "label": {
      "en": "Marathi Boys School No. 22",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Boys School No. 26",
    "label": {
      "en": "Marathi Boys School No. 26",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Marathi Girls School No. 7",
    "label": {
      "en": "Marathi Girls School No. 7",
      "hi": "????? ?????? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  },
  {
    "value": "Hindi Boys School No. 1",
    "label": {
      "en": "Hindi Boys School No. 1",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ???? ???? ???. ?"
    }
  },
  {
    "value": "Hindi Boys School No. 2",
    "label": {
      "en": "Hindi Boys School No. 2",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ???? ???? ???. ?"
    }
  },
  {
    "value": "Hindi Boys School No. 6",
    "label": {
      "en": "Hindi Boys School No. 6",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ???? ???? ???. ?"
    }
  },
  {
    "value": "Hindi Boys School No. 8",
    "label": {
      "en": "Hindi Boys School No. 8",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ???? ???? ???. ?"
    }
  },
  {
    "value": "Sindhi Hindi School No. 1",
    "label": {
      "en": "Sindhi Hindi School No. 1",
      "hi": "????? ????? ???? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  },
  {
    "value": "Gujarati Boys School No. 1",
    "label": {
      "en": "Gujarati Boys School No. 1",
      "hi": "??????? ???? ???????? ???. ?",
      "mr": "??????? ???? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 1",
    "label": {
      "en": "Urdu Boys School No. 1",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 2",
    "label": {
      "en": "Urdu Boys School No. 2",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 6",
    "label": {
      "en": "Urdu Boys School No. 6",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 7",
    "label": {
      "en": "Urdu Boys School No. 7",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 8",
    "label": {
      "en": "Urdu Boys School No. 8",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 9",
    "label": {
      "en": "Urdu Boys School No. 9",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ??????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Boys School No. 10",
    "label": {
      "en": "Urdu Boys School No. 10",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Urdu Boys School No. 11",
    "label": {
      "en": "Urdu Boys School No. 11",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Urdu Boys School No. 12",
    "label": {
      "en": "Urdu Boys School No. 12",
      "hi": "????? ???? ???????? ???. ??",
      "mr": "????? ??????? ???? ???. ??"
    }
  },
  {
    "value": "Urdu Girls School No. 1",
    "label": {
      "en": "Urdu Girls School No. 1",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Girls School No. 3",
    "label": {
      "en": "Urdu Girls School No. 3",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Girls School No. 4",
    "label": {
      "en": "Urdu Girls School No. 4",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  },
  {
    "value": "Urdu Girls School No. 5",
    "label": {
      "en": "Urdu Girls School No. 5",
      "hi": "????? ???? ???????? ???. ?",
      "mr": "????? ????? ???? ???. ?"
    }
  }
]', NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (446, 6, 55, N'lastStandardStudied', N'Last Standard/Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"१ ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"२ री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"३ री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"४ थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"५ वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"६ वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"७ वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"८ वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"९ वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"१० वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (447, 6, 55, N'yearOfLeaving', N'Year of Leaving', N'शाळा सोडल्याचे वर्ष', N'number', N'School Details', NULL, NULL, N'{"min":0}', NULL, 18, NULL, NULL, 4, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (448, 6, 55, N'certificateType', N'Certificate Type', N'प्रमाणपत्राचा प्रकार', N'select', N'School Details', N'[{"value":"leaving","label":{"en":"Leaving Certificate","hi":"शालांत प्रमाणपत्र","mr":"शाळा सोडल्याचा दाखला"}},{"value":"duplicate","label":{"en":"Duplicate Certificate","hi":"दुय्यम प्रमाणपत्र","mr":"द्वितीय दाखला"}},{"value":"migration","label":{"en":"Migration Certificate","hi":"स्थानांतरण प्रमाणपत्र","mr":"स्थलांतर प्रमाणपत्र"}}]', NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (449, 6, 55, N'lastAttendanceDate', N'Last Attendance Date', N'शेवटची उपस्थिती तारीख', N'date', N'School Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', N'False', 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (450, 6, 55, N'boardOrUniversity', N'Board / University', N'मंडळ / विद्यापीठ', N'text', N'School Details', NULL, NULL, NULL, N'False', 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (451, 6, 55, N'reasonForLeaving', N'Reason for Leaving', N'शाळा सोडण्याचे कारण', N'select', N'Certificate Details', N'[{"value":"transfer","label":{"en":"Transfer","hi":"स्थानांतरण","mr":"बदली"}},{"value":"higherStudies","label":{"en":"Higher Studies","hi":"उच्च शिक्षा","mr":"उच्च शिक्षण"}},{"value":"familyShift","label":{"en":"Family Shift","hi":"परिवार स्थानांतरण","mr":"कुटुंब स्थलांतर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (452, 6, 55, N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'सर्व थकीत देणी भरली आहेत का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (453, 6, 55, N'duplicateReason', N'Reason for Duplicate', N'डुप्लिकेट प्रमाणपत्राचे कारण', N'select', N'Certificate Details', N'[{"value":"lost","label":{"en":"Original Certificate Lost","hi":"मूल प्रमाणपत्र खो गया","mr":"मूळ प्रमाणपत्र हरवले"}},{"value":"damaged","label":{"en":"Original Certificate Damaged","hi":"मूल प्रमाणपत्र क्षतिग्रस्त हो गया","mr":"मूळ प्रमाणपत्र खराब झाले"}},{"value":"destroyed","label":{"en":"Original Certificate Destroyed","hi":"मूल प्रमाणपत्र नष्ट हो गया","mr":"मूळ प्रमाणपत्र नष्ट झाले"}},{"value":"misplaced","label":{"en":"Certificate Misplaced","hi":"प्रमाणपत्र गुम हो गया","mr":"प्रमाणपत्र सापडत नाही"}},{"value":"correction","label":{"en":"Name / Details Correction","hi":"नाम / विवरण सुधार","mr":"नाव / माहिती दुरुस्ती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (454, 6, 55, N'originalCertificateNumber', N'Original Certificate No. (if known)', NULL, N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', N'False', 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (455, 6, 55, N'policeComplaintFiled', N'Police Complaint Filed?', N'पोलीस तक्रार दाखल केली आहे का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (456, 6, 55, N'affidavitProvided', N'Affidavit Provided?', N'प्रतिज्ञापत्र सादर केले आहे का?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (457, 6, 55, N'lastExamPassed', N'Last Exam Passed', N'शेवटची उत्तीर्ण परीक्षा', N'number', N'Certificate Details', NULL, NULL, N'{"min":0}', N'False', 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (458, 6, 55, N'seatOrRegNo', N'Seat No / Registration No', N'आसन क्रमांक / नोंदणी क्रमांक', N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', N'False', 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (459, 6, 55, N'destinationInstituteName', N'Destination Institute (optional)', NULL, N'text', N'Certificate Details', NULL, NULL, NULL, N'False', 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (460, 6, 55, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (461, 10, 66, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (462, 10, 66, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (463, 10, 66, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (464, 10, 66, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (465, 10, 66, N'applicantAddress', N'Address (optional)', N'पत्ता (ऐच्छिक)', N'textarea', N'Applicant Details', NULL, NULL, NULL, N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (466, 10, 66, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (467, 10, 66, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, 20, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (468, 10, 66, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी असलेले नाते', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (469, 10, 66, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Location / Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
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
]', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (471, 10, 66, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Location / Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 11, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (472, 10, 66, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Location / Property Details', NULL, NULL, NULL, N'False', 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (473, 10, 66, N'fetchedPropertyAddress', N'Address', N'पत्ता', N'textarea', N'Location / Property Details', NULL, NULL, NULL, N'False', 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (474, 10, 66, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location / Property Details', NULL, NULL, NULL, N'False', 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (475, 10, 66, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Location / Property Details', NULL, NULL, NULL, N'False', 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (476, 10, 66, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location / Property Details', NULL, NULL, NULL, N'False', 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (477, 10, 66, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Location / Property Details', NULL, NULL, NULL, N'False', 17, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (478, 10, 66, N'actionRequested', N'What do you want to do?', N'आपण कोणती कार्यवाही करू इच्छिता?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (479, 10, 66, N'noOfTrees', N'How many trees?', N'झाडांची संख्या', N'number', N'Tree Request Details', NULL, NULL, N'{"min":0}', NULL, 19, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (480, 10, 66, N'treeLocationType', N'Where is the tree located?', N'झाड कोणत्या ठिकाणी आहे?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (481, 10, 66, N'reasonCategory', N'Reason', N'कारण', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (482, 10, 66, N'isImmediateDanger', N'Is it an emergency danger?', N'तातडीचा धोका आहे का?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (483, 10, 66, N'dangerExplanation', N'Explain the danger (if yes)', N'धोक्याचे स्पष्टीकरण द्या (होय असल्यास)', N'textarea', N'Tree Request Details', NULL, NULL, NULL, N'False', 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (484, 10, 66, N'treeDetails', N'Tree Details', N'झाडाचा तपशील', N'textarea', N'Tree Request Details', NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (485, 10, 66, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (501, 12, 48, N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (502, 12, 48, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (503, 12, 48, N'restorationResponsibility', N'Restoration Responsibility', N'पुनर्स्थापना जबाबदारी', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (504, 12, 48, N'restorationType', N'Restoration Type', N'पुनर्स्थापना प्रकार', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (505, 12, 48, N'undertakingConsent', N'Undertaking / Indemnity Consent', N'हमीपत्र / स्वीकृती पत्र', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (506, 12, 49, N'accidentOrDamage', N'Any accident/vehicle damage?', N'कोणताही अपघात किंवा वाहनाचे नुकसान झाले आहे का?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, N'False', 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (507, 12, 49, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (508, 12, 49, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Pothole Location Details', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (509, 12, 49, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (510, 12, 49, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (511, 12, 49, N'fromLocation', N'From (optional)', N'सुरुवातीचे ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (512, 12, 49, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Pothole Location Details', NULL, NULL, NULL, N'False', 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (513, 12, 49, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Pothole Location Details', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (514, 12, 49, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (515, 12, 49, N'potholeCount', N'Number of Potholes', N'खड्ड्यांची संख्या', N'number', N'Pothole Details', NULL, NULL, N'{"min":0}', NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (516, 12, 49, N'potholeSize', N'Pothole Size', N'खड्ड्याचा आकार', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (517, 12, 49, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Pothole Details', NULL, NULL, NULL, N'False', 16, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (518, 12, 49, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (519, 12, 49, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Pothole Location Details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (520, 12, 49, N'toLocation', N'To (optional)', N'अंतिम ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, N'False', 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
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
]', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (522, 12, 49, N'zoneId', N'Zone', N'झोन', N'select', N'Pothole Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 5, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (523, 12, 50, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (524, 12, 50, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (525, 12, 50, N'citizenFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (526, 12, 50, N'coverCount', N'Number of Covers', N'झाकणांची संख्या', N'number', N'Sewer Cover Issue Details', NULL, NULL, N'{"min":0}', NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (527, 12, 50, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (528, 12, 50, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, N'False', 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (529, 12, 50, N'issueType', N'Issue Type', N'समस्येचा प्रकार', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (530, 12, 50, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (531, 12, 50, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (532, 12, 50, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Sewer Cover Issue Details', NULL, NULL, NULL, N'False', 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (533, 12, 50, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (534, 12, 50, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
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
]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (536, 12, 50, N'zoneId', N'Zone', N'झोन', N'select', N'Sewer Cover Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 4, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (597, 5, 53, N'dischargeCardDoc', N'Hospital Discharge Card', N'रुग्णालयाचा डिस्चार्ज कार्ड दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 62, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (598, 5, 53, N'informantIdDoc', N'Informant ID Proof', N'माहिती देणाऱ्याचा ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 63, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (599, 5, 54, N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 58, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (600, 5, 54, N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'स्मशानभूमी किंवा दफनभूमीचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 59, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (601, 9, 65, N'groomAgeProofDoc', N'Groom Age Proof Document', N'नवरदेवाच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (602, 9, 65, N'brideAgeProofDoc', N'Bride Age Proof Document', N'नवरीच्या वयाचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (603, 9, 65, N'weddingInvitationDoc', N'Wedding Invitation Card', N'लग्नपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', N'False', 52, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (604, 9, 65, N'witness1IdProofDoc', N'Witness 1 ID Proof', N'साक्षीदार १ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 53, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (605, 9, 65, N'witness2IdProofDoc', N'Witness 2 ID Proof', N'साक्षीदार २ ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 54, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (606, 11, 69, N'idProofDoc', N'Applicant ID Proof Document', N'अर्जदाराच्या ओळखपत्राचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 23, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (607, 11, 69, N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 24, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (608, 11, 69, N'premisesMapDoc', N'Premises Layout Map', N'जागेचा नकाशा / आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', N'False', 25, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (1114, 4, 44, N'propertyTaxDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1115, 4, 45, N'buildingPlanDoc', N'Ownership Documents', N'मालकी हक्काची कागदपत्रे', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1116, 4, 45, N'architectCertDoc', N'Architect’s Certificate', N'वास्तुविशारदाचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1117, 4, 47, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1118, 4, 47, N'PlinthCertificateDoc', N'Plinth Certificate', N'जोते प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1119, 4, 43, N'ownershipDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1124, 12, 48, N'routeMapDoc', N'Proposed OFC Cable Route Diagram', N'प्रस्तावित ओएफसी केबल मार्गाचा नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1125, 6, 55, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1126, 6, 55, N'previousMarksheetDoc', N'Previous Class Marksheet', NULL, N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', N'False', 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1134, 8, 64, N'fireSafetyBlueprintDoc', N'Approved Fire Safety Blueprint', N'मंजूर अग्निसुरक्षा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1135, 8, 63, N'equipmentInvoiceDoc', N'Fire Equipment Purchase / Inspection Receipt', N'अग्निशमन उपकरण खरेदी / तपासणी पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1138, 4, 61, N'propertyTaxDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1139, 10, 66, N'treePhotosDoc', N'Clear Photographs of Tree(s)', N'झाडाचे स्पष्ट छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1140, 10, 66, N'ownershipDoc', N'Property Ownership / 7-12 Extract', N'मालमत्ता मालकीचा पुरावा / ७/१२ उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1141, 4, 46, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1142, 4, 46, N'architectName', N'Licensed Architect Name', N'परवानाधारक वास्तुविशारदाचे नाव', N'text', N'Architect Details', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1143, 4, 46, N'buildingPermitRefNo', N'Sanctioned Building Permit Ref No', N'मंजूर बांधकाम परवाना संदर्भ क्रमांक', N'text', N'Permit Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1144, 4, 46, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1145, 4, 46, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1146, 4, 46, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
]', NULL, NULL, N'False', 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1148, 4, 46, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, N'False', 5, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1149, 7, 58, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1150, 7, 58, N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'जैव वैद्यकीय कचरा मंजुरी क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1151, 7, 58, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (1152, 7, 58, N'doctorName', N'Chief Medical Officer / Doctor Name', N'मुख्य वैद्यकीय अधिकारी / डॉक्टरचे नाव', N'text', N'Medical Staff Details', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1153, 7, 58, N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'डॉक्टर एमएमसी / वैद्यकीय नोंदणी क्रमांक', N'text', N'Medical Staff Details', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1154, 7, 58, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', 0, '2026-08-18T18:36:51.673'),
    (1155, 7, 58, N'fireNocNo', N'Fire Safety NOC Number', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1156, 7, 58, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1157, 7, 58, N'nursingHomeAddress', N'Nursing Home Address', N'नर्सिंग होमचा पत्ता', N'textarea', N'Nursing Home Details', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1158, 7, 58, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1159, 7, 58, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
}', NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1161, 7, 58, N'zoneId', N'Zone', N'झोन', N'select', N'Nursing Home Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, N'{
  "dependsOn":"zoneId",
  "filterByPrefix":true
}', NULL, 7, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1162, 7, 59, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1163, 7, 59, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1164, 7, 59, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1165, 7, 59, N'licenseExpiryDate', N'License Expiry Date', N'परवाना समाप्ती तारीख', N'date', N'License Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1166, 7, 59, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1167, 7, 59, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1168, 7, 59, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
]', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1170, 7, 60, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1171, 7, 60, N'currentHolderName', N'Current License Holder Name', N'सध्याच्या परवानाधारकाचे नाव', N'text', N'License Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1172, 7, 60, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1173, 7, 60, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1174, 7, 60, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1175, 7, 60, N'proposedHolderName', N'Proposed New Holder / Partner Name', N'प्रस्तावित नवीन परवानाधारक / भागीदाराचे नाव', N'text', N'Update Details', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1176, 7, 60, N'reasonForChange', N'Reason for Change', N'बदलाचे कारण', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1177, 11, 68, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location Details', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1178, 11, 68, N'cleanlinessIssueType', N'Cleanliness Issue Type', N'स्वच्छतेशी संबंधित समस्येचा प्रकार', N'select', N'Complaint Details', N'[{"value":"garbage","label":{"en":"Garbage Accumulation","hi":"कचरा साचणे","mr":"कचरा साचणे"}},{"value":"open_dumping","label":{"en":"Open Dumping","hi":"उघड्यावर कचरा","mr":"उघड्यावर कचरा टाकणे"}},{"value":"drainage_overflow","label":{"en":"Drainage Overflow","hi":"ड्रेनेज ओव्हरफ्लो","mr":"ड्रेनेज ओव्हरफ्लो"}},{"value":"sweeping_req","label":{"en":"Street Sweeping Required","hi":"रस्ता सफाई आवश्यक","mr":"रस्ता सफाई आवश्यक"}}]', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1179, 11, 68, N'complainantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Complainant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1180, 11, 68, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1181, 11, 68, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location Details', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1182, 11, 68, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Complainant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
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
]', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1184, 11, 68, N'zoneId', N'Zone', N'झोन', N'select', N'Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, NULL, 4, NULL, NULL, NULL, N'False', N'False', NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1185, 6, 56, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1186, 6, 56, N'dateOfBirth', N'Student Date of Birth', N'विद्यार्थ्याची जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1187, 6, 56, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1188, 6, 56, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1189, 6, 56, N'fatherFullName', N'Father / Guardian Full Name', N'वडील / पालक यांचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1190, 6, 56, N'grNumber', N'General Register (G.R.) / Roll No', N'जनरल रजिस्टर (जी.आर.) / रोल क्रमांक', N'text', N'School Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1191, 6, 56, N'lastStandardStudied', N'Last Standard / Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"१ ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"२ री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"३ री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"४ थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"५ वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"६ वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"७ वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"८ वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"९ वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"१० वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1192, 6, 56, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1193, 6, 56, N'motherFullName', N'Mother Full Name', N'आईचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1194, 6, 56, N'reasonForTC', N'Reason for Transfer Certificate', N'बदली प्रमाणपत्राचे कारण', N'select', N'Request Details', N'[{"value":"parent_transfer","label":{"en":"Parent Job Transfer","hi":"पालकांची बदली","mr":"पालकांची नोकरीतील बदली"}},{"value":"higher_studies","label":{"en":"Higher Studies / Admission","hi":"पुढील शिक्षण","mr":"पुढील शिक्षण / प्रवेश"}},{"value":"residence_shift","label":{"en":"Change of Residence","hi":"रहिवास बदल","mr":"रहिवास बदल"}},{"value":"other","label":{"en":"Other Reason","hi":"इतर कारण","mr":"इतर कारण"}}]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
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
]', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1196, 6, 56, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1197, 6, 57, N'affidavitDetails', N'FIR / Affidavit Registration Details', N'एफआयआर / प्रतिज्ञापत्र नोंदणी तपशील', N'textarea', N'Request Details', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1198, 6, 57, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1199, 6, 57, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1200, 6, 57, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1201, 6, 57, N'examinationPassed', N'Examination Name', N'परीक्षेचे नाव', N'select', N'Exam Details', N'[{"value":"ssc","label":{"en":"10th Board (SSC)","hi":"10वीं बोर्ड (SSC)","mr":"इयत्ता १० वी (SSC)"}},{"value":"std_5_scholarship","label":{"en":"5th Std Scholarship Exam","hi":"5वीं शिष्यवृत्ती","mr":"इयत्ता ५ वी शिष्यवृत्ती"}},{"value":"std_8_scholarship","label":{"en":"8th Std Scholarship Exam","hi":"8वीं शिष्यवृत्ती","mr":"इयत्ता ८ वी शिष्यवृत्ती"}},{"value":"primary_exam","label":{"en":"Annual Primary Exam","hi":"वार्षिक परीक्षा","mr":"वार्षिक परीक्षा"}},{"value":"other","label":{"en":"Other Exam","hi":"अन्य","mr":"इतर परीक्षा"}}]', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (1202, 6, 57, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, 10, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1203, 6, 57, N'passingYear', N'Passing Year', N'उत्तीर्ण वर्ष', N'number', N'Exam Details', NULL, NULL, N'{"min":0}', NULL, 8, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1204, 6, 57, N'reasonForDuplicate', N'Reason for Duplicate Marksheet', N'डुप्लिकेट गुणपत्रिकेचे कारण', N'select', N'Request Details', N'[{"value":"lost","label":{"en":"Original Lost","hi":"गहाळ झाले","mr":"मूळ गुणपत्रक गहाळ झाले"}},{"value":"damaged","label":{"en":"Original Damaged / Torn","hi":"खराब / फाटले","mr":"खराब / फाटले आहे"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"सापडत नाही","mr":"सापडत नाही"}}]', NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
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
]', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1206, 6, 57, N'seatNumber', N'Seat / Roll Number', N'आसन क्रमांक / रोल क्रमांक', N'text', N'Exam Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', NULL, 7, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1207, 6, 57, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1208, 4, 46, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1210, 6, 56, N'previousMarksheetDoc', N'Previous Class Marksheet', N'मागील इयत्तेची गुणपत्रिका', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1211, 6, 56, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1212, 6, 57, N'firOrAffidavitDoc', N'Police FIR / Notarized Affidavit Document', N'पोलीस एफआयआर / नोटरीकृत प्रतिज्ञापत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1213, 6, 57, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1214, 7, 58, N'bmwAgreementDoc', N'Bio Medical Waste Disposal Agreement', N'जैव वैद्यकीय कचरा विल्हेवाट करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 52, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1215, 7, 58, N'doctorDegreeDoc', N'Chief Doctor MMC / Degree Certificate', N'मुख्य डॉक्टर एमएमसी / पदवी प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1216, 7, 58, N'fireNocDoc', N'Fire Safety NOC Document', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1217, 7, 59, N'fireNocDoc', N'Valid Fire Safety NOC', N'वैध अग्निसुरक्षा ना हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1218, 7, 59, N'oldLicenseDoc', N'Previous Nursing Home License Copy', N'मागील नर्सिंग होम परवान्याची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1219, 7, 60, N'newHolderIdDoc', N'ID Proof of New License Holder', N'नवीन परवानाधारकाचा ओळखपत्र पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1220, 7, 60, N'transferAgreementDoc', N'Transfer Agreement / Partnership Deed', N'हस्तांतरण करार / भागीदारी करारनामा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 50, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1221, 11, 68, N'spotPhotoDoc', N'Spot Photograph of Location', N'ठिकाणाचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 9, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (3004, 2, 19, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3005, 2, 20, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3006, 2, 26, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3007, 2, 69, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3008, 2, 80, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3009, 2, 81, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3010, 2, 82, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3011, 2, 83, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3012, 2, 84, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3013, 2, 85, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3014, 2, 86, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3015, 2, 87, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3016, 2, 100, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3017, 2, 101, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3018, 3, 33, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3019, 3, 36, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3020, 3, 137, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3021, 3, 138, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3022, 3, 139, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3023, 3, 140, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3024, 3, 141, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3025, 3, 142, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3026, 3, 143, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3027, 3, 144, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3028, 3, 158, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3029, 3, 159, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3030, 3, 160, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3031, 3, 161, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3032, 13, 162, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3033, 1, 145, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3034, 1, 146, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (3035, 1, 147, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3036, 1, 148, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3037, 1, 149, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3038, 1, 150, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3039, 1, 151, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3040, 1, 152, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3041, 1, 153, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3042, 1, 154, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3043, 1, 155, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3044, 1, 156, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3045, 1, 157, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (4002, 12, 49, N'DOC_POTHOLE_PHOTO', N'Photo of Pothole Location', N'खड्ड्याचे छायाचित्र / फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 17, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.233', NULL, NULL),
    (4003, 12, 50, N'DOC_SEWER_PHOTO', N'Photo of Damaged / Open Sewer Cover', N'उघड्या / तुटलेल्या मॅनहोलचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 14, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.253', NULL, NULL),
    (4004, 2, 19, N'DOC_WATER_BILL_19', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.277', NULL, NULL),
    (4005, 2, 19, N'DOC_APPLICANT_ID_19', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.287', NULL, NULL),
    (4006, 2, 20, N'DOC_WATER_BILL_20', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.290', NULL, NULL),
    (4007, 2, 20, N'DOC_APPLICANT_ID_20', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.293', NULL, NULL),
    (4008, 2, 26, N'DOC_WATER_BILL_26', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.297', NULL, NULL),
    (4010, 3, 33, N'DOC_RENT_AGREEMENT_33', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.307', NULL, NULL),
    (4011, 3, 33, N'DOC_APPLICANT_ID_33', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.310', NULL, NULL),
    (4013, 3, 36, N'DOC_RENT_AGREEMENT_36', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.320', NULL, NULL),
    (4014, 3, 36, N'DOC_APPLICANT_ID_36', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.327', NULL, NULL),
    (4016, 2, 80, N'DOC_WATER_BILL_80', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.330', NULL, NULL),
    (4017, 2, 80, N'DOC_APPLICANT_ID_80', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.370', NULL, NULL),
    (4018, 2, 81, N'DOC_WATER_BILL_81', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.373', NULL, NULL),
    (4020, 2, 82, N'DOC_WATER_BILL_82', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.380', NULL, NULL),
    (4021, 2, 82, N'DOC_APPLICANT_ID_82', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.380', NULL, NULL),
    (4022, 2, 83, N'DOC_WATER_BILL_83', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.383', NULL, NULL),
    (4024, 2, 84, N'DOC_WATER_BILL_84', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.390', NULL, NULL),
    (4026, 2, 85, N'DOC_WATER_BILL_85', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.397', NULL, NULL),
    (4027, 2, 85, N'DOC_APPLICANT_ID_85', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.403', NULL, NULL),
    (4028, 2, 86, N'DOC_WATER_BILL_86', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.407', NULL, NULL),
    (4029, 2, 86, N'DOC_APPLICANT_ID_86', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.407', NULL, NULL),
    (4030, 2, 87, N'DOC_WATER_BILL_87', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.410', NULL, NULL),
    (4031, 2, 87, N'DOC_APPLICANT_ID_87', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.413', NULL, NULL),
    (4032, 2, 100, N'DOC_WATER_BILL_100', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.420', NULL, NULL),
    (4033, 2, 100, N'DOC_APPLICANT_ID_100', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.473', NULL, NULL),
    (4034, 2, 101, N'DOC_WATER_BILL_101', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.477', NULL, NULL),
    (4035, 2, 101, N'DOC_APPLICANT_ID_101', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.480', NULL, NULL),
    (4036, 3, 137, N'DOC_RENT_AGREEMENT_137', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.483', NULL, NULL),
    (4037, 3, 137, N'DOC_APPLICANT_ID_137', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.487', NULL, NULL),
    (4038, 3, 137, N'DOC_NOC_CERTIFICATE_137', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.490', NULL, NULL),
    (4039, 3, 138, N'DOC_RENT_AGREEMENT_138', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.493', NULL, NULL),
    (4040, 3, 138, N'DOC_APPLICANT_ID_138', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.493', NULL, NULL),
    (4041, 3, 138, N'DOC_NOC_CERTIFICATE_138', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.497', NULL, NULL),
    (4042, 3, 139, N'DOC_RENT_AGREEMENT_139', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.503', NULL, NULL),
    (4043, 3, 139, N'DOC_APPLICANT_ID_139', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.503', NULL, NULL),
    (4044, 3, 139, N'DOC_NOC_CERTIFICATE_139', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.507', NULL, NULL),
    (4045, 3, 140, N'DOC_RENT_AGREEMENT_140', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.510', NULL, NULL),
    (4048, 3, 141, N'DOC_RENT_AGREEMENT_141', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.517', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (4049, 3, 141, N'DOC_APPLICANT_ID_141', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.520', NULL, NULL),
    (4051, 3, 142, N'DOC_RENT_AGREEMENT_142', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.527', NULL, NULL),
    (4052, 3, 142, N'DOC_APPLICANT_ID_142', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.530', NULL, NULL),
    (4054, 3, 143, N'DOC_RENT_AGREEMENT_143', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.533', NULL, NULL),
    (4055, 3, 143, N'DOC_APPLICANT_ID_143', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.537', NULL, NULL),
    (4057, 3, 144, N'DOC_RENT_AGREEMENT_144', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.543', NULL, NULL),
    (4060, 1, 145, N'DOC_PROP_OWNERSHIP_145', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.550', NULL, NULL),
    (4061, 1, 145, N'DOC_APPLICANT_ID_145', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.557', NULL, NULL),
    (4062, 1, 146, N'DOC_PROP_OWNERSHIP_146', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.560', NULL, NULL),
    (4063, 1, 146, N'DOC_APPLICANT_ID_146', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.563', NULL, NULL),
    (4064, 1, 147, N'DOC_PROP_OWNERSHIP_147', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.567', NULL, NULL),
    (4066, 1, 148, N'DOC_PROP_OWNERSHIP_148', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.570', NULL, NULL),
    (4067, 1, 148, N'DOC_APPLICANT_ID_148', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.573', NULL, NULL),
    (4068, 1, 149, N'DOC_PROP_OWNERSHIP_149', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.577', NULL, NULL),
    (4070, 1, 150, N'DOC_PROP_OWNERSHIP_150', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.580', NULL, NULL),
    (4071, 1, 150, N'DOC_APPLICANT_ID_150', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.583', NULL, NULL),
    (4072, 1, 151, N'DOC_PROP_OWNERSHIP_151', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.587', NULL, NULL),
    (4074, 1, 152, N'DOC_PROP_OWNERSHIP_152', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.637', NULL, NULL),
    (4075, 1, 152, N'DOC_APPLICANT_ID_152', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.640', NULL, NULL),
    (4076, 1, 153, N'DOC_PROP_OWNERSHIP_153', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.640', NULL, NULL),
    (4077, 1, 153, N'DOC_APPLICANT_ID_153', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.643', NULL, NULL),
    (4078, 1, 154, N'DOC_PROP_OWNERSHIP_154', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.643', NULL, NULL),
    (4079, 1, 154, N'DOC_APPLICANT_ID_154', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.647', NULL, NULL),
    (4080, 1, 155, N'DOC_PROP_OWNERSHIP_155', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.683', NULL, NULL),
    (4081, 1, 155, N'DOC_APPLICANT_ID_155', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.730', NULL, NULL),
    (4082, 1, 156, N'DOC_PROP_OWNERSHIP_156', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.730', NULL, NULL),
    (4083, 1, 156, N'DOC_APPLICANT_ID_156', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.733', NULL, NULL),
    (4084, 1, 157, N'DOC_PROP_OWNERSHIP_157', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.733', NULL, NULL),
    (4085, 1, 157, N'DOC_APPLICANT_ID_157', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.737', NULL, NULL),
    (4086, 3, 158, N'DOC_RENT_AGREEMENT_158', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.737', NULL, NULL),
    (4087, 3, 158, N'DOC_APPLICANT_ID_158', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.740', NULL, NULL),
    (4088, 3, 158, N'DOC_NOC_CERTIFICATE_158', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.740', NULL, NULL),
    (4089, 3, 159, N'DOC_RENT_AGREEMENT_159', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.743', NULL, NULL),
    (4090, 3, 159, N'DOC_APPLICANT_ID_159', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.747', NULL, NULL),
    (4091, 3, 159, N'DOC_NOC_CERTIFICATE_159', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.747', NULL, NULL),
    (4092, 3, 160, N'DOC_RENT_AGREEMENT_160', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.750', NULL, NULL),
    (4093, 3, 160, N'DOC_APPLICANT_ID_160', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.750', NULL, NULL),
    (4094, 3, 160, N'DOC_NOC_CERTIFICATE_160', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.753', NULL, NULL),
    (4095, 3, 161, N'DOC_RENT_AGREEMENT_161', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.757', NULL, NULL),
    (4096, 3, 161, N'DOC_APPLICANT_ID_161', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.760', NULL, NULL),
    (4097, 3, 161, N'DOC_NOC_CERTIFICATE_161', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.760', NULL, NULL),
    (4099, 13, 162, N'DOC_APPLICANT_ID_162', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.767', NULL, NULL),
    (4101, 4, 61, N'approvedPlanDocument', N'Approved Plan / Map', N'मंजूर नकाशाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 52, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4102, 4, 61, N'sevenTwelveOrSaleDeedDocument', N'7/12 Extract / Sale Deed', N'७/१२ उतारा / खरेदी खत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 53, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4103, 4, 61, N'rentAgreementDocument', N'Rent Agreement', N'भाडे करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', N'False', 54, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4104, 4, 44, N'measurementMapDocument', N'Measurement Map / City Survey Map', N'मोजणी नकाशा / सिटी सर्व्हे नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 51, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T22:31:22.380', NULL, NULL),
    (4105, 4, 45, N'buildingPlanDrawingDoc', N'Building Plan / Construction Drawing', N'बांधकाम आराखडा / नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 52, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T22:56:11.760', NULL, NULL),
    (4106, 4, 45, N'approvedDrawingCopyDoc', N'Copy of Approved Drawing', N'मंजूर रेखांकनाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 53, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-17T22:56:11.760', NULL, NULL),
    (5102, 5, 53, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5103, 5, 53, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (5104, 5, 53, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5105, 5, 53, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5106, 5, 53, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5107, 5, 53, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 6, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (6101, 4, 46, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-23T12:58:35.560', NULL, NULL),
    (6102, 7, 59, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-23T13:00:21.937', NULL, NULL),
    (6103, 7, 60, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-23T13:01:31.673', NULL, NULL),
    (6104, 11, 68, N'email', N'Email', N'ईमेल', N'email', N'Complainant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 3, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-23T13:06:20.847', NULL, NULL),
    (6105, 12, 48, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant / Organization Details', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-23T18:28:41.520', NULL, NULL),
    (7299, 1, 145, N'DOC_PROPERTY_RECORD_145', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7300, 1, 145, N'DOC_BUILDING_PERMISSION_145', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7301, 1, 145, N'DOC_SITE_INSPECTION_145', N'Site Inspection Report.', N'स्थळ तपासणी अहवाल', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7302, 1, 153, N'DOC_BUILDING_PERMISSION_153', N'Building Permission / Sanctioned Building Plan.', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7303, 1, 156, N'DOC_PROPERTY_RECORD_156', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7304, 1, 156, N'DOC_BUILDING_PERMISSION_156', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7305, 1, 156, N'DOC_PUBLIC_NOTICE_156', N'Public Notice / Declaration.', N'जाहीरनामा / घोषणापत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7306, 1, 157, N'DOC_PROPERTY_RECORD_157', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7307, 1, 157, N'DOC_BUILDING_PERMISSION_157', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7308, 1, 157, N'DOC_PUBLIC_NOTICE_157', N'Public Notice / Declaration.', N'जाहीरनामा / घोषणापत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7309, 2, 19, N'DOC_REQUIRED_03_19', N'Site Inspection Report.', N'स्थळ तपासणी अहवाल', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7310, 2, 80, N'DOC_REQUIRED_03_80', N'Licensed Plumber''s Licence', N'परवानाधारक प्लंबरचा परवाना', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7311, 2, 80, N'DOC_REQUIRED_04_80', N'Fitter Inspection Report (Form XII)', N'फिटर तपासणी अहवाल (नमुना १२)', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7312, 2, 80, N'DOC_REQUIRED_05_80', N'Proposed Water Pipeline Layout / Map', N'प्रस्तावित पाणी पाइपलाइन आराखडा / नकाशा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7313, 2, 80, N'DOC_REQUIRED_06_80', N'Agreement on ?100 Stamp Paper', N'₹100 च्या मुद्रांक कागदावरील करारनामा', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7314, 2, 80, N'DOC_REQUIRED_07_80', N'Water Meter Purchase Invoice.', N'पाणी मीटर खरेदीचे बिल', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7315, 2, 82, N'DOC_REQUIRED_03_82', N'Photograph showing that the side connection has been disconnected / cut.', N'साईड कनेक्शन तोडले / कट केल्याचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7316, 2, 85, N'DOC_REQUIRED_03_85', N'Invoice / Bill for the Newly Installed Water Meter.', N'नव्याने बसवलेल्या पाणी मीटरचे बिल', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7317, 2, 100, N'DOC_REQUIRED_03_100', N'School Leaving Certificate', N'शाळा सोडल्याचा दाखला', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7318, 2, 100, N'DOC_REQUIRED_04_100', N'Valid Mobile Number', N'वैध मोबाईल क्रमांक', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7319, 2, 100, N'DOC_REQUIRED_05_100', N'PAN Card', N'पॅन कार्ड', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7320, 2, 100, N'DOC_REQUIRED_06_100', N'Recent Passport-size Photograph.', N'नुकताच काढलेला पासपोर्ट आकाराचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7321, 2, 101, N'DOC_REQUIRED_03_101', N'Recent Passport-size Photograph', N'नुकताच काढलेला पासपोर्ट आकाराचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7322, 2, 101, N'DOC_REQUIRED_04_101', N'Plumber Licence Renewal Form signed by the Junior Engineer.', N'कनिष्ठ अभियंत्यांच्या स्वाक्षरीसह प्लंबर परवाना नूतनीकरण अर्ज', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7423, 3, 137, N'DOC_REQUIRED_04_137', N'Photograph of the Business Premises', N'व्यवसायाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.923', NULL, NULL),
    (7424, 3, 137, N'DOC_REQUIRED_05_137', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'जागा भाड्याने घेतली असल्यास भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.923', NULL, NULL),
    (7425, 3, 137, N'DOC_REQUIRED_06_137', N'Valid FSSAI Licence for a food-related business.', N'खाद्यपदार्थ संबंधित व्यवसायासाठी वैध FSSAI परवाना', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.927', NULL, NULL),
    (7426, 3, 158, N'DOC_REQUIRED_04_158', N'Photograph of the Lodging House Premises', N'निवासगृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7427, 3, 158, N'DOC_REQUIRED_05_158', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented.', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7428, 3, 159, N'DOC_REQUIRED_04_159', N'Photograph of the Lodging House Premises', N'निवासगृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7429, 3, 159, N'DOC_REQUIRED_05_159', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7430, 3, 159, N'DOC_REQUIRED_06_159', N'Previous Lodging House Licence', N'मागील निवासगृह परवाना', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7431, 3, 160, N'DOC_REQUIRED_04_160', N'Photograph of the Marriage Hall / Auditorium Premises', N'विवाह सभागृह / प्रेक्षागृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7432, 3, 160, N'DOC_REQUIRED_05_160', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7433, 3, 160, N'DOC_REQUIRED_06_160', N'Fire Department Certificate / Fire NOC', N'अग्निशमन विभागाचे प्रमाणपत्र / अग्निशमन ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7434, 3, 160, N'DOC_REQUIRED_07_160', N'Photographs of Parking Facilities', N'पार्किंग सुविधांचे फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7435, 3, 160, N'DOC_REQUIRED_08_160', N'Sanitation Certificate from the Health Department', N'आरोग्य विभागाचे स्वच्छता प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7436, 3, 160, N'DOC_REQUIRED_09_160', N'Building Permission', N'बांधकाम परवानगी', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7437, 3, 160, N'DOC_REQUIRED_10_160', N'Copy of the Sanctioned Building Plan', N'मंजूर बांधकाम नकाशाची प्रत', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7438, 3, 160, N'DOC_REQUIRED_11_160', N'Water Conservation Certificate.', N'जलसंधारण प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7439, 3, 161, N'DOC_REQUIRED_04_161', N'Photograph of the Marriage Hall / Auditorium Premises', N'विवाह सभागृह / प्रेक्षागृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (7440, 3, 161, N'DOC_REQUIRED_05_161', N'Rent Agreement or Property Owner Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7441, 3, 161, N'DOC_REQUIRED_06_161', N'Fire Department Certificate / Fire NOC', N'अग्निशमन विभागाचे प्रमाणपत्र / अग्निशमन ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7442, 3, 161, N'DOC_REQUIRED_07_161', N'Photographs of Parking Facilities', N'पार्किंग सुविधांचे फोटो', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7443, 3, 161, N'DOC_REQUIRED_08_161', N'Sanitation Certificate from the Health Department', N'आरोग्य विभागाचे स्वच्छता प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7444, 3, 161, N'DOC_REQUIRED_09_161', N'Building Permission', N'बांधकाम परवानगी', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7445, 3, 161, N'DOC_REQUIRED_10_161', N'Copy of the Sanctioned Building Plan', N'मंजूर बांधकाम नकाशाची प्रत', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7446, 3, 161, N'DOC_REQUIRED_11_161', N'Water Conservation Certificate', N'जलसंधारण प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7447, 3, 161, N'DOC_REQUIRED_12_161', N'Previous Marriage Hall / Auditorium Licence', N'मागील विवाह सभागृह / प्रेक्षागृह परवाना', N'file', NULL, NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (8283, 4, 62, N'applicantFullName', N'Full Name', N'पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, 200, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8284, 4, 62, N'mandalOrganizationName', N'Organization / Mandal Name', N'संस्था / मंडळाचे नाव', N'text', N'Applicant Information', NULL, NULL, NULL, N'False', 1, NULL, NULL, 200, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8285, 4, 62, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8286, 4, 62, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8287, 4, 62, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8288, 4, 62, N'fullPostalAddress', N'Full Postal Address', N'पूर्ण टपाल पत्ता', N'textarea', N'Applicant Information', NULL, NULL, N'{"maxLength":500}', NULL, 1, NULL, NULL, 500, NULL, N'False', NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8289, 4, 62, N'eventType', N'Type of Event', N'कार्यक्रमाचा प्रकार', N'select', N'Event & Venue Details', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8290, 4, 62, N'mandapLocationAddress', N'Exact Location / Address of Proposed Mandap', N'प्रस्तावित मंडपाचे अचूक ठिकाण / पत्ता', N'textarea', N'Event & Venue Details', NULL, NULL, N'{"maxLength":500}', NULL, 22, NULL, NULL, 500, NULL, N'False', NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8291, 4, 62, N'wardNo', N'Ward', N'प्रभागाचे नाव / क्रमांक', N'select', N'Event & Venue Details', N'[
  {
    "value": "A1",
    "label": {
      "en": "A1",
      "hi": "A1",
      "mr": "A1"
    }
  },
  {
    "value": "A2",
    "label": {
      "en": "A2",
      "hi": "A2",
      "mr": "A2"
    }
  },
  {
    "value": "A3",
    "label": {
      "en": "A3",
      "hi": "A3",
      "mr": "A3"
    }
  },
  {
    "value": "A4",
    "label": {
      "en": "A4",
      "hi": "A4",
      "mr": "A4"
    }
  },
  {
    "value": "A5",
    "label": {
      "en": "A5",
      "hi": "A5",
      "mr": "A5"
    }
  },
  {
    "value": "A6",
    "label": {
      "en": "A6",
      "hi": "A6",
      "mr": "A6"
    }
  },
  {
    "value": "A7",
    "label": {
      "en": "A7",
      "hi": "A7",
      "mr": "A7"
    }
  },
  {
    "value": "A8",
    "label": {
      "en": "A8",
      "hi": "A8",
      "mr": "A8"
    }
  },
  {
    "value": "A9",
    "label": {
      "en": "A9",
      "hi": "A9",
      "mr": "A9"
    }
  },
  {
    "value": "A10",
    "label": {
      "en": "A10",
      "hi": "A10",
      "mr": "A10"
    }
  },
  {
    "value": "A11",
    "label": {
      "en": "A11",
      "hi": "A11",
      "mr": "A11"
    }
  },
  {
    "value": "B1",
    "label": {
      "en": "B1",
      "hi": "B1",
      "mr": "B1"
    }
  },
  {
    "value": "B2",
    "label": {
      "en": "B2",
      "hi": "B2",
      "mr": "B2"
    }
  },
  {
    "value": "B3",
    "label": {
      "en": "B3",
      "hi": "B3",
      "mr": "B3"
    }
  },
  {
    "value": "B4",
    "label": {
      "en": "B4",
      "hi": "B4",
      "mr": "B4"
    }
  },
  {
    "value": "B5",
    "label": {
      "en": "B5",
      "hi": "B5",
      "mr": "B5"
    }
  },
  {
    "value": "B6",
    "label": {
      "en": "B6",
      "hi": "B6",
      "mr": "B6"
    }
  },
  {
    "value": "B7",
    "label": {
      "en": "B7",
      "hi": "B7",
      "mr": "B7"
    }
  },
  {
    "value": "B8",
    "label": {
      "en": "B8",
      "hi": "B8",
      "mr": "B8"
    }
  },
  {
    "value": "B9",
    "label": {
      "en": "B9",
      "hi": "B9",
      "mr": "B9"
    }
  },
  {
    "value": "B10",
    "label": {
      "en": "B10",
      "hi": "B10",
      "mr": "B10"
    }
  },
  {
    "value": "B11",
    "label": {
      "en": "B11",
      "hi": "B11",
      "mr": "B11"
    }
  },
  {
    "value": "B12",
    "label": {
      "en": "B12",
      "hi": "B12",
      "mr": "B12"
    }
  },
  {
    "value": "B13",
    "label": {
      "en": "B13",
      "hi": "B13",
      "mr": "B13"
    }
  },
  {
    "value": "B14",
    "label": {
      "en": "B14",
      "hi": "B14",
      "mr": "B14"
    }
  },
  {
    "value": "C1",
    "label": {
      "en": "C1",
      "hi": "C1",
      "mr": "C1"
    }
  },
  {
    "value": "C2",
    "label": {
      "en": "C2",
      "hi": "C2",
      "mr": "C2"
    }
  },
  {
    "value": "C3",
    "label": {
      "en": "C3",
      "hi": "C3",
      "mr": "C3"
    }
  },
  {
    "value": "C4",
    "label": {
      "en": "C4",
      "hi": "C4",
      "mr": "C4"
    }
  },
  {
    "value": "C5",
    "label": {
      "en": "C5",
      "hi": "C5",
      "mr": "C5"
    }
  },
  {
    "value": "C6",
    "label": {
      "en": "C6",
      "hi": "C6",
      "mr": "C6"
    }
  },
  {
    "value": "C7",
    "label": {
      "en": "C7",
      "hi": "C7",
      "mr": "C7"
    }
  },
  {
    "value": "C8",
    "label": {
      "en": "C8",
      "hi": "C8",
      "mr": "C8"
    }
  },
  {
    "value": "C9",
    "label": {
      "en": "C9",
      "hi": "C9",
      "mr": "C9"
    }
  },
  {
    "value": "C10",
    "label": {
      "en": "C10",
      "hi": "C10",
      "mr": "C10"
    }
  },
  {
    "value": "C11",
    "label": {
      "en": "C11",
      "hi": "C11",
      "mr": "C11"
    }
  },
  {
    "value": "D1",
    "label": {
      "en": "D1",
      "hi": "D1",
      "mr": "D1"
    }
  },
  {
    "value": "D2",
    "label": {
      "en": "D2",
      "hi": "D2",
      "mr": "D2"
    }
  },
  {
    "value": "D3",
    "label": {
      "en": "D3",
      "hi": "D3",
      "mr": "D3"
    }
  },
  {
    "value": "D4",
    "label": {
      "en": "D4",
      "hi": "D4",
      "mr": "D4"
    }
  },
  {
    "value": "D5",
    "label": {
      "en": "D5",
      "hi": "D5",
      "mr": "D5"
    }
  },
  {
    "value": "D6",
    "label": {
      "en": "D6",
      "hi": "D6",
      "mr": "D6"
    }
  },
  {
    "value": "D7",
    "label": {
      "en": "D7",
      "hi": "D7",
      "mr": "D7"
    }
  },
  {
    "value": "D8",
    "label": {
      "en": "D8",
      "hi": "D8",
      "mr": "D8"
    }
  },
  {
    "value": "D9",
    "label": {
      "en": "D9",
      "hi": "D9",
      "mr": "D9"
    }
  },
  {
    "value": "D10",
    "label": {
      "en": "D10",
      "hi": "D10",
      "mr": "D10"
    }
  },
  {
    "value": "D11",
    "label": {
      "en": "D11",
      "hi": "D11",
      "mr": "D11"
    }
  },
  {
    "value": "D12",
    "label": {
      "en": "D12",
      "hi": "D12",
      "mr": "D12"
    }
  }
]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8292, 4, 62, N'landOwnershipType', N'Land Ownership Type', N'जमिनीच्या मालकीचा प्रकार', N'select', N'Event & Venue Details', N'[
      {"value":"municipalRoad","label":{"en":"Municipal Road","hi":"नगरपालिका सड़क","mr":"महानगरपालिका रस्ता"}},
      {"value":"publicFootpath","label":{"en":"Public Footpath","hi":"सार्वजनिक फुटपाथ","mr":"सार्वजनिक पदपथ"}},
      {"value":"municipalGround","label":{"en":"Municipal Ground","hi":"नगरपालिका मैदान","mr":"महानगरपालिका मैदान"}},
      {"value":"privateProperty","label":{"en":"Private Property","hi":"निजी संपत्ति","mr":"खाजगी मालमत्ता"}},
      {"value":"societyOpenArea","label":{"en":"Society Open Area","hi":"सोसाइटी खुला क्षेत्र","mr":"सोसायटी मोकळी जागा"}}
    ]', NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8293, 4, 62, N'nearestLandmark', N'Nearest Landmark', N'जवळचे ओळखण्याजोगे ठिकाण', N'text', N'Event & Venue Details', NULL, NULL, N'{"maxLength":200}', NULL, 11, NULL, NULL, 200, NULL, N'False', NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8294, 4, 62, N'eventStartDate', N'Event Start Date', N'कार्यक्रम सुरू होण्याची तारीख', N'date', N'Schedule & Dimensions', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8295, 4, 62, N'eventEndDate', N'Event End Date', N'कार्यक्रम समाप्तीची तारीख', N'date', N'Schedule & Dimensions', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8296, 4, 62, N'totalDays', N'Total Number of Days', N'एकूण दिवसांची संख्या', N'text', N'Schedule & Dimensions', NULL, NULL, N'{    "inputMode": "numeric",    "allow": "numeric",    "exactLength": 3,    "pattern": "^[2-9][0-9]{11}$",    "message": "Enter a valid 12-digit Aadhaar number."  }', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8297, 4, 62, N'mandapLengthFt', N'Mandap Length (feet)', N'मंडपाची लांबी (फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{    "inputMode": "numeric",    "allow": "numeric",    "exactLength": 5,    "pattern": "^[2-9][0-9]{11}$",    "message": "Enter a valid 12-digit Aadhaar number."  }', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8298, 4, 62, N'mandapWidthFt', N'Mandap Width (feet)', N'मंडपाची रुंदी (फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{    "inputMode": "numeric",    "allow": "numeric",    "exactLength": 5,    "pattern": "^[2-9][0-9]{11}$",    "message": "Enter a valid 12-digit Aadhaar number."  }', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8299, 4, 62, N'totalOccupiedAreaSqFt', N'Total Occupied Area (Sq. Ft.)', N'एकूण व्यापलेले क्षेत्रफळ (चौ. फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{    "inputMode": "numeric",    "allow": "numeric",    "exactLength": 5,    "pattern": "^[2-9][0-9]{11}$",    "message": "Enter a valid 12-digit Aadhaar number."  }', NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8300, 4, 62, N'loudspeakerUsage', N'Loudspeaker Usage', N'ध्वनिक्षेपकाचा वापर', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8301, 4, 62, N'liveFoodCookingInsidePandal', N'Live Food Cooking Inside Pandal', N'मंडपामध्ये प्रत्यक्ष अन्न शिजविण्यात येणार आहे का?', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8302, 4, 62, N'restrictsPublicTrafficFlow', N'Restricts Public Traffic Flow', N'सार्वजनिक वाहतुकीच्या प्रवाहास अडथळा होणार आहे का?', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8303, 4, 62, N'siteLayoutPlanDoc', N'Site Layout Plan / Sketch Map', N'स्थळ आराखडा / स्केच नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats":["pdf","jpg"],"accept":".pdf,.jpg","maxFileSizeMb":2}', NULL, 60, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T16:53:07.390', NULL, NULL),
    (8304, 4, 62, N'declaration', N'I hereby declare that the information provided is true and correct.', N'मी घोषित करतो / करते की दिलेली माहिती खरी व अचूक आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-27T17:05:27.567', NULL, NULL),
    (8305, 13, 162, N'Fathers/husbandname', N'Father / Husband Name', N'वडील / पतीचे नाव', N'text', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:43:39.547', NULL, NULL),
    (8306, 13, 162, N'Dateofbirth', N'Date of Birth', N'जन्मतारीख', N'Date', N'Applicant Details', NULL, NULL, N'{
  "minDate": "1900-01-01",
  "maxDate": "today"
}', NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:51:38.453', NULL, NULL),
    (8307, 13, 162, N'gender', N'Gender', N'लिंग', N'select', N'Applicant Details', N'[
  {
    "value": "male",
    "label": {
      "en": "Male",
      "hi": "?????",
      "mr": "?????"
    }
  },
  {
    "value": "female",
    "label": {
      "en": "Female",
      "hi": "?????",
      "mr": "?????"
    }
  },
  {
    "value": "transgender",
    "label": {
      "en": "Transgender",
      "hi": "???????????",
      "mr": "?????????"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "????",
      "mr": "???"
    }
  }
]', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:53:52.197', NULL, NULL),
    (8308, 13, 162, N'category', N'Category', N'प्रवर्ग', N'select', N'Applicant Details', N'[
  {
    "value": "General",
    "label": {
      "en": "General",
      "hi": "??????? ????",
      "mr": "?????????? ???????"
    }
  },
  {
    "value": "SC",
    "label": {
      "en": "SC (Scheduled Caste)",
      "hi": "???????? ????",
      "mr": "???????? ????"
    }
  },
  {
    "value": "ST",
    "label": {
      "en": "ST (Scheduled Tribe)",
      "hi": "???????? ??????",
      "mr": "???????? ?????"
    }
  },
  {
    "value": "OBC",
    "label": {
      "en": "OBC (Other Backward Class)",
      "hi": "???? ?????? ????",
      "mr": "??? ???????????"
    }
  },
  {
    "value": "VJNT",
    "label": {
      "en": "VJNT (Vimukta Jati and Nomadic Tribes)",
      "hi": "??????? ???? ??? ?????? ??????",
      "mr": "??????? ???? ? ?????? ?????"
    }
  }
]', NULL, NULL, N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:54:27.910', NULL, NULL),
    (8309, 13, 162, N'Mobileno', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Applicant Details', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:56:22.213', NULL, NULL),
    (8310, 13, 162, N'email', N'Email Address', N'ईमेल पत्ता', N'text', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', N'False', 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:56:57.097', NULL, NULL),
    (8311, 13, 162, N'aadharno', N'Aadhar Number', N'आधार क्रमांक', N'number', N'Applicant Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-27T19:58:18.433', NULL, NULL),
    (8312, 13, 162, N'houseno', N'House/Flat/Plot No', N'घर / सदनिका / भूखंड क्रमांक', N'text', N'Residential Address Details', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:02:58.740', NULL, NULL),
    (8313, 13, 162, N'buildingarea', N'Building / Area Name', N'इमारत / परिसराचे नाव', N'text', N'Residential Address Details', NULL, NULL, NULL, N'False', 2, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:03:55.270', NULL, NULL),
    (8314, 13, 162, N'city', N'City / District', N'शहर / जिल्हा', N'text', N'Residential Address Details', NULL, N'Akola', NULL, NULL, 2, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:08:26.633', NULL, NULL),
    (8315, 13, 162, N'pincode', N'PIN Code', N'पिन कोड', N'number', N'Residential Address Details', NULL, NULL, N'{
      "pattern": "^[1-9][0-9]{5}$",
      "minLength": 6,
      "maxLength": 6,
      "inputMode": "numeric",
      "message": "Please enter a valid 6-digit PIN code."
    }', NULL, 2, NULL, NULL, 6, NULL, N'False', NULL, NULL, '2026-08-28T11:09:19.913', NULL, NULL),
    (8316, 13, 162, N'natureofhawking', N'Nature of Hawking Activity', N'फेरीविक्रीच्या क्रियाकलापाचे स्वरूप', N'select', N'Vending / Hawking Details', N'[
  {
    "value": "mobile_roving_vending",
    "label": {
      "en": "Mobile / Roving Vending",
      "hi": "???? / ????? ????? ?????",
      "mr": "????? / ????? ??????"
    }
  },
  {
    "value": "stationary_static_vending",
    "label": {
      "en": "Stationary / Static Vending",
      "hi": "????? / ?? ????? ?? ????? ?????",
      "mr": "????? / ???? ?????? ??????"
    }
  }
]', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:11:17.027', NULL, NULL),
    (8317, 13, 162, N'categoryofgoods', N'Category of Goods Sold', N'विक्रीच्या वस्तूंची श्रेणी', N'select', N'Vending / Hawking Details', N'[
  {
    "value": "vegetables_fruits",
    "label": {
      "en": "Vegetables / Fruits",
      "hi": "???????? / ??",
      "mr": "???????? / ???"
    }
  },
  {
    "value": "fast_food_snacks",
    "label": {
      "en": "Fast Food / Snacks",
      "hi": "????? ??? / ??????",
      "mr": "????? ??? / ?????????"
    }
  },
  {
    "value": "garments",
    "label": {
      "en": "Garments",
      "hi": "?????",
      "mr": "????"
    }
  },
  {
    "value": "toys_general_items",
    "label": {
      "en": "Toys / General Items",
      "hi": "?????? / ??????? ???????",
      "mr": "????? / ??????? ?????"
    }
  },
  {
    "value": "books_stationery",
    "label": {
      "en": "Books / Stationery",
      "hi": "??????? / ???? ???????",
      "mr": "??????? / ???????????"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "????",
      "mr": "???"
    }
  }
]', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:12:22.490', NULL, NULL),
    (8318, 13, 162, N'itemdescription', N'Specific Item Description', N'विक्रीच्या वस्तूचे तपशीलवार वर्णन', N'text', N'Vending / Hawking Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:13:37.073', NULL, NULL),
    (8319, 13, 162, N'ward', N'Preferred Ward', N'प्राधान्याचा प्रभाग', N'select', N'Vending / Hawking Details', N'[
  {
    "value": "A1",
    "label": {
      "en": "A1",
      "hi": "A1",
      "mr": "A1"
    }
  },
  {
    "value": "A2",
    "label": {
      "en": "A2",
      "hi": "A2",
      "mr": "A2"
    }
  },
  {
    "value": "A3",
    "label": {
      "en": "A3",
      "hi": "A3",
      "mr": "A3"
    }
  },
  {
    "value": "A4",
    "label": {
      "en": "A4",
      "hi": "A4",
      "mr": "A4"
    }
  },
  {
    "value": "A5",
    "label": {
      "en": "A5",
      "hi": "A5",
      "mr": "A5"
    }
  },
  {
    "value": "A6",
    "label": {
      "en": "A6",
      "hi": "A6",
      "mr": "A6"
    }
  },
  {
    "value": "A7",
    "label": {
      "en": "A7",
      "hi": "A7",
      "mr": "A7"
    }
  },
  {
    "value": "A8",
    "label": {
      "en": "A8",
      "hi": "A8",
      "mr": "A8"
    }
  },
  {
    "value": "A9",
    "label": {
      "en": "A9",
      "hi": "A9",
      "mr": "A9"
    }
  },
  {
    "value": "A10",
    "label": {
      "en": "A10",
      "hi": "A10",
      "mr": "A10"
    }
  },
  {
    "value": "A11",
    "label": {
      "en": "A11",
      "hi": "A11",
      "mr": "A11"
    }
  },
  {
    "value": "B1",
    "label": {
      "en": "B1",
      "hi": "B1",
      "mr": "B1"
    }
  },
  {
    "value": "B2",
    "label": {
      "en": "B2",
      "hi": "B2",
      "mr": "B2"
    }
  },
  {
    "value": "B3",
    "label": {
      "en": "B3",
      "hi": "B3",
      "mr": "B3"
    }
  },
  {
    "value": "B4",
    "label": {
      "en": "B4",
      "hi": "B4",
      "mr": "B4"
    }
  },
  {
    "value": "B5",
    "label": {
      "en": "B5",
      "hi": "B5",
      "mr": "B5"
    }
  },
  {
    "value": "B6",
    "label": {
      "en": "B6",
      "hi": "B6",
      "mr": "B6"
    }
  },
  {
    "value": "B7",
    "label": {
      "en": "B7",
      "hi": "B7",
      "mr": "B7"
    }
  },
  {
    "value": "B8",
    "label": {
      "en": "B8",
      "hi": "B8",
      "mr": "B8"
    }
  },
  {
    "value": "B9",
    "label": {
      "en": "B9",
      "hi": "B9",
      "mr": "B9"
    }
  },
  {
    "value": "B10",
    "label": {
      "en": "B10",
      "hi": "B10",
      "mr": "B10"
    }
  },
  {
    "value": "B11",
    "label": {
      "en": "B11",
      "hi": "B11",
      "mr": "B11"
    }
  },
  {
    "value": "B12",
    "label": {
      "en": "B12",
      "hi": "B12",
      "mr": "B12"
    }
  },
  {
    "value": "B13",
    "label": {
      "en": "B13",
      "hi": "B13",
      "mr": "B13"
    }
  },
  {
    "value": "B14",
    "label": {
      "en": "B14",
      "hi": "B14",
      "mr": "B14"
    }
  },
  {
    "value": "C1",
    "label": {
      "en": "C1",
      "hi": "C1",
      "mr": "C1"
    }
  },
  {
    "value": "C2",
    "label": {
      "en": "C2",
      "hi": "C2",
      "mr": "C2"
    }
  },
  {
    "value": "C3",
    "label": {
      "en": "C3",
      "hi": "C3",
      "mr": "C3"
    }
  },
  {
    "value": "C4",
    "label": {
      "en": "C4",
      "hi": "C4",
      "mr": "C4"
    }
  },
  {
    "value": "C5",
    "label": {
      "en": "C5",
      "hi": "C5",
      "mr": "C5"
    }
  },
  {
    "value": "C6",
    "label": {
      "en": "C6",
      "hi": "C6",
      "mr": "C6"
    }
  },
  {
    "value": "C7",
    "label": {
      "en": "C7",
      "hi": "C7",
      "mr": "C7"
    }
  },
  {
    "value": "C8",
    "label": {
      "en": "C8",
      "hi": "C8",
      "mr": "C8"
    }
  },
  {
    "value": "C9",
    "label": {
      "en": "C9",
      "hi": "C9",
      "mr": "C9"
    }
  },
  {
    "value": "C10",
    "label": {
      "en": "C10",
      "hi": "C10",
      "mr": "C10"
    }
  },
  {
    "value": "C11",
    "label": {
      "en": "C11",
      "hi": "C11",
      "mr": "C11"
    }
  },
  {
    "value": "D1",
    "label": {
      "en": "D1",
      "hi": "D1",
      "mr": "D1"
    }
  },
  {
    "value": "D2",
    "label": {
      "en": "D2",
      "hi": "D2",
      "mr": "D2"
    }
  },
  {
    "value": "D3",
    "label": {
      "en": "D3",
      "hi": "D3",
      "mr": "D3"
    }
  },
  {
    "value": "D4",
    "label": {
      "en": "D4",
      "hi": "D4",
      "mr": "D4"
    }
  },
  {
    "value": "D5",
    "label": {
      "en": "D5",
      "hi": "D5",
      "mr": "D5"
    }
  },
  {
    "value": "D6",
    "label": {
      "en": "D6",
      "hi": "D6",
      "mr": "D6"
    }
  },
  {
    "value": "D7",
    "label": {
      "en": "D7",
      "hi": "D7",
      "mr": "D7"
    }
  },
  {
    "value": "D8",
    "label": {
      "en": "D8",
      "hi": "D8",
      "mr": "D8"
    }
  },
  {
    "value": "D9",
    "label": {
      "en": "D9",
      "hi": "D9",
      "mr": "D9"
    }
  },
  {
    "value": "D10",
    "label": {
      "en": "D10",
      "hi": "D10",
      "mr": "D10"
    }
  },
  {
    "value": "D11",
    "label": {
      "en": "D11",
      "hi": "D11",
      "mr": "D11"
    }
  },
  {
    "value": "D12",
    "label": {
      "en": "D12",
      "hi": "D12",
      "mr": "D12"
    }
  }
]', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:14:36.333', NULL, NULL),
    (8320, 13, 162, N'hawkinglocation', N'Exact Proposed Hawking Location / Landmark', N'प्रस्तावित फेरीविक्रीचे अचूक ठिकाण / जवळची खूण', N'text', N'Vending / Hawking Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:15:59.050', NULL, NULL),
    (8321, 13, 162, N'timingofbusiness', N'Timing of Business', N'व्यवसायाची वेळ', N'time', N'Vending / Hawking Details', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:17:06.103', NULL, NULL),
    (8322, 13, 162, N'equipment/structuretype', N'Equipment/Structure Type', N'उपकरण / संरचनेचा प्रकार', N'Select', N'Vending / Hawking Details', N'[
  {
    "value": "handcart_pushcart",
    "label": {
      "en": "Handcart / Pushcart",
      "hi": "???????? / ????",
      "mr": "??????? / ???????"
    }
  },
  {
    "value": "table_vend_box",
    "label": {
      "en": "Table / Vend-box",
      "hi": "??? / ?????? ????",
      "mr": "???? / ?????? ????"
    }
  },
  {
    "value": "basket_on_head",
    "label": {
      "en": "Basket on Head",
      "hi": "??? ?? ?????",
      "mr": "?????????? ?????"
    }
  },
  {
    "value": "sitting_on_pavement_cloth",
    "label": {
      "en": "Sitting on Pavement / Cloth",
      "hi": "?????? / ????? ?? ?????",
      "mr": "???????? / ??????? ????"
    }
  }
]', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:19:25.490', NULL, NULL),
    (8324, 13, 162, N'DOC_PASSPORT_PHOTO', N'Passport Size Photograph', N'पासपोर्ट आकाराचा फोटो', N'file', N'Document Uploads', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:23:18.217', NULL, NULL),
    (8325, 13, 162, N'DOC_RESIDENTIALPROOF', N'Residential Proof (Voter ID, Ration Card, or Electricity Bill)', N'रहिवासी पुरावा (मतदार ओळखपत्र, शिधापत्रिका किंवा वीज बिल)', N'file', N'Document Uploads', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:24:58.003', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    (8326, 13, 162, N'DOC_MEDICALCERTIFICATE', N'Medical Fitness Certificate / Health Certificate', N'वैद्यकीय तंदुरुस्ती प्रमाणपत्र / आरोग्य प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:26:05.387', NULL, NULL),
    (8327, 13, 162, N'declaration', N'I hereby declare that the information provided is true and correct.', N'मी याद्वारे घोषित करतो/करते की प्रदान केलेली माहिती सत्य आणि अचूक आहे.', N'Checkbox', N'Declaration', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-28T11:54:05.720', NULL, NULL),
    (9281, 1, 147, N'DOC_APPLICANT_ID_147', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.570', NULL, NULL),
    (9282, 1, 149, N'DOC_APPLICANT_ID_149', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.580', NULL, NULL),
    (9283, 1, 151, N'DOC_APPLICANT_ID_151', N'Applicant ID Proof (Aadhaar / Voter ID)', N'अर्जदाराचा ओळख पुरावा (आधार / मतदार ओळखपत्र)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.587', NULL, NULL),
    (9284, 2, 26, N'DOC_APPLICANT_ID_26', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.300', NULL, NULL),
    (9285, 2, 81, N'DOC_APPLICANT_ID_81', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.377', NULL, NULL),
    (9286, 2, 83, N'DOC_APPLICANT_ID_83', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.387', NULL, NULL),
    (9287, 2, 84, N'DOC_APPLICANT_ID_84', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.393', NULL, NULL),
    (9288, 3, 33, N'DOC_NOC_CERTIFICATE_33', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.317', NULL, NULL),
    (9289, 3, 36, N'DOC_NOC_CERTIFICATE_36', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.330', NULL, NULL),
    (9290, 3, 140, N'DOC_APPLICANT_ID_140', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.510', NULL, NULL),
    (9291, 3, 140, N'DOC_NOC_CERTIFICATE_140', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.513', NULL, NULL),
    (9292, 3, 141, N'DOC_NOC_CERTIFICATE_141', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.523', NULL, NULL),
    (9293, 3, 142, N'DOC_NOC_CERTIFICATE_142', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.530', NULL, NULL),
    (9294, 3, 143, N'DOC_NOC_CERTIFICATE_143', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.540', NULL, NULL),
    (9295, 3, 144, N'DOC_APPLICANT_ID_144', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.543', NULL, NULL),
    (9296, 3, 144, N'DOC_NOC_CERTIFICATE_144', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 0, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.547', NULL, NULL),
    (9297, 4, 61, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (9299, 4, 62, N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'कार्यक्रमानंतर परिसर स्वच्छ करण्याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9302, 4, 62, N'fireStation', N'Nearest Fire Station', N'जवळचे अग्निशमन केंद्र', N'select', N'Applicant Undertaking & Compliance', N'[
  {
    "value": "Akola Municipal Corporation Fire Station",
    "label": {
      "en": "Akola Municipal Corporation Fire Station",
      "hi": "????? ??? ???? ???????? ??????",
      "mr": "????? ???????????? ???????? ??????"
    }
  }
]', NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9308, 4, 62, N'mandapLayoutDoc', N'Local Police Station NOC', N'मंडप स्थळाचा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', NULL, 60, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (9309, 4, 62, N'mandapType', N'Mandap Type', N'मंडपाचा प्रकार', N'select', N'Schedule & Dimensions', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9311, 4, 62, N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'सार्वजनिक मालमत्तेचे कोणतेही नुकसान होणार नाही याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, NULL, 57, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9314, 4, 62, N'policeStation', N'Concerned Police Station', N'संबंधित पोलीस स्टेशन', N'select', N'Applicant Undertaking & Compliance', N'[
  {
    "value": "City Kotwali Police Station",
    "label": {
      "en": "City Kotwali Police Station",
      "hi": "???? ??????? ????? ??????",
      "mr": "???? ??????? ????? ??????"
    }
  },
  {
    "value": "Ramdaspeth Police Station",
    "label": {
      "en": "Ramdaspeth Police Station",
      "hi": "????????? ????? ??????",
      "mr": "????????? ????? ??????"
    }
  },
  {
    "value": "Civil Lines Police Station",
    "label": {
      "en": "Civil Lines Police Station",
      "hi": "??????? ?????? ????? ??????",
      "mr": "??????? ?????? ????? ??????"
    }
  },
  {
    "value": "Old City Police Station",
    "label": {
      "en": "Old City Police Station",
      "hi": "?????? ??? ????? ??????",
      "mr": "???? ??? ????? ??????"
    }
  },
  {
    "value": "Akot File Police Station",
    "label": {
      "en": "Akot File Police Station",
      "hi": "???? ???? ????? ??????",
      "mr": "???? ???? ????? ??????"
    }
  },
  {
    "value": "Khadan Police Station",
    "label": {
      "en": "Khadan Police Station",
      "hi": "???? ????? ??????",
      "mr": "???? ????? ??????"
    }
  },
  {
    "value": "Dabki Road Police Station",
    "label": {
      "en": "Dabki Road Police Station",
      "hi": "????? ??? ????? ??????",
      "mr": "????? ??? ????? ??????"
    }
  },
  {
    "value": "MIDC Police Station",
    "label": {
      "en": "MIDC Police Station",
      "hi": "??.??.??.??. ????? ??????",
      "mr": "??.??.??.??. ????? ??????"
    }
  }
]', NULL, NULL, NULL, 54, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9317, 5, 53, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (9318, 5, 54, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (9319, 6, 55, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (9320, 8, 63, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9321, 8, 64, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9322, 9, 65, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (9323, 13, 162, N'DOC_NOC_CERTIFICATE_162', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.770', NULL, NULL),
    (9324, 13, 162, N'DOC_RENT_AGREEMENT_162', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, N'False', 5, NULL, NULL, NULL, NULL, N'False', NULL, NULL, '2026-08-17T13:01:13.763', NULL, NULL),
    (9325, 4, 62, N'idproof', N'Identity Proof', N'ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, N'False', NULL, 0, '2026-08-29T13:42:10.413', NULL, NULL)
) AS source ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceId] = source.[ServiceId],
        target.[FieldCode] = source.[FieldCode],
        target.[FieldLabel] = source.[FieldLabel],
        target.[FieldLabelLocal] = source.[FieldLabelLocal],
        target.[FieldType] = source.[FieldType],
        target.[FieldGroup] = source.[FieldGroup],
        target.[OptionsJson] = source.[OptionsJson],
        target.[DefaultValue] = source.[DefaultValue],
        target.[ValidationRules] = source.[ValidationRules],
        target.[IsRequired] = ISNULL(source.[IsRequired], 0),
        target.[DisplayOrder] = ISNULL(source.[DisplayOrder], 0),
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], ISNULL(source.[IsRequired], 0), source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], ISNULL(source.[IsActive], 1), ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [RTS].[FieldDefinition] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[ApprovalFlowMaster] (65 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] ON;
GO
MERGE INTO [RTS].[ApprovalFlowMaster] AS target
USING (VALUES
    (36, 43, N'Issuance of Zone Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (37, 44, N'Giving Part Map Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (38, 45, N'Issuance of Construction Permit Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (39, 46, N'Issuance of plinth certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (40, 47, N'Issuance of Occupancy Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (41, 48, N'Underground OFC Cable Permission Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (42, 49, N'Filling Potholes on City Roads Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (43, 50, N'Maintaining & Securing Sewer Covers Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (44, 53, N'Birth Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (45, 54, N'Death Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (46, 55, N'School Leaving / Duplicate Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (47, 56, N'Issuance of transfer certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (48, 57, N'Issuance of duplicate mark sheet Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (49, 58, N'Nursing home license under Registration Act, 1949 Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (50, 59, N'Renewal of nursing home license Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (51, 60, N'Change of nursing home license holder / partner name Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (52, 61, N'Trade / Business / Storage Non-Revocation NOC Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (53, 62, N'Mandap NOC Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (54, 63, N'Issuance of Fire Safety NOC Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (55, 64, N'Issuance of Final Fire Exemption Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (56, 65, N'Marriage Registration Certificate Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (57, 66, N'Tree Felling Permission (Sec 8) Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (58, 68, N'Maintaining cleanliness Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (59, 69, N'Providing drainage connections Default Workflow', NULL, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (1006, 19, N'Change of Water Connection Usage Type Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1007, 20, N'Preparation of Water Bill Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1008, 26, N'Complaint Regarding Water Pressure Capacity Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1009, 33, N'Changing Occupations / Business Type Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1010, 36, N'Cancellation of License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1011, 80, N'Provision of New Water Tap Connection Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1012, 81, N'Changing the Water Connection Size Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1013, 82, N'Temporary / Permanent Disconnection of Water Connection Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1014, 83, N'Reconnection of Water Tap Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1015, 84, N'Water Bill No Dues Certificate Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1016, 85, N'Complaint Regarding Faulty Water Meter Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1017, 86, N'Complaint Regarding Unauthorized Water Tap Connection Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1018, 87, N'Complaint Regarding Water Quality Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1019, 100, N'Issuance of Plumber License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1020, 101, N'Renewal of Plumber License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1021, 137, N'Obtaining New Trade License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1022, 138, N'Renewal of Trade License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1023, 139, N'Transfer of Trade License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1024, 140, N'Duplicate Copy of Trade License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1025, 141, N'Change of Business Name / Establishment / Address Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1026, 142, N'Change of License Holder / Partner Name Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1027, 143, N'Change in Number of Partners (Increase/Decrease) Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1028, 144, N'Notice on Renewal of Expired License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1029, 145, N'New Property Tax Assessment Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1030, 146, N'Re-Assessment of Property Tax Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1031, 147, N'Preparation of Tax Demand Notice Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1032, 148, N'Avail Property Tax Exemption Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1033, 149, N'Tax Exemption for Non-Resident Properties Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1034, 150, N'Property Tax Self-Assessment Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1035, 151, N'Registration of Objection on Tax Assessment Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1036, 152, N'Sub-division of Property Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1037, 153, N'Re-assessment After Demolition and Reconstruction Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1038, 154, N'Issuance of Property Tax Assessment Copy (8A) Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1039, 155, N'Issuance of No Dues Certificate Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1040, 156, N'Property Transfer Registration Certificate Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1041, 157, N'Change of Ownership Name Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1042, 158, N'Issuance of Lodging House License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1043, 159, N'Renewal of Lodging House License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1044, 160, N'Issuance of Marriage Hall / Auditorium License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1045, 161, N'Renewal of Marriage Hall / Auditorium License Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1046, 162, N'Issuance of Hawker Registration Certificate Default Workflow', NULL, 0, '2026-08-12T19:17:56.673', NULL, NULL)
) AS source ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[ApprovalFlowName] = source.[ApprovalFlowName],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ServiceId], source.[ApprovalFlowName], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[ApprovalFlowStageMaster] (198 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] ON;
GO
MERGE INTO [RTS].[ApprovalFlowStageMaster] AS target
USING (VALUES
    (1077, 36, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1078, 37, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1079, 38, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1080, 39, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1081, 40, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1082, 41, 1, N'Ass. Town Planner', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1083, 42, 1, N'Ass. Town Planner', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1084, 43, 1, N'Ass. Town Planner', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1085, 44, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1086, 45, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1087, 46, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1088, 47, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1089, 48, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1090, 49, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1091, 50, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1092, 51, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1093, 52, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1094, 53, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1095, 54, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1096, 55, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1097, 56, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1098, 57, 1, N'Zone Officer', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1099, 58, 1, N'Clerk', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1100, 59, 1, N'Junior Engineer', 1, 3, NULL, N'False', N'False', NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (1101, 36, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1102, 37, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1103, 38, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1104, 39, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1105, 40, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1106, 41, 2, N'Ass. Town Planner', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1107, 42, 2, N'Ass. Town Planner', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1108, 43, 2, N'Ass. Town Planner', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1109, 44, 2, N'Senior Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1110, 45, 2, N'Senior Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1111, 46, 2, N'Education Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1112, 47, 2, N'Education Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1113, 48, 2, N'Education Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1114, 49, 2, N'Sanitary Inspector', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1115, 50, 2, N'Sanitary Inspector', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1116, 51, 2, N'Sanitary Inspector', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1117, 52, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1118, 53, 2, N'Junior Engineer', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1119, 54, 2, N'Fire Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1120, 55, 2, N'Fire Officer', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1121, 56, 2, N'Senior Clerk', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1122, 57, 2, N'Clerk', 2, 4, N'False', NULL, NULL, NULL, N'False', N'False', N'False', NULL, N'False', N'False'),
    (1123, 58, 2, N'Sanitary Inspector', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1124, 59, 2, N'Ass. Town Planner', 2, 4, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1125, 36, 3, N'Assistant Town Planner', 3, 2, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1126, 37, 3, N'Assistant Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False')
) AS source ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ApprovalFlowId] = source.[ApprovalFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[CanPay] = ISNULL(source.[CanPay], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0),
        target.[CanViewNoteSheet] = ISNULL(source.[CanViewNoteSheet], 0),
        target.[CanIssueCertificate] = ISNULL(source.[CanIssueCertificate], 0),
        target.[CanEditCertificate] = ISNULL(source.[CanEditCertificate], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
    VALUES (source.[Id], source.[ApprovalFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[CanPay], 0), ISNULL(source.[IsFinalStage], 0), source.[CanEdit], ISNULL(source.[CanViewNoteSheet], 0), ISNULL(source.[CanIssueCertificate], 0), ISNULL(source.[CanEditCertificate], 0));
GO

MERGE INTO [RTS].[ApprovalFlowStageMaster] AS target
USING (VALUES
    (1127, 38, 3, N'Assistant Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1128, 39, 3, N'Assistant Town Planner', 3, 2, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1129, 40, 3, N'Assistant Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1131, 49, 3, N'Medical Officer', 3, 5, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1132, 57, 3, N'Deputy Commissioner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (1133, 59, 3, N'Ass. Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (2077, 1029, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2078, 1029, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2079, 1029, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2080, 1029, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2081, 1030, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2082, 1030, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2083, 1030, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2084, 1030, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2085, 1031, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2086, 1031, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2087, 1031, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2088, 1031, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2089, 1032, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2090, 1032, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2091, 1032, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2092, 1032, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2093, 1033, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2094, 1033, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2095, 1033, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2096, 1033, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2097, 1034, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2098, 1034, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2099, 1034, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2100, 1034, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2101, 1035, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2102, 1035, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2103, 1035, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2104, 1035, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2105, 1036, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2106, 1036, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2107, 1036, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2108, 1036, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2109, 1037, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2110, 1037, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2111, 1037, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2112, 1037, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2113, 1038, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2114, 1038, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2115, 1038, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2116, 1038, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2117, 1039, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2118, 1039, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2119, 1039, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2120, 1039, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False')
) AS source ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ApprovalFlowId] = source.[ApprovalFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[CanPay] = ISNULL(source.[CanPay], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0),
        target.[CanViewNoteSheet] = ISNULL(source.[CanViewNoteSheet], 0),
        target.[CanIssueCertificate] = ISNULL(source.[CanIssueCertificate], 0),
        target.[CanEditCertificate] = ISNULL(source.[CanEditCertificate], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
    VALUES (source.[Id], source.[ApprovalFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[CanPay], 0), ISNULL(source.[IsFinalStage], 0), source.[CanEdit], ISNULL(source.[CanViewNoteSheet], 0), ISNULL(source.[CanIssueCertificate], 0), ISNULL(source.[CanEditCertificate], 0));
GO

MERGE INTO [RTS].[ApprovalFlowStageMaster] AS target
USING (VALUES
    (2121, 1040, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2122, 1040, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2123, 1040, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2124, 1040, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2125, 1041, 1, N'Ward Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2126, 1041, 2, N'Ass. Town Planner', 2, 1, NULL, N'False', NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2127, 1041, 3, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2128, 1041, 4, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2129, 1006, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2130, 1006, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2131, 1006, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2132, 1007, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2133, 1007, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2134, 1007, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2135, 1008, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2136, 1008, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2137, 1008, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2138, 1011, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2139, 1011, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2140, 1011, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2141, 1012, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2142, 1012, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2143, 1012, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2144, 1013, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2145, 1013, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2146, 1013, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2147, 1014, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2148, 1014, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2149, 1014, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2150, 1015, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2151, 1015, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2152, 1015, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2153, 1016, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2154, 1016, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2155, 1016, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2156, 1017, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2157, 1017, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2158, 1017, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2159, 1018, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2160, 1018, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2161, 1018, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2162, 1019, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2163, 1019, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2164, 1019, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2165, 1020, 1, N'Junior Engineer', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2166, 1020, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2167, 1020, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2168, 1009, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2169, 1009, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2170, 1009, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False')
) AS source ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ApprovalFlowId] = source.[ApprovalFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[CanPay] = ISNULL(source.[CanPay], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0),
        target.[CanViewNoteSheet] = ISNULL(source.[CanViewNoteSheet], 0),
        target.[CanIssueCertificate] = ISNULL(source.[CanIssueCertificate], 0),
        target.[CanEditCertificate] = ISNULL(source.[CanEditCertificate], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
    VALUES (source.[Id], source.[ApprovalFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[CanPay], 0), ISNULL(source.[IsFinalStage], 0), source.[CanEdit], ISNULL(source.[CanViewNoteSheet], 0), ISNULL(source.[CanIssueCertificate], 0), ISNULL(source.[CanEditCertificate], 0));
GO

MERGE INTO [RTS].[ApprovalFlowStageMaster] AS target
USING (VALUES
    (2171, 1010, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2172, 1010, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2173, 1010, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2174, 1021, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2175, 1021, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2176, 1021, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2177, 1022, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2178, 1022, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2179, 1022, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2180, 1023, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2181, 1023, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2182, 1023, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2183, 1024, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2184, 1024, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2185, 1024, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2186, 1025, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2187, 1025, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2188, 1025, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2189, 1026, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2190, 1026, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2191, 1026, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2192, 1027, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2193, 1027, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2194, 1027, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2195, 1028, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2196, 1028, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2197, 1028, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2198, 1042, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2199, 1042, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2200, 1042, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2201, 1043, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2202, 1043, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2203, 1043, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2204, 1044, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2205, 1044, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2206, 1044, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2207, 1045, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2208, 1045, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2209, 1045, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2210, 1046, 1, N'Clerk', 1, 1, NULL, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False'),
    (2211, 1046, 2, N'Ass. Town Planner', 3, 1, NULL, NULL, NULL, NULL, N'False', N'False', N'False', N'False', N'False', N'False'),
    (2212, 1046, 3, N'Ass. Town Planner', 4, 1, N'False', NULL, NULL, NULL, N'False', NULL, N'False', N'False', N'False', N'False'),
    (2213, 50, 3, N'Medical Officer', 3, 5, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (2214, 51, 3, N'Medical Officer', 3, 5, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (2215, 54, 3, N'Chief Fire Officer', 3, 5, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (2216, 55, 3, N'Chief Fire Officer', 3, 5, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (3077, 52, 3, N'Assistant Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False'),
    (3078, 53, 3, N'Assistant Town Planner', 3, 3, N'False', NULL, NULL, NULL, N'False', NULL, N'False', NULL, N'False', N'False')
) AS source ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ApprovalFlowId] = source.[ApprovalFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[CanPay] = ISNULL(source.[CanPay], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0),
        target.[CanViewNoteSheet] = ISNULL(source.[CanViewNoteSheet], 0),
        target.[CanIssueCertificate] = ISNULL(source.[CanIssueCertificate], 0),
        target.[CanEditCertificate] = ISNULL(source.[CanEditCertificate], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanEditCertificate])
    VALUES (source.[Id], source.[ApprovalFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[CanPay], 0), ISNULL(source.[IsFinalStage], 0), source.[CanEdit], ISNULL(source.[CanViewNoteSheet], 0), ISNULL(source.[CanIssueCertificate], 0), ISNULL(source.[CanEditCertificate], 0));
GO

SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[AppealTypeMaster] (3 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] ON;
GO
MERGE INTO [RTS].[AppealTypeMaster] AS target
USING (VALUES
    (1, N'Rejected', N'REJECTED', NULL, '2026-08-11T12:21:38.987'),
    (2, N'Disagreed', N'DISAGREED', NULL, '2026-08-11T12:21:38.987'),
    (3, N'SLA Due', N'SLA_DUE', NULL, '2026-08-11T12:21:38.987')
) AS source ([Id], [AppealTypeName], [Code], [IsActive], [CreatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[AppealTypeName] = source.[AppealTypeName],
        target.[Code] = source.[Code],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [AppealTypeName], [Code], [IsActive], [CreatedDate])
    VALUES (source.[Id], source.[AppealTypeName], source.[Code], ISNULL(source.[IsActive], 1), source.[CreatedDate]);
GO

SET IDENTITY_INSERT [RTS].[AppealTypeMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[AppealFlowMaster] (10 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AppealFlowMaster] ON;
GO
MERGE INTO [RTS].[AppealFlowMaster] AS target
USING (VALUES
    (1, 53, N'Birth Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (2, 54, N'Death Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (3, 65, N'Marriage Registration Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (4, 43, N'Zone Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (5, 44, N'Part Map Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (6, 45, N'Construction Permit Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (7, 46, N'Plinth Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (8, 47, N'Occupancy Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (9, 63, N'Fire Safety NOC Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL),
    (10, 64, N'Final Fire Exemption Certificate Appeal Workflow', NULL, 0, '2026-08-04T17:32:58.053', NULL, NULL)
) AS source ([Id], [ServiceId], [AppealFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[AppealFlowName] = source.[AppealFlowName],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [AppealFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ServiceId], source.[AppealFlowName], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO

SET IDENTITY_INSERT [RTS].[AppealFlowMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[AppealFlowStageMaster] (68 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] ON;
GO
MERGE INTO [RTS].[AppealFlowStageMaster] AS target
USING (VALUES
    (1, 1, 1, N'Assistant Health Executive Officer', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (2, 1, 2, N'Health Executive Officer (MOH)', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (3, 2, 1, N'Assistant Health Executive Officer', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (4, 2, 2, N'Health Executive Officer (MOH)', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (5, 3, 1, N'Deputy Commissioner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (6, 3, 2, N'Divisional Officer', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (7, 4, 1, N'Town Planner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (8, 4, 2, N'Assistant Director of Town Planning', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (9, 5, 1, N'Town Planner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (10, 5, 2, N'Assistant Director of Town Planning', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (11, 6, 1, N'Town Planner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (12, 6, 2, N'Assistant Director of Town Planning / Executive Engineer / City Engineer', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (13, 7, 1, N'Town Planner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (14, 7, 2, N'Assistant Director of Town Planning', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (15, 8, 1, N'Town Planner', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (16, 8, 2, N'Assistant Director of Town Planning', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (17, 9, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (18, 9, 2, N'Deputy Commissioner (Fire)', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (19, 10, 1, N'Chief Fire Officer / Deputy Fire Officer', NULL, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (20, 10, 2, N'Deputy Commissioner (Fire)', NULL, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1050, 36, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1051, 36, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1052, 37, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1053, 37, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1054, 38, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1055, 38, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1056, 39, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1057, 39, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1058, 40, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1059, 40, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1060, 41, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1061, 41, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1062, 42, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1063, 42, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1064, 43, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1065, 43, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1066, 44, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1067, 44, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1068, 45, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1069, 45, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1070, 46, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1071, 46, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1072, 47, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1073, 47, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1074, 48, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1075, 48, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1076, 49, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1077, 49, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1078, 50, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1079, 50, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False')
) AS source ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[AppealFlowId] = source.[AppealFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
    VALUES (source.[Id], source.[AppealFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[IsFinalStage], 0), ISNULL(source.[CanEdit], 0));
GO

MERGE INTO [RTS].[AppealFlowStageMaster] AS target
USING (VALUES
    (1080, 51, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1081, 51, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1082, 52, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1083, 52, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1084, 53, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1085, 53, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1086, 54, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1087, 54, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1088, 55, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1089, 55, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1090, 56, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1091, 56, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1092, 57, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1093, 57, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1094, 58, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1095, 58, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False'),
    (1096, 59, 1, N'First Appellate Officer (neha Puri)', 2004, 30, N'False', NULL, NULL, N'False', N'False', N'False'),
    (1097, 59, 2, N'Second Appellate Officer (test Puri)', 2005, 45, N'False', NULL, NULL, N'False', NULL, N'False')
) AS source ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[AppealFlowId] = source.[AppealFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = ISNULL(source.[SLADays], 3),
        target.[CanVerifyDocument] = ISNULL(source.[CanVerifyDocument], 0),
        target.[CanApprove] = ISNULL(source.[CanApprove], 0),
        target.[CanReject] = ISNULL(source.[CanReject], 0),
        target.[CanReturn] = ISNULL(source.[CanReturn], 0),
        target.[IsFinalStage] = ISNULL(source.[IsFinalStage], 0),
        target.[CanEdit] = ISNULL(source.[CanEdit], 0)
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [IsFinalStage], [CanEdit])
    VALUES (source.[Id], source.[AppealFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], ISNULL(source.[CanVerifyDocument], 0), ISNULL(ISNULL(source.[CanApprove], 0), 1), ISNULL(ISNULL(source.[CanReject], 0), 1), ISNULL(source.[CanReturn], 0), ISNULL(source.[IsFinalStage], 0), ISNULL(source.[CanEdit], 0));
GO

SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[CertificateTemplateMaster] (12 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[CertificateTemplateMaster] ON;
GO
MERGE INTO [RTS].[CertificateTemplateMaster] AS target
USING (VALUES
    (1, 43, N'झोन दाखला देणे अधिकृत प्रमाणपत्र दाखला', N'CERT_43', NULL, N'
      <div class=''official-certificate-sheet p-6 md:p-8 bg-white border-[5px] border-double border-slate-900 relative shadow-sm transition-all'' style=''min-height: 297mm;''>
        <!-- Dynamic ULB Logo Background Watermark -->
        <div class=''absolute inset-0 flex items-center justify-center pointer-events-none z-0 overflow-hidden''>
                 <img src=''/logo.png'' alt=''ULB Watermark'' style=''opacity: 0.06;'' class=''w-72 h-72 object-contain filter grayscale'' onerror="this.style.display=''none''"/>
               </div>

            <div class=''header-letterhead relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

              <div class=''flex justify-between items-center font-mono mb-1 opacity-80'' style=''font-size: 0.75em;''><div>RTS/2026/DOC-VERIFIED</div><div>{{ApplicationNo}}</div></div>
              <div class=''flex items-center justify-between gap-4''>
                <div class=''shrink-0 text-left'' style=''width: 85px;''><img src=''/logo.png'' alt=''ULB Logo'' style=''max-height: 75px; max-width: 75px;'' class=''object-contain'' onerror="this.style.display=''none''"/><div style=''font-size: 0.72em; font-weight: bold; margin-top: 2px; text-align: left; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div></div>
                <div class=''flex-1 text-center'' style=''text-align: center !important;''>
                  <div style=''font-size: 1.45em; font-weight: bold; font-family: inherit; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
                  <div style=''font-size: 1.05em; font-weight: bold; margin-top: 2px; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>नगर रचना</div>
                  <div style=''font-size: 0.85em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>एम. जी. रोड, न्यू राधाकिसन प्लॉट्स, ओपन थिएटरजवळ, फार्या हाइट्ससमोर, गणेश नगर, अकोला, महाराष्ट्र – ४४४००१</div>
                  <div style=''font-size: 0.8em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>ई-मेल - akolamc@gmail.com</div>
                </div>
                <div class=''shrink-0'' style=''width: 85px;''></div>
              </div>
              <div class=''w-full border-b-2 border-current mt-2 mb-2''></div>
            </div>

            <div class=''dispatch-bar flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 4px !important; padding-bottom: 4px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 8px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>जा.क्र. मनपा/आर.टी.एस./२०२६/{{ApplicationNo}}</div>
              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>दिनांक: {{ApprovalDate}}</div>
            </div>

            <div class=''recipient-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>प्रति,</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantName}}</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantAddress}}</div>
              <div style=''padding-left: 1.5rem; font-family: monospace; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantMobile}}</div>
            </div>

            <div class=''subject-ref-block relative z-10 transition-all  relative''  style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''margin-bottom: 0.25rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>विषय :- झोन दाखला देणे बाबत अधिकृत प्रमाणपत्र पुरविणेबाबत.</div>
              <div style=''opacity: 0.95; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>संदर्भ :- आपला ऑनलाईन RTS अर्ज क्र. {{ApplicationNo}} दिनांक {{ApplicationDate}}</div>
            </div>

            <div class=''salutation-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 2px !important; padding-bottom: 2px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 6px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>महोदय / महोदया,</div>
            </div>

            <div class=''narrative-body relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 12px !important;  ''>

              <p style=''text-indent: 2rem; margin-bottom: 0.5em; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>नगररचना व विकास योजना नियमांनुसार सादर केलेल्या झोन दाखला अर्जाची (अर्ज क्र. {{ApplicationNo}} दि. {{ApplicationDate}}) नगररचना विभागामार्फत पडताळणी करण्यात आली आहे.</p>
              <p style=''text-indent: 2rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अधिकृत नगररचना अभिलेखानुसार सदर जागेचा झोन तपशील दाखला {{ApplicantName}} (जागा: {{ApplicantAddress}}) यांना दिनांक {{ApprovalDate}} रोजी निर्गमित करण्यात येत आहे.</p>
            </div>

            {{OfficerFieldsBlock}}

              <div class=''conditions-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

                <div style=''margin-bottom: 0.5rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>शर्ती व अटी:</div>
                <ol style=''list-style-type: decimal; padding-left: 1.5rem; display: flex; flex-direction: column; gap: 0.35rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                  <li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सदर दाखला केवळ विकास योजना व नगररचना नियमावलीच्या अनुषंगाने माहितीस्तव जारी केला आहे.</li><li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सदर दाखल्यावरून जागेच्या मालकी हक्काचा किंवा कब्जेवहिवाटीचा कोणताही दावा करता येणार नाही.</li>
                  {{CustomConditionsList}}
                </ol>
              </div>

            <div class=''custom-text-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important; background-color: #f8fafc !important; border: 1px solid #94a3b8; border-radius: 10px; box-shadow: 0 1px 2px rgba(0,0,0,0.05);''>

              <div style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून ९० दिवसांपर्यंत ग्राह्य धरता येईल.</div>
            </div>

            <div class=''signature-stamp-block flex justify-between items-end gap-4 relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 10px !important; padding-bottom: 10px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 14px !important;  ''>

              <div class=''left-sign text-center'' style=''font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                <div class=''h-12 flex items-center justify-center italic border-b border-slate-400 pb-1'' style=''font-family: Georgia, serif; font-size: 1.1em;''>
                  {{ApprovalDate}}
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>लिपिक / शाखा प्रमुख</div>
              </div>

              <div class=''center-seal text-center''>
                <div class=''official-seal-stamp inline-block text-center''><img src=''/images/ulb-seal.png'' alt=''Official Seal'' style=''width: 105px; height: 105px;'' class=''object-contain transform -rotate-6 filter drop-shadow-xs inline-block'' onerror="this.style.display=''none''"/></div>
              </div>

              <div class=''right-digital-sign text-right''>
                <div class=''digital-signature-card bg-emerald-50/95 border-2 border-emerald-600 p-2.5 rounded-lg text-left inline-block shadow-xs min-w-[220px]'' style=''font-size: 0.85em; line-height: 1.4;''>
                  <div class=''flex items-center gap-1.5 text-emerald-900 font-bold pb-1 border-b border-emerald-300 mb-1'' style=''font-size: 0.9em;''>
                    <span class=''text-emerald-700 font-bold''>✔</span>
                    <span>Digitally Signed (DSC Verified)</span>
                  </div>
                  <div class=''font-bold text-slate-950''>{{OfficerName}}</div>
                  <div class=''text-slate-800'' style=''font-size: 0.9em;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                  <div class=''text-slate-600 font-mono mt-0.5'' style=''font-size: 0.85em;''>Date: {{ApprovalDate}} IST</div>
                  <div class=''text-emerald-800 font-bold mt-1 flex items-center gap-1'' style=''font-size: 0.85em;''>
                    <span>🔒</span> <span>e-Sign Verified & Authentic</span>
                  </div>
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.95em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                <div style=''font-size: 0.85em; opacity: 0.9; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
              </div>
            </div>

            <div class=''security-footer-block border-t border-slate-400 flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 8px !important;  ''>

              <div class=''flex items-center gap-2''>
                <div class=''inline-flex flex-col items-center justify-center p-1 bg-white border border-slate-300 rounded shadow-xs text-center'' style=''width: 70px;''>
                  <div style=''width: 55px; height: 55px;'' class=''flex items-center justify-center bg-white''>
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https%3A%2F%2Fakolacity.gov.in%2Fverify-certificate%3FappNo%3D%7B%7BApplicationNo%7D%7D" alt="QR Verification" class="w-full h-full object-contain" />
                  </div>
                  <span class=''text-slate-600 mt-0.5 font-bold'' style=''font-size: 8px;''>Scan to Verify</span>
                </div>
                <div class=''font-mono tracking-widest font-bold'' style=''font-size: 9px;''>||||||||||||||||||||||</div>
              </div>
              <div class=''text-center max-w-md opacity-90'' style=''font-size: 9px; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीने जारी केलेले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</div>
            </div>

            <div class=''footer-file-path-block mt-4 pt-1 border-t-2 border-current font-mono font-bold'' style=''font-size: 0.8em; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
              D:\अकोला महानगरपालिका अकोला\नगर रचना\Certificate
            </div>
          </div>', NULL, N'["सदर दाखला केवळ विकास योजना व नगररचना नियमावलीच्या अनुषंगाने माहितीस्तव जारी केला आहे.","सदर दाखल्यावरून जागेच्या मालकी हक्काचा किंवा कब्जेवहिवाटीचा कोणताही दावा करता येणार नाही."]', N'[{"fieldKey":"InspectionRemark","fieldLabelMarathi":"स्थळ पाहणी व छाननी शेरा","fieldLabelEnglish":"Site Inspection & Verification Remark","fieldType":"textarea","isMandatory":false},{"fieldKey":"SpecificValidityNote","fieldLabelMarathi":"विशेष वैधता नोंद","fieldLabelEnglish":"Special Validity Note","fieldType":"text","isMandatory":false}]', NULL, NULL, '2026-08-26T15:03:44.843', 3, '2026-08-28T15:15:51.093', N'False', NULL),
    (6, 55, N'विद्यार्थ्याचा शाळा सोडल्याचा दाखला (School Leaving Certificate)', N'CERT_SCHOOL_LEAVING', NULL, N'<div class="certificate-body space-y-3 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, शाळेतील जनरल रजिस्टर (G.R.) मधील अधिकृत नोंदीनुसार खालील विद्यार्थ्याचा <strong>शाळा सोडल्याचा दाखला (School Leaving Certificate)</strong> प्रमाणित करून देण्यात येत आहे:</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-2 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2 font-bold text-slate-700 w-1/3 border-r border-slate-200">जनरल रजिस्टर (G.R.) क्र.:</td>
                <td class="p-2 font-bold text-slate-900 font-mono">[[GRNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">विद्यार्थ्याचे संपूर्ण नाव:</td>
                <td class="p-2 font-bold text-slate-900">{{ApplicantName}}</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">आईचे नाव (Mother''s Name):</td>
                <td class="p-2 text-slate-800">[[MotherName]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">धर्म व जात/प्रवर्ग (Caste):</td>
                <td class="p-2 text-slate-800">[[CasteCategory]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">जन्मस्थान व राष्ट्रीयत्व:</td>
                <td class="p-2 text-slate-800">[[BirthPlace]] (भारतीय)</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">जन्मतारीख (अंकात व अक्षरात):</td>
                <td class="p-2 text-slate-800"><strong>[[DOB]]</strong> ([[DOBWords]])</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">दाखल दिनांक व इयत्ता:</td>
                <td class="p-2 text-slate-800">[[AdmissionDate]] (इयत्ता: [[AdmissionStd]])</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">प्रगती व वर्तणूक (Conduct):</td>
                <td class="p-2 font-semibold text-emerald-800">[[Conduct]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">शाळा सोडल्याचा दिनांक:</td>
                <td class="p-2 font-bold text-slate-900">[[LeavingDate]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">कोणत्या इयत्तेत शिकत होता:</td>
                <td class="p-2 text-slate-800">[[StandardStudied]]</td>
            </tr>
            <tr>
                <td class="p-2 font-bold text-slate-700 border-r border-slate-200">शाळा सोडण्याचे कारण:</td>
                <td class="p-2 text-slate-800">[[ReasonForLeaving]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["सदर दाखला शाळेतील अधिकृत जनरल रजिस्टर (G.R.) वरून पडताळणी करून जारी करण्यात आला आहे.","दाखल्यात कोणताही खाडाखोड केल्यास तो अवैध ठरेल."]', N'[{\"fieldKey\":\"GRNo\",\"fieldLabelMarathi\":\"जनरल रजिस्टर (G.R.) क्र.\",\"fieldLabelEnglish\":\"G.R. No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"MotherName\",\"fieldLabelMarathi\":\"आईचे नाव\",\"fieldLabelEnglish\":\"Mother Name\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"CasteCategory\",\"fieldLabelMarathi\":\"धर्म व जात / प्रवर्ग\",\"fieldLabelEnglish\":\"Religion & Caste\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"BirthPlace\",\"fieldLabelMarathi\":\"जन्मस्थान\",\"fieldLabelEnglish\":\"Birth Place\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"DOB\",\"fieldLabelMarathi\":\"जन्मतारीख (DD/MM/YYYY)\",\"fieldLabelEnglish\":\"Date of Birth\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"DOBWords\",\"fieldLabelMarathi\":\"जन्मतारीख (अक्षरात)\",\"fieldLabelEnglish\":\"DOB in Words\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"AdmissionDate\",\"fieldLabelMarathi\":\"प्रवेश दिनांक\",\"fieldLabelEnglish\":\"Admission Date\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"AdmissionStd\",\"fieldLabelMarathi\":\"प्रवेशाची इयत्ता\",\"fieldLabelEnglish\":\"Admission Std\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"Conduct\",\"fieldLabelMarathi\":\"प्रगती व वर्तणूक\",\"fieldLabelEnglish\":\"Conduct & Progress\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"LeavingDate\",\"fieldLabelMarathi\":\"शाळा सोडल्याचा दिनांक\",\"fieldLabelEnglish\":\"Leaving Date\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"StandardStudied\",\"fieldLabelMarathi\":\"शिकत असलेली इयत्ता\",\"fieldLabelEnglish\":\"Standard Studied\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ReasonForLeaving\",\"fieldLabelMarathi\":\"शाळा सोडण्याचे कारण\",\"fieldLabelEnglish\":\"Reason for Leaving\",\"fieldType\":\"text\",\"isMandatory\":true}]', NULL, NULL, '2026-08-26T15:03:44.843', 2, '2026-08-28T13:47:17.447', N'False', NULL),
    (8, 61, N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र अधिकृत प्रमाणपत्र दाखला', N'CERT_61', NULL, N'
      <div class=''official-certificate-sheet p-6 md:p-8 bg-white border-[5px] border-double border-slate-900 relative shadow-sm transition-all'' style=''min-height: 297mm;''>
        <!-- Dynamic ULB Logo Background Watermark -->
        <div class=''absolute inset-0 flex items-center justify-center pointer-events-none z-0 overflow-hidden''>
                 <img src=''/logo.png'' alt=''ULB Watermark'' style=''opacity: 0.06;'' class=''w-72 h-72 object-contain filter grayscale'' onerror="this.style.display=''none''"/>
               </div>

            <div class=''header-letterhead relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

              <div class=''flex justify-between items-center font-mono mb-1 opacity-80'' style=''font-size: 0.75em;''><div>RTS/2026/DOC-VERIFIED</div><div>{{ApplicationNo}}</div></div>
              <div class=''flex items-center justify-between gap-4''>
                <div class=''shrink-0 text-left'' style=''width: 85px;''><img src=''/logo.png'' alt=''ULB Logo'' style=''max-height: 75px; max-width: 75px;'' class=''object-contain'' onerror="this.style.display=''none''"/><div style=''font-size: 0.72em; font-weight: bold; margin-top: 2px; text-align: left; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div></div>
                <div class=''flex-1 text-center'' style=''text-align: center !important;''>
                  <div style=''font-size: 1.45em; font-weight: bold; font-family: inherit; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
                  <div style=''font-size: 1.05em; font-weight: bold; margin-top: 2px; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>नगर रचना</div>
                  <div style=''font-size: 0.85em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>एम. जी. रोड, न्यू राधाकिसन प्लॉट्स, ओपन थिएटरजवळ, फार्या हाइट्ससमोर, गणेश नगर, अकोला, महाराष्ट्र – ४४४००१</div>
                  <div style=''font-size: 0.8em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>ई-मेल - akolamc@gmail.com</div>
                </div>
                <div class=''shrink-0'' style=''width: 85px;''></div>
              </div>
              <div class=''w-full border-b-2 border-current mt-2 mb-2''></div>
            </div>

            <div class=''dispatch-bar flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 4px !important; padding-bottom: 4px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 8px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>जा.क्र. मनपा/आर.टी.एस./२०२६/{{ApplicationNo}}</div>
              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>दिनांक: {{ApprovalDate}}</div>
            </div>

            <div class=''recipient-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>प्रति,</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantName}}</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantAddress}}</div>
              <div style=''padding-left: 1.5rem; font-family: monospace; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantMobile}}</div>
            </div>

            <div class=''subject-ref-block relative z-10 transition-all  relative''  style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''margin-bottom: 0.25rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>विषय :- व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र बाबत अधिकृत प्रमाणपत्र पुरविणेबाबत.</div>
              <div style=''opacity: 0.95; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>संदर्भ :- आपला ऑनलाईन RTS अर्ज क्र. {{ApplicationNo}} दिनांक {{ApplicationDate}}</div>
            </div>

            <div class=''salutation-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 2px !important; padding-bottom: 2px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 6px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>महोदय / महोदया,</div>
            </div>

            <div class=''narrative-body relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 12px !important;  ''>

              <p style=''text-indent: 2rem; margin-bottom: 0.5em; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>महाराष्ट्र महानगरपालिका अधिनियम कलम ३७६/३८६ अन्वये सादर केलेल्या व्यवसाय परवाना अर्जाची (अर्ज क्र. {{ApplicationNo}} दि. {{ApplicationDate}}) आरोग्य व परवाना विभागामार्फत छाननी व स्थळ पाहणी पूर्ण करण्यात आली आहे.</p>
              <p style=''text-indent: 2rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>विहित नियमांच्या अधीन राहून {{ApplicantName}} (रा. {{ApplicantAddress}}) यांना ''व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र'' साठीचा अधिकृत व्यवसाय परवाना दिनांक {{ApprovalDate}} रोजी पुढील अटींवर मंजूर करण्यात येत आहे.</p>
            </div>

            {{OfficerFieldsBlock}}

              <div class=''conditions-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

                <div style=''margin-bottom: 0.5rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>शर्ती व अटी:</div>
                <ol style=''list-style-type: decimal; padding-left: 1.5rem; display: flex; flex-direction: column; gap: 0.35rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                  <li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>परिसरातील नागरिकांना किंवा वाहतुकीस कोणताही त्रास होणार नाही याची दक्षता घ्यावी.</li><li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>प्रदूषण नियंत्रण, अग्निशमन व मनपाच्या सर्व नियमांचे पालन करणे बंधनकारक राहील.</li>
                  {{CustomConditionsList}}
                </ol>
              </div>

            <div class=''custom-text-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important; background-color: #f8fafc !important; border: 1px solid #94a3b8; border-radius: 10px; box-shadow: 0 1px 2px rgba(0,0,0,0.05);''>

              <div style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून ९० दिवसांपर्यंत ग्राह्य धरता येईल.</div>
            </div>

            <div class=''signature-stamp-block flex justify-between items-end gap-4 relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 10px !important; padding-bottom: 10px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 14px !important;  ''>

              <div class=''left-sign text-center'' style=''font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                <div class=''h-12 flex items-center justify-center italic border-b border-slate-400 pb-1'' style=''font-family: Georgia, serif; font-size: 1.1em;''>
                  {{ApprovalDate}}
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>लिपिक / शाखा प्रमुख</div>
              </div>

              <div class=''center-seal text-center''>
                <div class=''official-seal-stamp inline-block text-center''><img src=''/images/ulb-seal.png'' alt=''Official Seal'' style=''width: 105px; height: 105px;'' class=''object-contain transform -rotate-6 filter drop-shadow-xs inline-block'' onerror="this.style.display=''none''"/></div>
              </div>

              <div class=''right-digital-sign text-right''>
                <div class=''digital-signature-card bg-emerald-50/95 border-2 border-emerald-600 p-2.5 rounded-lg text-left inline-block shadow-xs min-w-[220px]'' style=''font-size: 0.85em; line-height: 1.4;''>
                  <div class=''flex items-center gap-1.5 text-emerald-900 font-bold pb-1 border-b border-emerald-300 mb-1'' style=''font-size: 0.9em;''>
                    <span class=''text-emerald-700 font-bold''>✔</span>
                    <span>Digitally Signed (DSC Verified)</span>
                  </div>
                  <div class=''font-bold text-slate-950''>{{OfficerName}}</div>
                  <div class=''text-slate-800'' style=''font-size: 0.9em;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                  <div class=''text-slate-600 font-mono mt-0.5'' style=''font-size: 0.85em;''>Date: {{ApprovalDate}} IST</div>
                  <div class=''text-emerald-800 font-bold mt-1 flex items-center gap-1'' style=''font-size: 0.85em;''>
                    <span>🔒</span> <span>e-Sign Verified & Authentic</span>
                  </div>
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.95em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                <div style=''font-size: 0.85em; opacity: 0.9; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
              </div>
            </div>

            <div class=''security-footer-block border-t border-slate-400 flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 8px !important;  ''>

              <div class=''flex items-center gap-2''>
                <div class=''inline-flex flex-col items-center justify-center p-1 bg-white border border-slate-300 rounded shadow-xs text-center'' style=''width: 70px;''>
                  <div style=''width: 55px; height: 55px;'' class=''flex items-center justify-center bg-white''>
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https%3A%2F%2Fakolacity.gov.in%2Fverify-certificate%3FappNo%3D%7B%7BApplicationNo%7D%7D" alt="QR Verification" class="w-full h-full object-contain" />
                  </div>
                  <span class=''text-slate-600 mt-0.5 font-bold'' style=''font-size: 8px;''>Scan to Verify</span>
                </div>
                <div class=''font-mono tracking-widest font-bold'' style=''font-size: 9px;''>||||||||||||||||||||||</div>
              </div>
              <div class=''text-center max-w-md opacity-90'' style=''font-size: 9px; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीने जारी केलेले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</div>
            </div>

            <div class=''footer-file-path-block mt-4 pt-1 border-t-2 border-current font-mono font-bold'' style=''font-size: 0.8em; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
              D:\अकोला महानगरपालिका अकोला\नगर रचना\Certificate
            </div>
          </div>', NULL, N'["परिसरातील नागरिकांना किंवा वाहतुकीस कोणताही त्रास होणार नाही याची दक्षता घ्यावी.","प्रदूषण नियंत्रण, अग्निशमन व मनपाच्या सर्व नियमांचे पालन करणे बंधनकारक राहील."]', N'[{"fieldKey":"InspectionRemark","fieldLabelMarathi":"स्थळ पाहणी व छाननी शेरा","fieldLabelEnglish":"Site Inspection & Verification Remark","fieldType":"textarea","isMandatory":false},{"fieldKey":"SpecificValidityNote","fieldLabelMarathi":"विशेष वैधता नोंद","fieldLabelEnglish":"Special Validity Note","fieldType":"text","isMandatory":false}]', NULL, NULL, '2026-08-26T15:03:44.843', 3, '2026-08-28T14:33:54.597', N'False', NULL),
    (9, 62, N'मंडप ना-हरकत / ना-नुकसान प्रमाणपत्र (Mandap NOC)', N'CERT_MANDAP_NOC', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये तात्पुरत्या स्वरूपात मंडप उभारणीसाठी ना-हरकत प्रमाणपत्र खालील अटींवर जारी करण्यात येत आहे:</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">परवानगी आदेश क्रमांक:</td>
                <td class="p-2.5 font-semibold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">मंडपाचे ठिकाण / परिसर:</td>
                <td class="p-2.5 text-slate-800">[[Location]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">परवानगी कालावधी (मुदत):</td>
                <td class="p-2.5 font-semibold text-slate-900">[[ValidityPeriod]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शुल्क / अनामत पावती क्र.:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[ChallanNo]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["रस्त्यावरील वाहतुकीस व पादचाऱ्यांना अडथळा निर्माण होणार नाही अशा पद्धतीने मंडप उभारणे आवश्यक आहे.","मुदत संपताच २४ तासांच्या आत मंडप काढून रस्ता पूर्ववत करणे बंधनकारक आहे."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"परवानगी आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"Location\",\"fieldLabelMarathi\":\"मंडपाचे ठिकाण\",\"fieldLabelEnglish\":\"Mandap Location\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ValidityPeriod\",\"fieldLabelMarathi\":\"परवानगी कालावधी\",\"fieldLabelEnglish\":\"Validity Period\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क / अनामत पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T15:03:44.843', NULL, '2026-08-28T13:47:17.447', N'False', NULL),
    (12, 66, N'वृक्षतोड / छाटणी परवानगी (Tree Permission)', N'CERT_TREE_PERMIT', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये वृक्ष प्राधिकरणाच्या प्रत्यक्ष स्थळपाहणी अहवालानुसार वृक्षतोड/फांद्या छाटणी परवानगी खालील अटींवर देण्यात येत आहे:</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">परवानगी आदेश क्रमांक:</td>
                <td class="p-2.5 font-semibold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">तोडण्यास/छाटण्यास मंजूर वृक्षांची संख्या:</td>
                <td class="p-2.5 font-bold text-slate-900">[[TreeCount]] झाडे</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">पुनर्लागवड करावयाची झाडे:</td>
                <td class="p-2.5 font-bold text-emerald-800">[[ReplantCount]] नवीन झाडे</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शुल्क पावती तपशील:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[ChallanNo]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["तोडलेल्या प्रत्येक वृक्षाच्या बदल्यात नियमानुसार नवीन वृक्षांची लागवड करून त्यांचे ३ वर्षे संवर्धन करणे बंधनकारक आहे."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"परवानगी आदेश क्रमांक\",\"fieldLabelEnglish\":\"Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"TreeCount\",\"fieldLabelMarathi\":\"मंजूर वृक्षांची संख्या\",\"fieldLabelEnglish\":\"Approved Tree Count\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ReplantCount\",\"fieldLabelMarathi\":\"पुनर्लागवड करावयाची झाडे\",\"fieldLabelEnglish\":\"Replant Trees Count\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T15:03:44.843', NULL, '2026-08-28T13:47:17.447', N'False', NULL)
) AS source ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateCode] = source.[TemplateCode],
        target.[HeaderContent] = source.[HeaderContent],
        target.[BodyContent] = source.[BodyContent],
        target.[FooterContent] = source.[FooterContent],
        target.[DefaultConditionsJson] = source.[DefaultConditionsJson],
        target.[OfficerFieldsConfigJson] = source.[OfficerFieldsConfigJson],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
    VALUES (source.[Id], source.[ServiceId], source.[TemplateName], source.[TemplateCode], source.[HeaderContent], source.[BodyContent], source.[FooterContent], source.[DefaultConditionsJson], source.[OfficerFieldsConfigJson], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate]);
GO

MERGE INTO [RTS].[CertificateTemplateMaster] AS target
USING (VALUES
    (16, 46, N'जोते प्रमाणपत्र (Plinth Certificate)', N'CERT_PLINTH', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये अकोला महानगरपालिका क्षेत्रात मंजूर बांधकाम परवानगीनुसार प्रत्यक्ष स्थळपाहणी करण्यात आली असून जोते (Plinth Level) नियमानुसार व मंजूर नकाशाप्रमाणे पूर्ण झाल्याची खात्री करून जोते प्रमाणपत्र मंजूर करण्यात येत आहे.</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">जोते आदेश / जावक क्र.:</td>
                <td class="p-2.5 font-semibold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">बांधकाम परवानगी क्र. व दिनांक:</td>
                <td class="p-2.5 text-slate-800">[[BuildingPermitNo]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">वास्तुविशारद / अभियंता नाव:</td>
                <td class="p-2.5 text-slate-800">[[ArchitectName]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शुल्क पावती क्र.:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[ChallanNo]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["पुढील संपूर्ण बांधकाम मंजूर नकाशा, विकास नियंत्रण नियमावली व सुरक्षिततेच्या मानकांनुसारच करणे बंधनकारक आहे."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"जोते आदेश क्रमांक\",\"fieldLabelEnglish\":\"Plinth Order No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"BuildingPermitNo\",\"fieldLabelMarathi\":\"बांधकाम परवानगी क्र.\",\"fieldLabelEnglish\":\"Building Permit No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ArchitectName\",\"fieldLabelMarathi\":\"अभियंता / वास्तुविशारद नाव\",\"fieldLabelEnglish\":\"Architect / Engineer\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T15:12:49.523', 2, '2026-08-28T13:47:17.447', N'False', NULL),
    (18, 56, N'स्थलांतर दाखला (Transfer Certificate)', N'CERT_TRANSFER_CERT', NULL, N'<div class="certificate-body space-y-3 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, विद्यार्थी <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांनी दाखल केलेल्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये शालेय अधिकृत अभिलेखावरून <strong>स्थलांतर दाखला (Transfer / Migration Certificate)</strong> जारी करण्यात येत आहे:</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-2 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">दाखला / जावक क्रमांक:</td>
                <td class="p-2.5 font-bold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">विद्यार्थ्याचे संपूर्ण नाव:</td>
                <td class="p-2.5 font-bold text-slate-900">{{ApplicantName}}</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">नोंदणी / इनरोलमेंट क्र.:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[EnrollmentNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शाळेचे नाव:</td>
                <td class="p-2.5 text-slate-800">[[SchoolName]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">स्थलांतराचे कारण (Reason):</td>
                <td class="p-2.5 text-slate-800">[[ReasonForTransfer]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शुल्क पावती क्र.:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[ChallanNo]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["सदर दाखला पुढील उच्च शिक्षण किंवा इतर संस्थेत प्रवेश घेण्यासाठी वैध आहे."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"दाखला / जावक क्रमांक\",\"fieldLabelEnglish\":\"Certificate No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"EnrollmentNo\",\"fieldLabelMarathi\":\"नोंदणी / इनरोलमेंट क्र.\",\"fieldLabelEnglish\":\"Enrollment No\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"SchoolName\",\"fieldLabelMarathi\":\"शाळेचे नाव\",\"fieldLabelEnglish\":\"School Name\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ReasonForTransfer\",\"fieldLabelMarathi\":\"स्थलांतराचे कारण\",\"fieldLabelEnglish\":\"Reason for Transfer\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T15:12:49.523', NULL, '2026-08-28T13:47:17.447', N'False', NULL),
    (19, 57, N'द्वितीय गुणपत्रक (Duplicate Mark Sheet)', N'CERT_MARK_SHEET', NULL, N'<div class="certificate-body space-y-3 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, विद्यार्थी <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये परीक्षा अभिलेखावरून खालील तपशिलानुसार <strong>द्वितीय गुणपत्रक (Duplicate Statement of Marks)</strong> प्रमाणित करून देण्यात येत आहे:</p>

    <div class="grid grid-cols-2 gap-2 text-xs bg-slate-50 p-2.5 rounded-lg border border-slate-200 mb-2">
        <div><strong>विद्यार्थ्याचे नाव:</strong> {{ApplicantName}}</div>
        <div><strong>आसन / रोल नंबर:</strong> <span class="font-mono font-bold text-slate-900">[[SeatNo]]</span></div>
        <div><strong>परीक्षेचे नाव:</strong> [[ExamName]]</div>
        <div><strong>शैक्षणिक वर्ष / सत्र:</strong> [[AcademicYear]]</div>
    </div>

    <div class="border border-slate-300 rounded-lg overflow-hidden my-2 text-xs">
        <table class="w-full border-collapse text-center">
            <thead>
                <tr class="bg-slate-800 text-white font-bold text-[11px]">
                    <th class="p-2 border-r border-slate-700 w-12">अ.क्र.</th>
                    <th class="p-2 border-r border-slate-700 text-left">विषय (Subject)</th>
                    <th class="p-2 border-r border-slate-700 w-24">कमाल गुण (Max)</th>
                    <th class="p-2 border-r border-slate-700 w-24">किमान गुण (Min)</th>
                    <th class="p-2 w-28 bg-slate-900 text-emerald-300">प्राप्त गुण (Marks)</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-slate-200">
                <tr class="hover:bg-slate-50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">१</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">प्रथम भाषा (मराठी)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksMarathi]]</td>
                </tr>
                <tr class="hover:bg-slate-50 bg-slate-50/50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">२</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">द्वितीय भाषा (हिंदी)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksHindi]]</td>
                </tr>
                <tr class="hover:bg-slate-50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">३</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">तृतीय भाषा (इंग्रजी)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksEnglish]]</td>
                </tr>
                <tr class="hover:bg-slate-50 bg-slate-50/50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">४</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">गणित (Mathematics)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksMaths]]</td>
                </tr>
                <tr class="hover:bg-slate-50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">५</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">विज्ञान व तंत्रज्ञान (Science)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksScience]]</td>
                </tr>
                <tr class="hover:bg-slate-50 bg-slate-50/50">
                    <td class="p-1.5 border-r border-slate-200 font-mono">६</td>
                    <td class="p-1.5 border-r border-slate-200 text-left font-medium">सामाजिक शास्त्रे (Social Sciences)</td>
                    <td class="p-1.5 border-r border-slate-200">१००</td>
                    <td class="p-1.5 border-r border-slate-200">३५</td>
                    <td class="p-1.5 font-bold font-mono text-slate-900">[[MarksSocialScience]]</td>
                </tr>
                <tr class="bg-slate-100 font-bold text-slate-900 border-t-2 border-slate-400">
                    <td class="p-2 border-r border-slate-300" colspan="2">एकूण गुण (Total):</td>
                    <td class="p-2 border-r border-slate-300">६००</td>
                    <td class="p-2 border-r border-slate-300">२१०</td>
                    <td class="p-2 font-mono text-emerald-800 text-sm">[[TotalMarks]]</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="flex justify-between items-center text-xs bg-emerald-50 border border-emerald-300 p-2.5 rounded-lg">
        <div><strong>टक्केवारी (Percentage):</strong> <span class="font-mono font-bold text-emerald-900 text-sm">[[Percentage]]%</span></div>
        <div><strong>निकालाचा दर्जा (Result / Grade):</strong> <span class="font-bold text-emerald-900 text-sm">[[Grade]]</span></div>
    </div>
</div>', NULL, N'["सदर गुणपत्रक मूळ परीक्षा अभिलेखावरून पडताळणी करून अधिकृतरीत्या द्वितीय प्रत म्हणून जारी केले आहे.","या गुणपत्रकावर सक्षम प्राधिकाऱ्यांची डिजिटल स्वाक्षरी व QR पडताळणी समाविष्ट आहे."]', N'[{\"fieldKey\":\"SeatNo\",\"fieldLabelMarathi\":\"आसन / रोल नंबर\",\"fieldLabelEnglish\":\"Seat / Roll No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ExamName\",\"fieldLabelMarathi\":\"परीक्षेचे नाव\",\"fieldLabelEnglish\":\"Exam Name\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"AcademicYear\",\"fieldLabelMarathi\":\"शैक्षणिक वर्ष\",\"fieldLabelEnglish\":\"Academic Year\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"MarksMarathi\",\"fieldLabelMarathi\":\"मराठी गुण\",\"fieldLabelEnglish\":\"Marathi Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"MarksHindi\",\"fieldLabelMarathi\":\"हिंदी गुण\",\"fieldLabelEnglish\":\"Hindi Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"MarksEnglish\",\"fieldLabelMarathi\":\"इंग्रजी गुण\",\"fieldLabelEnglish\":\"English Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"MarksMaths\",\"fieldLabelMarathi\":\"गणित गुण\",\"fieldLabelEnglish\":\"Maths Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"MarksScience\",\"fieldLabelMarathi\":\"विज्ञान गुण\",\"fieldLabelEnglish\":\"Science Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"MarksSocialScience\",\"fieldLabelMarathi\":\"सामाजिक शास्त्रे गुण\",\"fieldLabelEnglish\":\"Social Science Marks\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"TotalMarks\",\"fieldLabelMarathi\":\"एकूण गुण (६०० पैकी)\",\"fieldLabelEnglish\":\"Total Marks (out of 600)\",\"fieldType\":\"number\",\"isMandatory\":true},{\"fieldKey\":\"Percentage\",\"fieldLabelMarathi\":\"टक्केवारी (%)\",\"fieldLabelEnglish\":\"Percentage\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"Grade\",\"fieldLabelMarathi\":\"श्रेणी / निकाल (Grade/Pass)\",\"fieldLabelEnglish\":\"Result Grade\",\"fieldType\":\"text\",\"isMandatory\":true}]', NULL, NULL, '2026-08-26T15:12:49.523', NULL, '2026-08-28T13:47:17.447', N'False', NULL),
    (23, 49, N'रस्त्यांवरील खड्डे बुजविणे अधिकृत प्रमाणपत्र दाखला', N'CERT_49', NULL, N'
      <div class=''official-certificate-sheet p-6 md:p-8 bg-white border-[5px] border-double border-slate-900 relative shadow-sm transition-all'' style=''min-height: 297mm;''>
        <!-- Dynamic ULB Logo Background Watermark -->
        <div class=''absolute inset-0 flex items-center justify-center pointer-events-none z-0 overflow-hidden''>
                 <img src=''/logo.png'' alt=''ULB Watermark'' style=''opacity: 0.06;'' class=''w-72 h-72 object-contain filter grayscale'' onerror="this.style.display=''none''"/>
               </div>

            <div class=''header-letterhead relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

              <div class=''flex justify-between items-center font-mono mb-1 opacity-80'' style=''font-size: 0.75em;''><div>RTS/2026/DOC-VERIFIED</div><div>{{ApplicationNo}}</div></div>
              <div class=''flex items-center justify-between gap-4''>
                <div class=''shrink-0 text-left'' style=''width: 85px;''><img src=''/logo.png'' alt=''ULB Logo'' style=''max-height: 75px; max-width: 75px;'' class=''object-contain'' onerror="this.style.display=''none''"/><div style=''font-size: 0.72em; font-weight: bold; margin-top: 2px; text-align: left; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div></div>
                <div class=''flex-1 text-center'' style=''text-align: center !important;''>
                  <div style=''font-size: 1.45em; font-weight: bold; font-family: inherit; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
                  <div style=''font-size: 1.05em; font-weight: bold; margin-top: 2px; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सार्वजनिक बांधकाम विभाग</div>
                  <div style=''font-size: 0.85em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>एम. जी. रोड, न्यू राधाकिसन प्लॉट्स, ओपन थिएटरजवळ, फार्या हाइट्ससमोर, गणेश नगर, अकोला, महाराष्ट्र – ४४४००१</div>
                  <div style=''font-size: 0.8em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>ई-मेल - akolamc@gmail.com</div>
                </div>
                <div class=''shrink-0'' style=''width: 85px;''></div>
              </div>
              <div class=''w-full border-b-2 border-current mt-2 mb-2''></div>
            </div>

            <div class=''dispatch-bar flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 4px !important; padding-bottom: 4px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 8px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>जा.क्र. मनपा/आर.टी.एस./२०२६/{{ApplicationNo}}</div>
              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>दिनांक: {{ApprovalDate}}</div>
            </div>

            <div class=''recipient-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>प्रति,</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantName}}</div>
              <div style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantAddress}}</div>
              <div style=''padding-left: 1.5rem; font-family: monospace; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>{{ApplicantMobile}}</div>
            </div>

            <div class=''subject-ref-block relative z-10 transition-all  relative''  style=''padding-left: 1.5rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 10px !important;  ''>

              <div style=''margin-bottom: 0.25rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>विषय :- रस्त्यांवरील खड्डे बुजविणे बाबत अधिकृत प्रमाणपत्र पुरविणेबाबत.</div>
              <div style=''opacity: 0.95; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>संदर्भ :- आपला ऑनलाईन RTS अर्ज क्र. {{ApplicationNo}} दिनांक {{ApplicationDate}}</div>
            </div>

            <div class=''salutation-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 2px !important; padding-bottom: 2px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 6px !important;  ''>

              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>महोदय / महोदया,</div>
            </div>

            <div class=''narrative-body relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 12px !important;  ''>

              <p style=''text-indent: 2rem; margin-bottom: 0.5em; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>उपरोक्त विषयान्वये आपणास कळविण्यात येते की, आपण महाराष्ट्र लोकसेवा हक्क अधिनियमान्वये केलेल्या अर्जानुसार (अर्ज क्र. {{ApplicationNo}} दि. {{ApplicationDate}}), संबंधित कागदपत्रांची छाननी व स्थळ पाहणी नियमानुसार पूर्ण करण्यात आली आहे.</p>
              <p style=''text-indent: 2rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सबब, विहित नियमांच्या अधीन राहून {{ApplicantName}} (रा. {{ApplicantAddress}}) यांना रस्त्यांवरील खड्डे बुजविणे प्रमाणपत्र दिनांक {{ApprovalDate}} रोजी खालील अटी व शर्तींच्या अधीन राहून निर्गमित करण्यात येत आहे.</p>
            </div>

            {{OfficerFieldsBlock}}

              <div class=''conditions-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>

                <div style=''margin-bottom: 0.5rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>शर्ती व अटी:</div>
                <ol style=''list-style-type: decimal; padding-left: 1.5rem; display: flex; flex-direction: column; gap: 0.35rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                  <li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सदर दुरुस्तीचे काम मनपा बांधकाम विभागाच्या देखरेखीखाली दर्जेदार साहित्यासह पूर्ण करण्यात आले आहे.</li>
                  {{CustomConditionsList}}
                </ol>
              </div>

            <div class=''custom-text-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important; background-color: #f8fafc !important; border: 1px solid #94a3b8; border-radius: 10px; box-shadow: 0 1px 2px rgba(0,0,0,0.05);''>

              <div style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून ९० दिवसांपर्यंत ग्राह्य धरता येईल.</div>
            </div>

            <div class=''signature-stamp-block flex justify-between items-end gap-4 relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 10px !important; padding-bottom: 10px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 14px !important;  ''>

              <div class=''left-sign text-center'' style=''font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                <div class=''h-12 flex items-center justify-center italic border-b border-slate-400 pb-1'' style=''font-family: Georgia, serif; font-size: 1.1em;''>
                  {{ApprovalDate}}
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.9em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>लिपिक / शाखा प्रमुख</div>
              </div>

              <div class=''center-seal text-center''>
                <div class=''official-seal-stamp inline-block text-center''><img src=''/images/ulb-seal.png'' alt=''Official Seal'' style=''width: 105px; height: 105px;'' class=''object-contain transform -rotate-6 filter drop-shadow-xs inline-block'' onerror="this.style.display=''none''"/></div>
              </div>

              <div class=''right-digital-sign text-right''>
                <div class=''digital-signature-card bg-emerald-50/95 border-2 border-emerald-600 p-2.5 rounded-lg text-left inline-block shadow-xs min-w-[220px]'' style=''font-size: 0.85em; line-height: 1.4;''>
                  <div class=''flex items-center gap-1.5 text-emerald-900 font-bold pb-1 border-b border-emerald-300 mb-1'' style=''font-size: 0.9em;''>
                    <span class=''text-emerald-700 font-bold''>✔</span>
                    <span>Digitally Signed (DSC Verified)</span>
                  </div>
                  <div class=''font-bold text-slate-950''>{{OfficerName}}</div>
                  <div class=''text-slate-800'' style=''font-size: 0.9em;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                  <div class=''text-slate-600 font-mono mt-0.5'' style=''font-size: 0.85em;''>Date: {{ApprovalDate}} IST</div>
                  <div class=''text-emerald-800 font-bold mt-1 flex items-center gap-1'' style=''font-size: 0.85em;''>
                    <span>🔒</span> <span>e-Sign Verified & Authentic</span>
                  </div>
                </div>
                <div style=''margin-top: 0.25rem; font-size: 0.95em; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सहाय्यक आयुक्त / कर अधीक्षक</div>
                <div style=''font-size: 0.85em; opacity: 0.9; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका अकोला</div>
              </div>
            </div>

            <div class=''security-footer-block border-t border-slate-400 flex justify-between items-center relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 6px !important; padding-bottom: 6px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 8px !important;  ''>

              <div class=''flex items-center gap-2''>
                <div class=''inline-flex flex-col items-center justify-center p-1 bg-white border border-slate-300 rounded shadow-xs text-center'' style=''width: 70px;''>
                  <div style=''width: 55px; height: 55px;'' class=''flex items-center justify-center bg-white''>
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https%3A%2F%2Fakolacity.gov.in%2Fverify-certificate%3FappNo%3D%7B%7BApplicationNo%7D%7D" alt="QR Verification" class="w-full h-full object-contain" />
                  </div>
                  <span class=''text-slate-600 mt-0.5 font-bold'' style=''font-size: 8px;''>Scan to Verify</span>
                </div>
                <div class=''font-mono tracking-widest font-bold'' style=''font-size: 9px;''>||||||||||||||||||||||</div>
              </div>
              <div class=''text-center max-w-md opacity-90'' style=''font-size: 9px; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीने जारी केलेले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</div>
            </div>

            <div class=''footer-file-path-block mt-4 pt-1 border-t-2 border-current font-mono font-bold'' style=''font-size: 0.8em; color: #0f172a !important; font-size: 10px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
              D:\अकोला महानगरपालिका अकोला\सार्वजनिक बांधकाम विभाग\Certificate
            </div>
          </div>', NULL, N'["सदर दुरुस्तीचे काम मनपा बांधकाम विभागाच्या देखरेखीखाली दर्जेदार साहित्यासह पूर्ण करण्यात आले आहे."]', N'[{"fieldKey":"InspectionRemark","fieldLabelMarathi":"स्थळ पाहणी व छाननी शेरा","fieldLabelEnglish":"Site Inspection & Verification Remark","fieldType":"textarea","isMandatory":false},{"fieldKey":"SpecificValidityNote","fieldLabelMarathi":"विशेष वैधता नोंद","fieldLabelEnglish":"Special Validity Note","fieldType":"text","isMandatory":false}]', NULL, NULL, '2026-08-26T16:36:33.087', 2, '2026-08-29T11:29:53.703', N'False', NULL),
    (24, 50, N'ड्रेनेज/गटार झाकण दुरुस्ती पूर्तता दाखला (Sewer Cover Completion Certificate)', N'CERT_SEWER_COVERS', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये प्राप्त तक्रारीनुसार संबंधित ठिकाणच्या ड्रेनेज/गटारावरील झाकण बसविण्याचे व सुरक्षित करण्याचे काम पूर्ण करण्यात आले आहे.</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">काम पूर्तता / जावक क्र.:</td>
                <td class="p-2.5 font-semibold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">ठिकाण / प्रभाग क्रमांक:</td>
                <td class="p-2.5 text-slate-800">[[Location]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">झाकण बसविल्याचा दिनांक:</td>
                <td class="p-2.5 text-slate-800">[[CompletionDate]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["ड्रेनेज झाकण सुरक्षेच्या निकषांनुसार सुस्थितीत बसविण्यात आले असून नियमित तपासणी केली जाईल."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"काम पूर्तता क्रमांक\",\"fieldLabelEnglish\":\"Completion No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"Location\",\"fieldLabelMarathi\":\"ठिकाण / प्रभाग\",\"fieldLabelEnglish\":\"Location / Ward\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"CompletionDate\",\"fieldLabelMarathi\":\"झाकण बसविल्याचा दिनांक\",\"fieldLabelEnglish\":\"Completion Date\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T16:36:33.087', 2, '2026-08-28T13:47:17.447', N'False', NULL)
) AS source ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateCode] = source.[TemplateCode],
        target.[HeaderContent] = source.[HeaderContent],
        target.[BodyContent] = source.[BodyContent],
        target.[FooterContent] = source.[FooterContent],
        target.[DefaultConditionsJson] = source.[DefaultConditionsJson],
        target.[OfficerFieldsConfigJson] = source.[OfficerFieldsConfigJson],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
    VALUES (source.[Id], source.[ServiceId], source.[TemplateName], source.[TemplateCode], source.[HeaderContent], source.[BodyContent], source.[FooterContent], source.[DefaultConditionsJson], source.[OfficerFieldsConfigJson], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate]);
GO

MERGE INTO [RTS].[CertificateTemplateMaster] AS target
USING (VALUES
    (25, 68, N'स्वच्छता पूर्तता अहवाल दाखला (Cleanliness Redressal Certificate)', N'CERT_CLEANLINESS', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> यांच्या अर्ज क्र. <strong>{{ApplicationNo}}</strong> अन्वये अकोला महानगरपालिका स्वच्छता विभागामार्फत संबंधित परिसराची प्रत्यक्ष स्वच्छता मोहीम राबवून परिसर स्वच्छ करण्यात आला आहे.</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">कारवाई / अहवाल क्रमांक:</td>
                <td class="p-2.5 font-semibold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">स्वच्छता केलेल्या परिसराचे नाव:</td>
                <td class="p-2.5 text-slate-800">[[Location]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">स्वच्छता कार्यवाही दिनांक:</td>
                <td class="p-2.5 text-slate-800">[[CompletionDate]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["परिसरात दैनंदिन स्वच्छता राखण्यासाठी नियमित घंटागाडी व सफाई कर्मचाऱ्यांची नेमणूक करण्यात आली आहे."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"कारवाई / अहवाल क्रमांक\",\"fieldLabelEnglish\":\"Report / Outward No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"Location\",\"fieldLabelMarathi\":\"स्वच्छता परिसर\",\"fieldLabelEnglish\":\"Cleanliness Location\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"CompletionDate\",\"fieldLabelMarathi\":\"कार्यवाही दिनांक\",\"fieldLabelEnglish\":\"Action Date\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T16:36:33.087', NULL, '2026-08-28T13:47:17.447', N'False', NULL),
    (26, 162, N'फेरीवाले नोंदणी प्रमाणपत्र (Street Vendor / Hawker Registration Certificate)', N'CERT_HAWKER_REG', NULL, N'<div class="certificate-body space-y-4 font-sans">
    <p class="text-justify leading-relaxed">दीनदयाळ अंत्योदय योजना - राष्ट्रीय नागरी उपजीविका अभियान (DAY-NULM) व फेरीवाला धोरणांतर्गत प्रमाणित करण्यात येते की, अर्जदार <strong>{{ApplicantName}}</strong> (मोबाईल: <strong>{{ApplicantMobile}}</strong>) यांना अकोला महानगरपालिका क्षेत्रात फेरीवाले व्यवसाय / पथविक्रेता म्हणून अधिकृत नोंदणी प्रमाणपत्र (अर्ज क्र. <strong>{{ApplicationNo}}</strong>) जारी करण्यात येत आहे.</p>
    <div class="border border-slate-300 rounded-lg overflow-hidden my-3 text-xs">
        <table class="w-full border-collapse">
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 w-1/3 border-r border-slate-200">फेरीवाला नोंदणी / ओळखपत्र क्र.:</td>
                <td class="p-2.5 font-bold text-slate-900 font-mono">[[OrderNo]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">फेरीवाला प्रकार (Vendor Type):</td>
                <td class="p-2.5 font-semibold text-emerald-800">[[VendorType]]</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">मंजूर फेरीवाला क्षेत्र / वॉर्ड (Zone):</td>
                <td class="p-2.5 text-slate-800">[[VendingZone]]</td>
            </tr>
            <tr class="border-b border-slate-200">
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">नोंदणी वैधता मुदत (Validity):</td>
                <td class="p-2.5 text-slate-800 font-semibold">[[ValidityPeriod]]</td>
            </tr>
            <tr>
                <td class="p-2.5 font-bold text-slate-700 border-r border-slate-200">शुल्क पावती तपशील:</td>
                <td class="p-2.5 text-slate-800 font-mono">[[ChallanNo]]</td>
            </tr>
        </table>
    </div>
</div>', NULL, N'["सदर प्रमाणपत्र केवळ नियुक्त फेरीवाला क्षेत्रातच व्यवसाय करण्यासाठी वैध आहे.","वाहतुकीस अडथळा निर्माण होणार नाही व स्वच्छतेच्या नियमांचे पालन करणे बंधनकारक आहे.","सदर नोंदणी प्रमाणपत्र हस्तांतरणीय नाही."]', N'[{\"fieldKey\":\"OrderNo\",\"fieldLabelMarathi\":\"फेरीवाला नोंदणी क्रमांक\",\"fieldLabelEnglish\":\"Vendor Reg No\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"VendorType\",\"fieldLabelMarathi\":\"फेरीवाला प्रकार (स्थिर/फिरता)\",\"fieldLabelEnglish\":\"Vendor Type (Stationary/Mobile)\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"VendingZone\",\"fieldLabelMarathi\":\"मंजूर फेरीवाला क्षेत्र / झोन\",\"fieldLabelEnglish\":\"Approved Vending Zone\",\"fieldType\":\"text\",\"isMandatory\":false},{\"fieldKey\":\"ValidityPeriod\",\"fieldLabelMarathi\":\"वैधता मुदत\",\"fieldLabelEnglish\":\"Validity Period\",\"fieldType\":\"text\",\"isMandatory\":true},{\"fieldKey\":\"ChallanNo\",\"fieldLabelMarathi\":\"शुल्क पावती क्र.\",\"fieldLabelEnglish\":\"Challan No\",\"fieldType\":\"text\",\"isMandatory\":false}]', NULL, NULL, '2026-08-26T16:36:33.087', NULL, '2026-08-28T13:47:17.447', N'False', NULL)
) AS source ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateCode] = source.[TemplateCode],
        target.[HeaderContent] = source.[HeaderContent],
        target.[BodyContent] = source.[BodyContent],
        target.[FooterContent] = source.[FooterContent],
        target.[DefaultConditionsJson] = source.[DefaultConditionsJson],
        target.[OfficerFieldsConfigJson] = source.[OfficerFieldsConfigJson],
        target.[IsActive] = ISNULL(source.[IsActive], 1),
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[MarkedForDeletion] = ISNULL(source.[MarkedForDeletion], 0),
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
    VALUES (source.[Id], source.[ServiceId], source.[TemplateName], source.[TemplateCode], source.[HeaderContent], source.[BodyContent], source.[FooterContent], source.[DefaultConditionsJson], source.[OfficerFieldsConfigJson], ISNULL(source.[IsActive], 1), source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], ISNULL(source.[MarkedForDeletion], 0), source.[MarkedForDeletionDate]);
GO

SET IDENTITY_INSERT [RTS].[CertificateTemplateMaster] OFF;
GO

/* ----------------------------------------------------------------------------
   Table: [RTS].[ServiceOfficerAllocation] (Prabhag Samiti 1 to 4 Allocation)
   ---------------------------------------------------------------------------- */
MERGE INTO [RTS].[ServiceOfficerAllocation] AS target
USING (
    -- 1. Property Tax Services (Dept 1)
    SELECT s.Id AS ServiceId, z.ZoneId, z.ZoneName, z.ZoneNameLocal, z.OfficerName, z.OfficerNameLocal, z.Designation, z.DesignationLocal, z.MobileNo, z.Email, z.OfficeAddress, z.OfficeAddressLocal, 'DesignatedOfficer' AS OfficerRole, z.ZoneId AS DisplayOrder, CAST(1 AS BIT) AS IsActive
    FROM [RTS].[ServiceMaster] s
    CROSS JOIN (
        VALUES
        (1, N'Prabhag Samiti 1', N'प्रभाग समिती १', N'Sachin Deshmukh', N'श्री. सचिन देशमुख', N'Tax Superintendent', N'कर अधीक्षक', '9822011001', 'zone1.tax@akola.gov.in', N'Prabhag Samiti Office 1, Akola', N'प्रभाग समिती कार्यालय क्र. १, अकोला'),
        (2, N'Prabhag Samiti 2', N'प्रभाग समिती २', N'Rahul Joshi', N'श्री. राहुल जोशी', N'Tax Superintendent', N'कर अधीक्षक', '9822011002', 'zone2.tax@akola.gov.in', N'Prabhag Samiti Office 2, Akola', N'प्रभाग समिती कार्यालय क्र. २, अकोला'),
        (3, N'Prabhag Samiti 3', N'प्रभाग समिती ३', N'Anita Patil', N'सौ. अनिता पाटील', N'Tax Inspector', N'कर निरीक्षक', '9822011003', 'zone3.tax@akola.gov.in', N'Prabhag Samiti Office 3, Akola', N'प्रभाग समिती कार्यालय क्र. ३, अकोला'),
        (4, N'Prabhag Samiti 4', N'प्रभाग समिती ४', N'Gajanan Pawar', N'श्री. गजानन पवार', N'Tax Superintendent', N'कर अधीक्षक', '9822011004', 'zone4.tax@akola.gov.in', N'Prabhag Samiti Office 4, Akola', N'प्रभाग समिती कार्यालय क्र. ४, अकोला')
    ) AS z(ZoneId, ZoneName, ZoneNameLocal, OfficerName, OfficerNameLocal, Designation, DesignationLocal, MobileNo, Email, OfficeAddress, OfficeAddressLocal)
    WHERE s.DepartmentId = 1

    UNION ALL

    -- 2. Town Planning Services (Dept 4)
    SELECT s.Id AS ServiceId, z.ZoneId, z.ZoneName, z.ZoneNameLocal, z.OfficerName, z.OfficerNameLocal, z.Designation, z.DesignationLocal, z.MobileNo, z.Email, z.OfficeAddress, z.OfficeAddressLocal, 'DesignatedOfficer' AS OfficerRole, z.ZoneId AS DisplayOrder, CAST(1 AS BIT) AS IsActive
    FROM [RTS].[ServiceMaster] s
    CROSS JOIN (
        VALUES
        (1, N'Prabhag Samiti 1', N'प्रभाग समिती १', N'Milind Kamble', N'श्री. मिलिंद कांबळे', N'Assistant Town Planner', N'सहाय्यक नगर रचनाकार', '9822022001', 'tp.zone1@akola.gov.in', N'Prabhag Samiti Office 1, Akola', N'प्रभाग समिती कार्यालय क्र. १, अकोला'),
        (2, N'Prabhag Samiti 2', N'प्रभाग समिती २', N'Amit Kulkarni', N'श्री. अमित कुलकर्णी', N'Assistant Town Planner', N'सहाय्यक नगर रचनाकार', '9822022002', 'tp.zone2@akola.gov.in', N'Prabhag Samiti Office 2, Akola', N'प्रभाग समिती कार्यालय क्र. २, अकोला'),
        (3, N'Prabhag Samiti 3', N'प्रभाग समिती ३', N'Pallavi Sawant', N'सौ. पल्लवी सावंत', N'Assistant Town Planner', N'सहाय्यक नगर रचनाकार', '9822022003', 'tp.zone3@akola.gov.in', N'Prabhag Samiti Office 3, Akola', N'प्रभाग समिती कार्यालय क्र. ३, अकोला'),
        (4, N'Prabhag Samiti 4', N'प्रभाग समिती ४', N'Vikas Thakare', N'श्री. विकास ठाकरे', N'Assistant Town Planner', N'सहाय्यक नगर रचनाकार', '9822022004', 'tp.zone4@akola.gov.in', N'Prabhag Samiti Office 4, Akola', N'प्रभाग समिती कार्यालय क्र. ४, अकोला')
    ) AS z(ZoneId, ZoneName, ZoneNameLocal, OfficerName, OfficerNameLocal, Designation, DesignationLocal, MobileNo, Email, OfficeAddress, OfficeAddressLocal)
    WHERE s.DepartmentId = 4

    UNION ALL

    -- 3. Water Supply Services (Dept 2)
    SELECT s.Id AS ServiceId, z.ZoneId, z.ZoneName, z.ZoneNameLocal, z.OfficerName, z.OfficerNameLocal, z.Designation, z.DesignationLocal, z.MobileNo, z.Email, z.OfficeAddress, z.OfficeAddressLocal, 'DesignatedOfficer' AS OfficerRole, z.ZoneId AS DisplayOrder, CAST(1 AS BIT) AS IsActive
    FROM [RTS].[ServiceMaster] s
    CROSS JOIN (
        VALUES
        (1, N'Prabhag Samiti 1', N'प्रभाग समिती १', N'Sanjay Rathod', N'श्री. संजय राठोड', N'Deputy Engineer', N'उप अभियंता', '9822033001', 'water.zone1@akola.gov.in', N'Prabhag Samiti Office 1, Akola', N'प्रभाग समिती कार्यालय क्र. १, अकोला'),
        (2, N'Prabhag Samiti 2', N'प्रभाग समिती २', N'Pradeep Gaikwad', N'श्री. प्रदीप गायकवाड', N'Junior Engineer', N'कनिष्ठ अभियंता', '9822033002', 'water.zone2@akola.gov.in', N'Prabhag Samiti Office 2, Akola', N'प्रभाग समिती कार्यालय क्र. २, अकोला'),
        (3, N'Prabhag Samiti 3', N'प्रभाग समिती ३', N'Kishor Ingle', N'श्री. किशोर इंगळे', N'Junior Engineer', N'कनिष्ठ अभियंता', '9822033003', 'water.zone3@akola.gov.in', N'Prabhag Samiti Office 3, Akola', N'प्रभाग समिती कार्यालय क्र. ३, अकोला'),
        (4, N'Prabhag Samiti 4', N'प्रभाग समिती ४', N'Nitin Bawane', N'श्री. नितीन बावणे', N'Deputy Engineer', N'उप अभियंता', '9822033004', 'water.zone4@akola.gov.in', N'Prabhag Samiti Office 4, Akola', N'प्रभाग समिती कार्यालय क्र. ४, अकोला')
    ) AS z(ZoneId, ZoneName, ZoneNameLocal, OfficerName, OfficerNameLocal, Designation, DesignationLocal, MobileNo, Email, OfficeAddress, OfficeAddressLocal)
    WHERE s.DepartmentId = 2

    UNION ALL

    -- 4. Health & Sanitation Services (Dept 5, 11)
    SELECT s.Id AS ServiceId, z.ZoneId, z.ZoneName, z.ZoneNameLocal, z.OfficerName, z.OfficerNameLocal, z.Designation, z.DesignationLocal, z.MobileNo, z.Email, z.OfficeAddress, z.OfficeAddressLocal, 'DesignatedOfficer' AS OfficerRole, z.ZoneId AS DisplayOrder, CAST(1 AS BIT) AS IsActive
    FROM [RTS].[ServiceMaster] s
    CROSS JOIN (
        VALUES
        (1, N'Prabhag Samiti 1', N'प्रभाग समिती १', N'Dr. Amol Wagh', N'डॉ. अमोल वाघ', N'Medical Health Officer', N'वैद्यकीय आरोग्य अधिकारी', '9822044001', 'health.zone1@akola.gov.in', N'Prabhag Samiti Office 1, Akola', N'प्रभाग समिती कार्यालय क्र. १, अकोला'),
        (2, N'Prabhag Samiti 2', N'प्रभाग समिती २', N'Dr. Dipali More', N'डॉ. दिपाली मोरे', N'Medical Health Officer', N'वैद्यकीय आरोग्य अधिकारी', '9822044002', 'health.zone2@akola.gov.in', N'Prabhag Samiti Office 2, Akola', N'प्रभाग समिती कार्यालय क्र. २, अकोला'),
        (3, N'Prabhag Samiti 3', N'प्रभाग समिती ३', N'Dr. Sandeep Wankhade', N'डॉ. संदीप वानखडे', N'Medical Health Officer', N'वैद्यकीय आरोग्य अधिकारी', '9822044003', 'health.zone3@akola.gov.in', N'Prabhag Samiti Office 3, Akola', N'प्रभाग समिती कार्यालय क्र. ३, अकोला'),
        (4, N'Prabhag Samiti 4', N'प्रभाग समिती ४', N'Dr. Surekha Chavan', N'डॉ. सुरेखा चव्हाण', N'Medical Health Officer', N'वैद्यकीय आरोग्य अधिकारी', '9822044004', 'health.zone4@akola.gov.in', N'Prabhag Samiti Office 4, Akola', N'प्रभाग समिती कार्यालय क्र. ४, अकोला')
    ) AS z(ZoneId, ZoneName, ZoneNameLocal, OfficerName, OfficerNameLocal, Designation, DesignationLocal, MobileNo, Email, OfficeAddress, OfficeAddressLocal)
    WHERE s.DepartmentId IN (5, 11)

    UNION ALL

    -- 5. Remaining Services (Trade, Education, Tree, etc.)
    SELECT s.Id AS ServiceId, z.ZoneId, z.ZoneName, z.ZoneNameLocal, z.OfficerName, z.OfficerNameLocal, z.Designation, z.DesignationLocal, z.MobileNo, z.Email, z.OfficeAddress, z.OfficeAddressLocal, 'DesignatedOfficer' AS OfficerRole, z.ZoneId AS DisplayOrder, CAST(1 AS BIT) AS IsActive
    FROM [RTS].[ServiceMaster] s
    CROSS JOIN (
        VALUES
        (1, N'Prabhag Samiti 1', N'प्रभाग समिती १', N'Arvind More', N'श्री. अरविंद मोरे', N'Ward Officer', N'प्रभाग अधिकारी', '9822055001', 'zone1@akola.gov.in', N'Prabhag Samiti Office 1, Akola', N'प्रभाग समिती कार्यालय क्र. १, अकोला'),
        (2, N'Prabhag Samiti 2', N'प्रभाग समिती २', N'Kiran Salve', N'श्री. किरण साळवे', N'Ward Officer', N'प्रभाग अधिकारी', '9822055002', 'zone2@akola.gov.in', N'Prabhag Samiti Office 2, Akola', N'प्रभाग समिती कार्यालय क्र. २, अकोला'),
        (3, N'Prabhag Samiti 3', N'प्रभाग समिती ३', N'Sunita Bhonde', N'सौ. सुनिता भोंडे', N'Ward Officer', N'प्रभाग अधिकारी', '9822055003', 'zone3@akola.gov.in', N'Prabhag Samiti Office 3, Akola', N'प्रभाग समिती कार्यालय क्र. ३, अकोला'),
        (4, N'Prabhag Samiti 4', N'प्रभाग समिती ४', N'Deepak Waghmare', N'श्री. दिपक वाघमारे', N'Ward Officer', N'प्रभाग अधिकारी', '9822055004', 'zone4@akola.gov.in', N'Prabhag Samiti Office 4, Akola', N'प्रभाग समिती कार्यालय क्र. ४, अकोला')
    ) AS z(ZoneId, ZoneName, ZoneNameLocal, OfficerName, OfficerNameLocal, Designation, DesignationLocal, MobileNo, Email, OfficeAddress, OfficeAddressLocal)
    WHERE s.DepartmentId NOT IN (1, 2, 4, 5, 11)
) AS source
ON (target.[ServiceId] = source.[ServiceId] AND target.[ZoneId] = source.[ZoneId])
WHEN MATCHED THEN
    UPDATE SET
        target.[ZoneName]           = source.[ZoneName],
        target.[ZoneNameLocal]      = source.[ZoneNameLocal],
        target.[OfficerName]        = source.[OfficerName],
        target.[OfficerNameLocal]   = source.[OfficerNameLocal],
        target.[Designation]        = source.[Designation],
        target.[DesignationLocal]   = source.[DesignationLocal],
        target.[MobileNo]           = source.[MobileNo],
        target.[Email]              = source.[Email],
        target.[OfficeAddress]      = source.[OfficeAddress],
        target.[OfficeAddressLocal] = source.[OfficeAddressLocal],
        target.[OfficerRole]        = source.[OfficerRole],
        target.[DisplayOrder]       = source.[DisplayOrder],
        target.[IsActive]           = source.[IsActive]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([ServiceId], [ZoneId], [ZoneName], [ZoneNameLocal], [OfficerName], [OfficerNameLocal], [Designation], [DesignationLocal], [MobileNo], [Email], [OfficeAddress], [OfficeAddressLocal], [OfficerRole], [DisplayOrder], [IsActive])
    VALUES (source.[ServiceId], source.[ZoneId], source.[ZoneName], source.[ZoneNameLocal], source.[OfficerName], source.[OfficerNameLocal], source.[Designation], source.[DesignationLocal], source.[MobileNo], source.[Email], source.[OfficeAddress], source.[OfficeAddressLocal], source.[OfficerRole], source.[DisplayOrder], source.[IsActive]);
GO
