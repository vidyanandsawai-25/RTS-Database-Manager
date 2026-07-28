/* ============================================================================
   Version 1.1.1 - Align RTS screen access with the canonical dashboard routes
   ============================================================================ */
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @RtsDepartmentId INT;

    SELECT @RtsDepartmentId = [Id]
    FROM [CORE].[DepartmentMaster]
    WHERE [DepartmentCode] = 'RTS';

    IF @RtsDepartmentId IS NULL
        THROW 51000, 'RTS Department must exist before dashboard routes are upgraded.', 1;

    UPDATE [CORE].[ScreenMaster]
    SET [RoutePath] =
        CASE [ScreenCode]
            WHEN 'RTS_MIS' THEN N'/rts/dashboard/rts-mis'
            WHEN 'RTS_APP' THEN N'/rts/dashboard/rts-applications'
        END,
        [UpdatedDate] = GETDATE()
    WHERE [DepartmentId] = @RtsDepartmentId
      AND [ScreenCode] IN ('RTS_MIS', 'RTS_APP');

    IF @@ROWCOUNT <> 2
        THROW 51001, 'Expected both RTS_MIS and RTS_APP screens before updating dashboard routes.', 1;

    COMMIT TRANSACTION;
    PRINT 'RTS MIS and application dashboard routes aligned for version 1.1.1.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO
