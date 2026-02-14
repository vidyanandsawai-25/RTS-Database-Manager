SET NOCOUNT ON; 
SET XACT_ABORT ON; 
BEGIN TRANSACTION;  

--------------------------------------------------
--  Insert seed data (UPSERT: insert new + update existing translations)
--------------------------------------------------


MERGE [CORE].[MultilingualResource] AS tgt
USING (
    SELECT
        src.[Context],
        src.[Key],
        src.[English],
        src.[Hindi],
        src.[Marathi],
        src.[CreatedBy],
        src.[CreatedDate],
        src.[UpdatedBy],
        src.[UpdatedDate],
        src.[IsActive]
    FROM (VALUES
        (N'ValidationMessages',N'Construction_Description_MaxLen_100',N'Description must be at most 100 characters',N'Description अधिकतम 100 अक्षरों का होना चाहिए',N'Description जास्तीत जास्त 100 अक्षरे असावी',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Construction_DescriptionEnglish_MaxLen_100',N'Description (English) must be at most 100 characters',N'Description (English) अधिकतम 100 अक्षरों का होना चाहिए',N'Description (English) जास्तीत जास्त 100 अक्षरे असावी',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Construction_GroupID_MaxLen_50',N'GroupID must be at most 50 characters',N'GroupID अधिकतम 50 अक्षरों का होना चाहिए',N'GroupID जास्तीत जास्त 50 अक्षरे असावे',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Construction_SearchTerm_MaxLen_20',N'SearchTerm must be at most 20 characters',N'SearchTerm अधिकतम 20 अक्षरों का होना चाहिए',N'SearchTerm जास्तीत जास्त 20 अक्षरे असावे',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'ConstructionId_MaxLen_7',N'ConstructionId must be at most 7 characters',N'निर्माण ID अधिकतम 7 अक्षरों का होना चाहिए',N'बांधकामाचा ID जास्तीत जास्त 7 अक्षरे असावीत',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'ConstructionId_Required',N'Construction type is required',N'निर्माण का प्रकार आवश्यक है',N'बांधकामाचा प्रकार आवश्यक आहे',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Description_MaxLen_100',N'Description must be at most 100 characters',N'Description अधिकतम 100 अक्षरों का होना चाहिए',N'Description जास्तीत जास्त 100 अक्षरे असावी',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'DescriptionEnglish_MaxLen_100',N'Description (English) must be at most 100 characters',N'Description (English) अधिकतम 100 अक्षरों का होना चाहिए',N'Description (English) जास्तीत जास्त 100 अक्षरे असावी',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'FloorID_MaxLen_5',N'FloorID must be at most 5 characters',N'मंज़िल ID अधिकतम 5 अक्षरों का होना चाहिए',N'मजला ID जास्तीत जास्त 5 अक्षरे असावीत',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'FloorID_Required',N'Floor is required',N'मंज़िल आवश्यक है',N'मजला आवश्यक आहे',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_SearchTerm_MaxLen_20',N'SearchTerm must be at most 20 characters.',N'SearchTerm अधिकतम 20 अक्षरों का होना चाहिए।',N'SearchTerm जास्तीत जास्त 20 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_SearchSequence_Min_1',N'SearchSequence must be greater than 0.',N'SearchSequence 0 से अधिक होना चाहिए।',N'SearchSequence 0 पेक्षा जास्त असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_PropertyDescription_Len_8_100',N'PropertyDescription must be between 8 and 100 characters.',N'PropertyDescription 8 से 100 अक्षरों के बीच होना चाहिए।',N'PropertyDescription 8 ते 100 अक्षरांच्या दरम्यान असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_PropertyDescriptionEnglish_Len_8_100',N'PropertyDescriptionEnglish must be between 8 and 100 characters.',N'PropertyDescriptionEnglish 8 से 100 अक्षरों के बीच होना चाहिए।',N'PropertyDescriptionEnglish 8 ते 100 अक्षरांच्या दरम्यान असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_PropertyTypeCategoryID_Min_1',N'PropertyTypeCategoryID must be greater than 0.',N'PropertyTypeCategoryID 0 से अधिक होना चाहिए।',N'PropertyTypeCategoryID 0 पेक्षा जास्त असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_PropertyTypeGroup_MaxLen_50',N'PropertyTypeGroup must be at most 50 characters.',N'PropertyTypeGroup अधिकतम 50 अक्षरों का होना चाहिए।',N'PropertyTypeGroup जास्तीत जास्त 50 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'PropertyType_Type_MaxLen_5',N'Type must be at most 5 characters.',N'Type अधिकतम 5 अक्षरों का होना चाहिए।',N'Type जास्तीत जास्त 5 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_ConstructionID_MaxLen_7',N'ConstructionID must be at most 7 characters.',N'ConstructionID अधिकतम 7 अक्षरों का होना चाहिए।',N'ConstructionID जास्तीत जास्त 7 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_FloorID_MaxLen_5',N'FloorID must be at most 5 characters.',N'FloorID अधिकतम 5 अक्षरों का होना चाहिए।',N'FloorID जास्तीत जास्त 5 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_MaxYear_Range_1_9999',N'MaxYear must be between 1 and 9999.',N'MaxYear 1 और 9999 के बीच होना चाहिए।',N'MaxYear 1 ते 9999 दरम्यान असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_MinYear_Range_1_9999',N'MinYear must be between 1 and 9999.',N'MinYear 1 और 9999 के बीच होना चाहिए।',N'MinYear 1 ते 9999 दरम्यान असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_RateSquareFeet_Min_0',N'RateSquareFeet must be greater than or equal to 0.',N'RateSquareFeet 0 या उससे अधिक होना चाहिए।',N'RateSquareFeet 0 किंवा त्यापेक्षा जास्त असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_RateSquareMeter_Min_0',N'RateSquareMeter must be greater than or equal to 0.',N'RateSquareMeter 0 या उससे अधिक होना चाहिए।',N'RateSquareMeter 0 किंवा त्यापेक्षा जास्त असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_TaxZoneNo_MaxLen_10',N'TaxZoneNo must be at most 10 characters.',N'TaxZoneNo अधिकतम 10 अक्षरों का होना चाहिए।',N'TaxZoneNo जास्तीत जास्त 10 अक्षरांचे असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'Rate_Year_Range_1_9999',N'Year must be between 1 and 9999.',N'Year 1 और 9999 के बीच होना चाहिए।',N'Year 1 ते 9999 दरम्यान असावे.',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'SubFloorId_MaxLen_5',N'SubFloorId must be at most 5 characters.',N'उप मंज़िल ID अधिकतम 5 अक्षरों का होना चाहिए',N'उप मजला ID जास्तीत जास्त 5 अक्षरे असावीत',NULL,NULL,NULL,NULL,1),
        (N'ValidationMessages',N'SubFloorId_Required',N'Sub Floor is required.',N'उप मंज़िल आवश्यक है',N'उप मजला आवश्यक आहे',NULL,NULL,NULL,NULL,1)

        --------------------------------------------------
        -- For developers: add new rows ABOVE this comment, after the last existing row.
        -- Ensure each new row ends with a comma, and the final row has no trailing comma.
        --------------------------------------------------
    ) AS src
    (
        [Context], [Key],
        [English], [Hindi], [Marathi],
        [CreatedBy], [CreatedDate],
        [UpdatedBy], [UpdatedDate],
        [IsActive]
    )
) AS src
ON tgt.[Context] = src.[Context]
AND tgt.[Key] = src.[Key]

WHEN MATCHED AND (
       ISNULL(tgt.[English], N'')  <> ISNULL(src.[English], N'')
    OR ISNULL(tgt.[Hindi], N'')    <> ISNULL(src.[Hindi], N'')
    OR ISNULL(tgt.[Marathi], N'')  <> ISNULL(src.[Marathi], N'')
    OR ISNULL(tgt.[IsActive], 0)   <> ISNULL(src.[IsActive], 0)
)
THEN UPDATE SET
    tgt.[English] = src.[English],
    tgt.[Hindi] = src.[Hindi],
    tgt.[Marathi] = src.[Marathi],
    tgt.[IsActive] = src.[IsActive],
    tgt.[UpdatedBy] = src.[UpdatedBy],
    tgt.[UpdatedDate] = GETDATE()

WHEN NOT MATCHED BY TARGET
THEN INSERT
(
    [Context], [Key],
    [English], [Hindi], [Marathi],
    [CreatedBy], [CreatedDate],
    [UpdatedBy], [UpdatedDate],
    [IsActive]
)
VALUES
(
    src.[Context], src.[Key],
    src.[English], src.[Hindi], src.[Marathi],
    src.[CreatedBy], ISNULL(src.[CreatedDate], GETDATE()),
    src.[UpdatedBy], ISNULL(src.[UpdatedDate], GETDATE()),
    src.[IsActive]
);


-------------------------------------------------- 
--  Commit 
-------------------------------------------------- 
COMMIT TRANSACTION; 