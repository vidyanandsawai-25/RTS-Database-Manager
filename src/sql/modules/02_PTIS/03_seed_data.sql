 INSERT PTIS.ZoneMaster ([ZoneNo], [Description], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
   (N'UT', N'à¤‰à¤¥à¤³à¤¸à¤°', NULL, NULL, NULL),
   (N'NK', N'à¤¨à¥Œà¤ªà¤¾à¤¡à¤¾ - à¤•à¥‹à¤ªà¤°à¥€', NULL, NULL, NULL),
   (N'KL', N'à¤•à¤³à¤µà¤¾', NULL, NULL, NULL),
   (N'MU', N'à¤®à¥à¤‚à¤¬à¥à¤°à¤¾', NULL, NULL, NULL),
   (N'DI', N'à¤¦à¤¿à¤µà¤¾', NULL, NULL, NULL),
   (N'WE', N'à¤µà¤¾à¤—à¤³à¥‡ à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ', NULL, NULL, NULL),
   (N'LS', N'à¤²à¥‹à¤•à¤®à¤¾à¤¨à¥à¤¯ à¤¸à¤¾à¤µà¤°à¤•à¤°', NULL, NULL, NULL),
   (N'VN', N'à¤µà¤°à¥à¤¤à¤•à¤¨à¤—à¤°', NULL, NULL, NULL),
   (N'MM', N'à¤®à¤¾à¤œà¤¿à¤µà¤¡à¤¾ à¤®à¤¾à¤¨à¤ªà¤¾à¤¡à¤¾', NULL, NULL, NULL);

;WITH WardSeed (ZoneNo, WardNo) AS
(
    SELECT * FROM (VALUES
      (N'DI', N'DI1'),
      (N'DI', N'DI2'),
      (N'DI', N'DI3'),
      (N'DI', N'DI4'),
      (N'DI', N'DI5'),
      (N'DI', N'DI6'),
      (N'DI', N'DI7'),
      (N'DI', N'DI8'),
      (N'DI', N'DI9'),
      (N'DI', N'DI10'),
      (N'DI', N'DI11'),
      (N'DI', N'DI12'),
      (N'DI', N'DI13'),
      (N'DI', N'DI14'),
      (N'DI', N'DIMAJOR1'),
      (N'DI', N'DIMAJOR2'),
      (N'KL', N'KL1'),
      (N'KL', N'KL2'),
      (N'KL', N'KL3'),
      (N'KL', N'KL4'),
      (N'KL', N'KL5'),
      (N'KL', N'KL6'),
      (N'KL', N'KL7'),
      (N'KL', N'KL8'),
      (N'KL', N'KL9'),
      (N'KL', N'KL10'),
      (N'KL', N'KL11'),
      (N'KL', N'KL12'),
      (N'KL', N'KL13'),
      (N'KL', N'KL14'),
      (N'KL', N'KLMAJOR1'),
      (N'KL', N'KLMAJOR2'),
      (N'KL', N'KLMAJOR3'),
      (N'LS', N'LS1'),
      (N'LS', N'LS2'),
      (N'LS', N'LS3'),
      (N'LS', N'LS4'),
      (N'LS', N'LS5'),
      (N'LS', N'LS6'),
      (N'LS', N'LS7'),
      (N'LS', N'LS8'),
      (N'LS', N'LS9'),
      (N'LS', N'LS10'),
      (N'LS', N'LS11'),
      (N'LS', N'LS12'),
      (N'LS', N'LS13'),
      (N'LS', N'LS14'),
      (N'LS', N'LSMAJOR1'),
      (N'MM', N'MM1'),
      (N'MM', N'MM2'),
      (N'MM', N'MM3'),
      (N'MM', N'MM4'),
      (N'MM', N'MM5'),
      (N'MM', N'MM6'),
      (N'MM', N'MM7'),
      (N'MM', N'MM8'),
      (N'MM', N'MM9'),
      (N'MM', N'MM10'),
      (N'MM', N'MM11'),
      (N'MM', N'MM12'),
      (N'MM', N'MM13'),
      (N'MM', N'MM14'),
      (N'MM', N'MM15'),
      (N'MM', N'MM16'),
      (N'MM', N'MM17'),
      (N'MM', N'MM18'),
      (N'MM', N'MM19'),
      (N'MM', N'MM20'),
      (N'MM', N'MMMAJOR'),
      (N'MM', N'MMMAJOR2'),
      (N'MM', N'MMMAJOR3'),
      (N'MM', N'MMMAJOR4'),
      (N'MM', N'MMMAJOR5'),
      (N'MU', N'MU1'),
      (N'MU', N'MU2'),
      (N'MU', N'MU3'),
      (N'MU', N'MU4'),
      (N'MU', N'MU5'),
      (N'MU', N'MU6'),
      (N'MU', N'MU7'),
      (N'MU', N'MU8'),
      (N'MU', N'MU9'),
      (N'MU', N'MU10'),
      (N'MU', N'MU11'),
      (N'MU', N'MU12'),
      (N'MU', N'MU13'),
      (N'MU', N'MU14'),
      (N'MU', N'MU15'),
      (N'MU', N'MU16'),
      (N'MU', N'MU17'),
      (N'MU', N'MU18'),
      (N'MU', N'MU19'),
      (N'MU', N'MU20'),
      (N'MU', N'MU21'),
      (N'MU', N'MU22'),
      (N'MU', N'MUMAJOR1'),
      (N'MU', N'MUMAJOR2'),
      (N'MU', N'MUMAJOR3'),
      (N'MU', N'MUMAJOR4'),
      (N'NK', N'NK1'),
      (N'UT', N'UT1'),
      (N'VN', N'VN1'),
      (N'WE', N'WE1')
    ) v(ZoneNo, WardNo)
)
INSERT PTIS.WardMaster (ZoneId, WardNo, [Description])
SELECT z.Id,
       w.WardNo,
       w.WardNo
FROM WardSeed w
JOIN PTIS.ZoneMaster z
  ON z.ZoneNo = w.ZoneNo;


SET IDENTITY_INSERT [PTIS].[TypeOfUseGroupMaster] ON;
GO

INSERT INTO PTIS.TypeOfUseGroupMaster
(Id, TypeOfUseGroupCode, GroupName, GroupIcon, IsProtected, IsOpenPlotGroup)
VALUES
(1, N'R',  N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€',     N'home', 1,0),
(2, N'C',  N'à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•', N'home', 1,0),
(3, N'I',  N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•',   N'home', 1,0),
(4, N'N',  N'à¤‡à¤¤à¤°',        N'home', 1,0),
(5, N'OP', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡',       N'home', 1,1),
(6, N'OPC', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€',       N'home', 1,1),
(7, N'OPI', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•',       N'home', 1,1),
(8, N'OPF', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤¶à¥‡à¤¤à¥€',       N'home', 1,1),
(9, N'OPN', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤•à¤°à¤®à¥à¤•à¥à¤¤',       N'home', 1,1);
GO

SET IDENTITY_INSERT [PTIS].[TypeOfUseGroupMaster] OFF;
GO


SET IDENTITY_INSERT [PTIS].[TypeOfUseGroupMasterCV] ON;
GO

INSERT INTO PTIS.TypeOfUseGroupMasterCV
(Id, TypeOfUseGroupCVCode, GroupName, GroupIcon, IsFloorWiseRateApplicable, IsProtected, CreatedBy, UpdatedBy, UpdatedDate)
VALUES
(1, N'R',  N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ CV',     N'home', 0, 1, NULL, NULL, NULL),
(2, N'C',  N'à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤• CV', N'home', 1, 1, NULL, NULL, NULL),
(3, N'I',  N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤• CV',   N'home', 0, 1, NULL, NULL, NULL),
(4, N'N',  N'à¤‡à¤¤à¤° CV',        N'home', 0, 1, NULL, NULL, NULL),
(5, N'OP', N'à¤ªà¥à¤²à¥‰à¤Ÿ CV',       N'home', 0, 1, NULL, NULL, NULL);
GO

SET IDENTITY_INSERT [PTIS].[TypeOfUseGroupMasterCV] OFF;
GO





INSERT INTO [PTIS].[PropertyAssessmentStatusMaster] (StatusName)
SELECT s.StatusName
FROM (VALUES
    ('ASSESSED'),
    ('UNASSESSED'),
    ('PARTIALLY_ASSESSED'),
    ('UNDER_UNASSESSED')
) s(StatusName)
WHERE NOT EXISTS (
    SELECT 1
    FROM [PTIS].[PropertyAssessmentStatusMaster] p
    WHERE p.StatusName = s.StatusName
);

MERGE [PTIS].[AssessmentYearRangeMasterRV] AS T
USING
(
    VALUES
        (2016, 2026),
        (2005, 2015),
        (2003, 2004),
        (1998, 1998),
        (1700, 1997)
) AS S (FromYear, ToYear)

ON T.FromYear = S.FromYear

WHEN MATCHED
    AND T.ToYear <> S.ToYear
THEN
    UPDATE SET T.ToYear = S.ToYear

WHEN NOT MATCHED THEN
    INSERT (FromYear, ToYear)
    VALUES (S.FromYear, S.ToYear);



MERGE [PTIS].[AssessmentYearRangeMasterCV] AS T
USING
(
    VALUES
        (2016, 2026),
        (2005, 2015),
        (2003, 2004),
        (1998, 1998),
        (1700, 1997)
) AS S (FromYear, ToYear)

ON T.FromYear = S.FromYear

WHEN MATCHED
    AND T.ToYear <> S.ToYear
THEN
    UPDATE SET T.ToYear = S.ToYear

WHEN NOT MATCHED THEN
    INSERT (FromYear, ToYear)
    VALUES (S.FromYear, S.ToYear);







SET IDENTITY_INSERT [PTIS].[TypeOfUseCategoryMaster] ON;
GO

INSERT INTO [PTIS].[TypeOfUseCategoryMaster]
(
    [Id],
    [TypeOfUseCategoryCode],
    [TypeOfUseCategoryName],
    [IsProtected]
)
VALUES
(1, 'Utility',  N'UTILITY', 1),
(2, 'Parking',  N'PARKING', 1),
(3, 'OpenSpace', N'Open Space', 1),
(4, 'OpenPlot', N'Open Plot',      1);
GO

SET IDENTITY_INSERT [PTIS].[TypeOfUseCategoryMaster] OFF;
GO





SET IDENTITY_INSERT [PTIS].[TypeOfUseMaster] ON;
GO

;WITH GroupMap AS
(
    SELECT
        g.Id AS TypeOfUseGroupId,
        g.TypeOfUseGroupCode
    FROM PTIS.TypeOfUseGroupMaster g
),
GroupMapCV AS
(
    SELECT
        gcv.Id AS TypeOfUseGroupCVId,
        gcv.TypeOfUseGroupCVCode
    FROM PTIS.TypeOfUseGroupMasterCV gcv
),
TypeSeed AS
(
    SELECT * FROM (VALUES
(N'R', N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'R', 1, 1,NULL),
(N'C', N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', 1, 0,NULL),
(N'I', N'à¤•à¤¾à¤°à¤–à¤¾à¤¨à¤¾', N'I', N'I', 1, NULL, NULL, N'I', 1, 0,NULL),
(N'T', N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³', N'N', N'N', 1, NULL, NULL, N'T', 1, 1,NULL),
(N'V', N'V-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤Ÿà¥‰à¤¯à¤²à¥“à¤Ÿ à¤¬à¤¾à¤¥', N'N', N'N', 1, NULL, NULL, N'V', 1, 0,NULL),
(N'S', N'à¤¦à¥à¤•à¤¾à¤¨', N'C', N'C', 1, NULL, NULL, N'S', 1, 0,NULL),
(N'D', N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾', N'C', N'C', 1, NULL, NULL, N'D', 1, 0,NULL),
(N'B', N'à¤¬à¤à¤•', N'C', N'C', 1, NULL, NULL, N'B', 1, 0,NULL),
(N'SW', N'à¤œà¤²à¤¤à¤°à¤£ à¤¤à¤²à¤¾à¤µ', N'C', N'C', 1, NULL, NULL, N'S', 4, 0,NULL),

(N'UC', N'à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤šà¤¾à¤²à¥‚ ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0,NULL),
(N'SPK', N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— ', N'R', N'R', 1, NULL, NULL, N'S', 5, 1,1),
(N'N', N'à¤®à¤¨à¤ªà¤¾ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'N', N'N', 1, NULL, NULL, N'N', 1, 1,NULL),
(N'EG', N'à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤¶à¤¾à¤¸à¤•à¥€à¤¯ ', N'C', N'C', 1, NULL, NULL, N'E', 3, 0,NULL),
(N'GO', N'à¤—à¥‹à¤¡à¤¾à¤Šà¤¨', N'C', N'C', 1, NULL, NULL, N'G', 3, 0,NULL),
(N'GR', N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'G', 4, 0,NULL),
(N'HO', N'à¤–à¤¾à¤œà¤—à¥€ à¤µà¤¸à¤¤à¤¿à¤—à¥ƒà¤¹', N'R', N'R', 1, NULL, NULL, N'H', 4, 0,NULL),
(N'LB', N'à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯/à¤²à¤¾à¤¯à¤¬à¥à¤°à¤°à¥€ ', N'C', N'C', 1, NULL, NULL, N'L', 2, 1,NULL),
(N'UCC', N'à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤šà¤¾à¤²à¥-à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0,NULL),
(N'MTR', N'à¤Ÿà¥‰à¤µà¤° à¤œà¤¾à¤—à¤¾', N'C', N'C', 1, NULL, NULL, N'W', 9, 0,NULL),
(N'FF', N'à¤¸à¥à¤µà¤¾à¤¤à¤‚à¤¤à¥à¤°à¥à¤¯ à¤¸à¥ˆà¤¨à¤¿à¤•', N'R', N'R', 1, NULL, NULL, N'F', 1, 0,NULL),
(N'WGC', N'WGC-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾  à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'G', 2, 0,NULL),
(N'WEG', N'WEG-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤¶à¥ˆà¤•à¥à¤·à¤£à¥€à¤• à¤¶à¤¾à¤¸à¤•à¥€à¤¯', N'C', N'C', 1, NULL, NULL, N'E', 4, 0,NULL),
(N'WEP', N'WEP-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤–à¤¾à¤œà¤—à¥€ à¤¶à¥ˆà¤•à¥à¤·à¤£à¥€à¤• ', N'C', N'C', 1, NULL, NULL, N'E', 2, 0,NULL),
(N'WGR', N'WGR-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'G', 4, 0,NULL),
(N'PC', N'à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'N', N'N', 1, NULL, NULL, N'P', NULL, 0,1),

(N'EP', N'à¤–à¤¾à¤œà¤—à¥€ à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤•', N'C', N'C', 1, NULL, NULL, N'E', 1, 0,NULL),
(N'WR', N'WR-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'R', 2, 0,NULL),
(N'WC', N'WC-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'S', 2, 0,NULL),
(N'CC', N'à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'C', N'C', 1, NULL, NULL, N'C', 2, 0,NULL),
(N'CG', N'à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'CR', N'à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'R', NULL, 0,NULL),
(N'PTR', N'à¤ªà¥‡à¤Ÿà¥à¤°à¥‹à¤² à¤ªà¤‚à¤ª', N'C', N'C', 1, NULL, NULL, N'P', 1, 0,NULL),
(N'GC', N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'O', N'à¤‘à¤«à¤¿à¤¸', N'C', N'C', 1, NULL, NULL, N'O', 1, 0,NULL),
(N'M', N'à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', N'C', 1, NULL, NULL, N'M', 1, 0,NULL),
(N'KT', N'à¤®à¤²à¥à¤Ÿà¥€à¤ªà¥à¤²à¥‡à¤•à¥à¤¸', N'C', N'C', 1, NULL, NULL, N'T', 2, 0,NULL),
(N'H', N'à¤¹à¥‰à¤Ÿà¥‡à¤²', N'C', N'C', 1, NULL, NULL, N'H', 1, 0,NULL),
(N'OPK', N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,1),
(N'WI', N'WI-à¤µà¥à¤¹à¤°à¤¾à¤‚à¤¡à¤¾ à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'I', N'I', 1, NULL, NULL, N'I', 2, 0,NULL),

(N'WCGR', N'WCGR-à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'R', N'R', 1, NULL, NULL, N'R', NULL, 0,NULL),
(N'WCGC', N'WCGC-à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'CH', N'à¤¸à¤¾à¤®à¤¾à¤œà¤¿à¤• à¤¸à¤­à¤¾à¤—à¥ƒà¤¹', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'L', N'à¤²à¥‰à¤œ', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'AG', N'à¤¶à¥‡à¤¤à¥€', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ACH', N'à¤•à¥à¤²à¤¬ à¤¹à¤¾à¤Šà¤¸ ', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AGM', N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤œà¤¿à¤®', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AH', N'à¤•à¥‰à¤®à¤¨ à¤¹à¥‰à¤²', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AMH', N'à¤®à¤²à¥à¤Ÿà¥€à¤ªà¤°à¥à¤ªà¤œ à¤¹à¥‰à¤²', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AO', N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤‘à¤«à¥€à¤¸ ', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'APG', N'à¤–à¥‡à¤³à¤¾à¤šà¥‡ à¤®à¥ˆà¤¦à¤¾à¤¨', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ASW', N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤¸à¥à¤µà¤¿à¤®à¤¿à¤‚à¤— à¤ªà¥‚à¤²', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'AWC', N'à¤µà¥‰à¤šà¤®à¤¨ à¤•à¥…à¤¬à¤¿à¤¨', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'CCO', N'C-à¤•à¥‰à¤°à¤¿à¤¡à¥‰à¤°', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'CCR', N'CCR-à¤Ÿà¥à¤¯à¥à¤¶à¤¨ à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸ ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'CGC', N'à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤¨ à¤µà¤¾à¤£à¤¿à¤œà¥à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'GM', N'à¤µà¥à¤¯à¤¾à¤¯à¤¾à¤® à¤¶à¤¾à¤³à¤¾ ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'GMR', N'GMR-à¤µà¥à¤¯à¤¾à¤¯à¤¾à¤® à¤¶à¤¾à¤³à¤¾', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'KTR', N'KTR-à¤Ÿà¥‰à¤•à¥€à¤œ/à¤šà¤¿à¤¤à¥à¤°à¤ªà¤Ÿ à¤—à¥ƒà¤¹', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NPD', N'à¤¨.à¤ª.à¤¦à¥à¤•à¤¾à¤¨ à¤—à¤¾à¤³à¥‡', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'OBR', N'OBR', N'N', N'N', 1, NULL, NULL, N'N', NULL, NULL,NULL),
(N'OPKC', N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'RCO', N'R-à¤•à¥‰à¤°à¤¿à¤¡à¥‰à¤°', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'RGN', N'à¤œà¤¨à¤°à¥‡à¤Ÿà¤° à¤°à¥‚à¤®/à¤®à¤¿à¤Ÿà¤° à¤°à¥‚à¤®', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'SPKC', N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'WT', N'R-à¤Ÿà¥‰à¤µà¤°', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'PG', N'à¤ªà¥‡à¤¯à¤¿à¤‚à¤— à¤—à¥‡à¤¸à¥à¤Ÿ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'GA', N'à¤—à¤¾à¤°à¥à¤¡à¤¨', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'RFG', N'à¤°à¤¿à¤«à¥à¤¯à¥à¤œ à¤à¤°à¤¿à¤¯à¤¾', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'PH', N'à¤ªà¤‚à¤ª à¤¹à¤¾à¤Šà¤¸ à¤°à¥‚à¤®', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'SR', N' à¤¸à¥à¤Ÿà¥‹à¤…à¤° à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'WAT', N' à¤µà¥‰à¤Ÿà¤° à¤Ÿà¥…à¤‚à¤•', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ISR', N'à¤‡à¤¨à¤¡à¥‹à¤…à¤° à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿ à¤°à¥‚à¤® ', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'EHO', N'à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤¸à¤‚à¤¸à¥à¤¥à¤¾-à¤µà¤¸à¤¤à¤¿à¤—à¥ƒà¤¹', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'PF', N'à¤ªà¥‹à¤²à¥à¤Ÿà¥à¤°à¥€à¤«à¤¾à¤°à¥à¤®', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NR', N'à¤¸à¤°à¥à¤µà¥à¤¹à¥‡à¤•à¥à¤·à¤£ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'NC', N'à¤¸à¤°à¥à¤µà¥à¤¹à¥‡à¤•à¥à¤·à¤£ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NI', N'à¤¸à¤°à¥à¤µà¥à¤¹à¥‡à¤•à¥à¤·à¤£ à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICR', N'à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ICC', N'à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICI', N'à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICRT', N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤¶à¤¾à¤¸à¥à¤¤à¥€à¤¸ à¤ªà¤¾à¤¤à¥à¤° à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ICCT', N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤¶à¤¾à¤¸à¥à¤¤à¥€à¤¸ à¤ªà¤¾à¤¤à¥à¤° à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICIT', N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤• à¤¶à¤¾à¤¸à¥à¤¤à¥€à¤¸ à¤ªà¤¾à¤¤à¥à¤° à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® ', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICHT', N'à¤¹à¥‰à¤Ÿà¥‡à¤² à¤¶à¤¾à¤¸à¥à¤¤à¥€à¤¸ à¤ªà¤¾à¤¤à¥à¤° à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICH', N'à¤¹à¥‰à¤Ÿà¥‡à¤² à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICP', N'à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,1),
(N'ICPRT', N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤¶à¤¾à¤¸à¥à¤¤à¥€à¤¸ à¤ªà¤¾à¤¤à¥à¤° à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,1),
(N'OAH', N'à¤µà¥ƒà¤¦à¥à¤§à¤¾à¤¶à¥à¤°à¤®', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ABLC', N'à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ABLOP', N'à¤“à¤ªà¤¨ à¤Ÿà¥‡à¤°à¥‡à¤¸', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ABLR', N'à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ACHC', N'à¤•à¥à¤²à¤¬ à¤¹à¤¾à¤Šà¤¸ C', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ASWC', N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤¸à¥à¤µà¤¿à¤®à¤¿à¤‚à¤— à¤ªà¥‚à¤² C', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'AWA', N'à¤µà¥‡à¤Ÿà¤¿à¤‚à¤— à¤à¤°à¤¿à¤¯à¤¾', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'FCR', N'à¤«à¤¾à¤¯à¤° à¤•à¤‚à¤Ÿà¥à¤°à¥‹à¤² à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL) ,
(N'FIRR', N'à¤«à¤¾à¤¯à¤° à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'GRR',  N'à¤—à¤¾à¤°à¤¬à¥‡à¤œ à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'IT',   N'à¤®à¤¾à¤¹à¤¿à¤¤à¥€ à¤µ à¤¤à¤‚à¤¤à¥à¤°à¤œà¥à¤žà¤¾à¤¨ à¤‰à¤¦à¥à¤¯à¥‹à¤—', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'LR',   N'à¤²à¤¿à¤«à¥à¤Ÿ à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'MR',   N'Mail à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'OL',   N'à¤“à¤ªà¤¨à¤¿à¤‚à¤— à¤²à¥‰à¤¬à¥€', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'OWC',  N'à¤¸à¥‡à¤‚à¤¦à¥à¤°à¤¿à¤¯ à¤•à¤šà¤°à¤¾ à¤•à¤¨à¥à¤µà¥à¤¹à¤°à¥à¤Ÿà¤° à¤°à¥‚à¤®', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'SI',   N'à¤¸à¤¾à¤®à¤¾à¤œà¤¿à¤• à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'TL',   N'à¤Ÿà¥‡à¤°à¥‡à¤¸ à¤²à¤¿à¤«à¥à¤Ÿ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'OPKI', N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'SPKI', N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'OP', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡', N'R', N'OP', 1, 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'OP', 0, 0,NULL),
(N'OPC', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', N'OPC', 1, NULL, NULL, N'OP', NULL, 0,NULL),
(N'OPI', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'I', N'OPI', 1, NULL, NULL, N'OP', NULL, NULL,NULL),
(N'OPF', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡ à¤¶à¥‡à¤¤à¥€', N'N', N'OPF', 1, NULL, NULL, N'OP', NULL, NULL,NULL),
(N'OPN', N'à¤•à¤°à¤®à¥à¤•à¥à¤¤', N'N', N'OPN', 1, NULL, NULL, N'OP', NULL, NULL,NULL)


) v(TypeOfUseCode, [Description], [Type], TypeOfUseGroupCode, CreatedBy, UpdatedBy, UpdatedDate, TypeOfUseGroupCVCode, SearchSequence, IsSociety,TypeOfUseCategoryId)
),
TypeOfUseIdMap AS
(
    SELECT * FROM (VALUES
        (N'R', 1),
        (N'C', 2),
        (N'I', 3),
        (N'T', 4),
        (N'V', 5),
        (N'S', 6),
        (N'D', 7),
        (N'B', 8),
        (N'SW', 9),
        (N'UC', 10),
        (N'SPK', 11),
        (N'N', 12),
        (N'EG', 13),
        (N'GO', 14),
        (N'GR', 15),
        (N'HO', 16),
        (N'LB', 17),
        (N'UCC', 18),
        (N'MTR', 19),
        (N'FF', 20),
        (N'WGC', 21),
        (N'WEG', 22),
        (N'WEP', 23),
        (N'WGR', 24),
        (N'PC', 25),
        (N'EP', 26),
        (N'WR', 27),
        (N'WC', 28),
        (N'CC', 29),
        (N'CG', 30),
        (N'CR', 31),
        (N'PTR', 32),
        (N'GC', 33),
        (N'O', 34),
        (N'M', 35),
        (N'KT', 36),
        (N'H', 37),
        (N'OPK', 38),
        (N'WI', 39),
        (N'WCGR', 40),
        (N'WCGC', 41),
        (N'CH', 42),
        (N'L', 43),
        (N'AG', 44),
        (N'ACH', 45),
        (N'AGM', 46),
        (N'AH', 47),
        (N'AMH', 48),
        (N'AO', 49),
         (N'OP', 50),
        (N'OPC', 51),
        (N'OPI', 52),
        (N'OPF', 53),
        (N'OPN', 54),
        (N'CGC', 55),
        (N'GM', 56),
        (N'GMR', 57),
        (N'KTR', 58),
        (N'NPD', 59),
        (N'OBR', 60),
        (N'OPKC', 61),
        (N'RCO', 62),
        (N'RGN', 63),
        (N'SPKC', 64),
        (N'WT', 65),
        (N'PG', 66),
        (N'GA', 67),
        (N'RFG', 68),
        (N'PH', 69),
        (N'SR', 70),
        (N'WAT', 71),
        (N'ISR', 72),
        (N'EHO', 73),
        (N'PF', 74),
        (N'NR', 75),
        (N'NC', 76),
        (N'NI', 77),
        (N'ICR', 78),
        (N'ICC', 79),
        (N'ICI', 80),
        (N'ICRT', 81),
        (N'ICCT', 82),
        (N'ICIT', 83),
        (N'ICHT', 84),
        (N'ICH', 85),
        (N'ICP', 86),
        (N'ICPRT', 87),
        (N'OAH', 88),
        (N'ABLC', 89),
        (N'ABLOP', 90),
        (N'ABLR', 91),
        (N'ACHC', 92),
        (N'ASWC', 93),
        (N'AWA', 94),
        (N'FCR', 95),
        (N'FIRR', 96),
        (N'GRR', 97),
        (N'IT', 98),
        (N'LR', 99),
        (N'MR', 100),
        (N'OL', 101),
        (N'OWC', 102),
        (N'SI', 103),
        (N'TL', 104),
        (N'OPKI', 105),
        (N'SPKI', 106),
        (N'APG', 107),
        (N'ASW', 108),
        (N'AWC', 109),
        (N'CCO', 110),
        (N'CCR', 111)

    ) v(TypeOfUseCode, Id)
)


INSERT INTO PTIS.TypeOfUseMaster
(Id, TypeOfUseCode, [Description], [Type], TypeOfUseGroupId, TypeOfUseGroupCVId, CreatedBy, UpdatedBy, UpdatedDate, SearchSequence, TypeOfUseCategoryId, IsProtected)
SELECT
        m.Id,
    s.TypeOfUseCode,
    s.[Description],
    s.[Type],
    gm.TypeOfUseGroupId,
    gcv.TypeOfUseGroupCVId,
    s.CreatedBy, s.UpdatedBy, s.UpdatedDate,
        ISNULL(s.SearchSequence, m.Id) AS SearchSequence,
        CASE
        WHEN s.TypeOfUseCode IN (N'WR', N'WCGR', N'ENCEG', N'WGC', N'WEG', N'WEP', N'WC', N'WCGC') THEN 1
            WHEN s.TypeOfUseCode IN (N'OPK', N'ICPRT', N'OPKC', N'SPKC', N'OPKI', N'SPKI', N'PC') THEN 2
            when s.TypeOfUseCode IN (N'ABLOP', N'GA', N'RFG') THEN 3
                WHEN s.TypeOfUseCode IN (N'OP', N'OPC', N'OPI', N'OPF', N'OPN') THEN 4
                ELSE s.TypeOfUseCategoryId
        END AS TypeOfUseCategoryId,
        1 AS IsProtected
FROM TypeSeed s
JOIN TypeOfUseIdMap m
    ON m.TypeOfUseCode = s.TypeOfUseCode
JOIN GroupMap gm
  ON gm.TypeOfUseGroupCode = s.TypeOfUseGroupCode
JOIN GroupMapCV gcv
    ON gcv.TypeOfUseGroupCVCode = s.TypeOfUseGroupCVCode

UPDATE tou
SET tou.TypeOfUseGroupCVId = gcv.Id
FROM PTIS.TypeOfUseMaster tou
JOIN PTIS.TypeOfUseGroupMaster g
    ON g.Id = tou.TypeOfUseGroupId
JOIN PTIS.TypeOfUseGroupMasterCV gcv
    ON gcv.TypeOfUseGroupCVCode = CASE
            WHEN g.TypeOfUseGroupCode IN (N'OP', N'OPC', N'OPI', N'OPF', N'OPN') THEN N'OP'
            ELSE g.TypeOfUseGroupCode
    END;

GO

SET IDENTITY_INSERT [PTIS].[TypeOfUseMaster] OFF;
GO


SET identity_insert [PTIS].[ConstructionTypeMaster] on

INSERT INTO [PTIS].[ConstructionTypeMaster]
(Id, [ConstructionCode], [Description], [SearchSequence], IsProtected)
VALUES
(1, N'A', N'à¤¸à¤¿à¤®à¥‡à¤‚à¤Ÿ à¤•à¥‰à¤•à¥à¤°à¤¿à¤Ÿ à¤¸à¤‚à¤°à¤šà¤¨à¤¾', 1,0),
(2, N'B', N'à¤¸à¤¿à¤®à¥‡à¤‚à¤Ÿ/à¤šà¥à¤¨à¤¾/à¤¦à¤—à¤¡/à¤µà¤¿à¤Ÿà¤¾à¤‚à¤šà¥€ à¤­à¤¿à¤‚à¤¤ à¤µ à¤¸à¥à¤²à¥…à¤¬', 2,0),
(3, N'C', N'à¤¸à¤¿à¤®à¥‡à¤‚à¤Ÿ/à¤šà¥à¤¨à¤¾/à¤¦à¤—à¤¡/à¤µà¤¿à¤Ÿà¤¾à¤‚à¤šà¥€ à¤­à¤¿à¤‚à¤¤ à¤µ à¤Ÿà¤¿à¤¨à¤¾à¤šà¥‡ à¤›à¤¤', 3,0),
(4, N'D', N'à¤•à¥à¤¡à¤¾à¤šà¥‡ à¤²à¤¾à¤•à¤¡à¥€ à¤«à¤¾à¤Ÿà¥à¤¯à¤¾à¤šà¥‡ à¤•à¤šà¥à¤šà¥‡à¤˜à¤°', 4,0),
(5, N'E', N'à¤•à¥à¤¡à¤¾à¤šà¥‡', 5,0),
(6, N'OP', N'à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡', 6,1)

SET identity_insert [PTIS].[ConstructionTypeMaster] OFF



SET IDENTITY_INSERT [PTIS].[PropertyCategoryMaster] ON;

INSERT INTO [PTIS].[PropertyCategoryMaster]
    ([Id], [PropertyCategoryName], [IsProtected])
SELECT v.*
FROM (
    VALUES
        (1, N'Apartment', 1),
        (2, N'Individual', 1),
        (3, N'Industry', 1),
        (4, N'Plot', 1)
       ) AS v ([Id], [PropertyCategoryName], [IsProtected])
WHERE NOT EXISTS (
    SELECT 1
    FROM [PTIS].[PropertyCategoryMaster] pcm
    WHERE pcm.[Id] = v.[Id]
);

SET IDENTITY_INSERT [PTIS].[PropertyCategoryMaster] OFF;

SET IDENTITY_INSERT [PTIS].[SubTypeOfUseMaster] ON;

;WITH Seed(Id, [Description], TypeOfUseCode, CreatedBy, UpdatedBy, UpdatedDate, SearchKey, SearchSequence) AS
(
    SELECT * FROM (VALUES

 (186, N'à¤®à¤‚à¤¦à¤¿à¤°', N'T', 1, 67, CAST(N'2023-02-09T17:38:44.260' AS DateTime), N'M', 1),
  (187, N'à¤®à¤¸à¥à¤œà¥€à¤¦', N'T', 1, NULL, NULL, N'M', 2),
  (188, N'à¤‡à¤¦à¤—à¤¾à¤¹', N'T', 1, NULL, NULL, N'E', 3),
  (189, N'à¤šà¤°à¥à¤š ', N'T', 1, NULL, NULL, N'C', 3),
  (190, N'à¤—à¥à¤°à¥à¤¦à¥à¤µà¤¾à¤°à¤¾', N'T', 1, NULL, NULL, N'G', 4),
  (191, N'à¤¬à¥Œà¤¦à¥à¤§ à¤µà¤¿à¤¹à¤¾à¤°', N'T', 1, NULL, NULL, N'B', 5),
  (192, N'à¤µà¤¿à¤¹à¥€à¤°', N'N', 1, 67, CAST(N'2023-02-09T12:19:23.693' AS DateTime), N'M', 6),
  (193, N'à¤¸à¤®à¤¾à¤œ à¤­à¤µà¤¨', N'T', 1, NULL, NULL, N'S', 7),
  (222, N'à¤šà¤•à¥à¤•à¥€', N'S', 1, NULL, NULL, N'C', 1),
  (223, N'à¤šà¤¿à¤•à¤£ à¤®à¤Ÿà¤£ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', 1, NULL, NULL, N'C', 2),
  (224, N'à¤­à¤¾à¤œà¥€à¤ªà¤¾à¤²à¤¾ à¤¦à¥à¤•à¤¾à¤£', N'S', 1, NULL, NULL, N'B', 1),
  (227, N'à¤µà¤¾à¤ˆà¤¨ à¤¶à¥‰à¤ª', N'S', 1, NULL, NULL, N'W', 1),
  (228, N'à¤¹à¥‹à¤® à¤…à¤ªà¥à¤²à¤¾à¤¯à¤¨à¥à¤¸', N'S', 1, NULL, NULL, N'H', 1),
  (230, N'à¤œà¥à¤µà¥‡à¤²à¤°à¥€', N'S', 1, NULL, NULL, N'J', 2),
  (231, N'à¤¶à¤¾à¤ªà¥€à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°/à¤®à¤¾à¤°à¥à¤Ÿ', N'S', 1, NULL, NULL, N'S', 3),
  (233, N'à¤ªà¥à¤°à¥‡à¤¸', N'S', 1, NULL, NULL, N'P', 3),
  (234, N'à¤²à¥‰à¤¨à¥à¤¡à¥€', N'S', 1, NULL, NULL, N'L', 1),
  (235, N'à¤°à¤¾à¤·à¥à¤Ÿà¥à¤°à¥€à¤¯à¤•à¥ƒà¤¤ ', N'B', 1, NULL, NULL, N'', 1),
  (238, N'à¤ªà¤¤à¤ªà¥‡à¤¢à¥€', N'B', 1, NULL, NULL, N'P', 2),
  (239, N'à¤.à¤Ÿà¥€.à¤à¤®.', N'B', 1, NULL, NULL, N'A', 1),
  (273, N'à¤‰à¤¤à¥à¤ªà¤¾à¤¦à¤¨ à¤¸à¥‡à¤µà¤¾', N'I', 1, NULL, NULL, N'', 0),
  (280, N'à¤‡à¤¤à¤° à¤‰à¤¦à¥à¤¯à¥‹à¤—', N'I', 1, NULL, NULL, N'', 0),
  (286, N'à¤œà¤²à¤¤à¤°à¤£ à¤¤à¤²à¤¾à¤µ', N'N', 1, NULL, NULL, N'', 0),
  (287, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'N', 1, 70, CAST(N'2024-06-26T15:18:20.117' AS DateTime), N'', 0),
  (288, N'à¤¶à¤¾à¤³à¤¾', N'N', 1, NULL, NULL, N'', 0),
  (289, N'à¤—à¤¾à¤°à¥à¤¡à¤¨', N'N', 1, NULL, NULL, N'', 0),
  (290, N'à¤¶à¥Œà¤šà¤¾à¤²à¤¯ ', N'N', 1, NULL, NULL, N'', 0),
  (292, N'à¤…à¤—à¥à¤¨à¤¿à¤¶à¤®à¤¨ à¤µà¤¿à¤­à¤¾à¤—', N'N', 1, NULL, NULL, N'', 0),
  (293, N'à¤¸à¤¾à¤‚à¤¸à¥à¤•à¥à¤¤à¥€à¤• à¤­à¤µà¤¨', N'N', 1, NULL, NULL, N'', 0),
  (294, N'à¤ªà¤¾à¤£à¥à¤¯à¤¾à¤šà¥€ à¤Ÿà¤¾à¤•à¥€', N'N', 1, NULL, NULL, N'', 0),
  (295, N'à¤ªà¥à¤¤à¤³à¤¾', N'N', 1, NULL, NULL, N'', 0),
  (299, N'à¤–à¤¾à¤œà¤—à¥€ à¤—à¥‹à¤¡à¤¾à¤Šà¤¨', N'GO', 1, NULL, NULL, N'', 0),
  (300, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤—à¥‹à¤¡à¤¾à¤Šà¤¨', N'GO', 1, NULL, NULL, N'', 0),
  (311, N'à¤¸à¤¾à¤®à¥à¤¦à¤¾à¤¯à¤¿à¤• à¤†à¤°à¥‹à¤—à¥à¤¯ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'D', 1, NULL, NULL, N'', 0),
  (313, N' à¤¹à¥ƒà¤¦à¤¯à¤°à¥‹à¤—à¤¤à¤œà¥à¤œà¥à¤ž', N'D', 1, NULL, NULL, N'', 0),
  (315, N'à¤¤à¥à¤µà¤šà¤¾à¤°à¥‹à¤—à¤¤à¤œà¥à¤œà¥à¤ž ', N'D', 1, NULL, NULL, N'', 0),
  (317, N'à¤¬à¤¾à¤²à¤°à¥‹à¤—à¤¤à¤œà¥à¤ž ', N'D', 1, NULL, NULL, N'', 0),
  (318, N'à¤¨à¤µà¤œà¤¾à¤¤ à¤¤à¤œà¥à¤œà¥à¤ž', N'D', 1, NULL, NULL, N'', 0),
  (319, N'à¤¨à¥à¤¯à¥‚à¤°à¥‹à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿ ', N'D', 1, NULL, NULL, N'', 0),
  (321, N'à¤‘à¤°à¥à¤¥à¥‹à¤ªà¥‡à¤¡à¤¿à¤• à¤¸à¤°à¥à¤œà¤¨ ', N'D', 1, NULL, NULL, N'', 0),
  (324, N'à¤à¤‚à¤¡à¥‹à¤•à¥à¤°à¤¾à¤‡à¤¨à¥‹à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿ ', N'D', 1, NULL, NULL, N'', 0),
  (326, N'à¤¨à¤°à¥à¤¸à¤¿à¤‚à¤— à¤¹à¥‹à¤®', N'D', 1, NULL, NULL, N'', 0),
  (328, N'à¤ªà¥…à¤¥à¥‹à¤²à¥‰à¤œà¥€ à¤²à¥…à¤¬', N'D', 1, 58, CAST(N'2023-01-26T13:37:58.977' AS DateTime), N'', 0),
  (330, N'à¤¦à¤‚à¤¤à¤µà¥ˆà¤¦à¥à¤¯ / à¤‘à¤°à¥à¤¥à¥‹à¤¡à¥‡à¤‚à¤Ÿà¤¿à¤¸à¥à¤Ÿ ', N'D', 1, NULL, NULL, N'', 0),
  (332, N'à¤¸à¥à¤¤à¥à¤°à¥€à¤°à¥‹à¤—à¤¤à¤œà¥à¤ž ', N'D', 1, NULL, NULL, N'', 0),
  (336, N'à¤‘à¤¨à¥à¤•à¥‹à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿ ', N'D', 1, NULL, NULL, N'', 0),
  (338, N' à¤°à¥‡à¤¡à¤¿à¤“à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿ ', N'D', 1, NULL, NULL, N'', 0),
  (339, N'à¤ªà¤²à¥à¤®à¥‹à¤¨à¥‹à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿ', N'D', 1, NULL, NULL, N'', 0),
  (343, N'à¤µà¤¸à¤¤à¥€à¤—à¥ƒà¤¹ ', N'GR', 1, NULL, NULL, N'', 0),
  (371, N'à¤œà¥‡à¤‚à¤Ÿà¥à¤¸  à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'J', 1),
  (373, N'à¤–à¤¾à¤œà¤—à¥€ ', N'B', 1, NULL, NULL, N'', 0),
  (374, N'à¤ªà¤‚à¤¤à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'B', 1, NULL, NULL, N'', 0),
  (387, N'à¤¹à¤¾à¤°à¥à¤¡ à¤µà¥‡à¤…à¤°', N'S', 59, NULL, NULL, N'', 0),
  (390, N'à¤¸à¥à¤ªà¥‡à¤¯à¤° à¤ªà¤¾à¤°à¥à¤Ÿà¥à¤¸', N'S', 59, NULL, NULL, N'', 0),
  (399, N'à¤¸à¤¾à¤¡à¥€ à¤¶à¥‰à¤ª', N'S', 59, NULL, NULL, N'', 0),
  (402, N'à¤à¤œà¤¨à¥à¤¸à¥€à¤œ', N'S', 59, NULL, NULL, N'', 0),
  (405, N'à¤¸à¥à¤µà¥€à¤Ÿà¤®à¤¾à¤°à¥à¤Ÿ à¤…à¤à¤¡ à¤¨à¤®à¤•à¥€à¤¨', N'S', 59, NULL, NULL, N'', 0),
  (408, N'à¤¶à¥‚à¤œ à¤¶à¥‰à¤ª', N'S', 59, NULL, NULL, N'', 0),
  (414, N'à¤¬à¤¿à¤²à¥à¤¡à¤¿à¤‚à¤— à¤®à¤Ÿà¥‡à¤°à¤¿à¤¯à¤² à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°', N'S', 59, NULL, NULL, N'', 0),
  (417, N'à¤«à¥à¤²à¥‰à¤µà¤° à¤¶à¥‰à¤ª', N'S', 59, NULL, NULL, N'', 0),
  (423, N'à¤¬à¥…à¤— à¤¹à¤¾à¤Šà¤¸, à¤¶à¥‰à¤ª', N'S', 59, NULL, NULL, N'', 0),
  (426, N'à¤Ÿà¥…à¤Ÿà¥à¤¯à¥‚ à¤¶à¥‰à¤ª', N'S', 59, NULL, NULL, N'', 0),
  (456, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤°', N'S', 59, NULL, NULL, N'', 0),
  (467, N'à¤¤à¤•à¥à¤°à¤¾à¤° à¤¨à¤¿à¤µà¤¾à¤°à¤£ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'S', 59, NULL, NULL, N'', 0),
  (470, N'à¤—à¥à¤°à¤¾à¤¹à¤• à¤¸à¥‡à¤µà¤¾ à¤•à¥‡à¤‚à¤¦à¥à¤°/à¤¸à¥‡à¤¤à¥', N'S', 59, NULL, NULL, N'', 0),
  (475, N'à¤¬à¥à¤Ÿà¥€à¤• à¤…à¤à¤¡ à¤¡à¥à¤°à¥‡à¤¸ à¤¡à¤¿à¤à¤¾à¤¯à¤¨à¤¿à¤‚à¤—', N'S', 59, NULL, NULL, N'', 0),
  (483, N'à¤¡à¥à¤°à¤¾à¤¯à¤µà¤¿à¤‚à¤— à¤¸à¥à¤•à¥‚à¤²', N'S', 59, NULL, NULL, N'', 0),
  (486, N'à¤¦à¥à¤•à¤¾à¤¨ à¤—à¤¾à¤³à¥‡', N'S', 59, NULL, NULL, N'', 0),
  (510, N'à¤¸à¤¹à¤•à¤¾à¤°à¥€', N'B', NULL, NULL, NULL, N'', 0),
  (526, N'à¤Ÿà¤¾à¤‡à¤²à¥à¤¸ à¤µ à¤®à¤¾à¤°à¥à¤¬à¤²', N'I', NULL, NULL, NULL, N'', 0),
  (528, N'à¤ªà¥à¤°à¤¾à¤¯à¤®à¤°à¥€ à¤¶à¤¾à¤³à¤¾', N'EG', 55, NULL, NULL, N'', 0),
  (530, N'à¤…à¤—à¥à¤°à¥€à¤•à¤²à¥à¤šà¤°à¤²', N'I', 55, NULL, NULL, N'', 0),
  (531, N'à¤«à¥à¤¡', N'I', 55, NULL, NULL, N'', 0),
  (533, N'à¤•à¥‰à¤²à¥‡à¤œ - à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'EP', 55, NULL, NULL, N'', 0),
  (534, N'à¤•à¥‰à¤²à¥‡à¤œ -à¤‡à¤‚à¤œà¤¿à¤¨à¥€à¤°à¤¿à¤‚à¤—', N'EP', 55, NULL, NULL, N'', 0),
  (535, N'à¤¹à¤¾à¤¯à¤¸à¥à¤•à¥‚à¤²', N'EP', 55, NULL, NULL, N'', 0),
  (536, N'à¤•à¥‰à¤²à¥‡à¤œ- à¤‡à¤¤à¤°', N'EP', 55, NULL, NULL, N'', 0),
  (537, N'à¤ªà¥à¤°à¤¾à¤¯à¤®à¤°à¥€ à¤¸à¥à¤•à¥‚à¤²', N'EP', 55, NULL, NULL, N'', 0),
  (538, N'à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤ªà¥€à¤ ', N'EP', 55, NULL, NULL, N'', 0),
  (539, N'à¤ªà¥à¤°à¤¶à¤¿à¤•à¥à¤·à¤£ à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'EP', 55, NULL, NULL, N'', 0),
  (540, N'à¤…à¤‚à¤—à¤£à¤µà¤¾à¤°à¥€/à¤ªà¥à¤°à¥€à¤¸à¥à¤•à¥‚à¤²', N'EP', 55, NULL, NULL, N'', 0),
  (542, N'à¤…à¥…à¤¡à¤µà¥à¤¹à¥‹à¤•à¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'O', 55, NULL, NULL, N'', 0),
  (546, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤‡à¤¤à¤°', N'O', 55, NULL, NULL, N'', 0),
  (548, N'à¤—à¥‹à¤¡à¤¾à¤µà¥‚à¤¨', N'I', 55, NULL, NULL, N'', 0),
  (549, N'à¤°à¥‡à¤¸à¥à¤Ÿà¥‹à¤°à¥‡à¤‚à¤Ÿ', N'H', 55, NULL, NULL, N'', 0),
  (551, N'à¤°à¥‡à¤¸à¥à¤Ÿà¥‹à¤°à¥‡à¤‚à¤Ÿ à¤µ à¤¬à¤¾à¤°', N'H', 55, NULL, NULL, N'', 0),
  (553, N'à¤²à¥‰à¤œ', N'H', 55, NULL, NULL, N'', 0),
  (555, N'à¤­à¥‹à¤œà¤¨à¤¾à¤²à¤¯', N'H', 55, NULL, NULL, N'', 0),
  (556, N'à¤•à¥…à¤«à¥‡', N'H', 55, NULL, NULL, N'', 0),
  (558, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯', N'GC', 55, NULL, NULL, N'', 0),
  (560, N'à¤•à¥‹à¤°à¥à¤Ÿ', N'GC', 55, NULL, NULL, N'', 0),
  (561, N'à¤¤à¤¹à¤¸à¤¿à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'GC', 55, NULL, NULL, N'', 0),
  (562, N'à¤ªà¤‚à¤šà¤¾à¤¯à¤¤ à¤¸à¤®à¤¿à¤¤à¥€', N'GC', 55, NULL, NULL, N'', 0),
  (563, N'à¤œà¤¿à¤²à¥à¤¹à¤¾ à¤ªà¤°à¤¿à¤·à¤¦ à¤‘à¤«à¥€à¤¸', N'GC', 55, NULL, NULL, N'', 0),
  (565, N'à¤ªà¥‹à¤²à¥€à¤¸ à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨', N'GC', 55, NULL, NULL, N'', 0),
  (566, N'à¤µà¤¨ à¤µà¤¿à¤­à¤¾à¤—', N'GC', 55, NULL, NULL, N'', 0),
  (568, N'à¤ªà¥‹à¤²à¥€à¤¸ à¤šà¥Œà¤•à¥€', N'CG', 55, NULL, NULL, N'', 0),
  (569, N'à¤œà¥‡à¤²', N'CG', 55, NULL, NULL, N'', 0),
  (570, N'à¤¬à¤¿à¤à¤¸à¤à¤¨à¤à¤² à¤‘à¤«à¥€à¤¸', N'CG', 55, NULL, NULL, N'', 0),
  (571, N'à¤°à¥‡à¤² à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨ à¤œà¤•à¥à¤¶à¤¨', N'CG', 55, NULL, NULL, N'', 0),
  (572, N'à¤†à¤•à¤¾à¤¶à¤µà¤¾à¤£à¥€', N'CG', 55, NULL, NULL, N'', 0),
  (577, N'à¤¸à¥à¤®à¤¶à¤¾à¤¨à¤­à¥‚à¤®à¥€ ', N'N', 55, NULL, NULL, N'N', 2),
  (578, N'à¤®à¤¦à¤°à¤¸à¤¾', N'EP', 58, NULL, NULL, N'', 0),
  (580, N'à¤…à¤ªà¤¾à¤°à¥à¤Ÿà¤®à¥‡à¤‚à¤Ÿ à¤¸à¤¦à¤¨à¤¿à¤•à¤¾', N'R', 58, NULL, NULL, N'R', 2),
  (581, N'à¤ªà¤¡à¥€à¤¤', N'R', 58, NULL, NULL, N'R', 3),
  (582, N'à¤—à¥‹à¤ à¤¾', N'R', 58, NULL, NULL, N'R', 4),
  (583, N'à¤¬à¤‚à¤—à¤²à¤¾', N'R', 58, NULL, NULL, N'R', 5),
  (584, N'à¤†à¤¶à¥à¤°à¤®', N'R', 58, 67, CAST(N'2023-02-09T17:35:15.180' AS DateTime), N'R', 6),
  (585, N'à¤—à¥ƒà¤¹à¤¨à¤¿à¤°à¥à¤®à¤¾à¤£ à¤¯à¥‹à¤œà¤¨à¤¾ /à¤˜à¤°à¤•à¥à¤²', N'R', 58, NULL, NULL, N'R', 7),
  (586, N'à¤œà¤¿à¤®', N'N', 67, NULL, NULL, N'', 0),
  (587, N'à¤šà¤¾à¤²à¥ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'N', 67, NULL, NULL, N'', 0),
  (588, N'sports academy', N'N', 98, NULL, NULL, N'', 0),
  (590, N'à¤¬à¤¿à¤›à¤¾à¤¯à¤¤ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'S', 67, NULL, NULL, N'', 0),
  (591, N'à¤•à¥…à¤Ÿà¤°à¤°à¥à¤¸/à¤®à¥‡à¤¸', N'S', 67, NULL, NULL, N'', 0),
  (592, N'à¤®à¤Ÿà¤¨ à¤¶à¥‹à¤ª', N'S', 67, NULL, NULL, N'', 0),
  (593, N'à¤Ÿà¥‡à¤²à¥‡à¤°à¥à¤¸', N'S', 67, NULL, NULL, N'', 0),
  (595, N'à¤«à¥…à¤¬à¥à¤°à¤¿à¤•à¥‡à¤¶à¤¨', N'S', 67, NULL, NULL, N'', 0),
  (596, N'à¤«à¤Ÿà¤¾à¤•à¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', 67, NULL, NULL, N'', 0),
  (598, N'à¤¸à¥à¤µà¤¤ à¤§à¤¾à¤¨à¥à¤¯ à¤¦à¥à¤•à¤¾à¤¨', N'S', 98, NULL, NULL, N'', 0),
  (599, N'à¤®à¤‚à¤¦à¤¬à¥à¤¦à¥à¤§à¥€ à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤²à¤¯', N'EP', 98, NULL, NULL, N'', 0),
  (600, N'à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯', N'N', 98, NULL, NULL, N'', 0),
  (601, N'à¤ªà¤®à¥à¤ª à¤¹à¤¾à¤Šà¤¸', N'N', 98, NULL, NULL, N'', 0),
  (602, N'à¤—à¤¿à¤«à¥à¤Ÿ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', 98, NULL, NULL, N'', 0),
  (604, N'à¤¹à¥‹à¤®à¤¿à¤“à¤ªà¥…à¤¥à¤¿à¤•', N'D', 98, NULL, NULL, N'', 0),
  (605, N'à¤«à¤¿à¤œà¤¿à¤“à¤¥à¥‡à¤°à¤ªà¥€', N'D', 98, NULL, NULL, N'', 0),
  (606, N'à¤–à¥à¤²à¤¾ à¤­à¥à¤–à¤‚à¤¡', N'N', 98, NULL, NULL, N'', 0),
  (607, N'à¤¨à¥‡à¤¤à¥à¤°à¤¾à¤²à¤¯', N'D', 98, NULL, NULL, N'', 0),
  (608, N'à¤‘à¤ªà¥à¤Ÿà¥€à¤•à¤²', N'S', 98, NULL, NULL, N'', 0),
  (609, N'à¤«à¥‹à¤Ÿà¥‹ à¤¸à¥à¤Ÿà¥à¤¡à¥€à¤“', N'S', 67, NULL, NULL, N'', 0),
  (610, N'à¤¬à¥à¤• à¤¡à¥‡à¤ªà¥‹', N'S', 67, NULL, NULL, N'', 0),
  (612, N'à¤µà¥‡à¤²à¥à¤¡à¥€à¤‚à¤—', N'S', 98, NULL, NULL, N'', 0),
  (617, N'à¤ªà¤‚à¤šà¤•à¤°à¥à¤® à¤¤à¤œà¥à¤ž', N'D', 67, NULL, NULL, N'', 0),
  (618, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‹à¤¨à¤¿à¤•', N'S', 67, NULL, NULL, N'', 0),
  (619, N'à¤Ÿà¥à¤°à¥‡à¤¡à¤°à¥à¤¸', N'S', 98, NULL, NULL, N'', 0),
  (621, N'à¤Ÿà¥à¤°à¥…à¤µà¥à¤¹à¤² à¤à¤œà¤¨à¥à¤¸à¥€', N'S', 98, NULL, NULL, N'', 0),
  (622, N'à¤¢à¤¾à¤¬à¤¾', N'H', 98, NULL, NULL, N'', 0),
  (623, N'à¤ªà¤¾à¤¨à¤ªà¥‹à¤ˆ', N'N', 98, NULL, NULL, N'', 0),
  (624, N'à¤®à¤¾à¤°à¥à¤¬à¤² à¤¶à¥‰à¤ª', N'S', 72, NULL, NULL, N'', 0),
  (628, N'à¤†à¤¯à¥à¤°à¥à¤µà¥‡à¤¦à¤¿à¤•', N'D', 98, NULL, NULL, N'', 0),
  (629, N'à¤šà¤¾à¤¯à¤¨à¥€à¤œ à¤¶à¥‰à¤ª', N'S', 72, NULL, NULL, N'', 0),
  (630, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤‡à¤®à¤¾à¤°à¤¤', N'GC', 72, NULL, NULL, N'', 0),
  (631, N'à¤­à¤‚à¤—à¤¾à¤° à¤µ à¤°à¤¦à¥à¤¦à¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', 74, NULL, NULL, N'', 0),
  (632, N'à¤•à¥à¤•à¥à¤Ÿ à¤ªà¤¾à¤²à¤¨', N'S', 74, NULL, NULL, N'', 0),
  (633, N'à¤ªà¤¾à¤¨ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', 72, NULL, NULL, N'', 0),
  (634, N'à¤¤à¥‡à¤² à¤®à¤¿à¤²', N'S', 67, NULL, NULL, N'', 0),
  (635, N'à¤µà¥ƒà¤•à¥à¤· à¤µà¤¾à¤Ÿà¤¿à¤•à¤¾', N'S', 67, NULL, NULL, N'', 0),
  (636, N'à¤¨à¤µà¥‹à¤¦à¤¯ à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤²à¤¯', N'CG', 58, NULL, NULL, N'', 0),
  (637, N'à¤§à¥‹à¤¬à¥€ à¤˜à¤¾à¤Ÿ', N'S', 142, NULL, NULL, N'', 0),
  (638, N'à¤²à¤¾à¤¯à¤¬à¥à¤°à¤°à¥€', N'EP', 61, NULL, NULL, N'', 0),
  (639, N'à¤—à¤¾à¤¡à¥€ à¤¶à¥‹à¤°à¥‚à¤®', N'S', 142, NULL, NULL, N'', 0),
  (640, N'à¤°à¤•à¥à¤¤à¤ªà¥‡à¤¢à¥€', N'D', 68, NULL, NULL, N'', 0),
  (641, N'à¤ªà¥‰à¤²à¥€à¤Ÿà¥‡à¤•à¤¨à¤¿à¤•', N'EP', 111, NULL, NULL, N'', 0),
  (642, N'à¤¸à¤°à¥à¤µà¥à¤¹à¤¿à¤¸à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', 111, NULL, NULL, N'', 0),
  (644, N'à¤•à¥‰à¤²à¥‡à¤œ- à¤†à¤¯.à¤Ÿà¥€.à¤†à¤¯.', N'EG', 68, NULL, NULL, N'', 0),
  (645, N'à¤ªà¥à¤°à¤¶à¤¿à¤•à¥à¤·à¤£ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'GC', 102, NULL, NULL, N'', 0),
  (646, N'à¤¸à¥à¤Ÿà¤¾à¤« à¤•à¥à¤µà¤¾à¤°à¥à¤Ÿà¤°', N'R', 68, NULL, NULL, N'', 0),
  (647, N'à¤µà¤¿à¤¶à¥à¤°à¤¾à¤® à¤—à¥ƒà¤¹', N'GC', 68, NULL, NULL, N'', 0),
  (648, N'à¤‘à¤¡à¤¿à¤Ÿà¥‹à¤°à¤¿à¤¯à¤®', N'EP', 68, NULL, NULL, N'', 0),
  (649, N'à¤‰à¤ªà¤¹à¤¾à¤° à¤—à¥ƒà¤¹', N'GC', 68, NULL, NULL, N'', 0),
  (650, N'à¤•à¥‰à¤²à¥‡à¤œ- à¤¸à¤¾à¤¯à¤¨à¥à¤¸', N'EP', 68, NULL, NULL, N'', 0),
  (651, N'à¤¸à¤­à¤¾à¤—à¥ƒà¤¹', N'GC', 68, NULL, NULL, N'', 0),
  (652, N'à¤•à¥‰à¤²à¥‡à¤œ-à¤‰à¤¦à¥à¤¯à¤¾à¤¨à¤µà¤¿à¤¦à¥à¤¯à¤¾', N'EP', 68, NULL, NULL, N'', 0),
  (653, N'à¤®à¥‡à¤¸', N'H', 142, NULL, NULL, N'', 0),
  (654, N'à¤‘à¤«à¤¿à¤¸', N'I', 68, NULL, NULL, N'', 0),
  (656, N'à¤ªà¥à¤²à¤¾à¤¸à¤Ÿà¤¿à¤• à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (657, N'à¤®à¥‡à¤Ÿà¤² à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (658, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‹à¤¡à¥à¤¸ à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (659, N'à¤¦à¤¾à¤²à¤®à¤¿à¤² à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (660, N'à¤ªà¥‡à¤ªà¤° à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (661, N'à¤—à¤¾à¤°à¤®à¥‡à¤‚à¤Ÿà¥à¤¸ à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (662, N'à¤µà¥‡à¤²à¥à¤¡à¥€à¤‚à¤—, à¤‡à¤‚à¤œà¤¿à¤¨à¤¿à¤…à¤°à¤¿à¤‚à¤— à¤µà¤°à¥à¤•', N'I', 68, NULL, NULL, N'', 0),
  (663, N'à¤¨à¥‡à¤²à¥à¤¸ à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (664, N'à¤•à¥‰à¤Ÿà¤¨ à¤®à¤¿à¤² à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (665, N'à¤‘à¤ˆà¤² à¤®à¤¿à¤²', N'I', 68, NULL, NULL, N'', 0),
  (666, N'à¤¡à¥à¤°à¤—à¥à¤¸ à¤…à¥…à¤£à¥à¤¡ à¤•à¥‡à¤®à¤¿à¤•à¤²à¥à¤¸', N'I', 68, NULL, NULL, N'', 0),
  (667, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€à¤œ', N'I', 68, NULL, NULL, N'', 0),
  (668, N'à¤ªà¥‰à¤²à¥€à¤®à¥‡à¤Ÿ à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (669, N'à¤®à¥à¤•à¤¬à¤§à¥€à¤° à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤²à¤¯', N'EP', 68, NULL, NULL, N'', 0),
  (670, N'à¤¸à¤¿à¤®à¥‡à¤‚à¤Ÿ à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (671, N'à¤•à¥à¤²à¤° à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (672, N'à¤«à¤¾à¤¯à¤° à¤Ÿà¤¾à¤µà¤°', N'GR', 68, NULL, NULL, N'', 0),
  (673, N'à¤Ÿà¤¾à¤µà¤°', N'GC', 68, NULL, NULL, N'', 0),
  (674, N'à¤•à¥à¤®à¤•à¥à¤® à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 68, NULL, NULL, N'', 0),
  (675, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³', N'N', 68, NULL, NULL, N'', 0),
  (677, N'à¤®à¤¹à¤¾à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤²à¤¯', N'EG', 111, NULL, NULL, N'', 0),
  (678, N'à¤•à¤°à¥à¤•à¤°à¥‹à¤—', N'D', 98, NULL, NULL, N'', 0),
  (679, N'à¤Ÿà¥‡à¤•à¥à¤¸à¤Ÿà¤¾à¤ˆà¤² à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€', N'I', 58, NULL, NULL, N'', 0),
  (681, N'à¤µà¥€à¤Ÿ à¤­à¤Ÿà¥à¤Ÿà¥€', N'I', 68, NULL, NULL, N'', 0),
  (683, N'à¤«à¤¾à¤°à¥à¤® à¤¹à¤¾à¤Šà¤¸', N'R', 68, NULL, NULL, N'', 0),
  (684, N'à¤µà¥à¤¯à¤¾à¤¯à¤¾à¤® à¤¶à¤¾à¤³à¤¾', N'EG', 68, NULL, NULL, N'', 0),
  (685, N'à¤¡à¥à¤°à¤¾à¤¯ à¤«à¥à¤°à¥à¤Ÿà¥à¤¸ à¤¶à¥‰à¤ª', N'S', 74, NULL, NULL, N'', 0),
  (686, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥à¤¡', N'S', 68, NULL, NULL, N'', 0),
  (687, N'à¤­à¤•à¥à¤¤ à¤¨à¤¿à¤µà¤¾à¤¸', N'T', 68, NULL, NULL, N'', 0),
  (689, N'à¤¸à¥à¤Ÿà¥€à¤² à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€à¤œ', N'I', 72, NULL, NULL, N'', 0),
  (691, N'à¤¦à¥à¤•à¤¾à¤¨', N'CG', 74, NULL, NULL, N'', 0),
  (692, N'à¤ªà¥‹à¤¸à¥à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'CG', 110, NULL, NULL, N'', 0),
  (693, N'à¤µà¥à¤¯à¤¾à¤šà¤®à¤¨ à¤°à¥‚à¤®', N'GR', 98, NULL, NULL, N'', 0),
  (694, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'CG', 98, NULL, NULL, N'', 0),
  (695, N'à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿà¥à¤¸ à¤…à¤•à¥…à¤¡à¤®à¥€', N'EG', 72, NULL, NULL, N'', 0),
  (697, N'à¤•à¤¾à¤°à¤¾à¤—à¥ƒà¤¹', N'GC', 74, NULL, NULL, N'', 0),
  (698, N'à¤ªà¥‡à¤¯ à¤¤à¤¯à¤¾à¤° à¤•à¤°à¤£à¥‡ / à¤ªà¥‡à¤¯ à¤–à¤¾à¤¦à¥à¤¯à¤ªà¤¦à¤¾à¤°à¥à¤¥ à¤µà¤¿à¤•à¥à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (699, N'à¤–à¤¾à¤¨à¤¾à¤µà¤³', N'H', NULL, NULL, NULL, N'', 0),
  (700, N'à¤–à¤¾à¤¨à¤¾à¤µà¤³ / à¤¬à¤¾à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (701, N'à¤–à¤¾à¤¨à¤¾à¤µà¤³ / à¤¬à¤¾à¤° / à¤²à¥Œà¤œà¤¿à¤‚à¤—', N'H', NULL, NULL, NULL, N'', 0),
  (702, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤µà¥à¤¹à¤¨ à¤µà¤°  à¤–à¤¾à¤¦à¥à¤¯à¤ªà¤¦à¤¾à¤°à¥à¤¥ à¤µà¤¿à¤•à¥à¤°à¥€ à¤•à¤°à¤£à¥‡', N'H', NULL, NULL, NULL, N'', 0),
  (703, N'à¤†à¤ˆà¤¸à¤•à¥à¤°à¥€à¤® à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾  ', N'H', NULL, NULL, NULL, N'', 0),
  (704, N'à¤†à¤ˆà¤¸à¥à¤•à¥à¤°à¥€à¤® à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (705, N'à¤¨à¤µà¥€à¤¨ à¤¹à¥‰à¤Ÿà¥‡à¤² à¤¨à¤¾ à¤¹à¤°à¤•à¤¤ à¤¦à¤¾à¤–à¤²à¤¾', N'H', NULL, NULL, NULL, N'', 0),
  (706, N'à¤¹à¥‰à¤Ÿà¥‡à¤² à¤ªà¤°à¤µà¤¾à¤¨à¤¾ / à¤¨à¥à¤¤à¤¨à¥€à¤•à¤°à¤£ à¤¨à¤¾ à¤¹à¤°à¤•à¤¤ à¤¦à¤¾à¤–à¤²à¤¾', N'H', NULL, NULL, NULL, N'', 0),
  (707, N'à¤…à¤—à¥à¤°à¥‹ à¤–à¤¾à¤¦à¥à¤¯ à¤ªà¤¦à¤¾à¤°à¥à¤¥à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (708, N'à¤•à¥‡à¤Ÿà¤°à¤°à¥à¤¸', N'H', NULL, NULL, NULL, N'', 0),
  (709, N'à¤•à¥…à¤Ÿà¤°à¤°à¥à¤¸ à¤…à¤à¤¡ à¤°à¥‡à¤¸à¥à¤Ÿà¥‹à¤°à¤‚à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (710, N'à¤•à¥‡à¤Ÿà¤°à¤°à¥à¤¸ à¤¶à¥‰à¤ª ', N'H', NULL, NULL, NULL, N'', 0),
  (711, N'à¤•à¥…à¤Ÿà¤°à¥‡à¤¸ ', N'H', NULL, NULL, NULL, N'', 0),
  (712, N'à¤•à¥…à¤‚à¤Ÿà¥€à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (713, N'à¤†à¤‡à¤¸ à¤•à¥à¤°à¥€à¤®', N'H', NULL, NULL, NULL, N'', 0),
  (714, N'à¤†à¤‡à¤¸ à¤•à¥à¤°à¥€à¤® à¤ªà¤¾à¤°à¥à¤²à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (715, N'à¤†à¤‡à¤¸à¤¸à¥à¤•à¥à¤°à¥€à¤®', N'H', NULL, NULL, NULL, N'', 0),
  (716, N'à¤•à¥‡à¤• , à¤«à¥à¤°à¥‚à¤‡à¤Ÿà¥à¤¸ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (717, N'à¤•à¥‡à¤• à¤®à¥…à¤¨à¤¿à¤«à¥…à¤•à¤šà¤°à¤¿à¤‚à¤—', N'H', NULL, NULL, NULL, N'', 0),
  (718, N'à¤•à¥‡à¤• à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (720, N'à¤•à¥‰à¤«à¥€ à¤•à¥…à¤«à¥‡', N'H', NULL, NULL, NULL, N'', 0),
  (721, N'à¤•à¥…à¤«à¥‡ à¤¦ à¤¬à¥‡à¤•à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (722, N'à¤•à¥…à¤«à¥‡/à¤°à¥‡à¤¸à¤Ÿà¥‹à¤°à¥‡à¤‚à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (723, N'à¤ªà¤¿à¤à¥à¤à¤¾ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (724, N'à¤ªà¤¿à¤à¥à¤à¤¾ à¤¹à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (725, N'à¤ªà¤¿à¤à¤¾ à¤¹à¤¾à¤Šà¤¸', N'H', NULL, NULL, NULL, N'', 0),
  (726, N'à¤•à¥‹à¤²à¥à¤¡à¥à¤°à¤¿à¤‚à¤—  à¤¡à¥€à¤²à¤°à¤¶à¤¿à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (727, N'à¤•à¥‹à¤²à¥à¤¡à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (728, N'à¤ªà¥‹à¤³à¥€ à¤­à¤¾à¤œà¥€ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (729, N'à¤ªà¥‹à¤³à¥€ à¤­à¤¾à¤œà¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (730, N'à¤ªà¥‹à¤³à¥€-à¤­à¤¾à¤œà¥€ à¤•à¥‡à¤‚à¤¦à¥à¤° ', N'H', NULL, NULL, NULL, N'', 0),
  (731, N'à¤«à¤¾à¤¸à¥à¤Ÿ à¤«à¥‚à¤¡ à¤…à¤à¤¡ à¤¹à¥‰à¤Ÿà¥‡à¤²', N'H', NULL, NULL, NULL, N'', 0),
  (732, N'à¤«à¤¾à¤¸à¥à¤Ÿ à¤«à¥‚à¤¡ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (733, N'à¤«à¤¾à¤¸à¥à¤Ÿà¤«à¥‚à¤¡ à¤†à¤Šà¤Ÿà¤²à¥‡à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (734, N'à¤«à¤¾à¤¸à¥à¤Ÿà¤«à¥‚à¤¡ à¤•à¥‹à¤°à¥à¤¨à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (735, N'à¤¬à¥‡à¤•à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (736, N'à¤¬à¥‡à¤•à¤°à¥€ à¤…à¤à¤¡ à¤•à¥‡à¤• à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (737, N'à¤¬à¥‡à¤•à¤°à¥€ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (738, N'à¤šà¤¹à¤¾ , à¤ªà¤¾à¤£à¥€à¤ªà¥à¤°à¥€ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (739, N'à¤šà¤¹à¤¾ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (740, N'à¤šà¤¹à¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤° à¤†à¤£à¤¿ à¤µà¤¡à¤¾à¤ªà¤¾à¤µ ', N'H', NULL, NULL, NULL, N'', 0),
  (741, N'à¤šà¤¾à¤¯ à¤¦à¥à¤•à¤¾à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (742, N'à¤šà¤¾à¤¯ à¤¨à¤¾à¤¶à¥à¤¤à¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (743, N'à¤šà¤¾à¤¯à¤¨à¤¿à¤œ à¤¶à¥‰à¤ª ', N'H', NULL, NULL, NULL, N'', 0),
  (744, N'à¤šà¤¾à¤¯à¤¨à¤¿à¤œ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'H', NULL, NULL, NULL, N'', 0),
  (745, N'à¤šà¤¾à¤¯à¤¨à¥€à¤œ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (746, N'à¤œà¥à¤¯à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (747, N'à¤œà¥à¤¯à¥‚à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (748, N'à¤–à¤¾à¤¦à¥à¤¯ à¤µà¤¿à¤•à¥à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (749, N'à¤–à¤¾à¤¦à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¤¿', N'H', NULL, NULL, NULL, N'', 0),
  (750, N'à¤–à¤¾à¤¦à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¥€ ', N'H', NULL, NULL, NULL, N'', 0),
  (751, N'à¤–à¤¾à¤¦à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¥€ - à¤—à¥‹à¤¡à¤¾à¤Šà¤¨ ', N'H', NULL, NULL, NULL, N'', 0),
  (752, N'à¤–à¤¾à¤¦à¥à¤¯à¤¾à¤µà¤¿à¤•à¥à¤°à¤¿ à¤ªà¤¾à¤°à¥à¤¸à¤² ', N'H', NULL, NULL, NULL, N'', 0),
  (753, N'à¤–à¤¾à¤¦à¥à¤¯à¤¾à¤µà¤¿à¤•à¥à¤°à¤¿/à¤–à¤¾à¤¨à¤¾à¤µà¤³', N'H', NULL, NULL, NULL, N'', 0),
  (754, N'à¤–à¤¾à¤¦à¥à¤¯à¤¾à¤µà¤¿à¤•à¥à¤°à¥€ ', N'H', NULL, NULL, NULL, N'', 0),
  (755, N'à¤–à¤¾à¤¨à¤¾à¤µà¤³ à¤®à¤§à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (756, N'à¤Ÿà¤¿ à¤¸à¥à¤Ÿà¥‰à¤² ', N'H', NULL, NULL, NULL, N'', 0),
  (757, N'à¤Ÿà¥€ à¤…à¤à¤¡ à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (758, N'à¤Ÿà¥€ à¤¸à¥à¤Ÿà¥‰à¤²', N'H', NULL, NULL, NULL, N'', 0),
  (759, N'à¤®à¤¿à¤ à¤¾à¤ˆ à¤¦à¥à¤•à¤¾à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (761, N'à¤¬à¤¾à¤° à¤…à¤à¤¨à¥à¤¡ à¤°à¥‡à¤¸à¥à¤Ÿà¥‹à¤°à¥‡à¤‚à¤¨à¥à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (762, N'à¤šà¤¹à¤¾ à¤¨à¤¾à¤·à¥à¤Ÿà¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (763, N'à¤Ÿà¥€ à¤…à¤à¤¡ à¤¸à¥à¤¨à¥…à¤•à¥à¤¸', N'H', NULL, NULL, NULL, N'', 0),
  (764, N'à¤­à¥‡à¤³à¥à¤ªà¥à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (765, N'à¤¹à¥‰à¤Ÿà¥‡à¤² (à¤‰à¤ªà¤¹à¤¾à¤°à¤—à¥ƒà¤¹)', N'H', NULL, NULL, NULL, N'', 0),
  (766, N'à¤¹à¥‰à¤Ÿà¥‡à¤² / à¤¸à¥à¤µà¥€à¤Ÿ à¤®à¤¾à¤°à¥à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (767, N'à¤¹à¥‰à¤Ÿà¥‡à¤² à¤…à¤à¤¡ à¤°à¥‡à¤¸à¥à¤Ÿà¥‹à¤°à¤‚à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (769, N'à¤¹à¥‰à¤Ÿà¥‡à¤²(à¤—à¥‹à¤¡à¤¾à¤Šà¤¨)', N'H', NULL, NULL, NULL, N'', 0),
  (770, N'à¤¹à¥‰à¤Ÿà¥‡à¤², à¤¬à¤¾à¤° à¤µ à¤²à¥‰à¤‚à¤œà¤¿à¤‚à¤—', N'H', NULL, NULL, NULL, N'', 0),
  (771, N'à¤¹à¥‰à¤Ÿà¥‡à¤²/à¤–à¤¾à¤¨à¤¾à¤µà¤³', N'H', NULL, NULL, NULL, N'', 0),
  (772, N'à¤¹à¥‰à¤Ÿà¥‡à¤²/à¤°à¥‡à¤¸à¥à¤Ÿà¥‰à¤°à¤‚à¤Ÿ/à¤²à¥‰à¤œ', N'H', NULL, NULL, NULL, N'', 0),
  (773, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤¹à¥‰à¤Ÿà¥‡à¤²', N'H', NULL, NULL, NULL, N'', 0),
  (774, N'à¤¬à¤¾à¤° à¤…à¤à¤¡ à¤°à¥‡à¤¸à¥à¤Ÿà¥‰à¤°à¤‚à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (775, N'à¤«à¥à¤¡ à¤®à¤¾à¤°à¥à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (776, N'à¤«à¥‚à¤¡ à¤®à¤¾à¤°à¥à¤Ÿ ', N'H', NULL, NULL, NULL, N'', 0),
  (777, N'à¤«à¥‚à¤¡ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (778, N'à¤«à¥à¤¡à¥à¤¸ à¤•à¥‹à¤°à¥à¤¨à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (779, N'à¤­à¤¾à¤œà¥€ à¤ªà¥‹à¤³à¥€ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (780, N'à¤¸à¥à¤µà¥€à¤Ÿ à¤®à¤¾à¤°à¥à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (781, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸', N'H', NULL, NULL, NULL, N'', 0),
  (782, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸ , à¤–à¤¾à¤¦à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¥€', N'H', NULL, NULL, NULL, N'', 0),
  (783, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸ à¤…à¤à¤¡ à¤¨à¤®à¤•à¤¿à¤¨ à¤¶à¥‰à¤ª ', N'H', NULL, NULL, NULL, N'', 0),
  (784, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸ à¤…à¤à¤¡ à¤«à¤°à¤¸à¤¾à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (785, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸ à¤…à¤à¤¡ à¤«à¤°à¤¸à¤¾à¤¨ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (786, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸ à¤•à¥‰à¤°à¥à¤¨à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (787, N'à¤¸à¥à¤µà¥€à¤Ÿà¥à¤¸, à¤¡à¥à¤°à¤¾à¤¯à¤«à¥ƒà¤Ÿà¥à¤¸, à¤–à¤¾à¤¦à¥à¤¯à¤¾à¤µà¤¿à¤•à¥à¤°à¤¿ ', N'H', NULL, NULL, NULL, N'', 0),
  (788, N'à¤¸à¤à¤¡à¤µà¤¿à¤š à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (789, N'à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤•à¥‰à¤°à¥à¤¨à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (790, N'à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤•à¥‹à¤°à¥à¤¨à¤° ', N'H', NULL, NULL, NULL, N'', 0),
  (791, N'à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤¦à¥à¤•à¤¾à¤¨', N'H', NULL, NULL, NULL, N'', 0),
  (792, N'à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (793, N'à¤®à¤¿à¤¸à¤³ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (794, N'à¤®à¤¿à¤¸à¤³ à¤¸à¥à¤¨à¥…à¤•à¥à¤¸ à¤•à¥‰à¤°à¥à¤¨à¤° ', N'H', NULL, NULL, NULL, N'', 0),
  (795, N'à¤µà¤¡à¤¾à¤ªà¤¾à¤µ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (796, N'à¤«à¥…à¤®à¤¿à¤²à¥€ à¤°à¥‡à¤¸à¥à¤Ÿà¤¾à¤°à¤‚à¤Ÿ', N'H', NULL, NULL, NULL, N'', 0),
  (797, N'à¤«à¥à¤°à¥‚à¤‡à¤Ÿà¥à¤¸ à¤…à¤à¤¡ à¤¸à¥à¤¨à¥…à¤•à¥à¤¸', N'H', NULL, NULL, NULL, N'', 0),
  (798, N'à¤¬à¤°à¥à¤—à¤°', N'H', NULL, NULL, NULL, N'', 0),
  (799, N'à¤¬à¤¿à¤°à¥à¤¯à¤¾à¤£à¥€ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (800, N'à¤¬à¤¿à¤°à¥à¤¯à¤¾à¤£à¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'H', NULL, NULL, NULL, N'', 0),
  (801, N'à¤¬à¤¿à¤°à¥à¤¯à¤¾à¤¨à¥€ à¤¶à¥‰à¤ª', N'H', NULL, NULL, NULL, N'', 0),
  (802, N'à¤°à¤¾à¤œà¥‚ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (803, N'à¤°à¤¾à¤®à¤•à¥ƒà¤·à¥à¤£ à¤¬à¤¿à¤¸à¤µà¤¾à¤²/à¤¶à¤¿à¤µà¤¾à¤¨à¥€ à¤ªà¥à¤°à¤¿à¤¯à¤¦à¤°à¥à¤¶à¤¨à¥€ à¤¬à¤¿à¤¸à¤µà¤¾à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (804, N'à¤°à¤¿à¤…à¤° à¤‡à¤¸à¥à¤Ÿà¥‡à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (805, N'à¤°à¤¿à¤…à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (806, N'à¤°à¤¿à¤…à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤…à¤à¤¡ à¤•à¥…à¤Ÿà¤°à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0),
  (807, N'à¤°à¤¿à¤…à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (808, N'à¤°à¤¿à¤…à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤•à¤¨à¥à¤¸à¤²à¥à¤Ÿà¤¨à¥à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (809, N'à¤°à¤¿à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (810, N'à¤°à¤¿à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤— à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (811, N'à¤°à¤¿à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤— à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (812, N'à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤— à¤µà¤°à¥à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (813, N'à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (814, N'à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (815, N'à¤°à¤¿à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (816, N'à¤°à¤¿à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (817, N'à¤°à¤¿à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯  ', N'S', NULL, NULL, NULL, N'', 0),
  (818, N'à¤°à¤¿à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (819, N'à¤°à¤¿à¤¯à¤² à¤ˆà¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (820, N'à¤°à¤¿à¤²à¤¾à¤¯à¤¨à¥à¤¸ à¤®à¤¾à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (821, N'à¤°à¥€à¤…à¤²  à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (822, N'à¤°à¥€à¤…à¤²  à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (823, N'à¤°à¥€à¤…à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (824, N'à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (825, N'à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (826, N'à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (827, N'à¤°à¥€à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (828, N'à¤°à¥€à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (829, N'à¤²à¤à¤¡ à¤…à¤à¤¡ à¤¬à¤¿à¤²à¥à¤¡à¤¿à¤‚à¤— à¤ªà¥à¤²à¥…à¤¨à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0),
  (830, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤‡à¤®à¤¿à¤Ÿà¥‡à¤¶à¤¨ à¤œà¥à¤µà¥‡à¤²à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (831, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤—à¤¾à¤°à¤®à¥‡à¤‚à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (832, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤Ÿà¥‡à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (833, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤Ÿà¥‡à¤²à¤° à¤…à¤à¤¡ à¤¬à¥à¤¯à¥à¤Ÿà¥€ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (834, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤Ÿà¥‡à¤²à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (835, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (836, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤¬à¥à¤¯à¥à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (837, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (838, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤µà¥‡à¤¯à¤° à¤…à¤à¤¡ à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (839, N'à¤²à¥‡à¤¡à¤¿à¤œ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (840, N'à¤²à¥‡à¤¡à¥€à¤œ à¤Ÿà¥‡à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (841, N'à¤²à¥‡à¤¡à¥€à¤œ à¤¬à¥à¤Ÿà¥€à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (842, N'à¤²à¥‡à¤¡à¥€à¤œ à¤¬à¥à¤¯à¥à¤Ÿà¤¿ à¤•à¤²à¥‡à¤•à¥à¤¶à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (843, N'à¤²à¥‡à¤¡à¥€à¤œ à¤¬à¥à¤¯à¥à¤Ÿà¤¿ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (844, N'à¤²à¥‡à¤¡à¥€à¤œ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (845, N'à¤²à¥‡à¤¡à¥€à¤¸ à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (846, N'à¤²à¥‡à¤¡à¥€à¤¸ à¤•à¥‹à¤¸à¤®à¥‡à¤Ÿà¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (847, N'à¤²à¥‡à¤¡à¥€à¤¸ à¤Ÿà¥‡à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (848, N'à¤²à¥‡à¤¡à¥€à¤¸ à¤ªà¤¾à¤°à¥à¤²à¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (849, N'à¤²à¥…à¤ªà¤Ÿà¥‰à¤ª à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (850, N'à¤²à¥…à¤¬', N'S', NULL, NULL, NULL, N'', 0),
  (851, N'à¤²à¥…à¤¬ à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (852, N'à¤²à¥…à¤¬à¥‹à¤°à¥‡à¤Ÿà¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (853, N'à¥²à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤…à¤‚à¤¡ à¤•à¥à¤²à¤¾à¤¸ à¤µà¤°à¥à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (854, N'à¥²à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤«à¥…à¤¬à¥à¤°à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (855, N'à¤²à¤¹à¤¾à¤¨ à¤®à¥à¤²à¤¾à¤‚à¤šà¤¾ à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (856, N'à¤²à¤¹à¤¾à¤¨ à¤®à¥à¤²à¤¾à¤‚à¤šà¥€ à¤¶à¤¾à¤³à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (857, N'à¤²à¤¾à¤ˆà¤Ÿ à¤¹à¤¾à¤Šà¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (858, N'à¤²à¤¾à¤ˆà¤« à¤‡à¤¨à¥à¤¶à¥à¤°à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (859, N'à¤²à¤¾à¤ˆà¤«à¤¼ à¤‡à¤‚à¤¨à¥à¤¶à¥à¤°à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (860, N'à¤²à¤¾à¤à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (861, N'à¤²à¤¾à¤¦à¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (862, N'à¤²à¤¾à¤¦à¥€à¤šà¥‡ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (863, N'à¤²à¤¾à¤¯à¤Ÿà¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (864, N'à¤²à¤¿à¤«à¥à¤Ÿà¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (866, N'à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿà¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (867, N'à¤²à¥‰à¤œà¥€à¤¸à¥à¤Ÿà¥€à¤• à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (868, N'à¤²à¥‰à¤Ÿà¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (869, N'à¤²à¥‰à¤‚à¤¡à¥à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (870, N'à¤²à¥‰à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (871, N'à¤²à¥‰à¤‚à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (872, N'à¤²à¥‰à¤‚à¤¡à¥à¤°à¥€ à¤µà¤°à¥à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (873, N'à¤²à¥‰à¤‚à¤¡à¥à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (874, N'à¤²à¥‰à¤¨à¥à¤¡à¥à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (875, N'à¤²à¥‰à¤‚à¤¨à¥à¤¡à¥à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (876, N'à¤²à¥‰à¤‚à¤¨à¥à¤¡à¥à¤°à¤¿ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (877, N'à¤²à¥‰à¤¨à¥à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (878, N'à¤²à¥‰à¤‚à¤¨à¥à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (879, N'à¤²à¥‰à¤¨à¥à¤¡à¥à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (880, N'à¤²à¥‰à¤‚à¤¨à¥à¤¡à¥à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (881, N'à¤²à¥‹à¤‚à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (882, N'à¤²à¥‹à¤£ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (883, N'à¤²à¥‹à¤£à¥à¤¡à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (884, N'à¤²à¥‹à¤¨ à¤«à¤¾à¤¯à¤¨à¤¾à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (885, N'à¤²à¥‹à¤¨ à¤¸à¥‡à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (886, N'à¤²à¥Œà¤‚à¤¡à¥à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (887, N'à¤µà¤•à¤¿à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (888, N'à¤µà¤œà¤¨ à¤•à¤¾à¤Ÿà¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (889, N'à¤µà¤œà¤¨à¤•à¤¾à¤Ÿà¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (890, N'à¤µà¥‚à¤¡ à¤‡à¤®à¥à¤ªà¥à¤°à¥‡à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (891, N'à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (892, N'à¥²à¤®à¥‡à¤à¥‹à¤¨ à¤ªà¤¾à¤°à¥à¤¸à¤² à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (893, N'à¤®à¤Ÿà¤£ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (894, N'à¤®à¤‚à¤¡à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (895, N'à¤®à¤‚à¤¡à¤ª à¤¡à¥‡à¤•à¥‹à¤°à¥‡à¤Ÿà¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (896, N'à¤®à¤‚à¤¡à¤ª à¤¡à¥‡à¤•à¥‹à¤°à¥‡à¤¶à¤¨ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (897, N'à¤®à¤‚à¤¡à¤ª à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (898, N'à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (899, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤…à¤à¤¡ à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (900, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤…à¤à¤¡ à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (901, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤¡à¤¿à¤¸à¥à¤Ÿà¥à¤°à¤¿à¤¬à¥à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (902, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤ªà¤°à¤µà¤¾à¤¨à¤¾ à¤¬à¤¨à¤µà¤£à¥‡', N'S', NULL, NULL, NULL, N'', 0),
  (903, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (904, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (905, N'à¤®à¥‡à¤¡à¤¿à¤•à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (906, N'à¤®à¥‡à¤¡à¤¿à¤¸à¤¿à¤¨ à¤”à¤·à¤§à¥‡ ', N'S', NULL, NULL, NULL, N'', 0),
  (907, N'à¤®à¥‡à¤¡à¤¿à¤¸à¤¿à¤¨ à¤¡à¥€à¤¸à¥à¤Ÿà¥à¤°à¥€à¤¬à¥à¤¯à¥à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (908, N'à¤®à¥‡à¤¡à¤¿à¤¸à¤¿à¤¨ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (909, N'à¤®à¥‡à¤¡à¤¿à¤¸à¥€à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (910, N'à¤®à¥‡à¤¡à¤¿à¤¸à¥€à¤¨ à¤¸à¥à¤Ÿà¥‰à¤•à¤¿à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (911, N'à¤®à¥‡à¤¡à¥€à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (912, N'à¤®à¥à¤¥à¥à¤Ÿ à¤«à¤¿à¤¨à¤•à¥‰à¤°à¥à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (913, N'à¤®à¤¦à¥à¤¯ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (914, N'à¤®à¤¦à¤¯à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (915, N'à¤®à¤¦à¥à¤¯à¤µà¤¿à¤•à¥à¤°à¥€ ', N'S', NULL, NULL, NULL, N'', 0),
  (916, N'à¤®à¥‡à¤¨à¥à¤¸ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (917, N'à¤®à¥‡à¤¨à¥à¤¸ à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (918, N'à¤®à¥‡à¤¨à¥à¤¸ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (919, N'à¤®à¤¨à¥€ à¤Ÿà¥à¤°à¤¾à¤¨à¥à¤¸à¤«à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (920, N'à¤®à¥à¤¯à¥‚à¤šà¥à¤…à¤² à¤«à¤‚à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (921, N'à¤®à¥à¤¯à¥‚à¤œà¤¿à¤• à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (922, N'à¤®à¥à¤¯à¥à¤à¤¿à¤• à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“', N'S', NULL, NULL, NULL, N'', 0),
  (923, N'à¤®à¥à¤¯à¤¾à¤¨à¥€à¤«à¥à¤¯à¤¾à¤•à¥à¤šà¤°à¤¿à¤‚à¤—  à¤²à¤¾à¤‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (924, N'à¤®à¤°à¥à¤•à¥‡à¤Ÿà¤¿à¤‚à¤— à¤‘à¤« à¤‡à¤‚à¤œà¤¿à¤¨à¤¿à¤…à¤°à¤¿à¤‚à¤— à¤ªà¥à¤°à¥‹à¤¡à¥à¤•à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (925, N'à¤®à¤¶à¥€à¤¨ à¤ªà¤¾à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (926, N'à¤®à¤¸à¥à¤¯ à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (927, N'à¤®à¤¸à¤¾à¤²à¤¾ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (928, N'à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (929, N'à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿà¤¿à¤‚à¤— à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (930, N'à¤®à¤¾à¤¸à¥‡ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (931, N'à¤®à¤¾à¤¸à¥‡ à¤µà¤¿à¤•à¥à¤°à¥€ , à¤–à¤¾à¤¦à¥à¤¯ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (932, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤…à¤à¤¡ à¤•à¤¨à¥à¤¸à¥à¤Ÿà¥à¤°à¤•à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (933, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤‡à¤‚à¤Ÿà¥‡à¤°à¤¿à¤¯à¤° à¤µà¤°à¥à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (934, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (935, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (936, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤¡à¥‡à¤µà¥à¤¹à¤²à¤ªà¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (937, N'à¤¬à¤¿à¤²à¥à¤¡à¤° à¤®à¤Ÿà¥‡à¤°à¤¿à¤¯à¤² à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (938, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¤°à¥à¤¸ à¤…à¤à¤¡ à¤¡à¥‡à¤µà¥à¤¹à¤²à¤ªà¤°à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (939, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤…à¤à¤¡ à¤¡à¥‡à¤µà¤²à¤ªà¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (940, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤…à¤à¤¡ à¤¡à¥‡à¤µà¥à¤¹à¤ªà¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (941, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤…à¤à¤¡ à¤¡à¥‡à¤µà¥à¤¹à¤²à¤ªà¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (942, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤…à¤à¤¨à¥à¤¡ à¤¡à¥‡à¤µà¤²à¤ªà¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (943, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤†à¤£à¤¿ à¤¡à¥‡à¤µà¤²à¤ªà¤°à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (944, N'à¤¬à¤¿à¤²à¤¡à¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (945, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (946, N'à¤¬à¤¿à¤²à¥à¤¡à¤°à¥à¤¸ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (947, N'à¤¬à¤¿à¤²à¥à¤¡à¤¿à¤‚à¤— à¤®à¤Ÿà¥‡à¤°à¤¿à¤¯à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (948, N'à¤¬à¥‰à¤¡à¥€ à¤®à¤¸à¤¾à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (949, N'à¤­à¤‚à¤—à¤¾à¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (950, N'à¤­à¤‚à¤—à¤¾à¤° à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (951, N'à¤­à¤‚à¤—à¤¾à¤° à¤°à¤¦à¥à¤¦à¥€à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (952, N'à¤­à¤‚à¤—à¤¾à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (953, N'à¤­à¤‚à¤—à¤¾à¤°à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (954, N'à¤¬à¥à¤²à¤¡ à¤•à¤¨à¥‡à¤•à¥à¤¶à¤¨ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (955, N'à¤¬à¥à¤²à¤¡ à¤²à¥‡à¤¬à¥‹à¤°à¥‡à¤Ÿà¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (956, N'à¤¬à¥à¤²à¤¡ à¤²à¥‡à¤¬à¥‹à¤°à¥‡à¤Ÿà¤°à¥€à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (957, N'à¤¬à¤¾à¤‡à¤• à¤•à¤¾à¤° à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (958, N'à¤¬à¤¾à¤‡à¤• à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (959, N'à¤¬à¤¾à¤‡à¤• à¤¸à¤°à¥à¤µà¤¿à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (960, N'à¤¬à¤¾à¤‡à¤• à¤¸à¥‡à¤²à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (961, N'à¤¬à¤¾à¤‡à¤• à¤¸à¤¾à¤°à¤µà¤¿à¤°à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (962, N'à¤¬à¤¾à¤ˆà¤• à¤µà¤¿à¤•à¤¤à¤¾à¤¤', N'S', NULL, NULL, NULL, N'', 0),
  (963, N'à¤¬à¤¾à¤Ÿà¤²à¥à¤¯à¤¾à¤‚à¤šà¤¾ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (964, N'à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (965, N'à¤«à¥à¤°à¥‚à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (966, N'à¤«à¥à¤°à¥‚à¤Ÿ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (967, N'à¤«à¤°à¥à¤¨à¥‡à¤¶à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (968, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (969, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (970, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤ªà¥‰à¤²à¤¿à¤¶ ', N'S', NULL, NULL, NULL, N'', 0),
  (971, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤®à¥‡à¤•à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (972, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤®à¥‡à¤•à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (973, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤µà¤°à¥à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (974, N'à¤«à¤°à¥à¤¨à¤¿à¤šà¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (975, N'à¤µà¥‡à¤«à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (977, N'à¤µà¥‡à¤²à¥à¤¡à¤¿à¤‚à¤— à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (978, N'à¤µà¥‡à¤²à¥à¤¡à¤¿à¤‚à¤— à¤µà¤°à¥à¤• à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (979, N'à¤µà¥‡à¤²à¥à¤¡à¤¿à¤‚à¤— à¤µà¤°à¥à¤•à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (980, N'à¤µà¥‡à¤²à¥à¤¡à¤¿à¤‚à¤— à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (981, N'à¤µà¤¸à¥à¤¤à¥‚à¤­à¤‚à¤¡à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (982, N'à¤µà¥à¤¹à¥‡à¤œà¤¿à¤Ÿà¥‡à¤¬à¤² à¤µ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (983, N'à¤µà¥à¤¹à¥‡à¤œà¥€à¤Ÿà¥‡à¤¬à¤² ', N'S', NULL, NULL, NULL, N'', 0),
  (984, N'à¤µà¥à¤¹à¥‡à¤œà¥€à¤Ÿà¥‡à¤¬à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (985, N'à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¥‡à¤µà¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (986, N'à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (987, N'à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ à¤†à¤£à¤¿ à¤¸à¥‡à¤µà¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (988, N'à¤µà¤¿à¤¦à¥à¤¯à¥à¤¤ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (989, N'à¤µà¥‰à¤š à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (990, N'à¤µà¥‰à¤Ÿà¤° à¤Ÿà¥…à¤‚à¤• à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (991, N'à¤µà¥‰à¤Ÿà¤° à¤ªà¥à¤¯à¥‚à¤°à¤¿à¤«à¤¾à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (992, N'à¤µà¥‰à¤Ÿà¤° à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (993, N'à¤µà¥‰à¤²à¤ªà¥‡à¤ªà¤° à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (994, N'à¤µà¥‰à¤²à¤ªà¥‡à¤ªà¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (995, N'à¤µà¥‰à¤²à¤ªà¥‡à¤ªà¤° à¤¸à¥à¤Ÿà¥‹à¤…à¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (996, N'à¤µà¥‰à¤¶à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (997, N'à¤¶à¥à¤œ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (999, N'à¤¶à¤¿à¤•à¥à¤·à¤£ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1000, N'à¤¶à¤¿à¤²à¤¾à¤ˆ à¤®à¤¶à¥€à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1001, N'à¤¶à¤¿à¤²à¤¾à¤ˆ à¤®à¤¶à¥€à¤¨ à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤…à¤à¤¡ à¤¸à¥‡à¤²à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1002, N'à¤¶à¥€à¤ª à¤¬à¥à¤°à¥‹à¤•à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1003, N'à¤¶à¥‹à¤°à¥‚à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1004, N'à¤¶à¥‹à¤°à¥à¤®à¤¾ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (1005, N'à¤¸à¥‡à¤•à¤‚à¤¡ à¤¹à¤à¤¡ à¤²à¥…à¤ªà¤Ÿà¥‰à¤ª à¤…à¥…à¤¨à¥à¤¡ à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¨à¥à¤¡ à¤°à¤¿à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1006, N'à¤¸à¥‡à¤•à¥à¤¯à¥à¤°à¤¿à¤Ÿà¥€ à¤ªà¥à¤°à¥‹à¤µà¥à¤¹à¤¾à¤¯à¤¡à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1007, N'à¤¸à¥à¤•à¥à¤°à¥…à¤ª à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1008, N'à¤¸à¥à¤•à¥à¤°à¥…à¤ª à¤®à¤¾à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1009, N'à¤¸à¥à¤•à¥€à¤¨ à¤•à¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1010, N'à¤¸à¥à¤•à¥€à¤¨ à¤¸à¥à¤ªà¥‡à¤¶à¤¾à¤²à¥€à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1011, N'à¤¸à¥à¤•à¥€à¤¨ à¤¹à¥‡à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1012, N'à¤¸à¤‚à¤—à¤£à¤• à¤¦à¥à¤°à¥‚à¤¸à¥à¤¤à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1013, N'à¤¸à¥à¤Ÿà¥…à¤®à¥à¤ª à¤µà¥‡à¤‚à¤¡à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1014, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (1015, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1016, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤à¤¡ à¤—à¤¿à¤«à¥à¤Ÿ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1017, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤à¤¡ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1018, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤à¤¡ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1019, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤à¤¡ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1020, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤à¤¡ à¤¨à¥‰à¤µà¥à¤¹à¥‡à¤²à¥à¤Ÿà¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1021, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤…à¤‚à¤¡ à¤ªà¥à¤°à¤¿à¤‚à¤Ÿà¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1022, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤†à¤£à¤¿ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1023, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1024, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤µ à¤•à¥‹à¤¸à¥à¤®à¥à¤¯à¤¾à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1025, N'à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1026, N'à¤¸à¥à¤Ÿà¤¾à¤° à¤¬à¤¿à¤²à¥à¤¡à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1027, N'à¤¸à¥à¤Ÿà¤¿à¤² à¤Ÿà¥à¤°à¥‡à¤¡à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1028, N'à¤¸à¥à¤Ÿà¤¿à¤² à¤ªà¤¾à¤‡à¤ª à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1029, N'à¤¸à¥à¤Ÿà¥€à¤² à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1030, N'à¤¸à¥à¤Ÿà¥€à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1031, N'à¤¸à¥à¤Ÿà¥€à¤² à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1032, N'à¤¸à¥à¤Ÿà¥‰à¤• à¤¬à¥à¤°à¥‹à¤•à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1033, N'à¤¸à¥à¤Ÿà¥‰à¤• à¤¹à¥‹à¤²à¥à¤¡à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1034, N'à¤¸à¥à¤Ÿà¥‰à¤•à¤¿à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1036, N'à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸ à¤°à¥‚à¤® ', N'S', NULL, NULL, NULL, N'', 0),
  (1037, N'à¤®à¥€à¤Ÿ à¤¸à¥à¤Ÿà¥‹à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1038, N'à¤®à¥‰à¤¡à¥à¤¯à¥à¤²à¤°à¤•à¤¿à¤šà¤¨ à¤Ÿà¥à¤°à¥‰à¤²à¥€à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1039, N'à¤®à¥‰à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1040, N'à¤®à¥‹à¤Ÿà¤° à¤Ÿà¥à¤°à¥‡à¤¨à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1041, N'à¤®à¥‹à¤Ÿà¤° à¤Ÿà¥à¤°à¥‡à¤¨à¤¿à¤‚à¤— à¤¸à¥à¤•à¥‚à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1042, N'à¤®à¥‹à¤Ÿà¤° à¤ªà¤‚à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1043, N'à¤®à¥‹à¤¡à¥‚à¤²à¤° à¤•à¤¿à¤šà¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1044, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤…à¤à¤¡ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1045, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤†à¤£à¤¿ à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1046, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤à¤•à¥à¤¸à¥‡à¤¸à¤°à¥€à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1047, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤à¤¸à¥à¤•à¥‡à¤¸à¤°à¥€à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1048, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤—à¥…à¤²à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1049, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤¡à¥€à¤¸à¥à¤Ÿà¥à¤°à¥€à¤¬à¥à¤¯à¥à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1050, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1051, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1052, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤¶à¥‰à¤ª , à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1053, N'à¤®à¥‹à¤¬à¤¾à¤‡à¤²/à¤²à¥…à¤ªà¤Ÿà¥‰à¤ª à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1054, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1055, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤°à¥€à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1056, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1057, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1058, N'à¤¯à¥à¤¨à¤¿à¤«à¥‰à¤°à¥à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1059, N'à¤¯à¥à¤¨à¤¿à¤¸à¥‡à¤•à¥à¤¸ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1060, N'à¤°à¥‡à¤•à¥‰à¤°à¥à¤¡à¤¿à¤‚à¤— à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“ ', N'S', NULL, NULL, NULL, N'', 0),
  (1061, N'à¤°à¥‡à¤¡à¤¿à¤®à¥‡à¤Ÿ à¤—à¤¾à¤°à¤®à¥‡à¤‚à¤Ÿà¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1062, N'à¤°à¥‡à¤¡à¤¿à¤¯à¤® à¤†à¤°à¥à¤Ÿà¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1063, N'à¤°à¤¦à¥à¤¦à¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1064, N'à¤°à¤¦à¥à¤¦à¥€ à¤ªà¥‡à¤ªà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1065, N'à¤°à¤¦à¥à¤¦à¥€ à¤ªà¥‡à¤ªà¤° à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1066, N'à¤°à¥‡à¤ªà¤¾à¤°à¥€à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1067, N'à¤°à¤¬à¤° à¤¸à¥à¤Ÿà¥…à¤®à¥à¤ª à¤µà¥‡à¤‚à¤¡à¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1068, N'à¤¸à¤¨à¤—à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1069, N'à¤¸à¤¨à¤°à¤¾à¤‡à¤œà¥ à¤°à¤¿à¤¯à¤²à¤Ÿà¥‹à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1070, N'à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1071, N'à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1072, N'à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿ à¤µ à¤—à¥…à¤°à¥‡à¤œ ', N'S', NULL, NULL, NULL, N'', 0),
  (1073, N'à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿà¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1074, N'à¤¸à¥à¤ªà¥‡à¤…à¤°à¤ªà¤¾à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (1075, N'à¤¸à¥à¤ªà¥‡à¤¯à¤° à¤ªà¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1076, N'à¤¸à¥à¤ªà¥‡à¤¯à¤° à¤ªà¤¾à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1077, N'à¤¸à¥à¤ªà¤° à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1078, N'à¤¸à¥à¤ªà¥à¤²à¥‡à¤¸à¤®à¥‡à¤‚à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1079, N'à¤¸à¤ªà¥à¤²à¤¾à¤¯ à¤šà¥‡à¤¨ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1080, N'à¤¸à¥à¤ªà¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1081, N'à¤¸à¥à¤ªà¤¾ à¤†à¤£à¤¿ à¤®à¤¸à¤¾à¤œ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1082, N'à¤¸à¥à¤ªà¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1083, N'à¤¸à¥à¤ªà¤¾. à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1084, N'à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1085, N'à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿà¥à¤¸ à¤†à¤£à¤¿ à¤œà¤¿à¤® à¤‰à¤ªà¤¯à¥‹à¤—à¥€à¤µà¤¸à¥à¤¤à¥', N'S', NULL, NULL, NULL, N'', 0),
  (1086, N'à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿà¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1087, N'à¤¸à¥žà¤¾à¤¯à¤° à¤¶à¥‰à¤ª(à¤•à¤ªà¤¡à¤¾ )', N'S', NULL, NULL, NULL, N'', 0),
  (1088, N'à¤¸à¥à¤°à¤•à¥à¤·à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1089, N'à¤¸à¤°à¥à¤œà¤¿à¤•à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1090, N'à¤¸à¤°à¥à¤µà¥‡à¤…à¤° à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1091, N'à¤¸à¤°à¥à¤µà¤¿à¤¸ à¤ªà¥à¤°à¥‹à¤µà¤¾à¤¯à¤¡à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1092, N'à¤¸à¤°à¥à¤µà¤¿à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1093, N'à¤¸à¤²à¥à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1094, N'à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1095, N'à¤¸à¤²à¥‚à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1096, N'à¤¸à¥à¤²à¤¯à¤¡à¤¿à¤‚à¤— à¤µà¤¿à¤‚à¤¡à¥‹à¤µ à¤…à¤à¤¡ à¤¡à¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1097, N'à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1098, N'à¤¸à¥‡à¤²à¥à¤¸ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤¬à¤¿à¤²à¥à¤¡à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1099, N'à¤¸à¥‡à¤²à¥à¤¸ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1100, N'à¤¸à¥‡à¤²à¥à¤¸(à¤¸à¥à¤ªà¥‹à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª)', N'S', NULL, NULL, NULL, N'', 0),
  (1101, N'à¤¸à¥à¤²à¤¾à¤‡à¤¡à¤¿à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1102, N'à¤¸à¤¹à¥‡à¤²à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1103, N'à¤¸à¤¾à¤ˆà¤¨ à¤¬à¥‹à¤°à¥à¤¡ à¤®à¥‡à¤•à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1104, N'à¤¸à¤¾à¤¡à¥€ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1105, N'à¤¸à¤¾à¤¯à¤•à¤² à¤®à¤¾à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1106, N'à¤¸à¤¾à¤¯à¤•à¤² à¤°à¤¿à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1107, N'à¤¸à¤¾à¤¯à¤•à¤² à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1108, N'à¤¸à¤¾à¤¯à¤•à¤² à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (1109, N'à¤¸à¤¾à¤¯à¤•à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1110, N'à¤¸à¤¾à¤¯à¤¬à¤° à¤•à¥…à¤«à¥‡', N'S', NULL, NULL, NULL, N'', 0),
  (1111, N'à¤¸à¤¿à¤•à¥à¤¯à¥à¤°à¤¿à¤Ÿà¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1112, N'à¤¸à¤¿à¤•à¥à¤¯à¥à¤°à¤¿à¤Ÿà¥€ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1113, N'à¤¸à¤¿à¤‚à¤—à¤¾à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1114, N'à¤¸à¤¿à¤Ÿà¥€ à¤•à¤µà¥à¤¹à¤° /à¤¸à¥‹à¤«à¤¾ à¤®à¥‡à¤•à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1115, N'à¤¸à¤¿à¤Ÿà¥€ à¤®à¥‡à¤•à¤° à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (1116, N'à¤¸à¤¿à¤®à¥‡à¤‚à¤Ÿà¤šà¥‡ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1117, N'à¤¸à¤¿à¤°à¥…à¤®à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1118, N'à¤¸à¤¿à¤°à¥…à¤®à¤¿à¤• à¤…à¤à¤¡ à¤¸à¥à¤Ÿà¤¾à¤ˆà¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1119, N'à¤¸à¤¿à¤°à¥…à¤®à¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1120, N'à¤¸à¤¿à¤°à¥…à¤®à¤¿à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1121, N'à¤¸à¤¿à¤°à¤¾à¤®à¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1122, N'à¤¸à¤¿à¤°à¤¾à¤®à¤¿à¤•à¥à¤¸ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1123, N'à¤¸à¤¿à¤µà¥à¤¹à¤¿à¤² à¤•à¥‰à¤¨à¥à¤Ÿà¥à¤°à¥…à¤•à¥à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1124, N'à¤­à¤¾à¤œà¥€ à¤«à¤³ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1125, N'à¤­à¤¾à¤œà¥€ à¤µ à¤•à¤¿à¤°à¤¾à¤£à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1126, N'à¤­à¤¾à¤œà¥€ à¤µ à¤«à¤³à¤¾à¤‚à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1127, N'à¤­à¤¾à¤œà¥€ à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1128, N'à¤­à¤¾à¤œà¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1129, N'à¤­à¤¾à¤œà¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1130, N'à¤­à¤¾à¤œà¥€à¤ªà¤¾à¤²à¤¾ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1131, N'à¤­à¤¾à¤œà¥€à¤ªà¤¾à¤²à¤¾ à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1132, N'à¤­à¤¾à¤œà¥€à¤ªà¤¾à¤²à¤¾ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1133, N'à¤­à¤¾à¤œà¥€à¤ªà¤¾à¤²à¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1134, N'à¤­à¤¾à¤‚à¤¡à¥‡ à¤µà¥à¤¯à¤¾à¤ªà¤¾à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1135, N'à¤­à¤¾à¤‚à¤¡à¥à¤¯à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1136, N'à¤­à¤¾à¤‚à¤¡à¥à¤¯à¤¾à¤‚à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1137, N'à¤­à¤¾à¤‚à¤¡à¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1138, N'à¤«à¥…à¤¬à¥à¤°à¤¿à¤•à¥‡à¤¶à¤¨ à¤…à¤à¤¡ à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤µà¤°à¥à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1139, N'à¤«à¥‡à¤¬à¥à¤°à¤¿à¤•à¤¶à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1140, N'à¤«à¥‡à¤¬à¥à¤°à¤¿à¤•à¥‡à¤¶à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1141, N'à¤¬à¤¿à¤à¤¨à¥‡à¤¸ à¤¸à¥‹à¤²à¥à¤¯à¥à¤¶à¤¨ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1143, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€,à¤—à¥‹à¤¡à¤¾à¤‰à¤¨,à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1144, N'à¤¬à¤à¤• à¤µ à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1145, N'à¤¬à¤à¤• à¤µ à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾, à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1146, N'à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤µ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1147, N'à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1148, N'à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1149, N'à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯/à¤Ÿà¥‰à¤•à¥€à¤œ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1150, N'à¤µà¤¸à¤¤à¤¿à¤—à¥ƒà¤¹', N'S', NULL, NULL, NULL, N'', 0),
  (1152, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1153, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1154, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1155, N'à¤•à¤¾à¤°à¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1156, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤µ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1157, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤µ à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1158, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯,à¤¦à¥à¤•à¤¾à¤¨,à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1159, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1160, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥‚à¤—à¥à¤£à¤¾à¤²à¤¯ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1161, N'à¤–à¤¾à¤œà¤—à¥€ à¤¶à¤¾à¤³à¤¾ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1162, N'à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1163, N'à¤¦à¥à¤•à¤¾à¤¨,à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾,à¤¨à¤¿à¤µà¤¾à¤¸à¥€,à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1164, N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1165, N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1166, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1167, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1168, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1169, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1170, N'à¤­à¤¾à¤‚à¤—à¤¾à¤°à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1171, N'à¤­à¤¾à¤œà¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1172, N'à¤­à¤¾à¤œà¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1173, N'à¤­à¤¾à¤œà¥€ à¤ªà¤¾à¤²à¤¾ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1174, N'à¤¹à¥‰à¤¸à¥à¤ªà¤¿à¤Ÿà¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1175, N'à¤¹à¥‹à¤® à¤…à¤ªà¤²à¤¾à¤à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1176, N'à¤¹à¥‹à¤® à¤‡à¤‚à¤Ÿà¥‡à¤°à¤¿à¤¯à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1177, N'à¤¹à¥‹à¤® à¤•à¥à¤²à¤¿à¤¨à¤¿à¤‚à¤— à¤¸à¤¾à¤®à¤—à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1178, N'à¤¹à¥‹à¤®à¤¿à¤“à¤ªà¥…à¤¥à¥€à¤• à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1179, N'à¥‰à¤¸à¥à¤ªà¤¿à¤Ÿà¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1180, N'à¤¸à¥€ à¤¸à¥€ à¤Ÿà¥€ à¤µà¥€ à¤•à¥…à¤®à¥‡à¤°à¤¾ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1181, N'à¤¸à¥€ à¤¸à¥€ à¤Ÿà¥€à¤µà¥à¤¹à¥€ à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1182, N'à¤¸à¥€.à¤¸à¥€.à¤Ÿà¥€à¤µà¥à¤¹à¥€ ', N'S', NULL, NULL, NULL, N'', 0),
  (1183, N'à¤¸à¥€à¤ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1184, N'à¤¸à¥‰à¤«à¥à¤Ÿ à¤Ÿà¥‡à¤•à¥à¤¨à¥‰à¤²à¤œà¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1185, N'à¤¸à¥‰à¤«à¥à¤Ÿà¤µà¥‡à¤…à¤° à¤•à¤‚à¤ªà¤¨à¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1186, N'à¤¸à¥‹à¤«à¤¾ à¤®à¥‡à¤•à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1187, N'à¤¸à¥‹à¤«à¤¾ à¤®à¥‡à¤•à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1188, N'à¤¸à¥‹à¤«à¤¾ à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1189, N'à¤¸à¥‹à¤«à¤¾ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1190, N'à¤¸à¥‹à¤«à¤¾ à¤¶à¤¿à¤µà¤£à¥‡', N'S', NULL, NULL, NULL, N'', 0),
  (1191, N'à¤¹à¥‡à¤…à¤° à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1192, N'à¤¹à¥‡à¤¯à¤° à¤•à¤Ÿà¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1193, N'à¤¹à¥‡à¤¯à¤° à¤•à¤Ÿà¤¿à¤‚à¤— à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1194, N'à¤¹à¥‡à¤¯à¤° à¤¸à¤²à¥à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1195, N'à¤¹à¥‡à¤¯à¤° à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1196, N'à¤¹à¤°à¥à¤¬à¤² à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1197, N'à¤¹à¥‡à¤²à¥à¤¥ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1198, N'à¤¹à¥‡à¤²à¥à¤¥ à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1199, N'à¤¹à¥‡à¤²à¥à¤¥à¤•à¥‡à¤…à¤°  à¤•à¤‚à¤ªà¤¨à¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1200, N'à¤¹à¤¾à¤‡à¤¡à¥à¤°à¥‹à¤²à¤¿à¤•à¥à¤¸ à¤ªà¤¾à¤ˆà¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1201, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1202, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤…à¤à¤¡ à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‰à¤¨à¤¿à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1203, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤†à¤£à¤¿ à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤²  à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1204, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤†à¤£à¤¿ à¤ˆà¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1205, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1206, N'à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤¯à¤° / à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1207, N'à¤¹à¤¾à¤°à¥à¤¦à¤¿à¤• à¤ªà¥à¤²à¥à¤¯à¤¾à¤¯à¤µà¥‚à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (1210, N'à¤¦à¥‡à¤¶à¥€ à¤¦à¤¾à¤°à¥‚ à¤µ à¤¬à¤¿à¤¯à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1215, N'à¤œà¥‡à¤¨à¥‡à¤°à¥€à¤• à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1217, N'à¤Ÿà¥à¤¯à¤¾à¤Ÿà¥ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1219, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤…à¤à¤¨à¥à¤¡ à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1221, N'à¤¸à¥‹à¤¨à¥‡, à¤šà¤¾à¤‚à¤¦à¥€à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨à¤‚', N'S', NULL, NULL, NULL, N'', 0),
  (1222, N'à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1223, N'à¤•à¥‹à¤Ÿà¥€à¤‚à¤— à¤‘à¤« à¤®à¥‡à¤Ÿà¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1224, N'à¤®à¤¿à¤¨à¥€ à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1225, N'à¤®à¤¿à¤²à¥à¤• à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1226, N'à¤•à¤¾à¤° à¤¸à¥‡à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1227, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‰à¤¨à¤¿à¤•à¥à¤¸ à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1228, N'à¤. à¤Ÿà¥€. à¤à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1230, N'à¤Ÿà¥€.à¤µà¥€.à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1231, N'à¤Ÿà¥€à¤µà¥à¤¹à¥€ à¤°à¥‡à¤ªà¥‡à¤°à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1232, N'à¤¡à¥‡à¤…à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1233, N'à¤¡à¥‡à¤…à¤°à¥€ à¤ªà¥à¤°à¥‹à¤¡à¤•à¥à¤Ÿà¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1234, N'à¤¡à¥‡à¤…à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1235, N'à¤¡à¥‡à¤‚à¤Ÿà¤² à¤•à¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1236, N'à¤¡à¥‡à¤‚à¤Ÿà¤² à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1237, N'à¤¡à¥‡à¤¨à¥à¤Ÿà¤² à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1238, N'à¤¡à¥‡à¤¨à¥à¤Ÿà¤² à¤•à¥à¤²à¤¿à¤¨à¤¿à¤• à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1239, N'à¤¡à¥‡à¤¯à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1240, N'à¤¡à¥à¤°à¤¾à¤¯à¤•à¥à¤²à¤¿à¤¨à¤°à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1241, N'à¤¡à¥à¤°à¤¾à¤¯à¤•à¥à¤²à¥€à¤¨à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1242, N'à¤¡à¥à¤°à¤¾à¤¯à¤«à¥‚à¤¡à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1243, N'à¤¡à¥à¤°à¤¾à¤¯à¤«à¥à¤°à¥à¤Ÿà¤¸ à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1244, N'à¤¡à¥‡à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1245, N'à¤¡à¥‡à¤² à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¶à¥‹à¤°à¥‚à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1246, N'à¤¡à¥‡à¤²à¤¿à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1247, N'à¤¡à¥‡à¤²à¥€ à¤¨à¥€à¤¡à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1248, N'à¤¡à¥‡à¤²à¥€ à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1249, N'à¤¡à¥‡à¤µà¤²à¤ªà¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1250, N'à¤¡à¥‡à¤µà¥à¤¹à¤²à¤ªà¤°à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1251, N'à¤¡à¤¾à¤¯à¤—à¥à¤¨à¥‹à¤¸à¥à¤Ÿà¤¿à¤• à¤²à¥…à¤¬', N'S', NULL, NULL, NULL, N'', 0),
  (1252, N'à¤¡à¤¾à¤¯à¤—à¥à¤¨à¥‹à¤¸à¥à¤Ÿà¤¿à¤• à¤²à¥…à¤¬à¥‹à¤°à¥‡à¤Ÿà¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1253, N'à¤¡à¤¾à¤¯à¤—à¥à¤¨à¥‹à¤¸à¥à¤Ÿà¥€à¤• à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1254, N'à¤¡à¤¾à¤¯à¤ªà¤° à¤¬à¤¿à¤œà¤¨à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1255, N'à¤¡à¤¾à¤¯à¤²à¥‡à¤¸à¤¿à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1256, N'à¤¡à¤¿à¤à¤¾à¤‡à¤¨ à¤•à¤¿à¤šà¤¨ à¤«à¤°à¥à¤¨à¤¿à¤šà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1257, N'à¤¡à¤¿à¤²à¥‡à¤µà¥à¤¹à¤°à¥€ à¤•à¤¿à¤šà¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1258, N'à¤¡à¤¿à¤²à¤¿à¤µà¥à¤¹à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1259, N'à¤¡à¤¿à¤²à¥€à¤µà¤°à¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1260, N'à¤¡à¤¿à¤¸à¥à¤Ÿà¥à¤°à¤¿à¤¬à¤¯à¥‚à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1261, N'à¤¡à¤¿à¤¸à¥à¤Ÿà¥à¤°à¤¿à¤¬à¥à¤¯à¥à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1262, N'à¤¡à¤¿à¤¸à¥à¤Ÿà¥à¤°à¤¿à¤¬à¥à¤¯à¥‚à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1263, N'à¤¡à¥€.à¤à¤®.à¤†à¤¯.à¤Ÿà¥€.à¤Ÿà¥‡à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1264, N'à¤¡à¥‹à¤³à¥à¤¯à¤¾à¤‚à¤šà¥‡ à¤•à¥à¤²à¤¿à¤¨à¤¿à¤• ', N'S', NULL, NULL, NULL, N'', 0),
  (1265, N'à¤¡à¥‹à¤³à¥à¤¯à¤¾à¤‚à¤šà¤¾ à¤¦à¤µà¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1266, N'à¤¤à¥‡à¤² à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1267, N'à¤¥à¤°à¥à¤¡ à¤ªà¤¾à¤°à¥à¤Ÿà¥€ à¤‡à¤¨à¥à¤¸à¤ªà¥‡à¤•à¥à¤¶à¤¨ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1268, N'à¤¥à¥‡à¤°à¤¿à¤ªà¥€ à¤¸à¥‡à¤‚à¤Ÿà¤° (à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯)', N'S', NULL, NULL, NULL, N'', 0),
  (1269, N'à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤¡à¥‡à¤…à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1270, N'à¤¦à¥‚à¤§ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1271, N'à¤¦à¥à¤§ à¤¡à¥‡à¤…à¤°à¥€ ', N'S', NULL, NULL, NULL, N'', 0),
  (1272, N'à¤¦à¥‚à¤§ à¤¡à¥‡à¤…à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1273, N'à¤¦à¥‚à¤§ à¤¡à¥‡à¤…à¤°à¥€ à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1274, N'à¤¦à¤µà¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1275, N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1276, N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ à¤µ à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1277, N'à¤¦à¥‡à¤¶à¥€ à¤¬à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1278, N'à¤¦à¤¾à¤¤à¤¾à¤‚à¤šà¤¾ à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1279, N'à¤¨à¥‡à¤Ÿà¤µà¤°à¥à¤• ', N'S', NULL, NULL, NULL, N'', 0),
  (1280, N'à¤¨à¥‡à¤Ÿà¤µà¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤à¤¡ à¤¸à¥€.à¤¸à¥€.à¤Ÿà¥€à¤µà¥à¤¹à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1281, N'à¤¨à¥à¤¯à¥‚à¤Ÿà¥à¤°à¥€à¤¶à¤¨ à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1282, N'à¤¨à¤°à¥à¤¸à¤°à¥€ à¤¸à¥à¤•à¥‚à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1284, N'à¤¨à¥‹à¤µà¥à¤¹à¥‡à¤²à¥à¤Ÿà¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (1285, N'à¤¨à¥‹à¤µà¥à¤¹à¥‡à¤²à¤Ÿà¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1286, N'à¤ªà¥…à¤•à¤¿à¤‚à¤— à¤®à¤Ÿà¥‡à¤°à¤¿à¤¯à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1287, N'à¤ªà¤‚à¤šà¤° à¤…à¤à¤¡ à¤Ÿà¤¾à¤¯à¤° à¤¸à¤°à¥à¤µà¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1288, N'à¤ªà¤‚à¤šà¤° à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1289, N'à¤ªà¥‚à¤œà¤¾ à¤­à¤‚à¤¡à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1290, N'à¤ªà¥à¤œà¤¾ à¤­à¤¾à¤‚à¤¡à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1291, N'à¤ªà¥‚à¤œà¤¾ à¤¸à¤¾à¤®à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1292, N'à¤ªà¥‚à¤œà¤¾ à¤¸à¤¾à¤¹à¤¿à¤¤à¥à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1293, N'à¤ªà¥‡à¤Ÿ à¤…à¥…à¤¨à¤¿à¤®à¤² à¤«à¥‚à¤¡à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1294, N'à¤ªà¥‡à¤‚à¤Ÿ à¤•à¤²à¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1295, N'à¤ªà¥‡à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1296, N'à¤ªà¥‡à¤‚à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1297, N'à¤ªà¥‡à¤Ÿ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1298, N'à¤ªà¥‡à¤Ÿà¥à¤°à¥‹à¤² à¤ªà¤‚à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1299, N'à¤ªà¥‡à¤‚à¤Ÿà¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1300, N'à¤ªà¥‡à¤Ÿà¥à¤¸ à¤«à¥‚à¤¡à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1301, N'à¤ªà¤¤à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1302, N'à¤ªà¤¤à¤¸à¤‚à¤¸à¥à¤¥à¤¾ / à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯ / à¤—à¥à¤°à¤‚à¤¥à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1303, N'à¤ªà¥…à¤¥à¤²à¥…à¤¬à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1304, N'à¤ªà¥…à¤¥à¥‰à¤²à¥‰à¤œà¤¿ à¤²à¥…à¤¬ ', N'S', NULL, NULL, NULL, N'', 0),
  (1305, N'à¤ªà¥…à¤¥à¥‰à¤²à¥‰à¤œà¥€ à¤²à¥…à¤¬à¥‹à¤°à¥‡à¤Ÿà¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1307, N'à¤ªà¥…à¤¥à¥‹à¤²à¥‰à¤œà¥€ à¤²à¥‡à¤¬à¥‹à¤°à¤Ÿà¥‹à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1308, N'à¤ªà¤¥à¥‹à¤²à¥‹à¤œà¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (1309, N'à¤ªà¥‡à¤ªà¤° à¤ªà¥à¤²à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1310, N'à¤ªà¥‡à¤ªà¤° à¤®à¤¾à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1311, N'à¤ªà¥‡à¤ªà¤° à¤°à¤¦à¥à¤¦à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1312, N'à¤ªà¥‡à¤ªà¤° à¤°à¤¿à¤¸à¤¾à¤¯à¤•à¤² à¤…à¤à¤¨à¥à¤¡ à¤•à¤²à¥‡à¤•à¥à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1313, N'à¤ªà¥‡à¤ªà¤° à¤µ à¤­à¤‚à¤—à¤¾à¤° à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1314, N'à¤ªà¤°à¤¡à¤¾ à¤¬à¤¨à¤µà¤¿à¤£à¥‡ ', N'S', NULL, NULL, NULL, N'', 0),
  (1315, N'à¤ªà¥‚à¤°à¥à¤µ à¤ªà¥à¤°à¤¾à¤¥à¤®à¤¿à¤• à¤¶à¤¾à¤³à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1316, N'à¤ªà¥à¤°à¥‡à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1317, N'à¤ªà¥à¤°à¤¿à¤‚à¤Ÿà¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1318, N'à¤ªà¥à¤°à¤¿à¤‚à¤Ÿà¤¿à¤‚à¤— à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1319, N'à¤ªà¥à¤°à¤¿à¤‚à¤Ÿà¤¿à¤— à¤ªà¥à¤°à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1320, N'à¤ªà¥à¤°à¤¿à¤‚à¤Ÿà¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1321, N'à¤ªà¥à¤°à¥€ à¤ªà¥à¤°à¤¾à¤¯à¤®à¤°à¥€ à¤¸à¥à¤•à¥‚à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1322, N'à¤ªà¥à¤°à¥€ à¤¸à¥à¤•à¥‚à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1323, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¤¿ à¤•à¤¨à¥à¤¸à¤²à¥à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1324, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¤¿ à¤¸à¥‡à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1325, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€ à¤à¤œà¥‡à¤£à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1326, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1327, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€ à¤•à¤¨à¥à¤¸à¤²à¤Ÿà¤‚à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1328, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€ à¤¡à¥€à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1329, N'à¤ªà¥à¤°à¥‰à¤ªà¤°à¥à¤Ÿà¥€à¤œ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1330, N'à¤ªà¥à¤°à¥‹à¤Ÿà¥€à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1331, N'à¤—à¤£à¤ªà¤¤à¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1332, N'à¤—à¥‡à¤® à¤à¥‹à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1333, N'à¤—à¥‡à¤®à¤¿à¤‚à¤— à¤•à¥…à¤«à¥‡', N'S', NULL, NULL, NULL, N'', 0),
  (1334, N'à¤—à¥‡à¤®à¤¿à¤‚à¤— à¤à¥‹à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1335, N'à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1336, N'à¤—à¥à¤°à¤¾à¤«à¤¿à¤• à¤…à¤à¤¡ à¤ªà¥à¤°à¤¿à¤‚à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1337, N'à¤—à¥à¤°à¤¾à¤«à¤¿à¤•à¥à¤¸ à¤…à¤à¤¡ à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1338, N'à¤—à¥à¤°à¤¾à¤«à¤¿à¤•à¥à¤¸à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1339, N'à¤—à¥à¤°à¤¾à¤«à¤¿à¤•à¥à¤¸à¥à¤¸ à¤µà¤°à¥à¤• à¤¶à¥‰à¤ª à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1340, N'à¤—à¥…à¤²à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1341, N'à¤—à¥à¤²à¤¾à¤¸ à¤…à¤à¤¡ à¤…à¤²à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤¹à¤¾à¤Šà¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1342, N'à¤—à¥à¤²à¤¾à¤¸ à¤…à¤à¤¡ à¤…à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1343, N'à¤—à¥à¤²à¤¾à¤¸ à¤…à¤à¤¡ à¤…à¤²à¥à¤¯à¥à¤®à¥€à¤¨à¤¿à¤¯à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1344, N'à¤—à¥à¤²à¤¾à¤¸ à¤…à¤à¤¨à¥à¤¡ à¤…à¥…à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1345, N'à¤—à¥à¤²à¤¾à¤¸ à¤µà¥à¤¯à¤¾à¤ªà¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1346, N'à¤—à¥à¤²à¤¾à¤¸ à¤µà¤°à¥à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1347, N'à¤—à¥à¤²à¤¾à¤¸ à¤µà¤°à¥à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1348, N'à¤—à¥à¤²à¤¾à¤¸ à¤µà¤°à¥à¤•à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1349, N'à¤—à¥à¤²à¤¾à¤¸ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1350, N'à¤—à¥à¤²à¤¾à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1351, N'à¤—à¥à¤²à¤¾à¤¸ à¤¹à¤¾à¤Šà¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1352, N'à¤—à¥à¤²à¥‹à¤¸à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1353, N'à¤—à¤µà¥à¤¹à¤°à¤®à¥‡à¤‚à¤Ÿ à¤ªà¥à¤°à¥‹à¤œà¥‡à¤•à¥à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1354, N'à¤—à¥…à¤¸ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1355, N'à¤—à¥…à¤¸ à¤¬à¥‚à¤•à¥€à¤‚à¤— à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1356, N'à¤—à¥…à¤¸ à¤¸à¥à¤Ÿà¥‹à¤µà¥à¤¹, à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤²à¥à¤¸ à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1357, N'à¤—à¤¾à¤¡à¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1358, N'à¤—à¤¾à¤¦à¥€ à¤…à¤à¤¡ à¤•à¥à¤¶à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1359, N'à¤—à¤¾à¤¦à¥€ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1360, N'à¤—à¤¾à¤¦à¥€ à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1361, N'à¤—à¤¾à¤¦à¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1362, N'à¤—à¤¾à¤¦à¥€ à¤¸à¥‡à¤‚à¤¨à¥à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1363, N'à¤—à¤¾à¤°à¤®à¥‡à¤‚à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1364, N'à¤—à¤¿à¤«à¥à¤Ÿ à¤…à¤à¤¡ à¤¸à¥‡à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1365, N'à¤—à¤¿à¤«à¥à¤Ÿ à¤†à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1366, N'à¤—à¤¿à¤«à¥à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1367, N'à¤—à¤¿à¤«à¥à¤Ÿ à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1368, N'à¤—à¤¿à¤°à¤£à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1369, N'à¤—à¥‰à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1370, N'à¤—à¥‹à¤•à¥à¤² à¤¡à¥‡à¤…à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1371, N'à¤—à¥‹à¤¡ à¤ªà¥à¤°à¤•à¤¾à¤° à¤¬à¤¨à¤µà¤¤à¤¾à¤¤', N'S', NULL, NULL, NULL, N'', 0),
  (1372, N'à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1373, N'à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ (à¤®à¤‚à¤¡à¤ª à¤¡à¥‡à¤•à¥‹à¤°à¥‡à¤Ÿà¤°)', N'S', NULL, NULL, NULL, N'', 0),
  (1374, N'à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ à¤ªà¥à¤²à¤‚à¤¬à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0),
  (1376, N'à¤—à¥‹à¤²à¥à¤¡ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1377, N'à¤—à¥‹à¤³à¥à¤¯à¤¾ à¤”à¤·à¤§à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1378, N'à¤—à¥‹à¤³à¥à¤¯à¤¾ à¤µ à¤”à¤·à¤§à¥€ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1379, N'à¤—à¥‹à¤³à¥à¤¯à¤¾à¤‚à¤šà¥‡ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1380, N'à¤—à¥Œ. à¤µà¤¿à¤œà¥à¤žà¤¾à¤¨ à¤•à¥‡à¤‚à¤¦à¥à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1381, N'à¤˜à¤¡à¥à¤¯à¤¾à¤³ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1382, N'à¤˜à¤° à¤µà¤¿à¤•à¥à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (1383, N'à¤˜à¤° à¤µà¤¿à¤•à¥à¤°à¥€/à¤¬à¤¿à¤²à¥à¤¡à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1384, N'à¤šà¤ªà¥à¤ªà¤² à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1385, N'à¤šà¤ªà¥à¤ªà¤² à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1386, N'à¤šà¤ªà¥à¤ªà¤²à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1387, N'à¤šà¤¶à¥à¤®à¤¾ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1388, N'à¤šà¤·à¥à¤®à¥à¤¯à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1389, N'à¤šà¤·à¥à¤®à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1390, N'à¤œà¥à¤µà¥‡à¤²à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1391, N'à¤œà¥à¤µà¥‡à¤²à¤°à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1392, N'à¤œà¥à¤µà¥‡à¤²à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1393, N'à¤œà¤¿à¤“ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1395, N'à¤œà¥€à¤®', N'S', NULL, NULL, NULL, N'', 0),
  (1396, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1397, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤…à¤à¤¡ à¤˜à¤°à¤—à¥à¤¤à¥€ à¤¸à¤¾à¤®à¤¾à¤¨ à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1398, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤…à¤à¤¡ à¤Ÿà¤¾à¤¯à¤ªà¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1399, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤…à¤à¤¡ à¤°à¥€à¤¯à¤² à¤‡à¤¸à¥à¤Ÿà¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1400, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1401, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤µ à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1402, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1403, N'à¤à¥‡à¤°à¥‰à¤•à¥à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1404, N'à¤Ÿà¥‚ à¤µà¥à¤¹à¥€à¤²à¤° à¤‘à¤Ÿà¥‹ à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0),
  (1405, N'à¤Ÿà¥ à¤µà¥à¤¹à¥€à¤²à¤° à¤—à¥…à¤°à¥‡à¤œ ', N'S', NULL, NULL, NULL, N'', 0),
  (1406, N'à¤Ÿà¥‡à¤•à¤¨à¥‹à¤²à¥‹à¤œà¥€ ', N'S', NULL, NULL, NULL, N'', 0),
  (1407, N'à¤Ÿà¥…à¤•à¥à¤¸ à¤•à¤¨à¥à¤¸à¤²à¥à¤Ÿà¤‚à¤Ÿà¤‚', N'S', NULL, NULL, NULL, N'', 0),
  (1408, N'à¤Ÿà¥…à¤•à¥à¤¸ à¤•à¤¨à¥à¤¸à¤²à¥à¤Ÿà¤‚à¤Ÿ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1409, N'à¤Ÿà¥…à¤•à¥à¤¸ à¤•à¤¨à¥à¤¸à¤²à¤Ÿà¤¨à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1410, N'à¤Ÿà¥…à¤•à¥à¤¸ à¤¸à¥‡à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1411, N'à¤Ÿà¥…à¤Ÿà¥‚ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1412, N'à¤Ÿà¥à¤¯à¥à¤¶à¤¨ à¤•à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1413, N'à¤Ÿà¥à¤¯à¥‚à¤¶à¤¨ à¤•à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1414, N'à¤Ÿà¥à¤¯à¥à¤¶à¤¨ à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1415, N'à¤Ÿà¥à¤°à¥‡à¤¡à¤¿à¤‚à¤— à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1416, N'à¤Ÿà¥à¤°à¥‡à¤¡à¤¿à¤— à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1417, N'à¤Ÿà¥à¤°à¥‡à¤¨à¥à¤¡ à¤²à¤¿à¤®à¤¿à¤Ÿà¥‡à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (1418, N'à¤Ÿà¥‚à¤°à¥à¤¸ à¤…à¤à¤¡ à¤Ÿà¥à¤°à¥…à¤µà¥à¤¹à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1419, N'à¤Ÿà¥à¤°à¥à¤¸ à¤…à¤à¤¨à¥à¤¡ à¤Ÿà¥à¤°à¥…à¤µà¥à¤¹à¤²à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1420, N'à¤Ÿà¥à¤°à¥à¤¸ à¤†à¤£à¤¿ à¤Ÿà¥à¤°à¥…à¤µà¤²à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1421, N'à¤Ÿà¥à¤°à¤¾à¤¨à¥à¤¸à¤ªà¥‹à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1422, N'à¤Ÿà¥à¤°à¤¾à¤¨à¥à¤¸à¤ªà¥‹à¤°à¥à¤Ÿ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1423, N'à¤Ÿà¥à¤°à¤¾à¤¨à¥à¤¸à¤ªà¥‹à¤°à¥à¤Ÿ à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯', N'S', NULL, NULL, NULL, N'', 0),
  (1424, N'à¤Ÿà¥à¤°à¤¾à¤µà¤²à¤¿à¤‚à¤—  à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1425, N'à¤Ÿà¥à¤°à¤¾à¤‚à¤¸à¤ªà¥‹à¤°à¥à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0),
  (1426, N'à¤Ÿà¥‡à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1427, N'à¤Ÿà¥‡à¤²à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1428, N'à¤Ÿà¥‡à¤²à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1429, N'à¤Ÿà¥‡à¤²à¤°à¥à¤¸ à¤µà¤°à¥à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1430, N'à¤Ÿà¥‡à¤²à¤°à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1431, N'à¤Ÿà¥‡à¤²à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1432, N'à¤Ÿà¥‡à¤²à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1433, N'à¤Ÿà¥‚à¤µà¥à¤¹à¥€à¤²à¤° à¤¸à¤°à¥à¤µà¤¿à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1434, N'à¤Ÿà¥à¤¶à¤¨ à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1435, N'à¤Ÿà¥‡à¤¸à¥à¤Ÿ à¤Ÿà¥à¤¯à¥‚à¤¬ à¤¬à¥‡à¤¬à¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1436, N'à¤Ÿà¤¾à¤ˆà¤²à¥à¤¸ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1437, N'à¤Ÿà¤¾à¤¯à¤•à¤¾à¤‚à¤¡à¥‹ à¤à¤œà¥à¤•à¥‡à¤¶à¤¨ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1438, N'à¤Ÿà¤¾à¤¯à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1439, N'à¤Ÿà¤¾à¤¯à¤° à¤¶à¥‰à¤ª à¤†à¤£à¤¿ à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1440, N'à¤Ÿà¤¾à¤¯à¤° à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1441, N'à¤Ÿà¤¾à¤¯à¤°à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1442, N'à¤šà¤¿à¤•à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1443, N'à¤šà¤¿à¤•à¤¨ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1444, N'à¤šà¤¿à¤²à¥à¤¡à¥à¤°à¤¨ à¤•à¥à¤²à¥€à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1445, N'à¤œà¥‡à¤‚à¤Ÿà¥à¤¸ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1446, N'à¤œà¥‡à¤‚à¤Ÿà¥à¤¸ à¤¸à¤²à¥à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1447, N'à¤œà¥‡à¤‚à¤Ÿà¥à¤¸ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1448, N'à¤œà¥à¤¨à¥‡ à¤•à¤¾à¤—à¤¦ à¤µ à¤­à¤‚à¤¡à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1449, N'à¤œà¥‡à¤¨à¥à¤Ÿà¤¸ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1450, N'à¤œà¤¨à¤°à¤² à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1451, N'à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤° à¤…à¤à¤¡ à¤šà¤¿à¤•à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1452, N'à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1453, N'à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸ à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1454, N'à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1455, N'à¤œà¥à¤¯à¥‚à¤¸ à¤…à¤à¤¡ à¤­à¤¾à¤œà¥€ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1456, N'à¤ªà¥à¤²à¤¾à¤‡à¤µà¥‚à¤¡ à¤®à¤Ÿà¥‡à¤°à¤¿à¤¯à¤² à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1457, N'à¤ªà¥à¤²à¤¾à¤¯à¥‚à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (1458, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡', N'S', NULL, NULL, NULL, N'', 0),
  (1459, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤…à¤à¤¡ à¤‡à¤‚à¤Ÿà¥‡à¤°à¥€à¤¯à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1460, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1461, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1462, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤†à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1463, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1464, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1465, N'à¤ªà¥à¤²à¤¾à¤¯à¤µà¥‚à¤¡ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1466, N'à¤ªà¤¶à¥ à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ ', N'S', NULL, NULL, NULL, N'', 0),
  (1467, N'à¤ªà¤¶à¥ à¤¸à¤¾à¤®à¤—à¥à¤°à¥€ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1468, N'à¤ªà¥ˆà¤¸à¥‡ à¤ªà¤¾à¤ à¤µà¤£à¥‡', N'S', NULL, NULL, NULL, N'', 0),
  (1469, N'à¤ªà¥‡à¤¸à¥à¤Ÿ à¤•à¤‚à¤Ÿà¥à¤°à¥‹à¤² ', N'S', NULL, NULL, NULL, N'', 0),
  (1470, N'à¤ªà¥‡à¤¸à¥à¤Ÿ à¤•à¤‚à¤Ÿà¥à¤°à¥‹à¤² à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1471, N'à¤ªà¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1472, N'à¤ªà¤¾à¤ˆà¤ª à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1473, N'à¤ªà¤¾à¤£à¥à¤¯à¤¾à¤šà¥‡ à¤ªà¥à¤²à¤¾à¤¨à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0),
  (1474, N'à¤ªà¤¾à¤¨ , à¤Ÿà¥à¤°à¥…à¤µà¥à¤¹à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1476, N'à¤ªà¤¾à¤ªà¤¡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1477, N'à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1478, N'à¤ªà¤¾à¤³à¤£à¤¾à¤˜à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1479, N'à¤ªà¤¾à¤µà¤° à¤²à¥‰à¤¨à¥à¤¡à¥à¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1480, N'à¤¬à¥à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1481, N'à¤¬à¥‚à¤•à¤¿à¤‚à¤— à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1482, N'à¤¬à¥…à¤— à¤•à¤²à¥‡à¤•à¥à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1483, N'à¤¬à¥…à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1484, N'à¤¬à¥…à¤— à¤¹à¤¾à¤Šà¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1485, N'à¤¬à¥…à¤—à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1486, N'à¤¬à¥…à¤Ÿà¤°à¥€ à¤¡à¥€à¤²à¤° à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0),
  (1487, N'à¤¬à¥…à¤Ÿà¤°à¥€ à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1488, N'à¤¬à¥…à¤Ÿà¤°à¥€ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0),
  (1489, N'à¤¬à¥…à¤Ÿà¤°à¥€ à¤¹à¤¾à¤Šà¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1490, N'à¤¬à¥à¤Ÿà¥€à¤• à¤Ÿà¥‡à¤²à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0),
  (1491, N'à¤¬à¥à¤Ÿà¥€à¤• à¤Ÿà¥‡à¤²à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1492, N'à¤¬à¥à¤Ÿà¥€à¤• à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1493, N'à¤¬à¥à¤Ÿà¥€à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1494, N'à¤¬à¥…à¤‚à¤¨à¥à¤¡ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0),
  (1495, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿ à¤ªà¥à¤°à¥‹à¤¡à¤•à¥à¤Ÿà¤¸ à¤…à¤à¤¡ à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¤¿', N'S', NULL, NULL, NULL, N'', 0),
  (1496, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1497, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿ à¤¸à¤²à¥à¤¨ ', N'S', NULL, NULL, NULL, N'', 0),
  (1498, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1499, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1500, N'à¤¬à¥à¤¯à¥à¤Ÿà¤¿à¤¶à¤°à¥à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1501, N'à¤¬à¥à¤¯à¥à¤Ÿà¥€ à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1502, N'à¤¬à¥à¤¯à¥à¤Ÿà¥€ à¤¸à¤²à¥‚à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1503, N'à¤¬à¥à¤¯à¥à¤Ÿà¥€à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1504, N'à¤«à¤¿à¤Ÿà¤¨à¥‡à¤¸ à¤¡à¤¾à¤‚à¤¸ à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“ ', N'S', NULL, NULL, NULL, N'', 0),
  (1505, N'à¤«à¤¿à¤¶ à¤…à¤à¤¡ à¤ªà¥‡à¤Ÿà¥à¤¸ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1506, N'à¤«à¤¿à¤¶ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1507, N'à¤«à¤¿à¤¶ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0),
  (1508, N'à¤«à¥‰à¤¸à¥€à¤²à¥‡à¤•à¥à¤¸ à¤‘à¤‡à¤²', N'S', NULL, NULL, NULL, N'', 0),
  (1509, N'à¤«à¥‹à¤Ÿà¥‹ à¤«à¥à¤°à¥‡à¤® ', N'S', NULL, NULL, NULL, N'', 0),
  (1510, N'à¤«à¥‹à¤Ÿà¥‹ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0),
  (1511, N'à¤«à¥‹à¤Ÿà¥‹ à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“', N'S', NULL, NULL, NULL, N'', 0),
  (1512, N'à¤«à¥‹à¤Ÿà¥‹à¤—à¥à¤°à¤¾à¤«à¥€ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯  ', N'S', NULL, NULL, NULL, N'', 0),
  (1513, N'à¤¬à¤à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1514, N'à¤¬à¥…à¤‚à¤•', N'S', NULL, NULL, NULL, N'', 0),
  (1515, N'à¤¬à¥…à¤‚à¤• (à¤«à¤¾à¤¯à¤¨à¤‚à¤¸)', N'S', NULL, NULL, NULL, N'', 0),
  (1516, N'à¤¬à¤à¤• à¤‘à¤« à¤‡à¤‚à¤¡à¤¿à¤¯à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1517, N'à¤¬à¤à¤• à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'S', NULL, NULL, NULL, N'', 0),
  (1518, N'à¤¬à¥‚à¤• à¤¸à¥à¤Ÿà¥‹à¤…à¤° à¤…à¤à¤¡ à¤¶à¥à¤Ÿà¥‡à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0),
  (1519, N'à¤¬à¥‚à¤• à¤¸à¥à¤Ÿà¥‹à¤…à¤° à¤…à¤à¤¡ à¤¶à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0),
  (1520, N'à¤¬à¥à¤• à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0),
  (1521, N'à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤µ à¤¸à¤‚à¤¸à¥à¤¥à¤¾ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ ', N'S', NULL, NULL, NULL, N'', 0)
   ) v(Id, [Description], TypeOfUseCode, CreatedBy, UpdatedBy, UpdatedDate, SearchKey, SearchSequence)
)
INSERT PTIS.SubTypeOfUseMaster
(Id, [Description], TypeOfUseId, CreatedBy, UpdatedBy, UpdatedDate, SearchSequence)
SELECT
    s.Id,
    s.[Description],
    t.Id,
    s.CreatedBy,
    s.UpdatedBy,
    s.UpdatedDate,
    s.SearchSequence
FROM Seed s
JOIN PTIS.TypeOfUseMaster t
  ON t.TypeOfUseCode = s.TypeOfUseCode;

SET IDENTITY_INSERT PTIS.SubTypeOfUseMaster OFF;



SET IDENTITY_INSERT PTIS.SubTypeOfUseMaster ON;

;WITH Seed(Id, [Description], TypeOfUseCode, CreatedBy, UpdatedBy, UpdatedDate, SearchKey, SearchSequence,TypeOfUseCategoryId) AS
(
    SELECT * FROM (VALUES
 (1522, N'à¤¬à¤à¤•/à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1523, N'à¤«à¥à¤Ÿ à¤µà¥‡à¤…à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1524, N'à¤«à¥‚à¤Ÿà¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1525, N'à¤«à¥‚à¤¡ à¤ªà¥…à¤•à¤¿à¤‚à¤— à¤…à¤à¤¡ à¤¹à¤¾à¤Šà¤¸ à¤•à¤¿à¤ªà¥€à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1526, N'à¤–à¤¾à¤œà¤—à¥€ à¤…à¤­à¥à¤¯à¤¾à¤¸à¤¿à¤•à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1527, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1528, N'à¤–à¤¾à¤œà¤—à¥€ à¤¶à¤¾à¤³à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1529, N'à¤ªà¤¿à¤  à¤—à¤¿à¤°à¤£à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1530, N'à¤ªà¥€ à¤“ à¤ªà¥€ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1531, N'à¤ªà¥€à¤“à¤ªà¤¿ à¤¸à¥€à¤²à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1532, N'à¤ªà¥€à¤  à¤—à¤¿à¤°à¤£', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1533, N'à¤ªà¥€à¤  à¤—à¤¿à¤°à¤£à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1534, N'à¤ªà¥‰à¤ˆà¤‚à¤Ÿ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1535, N'à¤ªà¥‹à¤°à¥à¤Ÿà¥‡à¤¬à¤² à¤•à¥‡à¤¬à¤¿à¤¨ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1536, N'à¤«à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1537, N'à¤«à¥‡à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1538, N'à¤«à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤— à¤†à¤£à¤¿  à¤®à¤Ÿà¥à¤Ÿà¥à¤°à¥‡à¤¸à¥à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1539, N'à¤«à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤— à¤µ à¤®à¥…à¤Ÿà¥à¤°à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1540, N'à¤«à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1541, N'à¤«à¤¼à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1542, N'à¤«à¥à¤°à¥à¤¨à¤¿à¤¶à¤¿à¤‚à¤— à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1543, N'à¤«à¤°à¤¸à¤£ à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1544, N'à¤«à¤°à¤¸à¤¾à¤¨ à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1545, N'à¤«à¤°à¤¸à¤¾à¤¨ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1546, N'à¤«à¤°à¤¸à¤¾à¤¨ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1547, N'à¤«à¥‚à¤² à¤µà¤¿à¤•à¥à¤°à¥‡à¤¤à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1548, N'à¤«à¥à¤²à¥‹à¤…à¤° à¤®à¤¿à¤² ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1549, N'à¤«à¤³ à¤­à¤¾à¤œà¥€ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1550, N'à¤«à¤³ à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1551, N'à¤«à¤³ à¤µ à¤­à¤¾à¤œà¥€ à¤†à¤£à¤¿ à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¥à¤Ÿà¥‹à¤…à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1552, N'à¤«à¤³ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1553, N'à¤«à¤³à¤¾à¤‚à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1554, N'à¤«à¥…à¤¶à¤¨ à¤¡à¤¿à¤œà¤¾à¤‡à¤¨à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1555, N'à¤«à¥…à¤¶à¤¨ à¤¡à¤¿à¤œà¤¾à¤¯à¤¨à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1556, N'à¤«à¥…à¤¸à¤¿à¤²à¤¿à¤Ÿà¥€ à¤®à¥…à¤¨à¥‡à¤œà¤®à¥‡à¤‚à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1557, N'à¤«à¤¾à¤ˆà¤¨à¤¾à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1558, N'à¤«à¤¾à¤ˆà¤¨à¤¾à¤¨à¥à¤¸ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1559, N'à¤«à¤¾à¤¯à¤¨à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1560, N'à¤«à¤¾à¤¯à¤¨à¤¾à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1561, N'à¤«à¤¼à¤¾à¤¯à¤¨à¤¾à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1562, N'à¤«à¤¾à¤¯à¤¨à¤¾à¤¨à¥à¤¸ à¤¸à¥‡à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1563, N'à¤«à¤¾à¤°à¥à¤®à¤¾ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1564, N'à¤«à¤¾à¤°à¥à¤®à¤¾ à¤¹à¥‹à¤²à¤¸à¥‡à¤² ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1565, N'à¤•à¥‡à¤¬à¤² à¤‡à¤‚à¤Ÿà¤°à¤ªà¥à¤°à¤¾à¤œà¥‡à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1566, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1567, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1568, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤ªà¤¾à¤°à¥à¤Ÿà¥à¤¸ à¤…à¤à¤¡ à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤°à¤¿à¤ªà¥‡à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1569, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤°à¤¿à¤ªà¥‡à¤¯à¤°à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1570, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1571, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1572, N'à¤•à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¸à¥‡à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1573, N'à¤•à¥‡à¤®à¤¿à¤•à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1574, N'à¤•à¥‡à¤®à¤¿à¤¸à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1575, N'à¤•à¥‡à¤®à¤¿à¤¸à¥à¤Ÿ à¤µ à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1576, N'à¤•à¤°à¥à¤Ÿà¤¨ à¤¬à¥‡à¤¡à¤¶à¥€à¤Ÿ à¤¸à¥‹à¤«à¤¾ à¤•à¥‹à¤š', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1577, N'à¤•à¤°à¤Ÿà¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1578, N'à¤•à¤°à¥à¤Ÿà¤¨ à¤¶à¥‰à¤ª  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1579, N'à¤•à¤°à¤Ÿà¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1580, N'à¤•à¥à¤°à¥‡à¤¨ à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿ à¤¡à¥€à¤²à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1581, N'à¤•à¥à¤°à¤¿à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1582, N'à¤•à¥‚à¤°à¤¿à¤…à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1583, N'à¤•à¥à¤°à¤¿à¤•à¥‡à¤Ÿ à¤¬à¥…à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1584, N'à¤•à¥à¤°à¥€à¤…à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1585, N'à¤•à¥à¤°à¥€à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1586, N'à¤•à¥à¤°à¥€à¤¯à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1587, N'à¤•à¥à¤°à¥‹à¤•à¤°à¥€ à¤¹à¥‹à¤® à¤…à¤ªà¥à¤²à¤¾à¤¯à¤‚à¤¸à¥‡à¤¸ à¤Ÿà¤¾à¤¯ à¤…à¤à¤¡ à¤—à¤¿à¤«à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1588, N'à¤•à¤²à¥‡à¤•à¥à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1589, N'à¤•à¤²à¥‡à¤•à¥à¤¶à¤¨ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1590, N'à¤•à¤²à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1591, N'à¤•à¤²à¤°à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1592, N'à¤•à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1593, N'à¤•à¥à¤²à¤¾à¤¸/à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€ à¤à¥‡à¤°à¥‰à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1594, N'à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1596, N'à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•à¤² à¤²à¥…à¤¬', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1597, N'à¤•à¥à¤²à¥€à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1598, N'à¤•à¥à¤²à¥‹à¤¥ à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1599, N'à¤•à¥à¤¶à¤¨ à¤®à¥‡à¤•à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1600, N'à¤•à¤¸à¥à¤Ÿà¥à¤® à¤•à¥à¤²à¤¿à¤¯à¤°à¤¨à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1601, N'à¤•à¤¸à¥à¤Ÿà¤®à¤° à¤¸à¤°à¥à¤µà¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1602, N'à¤•à¤¾à¤‚à¤¦à¤¾ à¤¬à¤Ÿà¤¾à¤Ÿà¤¾ à¤µà¥à¤¯à¤¾à¤ªà¤¾à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1603, N'à¤•à¤¾à¤‚à¤¦à¤¾ à¤¬à¤Ÿà¤¾à¤Ÿà¤¾ à¤¹à¥‹à¤²à¤¸à¥‡à¤² ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1604, N'à¤•à¤¾à¤ªà¤¡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1605, N'à¤•à¤¾à¤ªà¤¡ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1606, N'à¤•à¤¾à¤° à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1607, N'à¤•à¤¾à¤° à¤¡à¥‡à¤•à¥‹à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1608, N'à¤•à¤¾à¤° à¤¡à¥‡à¤•à¥‹à¤°à¥‡à¤¶à¤¨ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1609, N'à¤•à¤¾à¤° à¤¡à¤¿à¤Ÿà¥‡à¤²à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1610, N'à¤•à¤¾à¤° à¤¡à¥€à¤²à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1611, N'à¤•à¤¾à¤° à¤¡à¥€à¤²à¤° à¤¶à¥‹à¤°à¥‚à¤®', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1612, N'à¤•à¤¾à¤° à¤¬à¥…à¤Ÿà¤°à¥€ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1613, N'à¤•à¤¾à¤° à¤¬à¤¾à¤‡à¤• à¤¬à¥…à¤Ÿà¤°à¥€ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1614, N'à¤•à¤¾à¤° à¤µà¥‰à¤¶ à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1615, N'à¤•à¤¾à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1616, N'à¤•à¤¾à¤° à¤¸à¥à¤ªà¥‡à¤…à¤° à¤ªà¤¾à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1617, N'à¤•à¤¾à¤° à¤¸à¤°à¥à¤µà¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1618, N'à¤•à¤¾à¤° à¤¸à¥‹à¤²à¥à¤¯à¥‚à¤¶à¤¨à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1619, N'à¤•à¤¾à¤°à¤ªà¥‡à¤Ÿ à¤†à¤£à¤¿ à¤µà¤¾à¤²à¤ªà¥‡à¤ªà¤° à¤¸à¤°à¥à¤µà¤¿à¤¸  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1620, N'à¤•à¤¾à¤°à¤ªà¥‡à¤Ÿ à¤µ à¤µà¥‰à¤²à¤ªà¥‡à¤ªà¤° à¤¶à¥‰à¤ª  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1621, N'à¤•à¤¾à¤°à¤ªà¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1622, N'à¤•à¤¾à¤°à¥à¤¯à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1624, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ (à¤—à¥‹à¤²à¥à¤¡ à¤²à¥‹à¤¨ )', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1625, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ (à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1626, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯(à¤‘à¤¨à¤²à¤¾à¤‡à¤¨ à¤à¤œà¥à¤¯à¥à¤•à¥‡à¤¶à¤¨)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1627, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯(à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1628, N'à¤•à¤¿à¤šà¤¨ à¤…à¤ªà¥à¤²à¤¾à¤¯à¥‡à¤¨à¥à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1629, N'à¤•à¤¿à¤šà¤¨ à¤‘à¤•à¥à¤¸à¥‡à¤¸à¤°à¥€à¤œ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1630, N'à¤•à¤¿à¤šà¤¨ à¤—à¥à¤°à¥‹à¤¸à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1631, N'à¤•à¤¿à¤šà¤¨ à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1632, N'à¤•à¤¿à¤šà¤¨ à¤¹à¥‹à¤®', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1633, N'à¤•à¤¿à¤¡à¥à¤¸ à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1634, N'à¤•à¤¿à¤¡à¥à¤¸ à¤µà¥‡à¤¯à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1635, N'à¤•à¤¿à¤¡à¥à¤¸ à¤¸à¥à¤•à¥‚à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1636, N'à¤•à¤¿à¤°à¤£à¤¾ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1637, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1638, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1639, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1640, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤®à¤¾à¤°à¥à¤•à¥‡à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1641, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1642, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1643, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¥à¤Ÿà¥‹à¤…à¤° (à¤®à¤¿à¤¨à¥€à¤®à¥‰à¤²)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1644, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¥à¤Ÿà¥‹à¤…à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1645, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¥à¤Ÿà¥‹à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1646, N'à¤•à¤¿à¤°à¤¾à¤£à¤¾ à¤¸à¤¾à¤®à¤¾à¤¨à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1647, N'à¤•à¥€ à¤®à¥‡à¤•à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1648, N'à¤•à¥€à¤šà¥‡à¤¨ à¤‡à¤‚à¤Ÿà¥‡à¤°à¥€à¤…à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1649, N'à¤•à¥‰ à¤®à¥à¤¯à¤¾à¤¨à¥‡à¤œà¤®à¥‡à¤‚à¤Ÿ à¤¸à¤°à¥à¤µà¤¿à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1650, N'à¤•à¥‰à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤•à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1651, N'à¤•à¥‰à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1652, N'à¤•à¥‰à¤®à¥à¤ªà¥à¤¯à¥à¤Ÿà¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1653, N'à¤•à¥‰à¤¸à¥à¤Ÿà¤®à¥…à¤Ÿà¤¿à¤• à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1654, N'à¤•à¥‰à¤¸à¥à¤®à¥…à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1655, N'à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1656, N'à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤•  à¤•à¥à¤°à¥‰à¤•à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1657, N'à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤• à¤…à¤à¤¡ à¤—à¤¿à¤«à¥à¤Ÿ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1658, N'à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1659, N'à¤•à¥‰à¤¸à¥à¤®à¥‡à¤Ÿà¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1660, N'à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1661, N'à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1662, N'à¤•à¥à¤‚à¤Ÿà¥‡à¤•à¤° à¤•à¥‡à¤¬à¤¿à¤¨ à¤¸à¥‡à¤²à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1663, N'à¤•à¤‚à¤Ÿà¥‡à¤¨à¤° à¤•à¥‡à¤¬à¤¿à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1664, N'à¤†à¤ˆ à¤•à¥‡à¤…à¤° à¤¸à¥‡à¤‚à¤Ÿà¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1665, N'à¤•à¤¡à¤§à¤¾à¤¨à¥à¤¯ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1666, N'à¤•à¤¡à¤§à¤¾à¤¨à¥à¤¯ à¤¸à¥à¤Ÿà¥‰à¤• à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1667, N'à¤•à¥à¤‚à¤¡à¥à¤¯à¤¾ à¤†à¤£à¤¿ à¤à¤¾à¤¡à¥‡ à¤µà¤¿à¤•à¥à¤°à¥€ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1668, N'à¤•à¤¨à¥à¤¸à¥à¤Ÿà¥à¤°à¤•à¥à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1669, N'à¤•à¤¨à¥à¤¸à¥à¤Ÿà¥à¤°à¤•à¤¶à¤¨ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1670, N'à¤•à¤¨à¥à¤¸à¥à¤Ÿà¥à¤°à¤•à¥à¤¶à¤¨ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1671, N'à¤•à¤¨à¥à¤¸à¤²à¤Ÿà¤‚à¤Ÿà¥€à¤‚à¤— à¤¹à¤¾à¤Šà¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1672, N'à¤•à¤¨à¥à¤¸à¤²à¥à¤Ÿà¤¨à¥à¤¸à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1673, N'à¤•à¤¨à¥à¤¸à¤²à¤Ÿà¤¨à¥à¤¸à¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1674, N'à¤•à¤ªà¤¡à¥‡', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1675, N'à¤•à¤ªà¤¡à¥‡ à¤µà¤¿à¤•à¥à¤°à¥€ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1676, N'à¤•à¤ªà¤¡à¥‡ à¤¶à¤¿à¤²à¤¾à¤ˆ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1677, N'à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤šà¥‡ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1678, N'à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1679, N'à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤‚à¤š à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1680, N'à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤‚à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1681, N'à¤•à¤ªà¤¡à¥à¤¯à¤¾à¤šà¥‡ à¤°à¥‡à¤¡à¤¿à¤®à¥‡à¤Ÿ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1682, N'à¤•à¤ªà¤¡à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1683, N'à¤•à¤ªà¤¡à¤¾ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1684, N'à¤•à¤ªà¤¡à¤¾ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1685, N'à¤•à¤ªà¤¡à¤¾ à¤µ à¤šà¤ªà¥à¤ªà¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1686, N'à¤•à¤ªà¤¡à¤¾ à¤µ à¤¸à¤¾à¤¡à¥€à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1687, N'à¤•à¤ªà¤¡à¤¾ à¤¶à¤¿à¤²à¤¾à¤ˆ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1688, N'à¤•à¤ªà¤¦à¥à¤¯à¤¾à¤šà¥‡ à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1689, N'à¤…à¥…à¤¡à¤µà¤¾à¤¯à¤œà¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1690, N'à¤…à¤­à¥à¤¯à¤¾à¤¸à¤¿à¤•à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1691, N'à¤…à¤­à¥à¤¯à¤¾à¤¸à¤¿à¤•à¤¾(à¤–à¤¾à¤œà¤—à¥€)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1692, N'à¤…à¥…à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤µà¤°à¥à¤• à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1693, N'à¤…à¥…à¤²à¥à¤¯à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤µà¤¿à¤‚à¤¡à¥‹ (à¤‘à¤«à¤¿à¤¸)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1694, N'à¤…à¤¸à¥‹à¤¸à¤¿à¤à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1696, N'à¤…à¥…à¤•à¥à¤µà¤¾ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1697, N'à¤…à¤•à¤¾à¤Šà¤‚à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1698, N'à¤…à¤•à¤¾à¤Šà¤‚à¤Ÿ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1699, N'à¤…à¤—à¥à¤°à¥€à¤•à¤²à¥à¤šà¤° à¤²à¤à¤¡ à¤¸à¥‡à¤•à¤‚à¤¡ à¤¹à¥‹à¤®', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1700, N'à¤œà¤¿à¤® à¤«à¤¿à¤Ÿà¤¨à¥‡à¤¸ à¤¸à¥à¤Ÿà¥à¤¡à¤¿à¤“ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1701, N'à¤•à¤‚à¤¨à¥à¤¸à¥à¤Ÿà¥à¤°à¤•à¥à¤¶à¤¨ à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1703, N'à¤®à¥‡à¤¡à¤¿à¤•à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1705, N'à¤œà¤¨à¤°à¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1706, N'à¤ªà¤¾à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1707, N'à¤•à¤‚à¤ªà¤¨à¥€/ à¤•à¤¾à¤°à¤–à¤¾à¤¨à¥‡ à¤¨à¤µà¥€à¤¨ à¤¨à¤¾ à¤¹à¤°à¤•à¤¤ à¤¦à¤¾à¤–à¤²à¥‡', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1708, N'à¤ªà¥‡à¤Ÿà¥à¤°à¥‹à¤²  à¤ªà¤‚à¤ª à¤¨à¥à¤¤à¤¨à¤¿à¤•à¤°à¤£ à¤¨à¤¾ à¤¹à¤°à¤•à¤¤ à¤¦à¤¾à¤–à¤²à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1709, N'à¤¨à¤µà¥€à¤¨ à¤‰à¤¦à¥à¤¯à¥‹à¤—à¤§à¤‚à¤¦à¤¾ à¤ªà¤°à¤µà¤¾à¤¨à¤¾', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1710, N'à¤¨à¤µà¥€à¤¨ à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯ à¤ªà¤°à¤µà¤¾à¤¨à¤¾ à¤¦à¥‡à¤£à¥‡', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1711, N'à¤µà¥à¤¯à¤µà¤¸à¤¾à¤¯ à¤ªà¤°à¤µà¤¾à¤¨à¤¾ à¤¨à¥à¤¤à¤¨à¥€à¤•à¤°à¤£', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1712, N'à¤¸à¤¾à¤ à¤¾ à¤ªà¤°à¤µà¤¾à¤¨à¤¾ à¤¨à¥à¤¤à¤¨à¥€à¤•à¤°à¤£ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1713, N'à¤†à¤Ÿà¤¾ à¤šà¤•à¥à¤•à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1714, N'à¤†à¤¯ à¤—à¥à¤²à¤¾à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1715, N'à¤†à¤¯à¥à¤°à¤¯à¥‹à¤—à¤¾ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1716, N'à¤†à¤¯à¥à¤°à¥à¤µà¥‡à¤¦à¤¿à¤• à¤¦à¥à¤•à¤¾à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1717, N'à¤†à¤¯à¥à¤°à¥à¤µà¥‡à¤¦à¤¿à¤• à¤®à¥‡à¤¡à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1718, N'à¤†à¤¯à¥à¤°à¥à¤µà¥‡à¤¦à¤¿à¤• à¤µ à¤¯à¥à¤¨à¤¾à¤£à¥€ à¤¹à¤¬', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1719, N'à¤†à¤¯à¥à¤°à¥à¤µà¥‡à¤¦à¤¿à¤• à¤¸à¥‡à¤‚à¤Ÿà¤° à¤µ à¤¸à¤¾à¤¡à¥€ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1720, N'à¤†à¤°à¥à¤•à¤¿à¤Ÿà¥‡à¤• à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1721, N'à¤†à¤°à¥à¤•à¤¿à¤Ÿà¥‡à¤•à¥à¤šà¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1722, N'à¤†à¤°à¥à¤Ÿ à¤•à¥à¤°à¤¾à¤«à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1723, N'à¤†à¤°à¥à¤¯à¥à¤µà¥‡à¤¦à¤¿à¤• à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1724, N'à¤‡à¤œà¤¿à¤¨à¤¿à¤¯à¤°à¤¿à¤‚à¤— ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1725, N'à¤‡à¤‚à¤œà¥€à¤¨à¤¿à¤…à¤°à¤¿à¤‚à¤— à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1726, N'à¤‡à¤‚à¤œà¥€à¤¨à¤¿à¤…à¤°à¤¿à¤‚à¤— à¤•à¤‚à¤ªà¤¨à¥€ ( à¤‘à¤«à¤¿à¤¸)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1727, N'à¤‡à¤‚à¤Ÿà¤°à¤¨à¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1728, N'à¤‡à¤‚à¤Ÿà¤°à¤¨à¥‡à¤Ÿ à¤¸à¤°à¥à¤µà¥à¤¹à¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1729, N'à¤‡à¤‚à¤Ÿà¤°à¤ªà¥à¤°à¤¾à¤‡à¤à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1730, N'à¤‡à¤‚à¤Ÿà¥‡à¤°à¤¿à¤¯à¤° à¤¡à¤¿à¤à¤¾à¤¯à¤¨à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1731, N'à¤‡à¤‚à¤Ÿà¥‡à¤°à¤¿à¤¯à¤° à¤¡à¤¿à¤¸à¤¾à¤¯à¤¨à¥€à¤— à¤‘à¤«à¤¿à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1732, N'à¤‡à¤‚à¤Ÿà¥‡à¤°à¤¿à¤¯à¤² à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1733, N'à¤‡à¤‚à¤Ÿà¥‡à¤°à¥€à¤…à¤° à¤¡à¤¿à¤œà¤¾à¤¯à¤¨à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1734, N'à¤‡à¤‚à¤¡à¤¸à¥à¤Ÿà¥à¤°à¥€à¤œ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1735, N'à¤‡à¤¨à¤µà¤Ÿà¤° à¤¬à¥…à¤Ÿà¤°à¥€ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1736, N'à¤‡à¤¨à¥à¤µà¤Ÿà¤° à¤¬à¥…à¤Ÿà¤°à¥€ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1737, N'à¤‡à¤¨à¤µà¥‡à¤¸à¤®à¥‡à¤‚à¤Ÿ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1738, N'à¤‡à¤¨à¥à¤¶à¥à¤°à¤¨à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1739, N'à¤‡à¤¨à¥à¤¶à¥à¤°à¤¨à¥à¤¸ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1740, N'à¤‡à¤¨à¥à¤¶à¥à¤°à¤¨à¥à¤¸ à¤•à¤‚. à¤²à¤¿.', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1741, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1742, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1743, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1744, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤†à¤£à¤¿ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1745, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¬à¤¾à¤‡à¤• à¤¶à¥‹à¤°à¥‚à¤®', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1746, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤°à¤¿à¤ªà¥‡à¤…à¤°à¥€à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1747, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1748, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤°à¥€à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1749, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤²à¤¾à¤‡à¤Ÿ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1750, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤µ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1751, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤µà¤¸à¥à¤¤à¥ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1752, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1753, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¸à¥à¤•à¥‚à¤Ÿà¤° à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1754, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¸à¤¾à¤®à¤¾à¤¨ à¤¦à¥à¤°à¥‚à¤¸à¥à¤¤à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1755, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1756, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1757, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1758, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤² à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤° ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1759, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤²à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1760, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¤²à¥à¤¸ à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1761, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤•à¥à¤¸ à¤…à¤à¤¡ à¤¹à¤¾à¤°à¥à¤¡à¤µà¥‡à¤…à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1762, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‰à¤¨à¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1763, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‰à¤¨à¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1764, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‰à¤¨à¤¿à¤•à¥à¤¸  à¤°à¥€à¤ªà¥‡à¤…à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1765, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥€à¤•à¥à¤²à¤°à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1766, N'à¤‡à¤‚à¤¶à¥à¤°à¤‚à¤¸ à¤¸à¤²à¥à¤²à¤¾à¤—à¤¾à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1767, N'à¤‡à¤‚à¤¸à¥à¤Ÿà¥€à¤Ÿà¥à¤¯à¥‚à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1768, N'à¤‡à¤¸à¥à¤¤à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1769, N'à¤ˆà¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤¶à¤¨', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1770, N'à¤‰à¤¸ à¤¸à¤ªà¥à¤²à¤¾à¤¯à¤°à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1772, N'à¤à¤•à¥à¤¸à¤¿à¤¸ à¤¬à¤à¤•  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1773, N'à¤à¤œà¥‡à¤‚à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1774, N'à¤à¤œà¤¨à¥à¤¸à¥€ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1775, N'à¤à¤‚à¤œà¤¿à¤¨à¤¿à¤¯à¤° à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1776, N'à¤à¤‚à¤Ÿà¤°à¤ªà¥à¤°à¤¾à¤¯à¤œà¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1777, N'à¤à¤Ÿà¥€à¤à¤®', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1778, N'à¤à¤¡à¥à¤µà¥‹à¤•à¥‡à¤Ÿ à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1779, N'à¤à¤®.à¤à¤¸.à¤ªà¤¾à¤ˆà¤ª à¤—à¥‹à¤¡à¤¾à¤‰à¤¨ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1780, N'à¤à¤®à¥à¤¬à¥à¤°à¥‹à¤‡à¤¡à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1781, N'à¤à¤² à¤†à¤¯ à¤¸à¥€  à¤«à¤¾à¤¯à¤¨à¤¾à¤¨à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1782, N'à¤à¤² à¤†à¤¯ à¤¸à¥€ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1783, N'à¤à¤².à¤†à¤¯.à¤¸à¥€. à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1784, N'à¤à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¥‹à¤¨à¤¿à¤• à¤¸à¥à¤Ÿà¥‹à¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1785, N'à¤à¤²à¥à¤®à¤¿à¤¨à¤¿à¤¯à¤® à¤…à¤à¤¡ à¤—à¥à¤²à¤¾à¤¸ à¤µà¤°à¥à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1786, N'à¤à¤µà¥à¤¹à¥‡à¤‚à¤Ÿ à¤à¤œà¤¨à¥à¤¸à¤¿', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1787, N'à¤à¤¸à¥€ à¤°à¥‡à¤°à¥à¤ªà¥ˆà¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1788, N'à¤à¤¸à¥€ à¤°à¤¿à¤ªà¥‡à¤°à¤¿à¤‚à¤—', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1789, N'à¤‘à¤‡à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1790, N'à¤‘à¤Ÿà¥‹ à¤—à¥…à¤°à¥‡à¤œ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1791, N'à¤‘à¤Ÿà¥‹ à¤ªà¤¾à¤°à¥à¤Ÿà¥à¤¸ à¤†à¤£à¤¿ à¤¸à¤°à¥à¤µà¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1792, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤‡à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1793, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤ªà¤¾à¤°à¥à¤Ÿ à¤¸à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1794, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤°à¥€à¤ªà¥‡à¤¯à¤°à¤¿à¤‚à¤— à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1795, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1796, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤‡à¤² à¤¸à¥à¤ªà¥‡à¤…à¤°à¤ªà¤¾à¤°à¥à¤Ÿ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1797, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤…à¤à¤¡ à¤µà¥‰à¤¶à¤¿à¤‚à¤— à¤¸à¥‡à¤‚à¤Ÿà¤°', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1798, N'à¤‘à¤Ÿà¥‹à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1799, N'à¤‘à¤¨à¤²à¤¾à¤‡à¤¨ à¤—à¥à¤°à¥‹à¤¸à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1800, N'à¤‘à¤¨à¤²à¤¾à¤‡à¤¨ à¤—à¥à¤°à¥‹à¤¸à¤°à¥€ à¤¡à¥‡à¤²à¤¿à¤µà¥‡à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1801, N'à¤‘à¤¨à¤²à¤¾à¤‡à¤¨ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1802, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1803, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤• à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1804, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•à¤²', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1805, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•à¤² à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1806, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•à¤²à¥à¤¸ à¤¶à¥‰à¤ª ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1807, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•à¥à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1808, N'à¤‘à¤ªà¥à¤Ÿà¤¿à¤•à¥à¤¸ à¤¶à¥‰à¤ª', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1809, N'à¤‘à¤«à¤¿à¤¸ ( à¤•à¤¨à¤¸à¥à¤Ÿà¤Ÿà¤¸à¥€ à¤‘à¤«à¤¿à¤¸ )', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1810, N'à¤‘à¤«à¤¿à¤¸ + à¤¸à¥à¤Ÿà¥‡à¤¶à¤¨à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1811, N'à¤‘à¤«à¤¿à¤¸ à¤²à¥‰à¤œà¤¿à¤¸à¥à¤Ÿà¤¿à¤•à¥à¤¸ à¤¸à¥‡à¤°à¥à¤µà¤¿à¤¸à¥‡à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1812, N'à¤“à¤ªà¤Ÿà¥€à¤•à¤²à¥à¤¸ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1813, N'à¤“à¤²à¥à¤¡ à¤ªà¥‡à¤ªà¤° à¤®à¤¾à¤°à¥à¤Ÿ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1814, N'à¤”à¤·à¤¦ à¤µà¤¿à¤•à¥à¤°à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1815, N'à¤‰à¤¦à¥à¤¯à¥‹à¤—à¤§à¤‚à¤¦à¤¾ à¤ªà¤°à¤µà¤¾à¤¨à¤¾ à¤¨à¥à¤¤à¤¨à¥€à¤•à¤°à¤£  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1816, N'( à¤…à¤—à¥à¤°à¥‹ à¤ªà¥à¤°à¥‹à¤¡à¤•à¥à¤Ÿ )à¤‘à¤«à¤¿à¤¸', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1821, N'à¤†à¤ˆà¤¸à¥à¤•à¥à¤°à¥€à¤® à¤ªà¤¾à¤°à¥à¤²à¤°', N'S', 68, NULL, NULL, N'', 0, NULL),
  (1822, N'à¤à¤¨à¤œà¥€à¤“', N'S', 68, NULL, NULL, N'', 0, NULL),
  (1823, N'à¤¯à¥‹à¤—à¤¾ ', N'GM', 68, NULL, NULL, N'', 0, NULL),
  (1824, N'à¤à¥à¤‚à¤¬à¤¾ ', N'GM', 68, NULL, NULL, N'', 0, NULL),
  (1826, N'à¤µà¤¸à¥à¤¤à¥ à¤¨à¤¿à¤°à¥à¤®à¤¿à¤¤à¥€', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1828, N'à¤ªà¤¾à¤°à¥à¤•à¥€à¤‚à¤—', N'N', 72, NULL, NULL, N'', 0, NULL),
  (1829, N'à¤°à¤¿à¤«à¥à¤¯à¥à¤œ à¤à¤°à¤¿à¤¯à¤¾', N'N', 72, NULL, NULL, N'', 0, NULL),
  (1830, N'à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'GR', 70, NULL, NULL, N'', 0, 1),
  (1831, N'à¤ªà¥‡à¤Ÿà¥à¤¸ à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'D', 68, NULL, NULL, N'', 0, NULL),
  (1832, N'à¤µà¤¿à¤¦à¥à¤¯à¤¾à¤²à¤¯', N'T', 72, NULL, NULL, N'', 0, NULL),
  (1835, N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'NI', 66, NULL, NULL, N'', 0, NULL),
  (1836, N'à¤‡à¤‚à¤¡à¥‡à¤•à¥à¤¸-2', N'C', 74, NULL, NULL, N'', 0, NULL),
  (1854, N'à¤¸à¥à¤Ÿà¥‹à¤…à¤° à¤°à¥‚à¤®', N'R', 72, NULL, NULL, N'', 0, NULL),
  (1932, N'Other', N'ABLC', NULL, NULL, NULL, N'', 0, NULL),
  (2012, N'à¤µà¥à¤¹à¤¿à¤œà¤¿à¤Ÿà¤°à¥à¤¸ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'SPK', NULL, NULL, NULL, N'', 0, 1),
  (2013, N'à¤•à¤¾à¤° à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'OPK', NULL, NULL, NULL, N'', 0, 1),
  (2015, N'à¤¸à¤¾à¤¯à¤•à¤²  à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— ', N'OPK', NULL, NULL, NULL, N'', 0, 1),
  (2019, N'à¤¬à¤¾à¤ˆà¤• à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'OPKC', NULL, NULL, NULL, N'', 0, 1),
  (2026, N'à¤²à¥‰à¤¬à¥€', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2028, N'à¤µà¥‰à¤šà¤®à¤¨ à¤°à¥‚à¤®', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2030, N'à¤¬à¥…à¤¡à¤®à¤¿à¤‚à¤Ÿà¤¨ à¤•à¥‹à¤°à¥à¤Ÿ', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2032, N'à¤šà¥‡à¤¸ à¤à¤°à¤¿à¤¯à¤¾', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2034, N'à¤•à¥…à¤°à¤® à¤à¤°à¤¿à¤¯à¤¾', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2036, N'à¤ªà¤‚à¤ª à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2038, N'à¤†à¤°à¤à¤®à¤à¤¸ à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2040, N'à¤‡à¤²à¥‡à¤•à¥à¤Ÿà¥à¤°à¤¿à¤• à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2042, N'à¤—à¥‹à¤¡à¤¾à¤Šà¤¨', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2044, N'à¤°à¥‡à¤¸à¥à¤Ÿà¥‰à¤°à¤‚à¤Ÿ', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2046, N'à¤¡à¤¿à¤ªà¤¾à¤°à¥à¤Ÿà¤®à¥‡à¤‚à¤Ÿà¤² à¤¸à¥à¤Ÿà¥‹à¤…à¤°', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2048, N'à¤¬à¤à¤•à¥à¤µà¥‡à¤Ÿ à¤¹à¥‰à¤²', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2050, N'à¤•à¥à¤°à¥‡à¤š', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2054, N'à¤Ÿà¥‡à¤¬à¤² à¤Ÿà¥‡à¤¨à¤¿à¤¸ à¤à¤°à¤¿à¤¯à¤¾', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2056, N'à¤¸à¥à¤¨à¥‚à¤•à¤° / à¤…à¥…à¤¡à¤®à¤¿à¤¨ à¤à¤°à¤¿à¤¯à¤¾', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2059, N'à¤.à¤µà¥à¤¹à¥€. à¤°à¥‚à¤®', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2060, N'à¤œà¥‡à¤¨à¥à¤Ÿà¥à¤¸ à¤Ÿà¥‰à¤¯à¤²à¥‡à¤Ÿ', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2063, N'à¤•à¥‰à¤®à¤¨ à¤µà¥‰à¤¶à¤°à¥‚à¤®', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2065, N'à¤¹à¤à¤¡à¥€à¤•à¥…à¤ª à¤µà¥‰à¤¶à¤°à¥‚à¤®', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2066, N'à¤²à¥‡à¤¡à¥€à¤œ à¤µà¥‰à¤¶à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2068, N'à¤¸à¥à¤µà¤¿à¤®à¤¿à¤‚à¤— à¤ªà¥‚à¤²', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2070, N'à¤à¤².à¤µà¥à¤¹à¥€.à¤à¤¸. à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2072, N'à¤«à¤¿à¤Ÿà¤¨à¥‡à¤¸ à¤¸à¥‡à¤‚à¤Ÿà¤°', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2074, N'à¤•à¥…à¤«à¥‡à¤Ÿà¥‡à¤°à¤¿à¤¯à¤¾', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2076, N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2078, N'à¤¡à¥à¤°à¤¾à¤¯à¤µà¥à¤¹à¤° à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2080, N'à¤—à¥‡à¤¸à¥à¤Ÿ à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2082, N'à¤°à¥‡à¤¸à¥à¤Ÿ à¤°à¥‚à¤® & à¤šà¥‡à¤‚à¤œà¤¿à¤‚à¤— à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2084, N'à¤œà¤¾à¤¨à¤¿à¤Ÿà¤° à¤°à¥‚à¤®', N'ACH', 56, NULL, NULL, N'', 0, NULL)

   ) v(Id, [Description], TypeOfUseCode, CreatedBy, UpdatedBy, UpdatedDate, SearchKey, SearchSequence,TypeOfUseCategoryId)
)
INSERT PTIS.SubTypeOfUseMaster
(Id, [Description], TypeOfUseId, CreatedBy, UpdatedBy, UpdatedDate, SearchSequence,TypeOfUseCategoryId)
SELECT
    s.Id,
    s.[Description],
    t.Id,
    s.CreatedBy,
    s.UpdatedBy,
    s.UpdatedDate,
    s.SearchSequence,
    s.TypeOfUseCategoryId
FROM Seed s
JOIN PTIS.TypeOfUseMaster t
  ON t.TypeOfUseCode = s.TypeOfUseCode;

SET IDENTITY_INSERT PTIS.SubTypeOfUseMaster OFF;





INSERT INTO [PTIS].[OwnerTypeMaster] ([OwnerType])
VALUES
('Self'),
('Women'),
('Soldier'),
('Ex. Militry Soldier'),
('Martyr Soldier'),
('Martyr Soldier Wife'),
('Joined'),
('Company / Industrial'),
('Physical Disability');






SET IDENTITY_INSERT [PTIS].[PropertyTypeCategoryMaster] ON;
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('2',N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('3',N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('4',N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('5',N'à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤•','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('6',N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('7',N'à¤®à¤¿à¤¶à¥à¤°à¤¿à¤¤','1');
SET IDENTITY_INSERT [PTIS].[PropertyTypeCategoryMaster] OFF;




SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] ON;
INSERT INTO [PTIS].[PropertyTypeMaster]
(
    [Id],[PropertyDescription],[Type],[SearchSequence],[PropertyTypeCategoryId],[PartType],[IsActive])
VALUES
(1, N'à¤–à¤¾à¤œà¤—à¥€ à¤¶à¤¾à¤³à¤¾', N'C', 1, NULL, N'C', 1),
(2, N'à¤®.à¤¨.à¤ªà¤¾.à¤¶à¤¾à¤³à¤¾', N'N', 1, NULL, N'', 1),
(5, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯', N'C', 1, NULL, N'C', 1),
(6, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯', N'C', 2, NULL, N'C', 1),
(8, N'à¤®.à¤¨.à¤ªà¤¾.à¤šà¥‡ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯', N'N', 4, NULL, N'', 1),
(10, N'à¤¬à¤à¤• à¤µ à¤µà¤¿à¤¤à¥à¤¤à¥€à¤¯ à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'C', 1, NULL, N'C', 1),
(11, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³', N'R', 1, NULL, N'R', 1),
(12, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', 1, 2, N'R', 1),
(13, N'à¤¦à¥à¤•à¤¾à¤¨', N'C', 1, NULL, N'C', 1),
(14, N'à¤°à¥‡à¤¸à¥à¤Ÿà¥‰à¤°à¤‚à¤Ÿ à¤†à¤£à¤¿ à¤¬à¤¾à¤°', N'C', 1, NULL, N'C', 1),
(16, N'à¤®.à¤¨.à¤ªà¤¾.à¤šà¥‡.à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'N', 2, NULL, N'', 1),
(17, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 3, NULL, N'C', 1),
(21, N'à¤®.à¤¨.à¤ªà¤¾. à¤µ à¤‡à¤¤à¤° à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'N', 2, NULL, N'', 1),
(22, N'à¤ªà¥à¤²à¥‰à¤Ÿ', N'R', 1, NULL, N'R', 1),
(23, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'R-C', 2, NULL, N'', 1),
(24, N'à¤…à¤¤à¤¿à¤•à¥à¤°à¤®à¤£', N'R', 3, NULL, N'R', 1),
(25, N'à¤®à¤¾ à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', 4, NULL, N'C', 1),
(27, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤Ÿà¥‰à¤µà¤°', N'C', 2, NULL, N'C', 1),
(28, N'à¤ªà¥‡à¤Ÿà¥à¤°à¥‹à¤² à¤ªà¤‚à¤ª', N'C', 1, NULL, N'C', 1),
(29, N'à¤¹à¥‰à¤Ÿà¥‡à¤²', N'C', 2, NULL, N'C', 1),
(30, N'à¤²à¥‰à¤œ', N'C', 1, NULL, N'C', 1),
(31, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤¹à¥‰à¤Ÿà¥‡à¤²', N'R-C', 4, NULL, N'', 1),
(32, N'à¤—à¥‹à¤¡à¤¾à¤Šà¤¨', N'C', 2, NULL, N'C', 1),
(33, N'à¤šà¤¾à¤²à¥‚ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'R', 1, NULL, N'R', 1),
(34, N'à¤—à¥‹à¤ à¤¾', N'R', 5, NULL, N'R', 1),
(35, N'à¤ªà¤¡à¥€à¤¤', N'R', 6, NULL, N'R', 1),
(36, N'à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 2, NULL, N'C', 1),
(37, N'à¤®.à¤¨.à¤ªà¤¾.à¤¦à¥à¤•à¤¾à¤¨ à¤—à¤¾à¤³à¥‡', N'N', 4, NULL, N'', 1),
(38, N'à¤µà¤¸à¤¤à¤¿à¤—à¥ƒà¤¹', N'C', 2, NULL, N'C', 1),
(39, N'à¤µà¥à¤¯à¤¾à¤¯à¤¾à¤® à¤¶à¤¾à¤³à¤¾', N'C', 5, NULL, N'C', 1),
(41, N'à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—', N'C', 2, NULL, N'C', 1),
(42, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'R-C', 8, NULL, N'', 1),
(44, N'à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯', N'C', 2, NULL, N'C', 1),
(45, N'à¤•à¥‡à¤‚à¤¦à¥à¤° à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', 1, NULL, N'C', 1),
(46, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 5, NULL, N'', 1),
(47, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 3, NULL, N'', 1),
(48, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤µà¤¸à¤¤à¤¿à¤—à¥ƒà¤¹', N'C', 7, NULL, N'C', 1),
(49, N'à¤²à¥‰à¤‚à¤¨', N'C', 3, NULL, N'C', 1),
(50, N'à¤šà¤¿à¤¤à¥à¤°à¤ªà¤Ÿà¤—à¥ƒà¤¹', N'C', 4, NULL, N'C', 1),
(51, N'à¤¶à¥‹à¤°à¥‚à¤®', N'C', 4, NULL, N'C', 1),
(52, N'à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'C', 2, NULL, N'C', 1),
(53, N'à¤–à¤¾à¤œà¤—à¥€ à¤°à¥à¤—à¥à¤£à¤¾à¤²à¤¯ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'C', 7, NULL, N'C', 1),
(54, N'à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 2, NULL, N'', 1),
(55, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'R-C', 2, NULL, N'', 1),
(57, N'à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤ªà¤¡à¥€à¤¤', N'R-C', 5, NULL, N'', 1),
(58, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤ªà¤¡à¥€à¤¤', N'R', 10, NULL, N'R', 1),
(59, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€  à¤µ à¤¬à¤à¤•', N'R-C', 2, NULL, N'', 1),
(63, N'à¤–à¤¾à¤œà¤—à¥€ à¤¶à¤¾à¤³à¤¾ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 2, NULL, N'', 1),
(64, N'à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 6, NULL, N'C', 1),
(66, N'à¤¦à¥à¤•à¤¾à¤¨ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 3, NULL, N'C', 1),
(69, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 6, NULL, N'', 1),
(70, N'à¤•à¤¾à¤°à¤–à¤¾à¤¨à¤¾ à¤µ à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 3, NULL, N'C', 1),
(77, N'à¤¦à¤µà¤¾à¤–à¤¾à¤¨à¤¾ à¤µ à¤¹à¥‰à¤Ÿà¥‡à¤²', N'C', 10, NULL, N'C', 1),
(78, N'à¤¬à¤à¤• à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', 6, NULL, N'C', 1),
(79, N'à¤¹à¥‰à¤Ÿà¥‡à¤² à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'C', 6, NULL, N'C', 1),
(80, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€,à¤—à¥‹à¤¡à¤¾à¤‰à¤¨,à¤¦à¥à¤•à¤¾à¤¨', N'R-C', 8, NULL, N'', 1),
(82, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', 2, NULL, N'C', 1),
(83, N'à¤•à¤¾à¤°à¤–à¤¾à¤¨à¤¾ à¤µ à¤—à¥‹à¤¡à¤¾à¤‰à¤¨', N'C', 4, NULL, N'C', 1),
(88, N'à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤¶à¤¾à¤¸à¤•à¥€à¤¯', N'C', 4, NULL, N'C', 1),
(92, N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•', N'I', 1, NULL, N'', 1),
(94, N'à¤®à¥‰à¤²', N'C', 3, NULL, N'C', 1),
(108, N'à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾', N'C', 5, NULL, N'C', 1),
(110, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³ à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R', 1, NULL, N'R', 1),
(111, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤—à¥‹à¤¡à¤¾à¤µà¥‚à¤¨', N'R-C', 1, NULL, N'', 1),
(113, N'à¤®à¤‚à¤—à¤² à¤•à¤¾à¤°à¥à¤¯à¤¾à¤²à¤¯', N'C', 1, NULL, N'C', 1),
(115, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤•à¥‹à¤šà¤¿à¤‚à¤— à¤•à¥à¤²à¤¾à¤¸à¥‡à¤¸', N'R-C', 1, NULL, N'', 1),
(118, N'à¤…à¤‚à¤—à¤£à¤µà¤¾à¤¡à¥€', N'C', 1, NULL, N'C', 1),
(119, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤…à¤‚à¤—à¤£à¤µà¤¾à¤¡à¥€', N'R-C', 1, NULL, N'', 1),
(127, N'à¤—à¥‹à¤¡à¤¾à¤µà¥‚à¤¨ à¤µ à¤¦à¥à¤•à¤¾à¤¨', N'C', 1, NULL, N'C', 1),
(132, N'à¤¶à¥‡à¤¤à¥€', N'R', 1, NULL, N'R', 1),
(133, N'à¤®à¥‹à¤¬à¤¾à¤ˆà¤² à¤Ÿà¥‰à¤µà¤° à¤µ à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 1, NULL, N'', 1),
(134, N'à¤¸à¤¾à¤®à¤¾à¤œà¤¿à¤• à¤¸à¤­à¤¾à¤—à¥ƒà¤¹', N'C', 1, NULL, N'C', 1),
(135, N'à¤®à¤¨à¤ªà¤¾ à¤—à¤¾à¤°à¥à¤¡à¤¨/à¤“à¤ªà¤¨à¤¸à¥à¤ªà¥‡à¤¸', N'C', 1, NULL, N'C', 1),
(136, N'à¤®à¤¨à¤ªà¤¾ à¤‡à¤¤à¤° à¤­à¥‚à¤–à¤‚à¤¡', N'R', 1, NULL, N'R', 1),
(137, N'à¤¨à¤°à¥à¤¸à¤°à¥€', N'C', 1, NULL, N'C', 1),
(138, N'à¤ªà¥‡à¤¯à¤¿à¤‚à¤— à¤—à¥‡à¤¸à¥à¤Ÿ', N'R', 1, NULL, N'R', 1),
(139, N'à¤ªà¥…à¤¥à¥‰à¤²à¥‰à¤œà¥€ à¤²à¥…à¤¬', N'C', 1, NULL, N'C', 1),
(140, N'à¤…à¥…à¤®à¤¿à¤¨à¥€à¤Ÿà¥€', N'R', 1, NULL, N'Amenity', 1),
(141, N'à¤°à¤¿à¤«à¥à¤¯à¥à¤œ à¤à¤°à¤¿à¤¯à¤¾', N'N', 1, NULL, N'', 1),
(142, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤šà¤¾à¤²à¥‚ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'R', 1, NULL, N'R', 1),
(144, N'à¤ªà¥‹à¤²à¥à¤Ÿà¥à¤°à¥€à¤«à¤¾à¤°à¥à¤®', N'C', 1, NULL, N'C', 1),
(145, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤šà¤¾à¤²à¥‚ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤®', N'R-C', 1, NULL, N'', 1),
(146, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤—à¥‹à¤ à¤¾', N'R', 1, NULL, N'R', 1),
(147, N'à¤ªà¥à¤²à¥‰à¤Ÿ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'C', 1, NULL, N'C', 1),
(148, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡', N'R', 1, NULL, N'R', 1),
(149, N'à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤–à¥à¤²à¤¾ à¤­à¥‚à¤–à¤‚à¤¡', N'C', 1, NULL, N'C', 1),
(151, N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤• à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'I-C', 1, NULL, N'', 1),
(152, N'à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤• à¤µ à¤®à¤¿à¤¶à¥à¤°', N'R-C', 1, NULL, N'', 1),
(153, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ , à¤”à¤¦à¥à¤¯à¤¾à¤—à¤¿à¤• , à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 1, NULL, N'', 1),
(154, N'à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤µà¤¾à¤šà¤¨à¤¾à¤²à¤¯', N'R-C', 1, NULL, N'', 1),
(155, N'à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤ªà¥‚à¤°à¥à¤£ à¤®à¤¾. à¤µà¤¾à¤ªà¤°à¤¾à¤¤ à¤¨à¤¾à¤¹à¥€', N'R-C', 1, NULL, N'', 1),
(156, N'à¤¶à¥‡à¤¤à¥€ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 1, NULL, N'', 1),
(157, N'à¤•à¥à¤²à¤¿à¤¨à¤¿à¤•', N'C', 1, NULL, N'C', 1),
(158, N'à¤‰à¤ªà¤¹à¤¾à¤°à¤—à¥ƒà¤¹', N'C', 1, NULL, N'C', 1),
(159, N'à¤§à¤¾à¤°à¥à¤®à¤¿à¤• à¤¸à¥à¤¥à¤³,à¤¨à¤¿à¤µà¤¾à¤¸à¥€ à¤µ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€', N'R-C', 1, NULL, N'', 1),
(160, N'à¤®à¤¾à¤¹à¤¿à¤¤à¥€ à¤µ à¤¤à¤‚à¤¤à¥à¤°à¤œà¥à¤žà¤¾à¤¨ à¤‰à¤¦à¥à¤¯à¥‹à¤—', N'I', 1, NULL, N'', 1),
(161, N'à¤¸à¤¾à¤®à¤¾à¤œà¤¿à¤• à¤¸à¤‚à¤¸à¥à¤¥à¤¾', N'R', 1, NULL, N'R', 1);

SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] OFF;



SET IDENTITY_INSERT [PTIS].[FloorMaster] ON;
GO

INSERT INTO [PTIS].[FloorMaster]
(
    [Id],
    [FloorCode],
    [Description],
    [SequenceNo],
    [MaxFloorNo],
    [IsProtected]
)
VALUES
(1,  N'B',  N'à¤¤à¤³à¤˜à¤°',                    1,  1,  1),
(3,  N'L',  N'à¤²à¥‹à¤…à¤° à¤¤à¤³à¤®à¤œà¤²à¤¾',             2,  3,  1),
(2,  N'G',  N'à¤¤à¤³à¤®à¤œà¤²à¤¾',                   3,  2,  1),
(4,  N'M',  N'à¤ªà¥‹à¤Ÿà¤®à¤¾à¤³à¤¾',                  0,  4,  1),

(13, N'1',  N'à¤ªà¤¹à¤¿à¤²à¤¾ à¤®à¤œà¤²à¤¾',              12, 13, 1),
(11, N'U1', N'à¤…à¤ªà¥à¤ªà¤° à¤—à¥à¤°à¤¾à¤Šà¤‚à¤¡ à¤ªà¤¹à¤¿à¤²à¤¾',      4, 11, 1),
(14, N'2',  N'à¤¦à¥à¤¸à¤°à¤¾ à¤®à¤œà¤²à¤¾',              13, 14, 1),
(12, N'U2', N'à¤…à¤ªà¥à¤ªà¤° à¤—à¥à¤°à¤¾à¤Šà¤‚à¤¡ à¤¦à¥à¤¸à¤°à¤¾',      5, 12, 1),
(15, N'3',  N'à¤¤à¤¿à¤¸à¤°à¤¾ à¤®à¤œà¤²à¤¾',              14, 15, 1),
(16, N'4',  N'à¤šà¥Œà¤¥à¤¾ à¤®à¤œà¤²à¤¾',               15, 16, 1),
(17, N'5',  N'à¤ªà¤¾à¤šà¤µà¤¾ à¤®à¤œà¤²à¤¾',              16, 17, 1),
(18, N'6',  N'à¤¸à¤¹à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',              17, 18, 1),
(19, N'7',  N'à¤¸à¤¾à¤¤à¤µà¤¾ à¤®à¤œà¤²à¤¾',              18, 19, 1),
(20, N'8',  N'à¤†à¤ à¤µà¤¾ à¤®à¤œà¤²à¤¾',               19, 20, 1),
(21, N'9',  N'à¤¨à¤µà¤µà¤¾ à¤®à¤œà¤²à¤¾',               20, 21, 1),
(22, N'10', N'à¤¦à¤¹à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',              21, 22, 1),
(23, N'11', N'à¤…à¤•à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             22, 23, 1),
(24, N'12', N'à¤¬à¤¾à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             23, 24, 1),
(25, N'13', N'à¤¤à¥‡à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             24, 25, 1),
(26, N'14', N'à¤šà¥Œà¤¦à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             25, 26, 1),
(27, N'15', N'à¤ªà¤‚à¤§à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',            26, 27, 1),
(28, N'16', N'à¤¸à¥‹à¤³à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             27, 28, 1),
(29, N'17', N'à¤¸à¤¤à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             28, 29, 1),
(30, N'18', N'à¤…à¤ à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             29, 30, 1),
(31, N'19', N'à¤à¤•à¥‹à¤£à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          30, 31, 1),
(32, N'20', N'à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             31, 32, 1),
(33, N'21', N'à¤à¤•à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           32, 33, 1),
(34, N'22', N'à¤¬à¤¾à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           33, 34, 1),
(35, N'23', N'à¤¤à¥‡à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           34, 35, 1),
(36, N'24', N'à¤šà¥‹à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           35, 36, 1),
(37, N'25', N'à¤ªà¤‚à¤šà¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          36, 37, 1),
(38, N'26', N'à¤¸à¤µà¥à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          37, 38, 1),
(39, N'27', N'à¤¸à¤¤à¥à¤¤à¤¾à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        38, 39, 1),
(40, N'28', N'à¤…à¤ à¥à¤ à¤¾à¤µà¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        39, 40, 1),
(41, N'29', N'à¤à¤•à¥‹à¤£à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         40, 41, 1),
(42, N'30', N'à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             41, 42, 1),
(43, N'31', N'à¤à¤•à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           42, 43, 1),
(44, N'32', N'à¤¬à¤¤à¥à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          43, 44, 1),
(45, N'33', N'à¤¤à¥‡à¤¤à¥à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         44, 45, 1),
(46, N'34', N'à¤šà¥Œà¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           45, 46, 1),
(47, N'35', N'à¤ªà¤¸à¥à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          46, 47, 1),
(48, N'36', N'à¤›à¤¤à¥à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          47, 48, 1),
(49, N'37', N'à¤¸à¤¦à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           48, 49, 1),
(50, N'38', N'à¤…à¤¡à¤¤à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           49, 50, 1),
(51, N'39', N'à¤à¤•à¥‹à¤£à¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',       50, 51, 1),
(52, N'40', N'à¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           51, 52, 1),
(53, N'41', N'à¤à¤•à¥‡à¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        52, 53, 1),
(54, N'42', N'à¤¬à¥‡à¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         53, 54, 1),

(56, N'44', N'à¤šà¥Œà¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         55, 56, 1),
(60, N'48', N'à¤…à¤ à¥à¤ à¥‡à¤šà¤¾à¤³à¤¿à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',      59, 60, 1),
(62, N'50', N'à¤ªà¤¨à¥à¤¨à¤¾à¤¸à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          61, 62, 1),
(63, N'51', N'à¤à¤•à¤¾à¤µà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         62, 63, 1),
(64, N'52', N'à¤¬à¤¾à¤µà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          63, 64, 1),
(65, N'53', N'à¤¤à¥à¤°à¥‡à¤ªà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        64, 65, 1),
(66, N'54', N'à¤šà¥Œà¤ªà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          65, 66, 1),
(67, N'55', N'à¤ªà¤‚à¤šà¤¾à¤µà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        66, 67, 1),
(68, N'56', N'à¤›à¤ªà¥à¤ªà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         67, 68, 1),
(69, N'57', N'à¤¸à¤¤à¥à¤¤à¤¾à¤µà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',       68, 69, 1),
(70, N'58', N'à¤…à¤ à¥à¤ à¤¾à¤µà¤¨à¥à¤¨à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',       69, 70, 1),
(71, N'59', N'à¤à¤•à¥‹à¤£à¤¸à¤¾à¤ à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         70, 71, 1),
(72, N'60', N'à¤¸à¤¾à¤ à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',             71, 72, 1),
(73, N'61', N'à¤à¤•à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          72, 73, 1),
(75, N'63', N'à¤¤à¥à¤°à¥‡à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',        73, 75, 1),
(76, N'64', N'à¤šà¥Œà¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          74, 76, 1),
(77, N'65', N'à¤ªà¤¾à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',          75, 77, 1),
(78, N'66', N'à¤¸à¤¹à¤¾à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         76, 78, 1),
(79, N'67', N'à¤¸à¤¦à¥à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         77, 79, 1),
(80, N'68', N'à¤…à¤¡à¥à¤¸à¤·à¥à¤Ÿà¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',         78, 80, 1),
(81, N'69', N'à¤à¤•à¥‹à¤£à¤¸à¤¤à¥à¤¤à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',       79, 81, 1),
(82, N'70', N'à¤¸à¤¤à¥à¤¤à¤°à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾',           80, 82, 1),

(5,  N'P1', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®1',                  6,  5, 1),
(6,  N'P2', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®2',                  7,  6, 1),
(7,  N'P3', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®3',                  8,  7, 1),
(8,  N'P4', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®4',                  9,  8, 1),
(9,  N'P5', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®5',                 10,  9, 1),
(10, N'P6', N'à¤ªà¥‹à¤¡à¤¿à¤¯à¤®6',                 11, 10, 1),

(83, N'OP', N'Open Plot',                 83,  0, 1);
GO

SET IDENTITY_INSERT [PTIS].[FloorMaster] OFF;
GO

;WITH Seed(FloorCode, FactorWithLift, FactorWithoutLift, CreatedBy, UpdatedBy, UpdatedDate) AS
(
    SELECT * FROM (VALUES
      (N'G', 1.00, 1.00, NULL, NULL, NULL),
      (N'1', 1.00, 1.00, NULL, NULL, NULL),
      (N'2', 1.00, 1.00, NULL, NULL, NULL),
      (N'3', 1.00, 1.00, NULL, NULL, NULL),
      (N'4', 1.00, 1.00, NULL, NULL, NULL),
      (N'5', 1.00, 1.00, NULL, NULL, NULL),
      (N'6', 1.00, 1.00, NULL, NULL, NULL),
      (N'7', 1.00, 1.00, NULL, NULL, NULL),
      (N'8', 1.00, 1.00, NULL, NULL, NULL),
      (N'B', 1.00, 1.00, NULL, NULL, NULL),
      (N'9', 1.00, 1.00, NULL, NULL, NULL),
      (N'10',1.00, 1.00, NULL, NULL, NULL),
      (N'11',1.00, 1.00, NULL, NULL, NULL),
      (N'12',1.00, 1.00, NULL, NULL, NULL),
      (N'13',1.00, 1.00, NULL, NULL, NULL),
      (N'14',1.00, 1.00, NULL, NULL, NULL),
      (N'M', 1.00, 1.00, NULL, NULL, NULL),
      (N'15',1.00, 1.00, NULL, NULL, NULL),
      (N'16',1.00, 1.00, NULL, NULL, NULL),
      (N'17',1.00, 1.00, NULL, NULL, NULL),
      (N'18',1.00, 1.00, NULL, NULL, NULL),
      (N'19',1.00, 1.00, NULL, NULL, NULL),
      (N'20',1.00, 1.00, NULL, NULL, NULL),
      (N'21',1.00, 1.00, NULL, NULL, NULL),
      (N'22',1.00, 1.00, NULL, NULL, NULL),
      (N'23',1.00, 1.00, NULL, NULL, NULL),
      (N'24',1.00, 1.00, NULL, NULL, NULL),
      (N'25',1.00, 1.00, NULL, NULL, NULL),
      (N'26',1.00, 1.00, NULL, NULL, NULL),
      (N'27',1.00, 1.00, NULL, NULL, NULL),
      (N'28',1.00, 1.00, NULL, NULL, NULL),
      (N'29',1.00, 1.00, NULL, NULL, NULL),
      (N'30',1.00, 1.00, NULL, NULL, NULL),
      (N'31',1.00, 1.00, NULL, NULL, NULL),
      (N'32',1.00, 1.00, NULL, NULL, NULL),
      (N'OP',1.00, 1.00, NULL, NULL, NULL),
      (N'33',1.00, 1.00, NULL, NULL, NULL),
      (N'34',1.00, 1.00, NULL, NULL, NULL),
      (N'35',1.00, 1.00, NULL, NULL, NULL),
      (N'36',1.00, 1.00, NULL, NULL, NULL),
      (N'37',1.00, 1.00, NULL, NULL, NULL),
      (N'38',1.00, 1.00, NULL, NULL, NULL),
      (N'39',1.00, 1.00, NULL, NULL, NULL),
      (N'40',1.00, 1.00, NULL, NULL, NULL)
    ) v(FloorCode, FactorWithLift, FactorWithoutLift, CreatedBy, UpdatedBy, UpdatedDate)
)

INSERT INTO PTIS.FloorFactorCVMaster
(
    FloorId,
    YearRangeCVId,
    FactorWithLift,
    FactorWithoutLift,
    CreatedBy,
    UpdatedBy,
    UpdatedDate
)
SELECT
    f.Id,
    yr.Id,
    s.FactorWithLift,
    s.FactorWithoutLift,
    s.CreatedBy,
    s.UpdatedBy,
    s.UpdatedDate
FROM Seed s
JOIN PTIS.FloorMaster f
    ON f.FloorCode = s.FloorCode
JOIN PTIS.AssessmentYearRangeMasterCV yr
    ON yr.Id=1

;WITH N AS
(
    SELECT TOP (100)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RoomNo
    FROM sys.all_objects
)
INSERT INTO PTIS.RoomNoCountMaster (RoomNo)
SELECT n.RoomNo
FROM N n
WHERE NOT EXISTS (
    SELECT 1
    FROM PTIS.RoomNoCountMaster x
    WHERE x.RoomNo = n.RoomNo
);



INSERT INTO PTIS.AgeFactorCVMaster
(ConstructionTypeId, AgeFrom, AgeTo, Factor, YearRangeCVId, IsActive, CreatedBy, CreatedDate)
SELECT
    ct.Id,
    v.AgeFrom,
    v.AgeTo,
    v.Factor,
    yr.Id,
    1,
    NULL,
    GETDATE()
FROM (VALUES
 ('A',0,5,1.00),('A',6,10,0.95),('A',11,15,0.90),('A',16,20,0.85),('A',21,25,0.80),
 ('A',26,30,0.75),('A',31,40,0.70),('A',41,50,0.65),('A',51,999,0.60),

 ('B',0,5,0.95),('B',6,10,0.90),('B',11,15,0.85),('B',16,20,0.80),('B',21,25,0.75),
 ('B',26,30,0.70),('B',31,40,0.65),('B',41,50,0.60),('B',51,999,0.55),

 ('C',0,5,0.90),('C',6,10,0.85),('C',11,15,0.80),('C',16,20,0.75),('C',21,25,0.70),
 ('C',26,30,0.65),('C',31,40,0.60),('C',41,50,0.55),('C',51,999,0.50)
) v(ConstructionCode, AgeFrom, AgeTo, Factor)

JOIN PTIS.ConstructionTypeMaster ct
    ON ct.ConstructionCode = v.ConstructionCode

JOIN PTIS.AssessmentYearRangeMasterCV yr
    ON yr.Id = 1;




;WITH Seed(ConstructionCode, Factor, Code, CreatedBy, UpdatedBy, UpdatedDate) AS
(
    SELECT * FROM (VALUES
      (N'A',   1.00, NULL, NULL, NULL, NULL),

      (N'B',   0.80, NULL, NULL, NULL, NULL),
      (N'C',   0.70, NULL, NULL, NULL, NULL),
      (N'D',   0.60, NULL, NULL, NULL, NULL),
      (N'E',   0.60, NULL, NULL, NULL, NULL),

      (N'AR',  1.00, NULL, NULL, NULL, NULL),
      (N'BR',  0.80, NULL, NULL, NULL, NULL),
      (N'CR',  0.70, NULL, NULL, NULL, NULL),
      (N'DR',  0.60, NULL, NULL, NULL, NULL),
      (N'ER',  0.60, NULL, NULL, NULL, NULL),

      (N'WA',  1.00, NULL, NULL, NULL, NULL),
      (N'WB',  0.80, NULL, NULL, NULL, NULL),
      (N'WC',  0.70, NULL, NULL, NULL, NULL),
      (N'WD',  0.60, NULL, NULL, NULL, NULL),
      (N'WE',  0.60, NULL, NULL, NULL, NULL),

      (N'A1',  1.50, NULL, NULL, NULL, NULL),
      (N'B1',  1.30, NULL, NULL, NULL, NULL),
      (N'C1',  1.00, NULL, NULL, NULL, NULL),

      (N'WA1', 1.50, NULL, NULL, NULL, NULL),
      (N'WB1', 1.30, NULL, NULL, NULL, NULL),
      (N'WC1', 1.00, NULL, NULL, NULL, NULL)


    ) v(ConstructionCode, Factor, Code, CreatedBy, UpdatedBy, UpdatedDate)
)

INSERT INTO PTIS.NatureFactorCVMaster
(
    ConstructionTypeId,
    YearRangeCVId,
    Factor,
    CreatedBy,
    UpdatedBy,
    UpdatedDate
)
SELECT
    cm.Id,
    yr.Id,
    s.Factor,
    s.CreatedBy,
    s.UpdatedBy,
    s.UpdatedDate
FROM Seed s
JOIN PTIS.ConstructionTypeMaster cm
    ON cm.ConstructionCode = s.ConstructionCode
JOIN PTIS.AssessmentYearRangeMasterCV yr
    ON yr.Id=1



INSERT INTO PTIS.UseFactorCVMaster
(
    TypeOfUseId,
    SubTypeOfUseId,
    Factor,
    YearRangeCVId,
    IsActive,
    CreatedBy,
    CreatedDate
)
SELECT
    tu.Id,
    stu.Id,
    1.00 AS Factor,
    yr.Id,
    1,
    NULL,
    GETDATE()
FROM PTIS.TypeOfUseMaster tu
JOIN PTIS.SubTypeOfUseMaster stu
    ON stu.Id = tu.Id
JOIN PTIS.AssessmentYearRangeMasterCV yr
    ON yr.Id = 1
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.UseFactorCVMaster u
    WHERE u.TypeOfUseId = tu.Id
      AND u.SubTypeOfUseId = stu.Id
);




;WITH Seed(TypeOfUseCode,  [Description]) AS
(
    SELECT * FROM (VALUES
      (N'OPK',   N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—'),
      (N'SPK',  N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—'),
      (N'OPKC',  N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€'),
      (N'SPKC',  N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€'),
      (N'OPKI',  N'à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•'),
      (N'SPKI',  N'à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•')
    ) v(TypeOfUseCode,  [Description])
)
INSERT INTO PTIS.ParkingTypeMaster (TypeOfUseId, [Description])
SELECT tou.Id,  s.[Description]
FROM Seed s
JOIN PTIS.TypeOfUseMaster tou
  ON tou.TypeOfUseCode = s.TypeOfUseCode
WHERE NOT EXISTS (
    SELECT 1
    FROM PTIS.ParkingTypeMaster x
    WHERE x.TypeOfUseId = tou.Id

      AND x.[Description] = s.[Description]
);








SET IDENTITY_INSERT [PTIS].[SubFloorMaster] ON;
GO

INSERT INTO [PTIS].[SubFloorMaster]
(
    [Id],
    [SubFloorCode],
    [Description],
    [SubFloorPercentage],
    [IsProtected]
)
VALUES
(1, N'Loft',      N'LOFT',      50.00, 1),
(2, N'Attic',     N'ATTIC',     50.00, 1),
(3, N'Mezzanine', N'MEZZANINE', 70.00, 1);
GO

SET IDENTITY_INSERT [PTIS].[SubFloorMaster] OFF;
GO






INSERT [PTIS].[TaxZoneMaster] ([TaxZoneNo], [TaxZoneType], [Remark], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
  (N'1', N'1', N'A', NULL, NULL, NULL),
  (N'2', N'2', N'B', NULL, NULL, NULL),
  (N'3', N'3', N'C', NULL, NULL, NULL),
  (N'Z', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL),
  (N'1U', N'1U', N'AU', NULL, NULL, NULL),
  (N'2U', N'2U', N'BU', NULL, NULL, NULL),
  (N'3U', N'3U', N'CU', NULL, NULL, NULL);



;WITH S(RateSectionNo, [Description]) AS
(
  SELECT * FROM (VALUES
   (N'1',N'UTHALSAR'),(N'2',N'NAUPADA'),(N'3',N'KOPRI'),(N'4',N'KALWA'),
   (N'5',N'VITAVA'),(N'6',N'KHAREGAON'),(N'7',N'MUMBRA'),(N'8',N'KAUSA'),
   (N'9',N'SHIL'),(N'10',N'DIVA'),(N'11',N'WAGLE'),(N'12',N'VARTAK'),
   (N'13',N'MAJIWADA'),(N'14',N'BALKUM'),(N'15',N'MANPADA'),(N'16',N'KOLSHET'),
   (N'17',N'OWALA')
  ) v(RateSectionNo,[Description])
)
INSERT INTO PTIS.RateSectionMaster (RateSectionNo, [Description])
SELECT s.RateSectionNo, s.[Description]
FROM S s
WHERE NOT EXISTS (
  SELECT 1 FROM PTIS.RateSectionMaster x
  WHERE x.Id = s.RateSectionNo
);





;WITH Seed AS
(
    SELECT

        v.TaxZoneNo,
        v.ConstructionCode,
        v.UseGroupCode,
        v.RateSquareMeter,
        v.RateSquareFeet,
        v.RateRemark,
        v.Col8,
        v.Col9,
        v.Col10,
        v.RateType,
        v.MinYear,
        v.MaxYear,
        v.RateSectionCode,
        v.OldId
    FROM (VALUES
     ( N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824357),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824358),
( N'1', N'A', N'C', 1020.4300, 10983.9085, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824359),
( N'1', N'A', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824360),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824361),
( N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824362),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824363),
( N'1', N'B', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824364),
( N'1', N'B', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824365),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824366),
( N'1', N'A', N'C', 1130.2200, 12165.6881, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824367),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824368),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824369),
( N'1', N'A', N'C', 807.3000, 8689.7772, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824370),
( N'1', N'B', N'C', 807.3000, 8689.7772, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824371),
( N'1', N'C', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824372),
( N'1', N'D', N'C', 406.8800, 4379.6563, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824373),
( N'1', N'E', N'C', 406.8800, 4379.6563, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824374),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824375),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824376),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824377),
( N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824378),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824379),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824380),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824381),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824382),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824383),
( N'1', N'C', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824384),
( N'1', N'D', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824385),
( N'1', N'E', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824386),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824387),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824388),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824389),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824390),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824391),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824392),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824393),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824394),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824395),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824396),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824397),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824398),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824399),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824400),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824401),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824402),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824403),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824404),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824405),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824406),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824407),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824408),
( N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824409),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2824410),
( N'1', N'A', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824411),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2824412),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824413),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2824414),
( N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824415),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824416),
( N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824417),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2824418),
( N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2824419),
( N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824420),
( N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824421),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824422),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824423),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824424),
( N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824425),
( N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824426),
( N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824427),
( N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824428),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824429),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824430),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824431),
( N'1', N'B', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824432),
( N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824433),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824971),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824972),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824973),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824974),
( N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824975),
( N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824976),
( N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824977),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824978),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824979),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824980),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824981),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824982),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824983),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824984),
( N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824985),
( N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824986),
( N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824987),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824988),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824989),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824990),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824991),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824992),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824993),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824994),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824995),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824996),
( N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824997),
( N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824998),
( N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824999),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825000),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825001),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825002),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825003),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825004),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825005),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825006),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825007),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825008),
( N'1', N'A', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825009),
( N'1', N'B', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825010),
( N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825011),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825012),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825013),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825014),
( N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825015),
( N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825016),
( N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825017),
( N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825018),
( N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825019),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825020),
( N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825021),
( N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825022),
( N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825023),
( N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825024),
( N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825025),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825026),
( N'1', N'A', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825027),
( N'1', N'B', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825028),
( N'1', N'C', N'R', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825029),
( N'1', N'D', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825030),
( N'1', N'E', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825031),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825032),
( N'1', N'A', N'C', 1207.7200, 12999.8981, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825033),
( N'1', N'B', N'C', 1207.7200, 12999.8981, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825034),
( N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825035),
( N'1', N'D', N'C', 607.0900, 6534.7168, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825036),
( N'1', N'E', N'C', 607.0900, 6534.7168, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825037),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825038),
( N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825039),
( N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825040),
( N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825041),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825042),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825043),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825044),
( N'1', N'A', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825045),
( N'1', N'B', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825046),
( N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824434),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824435),
( N'1', N'A', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824436),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824437),
( N'1', N'B', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824438),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824439),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824440),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824441),
( N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824442),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824443),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824444),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824445),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824446),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824447),
( N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824448),
( N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824449),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824450),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824451),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824452),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824453),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824454),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824455),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824456),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824457),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824458),
( N'1', N'B', N'R', 213.1300, 2294.1313, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824459),
( N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824460),
( N'1', N'D', N'R', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824461),
( N'1', N'E', N'R', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824462),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824463),
( N'1', N'A', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824464),
( N'1', N'B', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824465),
( N'1', N'C', N'C', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824466),
( N'1', N'D', N'C', 310.0000, 3336.8400, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824467),
( N'1', N'E', N'C', 310.0000, 3336.8400, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824468),
( N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824469),
( N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824470),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824471),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824472),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824473),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824474),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824475),
( N'1', N'C', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824476),
( N'1', N'D', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824477),
( N'1', N'E', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824478),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824479),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824480),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824481),
( N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824482),
( N'1', N'D', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824483),
( N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824484),
( N'1', N'E', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824485),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824486),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824487),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824488),
( N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824489),
( N'1', N'A', N'R', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824490),
( N'1', N'C', N'C', 678.1300, 7299.3913, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824491),
( N'1', N'B', N'R', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824492),
( N'1', N'D', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824493),
( N'1', N'E', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824494),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2824495),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824496),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824497),
( N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824498),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824499),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824500),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824501),
( N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824502),
( N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824503),
( N'1', N'D', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824504),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824505),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824506),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824507),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824508),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824509),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824510),
( N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825047),
( N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825048),
( N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825049),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825050),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825051),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825052),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825053),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825054),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825055),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825056),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825057),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825058),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825059),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825060),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825061),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825062),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825063),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825064),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825065),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825066),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825067),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825068),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825069),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825070),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825071),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825072),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825073),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825074),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825075),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825076),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825077),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825078),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825079),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825080),
( N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825081),
( N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825082),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825083),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825084),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825085),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825086),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825087),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825088),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825089),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825090),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825091),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825092),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825093),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825094),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825095),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825096),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825097),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825098),
( N'1', N'A', N'R', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825099),
( N'1', N'B', N'R', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825100),
( N'1', N'C', N'R', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825101),
( N'1', N'D', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825102),
( N'1', N'E', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825103),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825104),
( N'1', N'A', N'C', 800.8400, 8620.2418, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825105),
( N'1', N'B', N'C', 800.8400, 8620.2418, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825106),
( N'1', N'C', N'C', 477.9200, 5144.3309, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825107),
( N'1', N'D', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825108),
( N'1', N'E', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825109),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825110),
( N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825111),
( N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825112),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825113),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825114),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825115),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825116),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825117),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825118),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825119),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825120),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825121),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825122),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824511),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824512),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824513),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824514),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824515),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824516),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824517),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824518),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824519),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824520),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824521),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824522),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824523),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824524),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824525),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824526),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824527),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824528),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824529),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824530),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824531),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824532),
( N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824533),
( N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824534),
( N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824535),
( N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824536),
( N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824537),
( N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824538),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824539),
( N'1', N'A', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824540),
( N'1', N'B', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824541),
( N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824542),
( N'1', N'D', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824543),
( N'1', N'A', N'C', 1420.8500, 15294.0294, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824544),
( N'1', N'B', N'C', 1420.8500, 15294.0294, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824545),
( N'1', N'C', N'C', 852.5100, 9176.4176, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824546),
( N'1', N'D', N'C', 710.4200, 7646.9609, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824547),
( N'1', N'E', N'C', 710.4200, 7646.9609, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824548),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824549),
( N'1', N'A', N'R', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824550),
( N'1', N'B', N'R', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824551),
( N'1', N'C', N'R', 245.4200, 2641.7009, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824552),
( N'1', N'D', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824553),
( N'1', N'E', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824554),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824555),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2824556),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824557),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824558),
( N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824559),
( N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824560),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824561),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824562),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824563),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824564),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824565),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824566),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824567),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824568),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824569),
( N'1', N'B', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824570),
( N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824571),
( N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824572),
( N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824573),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824574),
( N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824575),
( N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824576),
( N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824577),
( N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824578),
( N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824579),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824580),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824581),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824582),
( N'1', N'C', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824583),
( N'1', N'D', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824584),
( N'1', N'E', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824585),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824586),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824587),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825123),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825124),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825125),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825126),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825127),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825128),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825129),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825130),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825131),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825132),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825133),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825134),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825135),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825136),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825137),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825138),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825139),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825140),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825141),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825142),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825143),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825144),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825145),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825146),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825147),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825148),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825149),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825150),
( N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825151),
( N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825152),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825153),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825154),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825155),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825156),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825157),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825158),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825159),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825160),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825161),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825162),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825163),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825164),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825165),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825166),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825167),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825168),
( N'1', N'B', N'R', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825169),
( N'1', N'C', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825170),
( N'1', N'D', N'R', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825171),
( N'1', N'E', N'R', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825172),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825173),
( N'1', N'A', N'R', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825174),
( N'1', N'B', N'C', 1110.8400, 11957.0818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825175),
( N'1', N'C', N'C', 671.6700, 7229.8559, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825176),
( N'1', N'D', N'C', 555.4200, 5978.5409, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825177),
( N'1', N'E', N'C', 555.4200, 5978.5409, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825178),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825179),
( N'1', N'A', N'C', 1110.8400, 11957.0818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825180),
( N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825181),
( N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825182),
( N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825183),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825184),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825185),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825186),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825187),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825188),
( N'1', N'A', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825189),
( N'1', N'B', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825190),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825191),
( N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825192),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825193),
( N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825194),
( N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825195),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825196),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825197),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825198),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824588),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824589),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824590),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824591),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824592),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824593),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824594),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824595),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824596),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824597),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824598),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824599),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824600),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824601),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824602),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824603),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824604),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824605),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824606),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824607),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824608),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824609),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824610),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824611),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824612),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824613),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824614),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824615),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824616),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824617),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824618),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824619),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824620),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824621),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824622),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824623),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824624),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824625),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824626),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824627),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824628),
( N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824629),
( N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824630),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824631),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824632),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824633),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824634),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824635),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824636),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824637),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824638),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824639),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824640),
( N'1', N'A', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824641),
( N'1', N'B', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824642),
( N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824643),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824644),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824645),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824646),
( N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824647),
( N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824648),
( N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824649),
( N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824650),
( N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824651),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824652),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824653),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824654),
( N'1', N'C', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824655),
( N'1', N'D', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824656),
( N'1', N'E', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824657),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824658),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824659),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824660),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824661),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824662),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824663),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824664),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825199),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825200),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825201),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825202),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825203),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825204),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825205),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825206),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825207),
( N'1', N'C', N'C', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825208),
( N'1', N'D', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825209),
( N'1', N'E', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825210),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825211),
( N'1', N'A', N'R', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825212),
( N'1', N'B', N'R', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825213),
( N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825214),
( N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825215),
( N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825216),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825217),
( N'1', N'A', N'C', 794.3800, 8550.7063, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825218),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825219),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825220),
( N'1', N'B', N'C', 794.3800, 8550.7063, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825221),
( N'1', N'C', N'C', 477.9200, 5144.3309, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825222),
( N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825223),
( N'1', N'D', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825224),
( N'1', N'E', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825225),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825226),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825227),
( N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825228),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825229),
( N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825230),
( N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825231),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825232),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825233),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825234),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825235),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825236),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825237),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825238),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825239),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825240),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825241),
( N'1', N'A', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825242),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825243),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825244),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825245),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825246),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825247),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825248),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825249),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825250),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825251),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825252),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825253),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825254),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825255),
( N'1', N'E', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2825256),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2825257),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825258),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825259),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825260),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825261),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825262),
( N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2825263),
( N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825264),
( N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825265),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825266),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825267),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825268),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825269),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825270),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2825271),
( N'1', N'A', N'R', 213.1300, 2294.1313, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2825272),
( N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825273),
( N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825274),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824665),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824666),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824667),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824668),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824669),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824670),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824671),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824672),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824673),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824674),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824675),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824676),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824677),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824678),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824679),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824680),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824681),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824682),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824683),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824684),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824685),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824686),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824687),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824688),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824689),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824690),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824691),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824692),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824693),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824694),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824695),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824696),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824697),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824698),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824699),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824700),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824701),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824702),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824703),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824704),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824705),
( N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824706),
( N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824707),
( N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824708),
( N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824709),
( N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824710),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824711),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824712),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824713),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824714),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824715),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824716),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824717),
( N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824718),
( N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824719),
( N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824720),
( N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824721),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824722),
( N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824723),
( N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824724),
( N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824725),
( N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824726),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824727),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824728),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824729),
( N'1', N'A', N'C', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824730),
( N'1', N'B', N'C', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824731),
( N'1', N'C', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824732),
( N'1', N'D', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824733),
( N'1', N'E', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824734),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824735),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824736),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824737),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824738),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824739),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824740),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824741),
( N'1', N'B', N'C', 1130.2200, 12165.6881, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2825275),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825276),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825277),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2825278),
( N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2825279),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2825280),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2825281),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2825282),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2825283),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2825284),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2825285),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825286),
( N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825287),
( N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825288),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825289),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825290),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825291),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825292),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825293),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825294),
( N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825295),
( N'1', N'A', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825296),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2825297),
( N'1', N'B', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825298),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825299),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825300),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825301),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825302),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825303),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825304),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825305),
( N'1', N'A', N'C', 355.2100, 3823.4804, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825306),
( N'1', N'B', N'C', 355.2100, 3823.4804, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825307),
( N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825308),
( N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825309),
( N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825310),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825311),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825312),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825313),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825314),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825315),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825316),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825317),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825318),
( N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825319),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825320),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825321),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825322),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825323),
( N'1', N'C', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825324),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825325),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825326),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825327),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825328),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825329),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825330),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825331),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825332),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825333),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825334),
( N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825335),
( N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825336),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825337),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825338),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825339),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825340),
( N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825341),
( N'1', N'C', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825342),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825343),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825344),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825345),
( N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825346),
( N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825347),
( N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825348),
( N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825349),
( N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825350),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825351),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824742),
( N'1', N'C', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824743),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824744),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824745),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824746),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824747),
( N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824748),
( N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824749),
( N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824750),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824751),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824752),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824753),
( N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824754),
( N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824755),
( N'1', N'C', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824756),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824757),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824758),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824759),
( N'1', N'A', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824760),
( N'1', N'B', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824761),
( N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824762),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824763),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824764),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824765),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824766),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824767),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824768),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824769),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824770),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824771),
( N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824772),
( N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824773),
( N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824774),
( N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824775),
( N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824776),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824777),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824778),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824779),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824780),
( N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824781),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824782),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824783),
( N'1', N'B', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824784),
( N'1', N'C', N'C', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824785),
( N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824786),
( N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824787),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824788),
( N'1', N'A', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824789),
( N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824790),
( N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824791),
( N'1', N'C', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824792),
( N'1', N'D', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824793),
( N'1', N'E', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824794),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824795),
( N'1', N'B', N'C', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824796),
( N'1', N'C', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824797),
( N'1', N'D', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824798),
( N'1', N'E', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824799),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824800),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824801),
( N'1', N'A', N'C', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824802),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824803),
( N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824804),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824805),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824806),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824807),
( N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824808),
( N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824809),
( N'1', N'C', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824810),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824811),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824812),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824813),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824814),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824815),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824816),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824817),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824818),
( N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825352),
( N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825353),
( N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825354),
( N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825355),
( N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825356),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825357),
( N'1', N'A', N'C', 968.7600, 10427.7326, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825358),
( N'1', N'B', N'C', 968.7600, 10427.7326, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825359),
( N'1', N'C', N'C', 581.2600, 6256.6826, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825360),
( N'1', N'D', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825361),
( N'1', N'E', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825362),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825363),
( N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825364),
( N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825365),
( N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825366),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825367),
( N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825368),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825369),
( N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825370),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825371),
( N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825372),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825373),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825374),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825375),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825376),
( N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825377),
( N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825378),
( N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825379),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825380),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825381),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825382),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825383),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825384),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825385),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825386),
( N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825387),
( N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825388),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825389),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825390),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825391),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825392),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825393),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825394),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825395),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825396),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825397),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825398),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825399),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825400),
( N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825401),
( N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825402),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825403),
( N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825404),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825405),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825406),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825407),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825408),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825409),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825410),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825411),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825412),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825413),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825414),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825415),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825416),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825417),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825418),
( N'1', N'B', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825419),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825420),
( N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825421),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825422),
( N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825423),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825424),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825425),
( N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825426),
( N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825427),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825428),
( N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824819),
( N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824820),
( N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824821),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824822),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824823),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824824),
( N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824825),
( N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824826),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824827),
( N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824828),
( N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824829),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824830),
( N'1', N'A', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824831),
( N'1', N'B', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824832),
( N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824833),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824834),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824835),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824836),
( N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824837),
( N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824838),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824839),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824840),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824841),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824842),
( N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824843),
( N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824844),
( N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824845),
( N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824846),
( N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824847),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824848),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824849),
( N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824850),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824851),
( N'1', N'D', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824852),
( N'1', N'E', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824853),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824854),
( N'1', N'A', N'C', 348.7500, 3753.9450, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824855),
( N'1', N'B', N'C', 348.7500, 3753.9450, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824856),
( N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824857),
( N'1', N'D', N'C', 174.3800, 1877.0263, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824858),
( N'1', N'E', N'C', 174.3800, 1877.0263, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824859),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824860),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824861),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824862),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824863),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824864),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824865),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824866),
( N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824867),
( N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824868),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824869),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824870),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824871),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824872),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824873),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824874),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824875),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824876),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824877),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824878),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824879),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824880),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824881),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824882),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824883),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824884),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824885),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824886),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824887),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824888),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824889),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824890),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824891),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824892),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824893),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824894),
( N'1', N'A', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825429),
( N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825430),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825431),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825432)
    ) AS v(

        TaxZoneNo,
        ConstructionCode,
        UseGroupCode,
        RateSquareMeter,
        RateSquareFeet,
        RateRemark,
        Col8,
        Col9,
        Col10,
        RateType,
        MinYear,
        MaxYear,
        RateSectionCode,
        OldId
    )
)



INSERT INTO PTIS.RateMaster
(

    TaxZoneId,
    FloorId,
    ConstructionTypeId,
    TypeOfUseGroupId,
    YearRangeRVId,
    RateSquareMeter,
    RateSquareFeet,
    RateSectionId,
    RateRemark,
    CreatedBy,
    UpdatedBy,
    UpdatedDate
)


SELECT


    tz.Id,
    f.Id,
    ct.Id,
    ug.Id,
    yr.Id,
    CAST(s.RateSquareMeter AS money),
    CAST(s.RateSquareFeet  AS money),
    rs.Id,
    s.RateRemark,
    NULL, NULL, NULL
FROM Seed s
JOIN PTIS.TaxZoneMaster tz
    ON tz.TaxZoneNo = s.TaxZoneNo
JOIN PTIS.FloorMaster f
    ON f.FloorCode = 'G'
JOIN PTIS.ConstructionTypeMaster ct
    ON ct.ConstructionCode = s.ConstructionCode
JOIN PTIS.TypeOfUseGroupMaster ug
    ON ug.TypeOfUseGroupCode = s.UseGroupCode
JOIN PTIS.RateSectionMaster rs
    ON rs.RateSectionNo = s.RateSectionCode
JOIN PTIS.AssessmentYearRangeMasterRV yr
    ON yr.FromYear = s.MinYear AND yr.ToYear = s.MaxYear;




	;WITH Seed AS
(
    SELECT

        v.TaxZoneNo,
        v.ConstructionCode,
        v.UseGroupCode,
        v.RateSquareMeter,
        v.RateSquareFeet,
        v.RateRemark,
        v.Col8,
        v.Col9,
        v.Col10,
        v.RateType,
        v.MinYear,
        v.MaxYear,
        v.RateSectionId,
        v.OldId
    FROM (VALUES
    ( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825433),
( N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825434),
( N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825435),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825436),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825437),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825438),
( N'1', N'E', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2825439),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825440),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2825441),
( N'1', N'A', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2825442),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825443),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825444),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825445),
( N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825446),
( N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825447),
( N'1', N'C', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825448),
( N'1', N'D', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825449),
( N'1', N'E', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825450),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825451),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825452),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825453),
( N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825454),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825455),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825456),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825457),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825458),
( N'1', N'A', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825459),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825460),
( N'1', N'B', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825461),
( N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825462),
( N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825463),
( N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825464),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825465),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825466),
( N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825467),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825468),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825469),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825470),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825471),
( N'1', N'A', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825472),
( N'1', N'B', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825473),
( N'1', N'C', N'C', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825474),
( N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825475),
( N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825476),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825477),
( N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825478),
( N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825479),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825480),
( N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825481),
( N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825482),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825483),
( N'1', N'A', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825484),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825485),
( N'1', N'B', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825486),
( N'1', N'C', N'C', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825487),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825488),
( N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825489),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825490),
( N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825491),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825492),
( N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825493),
( N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825494),
( N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825495),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825496),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825497),
( N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825498),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825499),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825500),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825501),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825502),
( N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825503),
( N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825504),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824895),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824896),
( N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824897),
( N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824898),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824899),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824900),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824901),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824902),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824903),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824904),
( N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824905),
( N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824906),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824907),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824908),
( N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824909),
( N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824910),
( N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824911),
( N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824912),
( N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824913),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824914),
( N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824915),
( N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824916),
( N'1', N'C', N'C', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824917),
( N'1', N'D', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824918),
( N'1', N'E', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824919),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824920),
( N'1', N'A', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824921),
( N'1', N'B', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824922),
( N'1', N'C', N'R', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824923),
( N'1', N'D', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824924),
( N'1', N'E', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824925),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824926),
( N'1', N'A', N'C', 936.4700, 10080.1631, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824927),
( N'1', N'B', N'C', 936.4700, 10080.1631, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824928),
( N'1', N'C', N'C', 561.8800, 6048.0763, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824929),
( N'1', N'D', N'C', 471.4600, 5074.7954, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824930),
( N'1', N'E', N'C', 471.4600, 5074.7954, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824931),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824932),
( N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824933),
( N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824934),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824935),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824936),
( N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824937),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824938),
( N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824939),
( N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824940),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824941),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824942),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824943),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824944),
( N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824945),
( N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824946),
( N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824947),
( N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824948),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824949),
( N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824950),
( N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824951),
( N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824952),
( N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824953),
( N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824954),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824955),
( N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824956),
( N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824957),
( N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824958),
( N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824959),
( N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824960),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824961),
( N'1', N'B', N'C', 1020.4300, 10983.9085, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824962),
( N'1', N'C', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824963),
( N'1', N'D', N'C', 510.2100, 5491.9004, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824964),
( N'1', N'E', N'C', 510.2100, 5491.9004, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824965),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824966),
( N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824967),
( N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824968),
( N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824969),
( N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824970),
( N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825505),
( N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825506),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825507),
( N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825508),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825509),
( N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825510),
( N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825511),
( N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825512),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825513),
( N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825514),
( N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825515),
( N'1', N'C', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825516),
( N'1', N'D', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825517),
( N'1', N'E', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825518),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825519),
( N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825520),
( N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825521),
( N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825522),
( N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825523),
( N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825524),
( N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825525),
( N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825526),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825527),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825528),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825529),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825530),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825531),
( N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825532),
( N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825533),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825534),
( N'1', N'C', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825535),
( N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825536),
( N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825537),
( N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825538),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825539),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825540),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825541),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825542),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825543),
( N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825544),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825545),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825546),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825547),
( N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825548),
( N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825549),
( N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825550),
( N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825551),
( N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825552),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825553),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825554),
( N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825555),
( N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825556),
( N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2825557),
( N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825558),
( N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825559),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825560),
( N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825561),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825562),
( N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825563),
( N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825564),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825565),
( N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825566),
( N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825567),
( N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825568),
( N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825569),
( N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825570),
( N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825571),
( N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825572),
( N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825573),
( N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825574),
( N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825575),
( N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825576),
( N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825577),
( N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825578),
( N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825579),
( N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825580)
    ) AS v(

        TaxZoneNo,
        ConstructionCode,
        UseGroupCode,
        RateSquareMeter,
        RateSquareFeet,
        RateRemark,
        Col8,
        Col9,
        Col10,
        RateType,
        MinYear,
        MaxYear,
        RateSectionId,
        OldId
    )
)



INSERT INTO PTIS.RateMaster
(

    TaxZoneId,
    FloorId,
    ConstructionTypeId,
    TypeOfUseGroupId,
    YearRangeRVId,
    RateSquareMeter,
    RateSquareFeet,
    RateSectionId,
    RateRemark,
    CreatedBy,
    UpdatedBy,
    UpdatedDate
)


SELECT


    tz.Id,
    f.Id,
    ct.Id,
    ug.Id,
    yr.Id,
    CAST(s.RateSquareMeter AS money),
    CAST(s.RateSquareFeet  AS money),
    rs.Id,
    s.RateRemark,
    NULL, NULL, NULL
FROM Seed s
JOIN PTIS.TaxZoneMaster tz
    ON tz.TaxZoneNo = s.TaxZoneNo
JOIN PTIS.FloorMaster f
    ON f.FloorCode = 'G'
JOIN PTIS.ConstructionTypeMaster ct
    ON ct.ConstructionCode = s.ConstructionCode
JOIN PTIS.TypeOfUseGroupMaster ug
    ON ug.TypeOfUseGroupCode = s.UseGroupCode
JOIN PTIS.RateSectionMaster rs
    ON rs.RateSectionNo = s.RateSectionId
JOIN PTIS.AssessmentYearRangeMasterRV yr
    ON yr.FromYear = s.MinYear AND yr.ToYear = s.MaxYear;




;WITH Src AS
(
    SELECT v.RateSectionNo, v.WardNo
    FROM (VALUES
          (N'1',  N'NK10'),
         (N'1',  N'NK11'),
         (N'1',  N'NK12'),
         (N'1',  N'NK131'),
         (N'1',  N'NK132'),
         (N'1',  N'NK133'),
         (N'1',  N'NK134'),
         (N'1',  N'NK135'),
         (N'1',  N'NK136'),
         (N'1',  N'NKMAJOR3'),
         (N'1',  N'UT115'),
         (N'1',  N'UT116'),
         (N'1',  N'UT117'),
         (N'1',  N'UT118'),
         (N'1',  N'UT119'),
         (N'1',  N'UT120'),
         (N'1',  N'UT121'),
         (N'1',  N'UT122'),
         (N'1',  N'UT123'),
         (N'1',  N'UT124'),
         (N'1',  N'UT125'),
         (N'1',  N'UT126'),
         (N'1',  N'UT127'),
         (N'1',  N'UT128'),
         (N'1',  N'UT129'),
         (N'1',  N'UT130'),
         (N'1',  N'UTMAJOR2'),
         (N'10', N'DI175'),
         (N'10', N'DI176'),
         (N'10', N'DIMAJOR1'),
         (N'11', N'LSMAJOR1'),
         (N'11', N'NK1'),
         (N'11', N'NK2'),
         (N'11', N'NK3'),
         (N'11', N'NK33'),
         (N'11', N'NK34'),
         (N'11', N'NK35'),
         (N'11', N'NK37'),
         (N'11', N'NK40'),
         (N'11', N'NKMAJOR4'),
         (N'11', N'WE13'),
         (N'11', N'WE36'),
         (N'11', N'WE41'),
         (N'11', N'WE42'),
         (N'11', N'WE43'),
         (N'11', N'WE44'),
         (N'11', N'WE45'),
         (N'11', N'WE46'),
         (N'11', N'WE47'),
         (N'11', N'WE48'),
         (N'11', N'WE49'),
         (N'11', N'WE50'),
         (N'11', N'WE51'),
         (N'11', N'WE52'),
         (N'11', N'WE53'),
         (N'11', N'WE54'),
         (N'11', N'WE55'),
         (N'11', N'WE56'),
         (N'11', N'WE57'),
         (N'11', N'WE58'),
         (N'11', N'WE59'),
         (N'11', N'WE63'),
         (N'11', N'WE64'),
         (N'11', N'WEMAJOR1'),
         (N'12', N'VN112'),
         (N'12', N'VN113'),
         (N'12', N'VN6'),
         (N'12', N'VN78'),
         (N'12', N'VN8'),
         (N'12', N'VN85'),
         (N'12', N'VN86'),
         (N'12', N'VN88'),
         (N'12', N'VN89'),
         (N'12', N'VN90'),
         (N'12', N'VN91'),
         (N'12', N'VN92'),
         (N'12', N'VN93'),
         (N'12', N'VN94'),
         (N'12', N'VN95'),
         (N'12', N'VNMAJOR'),
         (N'13', N'MM111'),
         (N'13', N'MM114'),
         (N'13', N'MM19'),
         (N'13', N'MM20'),
         (N'14', N'MM106'),
         (N'14', N'MM107'),
         (N'14', N'MM109'),
         (N'14', N'MM110'),
         (N'14', N'MM15'),
         (N'14', N'MM16'),
         (N'14', N'MM18'),
         (N'14', N'MMMAJOR4'),
         (N'15', N'MM10'),
         (N'15', N'MM101'),
         (N'15', N'MM102'),
         (N'15', N'MM103'),
         (N'15', N'MM104'),
         (N'15', N'MM105'),
         (N'15', N'MM13'),
         (N'15', N'MM8'),
         (N'15', N'MMMAJOR3'),
         (N'16', N'MM108'),
         (N'16', N'MM11'),
         (N'16', N'MMMAJOR2'),
         (N'17', N'MM1'),
         (N'17', N'MM100'),
         (N'17', N'MM2'),
         (N'17', N'MM3'),
         (N'17', N'MM4'),
         (N'17', N'MM5'),
         (N'17', N'MM7'),
         (N'17', N'MM96'),
         (N'17', N'MM97'),
         (N'17', N'MM98'),
         (N'17', N'MM99'),
         (N'17', N'MMMAJOR'),
         (N'2',  N'NK13'),
         (N'2',  N'NK14'),
         (N'2',  N'NK15'),
         (N'2',  N'NK16'),
         (N'2',  N'NK17'),
         (N'2',  N'NK18'),
         (N'2',  N'NK19'),
         (N'2',  N'NK20'),
         (N'2',  N'NK25'),
         (N'2',  N'NK26'),
         (N'2',  N'NK27'),
         (N'2',  N'NK28'),
         (N'2',  N'NK29'),
         (N'2',  N'NK30'),
         (N'2',  N'NK31'),
         (N'2',  N'NK32'),
         (N'2',  N'NK8'),
         (N'2',  N'NK9'),
         (N'2',  N'NKMAJOR1'),
         (N'2',  N'UTMAJOR1'),
         (N'3',  N'NK5'),
         (N'3',  N'NK6'),
         (N'3',  N'NK7'),
         (N'3',  N'NKMAJOR2'),
         (N'4',  N'KL137'),
         (N'4',  N'KL138'),
         (N'4',  N'KL142'),
         (N'4',  N'KL143'),
         (N'4',  N'KL144'),
         (N'4',  N'KL145'),
         (N'4',  N'KL146'),
         (N'4',  N'KL147'),
         (N'4',  N'KL148'),
         (N'4',  N'KL149'),
         (N'4',  N'KL150'),
         (N'4',  N'KL151'),
         (N'4',  N'KLMAJOR2'),
         (N'5',  N'KL139'),
         (N'5',  N'KL140'),
         (N'5',  N'KL141'),
         (N'5',  N'KLMAJOR1'),
         (N'5',  N'TEST'),
         (N'6',  N'KL152'),
         (N'6',  N'KL153'),
         (N'6',  N'KL154'),
         (N'6',  N'KL155'),
         (N'6',  N'KL156'),
         (N'6',  N'KLMAJOR3'),
         (N'7',  N'MU157'),
         (N'7',  N'MU158'),
         (N'7',  N'MU159'),
         (N'7',  N'MU160'),
         (N'7',  N'MU163'),
         (N'7',  N'MU164'),
         (N'7',  N'MU165'),
         (N'7',  N'MU166'),
         (N'7',  N'MU167'),
         (N'7',  N'MU168'),
         (N'7',  N'MUMAJOR1'),
         (N'8',  N'MUMAJOR2'),
         (N'8',  N'MUMAJOR3'),
         (N'9',  N'DI172'),
         (N'9',  N'DI174'),
         (N'9',  N'DIMAJOR2'),
         (N'9',  N'MUMAJOR4')
    ) v(RateSectionNo, WardNo)
),
Resolved AS
(
    SELECT
        rsm.Id AS RateSectionId,
        wm.Id AS WardId,
        s.RateSectionNo,
        s.WardNo
    FROM Src s
    INNER JOIN PTIS.RateSectionMaster rsm
        ON rsm.RateSectionNo = TRY_CONVERT(int, s.RateSectionNo)
    INNER JOIN PTIS.WardMaster wm
        ON wm.WardNo = s.WardNo
)
INSERT INTO PTIS.RateSectionDetails (RateSectionId, WardId)
SELECT r.RateSectionId, r.WardId
FROM Resolved r
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RateSectionDetails t
    WHERE t.RateSectionId = r.RateSectionId
      AND t.WardId        = r.WardId
);






-- SET IDENTITY_INSERT [PTIS].[ActiveTaxesMaster] ON;
-- GO

-- INSERT [PTIS].[ActiveTaxesMaster]
-- ([ActiveTaxesId], [TaxName], [TaxNameAlias], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
-- VALUES
-- (1,  N'GeneralTax',           N'à¤¸à¤¾à¤®à¤¾à¤¨à¥à¤¯ à¤•à¤° à¤°à¥.',                    1,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (2,  N'StateEducationTax',    N'à¤¶à¤¿à¤•à¥à¤·à¤£ à¤•à¤° à¤°à¥.',                      2,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (3,  N'StateEmploymentTax',   N'à¤°à¥‹à¤œà¤—à¤¾à¤° à¤¹à¤®à¥€ à¤•à¤° à¤°à¥.',                  3,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (4,  N'SpEducationTax',       N'à¤¶à¤¿à¤•à¥à¤·à¤£ à¤‰à¤ªà¤•à¤° à¤°à¥.',                    4,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (5,  N'DrainCess',            N'à¤˜.à¤• à¤¶à¥. à¤°à¥.',                       5,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (6,  N'RoadCess',             N'à¤°à¤¸à¥à¤¤à¤¾ à¤•à¤° à¤°à¥.',                       6,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (7,  N'TreeCess',             N'à¤µà¥ƒà¤•à¥à¤· à¤‰à¤ªà¤•à¤° à¤°à¥.',                     7,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (8,  N'SewageDisposalCess',   N'à¤®à¤²à¤ªà¥à¤°à¤µà¤¾à¤¹ à¤¸à¥à¤µà¤¿à¤§à¤¾ à¤²à¤¾à¤­ à¤•à¤° à¤°à¥.',         8,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (9,  N'SanitationCess',       N'à¤ªà¥à¤°à¤¶à¤¾à¤¸à¤•à¥€à¤¯ à¤¸à¥‡à¤µà¤¾ à¤¶à¥à¤²à¥à¤• à¤°à¥.',           9,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (10, N'WaterBenefitCess',     N'à¤ªà¤¾à¤£à¥€à¤ªà¥à¤°à¤µà¤ à¤¾ à¤²à¤¾à¤­ à¤•à¤° à¤°à¥.',             10, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (11, N'SpWaterCess',          N'à¤®à¤² à¤¨à¤¿à¤¸à¥à¤¸à¤¾ à¤°à¤£ à¤²à¤¾à¤­ à¤°à¥.',              11, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (12, N'WaterBill',            N'à¤®à¤¾à¤—à¤£à¥€ à¤¨à¥‹à¤Ÿà¥€à¤¸ à¤«à¥€ à¤°à¥.',                12, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (13, N'FireCess',             N'à¤…à¤—à¥à¤¨à¤¿. à¤•à¤° à¤°à¥.',                      13, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (14, N'Penalty',              N'à¤¥à¤•à¥€à¤¤ à¤¶à¤¾à¤¸à¥à¤¤à¥€ à¤°à¥.',                    14, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (15, N'BigBuilding',          N'à¤®à¥‹à¤ à¥€ à¤‡à¤®à¤¾à¤°à¤¤ à¤•à¤° à¤°à¥.',                  15, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (16, N'LightCess',            N'à¤µà¤¿à¤¶à¥‡à¤· à¤¸à¤¾à¤«à¤¸à¤«à¤¾à¤ˆ à¤•à¤° à¤°à¥.',              16, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (17, N'ServiceTax',           N' ',                                  17, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (19, N'IllegalConstPenalty',  N'à¤…à¤¨à¤§à¤¿à¤•à¥ƒà¤¤ à¤¬à¤¾à¤‚à¤§ à¤•à¤¾à¤® à¤¶à¤¾à¤¸à¥à¤¤à¥€ à¤°à¥. ',      18, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (20, N'Tax1',                 N'à¤•à¤° à¥§ à¤°à¥.',                           19, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (21, N'Tax2',                 N'à¤•à¤° à¥¨ à¤°à¥.',                           20, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (22, N'Tax3',                 N'à¤•à¤° à¥ª à¤°à¥..',                          21, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (23, N'Tax4',                 N'à¤•à¤° à¥ª à¤°à¥.',                           22, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (24, N'Tax5',                 N'à¤•à¤° à¥« à¤°à¥.',                           23, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (25, N'Tax6',                 N'à¤•à¤° à¥« à¤°à¥.',                           24, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (26, N'Tax7',                 N'à¤•à¤° à¥¬ à¤°à¥.',                           25, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (27, N'Tax8',                 N'à¤•à¤° à¥­ à¤°à¥.',                           26, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (28, N'Tax9',                 N'à¤•à¤° à¥¯ à¤°à¥.',                           27, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (29, N'Tax10',                N'à¤•à¤° à¥§à¥¦ à¤°à¥.',                          28, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (30, N'Interest',             N'à¤šà¤¾à¤²à¥‚ à¤®à¤¾.à¤•à¤° à¤¶à¤¾à¤¸à¥à¤¤à¥€ à¤°à¥.',              29, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (31, N'Discount',             N'à¤µà¤¿à¤¶à¥‡à¤· à¤¸à¥‚à¤Ÿ à¤°à¥.',                      30, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (32, N'TaxTotal',             N'à¤à¤•à¥‚à¤£ à¤•à¤° à¤°à¥.',                         31, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (33, N'NetTotal',             N'à¤¨à¤¿à¤µà¥à¤µà¤³ à¤à¤•à¥‚à¤£ à¤•à¤° à¤°à¥.',                  32, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL);

-- GO
-- SET IDENTITY_INSERT [PTIS].[ActiveTaxesMaster] OFF;
GO



INSERT INTO [CORE].[YearMaster] ([Year], [IsActive]) VALUES ( '2022','0');
INSERT INTO [CORE].[YearMaster] ([Year], [IsActive]) VALUES ( '2023','0');
INSERT INTO [CORE].[YearMaster] ([Year], [IsActive]) VALUES ( '2024','0');
INSERT INTO [CORE].[YearMaster] ([Year], [IsActive]) VALUES ( '2025','1');


-- INSERT INTO PTIS.TaxPercentageMasterCV
-- (
--      TypeOfUseId,YearRangeCVId,GeneralTax,TreeCess, SpWaterCess,
--     RoadCess,FireCess,LightCess,WaterBenefitCess,SewageDisposalCess,SpEducationTax,
--     SanitationCess,DrainCess,WaterBill,BigBuilding,IllegalConstPenalty,
--     UserCharges,ServiceTax, Tax1, Tax2, Tax3, Tax4, Tax5, Tax6, Tax7, Tax8, Tax9, Tax10,
--     OldPenalty,IsActive,CreatedBy,CreatedDate,UpdatedBy, UpdatedDate
-- )
-- SELECT

--     tum.TypeOfUseId,
--     2,
--    15.0000, 1.0000, 2.0000, 5.0000, 0.0000, 0.0000, 10.0000, 8.0000, 1.0000,
--     0.0000, 1.0000, 0.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000,
--     1.0000, 1.0000, 0.0000, 0.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000,
--     1,
--     NULL,
--     GETDATE(),
--     NULL,
--     NULL
-- FROM  PTIS.TypeOfUseMaster tum


-- SET IDENTITY_INSERT PTIS.TaxPercentageMasterCV OFF;




-- INSERT INTO PTIS.TaxPercentageMasterRV
-- (
--      TypeOfUseId,YearRangeRVId,GeneralTax,TreeCess, SpWaterCess,
--     RoadCess,FireCess,LightCess,WaterBenefitCess,SewageDisposalCess,SpEducationTax,
--     SanitationCess,DrainCess,WaterBill,BigBuilding,IllegalConstPenalty,
--     UserCharges,ServiceTax, Tax1, Tax2, Tax3, Tax4, Tax5, Tax6, Tax7, Tax8, Tax9, Tax10,
--     OldPenalty,IsActive,CreatedBy,CreatedDate,UpdatedBy, UpdatedDate
-- )
-- SELECT

--     tum.TypeOfUseId,
--     2,
--     15.0000, 1.0000, 2.0000, 5.0000, 0.0000, 0.0000, 10.0000, 8.0000, 1.0000,
--     0.0000, 1.0000, 0.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000,
--     1.0000, 1.0000, 0.0000, 0.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000,
--     1,
--     NULL,
--     GETDATE(),
--     NULL,
--     NULL
-- FROM  PTIS.TypeOfUseMaster tum


-- SET IDENTITY_INSERT PTIS.TaxPercentageMasterRV OFF;












 GO
 SET IDENTITY_INSERT [PTIS].[GenderMaster] ON
 GO
 INSERT [PTIS].[GenderMaster] ([Id], [GenderName]) VALUES (1, N'Female')
 GO
 INSERT [PTIS].[GenderMaster] ([Id], [GenderName]) VALUES (2, N'Male')
 GO
 INSERT [PTIS].[GenderMaster] ([Id], [GenderName]) VALUES (3, N'Transgender')
 GO
 INSERT [PTIS].[GenderMaster] ([Id], [GenderName]) VALUES (4,N'à¤«à¤°à¥à¤®')
 GO
 SET IDENTITY_INSERT [PTIS].[GenderMaster] OFF



 SET IDENTITY_INSERT [PTIS].[DocumentMaster] ON
 GO
 INSERT [PTIS].[DocumentMaster] ([Id], [DocumentName], [DocPrefix]) VALUES (1, N'Aadhar Card', N'ADR')
 GO
 INSERT [PTIS].[DocumentMaster] ([Id], [DocumentName], [DocPrefix]) VALUES (2, N'Index2', N'IND2')
 GO
 INSERT [PTIS].[DocumentMaster] ([Id], [DocumentName], [DocPrefix]) VALUES (4, N'Satbara Utara', N'712')
 GO
 INSERT [PTIS].[DocumentMaster] ([Id], [DocumentName], [DocPrefix]) VALUES (5, N'Kharidi Khat', N'KHAT')
 GO
 SET IDENTITY_INSERT [PTIS].[DocumentMaster] OFF


 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤•à¤¾à¤¯à¤®','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ close à¤•à¥‡à¤²à¥€','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ close  à¤¹à¥‹à¤¤à¥€  Open à¤•à¥‡à¤²à¥€','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤•à¥à¤·à¥‡à¤¤à¥à¤°à¤«à¤³à¤¾à¤¤ à¤¬à¤¦à¤²','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤µà¤¾à¤ªà¤°à¤¾à¤¤ à¤¬à¤¦à¤²','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤…à¤¤à¤¿à¤°à¤¿à¤•à¥à¤¤ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤•à¥‡à¤²à¥‡','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'BHK à¤¬à¤¦à¤²','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤­à¤¾à¤¡à¥‡ à¤®à¤¾à¤¹à¤¿à¤¤à¥€ à¤¬à¤¦à¤²','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤¬à¤¾à¤¹à¥à¤¯ à¤®à¥‹à¤œà¤£à¥€à¤šà¥‡ à¤…à¤‚à¤¤à¤°à¥à¤—à¤¤ à¤®à¥‹à¤œà¤£à¥€ à¤•à¥‡à¤²à¥€','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤µà¤—à¤³à¤£à¥‡','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤‡à¤¤à¤°','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤¨à¤µà¥à¤¯à¤¾à¤¨à¥‡ à¤¸à¤°à¥à¤µà¥‡à¤•à¥à¤·à¤£ à¤ªà¥‚à¤°à¥à¤£','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'à¤ªà¥à¤²à¥‰à¤Ÿ à¤µà¤° à¤¨à¤µà¥€à¤¨ à¤¬à¤¾à¤‚à¤§à¤•à¤¾à¤® à¤•à¥‡à¤²à¥‡','SurveyApp')

 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¬à¤¿à¤² à¤µà¤¿à¤¤à¤°à¤¿à¤¤ à¤•à¤°à¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤¬à¤‚à¤¦', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¤à¥à¤°à¥à¤Ÿà¥€ à¤…à¤¸à¤²à¥à¤¯à¤¾à¤®à¥à¤³à¥‡ à¤¬à¤¿à¤² à¤¸à¥à¤µà¥€à¤•à¤¾à¤°à¥‚ à¤¶à¤•à¤¤ à¤¨à¤¾à¤¹à¥€', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¤à¤•à¥à¤°à¤¾à¤° à¤•à¥‡à¤²à¥‡à¤²à¥€ à¤†à¤¹à¥‡ à¤¤à¥à¤¯à¤¾à¤®à¥à¤³à¥‡ à¤¬à¤¿à¤² à¤¸à¥à¤µà¥€à¤•à¤¾à¤°à¥‚ à¤¶à¤•à¤¤ à¤¨à¤¾à¤¹à¥€', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¬à¤¿à¤² à¤®à¤¾à¤¨à¥à¤¯ à¤¨à¤¾à¤¹à¥€ à¤¤à¥à¤¯à¤¾à¤®à¥à¤³à¥‡ à¤¸à¥à¤µà¥€à¤•à¤¾à¤°à¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡ à¤¨à¤¾à¤¹à¥€', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤•à¤° à¤§à¤¾à¤°à¤• à¤¹à¤œà¤° à¤¨à¤¸à¤²à¥à¤¯à¤¾à¤®à¥à¤³à¥‡ à¤¬à¤¿à¤² à¤¸à¥à¤µà¥€à¤•à¤¾à¤°à¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡ à¤¨à¤¾à¤¹à¥€', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¬à¤¿à¤² à¤¸à¥‡à¤•à¥à¤°à¥‡à¤Ÿà¤°à¥€à¤•à¤¡à¥‡ à¤¸à¥‹à¤ªà¤µà¤²à¥€', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€à¤®à¤§à¥à¤¯à¥‡ à¤¬à¤¿à¤² à¤µà¤¿à¤¤à¤°à¤¿à¤¤ à¤•à¤°à¥‚ à¤¦à¥‡à¤£à¥à¤¯à¤¾à¤¸ à¤¨à¤•à¤¾à¤°', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤®à¤¿à¤³à¤¾à¤²à¥€ à¤¨à¤¾à¤¹à¥€', N'Reject', N'Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤¬à¤‚à¤¦ (à¤¬à¤¿à¤² à¤šà¤¿à¤Ÿà¤•à¤µà¥‚ à¤¦à¥‡à¤£à¥à¤¯à¤¾à¤¸ à¤¨à¤•à¤¾à¤°)', N'Reject', N'Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤¬à¤‚à¤¦ (à¤¬à¤¿à¤² à¤šà¤¿à¤Ÿà¤•à¤µà¤£à¥à¤¯à¤¾à¤¤ à¤†à¤²à¥‡ )', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¬à¤¿à¤² à¤¦à¤¿à¤²à¥‡', N'Accept', N'Visited and Distributed', 1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤¬à¤‚à¤¦ / à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¥‡à¤¸ à¤¬à¤¿à¤² à¤šà¤¿à¤Ÿà¤•à¤µà¤²à¥‡', N'Accept', N'Visited and Distributed', 1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'à¤¬à¤¿à¤² à¤˜à¥‡à¤£à¥à¤¯à¤¾à¤¸ à¤¨à¤•à¤¾à¤°', N'Reject', N'Not Distributed', 1,'BillApp')
 GO


 SET IDENTITY_INSERT [PTIS].[MobileScreenValidationMaster] ON
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (1, N'Pilot', N'SocietyName', N'SocietyName', 1, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (2, N'Pilot', N'SecretoryName', N'SecretoryName', 2, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (3, N'Pilot', N'MobileNo', N'MobileNo', 3, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (4, N'Pilot', N'EmailID', N'EmailID', 4, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (5, N'Pilot', N'Address', N'Address', 5, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (6, N'Pilot', N'Pincode', N'Pincode', 6, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (7, N'Pilot', N'OwnerName', N'OwnerName', 7, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (8, N'Pilot', N'OccupierName', N'OccupierName', 8, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (9, N'Pilot', N'ShopName', N'ShopName', 9, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (10, N'Pilot', N'BuildingPhoto', N'BuildingPhoto', 10, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (11, N'Pilot', N'WingPhoto', N'WingPhoto', 11, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (12, N'Pilot', N'WingBoardPhoto', N'WingBoardPhoto', 12, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (13, N'SocietyCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (14, N'SocietyCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (15, N'SocietyCommon', N'BlockNo', N'BlockNo', 3, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (16, N'SocietyCommon', N'SocietyName', N'SocietyName', 4, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (17, N'SocietyCommon', N'SecretoryName', N'SecretoryName', 5, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (18, N'SocietyCommon', N'MobileNo', N'MobileNo', 6, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (19, N'SocietyCommon', N'EmailID', N'EmailID', 7, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (20, N'SocietyCommon', N'Address', N'Address', 8, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (21, N'SocietyCommon', N'Pincode', N'Pincode', 9, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (22, N'SocietyCommon', N'OCCertificate', N'OCCertificate', 10, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (23, N'SocietyCommon', N'OCDate', N'OCDate', 11, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (24, N'SocietyCommon', N'AminityArea', N'AminityArea', 12, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (25, N'SocietyCommon', N'BuildingPhoto', N'BuildingPhoto', 13, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (26, N'SocietyCommon', N'GreenProperty', N'GreenProperty', 14, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (27, N'SocietyCommon', N'BuildingYear', N'BuildingYear', 15, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (28, N'WingCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (29, N'WingCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (30, N'WingCommon', N'BlockNo', N'BlockNo', 3, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (31, N'WingCommon', N'SocietyName', N'SocietyName', 4, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (32, N'WingCommon', N'SecretoryName', N'SecretoryName', 5, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (33, N'WingCommon', N'MobileNo', N'MobileNo', 6, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (34, N'WingCommon', N'EmailID', N'EmailID', 7, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (35, N'WingCommon', N'Address', N'Address', 8, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (36, N'WingCommon', N'Pincode', N'Pincode', 9, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (37, N'WingCommon', N'OCCertificate', N'OCCertificate', 10, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (38, N'WingCommon', N'OCDate', N'OCDate', 11, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (39, N'WingCommon', N'AminityArea', N'AminityArea', 12, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (40, N'WingCommon', N'BuildingPhoto', N'BuildingPhoto', 13, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (41, N'WingCommon', N'GreenProperty', N'GreenProperty', 14, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (42, N'WingCommon', N'WingYear', N'WingYear', 15, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (43, N'WingGeneration', N'Year', N'Year', 1, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (44, N'IndividualCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (45, N'IndividualCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (46, N'IndividualCommon', N'MobileNo', N'MobileNo', 3, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (47, N'IndividualCommon', N'EmailID', N'EmailID', 4, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (48, N'IndividualCommon', N'Address', N'Address', 5, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (49, N'IndividualCommon', N'Pincode', N'Pincode', 6, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (50, N'IndividualCommon', N'OwnerName', N'OwnerName', 7, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (51, N'IndividualCommon', N'OccupierName', N'OccupierName', 1, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (52, N'IndividualCommon', N'ShopName', N'ShopName', 9, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (53, N'IndividualCommon', N'BuildingPhoto', N'BuildingPhoto', 10, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (54, N'IndividualCommon', N'BlockNo', N'BlockNo', 11, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (55, N'IndividualCommon', N'Year', N'Year', 12, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (56, N'IndividualCommon', N'TotalArea', N'TotalArea', 13, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (57, N'IndividualCommon', N'Photo', N'Photo', 14, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (58, N'IndividualCommon', N'Sign', N'Sign', 15, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (59, N'FlatCommon', N'OwnerName', N'OwnerName', 1, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (60, N'FlatCommon', N'OccupierName', N'OccupierName', 2, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (61, N'FlatCommon', N'ShopName', N'ShopName', 3, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (62, N'FlatCommon', N'MobileNo', N'MobileNo', 4, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (63, N'FlatCommon', N'EmailID', N'EmailID', 5, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (64, N'FlatCommon', N'Photo', N'Photo', 6, NULL, NULL, NULL, 1, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (65, N'FlatCommon', N'Sign', N'Sign', 7, NULL, NULL, NULL, 0, 1)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (66, N'FlatCommon', N'FlatArea', N'FlatArea', 8, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (67, N'FlatCommon', N'AmenityDirectSubmission', N'AmenityDirectSubmission', 9, NULL, NULL, NULL, 0, 0)
 GO
 INSERT [PTIS].[MobileScreenValidationMaster] ([Id], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (68, N'IndividualCommon', N'DirectIndividualSubmission', N'DirectIndividualSubmission', 16, NULL, NULL, NULL, 0, 0)
 GO
 SET IDENTITY_INSERT [PTIS].[MobileScreenValidationMaster] OFF
 GO

 INSERT INTO PTIS.BlockMaster (WardId, BlockNo)
SELECT wm.Id, v.BlockNo
FROM (VALUES
 ('UT1', 1), ('UT1', 2), ('UT1', 3), ('UT1', 4), ('UT1', 5),
 ('UT1', 6), ('UT1', 7), ('UT1', 8), ('UT1', 9), ('UT1',10),
 ('UT1',11), ('UT1',12), ('UT1',13), ('UT1',14), ('UT1',15),
 ('UT1',16), ('UT1',17)
) v(WardNo, BlockNo)
JOIN PTIS.WardMaster wm
  ON wm.WardNo = v.WardNo;
 --- global master-- end---

 SET IDENTITY_INSERT [PTIS].[PolicyConfiguration] ON;

 INSERT INTO [PTIS].[PolicyConfiguration]
 (
    Id,
    PolicyCode, Category, DisplayName, Description,
    DataType, PolicyValue, DefaultValue,
    IsProtected, IsActive, Unit, AllowedValues, CreatedDate
 )
 SELECT
     v.Id,
     v.PolicyCode, v.Category, v.DisplayName, v.Description,
     v.DataType, v.PolicyValue, v.DefaultValue,
     v.IsProtected, v.IsActive, v.Unit, v.AllowedValues, v.CreatedDate
 FROM (VALUES
     (1, N'AssessmentYear', N'General', N'Assessment Base Year',
      N'Assessment base year for policy configuration.',
      N'INT', N'2010', N'2010', 1, 1, NULL, NULL, GETDATE()),
     (2, N'TaxCalculationMethod', N'Calculation', N'Tax Calculation Method',
      N'Purpose: Specifies which tax calculation method should be used. PolicyValue: RV=Rateable Value, CV=Capital Value. Example: RV.',
      N'VARCHAR', N'RV', N'RV', 1, 1, NULL, N'RV,CV', GETDATE()),
     (3, N'RateableValueAreaType', N'Calculation', N'Rateable Value Area Type',
       N'Determines the area type used for Rateable Value calculation. PolicyValue: CarpetArea or BuiltUpArea. Example: CarpetArea.',
      N'VARCHAR', N'BuiltUpArea', N'CarpetArea', 1, 1, NULL, 'CarpetArea,BuiltUpArea', GETDATE()),

     (4, N'EducationEmploymentTaxCalculationMethod', N'Calculation',
      N'Education / Employment Tax On RV or ALV',
      N'Controls Education and Employment Tax calculation on Rateable Value Or Annual Letting Value.',
      N'VARCHAR', N'RV', N'ALV', 1, 1, NULL, N'RV,ALV', GETDATE()),
     (5, N'ApplyMaintenance', N'Calculation', N'Apply Maintenance',
      N'Apply maintenance deduction during annual rental value or rateable value calculation.',
      N'BIT', N'1', N'1', 1, 1, NULL, 'Enable,Disable', GETDATE()),
     (6, N'MaintenancePercentage', N'Calculation', N'Maintenance Percentage',
      N'Percentage of maintenance deduction applied during annual rental value or rateable value calculation.',
      N'DECIMAL', N'10', N'10', 1, 1, N'PERCENT', NULL, GETDATE()),
     (7, N'RateMasterAreaUnit', N'Calculation', N'Rate Master Area Unit',
      N'Purpose: Defines whether Rate Master rates are entered per SqMeter or per SqFeet. PolicyValue: SqMeter or SqFeet. Example: SqMeter.',
      N'VARCHAR', N'SqMeter', N'SqMeter', 1, 1, NULL, N'SqMeter,SqFeet', GETDATE()),
     (8, N'RateMonthlyOrYearly', N'Calculation', N'Rate Monthly Or Yearly',
      N'Purpose: Determines whether Rate Master rates are monthly or yearly. PolicyValue: Monthly or Yearly. Example: Yearly.',
        N'VARCHAR', N'Yearly', N'Monthly', 1, 1, NULL, N'Monthly,Yearly', GETDATE()),
         (9, N'CombinePropertyLimit', N'Calculation', N'Combine Property Limit',
        N'Purpose: Specifies the maximum number of adjacent properties allowed for property combination. PolicyValue: Enter a numeric value. Example: 2 means a property can be combined with up to 2 adjacent properties.',
        N'INT', N'10', N'3', 1, 1, NULL, NULL, CAST(N'2026-06-16T16:26:35.227' AS DATETIME)),
         (10, N'MaxPropertyTransferLimit', N'Validation', N'Maximum Property Transfer Limit',
        N'Purpose: Updated maximum property transfer limit.',
        N'INT', N'8', N'5', 0, 1, NULL, NULL, CAST(N'2026-06-18T14:20:31.163' AS DATETIME))

  ) v
  (
      Id,
      PolicyCode, Category, DisplayName, Description,
      DataType, PolicyValue, DefaultValue,
      IsProtected, IsActive, Unit, AllowedValues, CreatedDate
  )
  WHERE NOT EXISTS (
      SELECT 1
      FROM [PTIS].[PolicyConfiguration] pc
      WHERE pc.PolicyCode = v.PolicyCode
  );
 SET IDENTITY_INSERT [PTIS].[PolicyConfiguration] OFF;
------------------------tax configuration-----------------------
SET IDENTITY_INSERT [PTIS].[TaxCategoryMaster] ON;
INSERT INTO [PTIS].[TaxCategoryMaster] ([Id], [CategoryCode], [CategoryName], [IsActive], [IsProtected], [CreatedBy])
SELECT v.Id, v.CategoryCode, v.CategoryName, v.IsActive, v.IsProtected, v.CreatedBy
FROM (VALUES
    (1, 'TAX',  'Tax', 1, 1, 1),
    (2, 'CESS', 'Cess', 1, 1, 1),
    (3, 'EDU',  'State Education Tax', 1, 1, 1),
    (4, 'EMP',  'State Employment Tax', 1, 1, 1),
    (5, 'USER', 'User Charges', 1, 1, 1),
    (6, 'PENALTY', 'Penalty', 1, 1, 1),
    (7, 'DISCOUNT', 'Discount', 1, 1, 1),
    (8, 'TAXTOTAL', 'Tax Total', 1, 1, 1),
    (9, 'NETTOTAL', 'Net Total', 1, 1, 1)
) v(Id, CategoryCode, CategoryName, IsActive, IsProtected, CreatedBy)
WHERE NOT EXISTS (
    SELECT 1 FROM [PTIS].[TaxCategoryMaster] tcm WHERE tcm.[Id] = v.[Id]
);
SET IDENTITY_INSERT [PTIS].[TaxCategoryMaster] OFF;
GO

SET IDENTITY_INSERT [PTIS].[TaxCalculationModeMaster] ON;
INSERT INTO [PTIS].[TaxCalculationModeMaster] ([Id],[ModeCode],[ModeName],[DisplayOrder],[UsesValueConfig],[UsesConditionConfig],[UsesMasterConfig],[UsesHybridConfig],[CreatedDate],[UpdatedDate],[CreatedBy],[UpdatedBy],[IsActive])
VALUES
    (1,'VALUE_BASED',     'Value Based',     1, 1, 0, 0, 0, GETDATE(), NULL, 1, NULL, 1),
    (2,'CONDITION_BASED', 'Condition Based', 2, 0, 1, 0, 0, GETDATE(), NULL, 1, NULL, 1),
    (3,'MASTER_BASED',    'Master Based',    3, 0, 0, 1, 0, GETDATE(), NULL, 1, NULL, 1),
    (4,'HYBRID',          'Hybrid',          4, 0, 1, 1, 1, GETDATE(), NULL, 1, NULL, 1)
GO
SET IDENTITY_INSERT [PTIS].[TaxCalculationModeMaster] OFF;
GO


SET IDENTITY_INSERT [PTIS].[TaxMaster] ON;

INSERT INTO [PTIS].[TaxMaster] ([Id], [TaxCode], [TaxName], [TaxCategoryId], [DisplayOrder], [IsActive], [AssessmentStatus], [OldTaxStatus], [IsProtected], [CalculationModeId])
SELECT v.Id, v.TaxCode, v.TaxName, c.Id, v.DisplayOrder, v.IsActive, v.AssessmentStatus, v.OldTaxStatus, v.IsProtected, v.CalculationModeId
FROM (VALUES
    (1, 'GEN',  'General Tax',              'TAX',  1, 1, 1, 1, 1, 1),
    (2, 'STATE_EDU', 'State Education Tax','EDU',  2, 1, 1, 1, 1, 1),
    (3, 'STATE_EMP', 'State Employment Tax','EMP', 3, 1, 1, 1, 1, 1),
    (4, 'TREE', 'Tree Cess',               'CESS', 4, 1, 1, 1, 1, 1),
    (5, 'SP_WATER', 'Special Water Cess',  'CESS', 5, 1, 1, 1, 1, 1),
    (6, 'ROAD', 'Road Cess',               'CESS', 6, 1, 1, 1, 1, 1),
    (7, 'FIRE', 'Fire Cess',               'CESS', 7, 1, 1, 1, 1, 1),
    (8, 'LIGHT', 'Light Cess',             'CESS', 8, 1, 1, 1, 1, 1),
    (9, 'WATER_BEN', 'Water Benefit Cess', 'CESS', 9, 1, 1, 1, 1, 1),
    (10, 'SEWAGE', 'Sewage Disposal Cess',  'CESS', 10, 1, 1, 1, 1, 1),
    (11, 'SP_EDU', 'Special Education Tax', 'EDU',  11, 1, 1, 1, 1, 1),
    (12, 'SANITATION', 'Sanitation Cess',   'CESS', 12, 0, 0, 0, 1, 1),
    (13, 'DRAIN', 'Drain Cess',             'CESS', 13, 0, 0, 0, 1, 1),
    (14, 'WATER_BILL', 'Water Bill',        'USER', 14, 0, 0, 0, 1, 1),
    (15, 'BIG_BUILD', 'Big Building',       'TAX',  15, 0, 0, 0, 1, 1),
    (16, 'ILLEGAL', 'Illegal Construction Penalty','PENALTY',16, 0, 0, 0, 1, 1),
    (17, 'USER', 'User Charges',            'USER', 17, 0, 0, 0, 1, 1),
    (18, 'SERVICE', 'Service Tax',          'TAX',  18, 0, 0, 0, 1, 1),
    (19, 'OLD PENALTY', 'Old Penalty of ULB', 'PENALTY',  19, 0, 0, 0, 1, 1),
    (20, 'PENALTY', 'Run Time Penalty', 'PENALTY',  20, 0, 0, 0, 1, 1),
    (21, 'TAXTOTAL', 'Tax Total', 'TAXTOTAL', 21, 1, 1, 1, 1, 1),
    (22, 'NETTOTAL', 'Net Total', 'NETTOTAL', 22, 0, 0, 0, 1, 1),
    (23, 'DISCOUNT', 'Discount', 'DISCOUNT', 23, 0, 0, 0, 1, 1)
) v(Id, TaxCode, TaxName, CategoryCode, DisplayOrder, IsActive, AssessmentStatus, OldTaxStatus, IsProtected, CalculationModeId)
JOIN PTIS.TaxCategoryMaster c ON c.CategoryCode = v.CategoryCode
WHERE NOT EXISTS (
    SELECT 1 FROM PTIS.TaxMaster t WHERE t.Id = v.Id
);

SET IDENTITY_INSERT [PTIS].[TaxMaster] OFF;

GO

SET IDENTITY_INSERT [PTIS].[WingMaster] ON
INSERT [PTIS].[WingMaster] ([Id], [WingNo], [SequenceNo], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES
(1, N'A', 1, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(2, N'B', 2, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(3, N'C', 3, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(4, N'D', 4, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(5, N'E', 5, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(6, N'F', 6, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(7, N'G', 7, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(8, N'H', 8, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(9, N'I', 9, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(10, N'J', 10, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(11, N'K', 11, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(12, N'L', 12, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(13, N'M', 13, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(14, N'N', 14, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(15, N'O', 15, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(16, N'P', 16, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(17, N'Q', 17, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(18, N'R', 18, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(19, N'S', 19, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(20, N'T', 20, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(21, N'U', 21, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(22, N'V', 22, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(23, N'W', 23, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(24, N'X', 24, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(25, N'Y', 25, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL),
(26, N'Z', 26, 1, NULL, CAST(N'2026-03-25T12:44:07.727' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [PTIS].[WingMaster] OFF


---- policy tax details - seed data ----
-- No default seed data. PTIS.PolicyTaxDetails is the RV/CV pipeline's
-- own property-wise tax transaction table (PropertyId, PolicyCodeId,
-- PolicyYear, TaxId) -- populated by that pipeline against real
-- properties/taxes, not by synthetic demo rows here.


SET IDENTITY_INSERT [PTIS].[RoomTypeMaster] ON;

;WITH SeedData AS
(
    SELECT *
    FROM
    (
        VALUES
        (1,N'Bath',N'BATH'),
        (2,N'Bed Bal',N'BEDBAL'),
        (3,N'BED1',N'BED1'),
        (4,N'BED1 Bal ENC',N'BED1BE'),
        (5,N'BED2',N'BED2'),
        (6,N'BED2 Bal ENC',N'BED2BE'),
        (7,N'BED3',N'BED3'),
        (8,N'Hall',N'HALL'),
        (9,N'Hall Bal',N'HALBAL'),
        (10,N'Hall Bal ENC',N'HALENC'),
        (11,N'Individual',N'IND'),
        (12,N'Kit Bal',N'KITBAL'),
        (13,N'Kit Bal ENC',N'KITENC'),
        (14,N'Kit/Din',N'KITDIN'),
        (15,N'Office',N'OFF'),
        (16,N'OpenPlot',N'OPENPLT'),
        (17,N'Other',N'OTHER'),
        (18,N'Parking',N'PARK'),
        (19,N'Passage',N'PASS'),
        (20,N'PSG',N'PSG'),
        (21,N'Rooms',N'ROOMS'),
        (22,N'Shop',N'SHOP'),
        (23,N'Staire',N'STAIRE'),
        (24,N'W/C/Bath',N'WCBATH'),
        (25,N'WC',N'WC')
    ) AS V(Id,RoomTypeName,RoomTypeCode)
)

INSERT INTO [PTIS].[RoomTypeMaster]
(
    [Id],
    [RoomTypeName],
    [RoomTypeCode],
    [IsActive],
    [CreatedBy],
    [CreatedDate],
    [UpdatedBy],
    [UpdatedDate]
)
SELECT
    S.Id,
    S.RoomTypeName,
    S.RoomTypeCode,
    1,
    NULL,
    GETDATE(),
    NULL,
    NULL
FROM SeedData S
WHERE NOT EXISTS
(
    SELECT 1
    FROM [PTIS].[RoomTypeMaster] R
    WHERE R.Id = S.Id
)
AND NOT EXISTS
(
    SELECT 1
    FROM [PTIS].[RoomTypeMaster] R
    WHERE R.RoomTypeName = S.RoomTypeName
);

SET IDENTITY_INSERT [PTIS].[RoomTypeMaster] OFF;

GO

-- ==========================================
-- Rules Engine Configuration Seed Data
-- ==========================================

SET IDENTITY_INSERT [PTIS].[RuleScopeMaster] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeMaster] WHERE [RuleScope] = N'Property Level')
    INSERT [PTIS].[RuleScopeMaster] ([Id], [RuleScope], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Property Level', 1, 1, CAST(N'2026-05-04T15:43:57.587' AS DateTime), 0, CAST(N'2026-05-04T15:44:33.573' AS DateTime))
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeMaster] WHERE [RuleScope] = N'DynamicTaxRegisterCondition')
    INSERT [PTIS].[RuleScopeMaster] ([Id], [RuleScope], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'DynamicTaxRegisterCondition', 1, 1, CAST(N'2026-05-04T15:43:57.587' AS DateTime), 0, CAST(N'2026-05-04T15:44:33.573' AS DateTime))
GO
SET IDENTITY_INSERT [PTIS].[RuleScopeMaster] OFF
GO

SET IDENTITY_INSERT [PTIS].[RulesFieldMaster] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Floor')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (1, N'Floor', N'Int', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'FloorId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Type')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (2, N'Type', N'String', 1, 1, CAST(N'2026-05-18T11:30:10.320' AS DateTime), 1, CAST(N'2026-05-27T17:35:26.497' AS DateTime), N'TypeOfUseGroupId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Construction Type')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (3, N'Construction Type', N'String', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'ConstructionTypeId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Zone')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (4, N'Zone', N'String', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'TaxZoneId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Ward')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (5, N'Ward', N'String', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'WardId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Year Range')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (6, N'Year Range', N'Int', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'AssessmentYear')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Area Sq.Mt')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (7, N'Area Sq.Mt', N'Double', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Rented')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (8, N'Rented', N'Boolean', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'IsRenter')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Owner Type')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (9, N'Owner Type', N'String', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'OwnerTypeId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Property Type')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (10, N'Property Type', N'String', 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL, N'PropertyTypeId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Sub Floor')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (11, N'Sub Floor', N'String', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'SubFloorId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Occupancy Certificate')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (13, N'Occupancy Certificate', N'Boolean', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'OccupancyCertificate')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Commencement Certificate')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (14, N'Commencement Certificate', N'Boolean', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'CommencementCertificate')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Carpet Area SqMeter')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (15, N'Carpet Area SqMeter', N'Double', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'CarpetAreaSqMeter')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Builtup Area SqMeter')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (16, N'Builtup Area SqMeter', N'Double', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'BuiltupAreaSqMeter')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Carpet Area SqFeet')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (17, N'Carpet Area SqFeet', N'Double', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'CarpetAreaSqFeet')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Builtup Area SqFeet')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (18, N'Builtup Area SqFeet', N'Double', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'BuiltupAreaSqFeet')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Type Of Use')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (19, N'Type Of Use', N'Int', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'TypeOfUseId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Amenity')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (1011, N'Amenity', N'String', 1, 1, CAST(N'2026-06-09T12:42:27.143' AS DateTime), NULL, NULL, N'SocialAttributeId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Category')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (1013, N'Category', N'String', 1, 1, CAST(N'2026-06-17T15:16:02.797' AS DateTime), NULL, NULL, N'CategoryId')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Total Floors')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (2013, N'Total Floors', N'Int', 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL, N'BuildingMaxFloorSequence')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Tax Liability')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (3013, N'Tax Liability', N'String', 1, 1, CAST(N'2026-07-06T12:31:02.063' AS DateTime), NULL, NULL, N'TaxLiability')
GO

IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Rateable Value')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (3014, N'Rateable Value', N'Int', 1, 1, CAST(N'2026-07-06T12:31:02.063' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Toilet Count')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (3015, N'Toilet Count', N'Int', 1, 1, CAST(N'2026-07-06T12:31:02.063' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RulesFieldMaster] WHERE [FieldName] = N'Road Width')
    INSERT [PTIS].[RulesFieldMaster] ([Id], [FieldName], [FieldType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [DatabaseColumnName]) VALUES (3016, N'Road Width', N'Int', 1, 1, CAST(N'2026-07-06T12:31:02.063' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[RulesFieldMaster] OFF
GO

SET IDENTITY_INSERT [PTIS].[RuleCategoryMaster] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleCategoryMaster] WHERE [CategoryCode] = N'RV')
    INSERT [PTIS].[RuleCategoryMaster] ([Id], [CategoryCode], [CategoryName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'RV', N'RV (Rateable Value)', N'Rules applicable to Rateable Value method', 1, 1, 1, CAST(N'2026-05-28T14:31:42.670' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleCategoryMaster] WHERE [CategoryCode] = N'CV')
    INSERT [PTIS].[RuleCategoryMaster] ([Id], [CategoryCode], [CategoryName], [Description], [SortOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'CV', N'CV (Capital Value)', N'Rules applicable to Capital Value method', 2, 1, 1, CAST(N'2026-05-28T14:31:42.670' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[RuleCategoryMaster] OFF
GO

SET IDENTITY_INSERT [PTIS].[RuleEffectTypeMaster] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleEffectTypeMaster] WHERE [EffectType] = N'Increase %')
    INSERT [PTIS].[RuleEffectTypeMaster] ([Id], [EffectType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Increase %', 1, 1, CAST(N'2026-05-05T19:03:44.857' AS DateTime), 1, CAST(N'2026-05-05T19:04:14.420' AS DateTime))
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleEffectTypeMaster] WHERE [EffectType] = N'Decrease %')
    INSERT [PTIS].[RuleEffectTypeMaster] ([Id], [EffectType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Decrease %', 1, 1, CAST(N'2026-05-18T14:22:05.493' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleEffectTypeMaster] WHERE [EffectType] = N'Multiply')
    INSERT [PTIS].[RuleEffectTypeMaster] ([Id], [EffectType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (3, N'Multiply', 1, 1, CAST(N'2026-07-18T15:57:24.273' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleEffectTypeMaster] WHERE [EffectType] = N'RateLookup')
    INSERT [PTIS].[RuleEffectTypeMaster] ([Id], [EffectType], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (4, N'RateLookup', 1, 1, CAST(N'2026-07-22T12:02:34.953' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[RuleEffectTypeMaster] OFF
GO

BEGIN TRY
    SET IDENTITY_INSERT [PTIS].[RuleOperatorMaster] ON;

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'=')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'=', N'Equal To', 1, 1, CAST(N'2026-05-07T12:40:19.087' AS DateTime), 0, CAST(N'2026-05-07T12:40:54.183' AS DateTime));

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'!=')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'!=', N'Not Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'>')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'>', N'Greater Than', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'<')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'<', N'Less Than', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'>=')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'>=', N'Greater Than Or Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'<=')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'<=', N'Less Than Or Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'In')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'In', N'Value exists in list', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Not In')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Not In', N'Value does not exist in list', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Contains Any')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Contains Any', N'Contains any matching value', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Contains All')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'Contains All', N'Contains all matching values', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Between')
        INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'Between', N'Value Between Range', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL);

    SET IDENTITY_INSERT [PTIS].[RuleOperatorMaster] OFF;
END TRY
BEGIN CATCH
    SET IDENTITY_INSERT [PTIS].[RuleOperatorMaster] OFF;
    THROW;
END CATCH;
GO

BEGIN TRY
    SET IDENTITY_INSERT [PTIS].[PropertyRuleEvaluationMaster] ON;

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[PropertyRuleEvaluationMaster] WHERE [Id] = 1)
        INSERT [PTIS].[PropertyRuleEvaluationMaster] ([Id], [ParameterCode], [ParameterName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Rate', N'Rate', 1, 0, CAST(N'2026-05-26T13:13:56.370' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[PropertyRuleEvaluationMaster] WHERE [Id] = 5)
        INSERT [PTIS].[PropertyRuleEvaluationMaster] ([Id], [ParameterCode], [ParameterName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Rent', N'Rent', 1, 1, CAST(N'2026-07-20T18:01:15.640' AS DateTime), NULL, NULL);

    IF NOT EXISTS (SELECT 1 FROM [PTIS].[PropertyRuleEvaluationMaster] WHERE [Id] = 6)
        INSERT [PTIS].[PropertyRuleEvaluationMaster] ([Id], [ParameterCode], [ParameterName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Maintenance', N'Maintenance', 1, 0, CAST(N'2026-08-04T19:04:32.650' AS DateTime), NULL, NULL);

    SET IDENTITY_INSERT [PTIS].[PropertyRuleEvaluationMaster] OFF;
END TRY
BEGIN CATCH
    SET IDENTITY_INSERT [PTIS].[PropertyRuleEvaluationMaster] OFF;
    THROW;
END CATCH;
GO

SET IDENTITY_INSERT [PTIS].[EffectTypeConfiguration] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 1)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping]) VALUES (1, 1, N'String', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:36:11.117' AS DateTime), NULL, NULL, NULL, N'PropertyRuleEvaluationMaster', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{parameterCode} - {parameterName}","additionalFields":{"parameterCode":"parameterCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 2)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping]) VALUES (2, 2, N'String', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:36:11.117' AS DateTime), NULL, NULL, NULL, N'PropertyRuleEvaluationMaster', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{parameterCode} - {parameterName}","additionalFields":{"parameterCode":"parameterCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 3)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping])
    VALUES (3, 3, N'string', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:36:11.117' AS DateTime), NULL, NULL, NULL, N'PropertyRuleEvaluationMaster', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{parameterCode} - {parameterName}","additionalFields":{"parameterCode":"parameterCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 4)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping])
    VALUES (4, 4, N'string', N'TextBox', 1, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 101, CAST(N'2026-07-04T13:37:13.747' AS DateTime), NULL, CAST(N'2026-07-04T13:39:30.047' AS DateTime), N'', N'TypeOfUseGroup', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{typeOfUseGroupCode} - {groupName}","additionalFields":{"parameterCode":"typeOfUseGroupCode"}}')
GO
SET IDENTITY_INSERT [PTIS].[EffectTypeConfiguration] OFF
GO

SET IDENTITY_INSERT [PTIS].[FieldConfiguration] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 1)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (3, 1, N'Int', N'Dropdown', 1, N'Floor', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-21T11:51:26.163' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"description","displayTemplate":"{floorCode} - {description}","additionalFields":{"floorCode":"floorCode","sequenceNo":"sequenceNo"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 2)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (4, 2, N'String', N'Dropdown', 1, N'TypeOfUseGroup', N'GET', N'{"PageSize":"-1"}', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2026-05-21T11:51:26.163' AS DateTime), 1, CAST(N'2026-05-27T17:35:26.500' AS DateTime), N'{"responsePath":"items","valuePath":"id","labelPath":"groupName","displayTemplate":"{typeOfUseGroupCode} - {groupName}","additionalFields":{"constructionCode":"constructionCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 3)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (5, 3, N'String', N'Dropdown', 1, N'ConstructionType', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"description","displayTemplate":"{constructionCode} - {description}","additionalFields":{"constructionCode":"constructionCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 4)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (6, 4, N'String', N'Dropdown', 1, N'TaxZone', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"remark","displayTemplate":"{remark}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 5)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (7, 5, N'String', N'Dropdown', 1, N'Ward', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"wardNo","displayTemplate":"{description}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 6)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (8, 6, N'Int', N'Dropdown', 1, N'AssessmentYearRange', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"fromYear","displayTemplate":"{fromYear} - {toYear}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 7)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (9, 7, N'Double', N'TextBox', 0, N'', N'', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 8)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (10, 8, N'Boolean', N'Dropdown', 0, N'', N'', N'{"PageSize":"-1"}', 1, N'[
  {
    "label": "True",
    "value": true
  },
  {
    "label": "False",
    "value": false
  }
]', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 9)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (11, 9, N'String', N'Dropdown', 1, N'OwnerType', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"ownerType","displayTemplate":"{ownerType}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 10)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (12, 10, N'String', N'Dropdown', 1, N'PropertyTypeMaster', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"propertyDescription","displayTemplate":"{type} - {propertyDescription}","additionalFields":{"type":"type"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 11)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (13, 11, N'String', N'Dropdown', 1, N'SubFloor', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-21T11:51:26.163' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"description","displayTemplate":"{subFloorCode} - {description}","additionalFields":{"subFloorCode":"subFloorCode","sequenceNo":"sequenceNo"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 13)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (15, 13, N'Boolean', N'Dropdown', 0, N'', N'', N'{"PageSize":"-1"}', 1, N'[
  {
    "label": "True",
    "value": true
  },
  {
    "label": "False",
    "value": false
  }
]', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 14)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (16, 14, N'Boolean', N'Dropdown', 0, N'', N'', N'{"PageSize":"-1"}', 1, N'[
  {
    "label": "True",
    "value": true
  },
  {
    "label": "False",
    "value": false
  }
]', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 15)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (17, 15, N'Double', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 16)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (18, 16, N'Double', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 17)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (19, 17, N'Double', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 18)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (20, 18, N'Double', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:14:23.820' AS DateTime), NULL, NULL, N'')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 19)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (22, 19, N'Int', N'Dropdown', 1, N'TypeOfUse', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-21T11:51:26.163' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"description","displayTemplate":"{typeOfUseCode} - {description}","additionalFields":{"typeOfUseCode":"typeOfUseCode","sequenceNo":"sequenceNo"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 1011)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (1013, 1011, N'String', N'Dropdown', 1, N'SocialAttribute', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, NULL, NULL, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-06-09T12:50:33.540' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"socialAttributeName","displayTemplate":"{socialAttributeName}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 1013)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (1015, 1013, N'String', N'Dropdown', 1, N'PropertyCategory', N'Get', N'{"PageSize":"-1"}', 0, N'', 1, NULL, NULL, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-06-09T12:50:33.540' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"id","labelPath":"propertyCategoryName","displayTemplate":"{propertyCategoryName}"}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 2013)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (2015, 2013, N'Int', N'Dropdown', 1, N'Floor', N'Get', N'{"PageSize":"-1"}', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2026-05-21T11:51:26.163' AS DateTime), NULL, NULL, N'{"responsePath":"items","valuePath":"sequenceNo","labelPath":"description","displayTemplate":"{floorCode} - {description}","additionalFields":{"floorCode":"floorCode","sequenceNo":"sequenceNo"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[FieldConfiguration] WHERE [RulesFieldId] = 3013)
    INSERT [PTIS].[FieldConfiguration] ([Id], [RulesFieldId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ApiResponseMapping]) VALUES (3015, 3013, N'String', N'Dropdown', 0, N'', N'', N'', 1, N'[{"label": "Self","value": "Self"},{"label": "Renter","value": "Renter"}]', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2026-07-06T12:43:17.200' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[FieldConfiguration] OFF
GO

SET IDENTITY_INSERT [PTIS].[RuleScopeFieldMapping] ON
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 1)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 2)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 1, 2, 2, 1, 1, CAST(N'2026-05-18T11:30:10.320' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 1, 3, 3, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 4)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 1, 4, 4, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 5)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 1, 5, 5, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 6)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 1, 6, 6, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 7)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 1, 7, 7, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 8)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 1, 8, 8, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 9)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 1, 9, 9, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 10)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 1, 10, 10, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 11)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 1, 11, 11, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 13)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 1, 13, 13, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 14)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 1, 14, 14, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 15)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 1, 15, 15, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 16)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 1, 16, 16, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 17)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 1, 17, 17, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 18)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 1, 18, 18, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 19)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, 1, 19, 19, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 1011)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 1, 1011, 1011, 1, 1, CAST(N'2026-06-09T12:42:27.143' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 1013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 1, 1013, 1013, 1, 1, CAST(N'2026-06-17T15:24:15.270' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 2013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 1, 2013, 2013, 1, 1, CAST(N'2026-06-19T18:41:24.770' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 1, 3013, 3013, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3014)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 1, 3014, 3014, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3015)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 1, 3015, 3015, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3016)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, 1, 3016, 3016, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 1)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, 2, 1, 1, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 2)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (27, 2, 2, 2, 1, 1, CAST(N'2026-05-18T11:30:10.320' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 3)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (28, 2, 3, 3, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 4)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, 2, 4, 4, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 5)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (30, 2, 5, 5, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 6)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (31, 2, 6, 6, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 7)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (32, 2, 7, 7, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 8)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (33, 2, 8, 8, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 9)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (34, 2, 9, 9, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 10)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (35, 2, 10, 10, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 11)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (36, 2, 11, 11, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 13)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (37, 2, 13, 13, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 14)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (38, 2, 14, 14, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 15)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (39, 2, 15, 15, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 16)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (40, 2, 16, 16, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 17)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (41, 2, 17, 17, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 18)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (42, 2, 18, 18, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 19)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (43, 2, 19, 19, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 1011)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (44, 2, 1011, 1011, 1, 1, CAST(N'2026-06-09T12:42:27.143' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 1013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (45, 2, 1013, 1013, 1, 1, CAST(N'2026-06-17T15:24:15.270' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 2013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (46, 2, 2013, 2013, 1, 1, CAST(N'2026-06-19T18:41:24.770' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 3013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (47, 2, 3013, 3013, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 3014)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (48, 2, 3014, 3014, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 3015)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (49, 2, 3015, 3015, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 2 AND [RulesFieldId] = 3016)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (50, 2, 3016, 3016, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[RuleScopeFieldMapping] OFF
GO


/* ============================================================================
   1. Seed PTIS.PolicyCodeMaster
   DBA-provided final policy code list and NextPolicyCodeId workflow
   chains (OC_PARTIAL -> OC, CC_PARTIAL -> CC, ELECTRIC_PARTIAL ->
   ELECTRIC_BILL, SECTION_129 staged chain). Runs once against a fresh
   table, so it is not wrapped in a WHERE NOT EXISTS -- guarded by
   IsSeeded check below instead.
============================================================================ */

IF NOT EXISTS (SELECT 1 FROM [PTIS].[PolicyCodeMaster])
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        SET IDENTITY_INSERT [PTIS].[PolicyCodeMaster] ON;

        INSERT INTO [PTIS].[PolicyCodeMaster]
        (
            [Id],
            [PolicyCode],
            [PolicyName],
            [Description],
            [PolicyType],
            [NextPolicyCodeId],
            [IsFinalStage],
            [IsExclusive],
            [RequiresStageTracking],
            [DisplayOrder],
            [IsProtected],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (1,  'NETTAX',            N'Net Tax',                        N'Normal final calculated property tax',                                                'NORMAL',      NULL, 1, 0, 0,  1, 1, 1, 1),
        (2,  'AS_PER_OLD',        N'As Per Old',                     N'Old ULB tax is considered as the final applicable tax',                               'NORMAL',      NULL, 1, 1, 0,  2, 1, 1, 1),
        (3,  'MIN_RV',            N'Minimum RV',                     N'Minimum rateable value policy is applied',                                            'NORMAL',      NULL, 1, 1, 0,  3, 1, 1, 1),
        (4,  'RETENTION',         N'Retention',                      N'Previous tax or rateable value is retained',                                          'NORMAL',      NULL, 1, 1, 0,  4, 1, 1, 1),
        (5,  'OC_PARTIAL',        N'Partial Occupancy Certificate',  N'Prorated OC tax for the remaining days of the current financial year',                'DATE_BASED',  6,    0, 1, 1,  5, 1, 1, 1),
        (6,  'OC',                N'Occupancy Certificate',          N'Full-year tax based on the occupancy certificate',                                    'DATE_BASED',  NULL, 1, 1, 0,  6, 1, 1, 1),
        (7,  'CC_PARTIAL',        N'Partial Completion Certificate', N'Prorated CC tax for the remaining days of the current financial year',                'DATE_BASED',  8,    0, 1, 1,  7, 1, 1, 1),
        (8,  'CC',                N'Completion Certificate',         N'Full-year tax based on the completion certificate',                                   'DATE_BASED',  NULL, 1, 1, 0,  8, 1, 1, 1),
        (9,  'ELECTRIC_PARTIAL',  N'Partial Electricity Bill',       N'Prorated electricity-bill tax for the remaining days of the current financial year',  'DATE_BASED',  10,   0, 1, 1,  9, 1, 1, 1),
        (10, 'ELECTRIC_BILL',     N'Electricity Bill',               N'Full-year tax based on the electricity bill date',                                    'DATE_BASED',  NULL, 1, 1, 0, 10, 1, 1, 1),
        (11, 'SECTION_129_OLD_1', N'Section 129 - Old Tax Year 1',   N'First financial year tax is equal to old ULB tax',                                    'STAGE_BASED', 12,   0, 1, 1, 11, 1, 1, 1),
        (12, 'SECTION_129_OLD_2', N'Section 129 - Old Tax Year 2',   N'Second financial year tax is equal to old ULB tax',                                   'STAGE_BASED', 13,   0, 1, 1, 12, 1, 1, 1),
        (13, 'SECTION_129_20',    N'Section 129 - 20 Percent',       N'Section 129 twenty-percent stage',                                                     'STAGE_BASED', 14,   0, 1, 1, 13, 1, 1, 1),
        (14, 'SECTION_129_40',    N'Section 129 - 40 Percent',       N'Section 129 forty-percent stage',                                                      'STAGE_BASED', 15,   0, 1, 1, 14, 1, 1, 1),
        (15, 'SECTION_129_60',    N'Section 129 - 60 Percent',       N'Section 129 sixty-percent stage',                                                      'STAGE_BASED', 16,   0, 1, 1, 15, 1, 1, 1),
        (16, 'SECTION_129_80',    N'Section 129 - 80 Percent',       N'Section 129 eighty-percent stage',                                                     'STAGE_BASED', 17,   0, 1, 1, 16, 1, 1, 1),
        (17, 'SECTION_129_100',   N'Section 129 - 100 Percent',      N'Final Section 129 stage with full new assessment tax',                                'STAGE_BASED', NULL, 1, 1, 1, 17, 1, 1, 1),
        (18, 'HEARING',           N'Hearing',                        N'Final tax decided during hearing',                                                     'DECISION',    NULL, 1, 1, 0, 18, 1, 1, 1),
        (19, 'APPEAL_COMMITTEE',  N'Appeal Committee',               N'Final tax decided by the appeal committee',                                            'DECISION',    NULL, 1, 1, 0, 19, 1, 1, 1),
        (20, 'REMISSION',         N'Remission',                      N'Final tax decided after remission',                                                    'DECISION',    NULL, 1, 1, 0, 20, 1, 1, 1);

        SET IDENTITY_INSERT [PTIS].[PolicyCodeMaster] OFF;

        COMMIT TRANSACTION;

        PRINT 'PTIS.PolicyCodeMaster seeded successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END
GO

------------------------------------------------------------
-- Indexes to support the NextPolicyCodeId chain and common lookups
------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_PolicyCodeMaster_NextPolicyCodeId')
    CREATE INDEX [IX_PolicyCodeMaster_NextPolicyCodeId]
    ON [PTIS].[PolicyCodeMaster]
    (
        [NextPolicyCodeId]
    );
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_PolicyCodeMaster_PolicyType_IsActive')
    CREATE INDEX [IX_PolicyCodeMaster_PolicyType_IsActive]
    ON [PTIS].[PolicyCodeMaster]
    (
        [PolicyType],
        [IsActive]
    )
    INCLUDE
    (
        [PolicyCode],
        [PolicyName],
        [IsFinalStage],
        [IsExclusive],
        [RequiresStageTracking]
    );
GO
/* ============================================================================
   2. Seed PTIS.CertificateTaxGuideline
   Row-wise defaults, one row per individual setting. Admin can add,
   edit or deactivate rows from the Guideline Master UI without any
   schema change.
============================================================================ */

INSERT INTO PTIS.CertificateTaxGuideline
(
    GuidelineCode,
    GuidelineName,
    Description,
    GuidelineGroup,
    DisplayOrder,
    DataType,
    GuidelineValue,
    AllowedValues
)
SELECT
    v.GuidelineCode,
    v.GuidelineName,
    v.Description,
    v.GuidelineGroup,
    v.DisplayOrder,
    v.DataType,
    v.GuidelineValue,
    v.AllowedValues
FROM (VALUES
    ('ENABLE_CERTIFICATE_BASED_TAX',   N'Enable certificate-based tax',       N'Master switch for CC/OC/Electric Bill certificate-based tax calculation.',                                   'GENERAL',       1, 'BIT',     '1',                    NULL),
    ('APPLY_ONLY_PROTECTED_CERT_TYPES', N'Apply only protected certificate types', N'Only IsProtected certificate types participate in tax calculation.',                                  'GENERAL',       2, 'BIT',     '1',                    NULL),
    ('FINANCIAL_YEAR_START_MONTH',     N'Financial year start month',         N'Month the financial year starts.',                                                                           'GENERAL',       3, 'INT',     '4',                    '1-12'),
    ('FINANCIAL_YEAR_START_DAY',       N'Financial year start day',           N'Day of month the financial year starts.',                                                                    'GENERAL',       4, 'INT',     '1',                    '1-31'),

    ('DATE_PRIORITY_1',                N'Certificate date priority 1',        N'Highest-priority certificate date source when multiple dates exist for a property.',                        'DATE_PRIORITY', 1, 'VARCHAR', 'OC',                   'RETROSPECTIVE,ELECTRIC_BILL,CC,OC'),
    ('DATE_PRIORITY_2',                N'Certificate date priority 2',        N'Second-priority certificate date source.',                                                                   'DATE_PRIORITY', 2, 'VARCHAR', 'CC',                   'RETROSPECTIVE,ELECTRIC_BILL,CC,OC'),
    ('DATE_PRIORITY_3',                N'Certificate date priority 3',        N'Third-priority certificate date source.',                                                                    'DATE_PRIORITY', 3, 'VARCHAR', 'ELECTRIC_BILL',        'RETROSPECTIVE,ELECTRIC_BILL,CC,OC'),
    ('DATE_PRIORITY_4',                N'Certificate date priority 4',        N'Lowest-priority / fallback certificate date source.',                                                        'DATE_PRIORITY', 4, 'VARCHAR', 'RETROSPECTIVE',        'RETROSPECTIVE,ELECTRIC_BILL,CC,OC'),

    ('ENABLE_CC_TO_OC_SPLIT',          N'Enable CC to OC split',              N'Whether CC-period and OC-period tax are calculated as separate spans.',                                     'CC_OC',         1, 'BIT',     '1',                    NULL),
    ('IGNORE_CC_TO_OC_WITHIN_VALUE',   N'Ignore CC to OC gap within value',   N'If the CC-to-OC gap is within this value (see IGNORE_CC_TO_OC_WITHIN_TYPE), the split is ignored.',           'CC_OC',         2, 'INT',     '6',                    NULL),
    ('IGNORE_CC_TO_OC_WITHIN_TYPE',    N'Ignore CC to OC gap within type',    N'Unit for IGNORE_CC_TO_OC_WITHIN_VALUE.',                                                                     'CC_OC',         3, 'VARCHAR', 'MONTHS',               'YEARS,MONTHS,DAYS'),
    ('CC_PERIOD_MULTIPLIER',           N'CC period multiplier',               N'CC-period tax is calculated at this multiple of the normal rate.',                                          'CC',            1, 'DECIMAL', '1.5000',               NULL),
    ('OC_PERIOD_MULTIPLIER',           N'OC period multiplier',               N'OC-period tax multiplier. OC retrospective tax is day-wise and uncapped for this ULB -- NO_DATE_LOOKBACK_YEARS does not apply to the OC path.', 'OC', 1, 'DECIMAL', '1.0000', NULL),

    ('ELECTRIC_BILL_DATE_RULE',        N'Electric Bill date rule',            N'How the electric-bill date is used to backdate unauthorized-property tax. Never backdated before FY 2016 (fixed floor, enforced by app logic).', 'ELECTRIC_BILL', 1, 'VARCHAR', 'EXACT_DATE',       'NO_TAX,ADD_MONTHS,FROM_FY_START,EXACT_DATE'),
    ('ELECTRIC_BILL_ADD_MONTHS',       N'Electric Bill add months',           N'Months added to the electric-bill date when ELECTRIC_BILL_DATE_RULE = ADD_MONTHS.',                          'ELECTRIC_BILL', 2, 'INT',     '0',                    NULL),
    ('ELECTRIC_BILL_MULTIPLIER',       N'Electric Bill multiplier',           N'Electric-Bill-based tax multiplier for unauthorized properties.',                                             'ELECTRIC_BILL', 3, 'DECIMAL', '1.0000',               NULL),

    ('NO_DATE_RULE',                   N'No-date fallback rule',              N'How tax is calculated when no certificate date exists at all.',                                             'NO_DATE',       1, 'VARCHAR', 'DEFAULT_RETROSPECTIVE', 'ASSESSMENT_YEAR,CONSTRUCTION_YEAR,NO_TAX,DEFAULT_RETROSPECTIVE'),
    ('NO_DATE_LOOKBACK_YEARS',         N'No-date lookback years',             N'Retrospective lookback cap, in years, for the NO_DATE_RULE fallback only.',                                  'NO_DATE',       2, 'INT',     '5',                    NULL),
    ('NO_DATE_RETROSPECTIVE_MULTIPLIER', N'No-date retrospective multiplier', N'Tax multiplier applied under the NO_DATE_RULE fallback.',                                                   'NO_DATE',       3, 'DECIMAL', '1.0000',               NULL),

    ('FLOOR_CERTIFICATE_PRIORITY',     N'Floor certificate priority',         N'Whether a property-wise or floor-wise certificate takes priority when both exist.',                          'FLOOR',         1, 'VARCHAR', 'PROPERTY_OVERRIDES_FLOOR', 'PROPERTY_OVERRIDES_FLOOR,FLOOR_OVERRIDES_PROPERTY'),

    ('ENABLE_CURRENT_YEAR_PRORATION',  N'Enable current year proration',      N'Whether the current financial year''s tax is prorated from the certificate date.',                           'PRORATION',     1, 'BIT',     '1',                    NULL),
    ('PRORATION_METHOD',               N'Proration method',                   N'Method used to prorate the current financial year''s tax.',                                                 'PRORATION',     2, 'VARCHAR', 'DAILY',                'FULL_YEAR,MONTHLY,DAILY'),
    ('TAX_PERSISTENCE_MODE',           N'Tax persistence mode',               N'Whether calculated tax is persisted per-floor or aggregated at the property level.',                         'PRORATION',     3, 'VARCHAR', 'PROPERTY_AGGREGATED',  'FLOOR_LEDGER,PROPERTY_AGGREGATED')
) v
(
    GuidelineCode,
    GuidelineName,
    Description,
    GuidelineGroup,
    DisplayOrder,
    DataType,
    GuidelineValue,
    AllowedValues
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.CertificateTaxGuideline g
    WHERE g.GuidelineCode = v.GuidelineCode
);
GO
/* ============================================================================
   3. Seed PTIS.PropertyCertificateTypeMaster
============================================================================ */

SET IDENTITY_INSERT [PTIS].[PropertyCertificateTypeMaster] ON;

INSERT INTO PTIS.PropertyCertificateTypeMaster
(
    Id,
    CertificateTypeCode,
    CertificateTypeName,
    Description,
    DisplayOrder,
    IsTaxable,
    IsProtected,
    IsRequired,
    IsActive
)
SELECT
    v.Id,
    v.CertificateTypeCode,
    v.CertificateTypeName,
    v.Description,
    v.DisplayOrder,
    v.IsTaxable,
    v.IsProtected,
    v.IsRequired,
    1
FROM (VALUES
    (1, 'CC',                      N'Completion Certificate',   N'Completion Certificate used for CC based occupation tax calculation.',                      1,  1, 1, 1),
    (2, 'OC',                      N'Occupancy Certificate',    N'Occupancy Certificate used for OC based occupation tax calculation.',                       2,  1, 1, 1),
    (3, 'EleBillDt',               N'Electric Bill Date',       N'Electric Bill Date used as fallback certificate date for occupation tax calculation.',       3,  1, 1, 0)
    -- (4, 'POSSESSION_CERTIFICATE',  N'Possession Certificate',   N'Possession Certificate for document record purpose. Tax calculation disabled by default.',   4,  0, 0, 0),
    -- (5, 'INDEX_2',                 N'Index 2',                  N'Index 2 document for property record purpose. Tax calculation disabled by default.',         5,  0, 0, 0),
    -- (6, 'AGREEMENT',               N'Agreement',                N'Agreement document for property record purpose. Tax calculation disabled by default.',        6,  0, 0, 0),
    -- (7, 'SALE_DEED',               N'Sale Deed',                N'Sale Deed document for property record purpose. Tax calculation disabled by default.',        7,  0, 0, 0),
    -- (8, 'TAX_RECEIPT',             N'Tax Receipt',              N'Tax Receipt document for property record purpose. Tax calculation disabled by default.',      8,  0, 0, 0),
    -- (9, 'OTHER',                   N'Other',                    N'Other certificate or supporting document.',                                                 99, 0, 0, 0)
) v
(
    Id,
    CertificateTypeCode,
    CertificateTypeName,
    Description,
    DisplayOrder,
    IsTaxable,
    IsProtected,
    IsRequired
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.PropertyCertificateTypeMaster c
    WHERE c.CertificateTypeCode = v.CertificateTypeCode
);

SET IDENTITY_INSERT [PTIS].[PropertyCertificateTypeMaster] OFF;
GO
/* ============================================================================
   4. Seed PTIS.PropertyCertificates
   No default seed data required.

   Reason:
   This is a transaction table.
   Records must be inserted from Building Permission / Certificate Upload API
   against real PropertyId, PropertyDetailsId and DocumentBindingId.
============================================================================ */

/* ============================================================================
   1. Seed PTIS.RuleEngineMaster
        Thane Rules
============================================================================ */

SET IDENTITY_INSERT [PTIS].[RuleEngineMaster] ON
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (1, N'RULE-20260717-0001', N'Increase Rate', N'If building have Club House or Swimming  Pool then rate increase by 20%', N'RV', N'{"RuleName":"Increase Rate","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"5d38d1bf-86a0-4c06-a15f-6d5179cf225c","errorMessage":"If building have Club House or Swimming  Pool then rate increase by 20%.","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.CategoryId == (1) && (input.TypeOfUseId == 86 || input.TypeOfUseId == 104 || input.TypeOfUseId == 85 || input.TypeOfUseId == 14033)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 + 20 / 100)","effectType":"Increase %","value":"20","ParameterCode":"input.Rate"}]}}},"stopProcessing":true},{"RuleCode":"d9410f8e-4637-42b9-86c6-ba5e3f5df198","errorMessage":"If building having lift and floor above 10th then increase rate by 10%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.CategoryId == 1 || input.CategoryId == 2) && input.SocialAttributeId.Contains(28) && input.BuildingMaxFloorSequence > 21","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 + 10 / 100)","effectType":"Increase %","value":"10","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"985b6c26-b37f-41d0-a1b0-2367b919c033","errorMessage":"If building having lift and floor upto 10th then increase rate by 5%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.BuildingMaxFloorSequence <= 21 && input.SocialAttributeId.Contains(28)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 + 5 / 100)","effectType":"Increase %","value":"5","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 1, 1, 1, 1, CAST(N'2026-07-17T18:11:43.717' AS DateTime), 1, CAST(N'2026-07-20T16:27:46.540' AS DateTime), N'[{"id":"5d38d1bf-86a0-4c06-a15f-6d5179cf225c","description":"If building have Club House or Swimming  Pool then rate increase by 20%.","conditions":{"id":"1fed7e7b-43dd-42df-922d-f26a1506b048","logicalOperator":"AND","conditions":[{"id":"bb643f85-4f6a-4cd4-8c48-140a43037801","fieldId":"CategoryId","operator":"=","value":["1"],"valueLabel":["Apartment"]},{"id":"4113fc95-34f3-4cdf-bc13-29ecb9a8f108","fieldId":"TypeOfUseId","operator":"In","value":["86","104","85","14033"],"valueLabel":["ASWC - à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤¸à¥à¤µà¤¿à¤®à¤¿à¤‚à¤— à¤ªà¥‚à¤² C","ASW - à¤¸à¥‹à¤¸à¤¾à¤¯à¤Ÿà¥€ à¤¸à¥à¤µà¤¿à¤®à¤¿à¤‚à¤— à¤ªà¥‚à¤²","ACHC - à¤•à¥à¤²à¤¬ à¤¹à¤¾à¤Šà¤¸ C","ACH - à¤•à¥à¤²à¤¬ à¤¹à¤¾à¤Šà¤¸"]}],"groups":[]},"effect":[{"effectType":"Increase %","value":20,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Increase %","value":20,"isPercentage":true,"overrideRate":1}],"stopProcessing":true,"ruleScopeName":"Property Level"},{"id":"d9410f8e-4637-42b9-86c6-ba5e3f5df198","description":"If building having lift and floor above 10th then increase rate by 10%","conditions":{"id":"9383f25a-0ceb-44a1-8c3a-de6027bafc0d","logicalOperator":"AND","conditions":[{"id":"4a4fc553-563a-4f83-b5e5-5616a0362e62","fieldId":"CategoryId","operator":"In","value":["1","2"],"valueLabel":["Apartment","Individual"]},{"id":"dd06caab-04f7-4f8c-9cc7-f560ba2ad96f","fieldId":"SocialAttributeId","operator":"=","value":"28","valueLabel":"Lift Available"},{"id":"161d5be5-473f-4284-90dc-c074023a59e8","fieldId":"BuildingMaxFloorSequence","operator":">","value":"21","valueLabel":"10 - à¤¦à¤¹à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾"}],"groups":[]},"effect":[{"effectType":"Increase %","value":10,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Increase %","value":10,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"},{"id":"985b6c26-b37f-41d0-a1b0-2367b919c033","description":"If building having lift and floor upto 10th then increase rate by 5%","conditions":{"id":"30ef5bc0-67f9-41a1-994a-b926fd12b106","logicalOperator":"AND","conditions":[{"id":"8e4ff554-cd14-4185-8d4a-d5265b9bff62","fieldId":"BuildingMaxFloorSequence","operator":"<=","value":"21","valueLabel":"10 - à¤¦à¤¹à¤¾à¤µà¤¾ à¤®à¤œà¤²à¤¾"},{"id":"d7e94c88-51e4-48ba-94a3-9394c6e923c1","fieldId":"SocialAttributeId","operator":"=","value":"28","valueLabel":"Lift Available"}],"groups":[]},"effect":[{"effectType":"Increase %","value":5,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Increase %","value":5,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Increase %","value":20,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (2, N'RULE-20260718-0001', N'Basement Property Rule', N'If Commercial use in Basement floor then decrees rate by 20%', N'RV', N'{"RuleName":"Basement Property Rule","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"b12107d8-f611-4362-a65f-adc25f0b21a6","errorMessage":"If lower ground  floor use as Commercial  then decrees rate by 20%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.FloorId == 70 || input.FloorId == 71 || input.FloorId == 72 || input.FloorId == 73 || input.FloorId == 74 || input.FloorId == 75 || input.FloorId == 66) && (input.TypeOfUseGroupId == 2 || input.TypeOfUseGroupId == 3)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 20 / 100)","effectType":"Decrease %","value":"20","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"178071ab-9b1f-4fad-a3b9-dc001e87cb57","errorMessage":"if floor is basment then decrease rate 40%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.FloorId == (65)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 40 / 100)","effectType":"Decrease %","value":"40","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 3, 1, 1, 1, CAST(N'2026-07-18T13:23:26.083' AS DateTime), 1, CAST(N'2026-07-20T16:09:54.283' AS DateTime), N'[{"id":"b12107d8-f611-4362-a65f-adc25f0b21a6","description":"If lower ground  floor use as Commercial  then decrees rate by 20%","conditions":{"id":"1199c91b-64f8-45ea-9be1-61a65cc43f37","logicalOperator":"AND","conditions":[{"id":"a7d96501-c76d-4821-aae2-1f90db2632f5","fieldId":"FloorId","operator":"In","value":["70","71","72","73","74","75","66"],"valueLabel":["P1 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®1","P2 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®2","P3 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®3","P4 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®4","P5 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®5","P6 - à¤ªà¥‹à¤¡à¤¿à¤¯à¤®6","L - à¤²à¥‹à¤…à¤° à¤¤à¤³à¤®à¤œà¤²à¤¾"]},{"id":"2a899496-e3c4-44e1-a697-5001ad33214e","fieldId":"TypeOfUseGroupId","operator":"In","value":["2","3"],"valueLabel":["C - à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•","I - à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•"]}],"groups":[]},"effect":[{"effectType":"Decrease %","value":20,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":20,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"},{"id":"178071ab-9b1f-4fad-a3b9-dc001e87cb57","description":"if floor is basment then decrease rate 40%","conditions":{"id":"6d8e28db-e68e-41c8-a59e-2d3d81471bfe","logicalOperator":"AND","conditions":[{"id":"9a5acf8e-fba4-4e52-bdc6-51829c91da5c","fieldId":"FloorId","operator":"=","value":["65"],"valueLabel":["B - à¤¤à¤³à¤˜à¤°"]}],"groups":[]},"effect":[{"effectType":"Decrease %","value":40,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":40,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":20,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (3, N'RULE-20260718-0002', N'Commercial Floor Wise Decrees  20% Rate', N'Commercial Floor Wise Decrees  20% Rate', N'RV', N'{"RuleName":"Commercial Floor Wise Decrees  20% Rate","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"a97af7b4-c73b-47ff-8182-edc5edaacf5d","errorMessage":"Floor equal to first and use is commercial then decrease rate by 10 %","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.FloorId == 1 && (input.TypeOfUseGroupId == 2 || input.TypeOfUseGroupId == 3)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 10 / 100)","effectType":"Decrease %","value":"10","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"d4a44548-eaec-4130-8015-e0aae8749f1b","errorMessage":"Commercial Floor Wise Decrees  20% Rate","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.FloorId > 1 && (input.TypeOfUseGroupId == 2 || input.TypeOfUseGroupId == 3)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 20 / 100)","effectType":"Decrease %","value":"20","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 1, 1, 1, 1, CAST(N'2026-07-18T13:28:30.783' AS DateTime), 1, CAST(N'2026-07-22T16:33:47.763' AS DateTime), N'[{"id":"a97af7b4-c73b-47ff-8182-edc5edaacf5d","description":"Floor equal to first and use is commercial then decrease rate by 10 %","conditions":{"id":"c62c8773-3ba2-44c0-b5c1-52d607a55263","logicalOperator":"AND","conditions":[{"id":"d27481ef-a9ef-439d-a8a0-94f4f94d3ba0","fieldId":"FloorId","operator":"=","value":"1","valueLabel":"1 - à¤ªà¤¹à¤¿à¤²à¤¾ à¤®à¤œà¤²à¤¾"},{"id":"80b4ee59-8b7d-45f0-9efc-b6f8ff0c33b7","fieldId":"TypeOfUseGroupId","operator":"In","value":["2","3"],"valueLabel":["C - à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•","I - à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•"]}],"groups":[]},"effects":[{"effectType":"Decrease %","value":10,"isPercentage":true,"overrideRate":1}],"effect":[{"effectType":"Decrease %","value":10,"isPercentage":true,"overrideRate":1}],"ruleScopeName":"Property Level"},{"id":"d4a44548-eaec-4130-8015-e0aae8749f1b","description":"Commercial Floor Wise Decrees  20% Rate","conditions":{"id":"f6ece9b0-348f-49ce-92c0-df6264ccaca5","logicalOperator":"AND","conditions":[{"id":"49467857-4eda-45e6-8560-b0454380d421","fieldId":"FloorId","operator":">","value":"1","valueLabel":"1 - à¤ªà¤¹à¤¿à¤²à¤¾ à¤®à¤œà¤²à¤¾"},{"id":"189bc7d5-f1f9-47f9-829f-7c2fff935245","fieldId":"TypeOfUseGroupId","operator":"In","value":["2","3"],"valueLabel":["C - à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•","I - à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•"]}],"groups":[]},"effect":[{"effectType":"Decrease %","value":20,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":20,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":10,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (4, N'RULE-20260718-0003', N'Terrace Balcony Rate 40%', N'Terrace Balcony Rate 40%', N'RV', N'{"RuleName":"Terrace Balcony Rate 40%","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"3c947489-1e0c-41fd-8eec-8edc3563ca0d","errorMessage":"Terrace Balcony Rate 40%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.TypeOfUseId == 21 || input.TypeOfUseId == 22 || input.TypeOfUseId == 84 || input.TypeOfUseId == 14031 || input.TypeOfUseId == 14032)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 60 / 100)","effectType":"Decrease %","value":"60","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 1, 1, 1, 1, CAST(N'2026-07-18T13:34:54.843' AS DateTime), 1, CAST(N'2026-07-20T16:05:18.160' AS DateTime), N'[{"id":"3c947489-1e0c-41fd-8eec-8edc3563ca0d","description":"Terrace Balcony Rate 40%","conditions":{"id":"34a67af8-fcec-4c1d-b00d-f3516dc39f16","logicalOperator":"AND","conditions":[{"id":"65f4bc23-32ed-42de-9ad5-19a722dc14c3","fieldId":"TypeOfUseId","operator":"In","value":["21","22","84","14031","14032"],"valueLabel":["ABLOP - à¤“à¤ªà¤¨ à¤Ÿà¥‡à¤°à¥‡à¤¸","ABLR - à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ ","ABLC - à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€","ABL-EP - à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€ à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤•","ABLRC - à¤Ÿà¥‡à¤°à¥‡à¤¸-à¤¬à¤¾à¤²à¥à¤•à¤¨à¥€-C"]}],"groups":[]},"effect":[{"effectType":"Decrease %","value":60,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":60,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":60,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (5, N'RULE-20260718-0004', N'Parking Rate Decrease', N'If property use is Steel Parking the decrees rate by 50%', N'RV', N'{"RuleName":"Parking Rate Decrease","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"ca86747c-bf92-4d94-87d6-78a7b254f016","errorMessage":"If property use is Steel Parking the decrees rate by 50%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.TypeOfUseId == 2 || input.TypeOfUseId == 74 || input.TypeOfUseId == 88 || input.TypeOfUseId == 14047 || input.TypeOfUseId == 14048) && input.FloorId == 65","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 50 / 100)","effectType":"Decrease %","value":"50","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"789186a6-8494-4b61-9a73-b84c399d070f","errorMessage":"If property use is Open Parking the decrees rate by 75%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.TypeOfUseId == 9 || input.TypeOfUseId == 73 || input.TypeOfUseId == 87 || input.TypeOfUseId == 14045) && input.FloorId == 65","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 75 / 100)","effectType":"Decrease %","value":"75","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"85801e66-4608-4eaf-b8d8-01e06b4f9d3a","errorMessage":"if Basement use as parking then decrees rate by 50%","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"(input.FloorId == 65) && (input.TypeOfUseId == 9 || input.TypeOfUseId == 73 || input.TypeOfUseId == 87 || input.TypeOfUseId == 14045 || input.TypeOfUseId == 2 || input.TypeOfUseId == 74 || input.TypeOfUseId == 88 || input.TypeOfUseId == 14047 || input.TypeOfUseId == 14048)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 50 / 100)","effectType":"Decrease %","value":"50","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 6, 1, 1, 1, CAST(N'2026-07-18T13:37:09.103' AS DateTime), 1, CAST(N'2026-07-18T13:50:53.333' AS DateTime), N'[{"id":"ca86747c-bf92-4d94-87d6-78a7b254f016","description":"If property use is Steel Parking the decrees rate by 50%","conditions":{"id":"75992bf0-68dd-4f1f-b3fa-ac6fcbf292b7","logicalOperator":"AND","conditions":[{"id":"dfbfaf4a-cbd5-4ed5-8f0b-e3121458fc41","fieldId":"TypeOfUseId","operator":"In","value":["2","74","88","14047","14048"],"valueLabel":["SPK - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—","SPKC - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€","SPKI - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•","SPK-EG - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤…à¤¨à¥à¤¦à¤¾à¤¨à¤¿à¤¤","SPKR - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-C"]},{"id":"f1267cd1-223b-4837-b03e-3bb80497f003","fieldId":"FloorId","operator":"?","value":"65","valueLabel":"B - à¤¤à¤³à¤˜à¤°"}],"groups":[]},"effect":[{"effectType":"Decrease %","value":50,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":50,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"},{"id":"789186a6-8494-4b61-9a73-b84c399d070f","description":"If property use is Open Parking the decrees rate by 75%","conditions":{"id":"a0fe374b-39d1-4562-81f2-ac0b7821f030","logicalOperator":"AND","conditions":[{"id":"351c451d-c1c4-4b3d-9eae-6b56397673ef","fieldId":"TypeOfUseId","operator":"In","value":["9","73","87","14045"],"valueLabel":["OPK - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—","OPKC - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€","OPKI - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•","OPK-EG - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤…à¤¨à¥à¤¦à¤¾à¤¨à¤¿à¤¤"]},{"id":"d82a68ea-036b-40a1-a754-b9721a9ca27d","fieldId":"FloorId","operator":"?","value":"65","valueLabel":"B - à¤¤à¤³à¤˜à¤°"}],"groups":[]},"effect":[{"effectType":"Decrease %","value":75,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Decrease %","value":75,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"},{"id":"85801e66-4608-4eaf-b8d8-01e06b4f9d3a","description":"if Basement use as parking then decrees rate by 50%","conditions":{"id":"9e6164f9-0dcb-4f90-8fae-eb8ff3f7d1bb","logicalOperator":"AND","conditions":[{"id":"390b58de-4abd-4163-903b-4e8b40673744","fieldId":"FloorId","operator":"In","value":["65"],"valueLabel":["B - à¤¤à¤³à¤˜à¤°"]},{"id":"7039250e-9967-4509-9890-bce0cb8bd6fe","fieldId":"TypeOfUseId","operator":"In","value":["9","73","87","14045","2","74","88","14047","14048"],"valueLabel":["OPK - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—","OPKC - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€","OPKI - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•","OPK-EG - à¤“à¤ªà¤¨ à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤…à¤¨à¥à¤¦à¤¾à¤¨à¤¿à¤¤","SPK - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—","SPKC - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤…à¤¨à¤¿à¤µà¤¾à¤¸à¥€","SPKI - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤— à¤”à¤¦à¤¯à¥‹à¤—à¤¿à¤•","SPK-EG - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-à¤¶à¥ˆà¤•à¥à¤·à¤£à¤¿à¤• à¤®à¤¾à¤²à¤®à¤¤à¥à¤¤à¤¾ à¤…à¤¨à¥à¤¦à¤¾à¤¨à¤¿à¤¤","SPKR - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-C"]}],"groups":[]},"effects":[{"effectType":"Decrease %","value":50,"isPercentage":true,"overrideRate":1}],"effect":[{"effectType":"Decrease %","value":50,"isPercentage":true,"overrideRate":1}],"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":50,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (6, N'RULE-20260718-0005', N'Mezzanine Floor Rule', N'If Mezzanine Floor then rate decrease by 30%', N'RV', N'{"RuleName":"Mezzanine Floor Rule","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"40ebdba9-a805-4391-8dab-2730c921281f","errorMessage":"If Mezzanine Floor then rate decrease by 30%   ","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.FloorId == (76)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 30 / 100)","effectType":"Decrease %","value":"30","ParameterCode":"Rate","overrideRate":"1","overrideRateLabel":"Rate - Rate"}]}}},"stopProcessing":false}]}', 7, 1, 1, 1, CAST(N'2026-07-18T14:07:58.297' AS DateTime), 1, CAST(N'2026-07-21T13:34:14.857' AS DateTime), N'[{"id":"40ebdba9-a805-4391-8dab-2730c921281f","description":"If Mezzanine Floor then rate decrease by 30%   ","conditions":{"id":"b139740f-871d-4b92-8687-f4432827279d","logicalOperator":"AND","conditions":[{"id":"b87c8288-2edc-45c2-ab0d-b4c28514b0df","fieldId":"FloorId","operator":"=","value":["76"],"valueLabel":["M - à¤ªà¥‰à¤Ÿà¤®à¤¾à¤³à¤¾"]}],"groups":[]},"effects":[{"effectType":"Decrease %","value":30,"isPercentage":true,"overrideRate":1,"overrideRateLabel":"Rate - Rate","parameterCode":"Rate"}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":30,"isPercentage":true,"overrideRate":1,"overrideRateLabel":"Rate - Rate","parameterCode":"Rate"}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (7, N'RULE-20260720-0001', N'Rented Property Rule', N'If a property is rented out and is being used for non-residential purposes, and the property tax is paid by the owner, then 20% of the total annual rent shall be considered as the taxable value for the purpose of property tax assessment.', N'RV', N'{"RuleName":"Rented Property Rule","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"1746ff82-d571-4b3b-a49f-71161f441762","errorMessage":"If a property is rented out and is being used for non-residential purposes, and the property tax is paid by the owner, then 20% of the total annual rent shall be considered as the taxable value for the purpose of property tax assessment.","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.IsRenter == true && (input.TypeOfUseGroupId == 2 || input.TypeOfUseGroupId == 3) && input.TaxLiability == \"Self\"","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 80 / 100)","effectType":"Decrease %","value":"80","ParameterCode":"input.Rate"}]}}},"stopProcessing":false},{"RuleCode":"4fa019c9-5f88-4274-a0bb-03076f8e3242","errorMessage":"If a property is rented out and is being used for non-residential purposes, and the property tax is paid by the renter, then 40% of the total annual rent shall be considered as the taxable value for the purpose of property tax assessment.","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.IsRenter == true && input.TaxLiability == \"Renter\" && (input.TypeOfUseGroupId == 2 || input.TypeOfUseGroupId == 3)","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * (1 - 60 / 100)","effectType":"Decrease %","value":"60","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 8, 1, 1, 1, CAST(N'2026-07-20T18:25:10.933' AS DateTime), 1, CAST(N'2026-07-21T11:28:22.287' AS DateTime), N'[{"id":"1746ff82-d571-4b3b-a49f-71161f441762","description":"If a property is rented out and is being used for non-residential purposes, and the property tax is paid by the owner, then 20% of the total annual rent shall be considered as the taxable value for the purpose of property tax assessment.","conditions":{"id":"447d065c-4f99-4679-9de9-2417f872d824","logicalOperator":"AND","conditions":[{"id":"339875b0-fc21-41fe-886f-02a94a330723","fieldId":"IsRenter","operator":"=","value":true,"valueLabel":"True"},{"id":"0a09a6b3-4f5d-4eea-8073-e7d67b95626d","fieldId":"TypeOfUseGroupId","operator":"In","value":["2","3"],"valueLabel":["C - à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•","I - à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•"]},{"id":"8c9991ec-7f7e-4e26-bca6-80e8416311af","fieldId":"TaxLiability","operator":"=","value":"Self","valueLabel":"Self"}],"groups":[]},"effect":[{"effectType":"Decrease %","value":80,"isPercentage":true,"overrideRate":5}],"effects":[{"effectType":"Decrease %","value":80,"isPercentage":true,"overrideRate":5}],"stopProcessing":false,"ruleScopeName":"Property Level"},{"id":"4fa019c9-5f88-4274-a0bb-03076f8e3242","description":"If a property is rented out and is being used for non-residential purposes, and the property tax is paid by the renter, then 40% of the total annual rent shall be considered as the taxable value for the purpose of property tax assessment.","conditions":{"id":"4c7d2de2-8270-4fe6-afd8-98d34311662c","logicalOperator":"AND","conditions":[{"id":"95719597-d156-4ef3-9088-ebb0ee1a65f5","fieldId":"IsRenter","operator":"=","value":true,"valueLabel":"True"},{"id":"8e6b6fcc-a725-4f72-a651-6c7a95274ce9","fieldId":"TaxLiability","operator":"=","value":"Renter","valueLabel":"Renter"},{"id":"1b5d94eb-0cd5-4f16-a456-b38861458b30","fieldId":"TypeOfUseGroupId","operator":"In","value":["2","3"],"valueLabel":["C - à¤µà¥à¤¯à¤¾à¤µà¤¸à¤¾à¤¯à¤¿à¤•","I - à¤”à¤¦à¥à¤¯à¥‹à¤—à¤¿à¤•"]}],"groups":[]},"effect":[{"effectType":"Decrease %","value":60,"isPercentage":true,"overrideRate":5}],"effects":[{"effectType":"Decrease %","value":60,"isPercentage":true,"overrideRate":5}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Decrease %","value":80,"isPercentage":true,"overrideRate":5}]', N'{}', 0, 1, 0, NULL,1)
GO

    INSERT [PTIS].[RuleEngineMaster] ([Id], [RuleCode], [RuleName], [Description], [RuleCategory], [RuleJson], [Priority], [IsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ConditionsJson], [EffectJson], [TargetFiltersJson], [StopProcessing], [RuleScopeId], [MarkedForDeletion], [MarkedForDeletionDate],[PropertyRuleEvaluationMasterId])
    VALUES (8, N'RULE-20260720-0002', N'Parking use as a Residential  or Commercial', N'if original sanction plan is Parking but current  use as a Residential  or Commercial  then apply 3 Times tax', N'RV', N'{"RuleName":"Parking use as a Residential  or Commercial","isActive":true,"RuleCategory":"RV","rules":[{"RuleCode":"2bf0b453-d273-4d4f-884e-5eee095b05bc","errorMessage":"if original sanction plan is Parking but current  use as a Residential  or Commercial  then apply 3 Times tax","enabled":true,"ruleExpressionType":"LambdaExpression","expression":"input.TypeOfUseId == 14048","Actions":{"OnSuccess":{"Name":"MultiEffect","Context":{"effects":[{"Expression":"input.Rate * 3","effectType":"Multiply","value":"3","ParameterCode":"input.Rate"}]}}},"stopProcessing":false}]}', 8, 1, 1, 1, CAST(N'2026-07-20T18:40:53.097' AS DateTime), NULL, NULL, N'[{"id":"2bf0b453-d273-4d4f-884e-5eee095b05bc","description":"if original sanction plan is Parking but current  use as a Residential  or Commercial  then apply 3 Times tax","conditions":{"id":"fa05f608-03ef-4987-a920-e5b8f13e68f4","logicalOperator":"AND","conditions":[{"id":"25cb79d2-24ac-42dc-bc0a-35619d9c214b","fieldId":"TypeOfUseId","operator":"=","value":"14048","valueLabel":"SPKR - à¤¸à¥à¤Ÿà¥€à¤² à¤ªà¤¾à¤°à¥à¤•à¤¿à¤‚à¤—-C"}],"groups":[]},"effect":[{"effectType":"Multiply","value":3,"isPercentage":true,"overrideRate":1}],"effects":[{"effectType":"Multiply","value":3,"isPercentage":true,"overrideRate":1}],"stopProcessing":false,"ruleScopeName":"Property Level"}]', N'[{"effectType":"Multiply","value":3,"isPercentage":true,"overrideRate":1}]', N'{}', 0, 1, 0, NULL,1)
GO

SET IDENTITY_INSERT [PTIS].[RuleEngineMaster] OFF
GO
/* ============================================================================
   Seed PTIS.ULBDocumentType
============================================================================ */

SET IDENTITY_INSERT [PTIS].[ULBDocumentType] ON;

INSERT INTO PTIS.ULBDocumentType
(
    Id,
    DocumentTypeCode,
    DocumentTypeName,
    IsActive,
    CreatedBy
)
SELECT
    v.Id,
    v.DocumentTypeCode,
    v.DocumentTypeName,
    1,
    1
FROM (VALUES
    (1, 'READY_RECKONER_RATE_CHART', 'Ready Reckoner Rate Chart'),
    (2, 'TAX_ZONING_DOCUMENT',       'Tax Zoning Document'),
    (3, 'TAX_RATE_CHART',            'Tax Rate Chart'),
    (4, 'WARD_ZONE_MAP',             'Ward / Zone Map'),
    (5, 'ASSESSMENT_RULE_DOCUMENT',  'Assessment Rule Document'),
    (6, 'GOVERNMENT_CIRCULAR',       'Government Circular / GR'),
    (7, 'PENALTY_INTEREST_RULE',     'Penalty / Interest Rule Document'),
    (8, 'EXEMPTION_RULE_DOCUMENT',   'Exemption Rule Document')
) v
(
    Id,
    DocumentTypeCode,
    DocumentTypeName
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.ULBDocumentType t
    WHERE t.DocumentTypeCode = v.DocumentTypeCode
);

SET IDENTITY_INSERT [PTIS].[ULBDocumentType] OFF;
GO


/* ============================================================
   PTIS RETROSPECTIVE RULE CONFIGURATION SEED DATA

   Rules seeded:
   - THA-01 to THA-09
   - PCM-01 to PCM-06
   - FUR-01 to FUR-04

   Note:
   Since ULBId is removed, all rules are saved in one rule library.
   During calculation, match only:
       RuleStatus = 'Active'
       IsActive = 1

   If some old corporation reference rules are not required for current ULB,
   keep them as Review / Draft or set IsActive = 0.
============================================================ */

------------------------------------------------------------
-- 1. Ensure Evidence Master Data
------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM PTIS.EvidenceTypeMaster WHERE EvidenceCode = 'OC')
    INSERT INTO PTIS.EvidenceTypeMaster (EvidenceCode, EvidenceName, IsCertificate, DisplayOrder, IsActive, CreatedBy)
    VALUES ('OC', 'OC', 1, 1, 1, 1);
GO
IF NOT EXISTS (SELECT 1 FROM PTIS.EvidenceTypeMaster WHERE EvidenceCode = 'CC')
    INSERT INTO PTIS.EvidenceTypeMaster (EvidenceCode, EvidenceName, IsCertificate, DisplayOrder, IsActive, CreatedBy)
    VALUES ('CC', 'CC', 1, 2, 1, 1);
GO
IF NOT EXISTS (SELECT 1 FROM PTIS.EvidenceTypeMaster WHERE EvidenceCode = 'ELECTRICITY')
    INSERT INTO PTIS.EvidenceTypeMaster (EvidenceCode, EvidenceName, IsCertificate, DisplayOrder, IsActive, CreatedBy)
    VALUES ('ELECTRICITY', 'Electricity', 0, 3, 1, 1);
GO
IF NOT EXISTS (SELECT 1 FROM PTIS.EvidenceTypeMaster WHERE EvidenceCode = 'CHANGE_DETECTION')
    INSERT INTO PTIS.EvidenceTypeMaster (EvidenceCode, EvidenceName, IsCertificate, DisplayOrder, IsActive, CreatedBy)
    VALUES ('CHANGE_DETECTION', 'Change Detection', 0, 4, 1, 1);
GO
IF NOT EXISTS (SELECT 1 FROM PTIS.EvidenceTypeMaster WHERE EvidenceCode = 'CONSTRUCTION_YEAR')
    INSERT INTO PTIS.EvidenceTypeMaster (EvidenceCode, EvidenceName, IsCertificate, DisplayOrder, IsActive, CreatedBy)
    VALUES ('CONSTRUCTION_YEAR', 'Construction Year', 0, 5, 1, 1);
GO


------------------------------------------------------------
-- 2. Rule Master
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleMaster
(
    RuleCode,
    RuleName,
    RuleDescription,
    PriorityNo,
    MatchType,
    IsFallbackRule,
    RuleStatus,
    AuthorizationStatus,
    LegalCapEnabled,
    LegalCapYears,
    NoticeDays,
    VersionNo,
    EffectiveFrom,
    IsActive,
    Remarks,
    CreatedBy
)
SELECT
    v.RuleCode,
    v.RuleName,
    v.RuleDescription,
    v.PriorityNo,
    v.MatchType,
    v.IsFallbackRule,
    v.RuleStatus,
    v.AuthorizationStatus,
    v.LegalCapEnabled,
    v.LegalCapYears,
    v.NoticeDays,
    v.VersionNo,
    v.EffectiveFrom,
    v.IsActive,
    v.Remarks,
    1
FROM (VALUES
    ('THA-09', 'OC + CC - 1.5x from CC to OC, then 1x', 'Both OC and CC are available. Retrospective tax starts from CC date. Tax is 1.5x from CC to OC and 1x after OC.', 5, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Specific OC + CC split multiplier rule.'),
    ('THA-01', 'OC evidence - start from OC date', 'Only OC is available. Retrospective tax applicable from OC date.', 10, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'OC evidence available.'),
    ('THA-02', 'CC evidence - start from CC date', 'Only CC is available. Retrospective tax applicable from CC date.', 20, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'CC evidence available.'),
    ('THA-03', 'CC + electricity earlier than CC', 'CC and electricity available. Electricity date is before CC date. Retrospective tax starts from CC date with 1.5 multiplier.', 30, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'CC plus electricity before CC.'),
    ('THA-04', 'CC + electricity later than CC', 'CC and electricity available. Electricity date is after CC date. Retrospective tax starts from electricity date with 1.5 multiplier.', 40, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'CC plus electricity after CC.'),
    ('THA-05', 'Only electricity before 2016 cutoff', 'Only electricity bill date is available and electricity date is before cutoff date 01-Apr-2016.', 50, 'CONDITION_BASED', 0, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Unauthorized construction penalty applicable as per Act.'),
    ('THA-06', 'Only electricity after 2016 cutoff', 'Only electricity bill date is available and electricity date is after cutoff date 01-Apr-2016.', 60, 'CONDITION_BASED', 0, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Unauthorized construction penalty applicable as per Act.'),
    ('THA-07', 'Change detection fallback', 'OC, CC and electricity are not available. Change detection date is available.', 70, 'CONDITION_BASED', 1, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Fallback rule based on change detection.'),
    ('THA-08', 'Construction year final fallback', 'OC, CC, electricity and change detection are not available. Construction year is available.', 80, 'CONDITION_BASED', 1, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Final fallback based on construction year.'),
    ('PCM-01', 'OC older than six years', 'Only OC is available and OC date is older than allowed six-year period.', 110, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'OC older than six years.'),
    ('PCM-02', 'OC within six years', 'Only OC is available and OC date is within allowed six-year period.', 120, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'OC within six years.'),
    ('PCM-05', 'CC + electricity - use electricity date', 'CC and electricity are available. OC is unavailable. Retrospective tax starts from electricity date.', 125, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Specific CC + electricity rule. Priority kept before only CC rule.'),
    ('PCM-03', 'Only CC - next financial year', 'Only CC is available. Retrospective tax starts from next financial year after CC date.', 130, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'CC date plus next financial year start.'),
    ('PCM-04', 'Only electricity - align to 1 April', 'Only electricity date is available. Retrospective tax starts from 1 April of electricity financial year.', 140, 'CONDITION_BASED', 0, 'NeedsClarification', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Penalty date wording has unclear gap and requires policy confirmation.'),
    ('PCM-06', 'No evidence - construction year or cap', 'OC, CC and electricity are unavailable. Construction year is available. Start from later of construction date or six-year cap.', 160, 'CONDITION_BASED', 1, 'NeedsClarification', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'Penalty source refers to electricity date even though electricity is unavailable. Manual review required.'),
    ('FUR-01', 'OC older than six years', 'Only OC is available and OC date is older than six-year period.', 210, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'OC older than six years.'),
    ('FUR-02', 'OC within six years', 'Only OC is available and OC date is within six-year period.', 220, 'CONDITION_BASED', 0, 'Active', 'AUTHORIZED', 1, 6, 15, '1.0', '2026-04-01', 1, 'OC within six years.'),
    ('FUR-03', 'No evidence - September 2024 cutoff', 'OC and CC are unavailable. Construction year is available. Retrospective tax starts from fixed September 2024 cutoff.', 230, 'CONDITION_BASED', 1, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2024-09-01', 1, 'Unauthorized construction penalty applicable as per Act.'),
    ('FUR-04', 'Electricity after cutoff - add six months', 'Only electricity date is available and electricity date is after September 2024 cutoff. Retrospective starts six months after electricity date.', 240, 'CONDITION_BASED', 0, 'Review', 'UNAUTHORIZED', 1, 6, 15, '1.0', '2024-09-01', 1, 'Unauthorized construction penalty applicable as per Act.')
) v
(
    RuleCode, RuleName, RuleDescription, PriorityNo, MatchType, IsFallbackRule, RuleStatus,
    AuthorizationStatus, LegalCapEnabled, LegalCapYears, NoticeDays, VersionNo, EffectiveFrom,
    IsActive, Remarks
)
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleMaster t
    WHERE t.RuleCode = v.RuleCode
);
GO


------------------------------------------------------------
-- 3. Rule Evidence Conditions
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleEvidenceCondition
(
    RuleId,
    EvidenceTypeId,
    EvidenceState,
    IsActive,
    CreatedBy
)
SELECT
    R.Id,
    ET.Id,
    v.EvidenceState,
    1,
    1
FROM (VALUES
    ('THA-01', 'OC', 'AVAILABLE'),
    ('THA-01', 'CC', 'UNAVAILABLE'),
    ('THA-01', 'ELECTRICITY', 'UNAVAILABLE'),
    ('THA-01', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-02', 'CC', 'AVAILABLE'),
    ('THA-02', 'OC', 'UNAVAILABLE'),
    ('THA-02', 'ELECTRICITY', 'UNAVAILABLE'),
    ('THA-02', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-03', 'CC', 'AVAILABLE'),
    ('THA-03', 'ELECTRICITY', 'AVAILABLE'),
    ('THA-03', 'OC', 'UNAVAILABLE'),
    ('THA-03', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-04', 'CC', 'AVAILABLE'),
    ('THA-04', 'ELECTRICITY', 'AVAILABLE'),
    ('THA-04', 'OC', 'UNAVAILABLE'),
    ('THA-04', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-05', 'ELECTRICITY', 'AVAILABLE'),
    ('THA-05', 'OC', 'UNAVAILABLE'),
    ('THA-05', 'CC', 'UNAVAILABLE'),
    ('THA-05', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-06', 'ELECTRICITY', 'AVAILABLE'),
    ('THA-06', 'OC', 'UNAVAILABLE'),
    ('THA-06', 'CC', 'UNAVAILABLE'),
    ('THA-06', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-07', 'CHANGE_DETECTION', 'AVAILABLE'),
    ('THA-07', 'OC', 'UNAVAILABLE'),
    ('THA-07', 'CC', 'UNAVAILABLE'),
    ('THA-07', 'ELECTRICITY', 'UNAVAILABLE'),
    ('THA-08', 'CONSTRUCTION_YEAR', 'AVAILABLE'),
    ('THA-08', 'OC', 'UNAVAILABLE'),
    ('THA-08', 'CC', 'UNAVAILABLE'),
    ('THA-08', 'ELECTRICITY', 'UNAVAILABLE'),
    ('THA-08', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('THA-09', 'OC', 'AVAILABLE'),
    ('THA-09', 'CC', 'AVAILABLE'),
    ('PCM-01', 'OC', 'AVAILABLE'),
    ('PCM-01', 'CC', 'UNAVAILABLE'),
    ('PCM-01', 'ELECTRICITY', 'UNAVAILABLE'),
    ('PCM-01', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('PCM-02', 'OC', 'AVAILABLE'),
    ('PCM-02', 'CC', 'UNAVAILABLE'),
    ('PCM-02', 'ELECTRICITY', 'UNAVAILABLE'),
    ('PCM-02', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('PCM-03', 'CC', 'AVAILABLE'),
    ('PCM-03', 'OC', 'UNAVAILABLE'),
    ('PCM-03', 'ELECTRICITY', 'UNAVAILABLE'),
    ('PCM-03', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('PCM-04', 'ELECTRICITY', 'AVAILABLE'),
    ('PCM-04', 'OC', 'UNAVAILABLE'),
    ('PCM-04', 'CC', 'UNAVAILABLE'),
    ('PCM-04', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('PCM-05', 'CC', 'AVAILABLE'),
    ('PCM-05', 'ELECTRICITY', 'AVAILABLE'),
    ('PCM-05', 'OC', 'UNAVAILABLE'),
    ('PCM-05', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('PCM-06', 'CONSTRUCTION_YEAR', 'AVAILABLE'),
    ('PCM-06', 'OC', 'UNAVAILABLE'),
    ('PCM-06', 'CC', 'UNAVAILABLE'),
    ('PCM-06', 'ELECTRICITY', 'UNAVAILABLE'),
    ('PCM-06', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('FUR-01', 'OC', 'AVAILABLE'),
    ('FUR-01', 'CC', 'UNAVAILABLE'),
    ('FUR-01', 'ELECTRICITY', 'UNAVAILABLE'),
    ('FUR-01', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('FUR-02', 'OC', 'AVAILABLE'),
    ('FUR-02', 'CC', 'UNAVAILABLE'),
    ('FUR-02', 'ELECTRICITY', 'UNAVAILABLE'),
    ('FUR-02', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('FUR-03', 'CONSTRUCTION_YEAR', 'AVAILABLE'),
    ('FUR-03', 'OC', 'UNAVAILABLE'),
    ('FUR-03', 'CC', 'UNAVAILABLE'),
    ('FUR-03', 'ELECTRICITY', 'UNAVAILABLE'),
    ('FUR-03', 'CHANGE_DETECTION', 'UNAVAILABLE'),
    ('FUR-04', 'ELECTRICITY', 'AVAILABLE'),
    ('FUR-04', 'OC', 'UNAVAILABLE'),
    ('FUR-04', 'CC', 'UNAVAILABLE'),
    ('FUR-04', 'CHANGE_DETECTION', 'UNAVAILABLE')
) v (RuleCode, EvidenceCode, EvidenceState)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
INNER JOIN PTIS.EvidenceTypeMaster ET
    ON ET.EvidenceCode = v.EvidenceCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleEvidenceCondition t
    WHERE t.RuleId = R.Id
      AND t.EvidenceTypeId = ET.Id
);
GO


------------------------------------------------------------
-- 4. Rule Date Conditions
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleDateCondition
(
    RuleId,
    ComparatorCode,
    LeftEvidenceTypeId,
    RightEvidenceTypeId,
    CompareOperator,
    CompareDate,
    CompareDateTo,
    CompareYears,
    IsActive,
    CreatedBy
)
SELECT
    R.Id,
    v.ComparatorCode,
    LET.Id,
    RET.Id,
    v.CompareOperator,
    v.CompareDate,
    v.CompareDateTo,
    v.CompareYears,
    1,
    1
FROM (VALUES
    ('THA-01', 'NONE', NULL, NULL, NULL, NULL, CAST(NULL AS DATE), NULL),
    ('THA-02', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('THA-03', 'ELECTRICITY_BEFORE_CC', 'ELECTRICITY', 'CC', 'BEFORE', NULL, NULL, NULL),
    ('THA-04', 'ELECTRICITY_AFTER_CC', 'ELECTRICITY', 'CC', 'AFTER', NULL, NULL, NULL),
    ('THA-05', 'ELECTRICITY_BEFORE_CUTOFF', 'ELECTRICITY', NULL, 'BEFORE', '2016-04-01', NULL, NULL),
    ('THA-06', 'ELECTRICITY_AFTER_CUTOFF', 'ELECTRICITY', NULL, 'AFTER', '2016-04-01', NULL, NULL),
    ('THA-07', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('THA-08', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('THA-09', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('PCM-01', 'OC_OLDER_THAN_ALLOWED_PERIOD', 'OC', NULL, 'OLDER_THAN_YEARS', NULL, NULL, 6),
    ('PCM-02', 'OC_WITHIN_ALLOWED_PERIOD', 'OC', NULL, 'WITHIN_YEARS', NULL, NULL, 6),
    ('PCM-03', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('PCM-04', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('PCM-05', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('PCM-06', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('FUR-01', 'OC_OLDER_THAN_ALLOWED_PERIOD', 'OC', NULL, 'OLDER_THAN_YEARS', NULL, NULL, 6),
    ('FUR-02', 'OC_WITHIN_ALLOWED_PERIOD', 'OC', NULL, 'WITHIN_YEARS', NULL, NULL, 6),
    ('FUR-03', 'NONE', NULL, NULL, NULL, NULL, NULL, NULL),
    ('FUR-04', 'ELECTRICITY_AFTER_CUTOFF', 'ELECTRICITY', NULL, 'AFTER', '2024-09-01', NULL, NULL)
) v (RuleCode, ComparatorCode, LeftEvidenceCode, RightEvidenceCode, CompareOperator, CompareDate, CompareDateTo, CompareYears)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
LEFT JOIN PTIS.EvidenceTypeMaster LET
    ON LET.EvidenceCode = v.LeftEvidenceCode
LEFT JOIN PTIS.EvidenceTypeMaster RET
    ON RET.EvidenceCode = v.RightEvidenceCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleDateCondition t
    WHERE t.RuleId = R.Id
);
GO


------------------------------------------------------------
-- 5. Rule Actions
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleAction
(
    RuleId,
    TaxStartMode,
    StartEvidenceTypeId,
    OffsetMonths,
    RetrospectiveLimitType,
    MaximumYears,
    CutoffDate,
    TaxCalculationMode,
    TaxMultiplier,
    SplitStartEvidenceTypeId,
    SplitEndEvidenceTypeId,
    SplitMultiplier,
    AfterSplitMultiplier,
    IsActive,
    CreatedBy
)
SELECT
    R.Id,
    v.TaxStartMode,
    SETM.Id,
    v.OffsetMonths,
    v.RetrospectiveLimitType,
    v.MaximumYears,
    v.CutoffDate,
    v.TaxCalculationMode,
    v.TaxMultiplier,
    SSETM.Id,
    SEETM.Id,
    v.SplitMultiplier,
    v.AfterSplitMultiplier,
    1,
    1
FROM (VALUES
    ('THA-01', 'EVIDENCE_DATE', 'OC', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-02', 'EVIDENCE_DATE', 'CC', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-03', 'EVIDENCE_DATE', 'CC', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.50, NULL, NULL, NULL, NULL),
    ('THA-04', 'EVIDENCE_DATE', 'ELECTRICITY', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.50, NULL, NULL, NULL, NULL),
    ('THA-05', 'FIXED_CUTOFF', NULL, NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-06', 'EVIDENCE_DATE', 'ELECTRICITY', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-07', 'EVIDENCE_DATE', 'CHANGE_DETECTION', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-08', 'CONSTRUCTION_YEAR', 'CONSTRUCTION_YEAR', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('THA-09', 'EVIDENCE_DATE', 'CC', NULL, 'FIXED_CUTOFF_DATE', NULL, '2016-04-01', 'SPLIT', 1.00, 'CC', 'OC', 1.50, 1.00),
    ('PCM-01', 'MAX_LOOK_BACK_DATE', NULL, NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('PCM-02', 'EVIDENCE_DATE', 'OC', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('PCM-03', 'NEXT_FINANCIAL_YEAR', 'CC', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('PCM-04', 'FY_START', 'ELECTRICITY', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('PCM-05', 'EVIDENCE_DATE', 'ELECTRICITY', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('PCM-06', 'CONSTRUCTION_OR_CAP', 'CONSTRUCTION_YEAR', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('FUR-01', 'MAX_LOOK_BACK_DATE', NULL, NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('FUR-02', 'EVIDENCE_DATE', 'OC', NULL, 'MAXIMUM_YEARS', 6, NULL, 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('FUR-03', 'FIXED_CUTOFF', NULL, NULL, 'FIXED_CUTOFF_DATE', NULL, '2024-09-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL),
    ('FUR-04', 'MONTHS_AFTER', 'ELECTRICITY', 6, 'FIXED_CUTOFF_DATE', NULL, '2024-09-01', 'SINGLE', 1.00, NULL, NULL, NULL, NULL)
) v (RuleCode, TaxStartMode, StartEvidenceCode, OffsetMonths, RetrospectiveLimitType, MaximumYears, CutoffDate, TaxCalculationMode, TaxMultiplier, SplitStartEvidenceCode, SplitEndEvidenceCode, SplitMultiplier, AfterSplitMultiplier)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
LEFT JOIN PTIS.EvidenceTypeMaster SETM
    ON SETM.EvidenceCode = v.StartEvidenceCode
LEFT JOIN PTIS.EvidenceTypeMaster SSETM
    ON SSETM.EvidenceCode = v.SplitStartEvidenceCode
LEFT JOIN PTIS.EvidenceTypeMaster SEETM
    ON SEETM.EvidenceCode = v.SplitEndEvidenceCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleAction t
    WHERE t.RuleId = R.Id
);
GO


------------------------------------------------------------
-- 6. Penalty Rules
------------------------------------------------------------
INSERT INTO PTIS.RetrospectivePenaltyRule
(
    RuleId,
    IsPenaltyApplicable,
    PenaltyMode,
    PenaltyPercent,
    PenaltyDateSourceType,
    PenaltyDateEvidenceTypeId,
    PenaltyDateCondition,
    CompareDate,
    CompareDateTo,
    ElseAction,
    RequiresManualReview,
    Remarks,
    IsActive,
    CreatedBy
)
SELECT
    R.Id,
    v.IsPenaltyApplicable,
    v.PenaltyMode,
    v.PenaltyPercent,
    v.PenaltyDateSourceType,
    ET.Id,
    v.PenaltyDateCondition,
    v.CompareDate,
    v.CompareDateTo,
    v.ElseAction,
    v.RequiresManualReview,
    v.Remarks,
    1,
    1
FROM (VALUES
    ('THA-01', 0, 'NONE', CAST(NULL AS DECIMAL(10,2)), NULL, NULL, NULL, NULL, CAST(NULL AS DATE), NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('THA-02', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('THA-03', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('THA-04', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('THA-09', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('THA-05', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.'),
    ('THA-06', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.'),
    ('THA-07', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.'),
    ('THA-08', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.'),
    ('PCM-01', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('PCM-02', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('PCM-03', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('PCM-05', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('PCM-04', 1, 'DATE_VALIDATION', NULL, 'EVIDENCE_DATE', 'ELECTRICITY', 'ON_OR_AFTER', '2026-03-03', NULL, 'MANUAL_REVIEW', 1, 'Apply penalty if electricity date is on or after 03-Mar-2026. Other cases require manual review due to unclear policy wording.'),
    ('PCM-06', 1, 'DATE_VALIDATION', NULL, 'EVIDENCE_DATE', 'ELECTRICITY', 'ON_OR_AFTER', '2026-03-03', NULL, 'MANUAL_REVIEW', 1, 'Policy conflict: electricity is marked unavailable but penalty source uses electricity date. Manual review required.'),
    ('FUR-01', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('FUR-02', 0, 'NONE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Penalty not applicable because OC or CC is available.'),
    ('FUR-03', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.'),
    ('FUR-04', 1, 'ACT_PENALTY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Apply unauthorized construction penalty as per Act.')
) v (RuleCode, IsPenaltyApplicable, PenaltyMode, PenaltyPercent, PenaltyDateSourceType, PenaltyDateEvidenceCode, PenaltyDateCondition, CompareDate, CompareDateTo, ElseAction, RequiresManualReview, Remarks)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
LEFT JOIN PTIS.EvidenceTypeMaster ET
    ON ET.EvidenceCode = v.PenaltyDateEvidenceCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectivePenaltyRule t
    WHERE t.RuleId = R.Id
);
GO


------------------------------------------------------------
-- 7. Rule Summary
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleSummary
(
    RuleId,
    WhenSummary,
    TaxSummary,
    PenaltySummary,
    IsActive,
    CreatedBy
)
SELECT
    R.Id,
    v.WhenSummary,
    v.TaxSummary,
    v.PenaltySummary,
    1,
    1
FROM (VALUES
    ('THA-01', 'OC available; CC, Electricity, Change Detection unavailable', 'Start from OC date; not before 01-Apr-2016; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('THA-02', 'CC available; OC, Electricity, Change Detection unavailable', 'Start from CC date; not before 01-Apr-2016; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('THA-03', 'CC and Electricity available; OC unavailable; Electricity date before CC date', 'Start from CC date; not before 01-Apr-2016; tax x 1.5.', 'Not applicable because OC or CC is available.'),
    ('THA-04', 'CC and Electricity available; OC unavailable; Electricity date after CC date', 'Start from Electricity date; not before 01-Apr-2016; tax x 1.5.', 'Not applicable because OC or CC is available.'),
    ('THA-05', 'Electricity available; OC, CC, Change Detection unavailable; Electricity date before cutoff date', 'Start from fixed cutoff date 01-Apr-2016; tax x 1.', 'Apply penalty as per the Act.'),
    ('THA-06', 'Electricity available; OC, CC, Change Detection unavailable; Electricity date after cutoff date', 'Start from Electricity date; not before 01-Apr-2016; tax x 1.', 'Apply penalty as per the Act.'),
    ('THA-07', 'Change Detection available; OC, CC, Electricity unavailable', 'Start from Change Detection date; not before 01-Apr-2016; tax x 1.', 'Apply penalty as per the Act.'),
    ('THA-08', 'Construction Year available; OC, CC, Electricity, Change Detection unavailable', 'Start from Construction Year/date; not before 01-Apr-2016; tax x 1.', 'Apply penalty as per the Act.'),
    ('THA-09', 'OC and CC available', 'Start from CC date; not before 01-Apr-2016; tax 1.5x from CC date to OC date, then 1x.', 'Not applicable because OC or CC is available.'),
    ('PCM-01', 'OC available; OC date older than allowed period', 'Start from rolling six-year boundary; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('PCM-02', 'OC available; OC date within allowed period', 'Start from OC date; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('PCM-03', 'CC available; OC, Electricity, Change Detection unavailable', 'Start from next financial year after CC date; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('PCM-04', 'Electricity available; OC, CC, Change Detection unavailable', 'Start from 1-April of Electricity financial year; maximum 6 years; tax x 1.', 'Apply penalty if Electricity date is on or after 03-Mar-2026; otherwise manual review.'),
    ('PCM-05', 'CC and Electricity available; OC unavailable', 'Start from Electricity date; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('PCM-06', 'Construction Year available; OC, CC, Electricity, Change Detection unavailable', 'Start from later of construction date or rolling cap; maximum 6 years; tax x 1.', 'Penalty date source requires manual review because Electricity is unavailable.'),
    ('FUR-01', 'OC available; OC date older than allowed period', 'Start from rolling six-year boundary; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('FUR-02', 'OC available; OC date within allowed period', 'Start from OC date; maximum 6 years; tax x 1.', 'Not applicable because OC or CC is available.'),
    ('FUR-03', 'Construction Year available; OC, CC, Electricity, Change Detection unavailable', 'Start from fixed cutoff date 01-Sep-2024; tax x 1.', 'Apply penalty as per the Act.'),
    ('FUR-04', 'Electricity available; OC, CC, Change Detection unavailable; Electricity date after September 2024 cutoff', 'Start six months after Electricity date; not before 01-Sep-2024; tax x 1.', 'Apply penalty as per the Act.')
) v (RuleCode, WhenSummary, TaxSummary, PenaltySummary)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleSummary t
    WHERE t.RuleId = R.Id
);
GO


------------------------------------------------------------
-- 8. Rule Audit Log
------------------------------------------------------------
INSERT INTO PTIS.RetrospectiveRuleAuditLog
(
    RuleId,
    ActionType,
    OldValue,
    NewValue,
    Remarks,
    CreatedBy
)
SELECT
    R.Id,
    'CREATE',
    NULL,
    R.RuleCode,
    'Initial retrospective rule seed data inserted without ULB mapping.',
    1
FROM (VALUES
    ('THA-09'),
    ('THA-01'),
    ('THA-02'),
    ('THA-03'),
    ('THA-04'),
    ('THA-05'),
    ('THA-06'),
    ('THA-07'),
    ('THA-08'),
    ('PCM-01'),
    ('PCM-02'),
    ('PCM-05'),
    ('PCM-03'),
    ('PCM-04'),
    ('PCM-06'),
    ('FUR-01'),
    ('FUR-02'),
    ('FUR-03'),
    ('FUR-04')
) v (RuleCode)
INNER JOIN PTIS.RetrospectiveRuleMaster R
    ON R.RuleCode = v.RuleCode
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.RetrospectiveRuleAuditLog t
    WHERE t.RuleId = R.Id
      AND t.ActionType = 'CREATE'
);
GO


------------------------------------------------------------
-- 9. Default Tax Policy
------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM PTIS.RetrospectiveTaxPolicy WHERE TaxPolicyCode = 'DEFAULT_RETRO_POLICY')
BEGIN
    DECLARE @IsActive bit = CASE WHEN EXISTS (SELECT 1 FROM PTIS.RetrospectiveTaxPolicy WHERE IsActive = 1) THEN 0 ELSE 1 END;

    INSERT INTO PTIS.RetrospectiveTaxPolicy (TaxPolicyCode, TaxPolicyName, RateMode, PercentageMode, FixedPercentage, FinancialYearStartMonth, FinancialYearStartDay, EffectiveFrom, IsActive, CreatedBy)
    VALUES ('DEFAULT_RETRO_POLICY', 'Default Retrospective Tax Policy', 'CURRENT_YEAR_FOR_ALL_YEARS', 'CURRENT_YEAR_FOR_ALL_YEARS', NULL, 4, 1, '2026-04-01', @IsActive, 1);
END
GO


/* ============================================================================
   Seed: PTIS.PropertyPhotoType
   Purpose:
   Mandatory photo types for society, wing, property and amenity photos.

   Notes:
   - PhotoScope identifies level only (PROPERTY / SOCIETY / WING / AMENITY).
   - BOARD / SIGN_BOARD are PhotoTypeCode values, not PhotoScope values.
   - Same PhotoType can have multiple uploaded photos in PTIS.PropertyPhoto
     (see CK_PropertyPhoto_EntityScope / IX_PropertyPhoto_Entity_Type above:
     EntityType marks the apply level, S/W rows also keep their parent
     SocietyDetailId/WingDetailId hierarchy ids for filtering/reporting).
============================================================================ */

SET NOCOUNT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    /* =========================
       PROPERTY PHOTO TYPES
    ========================= */

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'PROPERTY_FRONT'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'PROPERTY_FRONT',
            N'Property Front Photo',
            N'Front photo of individual property / flat / shop',
            1,
            'PROPERTY',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'PROPERTY_SIDE'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'PROPERTY_SIDE',
            N'Property Side Photo',
            N'Side photo of individual property / flat / shop',
            2,
            'PROPERTY',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'PROPERTY_INSIDE'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'PROPERTY_INSIDE',
            N'Property Inside Photo',
            N'Inside photo of individual property / flat / shop',
            3,
            'PROPERTY',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'PROPERTY_BOARD'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'PROPERTY_BOARD',
            N'Property Board Photo',
            N'Board / name plate photo of individual property',
            4,
            'PROPERTY',
            1,
            1
        );
    END


    /* =========================
       SOCIETY PHOTO TYPES
    ========================= */

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'SOCIETY_PLACE'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'SOCIETY_PLACE',
            N'Society Place Photo',
            N'Common society place / premises photo',
            10,
            'SOCIETY',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'SOCIETY_BOARD'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'SOCIETY_BOARD',
            N'Society Board Photo',
            N'Society name board photo',
            11,
            'SOCIETY',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'SOCIETY_SIGN_BOARD'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'SOCIETY_SIGN_BOARD',
            N'Society Sign Board Photo',
            N'Society sign board photo',
            12,
            'SOCIETY',
            1,
            1
        );
    END


    /* =========================
       WING PHOTO TYPES
    ========================= */

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'WING_BUILDING'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'WING_BUILDING',
            N'Wing Building Photo',
            N'Wing building photo',
            20,
            'WING',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'WING_PLACE'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'WING_PLACE',
            N'Wing Place Photo',
            N'Wing common place / premises photo',
            21,
            'WING',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'WING_BOARD'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'WING_BOARD',
            N'Wing Board Photo',
            N'Wing board photo',
            22,
            'WING',
            1,
            1
        );
    END

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'WING_SIGN_BOARD'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'WING_SIGN_BOARD',
            N'Wing Sign Board Photo',
            N'Wing sign board photo',
            23,
            'WING',
            1,
            1
        );
    END


    /* =========================
       AMENITY PHOTO TYPE
       Final usage pending DBA discussion.
       Required because SocialAttributeMaster has PhotoTypeId FK.
    ========================= */

    IF NOT EXISTS (
        SELECT 1 FROM [PTIS].[PropertyPhotoType]
        WHERE [PhotoTypeCode] = 'AMENITY_PHOTO'
    )
    BEGIN
        INSERT INTO [PTIS].[PropertyPhotoType]
        (
            [PhotoTypeCode],
            [PhotoTypeName],
            [Description],
            [DisplayOrder],
            [PhotoScope],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        (
            'AMENITY_PHOTO',
            N'Amenity Photo',
            N'Photo for amenity / social attribute',
            30,
            'AMENITY',
            1,
            1
        );
    END

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO
