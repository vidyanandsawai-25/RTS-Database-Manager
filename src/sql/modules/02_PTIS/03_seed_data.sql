 INSERT PTIS.ZoneMaster ([ZoneNo], [Description], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
   (N'UT', N'उथळसर', NULL, NULL, NULL),
   (N'NK', N'नौपाडा - कोपरी', NULL, NULL, NULL),
   (N'KL', N'कळवा', NULL, NULL, NULL),
   (N'MU', N'मुंब्रा', NULL, NULL, NULL),
   (N'DI', N'दिवा', NULL, NULL, NULL),
   (N'WE', N'वागळे इस्टेट', NULL, NULL, NULL),
   (N'LS', N'लोकमान्य सावरकर', NULL, NULL, NULL),
   (N'VN', N'वर्तकनगर', NULL, NULL, NULL),
   (N'MM', N'माजिवडा मानपाडा', NULL, NULL, NULL);

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


  INSERT INTO PTIS.TypeOfUseGroupMaster
(TypeOfUseGroupCode, GroupName, GroupIcon, CreatedBy, UpdatedBy, UpdatedDate)
VALUES
(N'R',  N'निवासी',     N'home', NULL, NULL, NULL),
(N'C',  N'व्यावसायिक', N'home', NULL, NULL, NULL),
(N'I',  N'औद्योगिक',   N'home', NULL, NULL, NULL),
(N'N',  N'इतर',        N'home', NULL, NULL, NULL),
(N'OP', N'प्लॉट',       N'home', NULL, NULL, NULL);


INSERT INTO PTIS.TypeOfUseGroupMasterCV
(TypeOfUseGroupCVCode, GroupName, GroupIcon, IsFloorWiseRateApplicable, CreatedBy, UpdatedBy, UpdatedDate)
VALUES
(N'R',  N'निवासी CV',     N'home', 0, NULL, NULL, NULL),
(N'C',  N'व्यावसायिक CV', N'home', 1, NULL, NULL, NULL),
(N'I',  N'औद्योगिक CV',   N'home', 0, NULL, NULL, NULL),
(N'N',  N'इतर CV',        N'home', 0, NULL, NULL, NULL),
(N'OP', N'प्लॉट CV',       N'home', 0, NULL, NULL, NULL);



SET IDENTITY_INSERT [PTIS].[TypeOfUseCategoryMaster] ON;

INSERT INTO [PTIS].[TypeOfUseCategoryMaster] ([Id], [CategoryCode], [Description])
VALUES (1, 'PARKING', N'Parking category for identifying parking-related uses');

SET IDENTITY_INSERT [PTIS].[TypeOfUseCategoryMaster]  OFF;



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

(N'C', N'अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', 1, 0,NULL),
(N'T', N'धार्मिक स्थळ', N'N', N'N', 1, NULL, NULL, N'T', 1, 1,NULL),
(N'V', N'V-व्हरांडा टॉयल॓ट बाथ', N'N', N'N', 1, NULL, NULL, N'V', 1, 0,NULL),
(N'R', N'निवासी', N'R', N'R', 1, NULL, NULL, N'R', 1, 1,NULL),
(N'UC', N'बांधकाम चालू ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0,NULL),
(N'SPK', N'स्टील पार्किंग ', N'R', N'R', 1, NULL, NULL, N'S', 5, 1,1),
(N'N', N'मनपा मालमत्ता', N'N', N'N', 1, NULL, NULL, N'N', 1, 1,NULL),
(N'EG', N'शैक्षणिक शासकीय ', N'C', N'C', 1, NULL, NULL, N'E', 3, 0,NULL),
(N'GO', N'गोडाऊन', N'C', N'C', 1, NULL, NULL, N'G', 3, 0,NULL),
(N'GR', N'शासकीय निवासी', N'R', N'R', 1, NULL, NULL, N'G', 4, 0,NULL),
(N'HO', N'खाजगी वसतिगृह', N'R', N'R', 1, NULL, NULL, N'H', 4, 0,NULL),
(N'LB', N'वाचनालय/लायब्ररी ', N'C', N'C', 1, NULL, NULL, N'L', 2, 1,NULL),
(N'UCC', N'बांधकाम चालु-अनिवासी ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0,NULL),
(N'MTR', N'टॉवर जागा', N'C', N'C', 1, NULL, NULL, N'W', 9, 0,NULL),
(N'FF', N'स्वातंत्र्य सैनिक', N'R', N'R', 1, NULL, NULL, N'F', 1, 0,NULL),
(N'WGC', N'WGC-व्हरांडा  शासकीय अनिवासी', N'C', N'C', 1, NULL, NULL, N'G', 2, 0,NULL),
(N'WEG', N'WEG-व्हरांडा शैक्षणीक शासकीय', N'C', N'C', 1, NULL, NULL, N'E', 4, 0,NULL),
(N'WEP', N'WEP-व्हरांडा खाजगी शैक्षणीक ', N'C', N'C', 1, NULL, NULL, N'E', 2, 0,NULL),
(N'WGR', N'WGR-व्हरांडा शासकीय निवासी', N'R', N'R', 1, NULL, NULL, N'G', 4, 0,NULL),
(N'PC', N'पार्किंग अनिवासी', N'N', N'N', 1, NULL, NULL, N'P', NULL, 0,1),
(N'S', N'दुकान', N'C', N'C', 1, NULL, NULL, N'S', 1, 0,NULL),
(N'D', N'दवाखाना', N'C', N'C', 1, NULL, NULL, N'D', 1, 0,NULL),
(N'B', N'बँक', N'C', N'C', 1, NULL, NULL, N'B', 1, 0,NULL),
(N'SW', N'जलतरण तलाव', N'C', N'C', 1, NULL, NULL, N'S', 4, 0,NULL),
(N'I', N'कारखाना', N'I', N'I', 1, NULL, NULL, N'I', 1, 0,NULL),
(N'EP', N'खाजगी शैक्षणिक', N'C', N'C', 1, NULL, NULL, N'E', 1, 0,NULL),
(N'WR', N'WR-व्हरांडा निवासी', N'R', N'R', 1, NULL, NULL, N'R', 2, 0,NULL),
(N'WC', N'WC-व्हरांडा अनिवासी', N'C', N'C', 1, NULL, NULL, N'S', 2, 0,NULL),
(N'CC', N'कोचिंग क्लासेस', N'C', N'C', 1, NULL, NULL, N'C', 2, 0,NULL),
(N'CG', N'केंद्र शासकीय मालमत्ता', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'CR', N'केंद्र शासकीय मालमत्ता निवासी', N'R', N'R', 1, NULL, NULL, N'R', NULL, 0,NULL),
(N'OPR', N'खुला भूखंड निवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'OPC', N'खुला भूखंड अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'PTR', N'पेट्रोल पंप', N'C', N'C', 1, NULL, NULL, N'P', 1, 0,NULL),
(N'GC', N'शासकीय अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'O', N'ऑफिस', N'C', N'C', 1, NULL, NULL, N'O', 1, 0,NULL),
(N'M', N'मंगल कार्यालय', N'C', N'C', 1, NULL, NULL, N'M', 1, 0,NULL),
(N'KT', N'मल्टीप्लेक्स', N'C', N'C', 1, NULL, NULL, N'T', 2, 0,NULL),
(N'H', N'हॉटेल', N'C', N'C', 1, NULL, NULL, N'H', 1, 0,NULL),
(N'OPK', N'ओपन पार्किंग', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,1),
(N'WI', N'WI-व्हरांडा औद्योगिक', N'I', N'I', 1, NULL, NULL, N'I', 2, 0,NULL),
(N'OP', N'खुला भूखंड', N'R', N'R', 1, 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'R', 0, 0,NULL),
(N'WCGR', N'WCGR-केंद्र शासकीय मालमत्ता', N'R', N'R', 1, NULL, NULL, N'R', NULL, 0,NULL),
(N'WCGC', N'WCGC-केंद्र शासकीय मालमत्ता', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'CH', N'सामाजिक सभागृह', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'L', N'लॉज', N'C', N'C', 1, NULL, NULL, N'C', NULL, 0,NULL),
(N'AG', N'शेती', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ACH', N'क्लब हाऊस ', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AGM', N'सोसायटी जिम', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AH', N'कॉमन हॉल', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AMH', N'मल्टीपर्पज हॉल', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'AO', N'सोसायटी ऑफीस ', N'C', N'C', 1, NULL, NULL, N'C', NULL, 1,NULL),
(N'APG', N'खेळाचे मैदान', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ASW', N'सोसायटी स्विमिंग पूल', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'AWC', N'वॉचमन कॅबिन', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'CCO', N'C-कॉरिडॉर', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'CCR', N'CCR-ट्युशन क्लासेस ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'CGC', N'केंद्र शासन वाणिज्य मालमत्ता', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ENCC', N'ENCC', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ENCEG', N'ENCEG', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ENCEP', N'ENCEP', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ENCI', N'ENCI', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ENCR', N'ENCR', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'GM', N'व्यायाम शाळा ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'GMR', N'GMR-व्यायाम शाळा', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'KTR', N'KTR-टॉकीज/चित्रपट गृह', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NPD', N'न.प.दुकान गाळे', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'OBR', N'OBR', N'N', N'N', 1, NULL, NULL, N'N', NULL, NULL,NULL),
(N'OPKC', N'ओपन पार्किंग अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'RCO', N'R-कॉरिडॉर', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'RGN', N'जनरेटर रूम/मिटर रूम', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'SPKC', N'स्टील पार्किंग अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'WT', N'R-टॉवर', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'PG', N'पेयिंग गेस्ट', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'GA', N'गार्डन', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'RFG', N'रिफ्युज एरिया', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'PH', N'पंप हाऊस रूम', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'SR', N' स्टोअर रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'WAT', N' वॉटर टॅंक', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'ISR', N'इनडोअर स्पोर्ट रूम ', N'N', N'N', 1, NULL, NULL, N'N', NULL, 1,NULL),
(N'EHO', N'शैक्षणिक संस्था-वसतिगृह', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'PF', N'पोल्ट्रीफार्म', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NR', N'सर्व्हेक्षण निवासी', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'NC', N'सर्व्हेक्षण अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'NI', N'सर्व्हेक्षण औद्योगिक', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICR', N'अनधिकृत बांधकाम निवासी', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ICC', N'अनधिकृत बांधकाम अनिवासी ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICI', N'अनधिकृत बांधकाम औद्योगिक', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICRT', N'निवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ICCT', N'अनिवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICIT', N'औद्योगिक शास्तीस पात्र अनधिकृत बांधकाम ', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'ICHT', N'हॉटेल शास्तीस पात्र अनधिकृत बांधकाम', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICH', N'हॉटेल अनधिकृत बांधकाम', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ICP', N'अनधिकृत बांधकाम निवासी पार्किंग', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,1),
(N'ICPRT', N'निवासी पार्किंग शास्तीस पात्र अनधिकृत बांधकाम', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,1),
(N'OAH', N'वृद्धाश्रम', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ABLC', N'टेरेस-बाल्कनी अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ABLOP', N'ओपन टेरेस', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ABLR', N'टेरेस-बाल्कनी ', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'ACHC', N'क्लब हाऊस C', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'ASWC', N'सोसायटी स्विमिंग पूल C', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,NULL),
(N'AWA', N'वेटिंग एरिया', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'FCR', N'फायर कंट्रोल रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL) ,
(N'FIRR', N'फायर रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'GRR',  N'गारबेज रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'IT',   N'माहिती व तंत्रज्ञान उद्योग', N'I', N'I', 1, NULL, NULL, N'I', NULL, NULL,NULL),
(N'LR',   N'लिफ्ट रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'MR',   N'Mail रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, 1,NULL),
(N'OL',   N'ओपनिंग लॉबी', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'OWC',  N'सेंद्रिय कचरा कन्व्हर्टर रूम', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'SI',   N'सामाजिक संस्था', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'TL',   N'टेरेस लिफ्ट', N'R', N'R', 1, NULL, NULL, N'R', NULL, NULL,NULL),
(N'OPKI', N'ओपन पार्किंग औदयोगिक', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1),
(N'SPKI', N'स्टील पार्किंग औदयोगिक', N'C', N'C', 1, NULL, NULL, N'C', NULL, NULL,1)
) v(TypeOfUseCode, [Description], [Type], TypeOfUseGroupCode, CreatedBy, UpdatedBy, UpdatedDate, TypeOfUseGroupCVCode, SearchSequence, IsSociety,TypeOfUseCategoryId)
)


INSERT INTO PTIS.TypeOfUseMaster
(TypeOfUseCode, [Description], [Type], TypeOfUseGroupId, TypeOfUseGroupCVId, CreatedBy, UpdatedBy, UpdatedDate, SearchSequence,TypeOfUseCategoryId)
SELECT
    s.TypeOfUseCode,
    s.[Description],
    s.[Type],
    gm.TypeOfUseGroupId,
    gcv.TypeOfUseGroupCVId,
    s.CreatedBy, s.UpdatedBy, s.UpdatedDate,
    s.SearchSequence,s.TypeOfUseCategoryId
FROM TypeSeed s
JOIN GroupMap gm
  ON gm.TypeOfUseGroupCode = s.TypeOfUseGroupCode
JOIN GroupMapCV gcv
  ON gcv.TypeOfUseGroupCVCode = s.TypeOfUseGroupCode




INSERT INTO [PTIS].[ConstructionTypeMaster]
([ConstructionCode], [Description], [SearchSequence], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES
('A', N'सिमेंट कॉक्रिट संरचना', 0, 0, 56, NULL),
('B', N'सिमेंट/चुना/दगड/विटांची भिंत व स्लॅब', NULL, NULL, 56, '2022-06-17T12:43:04'),
('C', N'सिमेंट/चुना/दगड/विटांची भिंत व टिनाचे छत', NULL, NULL, 56, '2022-06-17T12:43:20'),
('D', N'कुडाचे लाकडी फाट्याचे कच्चेघर', NULL, NULL, 56, '2022-06-17T12:43:31'),
('E', N'कुडाचे', NULL, NULL, 56, '2022-06-17T12:43:41'),
('AR', N'A-R RCC Structure', NULL, NULL, 56, '2022-03-17T18:55:50'),
('BR', N'BR Load Bearing', NULL, NULL, 56, '2022-06-17T12:44:32'),
('CR', N'CR Tin & Cement', NULL, NULL, 56, '2022-06-17T12:44:46'),
('DR', N'DR Kavelu', NULL, NULL, 56, '2022-06-17T12:44:53'),
('ER', N'ER Kudache', NULL, NULL, 56, '2022-06-17T12:45:04'),
('op', N'open plot', NULL, NULL, NULL, NULL),
('OPR', N'Rented Plot', NULL, NULL, NULL, NULL),
('WA', N'सिमेंट कॉक्रिट संरचना-व्हरांडा', NULL, NULL, 56, '2022-04-09T18:04:48'),
('WB', N'व्हरांडा-सिमेंट/चुना/दगड/विटांची भिंत व स्लॅब', NULL, NULL, 56, '2022-06-17T12:45:28'),
('WC', N'व्हरांडा-सिमेंट/चुना/दगड/विटांची भिंत व टिनाचे छत', NULL, NULL, 56, '2022-06-17T12:45:39'),
('WD', N'व्हरांडा-कुडाचे लाकडी फाट्याचे कच्चेघर', NULL, NULL, 56, '2022-06-17T12:45:51'),
('WE', N'व्हरांडा-कुडाचे', NULL, NULL, 56, '2022-06-17T12:46:01'),
('A1', N'आरामदायी आरसीसी इमारत ', NULL, 56, 56, '2022-04-09T17:52:40'),
('B1', N'उच्च दर्जाचे एल.बी.एस. इमारत', NULL, 56, 56, '2022-06-17T12:46:25'),
('C1', N'उच्च दर्जाचे विटा सीमेंट च्या भिंती व टिन कवेलूचे छत असलेले इमारत ', NULL, 56, 56, '2022-06-17T12:46:37'),
('WA1', N'आरामदायी RCC-व्हरांडा', NULL, 56, NULL, NULL),
('WB1', N'उच्च दर्जाचे LBS व्हरांडा ', NULL, 56, 56, '2022-06-17T12:46:51'),
('WC1', N'उच्च दर्जाचे विटा सीमेंट च्या भिंती व टिन कवेलूचे छत व्हरांडा', NULL, 56, 56, '2022-06-17T12:46:59'),
('STEEL', N'Steel Structure', 2, NULL, NULL, NULL),
('BRICK', N'Brick Masonry', 3, NULL, NULL, NULL),
('WOOD', N'Wooden Structure', 4, NULL, NULL, NULL);



-- SET IDENTITY_INSERT [PTIS].[PropertyCategoryMaster] ON;
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Apartment');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Individual');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Industry');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Plot');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Government Property');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Multi Commercial Apartment');
INSERT INTO [PTIS].[PropertyCategoryMaster] ( [PropertyCategoryName]) VALUES ('Individual Chal');
-- SET IDENTITY_INSERT [PTIS].[PropertyCategoryMaster] OFF;


SET IDENTITY_INSERT [PTIS].[SubTypeOfUseMaster] ON;

;WITH Seed(Id, [Description], TypeOfUseCode, CreatedBy, UpdatedBy, UpdatedDate, SearchKey, SearchSequence) AS
(
    SELECT * FROM (VALUES

 (186, N'मंदिर', N'T', 1, 67, CAST(N'2023-02-09T17:38:44.260' AS DateTime), N'M', 1),
  (187, N'मस्जीद', N'T', 1, NULL, NULL, N'M', 2),
  (188, N'इदगाह', N'T', 1, NULL, NULL, N'E', 3),
  (189, N'चर्च ', N'T', 1, NULL, NULL, N'C', 3),
  (190, N'गुरुद्वारा', N'T', 1, NULL, NULL, N'G', 4),
  (191, N'बौद्ध विहार', N'T', 1, NULL, NULL, N'B', 5),
  (192, N'विहीर', N'N', 1, 67, CAST(N'2023-02-09T12:19:23.693' AS DateTime), N'M', 6),
  (193, N'समाज भवन', N'T', 1, NULL, NULL, N'S', 7),
  (222, N'चक्की', N'S', 1, NULL, NULL, N'C', 1),
  (223, N'चिकण मटण सेंटर', N'S', 1, NULL, NULL, N'C', 2),
  (224, N'भाजीपाला दुकाण', N'S', 1, NULL, NULL, N'B', 1),
  (227, N'वाईन शॉप', N'S', 1, NULL, NULL, N'W', 1),
  (228, N'होम अप्लायन्स', N'S', 1, NULL, NULL, N'H', 1),
  (230, N'ज्वेलरी', N'S', 1, NULL, NULL, N'J', 2),
  (231, N'शापीग सेंटर/मार्ट', N'S', 1, NULL, NULL, N'S', 3),
  (233, N'प्रेस', N'S', 1, NULL, NULL, N'P', 3),
  (234, N'लॉन्डी', N'S', 1, NULL, NULL, N'L', 1),
  (235, N'राष्ट्रीयकृत ', N'B', 1, NULL, NULL, N'', 1),
  (238, N'पतपेढी', N'B', 1, NULL, NULL, N'P', 2),
  (239, N'ए.टी.एम.', N'B', 1, NULL, NULL, N'A', 1),
  (273, N'उत्पादन सेवा', N'I', 1, NULL, NULL, N'', 0),
  (280, N'इतर उद्योग', N'I', 1, NULL, NULL, N'', 0),
  (286, N'जलतरण तलाव', N'N', 1, NULL, NULL, N'', 0),
  (287, N'कार्यालय', N'N', 1, 70, CAST(N'2024-06-26T15:18:20.117' AS DateTime), N'', 0),
  (288, N'शाळा', N'N', 1, NULL, NULL, N'', 0),
  (289, N'गार्डन', N'N', 1, NULL, NULL, N'', 0),
  (290, N'शौचालय ', N'N', 1, NULL, NULL, N'', 0),
  (292, N'अग्निशमन विभाग', N'N', 1, NULL, NULL, N'', 0),
  (293, N'सांस्कुतीक भवन', N'N', 1, NULL, NULL, N'', 0),
  (294, N'पाण्याची टाकी', N'N', 1, NULL, NULL, N'', 0),
  (295, N'पुतळा', N'N', 1, NULL, NULL, N'', 0),
  (299, N'खाजगी गोडाऊन', N'GO', 1, NULL, NULL, N'', 0),
  (300, N'शासकीय गोडाऊन', N'GO', 1, NULL, NULL, N'', 0),
  (311, N'सामुदायिक आरोग्य केंद्र', N'D', 1, NULL, NULL, N'', 0),
  (313, N' हृदयरोगतज्ज्ञ', N'D', 1, NULL, NULL, N'', 0),
  (315, N'त्वचारोगतज्ज्ञ ', N'D', 1, NULL, NULL, N'', 0),
  (317, N'बालरोगतज्ञ ', N'D', 1, NULL, NULL, N'', 0),
  (318, N'नवजात तज्ज्ञ', N'D', 1, NULL, NULL, N'', 0),
  (319, N'न्यूरोलॉजिस्ट ', N'D', 1, NULL, NULL, N'', 0),
  (321, N'ऑर्थोपेडिक सर्जन ', N'D', 1, NULL, NULL, N'', 0),
  (324, N'एंडोक्राइनोलॉजिस्ट ', N'D', 1, NULL, NULL, N'', 0),
  (326, N'नर्सिंग होम', N'D', 1, NULL, NULL, N'', 0),
  (328, N'पॅथोलॉजी लॅब', N'D', 1, 58, CAST(N'2023-01-26T13:37:58.977' AS DateTime), N'', 0),
  (330, N'दंतवैद्य / ऑर्थोडेंटिस्ट ', N'D', 1, NULL, NULL, N'', 0),
  (332, N'स्त्रीरोगतज्ञ ', N'D', 1, NULL, NULL, N'', 0),
  (336, N'ऑन्कोलॉजिस्ट ', N'D', 1, NULL, NULL, N'', 0),
  (338, N' रेडिओलॉजिस्ट ', N'D', 1, NULL, NULL, N'', 0),
  (339, N'पल्मोनोलॉजिस्ट', N'D', 1, NULL, NULL, N'', 0),
  (343, N'वसतीगृह ', N'GR', 1, NULL, NULL, N'', 0),
  (371, N'जेंट्स  पार्लर', N'S', NULL, NULL, NULL, N'J', 1),
  (373, N'खाजगी ', N'B', 1, NULL, NULL, N'', 0),
  (374, N'पंतसंस्था', N'B', 1, NULL, NULL, N'', 0),
  (387, N'हार्ड वेअर', N'S', 59, NULL, NULL, N'', 0),
  (390, N'स्पेयर पार्ट्स', N'S', 59, NULL, NULL, N'', 0),
  (399, N'साडी शॉप', N'S', 59, NULL, NULL, N'', 0),
  (402, N'एजन्सीज', N'S', 59, NULL, NULL, N'', 0),
  (405, N'स्वीटमार्ट अँड नमकीन', N'S', 59, NULL, NULL, N'', 0),
  (408, N'शूज शॉप', N'S', 59, NULL, NULL, N'', 0),
  (414, N'बिल्डिंग मटेरियल सप्लायर', N'S', 59, NULL, NULL, N'', 0),
  (417, N'फ्लॉवर शॉप', N'S', 59, NULL, NULL, N'', 0),
  (423, N'बॅग हाऊस, शॉप', N'S', 59, NULL, NULL, N'', 0),
  (426, N'टॅट्यू शॉप', N'S', 59, NULL, NULL, N'', 0),
  (456, N'कम्प्युटर', N'S', 59, NULL, NULL, N'', 0),
  (467, N'तक्रार निवारण केंद्र', N'S', 59, NULL, NULL, N'', 0),
  (470, N'ग्राहक सेवा केंद्र/सेतु', N'S', 59, NULL, NULL, N'', 0),
  (475, N'बुटीक अँड ड्रेस डिझायनिंग', N'S', 59, NULL, NULL, N'', 0),
  (483, N'ड्रायविंग स्कूल', N'S', 59, NULL, NULL, N'', 0),
  (486, N'दुकान गाळे', N'S', 59, NULL, NULL, N'', 0),
  (510, N'सहकारी', N'B', NULL, NULL, NULL, N'', 0),
  (526, N'टाइल्स व मार्बल', N'I', NULL, NULL, NULL, N'', 0),
  (528, N'प्रायमरी शाळा', N'EG', 55, NULL, NULL, N'', 0),
  (530, N'अग्रीकल्चरल', N'I', 55, NULL, NULL, N'', 0),
  (531, N'फुड', N'I', 55, NULL, NULL, N'', 0),
  (533, N'कॉलेज - मेडिकल', N'EP', 55, NULL, NULL, N'', 0),
  (534, N'कॉलेज -इंजिनीरिंग', N'EP', 55, NULL, NULL, N'', 0),
  (535, N'हायस्कूल', N'EP', 55, NULL, NULL, N'', 0),
  (536, N'कॉलेज- इतर', N'EP', 55, NULL, NULL, N'', 0),
  (537, N'प्रायमरी स्कूल', N'EP', 55, NULL, NULL, N'', 0),
  (538, N'विद्यापीठ', N'EP', 55, NULL, NULL, N'', 0),
  (539, N'प्रशिक्षण संस्था', N'EP', 55, NULL, NULL, N'', 0),
  (540, N'अंगणवारी/प्रीस्कूल', N'EP', 55, NULL, NULL, N'', 0),
  (542, N'अॅडव्होकेट ऑफिस', N'O', 55, NULL, NULL, N'', 0),
  (546, N'कार्यालय इतर', N'O', 55, NULL, NULL, N'', 0),
  (548, N'गोडावून', N'I', 55, NULL, NULL, N'', 0),
  (549, N'रेस्टोरेंट', N'H', 55, NULL, NULL, N'', 0),
  (551, N'रेस्टोरेंट व बार', N'H', 55, NULL, NULL, N'', 0),
  (553, N'लॉज', N'H', 55, NULL, NULL, N'', 0),
  (555, N'भोजनालय', N'H', 55, NULL, NULL, N'', 0),
  (556, N'कॅफे', N'H', 55, NULL, NULL, N'', 0),
  (558, N'शासकीय रुग्णालय', N'GC', 55, NULL, NULL, N'', 0),
  (560, N'कोर्ट', N'GC', 55, NULL, NULL, N'', 0),
  (561, N'तहसिल कार्यालय', N'GC', 55, NULL, NULL, N'', 0),
  (562, N'पंचायत समिती', N'GC', 55, NULL, NULL, N'', 0),
  (563, N'जिल्हा परिषद ऑफीस', N'GC', 55, NULL, NULL, N'', 0),
  (565, N'पोलीस स्टेशन', N'GC', 55, NULL, NULL, N'', 0),
  (566, N'वन विभाग', N'GC', 55, NULL, NULL, N'', 0),
  (568, N'पोलीस चौकी', N'CG', 55, NULL, NULL, N'', 0),
  (569, N'जेल', N'CG', 55, NULL, NULL, N'', 0),
  (570, N'बिएसएनएल ऑफीस', N'CG', 55, NULL, NULL, N'', 0),
  (571, N'रेल स्टेशन जक्शन', N'CG', 55, NULL, NULL, N'', 0),
  (572, N'आकाशवाणी', N'CG', 55, NULL, NULL, N'', 0),
  (577, N'स्मशानभूमी ', N'N', 55, NULL, NULL, N'N', 2),
  (578, N'मदरसा', N'EP', 58, NULL, NULL, N'', 0),
  (580, N'अपार्टमेंट सदनिका', N'R', 58, NULL, NULL, N'R', 2),
  (581, N'पडीत', N'R', 58, NULL, NULL, N'R', 3),
  (582, N'गोठा', N'R', 58, NULL, NULL, N'R', 4),
  (583, N'बंगला', N'R', 58, NULL, NULL, N'R', 5),
  (584, N'आश्रम', N'R', 58, 67, CAST(N'2023-02-09T17:35:15.180' AS DateTime), N'R', 6),
  (585, N'गृहनिर्माण योजना /घरकुल', N'R', 58, NULL, NULL, N'R', 7),
  (586, N'जिम', N'N', 67, NULL, NULL, N'', 0),
  (587, N'चालु बांधकाम', N'N', 67, NULL, NULL, N'', 0),
  (588, N'sports academy', N'N', 98, NULL, NULL, N'', 0),
  (590, N'बिछायत केंद्र', N'S', 67, NULL, NULL, N'', 0),
  (591, N'कॅटरर्स/मेस', N'S', 67, NULL, NULL, N'', 0),
  (592, N'मटन शोप', N'S', 67, NULL, NULL, N'', 0),
  (593, N'टेलेर्स', N'S', 67, NULL, NULL, N'', 0),
  (595, N'फॅब्रिकेशन', N'S', 67, NULL, NULL, N'', 0),
  (596, N'फटाका सेंटर', N'S', 67, NULL, NULL, N'', 0),
  (598, N'स्वत धान्य दुकान', N'S', 98, NULL, NULL, N'', 0),
  (599, N'मंदबुद्धी विद्यालय', N'EP', 98, NULL, NULL, N'', 0),
  (600, N'वाचनालय', N'N', 98, NULL, NULL, N'', 0),
  (601, N'पम्प हाऊस', N'N', 98, NULL, NULL, N'', 0),
  (602, N'गिफ्ट सेंटर', N'S', 98, NULL, NULL, N'', 0),
  (604, N'होमिओपॅथिक', N'D', 98, NULL, NULL, N'', 0),
  (605, N'फिजिओथेरपी', N'D', 98, NULL, NULL, N'', 0),
  (606, N'खुला भुखंड', N'N', 98, NULL, NULL, N'', 0),
  (607, N'नेत्रालय', N'D', 98, NULL, NULL, N'', 0),
  (608, N'ऑप्टीकल', N'S', 98, NULL, NULL, N'', 0),
  (609, N'फोटो स्टुडीओ', N'S', 67, NULL, NULL, N'', 0),
  (610, N'बुक डेपो', N'S', 67, NULL, NULL, N'', 0),
  (612, N'वेल्डींग', N'S', 98, NULL, NULL, N'', 0),
  (617, N'पंचकर्म तज्ञ', N'D', 67, NULL, NULL, N'', 0),
  (618, N'इलेक्ट्रोनिक', N'S', 67, NULL, NULL, N'', 0),
  (619, N'ट्रेडर्स', N'S', 98, NULL, NULL, N'', 0),
  (621, N'ट्रॅव्हल एजन्सी', N'S', 98, NULL, NULL, N'', 0),
  (622, N'ढाबा', N'H', 98, NULL, NULL, N'', 0),
  (623, N'पानपोई', N'N', 98, NULL, NULL, N'', 0),
  (624, N'मार्बल शॉप', N'S', 72, NULL, NULL, N'', 0),
  (628, N'आयुर्वेदिक', N'D', 98, NULL, NULL, N'', 0),
  (629, N'चायनीज शॉप', N'S', 72, NULL, NULL, N'', 0),
  (630, N'शासकीय इमारत', N'GC', 72, NULL, NULL, N'', 0),
  (631, N'भंगार व रद्दी दुकान', N'S', 74, NULL, NULL, N'', 0),
  (632, N'कुकुट पालन', N'S', 74, NULL, NULL, N'', 0),
  (633, N'पान सेंटर', N'S', 72, NULL, NULL, N'', 0),
  (634, N'तेल मिल', N'S', 67, NULL, NULL, N'', 0),
  (635, N'वृक्ष वाटिका', N'S', 67, NULL, NULL, N'', 0),
  (636, N'नवोदय विद्यालय', N'CG', 58, NULL, NULL, N'', 0),
  (637, N'धोबी घाट', N'S', 142, NULL, NULL, N'', 0),
  (638, N'लायब्ररी', N'EP', 61, NULL, NULL, N'', 0),
  (639, N'गाडी शोरूम', N'S', 142, NULL, NULL, N'', 0),
  (640, N'रक्तपेढी', N'D', 68, NULL, NULL, N'', 0),
  (641, N'पॉलीटेकनिक', N'EP', 111, NULL, NULL, N'', 0),
  (642, N'सर्व्हिसिंग सेंटर', N'S', 111, NULL, NULL, N'', 0),
  (644, N'कॉलेज- आय.टी.आय.', N'EG', 68, NULL, NULL, N'', 0),
  (645, N'प्रशिक्षण केंद्र', N'GC', 102, NULL, NULL, N'', 0),
  (646, N'स्टाफ क्वार्टर', N'R', 68, NULL, NULL, N'', 0),
  (647, N'विश्राम गृह', N'GC', 68, NULL, NULL, N'', 0),
  (648, N'ऑडिटोरियम', N'EP', 68, NULL, NULL, N'', 0),
  (649, N'उपहार गृह', N'GC', 68, NULL, NULL, N'', 0),
  (650, N'कॉलेज- सायन्स', N'EP', 68, NULL, NULL, N'', 0),
  (651, N'सभागृह', N'GC', 68, NULL, NULL, N'', 0),
  (652, N'कॉलेज-उद्यानविद्या', N'EP', 68, NULL, NULL, N'', 0),
  (653, N'मेस', N'H', 142, NULL, NULL, N'', 0),
  (654, N'ऑफिस', N'I', 68, NULL, NULL, N'', 0),
  (656, N'प्लासटिक इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (657, N'मेटल इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (658, N'इलेक्ट्रोड्स इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (659, N'दालमिल इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (660, N'पेपर इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (661, N'गारमेंट्स इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (662, N'वेल्डींग, इंजिनिअरिंग वर्क', N'I', 68, NULL, NULL, N'', 0),
  (663, N'नेल्स इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (664, N'कॉटन मिल इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (665, N'ऑईल मिल', N'I', 68, NULL, NULL, N'', 0),
  (666, N'ड्रग्स अॅण्ड केमिकल्स', N'I', 68, NULL, NULL, N'', 0),
  (667, N'फर्निचर इंडस्ट्रीज', N'I', 68, NULL, NULL, N'', 0),
  (668, N'पॉलीमेट इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (669, N'मुकबधीर विद्यालय', N'EP', 68, NULL, NULL, N'', 0),
  (670, N'सिमेंट इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (671, N'कुलर इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (672, N'फायर टावर', N'GR', 68, NULL, NULL, N'', 0),
  (673, N'टावर', N'GC', 68, NULL, NULL, N'', 0),
  (674, N'कुमकुम इंडस्ट्री', N'I', 68, NULL, NULL, N'', 0),
  (675, N'धार्मिक स्थळ', N'N', 68, NULL, NULL, N'', 0),
  (677, N'महाविद्यालय', N'EG', 111, NULL, NULL, N'', 0),
  (678, N'कर्करोग', N'D', 98, NULL, NULL, N'', 0),
  (679, N'टेक्सटाईल इंडस्ट्री', N'I', 58, NULL, NULL, N'', 0),
  (681, N'वीट भट्टी', N'I', 68, NULL, NULL, N'', 0),
  (683, N'फार्म हाऊस', N'R', 68, NULL, NULL, N'', 0),
  (684, N'व्यायाम शाळा', N'EG', 68, NULL, NULL, N'', 0),
  (685, N'ड्राय फ्रुट्स शॉप', N'S', 74, NULL, NULL, N'', 0),
  (686, N'प्लायवुड', N'S', 68, NULL, NULL, N'', 0),
  (687, N'भक्त निवास', N'T', 68, NULL, NULL, N'', 0),
  (689, N'स्टील इंडस्ट्रीज', N'I', 72, NULL, NULL, N'', 0),
  (691, N'दुकान', N'CG', 74, NULL, NULL, N'', 0),
  (692, N'पोस्ट ऑफिस', N'CG', 110, NULL, NULL, N'', 0),
  (693, N'व्याचमन रूम', N'GR', 98, NULL, NULL, N'', 0),
  (694, N'निवासी', N'CG', 98, NULL, NULL, N'', 0),
  (695, N'स्पोर्ट्स अकॅडमी', N'EG', 72, NULL, NULL, N'', 0),
  (697, N'कारागृह', N'GC', 74, NULL, NULL, N'', 0),
  (698, N'पेय तयार करणे / पेय खाद्यपदार्थ विक्री', N'H', NULL, NULL, NULL, N'', 0),
  (699, N'खानावळ', N'H', NULL, NULL, NULL, N'', 0),
  (700, N'खानावळ / बार', N'H', NULL, NULL, NULL, N'', 0),
  (701, N'खानावळ / बार / लौजिंग', N'H', NULL, NULL, NULL, N'', 0),
  (702, N'मोबाईल व्हन वर  खाद्यपदार्थ विक्री करणे', N'H', NULL, NULL, NULL, N'', 0),
  (703, N'आईसक्रीम विक्रेता  ', N'H', NULL, NULL, NULL, N'', 0),
  (704, N'आईस्क्रीम शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (705, N'नवीन हॉटेल ना हरकत दाखला', N'H', NULL, NULL, NULL, N'', 0),
  (706, N'हॉटेल परवाना / नुतनीकरण ना हरकत दाखला', N'H', NULL, NULL, NULL, N'', 0),
  (707, N'अग्रो खाद्य पदार्थाचे दुकान', N'H', NULL, NULL, NULL, N'', 0),
  (708, N'केटरर्स', N'H', NULL, NULL, NULL, N'', 0),
  (709, N'कॅटरर्स अँड रेस्टोरंट', N'H', NULL, NULL, NULL, N'', 0),
  (710, N'केटरर्स शॉप ', N'H', NULL, NULL, NULL, N'', 0),
  (711, N'कॅटरेस ', N'H', NULL, NULL, NULL, N'', 0),
  (712, N'कॅंटीन', N'H', NULL, NULL, NULL, N'', 0),
  (713, N'आइस क्रीम', N'H', NULL, NULL, NULL, N'', 0),
  (714, N'आइस क्रीम पार्लर', N'H', NULL, NULL, NULL, N'', 0),
  (715, N'आइसस्क्रीम', N'H', NULL, NULL, NULL, N'', 0),
  (716, N'केक , फ्रूइट्स शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (717, N'केक मॅनिफॅकचरिंग', N'H', NULL, NULL, NULL, N'', 0),
  (718, N'केक शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (720, N'कॉफी कॅफे', N'H', NULL, NULL, NULL, N'', 0),
  (721, N'कॅफे द बेकरी', N'H', NULL, NULL, NULL, N'', 0),
  (722, N'कॅफे/रेसटोरेंट', N'H', NULL, NULL, NULL, N'', 0),
  (723, N'पिझ्झा शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (724, N'पिझ्झा हट', N'H', NULL, NULL, NULL, N'', 0),
  (725, N'पिझा हाऊस', N'H', NULL, NULL, NULL, N'', 0),
  (726, N'कोल्ड्रिंग  डीलरशिप', N'H', NULL, NULL, NULL, N'', 0),
  (727, N'कोल्डरिंग शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (728, N'पोळी भाजी केंद्र', N'H', NULL, NULL, NULL, N'', 0),
  (729, N'पोळी भाजी सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (730, N'पोळी-भाजी केंद्र ', N'H', NULL, NULL, NULL, N'', 0),
  (731, N'फास्ट फूड अँड हॉटेल', N'H', NULL, NULL, NULL, N'', 0),
  (732, N'फास्ट फूड सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (733, N'फास्टफूड आऊटलेट', N'H', NULL, NULL, NULL, N'', 0),
  (734, N'फास्टफूड कोर्नर', N'H', NULL, NULL, NULL, N'', 0),
  (735, N'बेकरी', N'H', NULL, NULL, NULL, N'', 0),
  (736, N'बेकरी अँड केक शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (737, N'बेकरी शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (738, N'चहा , पाणीपुरी शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (739, N'चहा शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (740, N'चहा सेंटर आणि वडापाव ', N'H', NULL, NULL, NULL, N'', 0),
  (741, N'चाय दुकान', N'H', NULL, NULL, NULL, N'', 0),
  (742, N'चाय नाश्ता सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (743, N'चायनिज शॉप ', N'H', NULL, NULL, NULL, N'', 0),
  (744, N'चायनिज सेंटर ', N'H', NULL, NULL, NULL, N'', 0),
  (745, N'चायनीज सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (746, N'ज्युस सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (747, N'ज्यूस सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (748, N'खाद्य विक्री', N'H', NULL, NULL, NULL, N'', 0),
  (749, N'खाद्यविक्रि', N'H', NULL, NULL, NULL, N'', 0),
  (750, N'खाद्यविक्री ', N'H', NULL, NULL, NULL, N'', 0),
  (751, N'खाद्यविक्री - गोडाऊन ', N'H', NULL, NULL, NULL, N'', 0),
  (752, N'खाद्याविक्रि पार्सल ', N'H', NULL, NULL, NULL, N'', 0),
  (753, N'खाद्याविक्रि/खानावळ', N'H', NULL, NULL, NULL, N'', 0),
  (754, N'खाद्याविक्री ', N'H', NULL, NULL, NULL, N'', 0),
  (755, N'खानावळ मध्यविक्री', N'H', NULL, NULL, NULL, N'', 0),
  (756, N'टि स्टॉल ', N'H', NULL, NULL, NULL, N'', 0),
  (757, N'टी अँड स्नॅक्स सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (758, N'टी स्टॉल', N'H', NULL, NULL, NULL, N'', 0),
  (759, N'मिठाई दुकान', N'H', NULL, NULL, NULL, N'', 0),
  (761, N'बार अँन्ड रेस्टोरेंन्ट', N'H', NULL, NULL, NULL, N'', 0),
  (762, N'चहा नाष्टा सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (763, N'टी अँड स्नॅक्स', N'H', NULL, NULL, NULL, N'', 0),
  (764, N'भेळ्पुरी', N'H', NULL, NULL, NULL, N'', 0),
  (765, N'हॉटेल (उपहारगृह)', N'H', NULL, NULL, NULL, N'', 0),
  (766, N'हॉटेल / स्वीट मार्ट', N'H', NULL, NULL, NULL, N'', 0),
  (767, N'हॉटेल अँड रेस्टोरंट', N'H', NULL, NULL, NULL, N'', 0),
  (769, N'हॉटेल(गोडाऊन)', N'H', NULL, NULL, NULL, N'', 0),
  (770, N'हॉटेल, बार व लॉंजिंग', N'H', NULL, NULL, NULL, N'', 0),
  (771, N'हॉटेल/खानावळ', N'H', NULL, NULL, NULL, N'', 0),
  (772, N'हॉटेल/रेस्टॉरंट/लॉज', N'H', NULL, NULL, NULL, N'', 0),
  (773, N'निवासी व हॉटेल', N'H', NULL, NULL, NULL, N'', 0),
  (774, N'बार अँड रेस्टॉरंट', N'H', NULL, NULL, NULL, N'', 0),
  (775, N'फुड मार्ट', N'H', NULL, NULL, NULL, N'', 0),
  (776, N'फूड मार्ट ', N'H', NULL, NULL, NULL, N'', 0),
  (777, N'फूड शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (778, N'फुड्स कोर्नर', N'H', NULL, NULL, NULL, N'', 0),
  (779, N'भाजी पोळी केंद्र', N'H', NULL, NULL, NULL, N'', 0),
  (780, N'स्वीट मार्ट', N'H', NULL, NULL, NULL, N'', 0),
  (781, N'स्वीट्स', N'H', NULL, NULL, NULL, N'', 0),
  (782, N'स्वीट्स , खाद्यविक्री', N'H', NULL, NULL, NULL, N'', 0),
  (783, N'स्वीट्स अँड नमकिन शॉप ', N'H', NULL, NULL, NULL, N'', 0),
  (784, N'स्वीट्स अँड फरसान', N'H', NULL, NULL, NULL, N'', 0),
  (785, N'स्वीट्स अँड फरसान शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (786, N'स्वीट्स कॉर्नर', N'H', NULL, NULL, NULL, N'', 0),
  (787, N'स्वीट्स, ड्रायफृट्स, खाद्याविक्रि ', N'H', NULL, NULL, NULL, N'', 0),
  (788, N'सँडविच सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (789, N'स्नॅक्स कॉर्नर', N'H', NULL, NULL, NULL, N'', 0),
  (790, N'स्नॅक्स कोर्नर ', N'H', NULL, NULL, NULL, N'', 0),
  (791, N'स्नॅक्स दुकान', N'H', NULL, NULL, NULL, N'', 0),
  (792, N'स्नॅक्स सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (793, N'मिसळ सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (794, N'मिसळ स्नॅक्स कॉर्नर ', N'H', NULL, NULL, NULL, N'', 0),
  (795, N'वडापाव सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (796, N'फॅमिली रेस्टारंट', N'H', NULL, NULL, NULL, N'', 0),
  (797, N'फ्रूइट्स अँड स्नॅक्स', N'H', NULL, NULL, NULL, N'', 0),
  (798, N'बर्गर', N'H', NULL, NULL, NULL, N'', 0),
  (799, N'बिर्याणी शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (800, N'बिर्याणी सेंटर', N'H', NULL, NULL, NULL, N'', 0),
  (801, N'बिर्यानी शॉप', N'H', NULL, NULL, NULL, N'', 0),
  (802, N'राजू शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (803, N'रामकृष्ण बिसवाल/शिवानी प्रियदर्शनी बिसवाल', N'S', NULL, NULL, NULL, N'', 0),
  (804, N'रिअर इस्टेड', N'S', NULL, NULL, NULL, N'', 0),
  (805, N'रिअल इस्टेट', N'S', NULL, NULL, NULL, N'', 0),
  (806, N'रिअल इस्टेट अँड कॅटरिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (807, N'रिअल इस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (808, N'रिअल इस्टेट कन्सल्टन्सी', N'S', NULL, NULL, NULL, N'', 0),
  (809, N'रिपेअरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (810, N'रिपेअरिंग स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (811, N'रिपेअरिंग सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (812, N'रिपेअरींग वर्क', N'S', NULL, NULL, NULL, N'', 0),
  (813, N'रिपेअरींग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (814, N'रिपेरिंग सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (815, N'रियल इस्टेट ', N'S', NULL, NULL, NULL, N'', 0),
  (816, N'रियल इस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (817, N'रियल इस्टेट कार्यालय  ', N'S', NULL, NULL, NULL, N'', 0),
  (818, N'रियल इस्टेस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (819, N'रियल ईस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (820, N'रिलायन्स मार्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (821, N'रीअल  इस्टेट', N'S', NULL, NULL, NULL, N'', 0),
  (822, N'रीअल  इस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (823, N'रीअल इस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (824, N'रीपेरिंग अँड सर्विसेस ', N'S', NULL, NULL, NULL, N'', 0),
  (825, N'रीपेरिंग प्रॉपर्टी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (826, N'रीपेरिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (827, N'रीयल इस्टेट', N'S', NULL, NULL, NULL, N'', 0),
  (828, N'रीयल इस्टेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (829, N'लँड अँड बिल्डिंग प्लॅनिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (830, N'लेडिज इमिटेशन ज्वेलरी', N'S', NULL, NULL, NULL, N'', 0),
  (831, N'लेडिज गारमेंट', N'S', NULL, NULL, NULL, N'', 0),
  (832, N'लेडिज टेलर', N'S', NULL, NULL, NULL, N'', 0),
  (833, N'लेडिज टेलर अँड ब्युटी पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (834, N'लेडिज टेलर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (835, N'लेडिज पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (836, N'लेडिज ब्युटिक', N'S', NULL, NULL, NULL, N'', 0),
  (837, N'लेडिज वेअर', N'S', NULL, NULL, NULL, N'', 0),
  (838, N'लेडिज वेयर अँड कॉस्मेटिक', N'S', NULL, NULL, NULL, N'', 0),
  (839, N'लेडिज सलून', N'S', NULL, NULL, NULL, N'', 0),
  (840, N'लेडीज टेलर', N'S', NULL, NULL, NULL, N'', 0),
  (841, N'लेडीज बुटीक', N'S', NULL, NULL, NULL, N'', 0),
  (842, N'लेडीज ब्युटि कलेक्शन ', N'S', NULL, NULL, NULL, N'', 0),
  (843, N'लेडीज ब्युटि पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (844, N'लेडीज सलून', N'S', NULL, NULL, NULL, N'', 0),
  (845, N'लेडीस कॉस्मेटिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (846, N'लेडीस कोसमेटिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (847, N'लेडीस टेलर', N'S', NULL, NULL, NULL, N'', 0),
  (848, N'लेडीस पार्लर ', N'S', NULL, NULL, NULL, N'', 0),
  (849, N'लॅपटॉप सेल्स अँड सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (850, N'लॅब', N'S', NULL, NULL, NULL, N'', 0),
  (851, N'लॅब मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (852, N'लॅबोरेटरी', N'S', NULL, NULL, NULL, N'', 0),
  (853, N'ॲल्युमिनियम अंड क्लास वर्क', N'S', NULL, NULL, NULL, N'', 0),
  (854, N'ॲल्युमिनियम फॅब्रिक', N'S', NULL, NULL, NULL, N'', 0),
  (855, N'लहान मुलांचा दवाखाना', N'S', NULL, NULL, NULL, N'', 0),
  (856, N'लहान मुलांची शाळा', N'S', NULL, NULL, NULL, N'', 0),
  (857, N'लाईट हाऊस', N'S', NULL, NULL, NULL, N'', 0),
  (858, N'लाईफ इन्शुरन्स', N'S', NULL, NULL, NULL, N'', 0),
  (859, N'लाईफ़ इंन्शुरन्स', N'S', NULL, NULL, NULL, N'', 0),
  (860, N'लाँड्री', N'S', NULL, NULL, NULL, N'', 0),
  (861, N'लादी विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (862, N'लादीचे गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (863, N'लायटिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (864, N'लिफ्टर्स ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (866, N'लॉजिस्टिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (867, N'लॉजीस्टीक ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (868, N'लॉटरी', N'S', NULL, NULL, NULL, N'', 0),
  (869, N'लॉंड्रि', N'S', NULL, NULL, NULL, N'', 0),
  (870, N'लॉड्री', N'S', NULL, NULL, NULL, N'', 0),
  (871, N'लॉंड्री', N'S', NULL, NULL, NULL, N'', 0),
  (872, N'लॉंड्री वर्क्स', N'S', NULL, NULL, NULL, N'', 0),
  (873, N'लॉंड्री शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (874, N'लॉन्ड्रि', N'S', NULL, NULL, NULL, N'', 0),
  (875, N'लॉंन्ड्रि', N'S', NULL, NULL, NULL, N'', 0),
  (876, N'लॉंन्ड्रि दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (877, N'लॉन्ड्री', N'S', NULL, NULL, NULL, N'', 0),
  (878, N'लॉंन्ड्री', N'S', NULL, NULL, NULL, N'', 0),
  (879, N'लॉन्ड्री शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (880, N'लॉंन्ड्री शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (881, N'लोंड्री', N'S', NULL, NULL, NULL, N'', 0),
  (882, N'लोण ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (883, N'लोण्ड्री', N'S', NULL, NULL, NULL, N'', 0),
  (884, N'लोन फायनान्स', N'S', NULL, NULL, NULL, N'', 0),
  (885, N'लोन सेर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (886, N'लौंड्रि', N'S', NULL, NULL, NULL, N'', 0),
  (887, N'वकिल', N'S', NULL, NULL, NULL, N'', 0),
  (888, N'वजन काटा ', N'S', NULL, NULL, NULL, N'', 0),
  (889, N'वजनकाटा', N'S', NULL, NULL, NULL, N'', 0),
  (890, N'वूड इम्प्रेशन', N'S', NULL, NULL, NULL, N'', 0),
  (891, N'मंगल कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (892, N'ॲमेझोन पार्सल गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (893, N'मटण शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (894, N'मंडप', N'S', NULL, NULL, NULL, N'', 0),
  (895, N'मंडप डेकोरेटर्स', N'S', NULL, NULL, NULL, N'', 0),
  (896, N'मंडप डेकोरेशन गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (897, N'मंडप दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (898, N'मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (899, N'मेडिकल अँड जनरल स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (900, N'मेडिकल अँड जनरल स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (901, N'मेडिकल डिस्ट्रिबुटर', N'S', NULL, NULL, NULL, N'', 0),
  (902, N'मेडिकल परवाना बनवणे', N'S', NULL, NULL, NULL, N'', 0),
  (903, N'मेडिकल स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (904, N'मेडिकल स्टोअर्स', N'S', NULL, NULL, NULL, N'', 0),
  (905, N'मेडिकल्स', N'S', NULL, NULL, NULL, N'', 0),
  (906, N'मेडिसिन औषधे ', N'S', NULL, NULL, NULL, N'', 0),
  (907, N'मेडिसिन डीस्ट्रीब्युटर', N'S', NULL, NULL, NULL, N'', 0),
  (908, N'मेडिसिन स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (909, N'मेडिसीन', N'S', NULL, NULL, NULL, N'', 0),
  (910, N'मेडिसीन स्टॉकिस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (911, N'मेडीकल', N'S', NULL, NULL, NULL, N'', 0),
  (912, N'मुथुट फिनकॉर्प', N'S', NULL, NULL, NULL, N'', 0),
  (913, N'मद्य विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (914, N'मदयविक्री', N'S', NULL, NULL, NULL, N'', 0),
  (915, N'मद्यविक्री ', N'S', NULL, NULL, NULL, N'', 0),
  (916, N'मेन्स पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (917, N'मेन्स वेअर', N'S', NULL, NULL, NULL, N'', 0),
  (918, N'मेन्स सलून', N'S', NULL, NULL, NULL, N'', 0),
  (919, N'मनी ट्रान्सफर', N'S', NULL, NULL, NULL, N'', 0),
  (920, N'म्यूचुअल फंड', N'S', NULL, NULL, NULL, N'', 0),
  (921, N'म्यूजिक क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (922, N'म्युझिक स्टुडिओ', N'S', NULL, NULL, NULL, N'', 0),
  (923, N'म्यानीफ्याक्चरिंग  लाइट', N'S', NULL, NULL, NULL, N'', 0),
  (924, N'मर्केटिंग ऑफ इंजिनिअरिंग प्रोड्क्ट', N'S', NULL, NULL, NULL, N'', 0),
  (925, N'मशीन पार्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (926, N'मस्य व्यवसाय', N'S', NULL, NULL, NULL, N'', 0),
  (927, N'मसाला दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (928, N'मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (929, N'मार्केटिंग ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (930, N'मासे विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (931, N'मासे विक्री , खाद्य विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (932, N'बिल्डर अँड कन्स्ट्रकशन', N'S', NULL, NULL, NULL, N'', 0),
  (933, N'बिल्डर इंटेरियर वर्क्स', N'S', NULL, NULL, NULL, N'', 0),
  (934, N'बिल्डर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (935, N'बिल्डर कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (936, N'बिल्डर डेव्हलपर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (937, N'बिल्डर मटेरियल ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (938, N'बिल्डरर्स अँड डेव्हलपर्स ', N'S', NULL, NULL, NULL, N'', 0),
  (939, N'बिल्डर्स अँड डेवलपर्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (940, N'बिल्डर्स अँड डेव्हपर्स', N'S', NULL, NULL, NULL, N'', 0),
  (941, N'बिल्डर्स अँड डेव्हलपर्स', N'S', NULL, NULL, NULL, N'', 0),
  (942, N'बिल्डर्स अँन्ड डेवलपर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (943, N'बिल्डर्स आणि डेवलपर्स ', N'S', NULL, NULL, NULL, N'', 0),
  (944, N'बिलडर्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (945, N'बिल्डर्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (946, N'बिल्डर्स कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (947, N'बिल्डिंग मटेरियल', N'S', NULL, NULL, NULL, N'', 0),
  (948, N'बॉडी मसाज', N'S', NULL, NULL, NULL, N'', 0),
  (949, N'भंगार ', N'S', NULL, NULL, NULL, N'', 0),
  (950, N'भंगार दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (951, N'भंगार रद्दीचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (952, N'भंगार शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (953, N'भंगारचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (954, N'ब्लड कनेक्शन सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (955, N'ब्लड लेबोरेटरी', N'S', NULL, NULL, NULL, N'', 0),
  (956, N'ब्लड लेबोरेटरीज', N'S', NULL, NULL, NULL, N'', 0),
  (957, N'बाइक कार विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (958, N'बाइक गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (959, N'बाइक सर्विस सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (960, N'बाइक सेल्स ', N'S', NULL, NULL, NULL, N'', 0),
  (961, N'बाइक सारविर्स सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (962, N'बाईक विकतात', N'S', NULL, NULL, NULL, N'', 0),
  (963, N'बाटल्यांचा गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (964, N'बांधकाम व्यवसाय', N'S', NULL, NULL, NULL, N'', 0),
  (965, N'फ्रूट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (966, N'फ्रूट सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (967, N'फर्नेशिंग', N'S', NULL, NULL, NULL, N'', 0),
  (968, N'फर्निचर', N'S', NULL, NULL, NULL, N'', 0),
  (969, N'फर्निचर दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (970, N'फर्निचर पॉलिश ', N'S', NULL, NULL, NULL, N'', 0),
  (971, N'फर्निचर मेकिंग', N'S', NULL, NULL, NULL, N'', 0),
  (972, N'फर्निचर मेकिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (973, N'फर्निचर वर्क', N'S', NULL, NULL, NULL, N'', 0),
  (974, N'फर्निचर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (975, N'वेफर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (977, N'वेल्डिंग दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (978, N'वेल्डिंग वर्क शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (979, N'वेल्डिंग वर्कशॉप', N'S', NULL, NULL, NULL, N'', 0),
  (980, N'वेल्डिंग शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (981, N'वस्तूभंडार', N'S', NULL, NULL, NULL, N'', 0),
  (982, N'व्हेजिटेबल व शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (983, N'व्हेजीटेबल ', N'S', NULL, NULL, NULL, N'', 0),
  (984, N'व्हेजीटेबल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (985, N'वित्तीय सेवा', N'S', NULL, NULL, NULL, N'', 0),
  (986, N'वित्तीय संस्था', N'S', NULL, NULL, NULL, N'', 0),
  (987, N'वित्तीय संस्था आणि सेवा', N'S', NULL, NULL, NULL, N'', 0),
  (988, N'विद्युत विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (989, N'वॉच सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (990, N'वॉटर टॅंक सप्लायर', N'S', NULL, NULL, NULL, N'', 0),
  (991, N'वॉटर प्यूरिफायर', N'S', NULL, NULL, NULL, N'', 0),
  (992, N'वॉटर सप्लायर्स', N'S', NULL, NULL, NULL, N'', 0),
  (993, N'वॉलपेपर विक्रेता ', N'S', NULL, NULL, NULL, N'', 0),
  (994, N'वॉलपेपर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (995, N'वॉलपेपर स्टोअर ', N'S', NULL, NULL, NULL, N'', 0),
  (996, N'वॉशिंग', N'S', NULL, NULL, NULL, N'', 0),
  (997, N'शुज विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (999, N'शिक्षण कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1000, N'शिलाई मशीन', N'S', NULL, NULL, NULL, N'', 0),
  (1001, N'शिलाई मशीन रीपेरिंग अँड सेलिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1002, N'शीप ब्रोकर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1003, N'शोरूम', N'S', NULL, NULL, NULL, N'', 0),
  (1004, N'शोर्मा शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1005, N'सेकंड हँड लॅपटॉप अॅन्ड कम्प्युटर सेल्स अँन्ड रिपेअरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1006, N'सेक्युरिटी प्रोव्हायडर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1007, N'स्क्रॅप गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1008, N'स्क्रॅप माल', N'S', NULL, NULL, NULL, N'', 0),
  (1009, N'स्कीन केअर', N'S', NULL, NULL, NULL, N'', 0),
  (1010, N'स्कीन स्पेशालीस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1011, N'स्कीन हेयर', N'S', NULL, NULL, NULL, N'', 0),
  (1012, N'संगणक दुरूस्ती', N'S', NULL, NULL, NULL, N'', 0),
  (1013, N'स्टॅम्प वेंडर', N'S', NULL, NULL, NULL, N'', 0),
  (1014, N'स्टेशनरि', N'S', NULL, NULL, NULL, N'', 0),
  (1015, N'स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1016, N'स्टेशनरी अँड गिफ्ट सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1017, N'स्टेशनरी अँड झेरॉक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1018, N'स्टेशनरी अँड झेरॉक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1019, N'स्टेशनरी अँड झेरॉक्स सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1020, N'स्टेशनरी अँड नॉव्हेल्टी', N'S', NULL, NULL, NULL, N'', 0),
  (1021, N'स्टेशनरी अंड प्रिंटिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1022, N'स्टेशनरी आणि झेरॉक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1023, N'स्टेशनरी दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1024, N'स्टेशनरी व कोस्म्याटिक', N'S', NULL, NULL, NULL, N'', 0),
  (1025, N'स्टेशनरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1026, N'स्टार बिल्डर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1027, N'स्टिल ट्रेडर', N'S', NULL, NULL, NULL, N'', 0),
  (1028, N'स्टिल पाइप गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1029, N'स्टील मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (1030, N'स्टील शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1031, N'स्टील सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1032, N'स्टॉक ब्रोकिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1033, N'स्टॉक होल्डिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1034, N'स्टॉकिस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1036, N'स्टोअर्स रूम ', N'S', NULL, NULL, NULL, N'', 0),
  (1037, N'मीट स्टोरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1038, N'मॉड्युलरकिचन ट्रॉलीज', N'S', NULL, NULL, NULL, N'', 0),
  (1039, N'मॉल', N'S', NULL, NULL, NULL, N'', 0),
  (1040, N'मोटर ट्रेनिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1041, N'मोटर ट्रेनिंग स्कूल', N'S', NULL, NULL, NULL, N'', 0),
  (1042, N'मोटर पंप', N'S', NULL, NULL, NULL, N'', 0),
  (1043, N'मोडूलर किचन', N'S', NULL, NULL, NULL, N'', 0),
  (1044, N'मोबाइल अँड झेरॉक्स सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1045, N'मोबाइल आणि कम्प्युटर रिपेअरींग', N'S', NULL, NULL, NULL, N'', 0),
  (1046, N'मोबाइल एक्सेसरीज', N'S', NULL, NULL, NULL, N'', 0),
  (1047, N'मोबाइल एस्केसरीज', N'S', NULL, NULL, NULL, N'', 0),
  (1048, N'मोबाइल गॅलरी', N'S', NULL, NULL, NULL, N'', 0),
  (1049, N'मोबाइल डीस्ट्रीब्युटर', N'S', NULL, NULL, NULL, N'', 0),
  (1050, N'मोबाइल रीपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1051, N'मोबाइल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1052, N'मोबाइल शॉप , कपड्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1053, N'मोबाइल/लॅपटॉप रिपेअरींग', N'S', NULL, NULL, NULL, N'', 0),
  (1054, N'मोबाईल रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1055, N'मोबाईल रीपेअरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1056, N'मोबाईल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1057, N'मोबाईल सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1058, N'युनिफॉर्म', N'S', NULL, NULL, NULL, N'', 0),
  (1059, N'युनिसेक्स सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1060, N'रेकॉर्डिंग स्टुडिओ ', N'S', NULL, NULL, NULL, N'', 0),
  (1061, N'रेडिमेट गारमेंट्स', N'S', NULL, NULL, NULL, N'', 0),
  (1062, N'रेडियम आर्ट्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1063, N'रद्दी दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1064, N'रद्दी पेपर ', N'S', NULL, NULL, NULL, N'', 0),
  (1065, N'रद्दी पेपर मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1066, N'रेपारींग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1067, N'रबर स्टॅम्प वेंडर ', N'S', NULL, NULL, NULL, N'', 0),
  (1068, N'सनग्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1069, N'सनराइज् रियलटोर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1070, N'स्पेअर पार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1071, N'स्पेअर पार्ट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1072, N'स्पेअर पार्ट व गॅरेज ', N'S', NULL, NULL, NULL, N'', 0),
  (1073, N'स्पेअर पार्ट्स', N'S', NULL, NULL, NULL, N'', 0),
  (1074, N'स्पेअरपार्ट शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1075, N'स्पेयर पार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1076, N'स्पेयर पार्ट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1077, N'सुपर मार्केट ', N'S', NULL, NULL, NULL, N'', 0),
  (1078, N'स्प्लेसमेंट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1079, N'सप्लाय चेन ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1080, N'स्पा', N'S', NULL, NULL, NULL, N'', 0),
  (1081, N'स्पा आणि मसाज सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1082, N'स्पा सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1083, N'स्पा. सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1084, N'स्पोर्ट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1085, N'स्पोर्ट्स आणि जिम उपयोगीवस्तु', N'S', NULL, NULL, NULL, N'', 0),
  (1086, N'स्पोर्ट्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1087, N'सफ़ायर शॉप(कपडा )', N'S', NULL, NULL, NULL, N'', 0),
  (1088, N'सुरक्षा ', N'S', NULL, NULL, NULL, N'', 0),
  (1089, N'सर्जिकल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1090, N'सर्वेअर ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1091, N'सर्विस प्रोवायडर', N'S', NULL, NULL, NULL, N'', 0),
  (1092, N'सर्विस सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1093, N'सलुन', N'S', NULL, NULL, NULL, N'', 0),
  (1094, N'सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1095, N'सलून शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1096, N'स्लयडिंग विंडोव अँड डोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1097, N'सेल्स अँड सर्विसेस ', N'S', NULL, NULL, NULL, N'', 0),
  (1098, N'सेल्स कार्यालय बिल्डर', N'S', NULL, NULL, NULL, N'', 0),
  (1099, N'सेल्स सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1100, N'सेल्स(स्पोर्ट शॉप)', N'S', NULL, NULL, NULL, N'', 0),
  (1101, N'स्लाइडिग', N'S', NULL, NULL, NULL, N'', 0),
  (1102, N'सहेली', N'S', NULL, NULL, NULL, N'', 0),
  (1103, N'साईन बोर्ड मेकिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1104, N'साडी सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1105, N'सायकल मार्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (1106, N'सायकल रिपेअरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1107, N'सायकल रीपेरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1108, N'सायकल शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1109, N'सायकल स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1110, N'सायबर कॅफे', N'S', NULL, NULL, NULL, N'', 0),
  (1111, N'सिक्युरिटी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1112, N'सिक्युरिटी सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1113, N'सिंगार शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1114, N'सिटी कव्हर /सोफा मेकिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1115, N'सिटी मेकर शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1116, N'सिमेंटचे गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1117, N'सिरॅमिक', N'S', NULL, NULL, NULL, N'', 0),
  (1118, N'सिरॅमिक अँड स्टाईल', N'S', NULL, NULL, NULL, N'', 0),
  (1119, N'सिरॅमिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1120, N'सिरॅमिक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1121, N'सिरामिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1122, N'सिरामिक्स गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1123, N'सिव्हिल कॉन्ट्रॅक्टर', N'S', NULL, NULL, NULL, N'', 0),
  (1124, N'भाजी फळ विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1125, N'भाजी व किराणा', N'S', NULL, NULL, NULL, N'', 0),
  (1126, N'भाजी व फळांचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1127, N'भाजी विक्रेता', N'S', NULL, NULL, NULL, N'', 0),
  (1128, N'भाजी विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1129, N'भाजी सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1130, N'भाजीपाला दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1131, N'भाजीपाला मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (1132, N'भाजीपाला शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1133, N'भाजीपाला सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1134, N'भांडे व्यापारी', N'S', NULL, NULL, NULL, N'', 0),
  (1135, N'भांड्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1136, N'भांड्यांचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1137, N'भांडी दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1138, N'फॅब्रिकेशन अँड प्लायवूड वर्क्स', N'S', NULL, NULL, NULL, N'', 0),
  (1139, N'फेब्रिकशन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1140, N'फेब्रिकेशन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1141, N'बिझनेस सोल्युशन ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1143, N'निवासी,गोडाउन,दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1144, N'बँक व वित्तीय संस्था ', N'S', NULL, NULL, NULL, N'', 0),
  (1145, N'बँक व वित्तीय संस्था, वाचनालय', N'S', NULL, NULL, NULL, N'', 0),
  (1146, N'बँक/वित्तीय संस्था व कार्यालय व गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1147, N'बँक/वित्तीय संस्था व कार्यालय व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1148, N'बँक/वित्तीय संस्था व दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1149, N'मंगल कार्यालय/टॉकीज व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1150, N'वसतिगृह', N'S', NULL, NULL, NULL, N'', 0),
  (1152, N'अनिवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1153, N'अनिवासी व कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1154, N'अनिवासी व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1155, N'कारखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1156, N'कार्यालय व गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1157, N'कार्यालय व दवाखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1158, N'कार्यालय,दुकान,निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1159, N'खाजगी रुग्णालय व दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1160, N'खाजगी रूग्णालय व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1161, N'खाजगी शाळा व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1162, N'दुकान व कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1163, N'दुकान,दवाखाना,निवासी,बँक/वित्तीय', N'S', NULL, NULL, NULL, N'', 0),
  (1164, N'दवाखाना व दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1165, N'दवाखाना व निवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1166, N'धार्मिक स्थळ व अनिवासी', N'S', NULL, NULL, NULL, N'', 0),
  (1167, N'निवासी व कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1168, N'निवासी व कोचिंग क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (1169, N'निवासी व दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1170, N'भांगारचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1171, N'भाजी', N'S', NULL, NULL, NULL, N'', 0),
  (1172, N'भाजी दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1173, N'भाजी पाला शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1174, N'हॉस्पिटल', N'S', NULL, NULL, NULL, N'', 0),
  (1175, N'होम अपलाएन्स', N'S', NULL, NULL, NULL, N'', 0),
  (1176, N'होम इंटेरियल', N'S', NULL, NULL, NULL, N'', 0),
  (1177, N'होम क्लिनिंग सामग्री', N'S', NULL, NULL, NULL, N'', 0),
  (1178, N'होमिओपॅथीक क्लिनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1179, N'ॉस्पिटल', N'S', NULL, NULL, NULL, N'', 0),
  (1180, N'सी सी टी वी कॅमेरा दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1181, N'सी सी टीव्ही विक्रेता', N'S', NULL, NULL, NULL, N'', 0),
  (1182, N'सी.सी.टीव्ही ', N'S', NULL, NULL, NULL, N'', 0),
  (1183, N'सीए ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1184, N'सॉफ्ट टेक्नॉलजी', N'S', NULL, NULL, NULL, N'', 0),
  (1185, N'सॉफ्टवेअर कंपनी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1186, N'सोफा मेकर', N'S', NULL, NULL, NULL, N'', 0),
  (1187, N'सोफा मेकर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1188, N'सोफा रिपेअरींग', N'S', NULL, NULL, NULL, N'', 0),
  (1189, N'सोफा विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1190, N'सोफा शिवणे', N'S', NULL, NULL, NULL, N'', 0),
  (1191, N'हेअर सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1192, N'हेयर कटिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1193, N'हेयर कटिंग सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1194, N'हेयर सलुन', N'S', NULL, NULL, NULL, N'', 0),
  (1195, N'हेयर सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1196, N'हर्बल मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1197, N'हेल्थ सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1198, N'हेल्थ स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (1199, N'हेल्थकेअर  कंपनी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1200, N'हाइड्रोलिक्स पाईप', N'S', NULL, NULL, NULL, N'', 0),
  (1201, N'हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1202, N'हार्डवेअर अँड इलेक्ट्रॉनिक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1203, N'हार्डवेअर आणि इलेक्ट्रिकल  स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1204, N'हार्डवेअर आणि ईलेक्ट्रिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1205, N'हार्डवेअर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1206, N'हार्डवेयर / इलेक्ट्रिक', N'S', NULL, NULL, NULL, N'', 0),
  (1207, N'हार्दिक प्ल्यायवूड', N'S', NULL, NULL, NULL, N'', 0),
  (1210, N'देशी दारू व बियर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1215, N'जेनेरीक मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1217, N'ट्याटु पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1219, N'मेडिकल अँन्ड जनरल स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1221, N'सोने, चांदीचे दुकानं', N'S', NULL, NULL, NULL, N'', 0),
  (1222, N'कोचिंग क्लाससेस', N'S', NULL, NULL, NULL, N'', 0),
  (1223, N'कोटींग ऑफ मेटल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1224, N'मिनी मार्केट ', N'S', NULL, NULL, NULL, N'', 0),
  (1225, N'मिल्क सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1226, N'कार सेल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1227, N'इलेक्ट्रॉनिक्स सेल्स अँड सर्विस', N'S', NULL, NULL, NULL, N'', 0),
  (1228, N'ए. टी. एम', N'S', NULL, NULL, NULL, N'', 0),
  (1230, N'टी.वी.रीपेरिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1231, N'टीव्ही रेपेरिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1232, N'डेअरी', N'S', NULL, NULL, NULL, N'', 0),
  (1233, N'डेअरी प्रोडक्टस', N'S', NULL, NULL, NULL, N'', 0),
  (1234, N'डेअरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1235, N'डेंटल केअर', N'S', NULL, NULL, NULL, N'', 0),
  (1236, N'डेंटल क्लिनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1237, N'डेन्टल क्लिनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1238, N'डेन्टल क्लिनिक दवाखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1239, N'डेयरी', N'S', NULL, NULL, NULL, N'', 0),
  (1240, N'ड्रायक्लिनर्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1241, N'ड्रायक्लीनर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1242, N'ड्रायफूड्स', N'S', NULL, NULL, NULL, N'', 0),
  (1243, N'ड्रायफ्रुटस मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (1244, N'डेरी', N'S', NULL, NULL, NULL, N'', 0),
  (1245, N'डेल कम्प्युटर शोरूम', N'S', NULL, NULL, NULL, N'', 0),
  (1246, N'डेलिमार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1247, N'डेली नीड्स', N'S', NULL, NULL, NULL, N'', 0),
  (1248, N'डेली मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1249, N'डेवलपर्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1250, N'डेव्हलपर्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1251, N'डायग्नोस्टिक लॅब', N'S', NULL, NULL, NULL, N'', 0),
  (1252, N'डायग्नोस्टिक लॅबोरेटरी', N'S', NULL, NULL, NULL, N'', 0),
  (1253, N'डायग्नोस्टीक सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1254, N'डायपर बिजनेस', N'S', NULL, NULL, NULL, N'', 0),
  (1255, N'डायलेसिस सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1256, N'डिझाइन किचन फर्निचर', N'S', NULL, NULL, NULL, N'', 0),
  (1257, N'डिलेव्हरी किचन', N'S', NULL, NULL, NULL, N'', 0),
  (1258, N'डिलिव्हरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1259, N'डिलीवरी सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1260, N'डिस्ट्रिबयूशन', N'S', NULL, NULL, NULL, N'', 0),
  (1261, N'डिस्ट्रिब्युशन', N'S', NULL, NULL, NULL, N'', 0),
  (1262, N'डिस्ट्रिब्यूशन', N'S', NULL, NULL, NULL, N'', 0),
  (1263, N'डी.एम.आय.टी.टेस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1264, N'डोळ्यांचे क्लिनिक ', N'S', NULL, NULL, NULL, N'', 0),
  (1265, N'डोळ्यांचा दवखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1266, N'तेल व्यवसाय', N'S', NULL, NULL, NULL, N'', 0),
  (1267, N'थर्ड पार्टी इन्सपेक्शन ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1268, N'थेरिपी सेंटर (कार्यालय)', N'S', NULL, NULL, NULL, N'', 0),
  (1269, N'दुकान व डेअरी', N'S', NULL, NULL, NULL, N'', 0),
  (1270, N'दूध केंद्र', N'S', NULL, NULL, NULL, N'', 0),
  (1271, N'दुध डेअरी ', N'S', NULL, NULL, NULL, N'', 0),
  (1272, N'दूध डेअरी', N'S', NULL, NULL, NULL, N'', 0),
  (1273, N'दूध डेअरी सप्लायर', N'S', NULL, NULL, NULL, N'', 0),
  (1274, N'दवखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1275, N'दवाखाना', N'S', NULL, NULL, NULL, N'', 0),
  (1276, N'दवाखाना व मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1277, N'देशी बार', N'S', NULL, NULL, NULL, N'', 0),
  (1278, N'दातांचा दवाखाना ', N'S', NULL, NULL, NULL, N'', 0),
  (1279, N'नेटवर्क ', N'S', NULL, NULL, NULL, N'', 0),
  (1280, N'नेटवर्किंग अँड सी.सी.टीव्ही', N'S', NULL, NULL, NULL, N'', 0),
  (1281, N'न्यूट्रीशन क्लिनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1282, N'नर्सरी स्कूल', N'S', NULL, NULL, NULL, N'', 0),
  (1284, N'नोव्हेल्टि', N'S', NULL, NULL, NULL, N'', 0),
  (1285, N'नोव्हेलटी', N'S', NULL, NULL, NULL, N'', 0),
  (1286, N'पॅकिंग मटेरियल', N'S', NULL, NULL, NULL, N'', 0),
  (1287, N'पंचर अँड टायर सर्विस ', N'S', NULL, NULL, NULL, N'', 0),
  (1288, N'पंचर दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1289, N'पूजा भंडार', N'S', NULL, NULL, NULL, N'', 0),
  (1290, N'पुजा भांडार', N'S', NULL, NULL, NULL, N'', 0),
  (1291, N'पूजा सामान', N'S', NULL, NULL, NULL, N'', 0),
  (1292, N'पूजा साहित्य', N'S', NULL, NULL, NULL, N'', 0),
  (1293, N'पेट अॅनिमल फूड्स', N'S', NULL, NULL, NULL, N'', 0),
  (1294, N'पेंट कलर ', N'S', NULL, NULL, NULL, N'', 0),
  (1295, N'पेट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1296, N'पेंट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1297, N'पेट स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1298, N'पेट्रोल पंप', N'S', NULL, NULL, NULL, N'', 0),
  (1299, N'पेंट्स', N'S', NULL, NULL, NULL, N'', 0),
  (1300, N'पेट्स फूड्स', N'S', NULL, NULL, NULL, N'', 0),
  (1301, N'पतसंस्था', N'S', NULL, NULL, NULL, N'', 0),
  (1302, N'पतसंस्था / वाचनालय / ग्रंथालय', N'S', NULL, NULL, NULL, N'', 0),
  (1303, N'पॅथलॅब्स', N'S', NULL, NULL, NULL, N'', 0),
  (1304, N'पॅथॉलॉजि लॅब ', N'S', NULL, NULL, NULL, N'', 0),
  (1305, N'पॅथॉलॉजी लॅबोरेटरी', N'S', NULL, NULL, NULL, N'', 0),
  (1307, N'पॅथोलॉजी लेबोरटोरी', N'S', NULL, NULL, NULL, N'', 0),
  (1308, N'पथोलोजि', N'S', NULL, NULL, NULL, N'', 0),
  (1309, N'पेपर प्लेट', N'S', NULL, NULL, NULL, N'', 0),
  (1310, N'पेपर मार्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (1311, N'पेपर रद्दी', N'S', NULL, NULL, NULL, N'', 0),
  (1312, N'पेपर रिसायकल अँन्ड कलेक्शन', N'S', NULL, NULL, NULL, N'', 0),
  (1313, N'पेपर व भंगार दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1314, N'परडा बनविणे ', N'S', NULL, NULL, NULL, N'', 0),
  (1315, N'पूर्व प्राथमिक शाळा ', N'S', NULL, NULL, NULL, N'', 0),
  (1316, N'प्रेस शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1317, N'प्रिंटिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1318, N'प्रिंटिंग दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1319, N'प्रिंटिग प्रेस', N'S', NULL, NULL, NULL, N'', 0),
  (1320, N'प्रिंटिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1321, N'प्री प्रायमरी स्कूल', N'S', NULL, NULL, NULL, N'', 0),
  (1322, N'प्री स्कूल', N'S', NULL, NULL, NULL, N'', 0),
  (1323, N'प्रॉपर्टि कन्सल्ट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1324, N'प्रॉपर्टि सेल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1325, N'प्रॉपर्टी एजेण्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1326, N'प्रॉपर्टी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1327, N'प्रॉपर्टी कन्सलटंट', N'S', NULL, NULL, NULL, N'', 0),
  (1328, N'प्रॉपर्टी डीलर', N'S', NULL, NULL, NULL, N'', 0),
  (1329, N'प्रॉपर्टीज ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1330, N'प्रोटीन', N'S', NULL, NULL, NULL, N'', 0),
  (1331, N'गणपती विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1332, N'गेम झोन', N'S', NULL, NULL, NULL, N'', 0),
  (1333, N'गेमिंग कॅफे', N'S', NULL, NULL, NULL, N'', 0),
  (1334, N'गेमिंग झोन', N'S', NULL, NULL, NULL, N'', 0),
  (1335, N'गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1336, N'ग्राफिक अँड प्रिंट ', N'S', NULL, NULL, NULL, N'', 0),
  (1337, N'ग्राफिक्स अँड गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1338, N'ग्राफिक्स्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1339, N'ग्राफिक्स्स वर्क शॉप कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1340, N'गॅलरी', N'S', NULL, NULL, NULL, N'', 0),
  (1341, N'ग्लास अँड अलुमिनियम हाऊस ', N'S', NULL, NULL, NULL, N'', 0),
  (1342, N'ग्लास अँड अल्युमिनियम', N'S', NULL, NULL, NULL, N'', 0),
  (1343, N'ग्लास अँड अल्युमीनियम', N'S', NULL, NULL, NULL, N'', 0),
  (1344, N'ग्लास अँन्ड अॅल्युमिनियम', N'S', NULL, NULL, NULL, N'', 0),
  (1345, N'ग्लास व्यापार', N'S', NULL, NULL, NULL, N'', 0),
  (1346, N'ग्लास वर्क', N'S', NULL, NULL, NULL, N'', 0),
  (1347, N'ग्लास वर्क शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1348, N'ग्लास वर्कशॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1349, N'ग्लास विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1350, N'ग्लास शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1351, N'ग्लास हाऊस', N'S', NULL, NULL, NULL, N'', 0),
  (1352, N'ग्लोसरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1353, N'गव्हरमेंट प्रोजेक्ट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1354, N'गॅस ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1355, N'गॅस बूकींग ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1356, N'गॅस स्टोव्ह, इलेक्ट्रिकल्स सेल्स अँड सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1357, N'गाडी विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1358, N'गादी अँड कुशन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1359, N'गादी दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1360, N'गादी व्यवसाय', N'S', NULL, NULL, NULL, N'', 0),
  (1361, N'गादी विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1362, N'गादी सेंन्टर', N'S', NULL, NULL, NULL, N'', 0),
  (1363, N'गारमेंट', N'S', NULL, NULL, NULL, N'', 0),
  (1364, N'गिफ्ट अँड सेल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1365, N'गिफ्ट आर्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (1366, N'गिफ्ट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1367, N'गिफ्ट स्टोअर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1368, N'गिरणी', N'S', NULL, NULL, NULL, N'', 0),
  (1369, N'गॉरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1370, N'गोकुल डेअरी', N'S', NULL, NULL, NULL, N'', 0),
  (1371, N'गोड प्रकार बनवतात', N'S', NULL, NULL, NULL, N'', 0),
  (1372, N'गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1373, N'गोडाउन (मंडप डेकोरेटर)', N'S', NULL, NULL, NULL, N'', 0),
  (1374, N'गोडाउन प्लंबिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (1376, N'गोल्ड शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1377, N'गोळ्या औषधी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1378, N'गोळ्या व औषधी गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1379, N'गोळ्यांचे गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1380, N'गौ. विज्ञान केंद्र', N'S', NULL, NULL, NULL, N'', 0),
  (1381, N'घड्याळ विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1382, N'घर विक्रि', N'S', NULL, NULL, NULL, N'', 0),
  (1383, N'घर विक्री/बिल्डर', N'S', NULL, NULL, NULL, N'', 0),
  (1384, N'चप्पल दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1385, N'चप्पल विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1386, N'चप्पलचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1387, N'चश्मा शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1388, N'चष्म्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1389, N'चष्माचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1390, N'ज्वेलर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1391, N'ज्वेलर्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1392, N'ज्वेलरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1393, N'जिओ स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1395, N'जीम', N'S', NULL, NULL, NULL, N'', 0),
  (1396, N'झेरॉक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1397, N'झेरॉक्स अँड घरगुती सामान विक्रेता ', N'S', NULL, NULL, NULL, N'', 0),
  (1398, N'झेरॉक्स अँड टायपिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1399, N'झेरॉक्स अँड रीयल इस्टेट', N'S', NULL, NULL, NULL, N'', 0),
  (1400, N'झेरॉक्स दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1401, N'झेरॉक्स व स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1402, N'झेरॉक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1403, N'झेरॉक्स सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1404, N'टू व्हीलर ऑटो गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1405, N'टु व्हीलर गॅरेज ', N'S', NULL, NULL, NULL, N'', 0),
  (1406, N'टेकनोलोजी ', N'S', NULL, NULL, NULL, N'', 0),
  (1407, N'टॅक्स कन्सल्टंटं', N'S', NULL, NULL, NULL, N'', 0),
  (1408, N'टॅक्स कन्सल्टंट ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1409, N'टॅक्स कन्सलटन्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1410, N'टॅक्स सेर्विसेस ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1411, N'टॅटू सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1412, N'ट्युशन क्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1413, N'ट्यूशन क्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1414, N'ट्युशन क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (1415, N'ट्रेडिंग ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1416, N'ट्रेडिग कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1417, N'ट्रेन्ड लिमिटेड', N'S', NULL, NULL, NULL, N'', 0),
  (1418, N'टूर्स अँड ट्रॅव्हल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1419, N'टुर्स अँन्ड ट्रॅव्हल्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1420, N'टुर्स आणि ट्रॅवलस', N'S', NULL, NULL, NULL, N'', 0),
  (1421, N'ट्रान्सपोर्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1422, N'ट्रान्सपोर्ट ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1423, N'ट्रान्सपोर्ट व्यवसाय', N'S', NULL, NULL, NULL, N'', 0),
  (1424, N'ट्रावलिंग  ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1425, N'ट्रांसपोर्ट ', N'S', NULL, NULL, NULL, N'', 0),
  (1426, N'टेलर', N'S', NULL, NULL, NULL, N'', 0),
  (1427, N'टेलर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1428, N'टेलर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1429, N'टेलर्स वर्क्स', N'S', NULL, NULL, NULL, N'', 0),
  (1430, N'टेलर्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1431, N'टेलरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1432, N'टेलरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1433, N'टूव्हीलर सर्विस सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1434, N'टुशन क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (1435, N'टेस्ट ट्यूब बेबी सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1436, N'टाईल्स गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1437, N'टायकांडो एजुकेशन सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1438, N'टायर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1439, N'टायर शॉप आणि रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1440, N'टायर सेल्स अँड सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1441, N'टायर्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1442, N'चिकन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1443, N'चिकन सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1444, N'चिल्ड्रन क्लीनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1445, N'जेंट्स पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1446, N'जेंट्स सलुन', N'S', NULL, NULL, NULL, N'', 0),
  (1447, N'जेंट्स सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1448, N'जुने कागद व भंडार', N'S', NULL, NULL, NULL, N'', 0),
  (1449, N'जेन्टस पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1450, N'जनरल मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1451, N'जनरल स्टोअर अँड चिकन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1452, N'जनरल स्टोअर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1453, N'जनरल स्टोअर्स मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1454, N'जनरल स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (1455, N'ज्यूस अँड भाजी दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1456, N'प्लाइवूड मटेरियल सप्लायर', N'S', NULL, NULL, NULL, N'', 0),
  (1457, N'प्लायूड', N'S', NULL, NULL, NULL, N'', 0),
  (1458, N'प्लायवूड', N'S', NULL, NULL, NULL, N'', 0),
  (1459, N'प्लायवूड अँड इंटेरीयल', N'S', NULL, NULL, NULL, N'', 0),
  (1460, N'प्लायवूड अँड हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1461, N'प्लायवूड अँड हार्डवेअर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1462, N'प्लायवूड आर्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1463, N'प्लायवूड गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1464, N'प्लायवूड शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1465, N'प्लायवूड स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1466, N'पशु दवाखाना ', N'S', NULL, NULL, NULL, N'', 0),
  (1467, N'पशु सामग्री दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1468, N'पैसे पाठवणे', N'S', NULL, NULL, NULL, N'', 0),
  (1469, N'पेस्ट कंट्रोल ', N'S', NULL, NULL, NULL, N'', 0),
  (1470, N'पेस्ट कंट्रोल ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1471, N'पा सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1472, N'पाईप गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1473, N'पाण्याचे प्लान्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1474, N'पान , ट्रॅव्हल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1476, N'पापड दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1477, N'पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1478, N'पाळणाघर', N'S', NULL, NULL, NULL, N'', 0),
  (1479, N'पावर लॉन्ड्री शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1480, N'बुक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1481, N'बूकिंग ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1482, N'बॅग कलेक्शन', N'S', NULL, NULL, NULL, N'', 0),
  (1483, N'बॅग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1484, N'बॅग हाऊस', N'S', NULL, NULL, NULL, N'', 0),
  (1485, N'बॅगचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1486, N'बॅटरी डीलर ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1487, N'बॅटरी विक्रेता', N'S', NULL, NULL, NULL, N'', 0),
  (1488, N'बॅटरी शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1489, N'बॅटरी हाऊस', N'S', NULL, NULL, NULL, N'', 0),
  (1490, N'बुटीक टेलरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1491, N'बुटीक टेलरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1492, N'बुटीक दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1493, N'बुटीक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1494, N'बॅंन्ड ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1495, N'ब्युटि प्रोडक्टस अँड स्टेशनरि', N'S', NULL, NULL, NULL, N'', 0),
  (1496, N'ब्युटि पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1497, N'ब्युटि सलुन ', N'S', NULL, NULL, NULL, N'', 0),
  (1498, N'ब्युटिक', N'S', NULL, NULL, NULL, N'', 0),
  (1499, N'ब्युटिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1500, N'ब्युटिशर्न शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1501, N'ब्युटी पार्लर', N'S', NULL, NULL, NULL, N'', 0),
  (1502, N'ब्युटी सलून', N'S', NULL, NULL, NULL, N'', 0),
  (1503, N'ब्युटीक', N'S', NULL, NULL, NULL, N'', 0),
  (1504, N'फिटनेस डांस स्टुडिओ ', N'S', NULL, NULL, NULL, N'', 0),
  (1505, N'फिश अँड पेट्स स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1506, N'फिश शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1507, N'फिश सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1508, N'फॉसीलेक्स ऑइल', N'S', NULL, NULL, NULL, N'', 0),
  (1509, N'फोटो फ्रेम ', N'S', NULL, NULL, NULL, N'', 0),
  (1510, N'फोटो शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1511, N'फोटो स्टुडिओ', N'S', NULL, NULL, NULL, N'', 0),
  (1512, N'फोटोग्राफी कार्यालय  ', N'S', NULL, NULL, NULL, N'', 0),
  (1513, N'बँक', N'S', NULL, NULL, NULL, N'', 0),
  (1514, N'बॅंक', N'S', NULL, NULL, NULL, N'', 0),
  (1515, N'बॅंक (फायनंस)', N'S', NULL, NULL, NULL, N'', 0),
  (1516, N'बँक ऑफ इंडिया', N'S', NULL, NULL, NULL, N'', 0),
  (1517, N'बँक वित्तीय संस्था', N'S', NULL, NULL, NULL, N'', 0),
  (1518, N'बूक स्टोअर अँड श्टेशन', N'S', NULL, NULL, NULL, N'', 0),
  (1519, N'बूक स्टोअर अँड श्टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1520, N'बुक स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (1521, N'बँक/वित्तीय व संस्था कार्यालय ', N'S', NULL, NULL, NULL, N'', 0)
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
 (1522, N'बँक/वित्तीय संस्था', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1523, N'फुट वेअर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1524, N'फूटवेअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1525, N'फूड पॅकिंग अँड हाऊस किपींग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1526, N'खाजगी अभ्यासिका', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1527, N'खाजगी रुग्णालय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1528, N'खाजगी शाळा', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1529, N'पिठ गिरणी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1530, N'पी ओ पी शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1531, N'पीओपि सीलिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1532, N'पीठ गिरण', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1533, N'पीठ गिरणी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1534, N'पॉईंट सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1535, N'पोर्टेबल केबिन गोडाउन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1536, N'फर्निशिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1537, N'फेर्निशिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1538, N'फर्निशिंग आणि  मट्ट्रेस्सेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1539, N'फर्निशिंग व मॅट्रेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1540, N'फर्निशिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1541, N'फ़र्निशिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1542, N'फुर्निशिंग शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1543, N'फरसण मार्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1544, N'फरसान मार्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1545, N'फरसान विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1546, N'फरसान शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1547, N'फूल विक्रेता', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1548, N'फ्लोअर मिल ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1549, N'फळ भाजी दुकान ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1550, N'फळ मार्केट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1551, N'फळ व भाजी आणि किराणा स्टोअर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1552, N'फळ विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1553, N'फळांचे दुकान ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1554, N'फॅशन डिजाइनिंग ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1555, N'फॅशन डिजायनर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1556, N'फॅसिलिटी मॅनेजमेंट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1557, N'फाईनान्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1558, N'फाईनान्स ऑफिस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1559, N'फायनन्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1560, N'फायनान्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1561, N'फ़ायनान्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1562, N'फायनान्स सेर्विसेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1563, N'फार्मा ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1564, N'फार्मा होलसेल ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1565, N'केबल इंटरप्राजेस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1566, N'कम्प्युटर क्लासेस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1567, N'कम्प्युटर दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1568, N'कम्प्युटर पार्ट्स अँड मोबाइल रिपेर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1569, N'कम्प्युटर रिपेयरिंग सेंटर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1570, N'कम्प्युटर रीपेरिंग ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1571, N'कम्प्युटर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1572, N'कम्प्युटर सेल्स अँड सर्विसेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1573, N'केमिकल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1574, N'केमिस्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1575, N'केमिस्ट व टेशनरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1576, N'कर्टन बेडशीट सोफा कोच', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1577, N'करटन शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1578, N'कर्टन शॉप  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1579, N'करटल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1580, N'क्रेन स्पेअर पार्ट डीलर्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1581, N'कुरिअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1582, N'कूरिअर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1583, N'क्रिकेट बॅट शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1584, N'कुरीअर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1585, N'कुरीयर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1586, N'कुरीयर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1587, N'क्रोकरी होम अप्लायंसेस टाय अँड गिफ्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1588, N'कलेक्शन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1589, N'कलेक्शन सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1590, N'कलर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1591, N'कलरचे दुकान ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1592, N'क्लास', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1593, N'क्लास/स्टेशनरी झेरॉक्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1594, N'क्लासेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1596, N'क्लिनिकल लॅब', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1597, N'क्लीनिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1598, N'क्लोथ वेअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1599, N'कुशन मेकिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1600, N'कस्ट्म क्लियरन्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1601, N'कस्टमर सर्विस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1602, N'कांदा बटाटा व्यापारी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1603, N'कांदा बटाटा होलसेल ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1604, N'कापड दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1605, N'कापड शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1606, N'कार गॅरेज', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1607, N'कार डेकोर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1608, N'कार डेकोरेशन दुकान ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1609, N'कार डिटेलिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1610, N'कार डीलर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1611, N'कार डीलर शोरूम', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1612, N'कार बॅटरी शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1613, N'कार बाइक बॅटरी शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1614, N'कार वॉश सेंटर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1615, N'कार शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1616, N'कार स्पेअर पार्ट शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1617, N'कार सर्विस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1618, N'कार सोल्यूशन्स ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1619, N'कारपेट आणि वालपेपर सर्विस  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1620, N'कारपेट व वॉलपेपर शॉप  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1621, N'कारपेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1622, N'कार्यलय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1624, N'कार्यालय (गोल्ड लोन )', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1625, N'कार्यालय (वित्तीय संस्था)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1626, N'कार्यालय(ऑनलाइन एज्युकेशन)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1627, N'कार्यालय(वित्तीय)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1628, N'किचन अप्लायेन्सेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1629, N'किचन ऑक्सेसरीज ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1630, N'किचन ग्रोसरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1631, N'किचन स्टुडिओ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1632, N'किचन होम', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1633, N'किड्स क्लिनिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1634, N'किड्स वेयर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1635, N'किड्स स्कूल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1636, N'किरणा ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1637, N'किराणा', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1638, N'किराणा दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1639, N'किराणा दुकान व स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1640, N'किराणा मार्केट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1641, N'किराणा शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1642, N'किराणा स्टोअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1643, N'किराणा स्टोअर (मिनीमॉल)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1644, N'किराणा स्टोअर्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1645, N'किराणा स्टोर्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1646, N'किराणा सामानाचे दुकान ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1647, N'की मेकर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1648, N'कीचेन इंटेरीअल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1649, N'कॉ म्यानेजमेंट सर्विर्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1650, N'कॉम्प्युटर क्लास', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1651, N'कॉम्प्युटर रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1652, N'कॉम्प्युटर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1653, N'कॉस्टमॅटिक शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1654, N'कॉस्मॅटिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1655, N'कॉस्मेटिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1656, N'कॉस्मेटिक  क्रॉकरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1657, N'कॉस्मेटिक अँड गिफ्ट शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1658, N'कॉस्मेटिक शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1659, N'कॉस्मेटिक्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1660, N'कोचिंग क्लास', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1661, N'कोचिंग क्लासेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1662, N'कुंटेकर केबिन सेल्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1663, N'कंटेनर केबिन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1664, N'आई केअर सेंटर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1665, N'कडधान्य गोडाउन ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1666, N'कडधान्य स्टॉक गोडाउन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1667, N'कुंड्या आणि झाडे विक्री ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1668, N'कन्स्ट्रक्शन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1669, N'कन्स्ट्रकशन ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1670, N'कन्स्ट्रक्शन ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1671, N'कन्सलटंटींग हाऊस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1672, N'कन्सल्टन्सी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1673, N'कन्सलटन्सी ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1674, N'कपडे', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1675, N'कपडे विक्री ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1676, N'कपडे शिलाई दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1677, N'कपड्याचे गोडाउन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1678, N'कपड्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1679, N'कपड्यांच दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1680, N'कपड्यांचे दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1681, N'कपड्याचे रेडिमेट दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1682, N'कपडा', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1683, N'कपडा गोडाउन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1684, N'कपडा दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1685, N'कपडा व चप्पल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1686, N'कपडा व साडीचे दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1687, N'कपडा शिलाई ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1688, N'कपद्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1689, N'अॅडवायजर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1690, N'अभ्यासिका', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1691, N'अभ्यासिका(खाजगी)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1692, N'अॅल्युमिनियम वर्क शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1693, N'अॅल्युमिनियम विंडो (ऑफिस)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1694, N'असोसिएशन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1696, N'अॅक्वा शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1697, N'अकाऊंट ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1698, N'अकाऊंट कार्यालय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1699, N'अग्रीकल्चर लँड सेकंड होम', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1700, N'जिम फिटनेस स्टुडिओ ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1701, N'कंन्स्ट्रक्शन ऑफिस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1703, N'मेडिकल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1705, N'जनरल स्टोअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1706, N'पान शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1707, N'कंपनी/ कारखाने नवीन ना हरकत दाखले', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1708, N'पेट्रोल  पंप नुतनिकरण ना हरकत दाखला', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1709, N'नवीन उद्योगधंदा परवाना', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1710, N'नवीन व्यवसाय परवाना देणे', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1711, N'व्यवसाय परवाना नुतनीकरण', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1712, N'साठा परवाना नुतनीकरण ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1713, N'आटा चक्की', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1714, N'आय ग्लास', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1715, N'आयुरयोगा सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1716, N'आयुर्वेदिक दुकान', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1717, N'आयुर्वेदिक मेडिकल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1718, N'आयुर्वेदिक व युनाणी हब', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1719, N'आयुर्वेदिक सेंटर व साडी सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1720, N'आर्किटेक कार्यालय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1721, N'आर्किटेक्चर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1722, N'आर्ट क्राफ्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1723, N'आर्युवेदिक स्टोअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1724, N'इजिनियरिंग ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1725, N'इंजीनिअरिंग ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1726, N'इंजीनिअरिंग कंपनी ( ऑफिस)', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1727, N'इंटरनेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1728, N'इंटरनेट सर्व्हिसेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1729, N'इंटरप्राइझेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1730, N'इंटेरियर डिझायनिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1731, N'इंटेरियर डिसायनीग ऑफिस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1732, N'इंटेरियल ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1733, N'इंटेरीअर डिजायनर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1734, N'इंडस्ट्रीज सर्विसेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1735, N'इनवटर बॅटरी ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1736, N'इन्वटर बॅटरी विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1737, N'इनवेसमेंट कार्यालय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1738, N'इन्शुरन्स ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1739, N'इन्शुरन्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1740, N'इन्शुरन्स कं. लि.', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1741, N'इलेक्ट्रिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1742, N'इलेक्ट्रिक अँड हार्डवेअर शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1743, N'इलेक्ट्रिक अँड हार्डवेर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1744, N'इलेक्ट्रिक आणि हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1745, N'इलेक्ट्रिक बाइक शोरूम', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1746, N'इलेक्ट्रिक रिपेअरींग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1747, N'इलेक्ट्रिक रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1748, N'इलेक्ट्रिक रीपेरिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1749, N'इलेक्ट्रिक लाइट ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1750, N'इलेक्ट्रिक व हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1751, N'इलेक्ट्रिक वस्तु विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1752, N'इलेक्ट्रिक शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1753, N'इलेक्ट्रिक स्कूटर विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1754, N'इलेक्ट्रिक सामान दुरूस्ती', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1755, N'इलेक्ट्रिक हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1756, N'इलेक्ट्रिक हार्डवेअर स्टोअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1757, N'इलेक्ट्रिकल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1758, N'इलेक्ट्रिकल अँड हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1759, N'इलेक्ट्रिकल्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1760, N'इलेक्ट्रिकल्स अँड हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1761, N'इलेक्ट्रिक्स अँड हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1762, N'इलेक्ट्रॉनिक शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1763, N'इलेक्ट्रॉनिक्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1764, N'इलेक्ट्रॉनिक्स  रीपेअरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1765, N'इलेक्टीक्लर्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1766, N'इंशुरंस सल्लागार', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1767, N'इंस्टीट्यूट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1768, N'इस्त्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1769, N'ईलेक्ट्रिशन', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1770, N'उस सप्लायर्स ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1772, N'एक्सिस बँक  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1773, N'एजेंट ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1774, N'एजन्सी ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1775, N'एंजिनियर ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1776, N'एंटरप्रायजेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1777, N'एटीएम', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1778, N'एड्वोकेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1779, N'एम.एस.पाईप गोडाउन ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1780, N'एम्ब्रोइडरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1781, N'एल आय सी  फायनान्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1782, N'एल आय सी कार्यालय', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1783, N'एल.आय.सी. ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1784, N'एलेक्ट्रोनिक स्टोर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1785, N'एलुमिनियम अँड ग्लास वर्क', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1786, N'एव्हेंट एजन्सि', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1787, N'एसी रेर्पैरिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1788, N'एसी रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1789, N'ऑइल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1790, N'ऑटो गॅरेज', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1791, N'ऑटो पार्ट्स आणि सर्विस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1792, N'ऑटोमोबाइल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1793, N'ऑटोमोबाइल पार्ट सर्विसेस ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1794, N'ऑटोमोबाइल रीपेयरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1795, N'ऑटोमोबाइल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1796, N'ऑटोमोबाइल स्पेअरपार्ट शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1797, N'ऑटोमोबाईल अँड वॉशिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1798, N'ऑटोमोबाईल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1799, N'ऑनलाइन ग्रोसरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1800, N'ऑनलाइन ग्रोसरी डेलिवेरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1801, N'ऑनलाइन शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1802, N'ऑप्टिक', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1803, N'ऑप्टिक शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1804, N'ऑप्टिकल', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1805, N'ऑप्टिकल शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1806, N'ऑप्टिकल्स शॉप ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1807, N'ऑप्टिक्स', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1808, N'ऑप्टिक्स शॉप', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1809, N'ऑफिस ( कनस्टटसी ऑफिस )', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1810, N'ऑफिस + स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1811, N'ऑफिस लॉजिस्टिक्स सेर्विसेस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1812, N'ओपटीकल्स ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1813, N'ओल्ड पेपर मार्ट', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1814, N'औषद विक्री', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1815, N'उद्योगधंदा परवाना नुतनीकरण  ', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1816, N'( अग्रो प्रोडक्ट )ऑफिस', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1821, N'आईस्क्रीम पार्लर', N'S', 68, NULL, NULL, N'', 0, NULL),
  (1822, N'एनजीओ', N'S', 68, NULL, NULL, N'', 0, NULL),
  (1823, N'योगा ', N'GM', 68, NULL, NULL, N'', 0, NULL),
  (1824, N'झुंबा ', N'GM', 68, NULL, NULL, N'', 0, NULL),
  (1826, N'वस्तु निर्मिती', N'S', NULL, NULL, NULL, N'', 0, NULL),
  (1828, N'पार्कींग', N'N', 72, NULL, NULL, N'', 0, NULL),
  (1829, N'रिफ्युज एरिया', N'N', 72, NULL, NULL, N'', 0, NULL),
  (1830, N'पार्किंग', N'GR', 70, NULL, NULL, N'', 0, 1),
  (1831, N'पेट्स क्लिनिक', N'D', 68, NULL, NULL, N'', 0, NULL),
  (1832, N'विद्यालय', N'T', 72, NULL, NULL, N'', 0, NULL),
  (1835, N'औद्योगिक', N'NI', 66, NULL, NULL, N'', 0, NULL),
  (1836, N'इंडेक्स-2', N'C', 74, NULL, NULL, N'', 0, NULL),
  (1854, N'स्टोअर रूम', N'R', 72, NULL, NULL, N'', 0, NULL),
  (1932, N'Other', N'ABLC', NULL, NULL, NULL, N'', 0, NULL),
  (2012, N'व्हिजिटर्स पार्किंग', N'SPK', NULL, NULL, NULL, N'', 0, 1),
  (2013, N'कार पार्किंग', N'OPK', NULL, NULL, NULL, N'', 0, 1),
  (2015, N'सायकल  पार्किंग ', N'OPK', NULL, NULL, NULL, N'', 0, 1),
  (2019, N'बाईक पार्किंग', N'OPKC', NULL, NULL, NULL, N'', 0, 1),
  (2026, N'लॉबी', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2028, N'वॉचमन रूम', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2030, N'बॅडमिंटन कोर्ट', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2032, N'चेस एरिया', N'ACH', 91, NULL, NULL, N'', 0, NULL),
  (2034, N'कॅरम एरिया', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2036, N'पंप रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2038, N'आरएमएस रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2040, N'इलेक्ट्रिक रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2042, N'गोडाऊन', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2044, N'रेस्टॉरंट', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2046, N'डिपार्टमेंटल स्टोअर', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2048, N'बँक्वेट हॉल', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2050, N'क्रेच', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2054, N'टेबल टेनिस एरिया', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2056, N'स्नूकर / अॅडमिन एरिया', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2059, N'ए.व्ही. रूम', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2060, N'जेन्ट्स टॉयलेट', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2063, N'कॉमन वॉशरूम', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2065, N'हँडीकॅप वॉशरूम', N'ACHC', 56, NULL, NULL, N'', 0, NULL),
  (2066, N'लेडीज वॉशरूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2068, N'स्विमिंग पूल', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2070, N'एल.व्ही.एस. रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2072, N'फिटनेस सेंटर', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2074, N'कॅफेटेरिया', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2076, N'सोसायटी रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2078, N'ड्रायव्हर रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2080, N'गेस्ट रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2082, N'रेस्ट रूम & चेंजिंग रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL),
  (2084, N'जानिटर रूम', N'ACH', 56, NULL, NULL, N'', 0, NULL)

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
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('2',N'निवासी','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('3',N'अनिवासी','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('4',N'शासकीय मालमत्ता','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('5',N'शैक्षणिक','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('6',N'औद्योगिक','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([Id], [PropertyTypeCategory], [isActive]) VALUES ('7',N'मिश्रित','1');
SET IDENTITY_INSERT [PTIS].[PropertyTypeCategoryMaster] OFF;




SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] ON;
INSERT INTO [PTIS].[PropertyTypeMaster]
(
    [Id],[PropertyDescription],[Type],[SearchSequence],[PropertyTypeCategoryId],[PartType],[IsActive])
VALUES
(1, N'खाजगी शाळा', N'C', 1, NULL, N'C', 1),
(2, N'म.न.पा.शाळा', N'N', 1, NULL, N'', 1),
(5, N'खाजगी रुग्णालय', N'C', 1, NULL, N'C', 1),
(6, N'शासकीय रुग्णालय', N'C', 2, NULL, N'C', 1),
(8, N'म.न.पा.चे रुग्णालय', N'N', 4, NULL, N'', 1),
(10, N'बँक व वित्तीय संस्था', N'C', 1, NULL, N'C', 1),
(11, N'धार्मिक स्थळ', N'R', 1, NULL, N'R', 1),
(12, N'निवासी', N'R', 1, 2, N'R', 1),
(13, N'दुकान', N'C', 1, NULL, N'C', 1),
(14, N'रेस्टॉरंट आणि बार', N'C', 1, NULL, N'C', 1),
(16, N'म.न.पा.चे.कार्यालय', N'N', 2, NULL, N'', 1),
(17, N'शासकीय कार्यालय', N'C', 3, NULL, N'C', 1),
(21, N'म.न.पा. व इतर मालमत्ता', N'N', 2, NULL, N'', 1),
(22, N'प्लॉट', N'R', 1, NULL, N'R', 1),
(23, N'निवासी व दुकान', N'R-C', 2, NULL, N'', 1),
(24, N'अतिक्रमण', N'R', 3, NULL, N'R', 1),
(25, N'मा शासकीय मालमत्ता', N'C', 4, NULL, N'C', 1),
(27, N'मोबाईल टॉवर', N'C', 2, NULL, N'C', 1),
(28, N'पेट्रोल पंप', N'C', 1, NULL, N'C', 1),
(29, N'हॉटेल', N'C', 2, NULL, N'C', 1),
(30, N'लॉज', N'C', 1, NULL, N'C', 1),
(31, N'निवासी व हॉटेल', N'R-C', 4, NULL, N'', 1),
(32, N'गोडाऊन', N'C', 2, NULL, N'C', 1),
(33, N'चालू बांधकाम', N'R', 1, NULL, N'R', 1),
(34, N'गोठा', N'R', 5, NULL, N'R', 1),
(35, N'पडीत', N'R', 6, NULL, N'R', 1),
(36, N'कार्यालय', N'C', 2, NULL, N'C', 1),
(37, N'म.न.पा.दुकान गाळे', N'N', 4, NULL, N'', 1),
(38, N'वसतिगृह', N'C', 2, NULL, N'C', 1),
(39, N'व्यायाम शाळा', N'C', 5, NULL, N'C', 1),
(41, N'पार्किंग', N'C', 2, NULL, N'C', 1),
(42, N'निवासी व कार्यालय', N'R-C', 8, NULL, N'', 1),
(44, N'वाचनालय', N'C', 2, NULL, N'C', 1),
(45, N'केंद्र शासकीय मालमत्ता', N'C', 1, NULL, N'C', 1),
(46, N'खाजगी रुग्णालय व निवासी', N'R-C', 5, NULL, N'', 1),
(47, N'धार्मिक स्थळ व अनिवासी', N'R-C', 3, NULL, N'', 1),
(48, N'शासकीय वसतिगृह', N'C', 7, NULL, N'C', 1),
(49, N'लॉंन', N'C', 3, NULL, N'C', 1),
(50, N'चित्रपटगृह', N'C', 4, NULL, N'C', 1),
(51, N'शोरूम', N'C', 4, NULL, N'C', 1),
(52, N'कोचिंग क्लासेस', N'C', 2, NULL, N'C', 1),
(53, N'खाजगी रुग्णालय व दुकान', N'C', 7, NULL, N'C', 1),
(54, N'मंगल कार्यालय व निवासी', N'R-C', 2, NULL, N'', 1),
(55, N'निवासी व औद्योगिक', N'R-C', 2, NULL, N'', 1),
(57, N'दुकान व पडीत', N'R-C', 5, NULL, N'', 1),
(58, N'निवासी व पडीत', N'R', 10, NULL, N'R', 1),
(59, N'निवासी  व बँक', N'R-C', 2, NULL, N'', 1),
(63, N'खाजगी शाळा व निवासी', N'R-C', 2, NULL, N'', 1),
(64, N'दुकान व मंगल कार्यालय', N'C', 6, NULL, N'C', 1),
(66, N'दुकान व कार्यालय', N'C', 3, NULL, N'C', 1),
(69, N'निवासी व अनिवासी', N'R-C', 6, NULL, N'', 1),
(70, N'कारखाना व कार्यालय', N'C', 3, NULL, N'C', 1),
(77, N'दवाखाना व हॉटेल', N'C', 10, NULL, N'C', 1),
(78, N'बँक व अनिवासी', N'C', 6, NULL, N'C', 1),
(79, N'हॉटेल व दुकान', N'C', 6, NULL, N'C', 1),
(80, N'निवासी,गोडाउन,दुकान', N'R-C', 8, NULL, N'', 1),
(82, N'अनिवासी', N'C', 2, NULL, N'C', 1),
(83, N'कारखाना व गोडाउन', N'C', 4, NULL, N'C', 1),
(88, N'शैक्षणिक शासकीय', N'C', 4, NULL, N'C', 1),
(92, N'औद्योगिक', N'I', 1, NULL, N'', 1),
(94, N'मॉल', N'C', 3, NULL, N'C', 1),
(108, N'शासकीय मालमत्ता', N'C', 5, NULL, N'C', 1),
(110, N'धार्मिक स्थळ व निवासी', N'R', 1, NULL, N'R', 1),
(111, N'निवासी व गोडावून', N'R-C', 1, NULL, N'', 1),
(113, N'मंगल कार्यालय', N'C', 1, NULL, N'C', 1),
(115, N'निवासी व कोचिंग क्लासेस', N'R-C', 1, NULL, N'', 1),
(118, N'अंगणवाडी', N'C', 1, NULL, N'C', 1),
(119, N'निवासी व अंगणवाडी', N'R-C', 1, NULL, N'', 1),
(127, N'गोडावून व दुकान', N'C', 1, NULL, N'C', 1),
(132, N'शेती', N'R', 1, NULL, N'R', 1),
(133, N'मोबाईल टॉवर व निवासी', N'R-C', 1, NULL, N'', 1),
(134, N'सामाजिक सभागृह', N'C', 1, NULL, N'C', 1),
(135, N'मनपा गार्डन/ओपनस्पेस', N'C', 1, NULL, N'C', 1),
(136, N'मनपा इतर भूखंड', N'R', 1, NULL, N'R', 1),
(137, N'नर्सरी', N'C', 1, NULL, N'C', 1),
(138, N'पेयिंग गेस्ट', N'R', 1, NULL, N'R', 1),
(139, N'पॅथॉलॉजी लॅब', N'C', 1, NULL, N'C', 1),
(140, N'अॅमिनीटी', N'R', 1, NULL, N'Amenity', 1),
(141, N'रिफ्युज एरिया', N'N', 1, NULL, N'', 1),
(142, N'निवासी व चालू बांधकाम', N'R', 1, NULL, N'R', 1),
(144, N'पोल्ट्रीफार्म', N'C', 1, NULL, N'C', 1),
(145, N'अनिवासी व चालू बांधकाम', N'R-C', 1, NULL, N'', 1),
(146, N'निवासी व गोठा', N'R', 1, NULL, N'R', 1),
(147, N'प्लॉट व अनिवासी', N'C', 1, NULL, N'C', 1),
(148, N'निवासी व खुला भूखंड', N'R', 1, NULL, N'R', 1),
(149, N'अनिवासी व खुला भूखंड', N'C', 1, NULL, N'C', 1),
(151, N'औद्योगिक व अनिवासी', N'I-C', 1, NULL, N'', 1),
(152, N'औद्योगिक व मिश्र', N'R-C', 1, NULL, N'', 1),
(153, N'निवासी , औद्यागिक , अनिवासी', N'R-C', 1, NULL, N'', 1),
(154, N'निवासी व वाचनालय', N'R-C', 1, NULL, N'', 1),
(155, N'बांधकाम पूर्ण मा. वापरात नाही', N'R-C', 1, NULL, N'', 1),
(156, N'शेती व अनिवासी', N'R-C', 1, NULL, N'', 1),
(157, N'क्लिनिक', N'C', 1, NULL, N'C', 1),
(158, N'उपहारगृह', N'C', 1, NULL, N'C', 1),
(159, N'धार्मिक स्थळ,निवासी व अनिवासी', N'R-C', 1, NULL, N'', 1),
(160, N'माहिती व तंत्रज्ञान उद्योग', N'I', 1, NULL, N'', 1),
(161, N'सामाजिक संस्था', N'R', 1, NULL, N'R', 1);

SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] OFF;




INSERT INTO [PTIS].[FloorMaster]
([FloorCode], [Description], [SequenceNo], [MaxFloorNo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES
(N'1',  N'पहिला मजला', 12, 13, NULL, NULL, NULL),
(N'2',  N'दुसरा मजला', 13, 14, NULL, NULL, NULL),
(N'3',  N'तिसरा मजला', 14, 15, NULL, NULL, NULL),
(N'4',  N'चौथा मजला', 15, 16, NULL, NULL, NULL),
(N'5',  N'पाचवा मजला', 16, 17, NULL, NULL, NULL),
(N'6',  N'सहावा मजला', 17, 18, NULL, NULL, NULL),
(N'7',  N'सातवा मजला', 18, 19, NULL, NULL, NULL),
(N'8',  N'आठवा मजला', 19, 20, NULL, NULL, NULL),
(N'9',  N'नववा मजला', 20, 21, NULL, NULL, NULL),
(N'10', N'दहावा मजला', 21, 22, NULL, NULL, NULL),
(N'11', N'अकरावा मजला', 22, 23, NULL, NULL, NULL),
(N'12', N'बारावा मजला', 23, 24, NULL, NULL, NULL),
(N'13', N'तेरावा मजला', 24, 25, NULL, NULL, NULL),
(N'14', N'चोदावा मजला', 25, 26, NULL, NULL, NULL),
(N'15', N'पंधरावा मजला', 26, 27, NULL, NULL, NULL),
(N'16', N'सोळावा मजला', 27, 28, NULL, NULL, NULL),
(N'17', N'सतरावा मजला', 28, 29, NULL, NULL, NULL),
(N'18', N'अठरावा मजला', 29, 30, NULL, NULL, NULL),
(N'19', N'एकोणिसावा मजला', 30, 31, NULL, NULL, NULL),
(N'20', N'विसांवा मजला', 31, 32, NULL, NULL, NULL),
(N'21', N'एकविसांवा मजला', 32, 33, NULL, NULL, NULL),
(N'22', N'बाविसांवा मजला', 33, 34, NULL, NULL, NULL),
(N'23', N'तेवीसांवा मजला', 34, 35, NULL, NULL, NULL),
(N'24', N'चोवीसांवा मजला', 35, 36, NULL, NULL, NULL),
(N'25', N'पंचवीसांवा मजला', 36, 37, NULL, NULL, NULL),
(N'26', N'सव्वीसांवा मजला', 37, 38, NULL, NULL, NULL),
(N'27', N'सत्तावीसांवा मजला', 38, 39, NULL, NULL, NULL),
(N'28', N'अठावीसांवा मजला', 39, 40, NULL, NULL, NULL),
(N'29', N'एकोणतिसांवा मजला', 40, 41, NULL, NULL, NULL),
(N'30', N'तिसांवा मजला', 41, 42, NULL, NULL, NULL),
(N'31', N'एकतीसांवा मजला', 42, 43, NULL, NULL, NULL),
(N'32', N'बत्तीसांवा मजला', 43, 44, NULL, NULL, NULL),
(N'33', N'तेत्तीसावा मजला', 44, 45, NULL, NULL, NULL),
(N'34', N'चोत्तीसावा मजला', 45, 46, NULL, NULL, NULL),
(N'35', N'पस्तीसावा मजला', 46, 47, NULL, NULL, NULL),
(N'36', N'छत्तिसावा मजला', 47, 48, NULL, NULL, NULL),
(N'37', N'सदतिसावा मजला', 48, 49, NULL, NULL, NULL),
(N'38', N'अडतिसावा मजला', 49, 50, NULL, NULL, NULL),
(N'39', N'एकोणचाळिसावा मजला', 50, 51, NULL, NULL, NULL),
(N'40', N'चाळिसावा मजला', 51, 52, NULL, NULL, NULL),
(N'41', N'एकेचाळिसावा मजला', 52, 53, NULL, NULL, NULL),
(N'42', N'बेचाळीसवा मजला', 53, 54, NULL, NULL, NULL),
(N'44', N'चौचाळीसवा मजला', 55, 56, NULL, NULL, NULL),
(N'48', N'अठ्ठेचाळीसवा मजला', 59, 60, NULL, NULL, NULL),
(N'50', N'पन्नासवा मजला', 61, 62, NULL, NULL, NULL),
(N'51', N'एकावन्नवा मजला', 62, 63, NULL, NULL, NULL),
(N'52', N'बाव्वन्नवा मजला', 63, 64, NULL, NULL, NULL),
(N'53', N'त्रेपन्नवा मजला', 64, 65, NULL, NULL, NULL),
(N'54', N'चौपन्नवा मजला', 65, 66, NULL, NULL, NULL),
(N'55', N'पंचावन्नवा मजला', 66, 67, NULL, NULL, NULL),
(N'56', N'छप्पनवा मजला', 67, 68, NULL, NULL, NULL),
(N'57', N'सत्तावन्नवा मजला', 68, 69, NULL, NULL, NULL),
(N'58', N'अठ्ठावन्नवा मजला', 69, 70, NULL, NULL, NULL),
(N'59', N'एकोणसाठवा मजला', 70, 71, NULL, NULL, NULL),
(N'60', N'साठवा मजला', 71, 72, NULL, NULL, NULL),
(N'61', N'एकसष्टवा मजला', 72, 73, NULL, NULL, NULL),
(N'63', N'त्रेसष्टवा मजला', 73, 75, NULL, NULL, NULL),
(N'64', N'चौसष्टवा मजला', 74, 76, NULL, NULL, NULL),
(N'65', N'पासष्टवा मजला', 75, 77, NULL, NULL, NULL),
(N'66', N'सहासष्ठवा मजला', 76, 78, NULL, NULL, NULL),
(N'67', N'सदुसष्टवा मजला', 77, 79, NULL, NULL, NULL),
(N'68', N'अडुसष्ठवा मजला', 78, 80, NULL, NULL, NULL),
(N'69', N'एकोणसत्तरवा मजला', 79, 81, NULL, NULL, NULL),
(N'70', N'सत्तरवा मजला', 80, 82, NULL, NULL, NULL),
(N'B',  N'तळघर', 1, 1, NULL, NULL, NULL),
(N'L',  N'लोअर तळमजला', 2, 3, NULL, NULL, NULL),
(N'G',  N'तळमजला', 3, 2, NULL, NULL, NULL),
(N'U1', N'अप्पर ग्राऊंड पहिला', 4, 11, NULL, NULL, NULL),
(N'U2', N'अप्पर ग्राऊंड दुसरा', 5, 12, NULL, NULL, NULL),
(N'P1', N'पोडियम1', 6, 5, NULL, NULL, NULL),
(N'P2', N'पोडियम2', 7, 6, NULL, NULL, NULL),
(N'P3', N'पोडियम3', 8, 7, NULL, NULL, NULL),
(N'P4', N'पोडियम4', 9, 8, NULL, NULL, NULL),
(N'P5', N'पोडियम5', 10, 9, NULL, NULL, NULL),
(N'P6', N'पोडियम6', 11, 10, NULL, NULL, NULL),
(N'M',  N'पॉटमाळा', 0, 4, NULL, NULL, NULL),
(N'OP', N'Open Plot', 0, 0, NULL, NULL, NULL);


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
      (N'OPK',   N'ओपन पार्किंग'),
      (N'SPK',  N'स्टील पार्किंग'),
      (N'OPKC',  N'ओपन पार्किंग अनिवासी'),
      (N'SPKC',  N'स्टील पार्किंग अनिवासी'),
      (N'OPKI',  N'ओपन पार्किंग औदयोगिक'),
      (N'SPKI',  N'स्टील पार्किंग औदयोगिक')
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





SET IDENTITY_INSERT [PTIS].[PartTypeMaster] ON;
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('1','C');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('2','Government Property');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('3','Individual');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('4','Individual Chal');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('5','Individual Partition');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('6','Industry');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('7','IndustryL');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('8','Plot');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('9','R');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('10','RH');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('11','utilsub');
INSERT INTO [PTIS].[PartTypeMaster] ([Id], [PartType]) VALUES ('13','Apartment');
SET IDENTITY_INSERT [PTIS].[PartTypeMaster] OFF;



INSERT INTO [PTIS].[SubFloorMaster] ([SubFloorCode], [Description], [SubFloorPercentage]) VALUES ('Loft','LOFT','50.00');

INSERT INTO [PTIS].[SubFloorMaster] ([SubFloorCode], [Description], [SubFloorPercentage]) VALUES ('Attic','ATTIC','50.00');
INSERT INTO [PTIS].[SubFloorMaster] ([SubFloorCode], [Description], [SubFloorPercentage]) VALUES ('Mezzanine','MEZZANINE','70.00');




--SET IDENTITY_INSERT [PTIS].[SubmissionRemarkMaster] ON;
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('1','Hall','N','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('2','Kit/Din','N','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('3','BED1','N','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('4','BED2','N','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('5','BED3','N','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('6','Hall Bal ENC','E','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('7','Kit Bal ENC','E','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('8','Hall Bal','O','0');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('9','Bed Bal','O','0');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('10','Kit Bal','O','0');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('11','W/C/Bath','WB','2');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('12','WC','W','2');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('13','BED1 Bal ENC','E','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('14','BED2 Bal ENC','E','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('15','BED3 Bal ENC','E','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('16','Bath','B','2');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('17','Shop','A','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('18','Passage','A','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('19','Office','A','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('20','PSG','A','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('21','Individual','A','1');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('26','Parking','N','3');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('27','Other','N','2');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('28','Rooms','N','4');
--INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterId], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('29','Staire','E','2');
--SET IDENTITY_INSERT [PTIS].[SubmissionRemarkMaster] OFF;
---- [PTIS].[UsageCategoryMaster]






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
-- (1,  N'GeneralTax',           N'सामान्य कर रु.',                    1,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (2,  N'StateEducationTax',    N'शिक्षण कर रु.',                      2,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (3,  N'StateEmploymentTax',   N'रोजगार हमी कर रु.',                  3,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (4,  N'SpEducationTax',       N'शिक्षण उपकर रु.',                    4,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (5,  N'DrainCess',            N'घ.क शु. रु.',                       5,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (6,  N'RoadCess',             N'रस्ता कर रु.',                       6,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (7,  N'TreeCess',             N'वृक्ष उपकर रु.',                     7,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (8,  N'SewageDisposalCess',   N'मलप्रवाह सुविधा लाभ कर रु.',         8,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (9,  N'SanitationCess',       N'प्रशासकीय सेवा शुल्क रु.',           9,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (10, N'WaterBenefitCess',     N'पाणीपुरवठा लाभ कर रु.',             10, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (11, N'SpWaterCess',          N'मल निस्सा रण लाभ रु.',              11, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (12, N'WaterBill',            N'मागणी नोटीस फी रु.',                12, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (13, N'FireCess',             N'अग्नि. कर रु.',                      13, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (14, N'Penalty',              N'थकीत शास्ती रु.',                    14, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (15, N'BigBuilding',          N'मोठी इमारत कर रु.',                  15, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (16, N'LightCess',            N'विशेष साफसफाई कर रु.',              16, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (17, N'ServiceTax',           N' ',                                  17, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (19, N'IllegalConstPenalty',  N'अनधिकृत बांध काम शास्ती रु. ',      18, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (20, N'Tax1',                 N'कर १ रु.',                           19, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (21, N'Tax2',                 N'कर २ रु.',                           20, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (22, N'Tax3',                 N'कर ४ रु..',                          21, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (23, N'Tax4',                 N'कर ४ रु.',                           22, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (24, N'Tax5',                 N'कर ५ रु.',                           23, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (25, N'Tax6',                 N'कर ५ रु.',                           24, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (26, N'Tax7',                 N'कर ६ रु.',                           25, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (27, N'Tax8',                 N'कर ७ रु.',                           26, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (28, N'Tax9',                 N'कर ९ रु.',                           27, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (29, N'Tax10',                N'कर १० रु.',                          28, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (30, N'Interest',             N'चालू मा.कर शास्ती रु.',              29, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (31, N'Discount',             N'विशेष सूट रु.',                      30, 0, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (32, N'TaxTotal',             N'एकूण कर रु.',                         31, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
-- (33, N'NetTotal',             N'निव्वळ एकूण कर रु.',                  32, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL);

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
 INSERT [PTIS].[GenderMaster] ([Id], [GenderName]) VALUES (4,N'फर्म')
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
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'कायम','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'बाल्कनी close केली','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'बाल्कनी close  होती  Open केली','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'क्षेत्रफळात बदल','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'वापरात बदल','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'अतिरिक्त बांधकाम केले','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'BHK बदल','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'भाडे माहिती बदल','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'बाह्य मोजणीचे अंतर्गत मोजणी केली','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'मालमत्ता वगळणे','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'इतर','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'नव्याने सर्वेक्षण पूर्ण','SurveyApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [Flag]) VALUES (N'प्लॉट वर नवीन बांधकाम केले','SurveyApp')

 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'बिल वितरित करण्यात आले', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'मालमत्ता बंद', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'त्रुटी असल्यामुळे बिल स्वीकारू शकत नाही', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'तक्रार केलेली आहे त्यामुळे बिल स्वीकारू शकत नाही', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'बिल मान्य नाही त्यामुळे स्वीकारण्यात आले नाही', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'कर धारक हजर नसल्यामुळे बिल स्वीकारण्यात आले नाही', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'बिल सेक्रेटरीकडे सोपवली', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'सोसायटीमध्ये बिल वितरित करू देण्यास नकार', N'Reject', N'Visited but Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'मालमत्ता मिळाली नाही', N'Reject', N'Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'मालमत्ता बंद (बिल चिटकवू देण्यास नकार)', N'Reject', N'Not Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'मालमत्ता बंद (बिल चिटकवण्यात आले )', N'Accept', N'Visited and Distributed',1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'बिल दिले', N'Accept', N'Visited and Distributed', 1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'मालमत्ता बंद / मालमत्तेस बिल चिटकवले', N'Accept', N'Visited and Distributed', 1,'BillApp')
 GO
 INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement], [BillAcceptStatus], [Remark], [IsActive], [Flag]) VALUES (N'बिल घेण्यास नकार', N'Reject', N'Not Distributed', 1,'BillApp')
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
 
 INSERT INTO [PTIS].[PolicyConfiguration]
(
    PolicyCode, Category, DisplayName, Description,
    DataType, PolicyValue, DefaultValue,
    IsActive, Unit, AllowedValues, CreatedDate
)
 SELECT
     v.PolicyCode, v.Category, v.DisplayName, v.Description,
     v.DataType, v.PolicyValue, v.DefaultValue,
     v.IsActive, v.Unit, v.AllowedValues, v.CreatedDate
 FROM (VALUES
     (N'AssessmentYear', N'General', N'Assessment Base Year',
      N'Assessment base year for policy configuration.',
      N'INT', N'2010', N'2010', 1, NULL, NULL, GETDATE()),
     (N'TaxesOnCV', N'Calculation', N'Taxes On CV',
      N'Apply tax calculation based on Capital Value (CV).',
      N'BIT', N'1', N'0', 1, NULL, NULL, GETDATE()),
     (N'TaxesOnRV', N'Calculation', N'Taxes On RV',
      N'Apply tax calculation based on Rateable Value (RV).',
      N'BIT', N'1', N'1', 1, NULL, NULL, GETDATE()),
     (N'TaxOnBuiltUpArea', N'Calculation', N'Tax On Built Up Area',
      N'Apply tax calculation based on Built Up Area.',
      N'BIT', N'0', N'0', 1, NULL, NULL, GETDATE()),
     (N'EducationEmploymentTaxOnRV', N'Calculation',
      N'Education / Employment Tax On RV',
      N'Apply Education Tax and Employment Tax based on Rateable Value (RV).',
      N'BIT', N'0', N'0', 1, NULL, NULL, GETDATE()),
     (N'ApplyMaintenance', N'Calculation', N'Apply Maintenance',
      N'Apply maintenance deduction during annual rental value or rateable value calculation.',
      N'BIT', N'1', N'1', 1, NULL, NULL, GETDATE()),
     (N'MaintenancePercentage', N'Calculation', N'Maintenance Percentage',
      N'Percentage of maintenance deduction applied during annual rental value or rateable value calculation.',
      N'DECIMAL', N'10', N'10', 1, N'PERCENT', NULL, GETDATE()),
     (N'RateMasterAreaUnit', N'Calculation', N'Rate Master Area Unit',
      N'Purpose: Defines whether Rate Master rates are entered per SqMeter or per SqFeet. PolicyValue: SqMeter or SqFeet. Example: SqMeter.',
      N'VARCHAR', N'SqMeter', N'SqMeter', 1, NULL, N'SqMeter,SqFeet', GETDATE()),
     (N'RateMonthlyOrYearly', N'Calculation', N'Rate Monthly Or Yearly',
      N'Purpose: Determines whether Rate Master rates are monthly or yearly. PolicyValue: Monthly or Yearly. Example: Yearly.',
      N'VARCHAR', N'Yearly', N'Monthly', 1, NULL, N'Monthly,Yearly', GETDATE()),
     (N'TaxCalculationMethod', N'Calculation', N'Tax Calculation Method',
      N'Purpose: Specifies which tax calculation method should be used. PolicyValue: RV=Rateable Value, CV=Capital Value. Example: RV.',
      N'VARCHAR', N'RV', N'RV', 1, NULL, N'RV,CV', GETDATE())
  ) v
  (
      PolicyCode, Category, DisplayName, Description,
      DataType, PolicyValue, DefaultValue,
      IsActive, Unit, AllowedValues, CreatedDate
  )
  WHERE NOT EXISTS (
      SELECT 1
      FROM [PTIS].[PolicyConfiguration] pc
      WHERE pc.PolicyCode = v.PolicyCode
  );
------------------------tax configuration-----------------------

INSERT INTO PTIS.TaxCategoryMaster (CategoryCode, CategoryName, IsActive, CreatedBy)
SELECT v.CategoryCode, v.CategoryName, 1, 1
FROM (VALUES
    ('TAX',  'Property Tax'),
    ('CESS', 'Cess'),
    ('EDU',  'State Education Tax'),
    ('EMP',  'State Employment Tax'),
    ('USER', 'User Charges'),
    ('PENALTY', 'Penalty')
) v(CategoryCode, CategoryName)

GO



INSERT INTO PTIS.TaxMaster (TaxCode, TaxName, TaxCategoryId, DisplayOrder, IsActive)
SELECT v.TaxCode, v.TaxName, c.Id, v.DisplayOrder, 1
FROM (VALUES
    ('GEN',  'General Tax',              'TAX',  1),
    ('STATE_EDU', 'State Education Tax','EDU',  2),
    ('STATE_EMP', 'State Employment Tax','EMP', 3),
    ('TREE', 'Tree Cess',               'CESS', 4),
    ('SP_WATER', 'Special Water Cess',  'CESS', 5),
    ('ROAD', 'Road Cess',               'CESS', 6),
    ('FIRE', 'Fire Cess',               'CESS', 7),
    ('LIGHT', 'Light Cess',             'CESS', 8),
    ('WATER_BEN', 'Water Benefit Cess', 'CESS', 9),
    ('SEWAGE', 'Sewage Disposal Cess',  'CESS', 10),
    ('SP_EDU', 'Special Education Tax', 'EDU',  11),
    ('SANITATION', 'Sanitation Cess',   'CESS', 12),
    ('DRAIN', 'Drain Cess',             'CESS', 13),
    ('WATER_BILL', 'Water Bill',        'USER', 14),
    ('BIG_BUILD', 'Big Building',       'TAX',  15),
    ('ILLEGAL', 'Illegal Construction Penalty','PENALTY',16),
    ('USER', 'User Charges',            'USER', 17),
    ('SERVICE', 'Service Tax',          'TAX',  18),
    ('OLD PENALTY', 'Old Penalty of ULB', 'PENALTY',  19),
    ('PENALTY', 'Run Time Penalty', 'PENALTY',  20)
   
) v(TaxCode, TaxName, CategoryCode, DisplayOrder)
JOIN PTIS.TaxCategoryMaster c ON c.CategoryCode = v.CategoryCode
WHERE NOT EXISTS (
    SELECT 1 FROM PTIS.TaxMaster t WHERE t.TaxCode = v.TaxCode
);
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


---- policy code master - seed data----

INSERT INTO PTIS.PolicyCodeMaster (PolicyCode, PolicyName, Description, PolicyType, CreatedBy)
SELECT v.PolicyCode, v.PolicyName, v.Description, v.PolicyType, 1
FROM (VALUES
    (N'NETTAX', N'Net Tax', N'Annual tax assessment', N'NORMAL'),
    (N'HEARING', N'Hearing', N'Hearing case', N'DECISION'),
    (N'APPEAL_COMMITTEE', N'Appeal Committee', N'Appeal/committee decision', N'DECISION'),
    (N'REMISSION', N'Remission', N'Remission granted', N'DECISION')
) v(PolicyCode, PolicyName, Description, PolicyType)
WHERE NOT EXISTS (
    SELECT 1 FROM PTIS.PolicyCodeMaster pcm WHERE pcm.PolicyCode = v.PolicyCode
);


---- policy tax details - seed data----


;WITH PropertyList AS
(
    SELECT top 100 Id
    FROM PTIS.PropertyMast
    --WHERE Id IN (101,102,103)
      --AND IsActive = 1
       ORDER BY Id
),
PolicyList AS
(
    SELECT pcm.Id AS PolicyCodeId, pcm.PolicyCode, pcm.Description AS PolicyReason
    FROM PTIS.PolicyCodeMaster pcm
    WHERE pcm.PolicyCode IN (N'NETTAX', N'HEARING', N'APPEAL_COMMITTEE', N'REMISSION')
),
TaxList AS
(
    SELECT Id AS TaxId
    FROM PTIS.TaxMaster
    WHERE IsActive = 1
)
INSERT INTO PTIS.PolicyTaxDetails
(
    PropertyId,
    PolicyCodeId,
    PolicyYear,
    PolicyReason,
    CalculationValue,
    TaxId,
    TaxAmount,
    CreatedBy
)
SELECT
    PR.Id AS PropertyId,
    PL.PolicyCodeId,
    2026,
    PL.PolicyReason,
    CAST(500000 + (PR.Id * 25) + (TL.TaxId * 100) AS MONEY),
    TL.TaxId,
    CAST(1000 + ((PR.Id * TL.TaxId) % 25000) AS MONEY),
    1
FROM PropertyList PR
CROSS JOIN PolicyList PL
CROSS JOIN TaxList TL
WHERE NOT EXISTS
(
    SELECT 1
    FROM PTIS.PolicyTaxDetails D
    WHERE D.PropertyId = PR.Id
      AND D.PolicyYear = 2026
      AND D.PolicyCodeId = PL.PolicyCodeId
      AND D.TaxId = TL.TaxId
      AND D.IsActive = 1
      AND D.MarkedForDeletion = 0
);


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
SET IDENTITY_INSERT [PTIS].[RuleEffectTypeMaster] OFF
GO

SET IDENTITY_INSERT [PTIS].[RuleOperatorMaster] ON 
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'=')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'=', N'Equal To', 1, 1, CAST(N'2026-05-07T12:40:19.087' AS DateTime), 0, CAST(N'2026-05-07T12:40:54.183' AS DateTime))
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'!=')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'!=', N'Not Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'>')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'>', N'Greater Than', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'<')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'<', N'Less Than', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'>=')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'>=', N'Greater Than Or Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'<=')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'<=', N'Less Than Or Equal To', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'In')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'In', N'Value exists in list', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Not In')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Not In', N'Value does not exist in list', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Contains Any')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Contains Any', N'Contains any matching value', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Contains All')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'Contains All', N'Contains all matching values', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleOperatorMaster] WHERE [Operator] = N'Between')
    INSERT [PTIS].[RuleOperatorMaster] ([Id], [Operator], [OperatorDescription], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'Between', N'Value Between Range', 1, 1, CAST(N'2026-05-18T14:32:23.880' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [PTIS].[RuleOperatorMaster] OFF
GO

SET IDENTITY_INSERT [PTIS].[EffectTypeConfiguration] ON 
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 1)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping]) VALUES (1, 1, N'String', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:36:11.117' AS DateTime), NULL, NULL, NULL, N'PropertyRuleEvaluationMaster', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{parameterCode} - {parameterName}","additionalFields":{"parameterCode":"parameterCode"}}')
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[EffectTypeConfiguration] WHERE [EffectTypeId] = 2)
    INSERT [PTIS].[EffectTypeConfiguration] ([Id], [EffectTypeId], [DataType], [InputType], [HasApiSource], [ApiEndpoint], [ApiMethod], [ApiParameters], [HasStaticValues], [StaticValuesJson], [IsRequired], [DefaultValue], [ValidationRegex], [MinValue], [MaxValue], [MinLength], [MaxLength], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [ExpressionTemplate], [StaticApiEndpoint], [StaticApiInputType], [StaticApiMethod], [StaticApiParamter], [StaticApiResponseMapping]) VALUES (2, 2, N'String', N'TextBox', 0, N'', N'', N'', 0, N'', 1, N'', N'', CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), 0, 0, 1, 1, CAST(N'2026-05-27T16:36:11.117' AS DateTime), NULL, NULL, NULL, N'PropertyRuleEvaluationMaster', N'dropdown', N'GET', N'{"PageSize":"-1"}', N'{"responsePath":"data","valuePath":"id","labelPath":"parameterName","displayTemplate":"{parameterCode} - {parameterName}","additionalFields":{"parameterCode":"parameterCode"}}')
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
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1035, 1, 1, 1, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 2)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1036, 1, 2, 2, 1, 1, CAST(N'2026-05-18T11:30:10.320' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1037, 1, 3, 3, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 4)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1038, 1, 4, 4, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 5)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1039, 1, 5, 5, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 6)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1040, 1, 6, 6, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 7)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1041, 1, 7, 7, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 8)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1042, 1, 8, 8, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 9)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1043, 1, 9, 9, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 10)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1044, 1, 10, 10, 1, 1, CAST(N'2026-05-27T15:13:01.553' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 11)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1045, 1, 11, 11, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 13)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1047, 1, 13, 13, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 14)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1048, 1, 14, 14, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 15)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1049, 1, 15, 15, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 16)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1050, 1, 16, 16, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 17)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1051, 1, 17, 17, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 18)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1052, 1, 18, 18, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 19)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1053, 1, 19, 19, 1, 1, CAST(N'2026-05-15T11:19:01.650' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 1011)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1054, 1, 1011, 1011, 1, 1, CAST(N'2026-06-09T12:42:27.143' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 1013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2035, 1, 1013, 1013, 1, 1, CAST(N'2026-06-17T15:24:15.270' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 2013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3035, 1, 2013, 2013, 1, 1, CAST(N'2026-06-19T18:41:24.770' AS DateTime), NULL, NULL)
GO
IF NOT EXISTS (SELECT 1 FROM [PTIS].[RuleScopeFieldMapping] WHERE [RuleScopeId] = 1 AND [RulesFieldId] = 3013)
    INSERT [PTIS].[RuleScopeFieldMapping] ([Id], [RuleScopeId], [RulesFieldId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4037, 1, 3013, 3013, 1, 1, CAST(N'2026-07-06T12:33:19.597' AS DateTime), NULL, NULL)
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

        ------------------------------------------------------------
        -- Insert policy codes
        ------------------------------------------------------------
        INSERT INTO [PTIS].[PolicyCodeMaster]
        (
            [PolicyCode],
            [PolicyName],
            [Description],
            [PolicyType],
            [NextPolicyCodeId],
            [IsFinalStage],
            [IsExclusive],
            [RequiresStageTracking],
            [DisplayOrder],
            [IsActive],
            [CreatedBy]
        )
        VALUES
        ------------------------------------------------------------
        -- Normal policies
        ------------------------------------------------------------
        (
            'NETTAX',
            N'Net Tax',
            N'Normal final calculated property tax',
            'NORMAL',
            NULL,
            1,
            0,
            0,
            1,
            1,
            1
        ),
        (
            'AS_PER_OLD',
            N'As Per Old',
            N'Old ULB tax is considered as the final applicable tax',
            'NORMAL',
            NULL,
            1,
            1,
            0,
            2,
            1,
            1
        ),
        (
            'MIN_RV',
            N'Minimum RV',
            N'Minimum rateable value policy is applied',
            'NORMAL',
            NULL,
            1,
            1,
            0,
            3,
            1,
            1
        ),
        (
            'RETENTION',
            N'Retention',
            N'Previous tax or rateable value is retained',
            'NORMAL',
            NULL,
            1,
            1,
            0,
            4,
            1,
            1
        ),

        ------------------------------------------------------------
        -- Occupancy Certificate policies
        ------------------------------------------------------------
        (
            'OC_PARTIAL',
            N'Partial Occupancy Certificate',
            N'Prorated OC tax for the remaining days of the current financial year',
            'DATE_BASED',
            NULL,
            0,
            1,
            1,
            5,
            1,
            1
        ),
        (
            'OC',
            N'Occupancy Certificate',
            N'Full-year tax based on the occupancy certificate',
            'DATE_BASED',
            NULL,
            1,
            1,
            0,
            6,
            1,
            1
        ),

        ------------------------------------------------------------
        -- Completion Certificate policies
        ------------------------------------------------------------
        (
            'CC_PARTIAL',
            N'Partial Completion Certificate',
            N'Prorated CC tax for the remaining days of the current financial year',
            'DATE_BASED',
            NULL,
            0,
            1,
            1,
            7,
            1,
            1
        ),
        (
            'CC',
            N'Completion Certificate',
            N'Full-year tax based on the completion certificate',
            'DATE_BASED',
            NULL,
            1,
            1,
            0,
            8,
            1,
            1
        ),

        ------------------------------------------------------------
        -- Electricity Bill policies
        ------------------------------------------------------------
        (
            'ELECTRIC_PARTIAL',
            N'Partial Electricity Bill',
            N'Prorated electricity-bill tax for the remaining days of the current financial year',
            'DATE_BASED',
            NULL,
            0,
            1,
            1,
            9,
            1,
            1
        ),
        (
            'ELECTRIC_BILL',
            N'Electricity Bill',
            N'Full-year tax based on the electricity bill date',
            'DATE_BASED',
            NULL,
            1,
            1,
            0,
            10,
            1,
            1
        ),

        ------------------------------------------------------------
        -- Section 129 policies
        ------------------------------------------------------------
        (
            'SECTION_129_OLD_1',
            N'Section 129 - Old Tax Year 1',
            N'First financial year tax is equal to old ULB tax',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            11,
            1,
            1
        ),
        (
            'SECTION_129_OLD_2',
            N'Section 129 - Old Tax Year 2',
            N'Second financial year tax is equal to old ULB tax',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            12,
            1,
            1
        ),
        (
            'SECTION_129_20',
            N'Section 129 - 20 Percent',
            N'Section 129 twenty-percent stage',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            13,
            1,
            1
        ),
        (
            'SECTION_129_40',
            N'Section 129 - 40 Percent',
            N'Section 129 forty-percent stage',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            14,
            1,
            1
        ),
        (
            'SECTION_129_60',
            N'Section 129 - 60 Percent',
            N'Section 129 sixty-percent stage',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            15,
            1,
            1
        ),
        (
            'SECTION_129_80',
            N'Section 129 - 80 Percent',
            N'Section 129 eighty-percent stage',
            'STAGE_BASED',
            NULL,
            0,
            1,
            1,
            16,
            1,
            1
        ),
        (
            'SECTION_129_100',
            N'Section 129 - 100 Percent',
            N'Final Section 129 stage with full new assessment tax',
            'STAGE_BASED',
            NULL,
            1,
            1,
            1,
            17,
            1,
            1
        ),

        ------------------------------------------------------------
        -- Decision policies
        ------------------------------------------------------------
        (
            'HEARING',
            N'Hearing',
            N'Final tax decided during hearing',
            'DECISION',
            NULL,
            1,
            1,
            0,
            18,
            1,
            1
        ),
        (
            'APPEAL_COMMITTEE',
            N'Appeal Committee',
            N'Final tax decided by the appeal committee',
            'DECISION',
            NULL,
            1,
            1,
            0,
            19,
            1,
            1
        ),
        (
            'REMISSION',
            N'Remission',
            N'Final tax decided after remission',
            'DECISION',
            NULL,
            1,
            1,
            0,
            20,
            1,
            1
        );

        ------------------------------------------------------------
        -- Configure OC_PARTIAL -> OC
        ------------------------------------------------------------
        UPDATE currentPolicy
        SET
            currentPolicy.[NextPolicyCodeId] = nextPolicy.[Id],
            currentPolicy.[UpdatedBy] = 1,
            currentPolicy.[UpdatedDate] = GETDATE()
        FROM [PTIS].[PolicyCodeMaster] AS currentPolicy
        INNER JOIN [PTIS].[PolicyCodeMaster] AS nextPolicy
            ON nextPolicy.[PolicyCode] = 'OC'
        WHERE currentPolicy.[PolicyCode] = 'OC_PARTIAL';

        ------------------------------------------------------------
        -- Configure CC_PARTIAL -> CC
        ------------------------------------------------------------
        UPDATE currentPolicy
        SET
            currentPolicy.[NextPolicyCodeId] = nextPolicy.[Id],
            currentPolicy.[UpdatedBy] = 1,
            currentPolicy.[UpdatedDate] = GETDATE()
        FROM [PTIS].[PolicyCodeMaster] AS currentPolicy
        INNER JOIN [PTIS].[PolicyCodeMaster] AS nextPolicy
            ON nextPolicy.[PolicyCode] = 'CC'
        WHERE currentPolicy.[PolicyCode] = 'CC_PARTIAL';

        ------------------------------------------------------------
        -- Configure ELECTRIC_PARTIAL -> ELECTRIC_BILL
        ------------------------------------------------------------
        UPDATE currentPolicy
        SET
            currentPolicy.[NextPolicyCodeId] = nextPolicy.[Id],
            currentPolicy.[UpdatedBy] = 1,
            currentPolicy.[UpdatedDate] = GETDATE()
        FROM [PTIS].[PolicyCodeMaster] AS currentPolicy
        INNER JOIN [PTIS].[PolicyCodeMaster] AS nextPolicy
            ON nextPolicy.[PolicyCode] = 'ELECTRIC_BILL'
        WHERE currentPolicy.[PolicyCode] = 'ELECTRIC_PARTIAL';

        ------------------------------------------------------------
        -- Configure Section 129 workflow
        ------------------------------------------------------------
        ;WITH [PolicyFlow] AS
        (
            SELECT
                CAST('SECTION_129_OLD_1' AS VARCHAR(30))
                    AS [CurrentPolicyCode],
                CAST('SECTION_129_OLD_2' AS VARCHAR(30))
                    AS [NextPolicyCode]

            UNION ALL

            SELECT
                'SECTION_129_OLD_2',
                'SECTION_129_20'

            UNION ALL

            SELECT
                'SECTION_129_20',
                'SECTION_129_40'

            UNION ALL

            SELECT
                'SECTION_129_40',
                'SECTION_129_60'

            UNION ALL

            SELECT
                'SECTION_129_60',
                'SECTION_129_80'

            UNION ALL

            SELECT
                'SECTION_129_80',
                'SECTION_129_100'
        )
        UPDATE currentPolicy
        SET
            currentPolicy.[NextPolicyCodeId] = nextPolicy.[Id],
            currentPolicy.[UpdatedBy] = 1,
            currentPolicy.[UpdatedDate] = GETDATE()
        FROM [PTIS].[PolicyCodeMaster] AS currentPolicy
        INNER JOIN [PolicyFlow] AS policyFlow
            ON policyFlow.[CurrentPolicyCode]
               = currentPolicy.[PolicyCode]
        INNER JOIN [PTIS].[PolicyCodeMaster] AS nextPolicy
            ON nextPolicy.[PolicyCode]
               = policyFlow.[NextPolicyCode];

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

INSERT INTO PTIS.PropertyCertificateTypeMaster
(
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
    v.CertificateTypeCode,
    v.CertificateTypeName,
    v.Description,
    v.DisplayOrder,
    v.IsTaxable,
    v.IsProtected,
    v.IsRequired,
    1
FROM (VALUES
    ('CC',                      N'Completion Certificate',   N'Completion Certificate used for CC based occupation tax calculation.',                      1,  1, 1, 1),
    ('OC',                      N'Occupancy Certificate',    N'Occupancy Certificate used for OC based occupation tax calculation.',                       2,  1, 1, 1),
    ('EleBillDt',               N'Electric Bill Date',       N'Electric Bill Date used as fallback certificate date for occupation tax calculation.',       3,  1, 1, 0),
    ('POSSESSION_CERTIFICATE',  N'Possession Certificate',   N'Possession Certificate for document record purpose. Tax calculation disabled by default.',   4,  0, 0, 0),
    ('INDEX_2',                 N'Index 2',                  N'Index 2 document for property record purpose. Tax calculation disabled by default.',         5,  0, 0, 0),
    ('AGREEMENT',               N'Agreement',                N'Agreement document for property record purpose. Tax calculation disabled by default.',        6,  0, 0, 0),
    ('SALE_DEED',               N'Sale Deed',                N'Sale Deed document for property record purpose. Tax calculation disabled by default.',        7,  0, 0, 0),
    ('TAX_RECEIPT',             N'Tax Receipt',              N'Tax Receipt document for property record purpose. Tax calculation disabled by default.',      8,  0, 0, 0),
    ('OTHER',                   N'Other',                    N'Other certificate or supporting document.',                                                 99, 0, 0, 0)
) v
(
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
GO
/* ============================================================================
   4. Seed PTIS.PropertyCertificates
   No default seed data required.

   Reason:
   This is a transaction table.
   Records must be inserted from Building Permission / Certificate Upload API
   against real PropertyId, PropertyDetailsId and DocumentBindingId.
============================================================================ */
