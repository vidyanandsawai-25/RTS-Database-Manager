
-- Seed default ULB types
IF NOT EXISTS (SELECT 1 FROM [CORE].[UlbType] WHERE [Id] = 1)
BEGIN
    SET IDENTITY_INSERT [CORE].[UlbType] ON;
    INSERT INTO [CORE].[UlbType] ([Id], [UlbTypeName], [IsActive])
    VALUES 
        (1, 'Corporation', 1),
        (2, 'Council', 1),
        (3, 'Nagar Panchayat', 1);
    SET IDENTITY_INSERT [CORE].[UlbType] OFF;
    PRINT 'UlbType seeded successfully in core.';
END

-- Seed default ULB Master record to Akola Municipal Corporation
IF EXISTS (SELECT 1 FROM [CORE].[UlbMaster] WHERE [Id] = 1)
BEGIN
    UPDATE [CORE].[UlbMaster]
    SET 
        [UlbCode] = 'AK001',
        [UlbName] = 'AKOLA MUNICIPAL CORPORATION',
        [UlbNameLocal] = N'अकोला महानगरपालिका अकोला',
        [UlbLogo] = 'https://akolamc.in/images/councilLogo/akola.png',
        [EmailId] = 'akolamc@gmail.com',
        [WebsiteUrl] = 'akolamc.in',
        [UlbAddress] = 'Akola',
        [District] = 'Akola',
        [PinCode] = '444001',
        [UpdatedDate] = GETDATE()
    WHERE [Id] = 1;
    PRINT 'UlbMaster updated to Akola Municipal Corporation successfully in core.';
END
ELSE
BEGIN
    SET IDENTITY_INSERT [CORE].[UlbMaster] ON;
    INSERT INTO [CORE].[UlbMaster] (
        [Id], [UlbCode], [UlbName], [UlbNameLocal], [UlbTypeId], 
        [UlbLogo], [EmailId], [MobileNo], [AlternateMobileNo], [WebsiteUrl], 
        [ContactPersonName], [ContactPersonDesignation], [UlbAddress], [State], [District], [PinCode], [IsActive]
    )
    VALUES (
        1, 'AK001', 'AKOLA MUNICIPAL CORPORATION', N'अकोला महानगरपालिका अकोला', 1, 
        'https://akolamc.in/images/councilLogo/akola.png', 'akolamc@gmail.com', '111111', '110000', 'akolamc.in', 
        'abc', '01210', 'Akola', 'MH', 'Akola', '444001', 1
    );
    SET IDENTITY_INSERT [CORE].[UlbMaster] OFF;
    PRINT 'UlbMaster Akola Municipal Corporation record inserted successfully in core.';
END

SET IDENTITY_INSERT [CORE].[DepartmentMaster] ON;

INSERT INTO [CORE].[DepartmentMaster]
(
    [Id],[DepartmentCode],[DepartmentName],
    [DepartmentNameLocal],[DepartmentIcon],
    [DepartmentDescription],[IsActive],
    [CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate]
)
SELECT *
FROM
(
    VALUES
    (1,'PTIS','Property Tax','string','string','string',1,0,GETDATE(),NULL,NULL),
    (2,'TL','Trade License','string','string','string',1,0,GETDATE(),NULL,NULL),
    (3,'AM','Asset Management','string','string','string',1,0,GETDATE(),NULL,NULL),
    (4,'WT','Water Tax','string','string','string',1,0,GETDATE(),NULL,NULL)
) S
(
    Id,DepartmentCode,DepartmentName,
    DepartmentNameLocal,DepartmentIcon,
    DepartmentDescription,IsActive,
    CreatedBy,CreatedDate,UpdatedBy,UpdatedDate
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[DepartmentMaster] D
    WHERE D.Id = S.Id
       OR D.DepartmentCode = S.DepartmentCode
);

SET IDENTITY_INSERT [CORE].[DepartmentMaster] OFF;


IF NOT EXISTS
(
    SELECT 1
    FROM CORE.EmployeeTypeMaster
    WHERE EmployeeType = 'Office'
)
BEGIN
    INSERT INTO CORE.EmployeeTypeMaster
    (
        EmployeeType,
        IsActive,
        CreatedBy,
        CreatedDate
    )
    VALUES
    (
        'Office',
        1,
        1,
        GETDATE()
    );
END


/* =========================================
   UserRoleMaster
 =======================================*/
IF NOT EXISTS
(
    SELECT 1
    FROM CORE.UserRoleMaster
    WHERE UserRoleName = 'Admin'
)
BEGIN
    INSERT INTO CORE.UserRoleMaster
    (
        UserRoleName,
        DepartmentId,
        IsActive,
        CreatedBy,
        CreatedDate
    )
    VALUES
    (
        'Admin',
        1,
        1,
        1,
        GETDATE()
    );
END


/* =========================================
   UserMaster
 =======================================*/

DECLARE @EmployeeTypeId INT =
(
    SELECT TOP 1 Id
    FROM CORE.EmployeeTypeMaster
    WHERE EmployeeType = 'Office'
);

IF NOT EXISTS
(
    SELECT 1
    FROM CORE.UserMaster
    WHERE UserName = 'ADMIN'
)
BEGIN
    INSERT INTO [CORE].[UserMaster]
    (
        [UserName],[FirstName],[MiddleName],[LastName],
        [UserCode],[Address],[MobileNo],
        [AlternateMobileNo],[Email],[MustChangePassword],
        [Language],[IsActive],[Remark],[EmployeeTypeId],
        [PasswordHash],[FailedLoginCount],[LastLoginAt],
        [LockedUntilAt],[CreatedBy],[CreatedDate],
        [UpdatedBy],[UpdatedDate],[MarkedForDeletion],
        [MarkedForDeletionDate],[UserLocked]
    )
    VALUES
    (
        N'ADMIN',
        N'ADMIN',
        N'ADMIN',
        N'ADMIN',
        N'PB',
        N'Amravati',
        N'7058601590',
        N'8625085936',
        N'ashwindeshmukh62@gmail.com',
        0,
        N'en',
        1,
        N'Test',
        @EmployeeTypeId,
        N'$2a$12$UrYOuPYbZ2y17gPcoIDtzu2V8GymSpKa/YBByn3q/Q0JxlmjixqAC',
        0,
        GETDATE(),
        NULL,
        1,
        GETDATE(),
        NULL,
        NULL,
        0,
        NULL,
        0
    );
END


/* =========================================
   Variable References
 =======================================*/
DECLARE @adminUserId INT =
(
    SELECT Id
    FROM CORE.UserMaster
    WHERE UserName = 'ADMIN'
);

DECLARE @AdminUserRoleId INT =
(
    SELECT Id
    FROM CORE.UserRoleMaster
    WHERE UserRoleName = 'Admin'
);


/* =========================================
   UserDepartmentAllocation
    =======================================*/

SET IDENTITY_INSERT [CORE].[UserDepartmentAllocation] ON;

INSERT INTO [CORE].[UserDepartmentAllocation]
(
    [Id],[UserId],[DepartmentId],
    [IsActive],[CreatedBy],
    [CreatedDate],[UpdatedBy],[UpdatedDate]
)
SELECT *
FROM
(
    VALUES
    (7,@adminUserId,1,1,1,GETDATE(),NULL,NULL),
    (8,@adminUserId,2,1,1,GETDATE(),NULL,NULL),
    (9,@adminUserId,3,1,1,GETDATE(),NULL,NULL)
) S
(
    Id,UserId,DepartmentId,
    IsActive,CreatedBy,
    CreatedDate,UpdatedBy,UpdatedDate
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserDepartmentAllocation] UDA
    WHERE UDA.Id = S.Id
       OR (
            UDA.UserId = S.UserId
        AND UDA.DepartmentId = S.DepartmentId
       )
);

SET IDENTITY_INSERT [CORE].[UserDepartmentAllocation] OFF;


/* =========================================
   UserModuleAllocation
 =======================================*/

SET IDENTITY_INSERT [CORE].[UserModuleAllocation] ON;

INSERT INTO [CORE].[UserModuleAllocation]
(
    [Id],[UserId],[DepartmentId],[ModuleId],
    [IsActive],[CreatedBy],[CreatedDate],
    [UpdatedBy],[UpdatedDate]
)
SELECT *
FROM
(
    VALUES
    (5,@adminUserId,1,1,1,1,GETDATE(),NULL,NULL),
    (6,@adminUserId,2,1001,1,1,GETDATE(),NULL,NULL),
    (7,@adminUserId,3,1004,1,1,GETDATE(),NULL,NULL)
) S
(
    Id,UserId,DepartmentId,ModuleId,
    IsActive,CreatedBy,CreatedDate,
    UpdatedBy,UpdatedDate
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserModuleAllocation] UMA
    WHERE UMA.Id = S.Id
       OR (
            UMA.UserId = S.UserId
        AND UMA.DepartmentId = S.DepartmentId
        AND UMA.ModuleId = S.ModuleId
       )
);

SET IDENTITY_INSERT [CORE].[UserModuleAllocation] OFF;


/* =========================================
   UserRoleAllocation
    =======================================*/

SET IDENTITY_INSERT [CORE].[UserRoleAllocation] ON;

INSERT INTO [CORE].[UserRoleAllocation]
(
    [Id],[UserId],[DepartmentId],[UserRoleId],
    [IsActive],[CreatedBy],[CreatedDate],
    [UpdatedBy],[UpdatedDate]
)
SELECT *
FROM
(
    VALUES
    (4,@adminUserId,1,@AdminUserRoleId,1,1,GETDATE(),NULL,NULL),
    (5,@adminUserId,2,@AdminUserRoleId,1,1,GETDATE(),NULL,NULL),
    (6,@adminUserId,3,@AdminUserRoleId,1,1,GETDATE(),NULL,NULL)
) S
(
    Id,UserId,DepartmentId,UserRoleId,
    IsActive,CreatedBy,CreatedDate,
    UpdatedBy,UpdatedDate
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[UserRoleAllocation] URA
    WHERE URA.Id = S.Id
       OR (
            URA.UserId = S.UserId
        AND URA.DepartmentId = S.DepartmentId
        AND URA.UserRoleId = S.UserRoleId
       )
);

SET IDENTITY_INSERT [CORE].[UserRoleAllocation] OFF;
GO



SET IDENTITY_INSERT [CORE].[ModuleMaster] ON;

;WITH SeedData AS
(
    SELECT *
    FROM
    (
        VALUES
        (1, 1, N'PTIS_M', N'Property Tax', N'Property Tax', N'home', N'PTIS', N'Property Tax Module', 1, 1, GETDATE(), NULL, NULL),
        (1001, 2, N'TL_M', N'Trade License', N'Trade License', N'home', N'TL', N'Trade License Module', 1, 1, GETDATE(), NULL, NULL),
        (1004, 3, N'AM_M', N'Asset Management', N'Asset Management', N'home', N'AM', N'Asset Management Module', 1, 1, GETDATE(), NULL, NULL)
    ) AS V
    (
        Id, DepartmentId, ModuleCode, ModuleName, ModuleNameLocal,
        ModuleIcon, ModuleLabel, ModuleDescription,
        IsActive, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    )
)
INSERT INTO [CORE].[ModuleMaster]
(
    [Id],[DepartmentId],[ModuleCode],[ModuleName],[ModuleNameLocal],
    [ModuleIcon],[ModuleLabel],[ModuleDescription],
    [IsActive],[CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate]
)
SELECT
    S.Id,
    S.DepartmentId,
    S.ModuleCode,
    S.ModuleName,
    S.ModuleNameLocal,
    S.ModuleIcon,
    S.ModuleLabel,
    S.ModuleDescription,
    ISNULL(S.IsActive,1),
    S.CreatedBy,
    ISNULL(S.CreatedDate,GETDATE()),
    S.UpdatedBy,
    S.UpdatedDate
FROM SeedData S
WHERE EXISTS
(
    SELECT 1
    FROM [CORE].[DepartmentMaster] D
    WHERE D.Id = S.DepartmentId
)
AND NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ModuleMaster] MM
    WHERE MM.Id = S.Id
       OR MM.ModuleCode = S.ModuleCode
       OR MM.ModuleName = S.ModuleName
);

SET IDENTITY_INSERT [CORE].[ModuleMaster] OFF;


SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] ON;

;WITH SeedData AS
(
    SELECT *
    FROM
    (
        VALUES
        (1, N'Masters', N'Masters', N'Masters', N'one', 1, 0, NULL, CAST(N'2026-01-09T11:06:52.080' AS DATETIME), NULL, CAST(N'2026-05-07T16:26:08.887' AS DATETIME)),
        (2, N'Configuration Setting', N'Configuration Setting', NULL, N'FolderTree', 1, 0, NULL, CAST(N'2026-03-25T12:38:09.827' AS DATETIME), NULL, CAST(N'2026-04-06T14:37:29.003' AS DATETIME)),
        (3, N'GRP_DASHBOARD', N'Dashboard', N'GRP', N'dashboard', 1, 1, 1, CAST(N'2026-05-05T19:50:22.753' AS DATETIME), NULL, NULL),

        (1003, N'SG004_A', N'वापरकर्ता व्यवस्थापन', N'वापरकर्ता व्यवस्थापन', N'user-icon', 5, 1, 1, CAST(N'2026-05-06T15:43:16.677' AS DATETIME), 1, CAST(N'2026-05-07T18:51:57.687' AS DATETIME)),

        (1004, N'SG004_B', N'User Management', N'User_M', N'user-icon', 4, 1, 1, CAST(N'2026-05-06T16:07:02.837' AS DATETIME), NULL, NULL),

        (1005, N'SG004_C', N'User Management', N'User_M', N'user-icon', 4, 1, 1, CAST(N'2026-05-06T16:10:02.513' AS DATETIME), NULL, NULL),

        (1006, N'SG005', N'Reports', N'अहवाल', N'report-icon', 5, 0, 1, CAST(N'2026-05-06T17:40:53.643' AS DATETIME), NULL, CAST(N'2026-05-07T16:54:29.060' AS DATETIME))
    ) AS V
    (
        Id, ScreenGroupCode, ScreenGroupName, ScreenGroupNameLocal,
        ScreenGroupIcon, DisplayOrder, IsActive,
        CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
    )
)

INSERT INTO [CORE].[ScreenGroupMaster]
(
    [Id], [ScreenGroupCode], [ScreenGroupName], [ScreenGroupNameLocal],
    [ScreenGroupIcon], [DisplayOrder], [IsActive],
    [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]
)
SELECT
    S.Id,
    S.ScreenGroupCode,
    S.ScreenGroupName,
    S.ScreenGroupNameLocal,
    S.ScreenGroupIcon,
    ISNULL(S.DisplayOrder,1),
    ISNULL(S.IsActive,1),
    S.CreatedBy,
    ISNULL(S.CreatedDate,GETDATE()),
    S.UpdatedBy,
    S.UpdatedDate
FROM SeedData S
WHERE NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenGroupMaster] X
    WHERE X.Id = S.Id
)
AND NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenGroupMaster] X
    WHERE X.ScreenGroupCode = S.ScreenGroupCode
);

SET IDENTITY_INSERT [CORE].[ScreenGroupMaster] OFF;



SET IDENTITY_INSERT [CORE].[ScreenMaster] ON;

;WITH SeedData AS
(
    SELECT *
    FROM
    (
        VALUES
        (1,1,1,N'M',N'Data Analytics',N'Data Analytics',N'',N'proprtytax/departmentmaster',1,0,0,1,1,NULL,CAST('2026-01-09T11:08:13.743' AS DATETIME),NULL,CAST('2026-04-06T15:24:22.910' AS DATETIME)),
        (2,2,1,N'BM',N'Search Property',N'Search Property',NULL,N'/bank-master',1,0,0,1,2,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (3,2,1,N'SM',N'PTIS',N'PTIS',NULL,N'/screen-access',1,1,0,1,3,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (4,2,1,N'OM',N'Report Engine',N'Report Engine',NULL,N'/office-master',1,1,0,1,4,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (5,2,1,N'UC',N'GIS',N'GIS',NULL,N'/ulb-configuration',1,1,0,1,5,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (6,2,1,N'FY',N'Master',N'Master',NULL,N'/financial-year-master',1,1,0,1,6,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (7,2,1,N'PM',N'User Management',N'User Management',NULL,N'/payment-mode-master',1,1,0,1,7,NULL,CAST('2026-03-25T12:38:22.990' AS DATETIME),NULL,NULL),
        (8,1,1,N'TEST',N'test',N'test',N'Monitor',N'/test',1,1,0,1,8,NULL,CAST('2026-04-06T14:38:12.743' AS DATETIME),2,CAST('2026-05-05T19:33:13.623' AS DATETIME)),
        (1008,2,1001,N'SRC101',N'Screen Name 101',N'Screen Name 101',N'Monitor',N'/scr-101',1,1,0,1,9,NULL,CAST('2026-04-09T16:03:50.443' AS DATETIME),NULL,NULL),
        (1009,1,1,N'TEST1',N'test1',N'test1',N'Monitor',N'/tst1',1,1,0,1,10,NULL,CAST('2026-04-09T19:03:11.097' AS DATETIME),NULL,NULL),
        (1010,2,1004,N'SRC103',N'Screen Name 103',N'Screen Name 103',N'Monitor',N'/scr-103',1,1,0,1,11,NULL,CAST('2026-04-09T16:03:50.443' AS DATETIME),NULL,NULL),
        (1011,1,1,N'CT_01',N'Construction Type',N'बांधकाम प्रकार',NULL,N'/construction-type',1,1,0,1,1,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1012,1,1,N'FM_01',N'Floor Master',N'मजला मास्टर',NULL,N'/floor-master/floor',1,1,0,1,2,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1013,1,1,N'DM_01',N'Depreciation Master',N'घसारा मास्टर',NULL,N'/depreciationmaster',1,1,0,0,3,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,CAST('2026-05-08T16:24:38.507' AS DATETIME)),
        (1014,1,1,N'TU_01',N'Type of Use Master',N'वापर प्रकार मास्टर',NULL,N'/typeofusemaster',1,1,0,1,4,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1015,1,1,N'TZ_01',N'Tax Zone',N'कर क्षेत्र',NULL,N'/taxzone',1,1,0,1,5,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1016,1,1,N'RS_01',N'Rate Section Master',N'दर विभाग मास्टर',NULL,N'/rate-section-master',1,1,0,1,6,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1017,1,1,N'ZM_01_A',N'Zone Master',N'झोन मास्टर',NULL,N'/zone-master',1,1,0,1,7,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1018,1,1,N'RM_01',N'Rate Master (RV)',N'दर मास्टर (RV)',NULL,N'/rate-master/rvratemaster',1,1,0,1,8,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1019,1,1,N'RP_01',N'Retention Policy (Year)',N'रिटेन्शन पॉलिसी (वर्ष)',NULL,N'/retentionpolicy/yearwise',1,1,0,1,9,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1020,1,1,N'RP_02',N'Retention Policy (Factor)',N'रिटेन्शन पॉलिसी (फॅक्टर)',NULL,N'/retentionpolicy/factorwise',1,1,0,1,10,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1021,1,1,N'WM_01',N'Weightage Master',N'वेटेज मास्टर',NULL,N'/weightage-master',1,1,0,1,11,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1022,1,1,N'TN_01',N'Tax Zoning',N'कर झोनिंग',NULL,N'/taxzoning',1,1,0,1,12,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1023,1,1,N'AY_01',N'Assessment Year Range',N'मूल्यांकन वर्ष श्रेणी',NULL,N'/assessment-year-range/capitalvalue',1,1,0,1,13,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1024,1,1,N'MJ_01',N'Mouja Master',N'मौजा मास्टर',NULL,N'/moujamaster',1,1,0,1,14,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (1025,1,1,N'PY_01',N'Property Type',N'मालमत्ता प्रकार',NULL,N'/propertytype',1,1,0,1,15,NULL,CAST('2026-04-28T15:46:49.360' AS DATETIME),NULL,NULL),
        (2011,1,1,N'ZM_01_B',N'Zone Master',N'झोन मास्टर',NULL,N'/zone-master',1,1,0,1,7,1,CAST('2026-05-05T16:10:46.620' AS DATETIME),NULL,NULL),
        (2012,2,1,N'T1',N'TestTest',N'TestTest',N'Monitor',N'/testtest',0,1,0,1,0,2,CAST('2026-05-05T19:26:47.937' AS DATETIME),NULL,NULL),
        (3011,1,1,N'SCR_DASHBOARD',N'Dashboard',N'मुख्यपृष्ठ',N'dashboard-icon',N'/dashboard',1,1,0,1,1,1,CAST('2026-05-08T11:22:48.963' AS DATETIME),NULL,NULL),
        (3012,2,1,N'AMC_A',N'महानगरपालिका डॅशबोर्ड',N'म.न.पा. मुख्यपृष्ठ',N'AMC-icon',N'/amc',1,1,0,1,1,1,CAST('2026-05-08T12:57:11.273' AS DATETIME),NULL,NULL),
        (3013,2,1,N'AMC_B',N'पुणे_ऑफिस-डॅशबोर्ड',N'म.न_पा',N'AMC-icon',N'/amc',1,0,0,1,1,2,CAST('2026-05-08T13:21:56.270' AS DATETIME),NULL,NULL)
    ) AS V
    (
        Id,ScreenGroupId,ModuleId,ScreenCode,ScreenName,ScreenNameLocal,
        ScreenIcon,RoutePath,IsMenu,IsAuthenticationRequired,IsPropertyLockable,
        IsActive,DisplayOrder,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate
    )
)

INSERT INTO [CORE].[ScreenMaster]
(
    [Id],[ScreenGroupId],[ModuleId],[ScreenCode],[ScreenName],
    [ScreenNameLocal],[ScreenIcon],[RoutePath],[IsMenu],
    [IsAuthenticationRequired],[IsPropertyLockable],[IsActive],[DisplayOrder],
    [CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate]
)
SELECT
    S.Id,
    S.ScreenGroupId,
    S.ModuleId,
    S.ScreenCode,
    S.ScreenName,
    S.ScreenNameLocal,
    S.ScreenIcon,
    S.RoutePath,
    S.IsMenu,
    S.IsAuthenticationRequired,
    S.IsPropertyLockable,
    ISNULL(S.IsActive,1),
    ISNULL(S.DisplayOrder,1),
    S.CreatedBy,
    ISNULL(S.CreatedDate,GETDATE()),
    S.UpdatedBy,
    S.UpdatedDate
FROM SeedData S
INNER JOIN [CORE].[ScreenGroupMaster] SG
    ON SG.Id = S.ScreenGroupId
INNER JOIN [CORE].[ModuleMaster] MM
    ON MM.Id = S.ModuleId
LEFT JOIN [CORE].[ScreenMaster] SM
    ON SM.Id = S.Id
WHERE SM.Id IS NULL
AND NOT EXISTS
(
    SELECT 1
    FROM [CORE].[ScreenMaster] X
    WHERE X.ScreenCode = S.ScreenCode
);

SET IDENTITY_INSERT [CORE].[ScreenMaster] OFF;


/* =========================================
   RoleWiseScreenAccessMaster
    =======================================*/

SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] ON;

;WITH SeedData AS
(
    SELECT *
    FROM
    (
        VALUES
        (1,1,1,1,0,0,0,0,1,GETDATE(),NULL,CAST('2026-05-05T17:13:17.827' AS DATETIME),2),
        (2,1,2,1,0,0,0,0,1,GETDATE(),NULL,CAST('2026-04-23T16:23:59.647' AS DATETIME),2),
        (3,1,3,1,1,0,0,0,1,GETDATE(),NULL,CAST('2026-04-23T16:24:04.193' AS DATETIME),2),
        (4,1,4,1,1,1,1,0,1,GETDATE(),NULL,NULL,NULL),
        (5,1,5,1,1,0,0,0,1,GETDATE(),NULL,CAST('2026-04-23T16:23:59.647' AS DATETIME),2),
        (6,1,6,1,1,1,1,0,1,GETDATE(),NULL,NULL,NULL),
        (7,1,7,1,0,0,0,0,1,GETDATE(),NULL,CAST('2026-04-23T16:23:59.647' AS DATETIME),2),
        (8,1,8,1,0,0,0,0,1,CAST('2026-04-23T16:24:04.243' AS DATETIME),2,NULL,NULL),
        (9,1,1010,1,1,1,0,0,1,CAST('2026-04-23T16:24:04.243' AS DATETIME),2,CAST('2026-05-05T17:13:17.827' AS DATETIME),2),
        (10,1,1008,1,0,0,0,0,1,CAST('2026-04-23T16:24:04.243' AS DATETIME),2,NULL,NULL),
        (11,1,1009,1,1,0,0,0,1,CAST('2026-04-23T16:24:04.243' AS DATETIME),2,NULL,NULL),
        (1008,1,1012,1,0,0,0,0,1,CAST('2026-05-05T11:45:44.033' AS DATETIME),3,NULL,NULL),
        (1009,1,2012,1,1,0,0,0,1,CAST('2026-05-05T19:32:49.543' AS DATETIME),2,NULL,NULL)
    ) AS V
    (
        Id,UserRoleId,ScreenId,
        CanView,CanEdit,CanDelete,
        HaveFullAccess,HaveNoAccess,
        IsActive,CreatedDate,
        CreatedBy,UpdatedDate,UpdatedBy
    )
)

INSERT INTO [CORE].[RoleWiseScreenAccessMaster]
(
    [Id],[UserRoleId],[ScreenId],
    [CanView],[CanEdit],[CanDelete],
    [HaveFullAccess],[HaveNoAccess],
    [IsActive],[CreatedDate],
    [CreatedBy],[UpdatedDate],[UpdatedBy]
)
SELECT
    S.Id,
    S.UserRoleId,
    S.ScreenId,
    S.CanView,
    S.CanEdit,
    S.CanDelete,
    S.HaveFullAccess,
    S.HaveNoAccess,
    ISNULL(S.IsActive,1),
    ISNULL(S.CreatedDate,GETDATE()),
    S.CreatedBy,
    S.UpdatedDate,
    S.UpdatedBy
FROM SeedData S
INNER JOIN [CORE].[UserRoleMaster] UR
    ON UR.Id = S.UserRoleId
INNER JOIN [CORE].[ScreenMaster] SM
    ON SM.Id = S.ScreenId
LEFT JOIN [CORE].[RoleWiseScreenAccessMaster] RW
    ON RW.Id = S.Id
    OR (RW.UserRoleId = S.UserRoleId AND RW.ScreenId = S.ScreenId)
WHERE RW.Id IS NULL;

SET IDENTITY_INSERT [CORE].[RoleWiseScreenAccessMaster] OFF;


SET IDENTITY_INSERT [CORE].[CommonRemarkTypeMaster] ON;

IF NOT EXISTS (
    SELECT 1
    FROM [CORE].[CommonRemarkTypeMaster]
    WHERE [Id] = 1
       OR [RemarkTypeName] = 'MobileNoRemark'
)
BEGIN
    INSERT INTO [CORE].[CommonRemarkTypeMaster]
        ([Id],[RemarkTypeName],[IsActive],[CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate])
    VALUES
        (1,'MobileNoRemark',1,NULL,'2026-05-05T17:23:40.557',NULL,NULL);
END

SET IDENTITY_INSERT [CORE].[CommonRemarkTypeMaster] OFF;

