/* ============================================================================
   Version 1.1.0 - Canonical RTS project screens

   Removes only Right-to-Service screens and their dependent access/lock rows,
   then registers a fresh project-scoped RTS department, module, screen groups,
   screens, Admin role and allocations.
   ============================================================================ */

DECLARE @RtsDepartmentId INT;
DECLARE @RtsModuleId INT;
DECLARE @RtsAdminRoleId INT;
DECLARE @AdminUserId INT;

SELECT @AdminUserId = [Id]
FROM [CORE].[UserMaster]
WHERE [UserName] = N'ADMIN';

IF @AdminUserId IS NULL
    THROW 51100, 'The ADMIN user is required before the RTS migration runs.', 1;

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

/* Remove legacy cross-department role allocations for the RTS department. */
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

/* Capture and remove only the legacy RTS screen graph. */
DECLARE @LegacyRtsScreens TABLE
(
    [ScreenId] INT NOT NULL PRIMARY KEY
);

INSERT INTO @LegacyRtsScreens ([ScreenId])
SELECT [Id]
FROM [CORE].[ScreenMaster]
WHERE [ModuleId] = @RtsModuleId
   OR [ScreenCode] LIKE 'RTS[_]%';

IF OBJECT_ID('PTIS.PropertyScreenLock', 'U') IS NOT NULL
BEGIN
    DELETE screenLock
    FROM [PTIS].[PropertyScreenLock] screenLock
    INNER JOIN @LegacyRtsScreens legacy
        ON legacy.[ScreenId] = screenLock.[LockableScreenId];
END;

DELETE access
FROM [CORE].[RoleWiseScreenAccessMaster] access
INNER JOIN @LegacyRtsScreens legacy
    ON legacy.[ScreenId] = access.[ScreenId];

DELETE screen
FROM [CORE].[ScreenMaster] screen
INNER JOIN @LegacyRtsScreens legacy
    ON legacy.[ScreenId] = screen.[Id];

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
    (N'RTS_DASHBOARD',     'RTS_MIS',           'RTS MIS Dashboard',    N'आरटीएस एमआयएस डॅशबोर्ड', N'LayoutDashboard', N'/rts/dashboard',                            1),
    (N'RTS_OPERATIONS',    'RTS_APP',           'RTS Applications',     N'आरटीएस अर्ज',             N'Files',           N'/rts/applications',                         1),
    (N'RTS_CONFIGURATION', 'RTS_DEPT',          'RTS Departments',      N'आरटीएस विभाग',            N'Building2',       N'/rts/departments',                          1),
    (N'RTS_CONFIGURATION', 'RTS_SERVICES',      'RTS Services',         N'आरटीएस सेवा',             N'Activity',        N'/rts/services',                             2),
    (N'RTS_CONFIGURATION', 'RTS_FIELDS',        'RTS Fields',           N'आरटीएस फील्ड्स',          N'Sliders',         N'/rts/fields',                               3),
    (N'RTS_CONFIGURATION', 'RTS_APPROVAL_FLOW', 'Approval Flow Master', N'मंजुरी प्रवाह मास्टर',     N'GitMerge',        N'/rts/configuration-settings/rts-workflows', 4),
    (N'RTS_CONFIGURATION', 'RTS_USERS',         'RTS User Management',  N'आरटीएस वापरकर्ता व्यवस्थापन', N'Users',       N'/rts/users',                                5);

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
    ON screenGroup.[ScreenGroupCode] = seed.[ScreenGroupCode];

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
    ON seed.[ScreenCode] = screen.[ScreenCode];

PRINT 'RTS screens were reset and seeded project-wise for version 1.1.0.';
GO
