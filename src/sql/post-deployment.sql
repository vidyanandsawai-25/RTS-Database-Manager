-- Post-Deployment Script
-- This script runs ALWAYS after base schema creation or upgrades are complete

GO

-- Update default ULB Master record to Akola Municipal Corporation
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
    PRINT 'UlbMaster updated to Akola Municipal Corporation successfully.';
END
ELSE
BEGIN
    -- If no record exists, insert the Akola record
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
    PRINT 'UlbMaster Akola Municipal Corporation record inserted successfully.';
END

GO
