
-- PTIS.ZoneMaster
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

---insert wardmaster




INSERT PTIS.WardMaster ([ZoneNo], [WardNo], [CreatedDate]) VALUES
  ( N'DI', N'DI1',GETDATE());
-- PTIS.WardMaster


INSERT PTIS.WardMaster ([ZoneNo], [WardNo]) VALUES
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
  (N'WE', N'WE1');






INSERT INTO [PTIS].[TypeOfUseGroupMaster]
([TypeOfUseGroupID], [GroupName], [GroupIcon], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES
('R',  N'निवासी',   'home', NULL, NULL, NULL),
('C',  N'व्यावसायिक', 'home', NULL, NULL, NULL),
('I',  N'औद्योगिक',  'home', NULL, NULL, NULL),
('N',  N'इतर',       'home', NULL, NULL, NULL),
('OP', N'प्लॉट',    'home', NULL, NULL, NULL);



INSERT [PTIS].[TypeOfUseMaster]
([TypeOfUseID], [Description], [Type], [TypeOfUseGroupId],
 [CreatedBy], [UpdatedBy], [UpdatedDate], [SearchKey], [SearchSequence], [IsSociety])
VALUES

(N'C', N'अनिवासी', N'C', N'C', 1, NULL, NULL, N'C', 1, 0),
(N'T', N'धार्मिक स्थळ', N'N', N'N', 1, NULL, NULL, N'T', 1, 1),
(N'V', N'V-व्हरांडा टॉयल॓ट बाथ', N'N', N'N', 1, NULL, NULL, N'V', 1, 0),
(N'R', N'निवासी', N'R', N'R', 1, NULL, NULL, N'R', 1, 1),
(N'UC', N'बांधकाम चालू ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0),
(N'SPK', N'स्टील पार्किंग ', N'R', N'R', 1, NULL, NULL, N'S', 5, 1),
(N'N', N'मनपा मालमत्ता', N'N', N'N', 1, NULL, NULL, N'N', 1, 1),
(N'EG', N'शैक्षणिक शासकीय ', N'C', N'C', 1, NULL, NULL, N'E', 3, 0),
(N'GO', N'गोडाऊन', N'C', N'C', 1, NULL, NULL, N'G', 3, 0),
(N'GR', N'शासकीय निवासी', N'R', N'R', 1, NULL, NULL, N'G', 4, 0),
(N'HO', N'खाजगी वसतिगृह', N'R', N'R', 1, NULL, NULL, N'H', 4, 0),
(N'LB', N'वाचनालय/लायब्ररी ', N'C', N'C', 1, NULL, NULL, N'L', 2, 1),
(N'UCC', N'बांधकाम चालु-अनिवासी ', N'N', N'N', 1, NULL, NULL, N'U', 1, 0),
(N'MTR', N'टॉवर जागा', N'C', N'C', 1, NULL, NULL, N'W', 9, 0),
(N'FF', N'स्वातंत्र्य सैनिक', N'R', N'R', 1, NULL, NULL, N'F', 1, 0),
(N'WGC', N'WGC-व्हरांडा  शासकीय अनिवासी', N'C', N'C', 1, NULL, NULL, N'G', 2, 0),
(N'WEG', N'WEG-व्हरांडा शैक्षणीक शासकीय', N'C', N'C', 1, NULL, NULL, N'E', 4, 0),
(N'WEP', N'WEP-व्हरांडा खाजगी शैक्षणीक ', N'C', N'C', 1, NULL, NULL, N'E', 2, 0),
(N'WGR', N'WGR-व्हरांडा शासकीय निवासी', N'R', N'R', 1, NULL, NULL, N'G', 4, 0),
(N'PC', N'पार्किंग अनिवासी', N'N', N'N', 1, NULL, NULL, N'P', NULL, 0),
(N'S', N'दुकान', N'C', N'C', 1, NULL, NULL, N'S', 1, 0),
(N'D', N'दवाखाना', N'C', N'C', 1, NULL, NULL, N'D', 1, 0),
(N'B', N'बँक', N'C', N'C', 1, NULL, NULL, N'B', 1, 0),
(N'SW', N'जलतरण तलाव', N'C', N'C', 1, NULL, NULL, N'S', 4, 0),
(N'I', N'कारखाना', N'I', N'I', 1, NULL, NULL, N'I', 1, 0),
(N'EP', N'खाजगी शैक्षणिक', N'C', N'C', NULL, NULL, NULL, N'E', 1, 0),
(N'WR', N'WR-व्हरांडा निवासी', N'R', N'R', NULL, NULL, NULL, N'R', 2, 0),
(N'WC', N'WC-व्हरांडा अनिवासी', N'C', N'C', NULL, NULL, NULL, N'S', 2, 0),
(N'CC', N'कोचिंग क्लासेस', N'C', N'C', NULL, NULL, NULL, N'C', 2, 0),
(N'CG', N'केंद्र शासकीय मालमत्ता', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'CR', N'केंद्र शासकीय मालमत्ता निवासी', N'R', N'R', NULL, NULL, NULL, N'', NULL, 0),
(N'OPR', N'खुला भूखंड निवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'OPC', N'खुला भूखंड अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'PTR', N'पेट्रोल पंप', N'C', N'C', NULL, NULL, NULL, N'P', 1, 0),
(N'GC', N'शासकीय अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'O', N'ऑफिस', N'C', N'C', NULL, NULL, NULL, N'O', 1, 0),
(N'M', N'मंगल कार्यालय', N'C', N'C', NULL, NULL, NULL, N'M', 1, 0),
(N'KT', N'मल्टीप्लेक्स', N'C', N'C', NULL, NULL, NULL, N'T', 2, 0),
(N'H', N'हॉटेल', N'C', N'C', NULL, NULL, NULL, N'H', 1, 0),
(N'OPK', N'ओपन पार्किंग', N'R', N'R', NULL, NULL, NULL, NULL, NULL, 1),
(N'WI', N'WI-व्हरांडा औद्योगिक', N'I', N'I', 1, NULL, NULL, N'I', 2, 0),
(N'OP', N'खुला भूखंड', N'R', N'R', 1, 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 0),
(N'WCGR', N'WCGR-केंद्र शासकीय मालमत्ता', N'R', N'R', NULL, NULL, NULL, N'', NULL, 0),
(N'WCGC', N'WCGC-केंद्र शासकीय मालमत्ता', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'CH', N'सामाजिक सभागृह', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'L', N'लॉज', N'C', N'C', NULL, NULL, NULL, N'', NULL, 0),
(N'AG', N'शेती', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'ACH', N'क्लब हाऊस ', N'C', N'C', NULL, NULL, NULL, N'', NULL, 1),
(N'AGM', N'सोसायटी जिम', N'C', N'C', NULL, NULL, NULL, N'', NULL, 1),
(N'AH', N'कॉमन हॉल', N'C', N'C', NULL, NULL, NULL, N'', NULL, 1),
(N'AMH', N'मल्टीपर्पज हॉल', N'C', N'C', NULL, NULL, NULL, N'', NULL, 1),
(N'AO', N'सोसायटी ऑफीस ', N'C', N'C', NULL, NULL, NULL, N'', NULL, 1),
(N'APG', N'खेळाचे मैदान', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'ASW', N'सोसायटी स्विमिंग पूल', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'AWC', N'वॉचमन कॅबिन', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'CCO', N'C-कॉरिडॉर', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'CCR', N'CCR-ट्युशन क्लासेस ', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'CGC', N'केंद्र शासन वाणिज्य मालमत्ता', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ENCC', N'ENCC', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ENCEG', N'ENCEG', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ENCEP', N'ENCEP', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ENCI', N'ENCI', N'I', N'I', NULL, NULL, NULL, N'', NULL, NULL),
(N'ENCR', N'ENCR', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'GM', N'व्यायाम शाळा ', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'GMR', N'GMR-व्यायाम शाळा', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'KTR', N'KTR-टॉकीज/चित्रपट गृह', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'NPD', N'न.प.दुकान गाळे', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'OBR', N'OBR', N'N', N'N', NULL, NULL, NULL, N'', NULL, NULL),
(N'OPKC', N'ओपन पार्किंग अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'RCO', N'R-कॉरिडॉर', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'RGN', N'जनरेटर रूम/मिटर रूम', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'SPKC', N'स्टील पार्किंग अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'WT', N'R-टॉवर', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'PG', N'पेयिंग गेस्ट', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'GA', N'गार्डन', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'RFG', N'रिफ्युज एरिया', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'PH', N'पंप हाऊस रूम', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'SR', N' स्टोअर रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'WAT', N' वॉटर टॅंक', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'ISR', N'इनडोअर स्पोर्ट रूम ', N'N', N'N', NULL, NULL, NULL, N'', NULL, 1),
(N'EHO', N'शैक्षणिक संस्था-वसतिगृह', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'PF', N'पोल्ट्रीफार्म', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'NR', N'सर्व्हेक्षण निवासी', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'NC', N'सर्व्हेक्षण अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'NI', N'सर्व्हेक्षण औद्योगिक', N'I', N'I', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICR', N'अनधिकृत बांधकाम निवासी', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICC', N'अनधिकृत बांधकाम अनिवासी ', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICI', N'अनधिकृत बांधकाम औद्योगिक', N'I', N'I', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICRT', N'निवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICCT', N'अनिवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICIT', N'औद्योगिक शास्तीस पात्र अनधिकृत बांधकाम ', N'I', N'I', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICHT', N'हॉटेल शास्तीस पात्र अनधिकृत बांधकाम', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICH', N'हॉटेल अनधिकृत बांधकाम', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICP', N'अनधिकृत बांधकाम निवासी पार्किंग', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ICPRT', N'निवासी पार्किंग शास्तीस पात्र अनधिकृत बांधकाम', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'OAH', N'वृद्धाश्रम', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ABLC', N'टेरेस-बाल्कनी अनिवासी', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ABLOP', N'ओपन टेरेस', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ABLR', N'टेरेस-बाल्कनी ', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'ACHC', N'क्लब हाऊस C', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'ASWC', N'सोसायटी स्विमिंग पूल C', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'AWA', N'वेटिंग एरिया', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'FCR', N'फायर कंट्रोल रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL);



INSERT INTO [PTIS].[TypeOfUseMaster]
([TypeOfUseID], [Description], [Type], [TypeOfUseGroupId],
 [CreatedBy], [UpdatedBy], [UpdatedDate], [SearchKey], [SearchSequence], [IsSociety])
VALUES
(N'FIRR', N'फायर रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'GRR',  N'गारबेज रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'IT',   N'माहिती व तंत्रज्ञान उद्योग', N'I', N'I', NULL, NULL, NULL, N'', NULL, NULL),
(N'LR',   N'लिफ्ट रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'MR',   N'Mail रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, 1),
(N'OL',   N'ओपनिंग लॉबी', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'OWC',  N'सेंद्रिय कचरा कन्व्हर्टर रूम', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'SI',   N'सामाजिक संस्था', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'TL',   N'टेरेस लिफ्ट', N'R', N'R', NULL, NULL, NULL, N'', NULL, NULL),
(N'OPKI', N'ओपन पार्किंग औदयोगिक', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL),
(N'SPKI', N'स्टील पार्किंग औदयोगिक', N'C', N'C', NULL, NULL, NULL, N'', NULL, NULL);


INSERT INTO [PTIS].[ConstructionTypeMaster]
([ConstructionId], [Description], [SearchKey], [SearchSequence], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES
('A',   N'सिमेंट कॉक्रिट संरचना', N'7', 0, 0, 56, NULL),
('B',   N'सिमेंट/चुना/दगड/विटांची भिंत व स्लॅब', NULL, NULL, NULL, 56, '2022-06-17T12:43:04'),
('C',   N'सिमेंट/चुना/दगड/विटांची भिंत व टिनाचे छत', NULL, NULL, NULL, 56, '2022-06-17T12:43:20'),
('D',   N'कुडाचे लाकडी फाट्याचे कच्चेघर', NULL, NULL, NULL, 56, '2022-06-17T12:43:31'),
('E',   N'कुडाचे', NULL, NULL, NULL, 56, '2022-06-17T12:43:41'),
('AR',  N'A-R RCC Structure', NULL, NULL, NULL, 56, '2022-03-17T18:55:50'),
('BR',  N'BR Load Bearing', NULL, NULL, NULL, 56, '2022-06-17T12:44:32'),
('CR',  N'CR Tin & Cement', NULL, NULL, NULL, 56, '2022-06-17T12:44:46'),
('DR',  N'DR Kavelu', NULL, NULL, NULL, 56, '2022-06-17T12:44:53'),
('ER',  N'ER Kudache', NULL, NULL, NULL, 56, '2022-06-17T12:45:04'),
('op',  N'open plot', NULL, NULL, NULL, NULL, NULL),
('OPR', N'Rented Plot', NULL, NULL, NULL, NULL, NULL),
('WA',  N'सिमेंट कॉक्रिट संरचना-व्हरांडा', NULL, NULL, NULL, 56, '2022-04-09T18:04:48'),
('WB',  N'व्हरांडा-सिमेंट/चुना/दगड/विटांची भिंत व स्लॅब', NULL, NULL, NULL, 56, '2022-06-17T12:45:28'),
('WC',  N'व्हरांडा-सिमेंट/चुना/दगड/विटांची भिंत व टिनाचे छत', NULL, NULL, NULL, 56, '2022-06-17T12:45:39'),
('WD',  N'व्हरांडा-कुडाचे लाकडी फाट्याचे कच्चेघर', NULL, NULL, NULL, 56, '2022-06-17T12:45:51'),
('WE',  N'व्हरांडा-कुडाचे', NULL, NULL, NULL, 56, '2022-06-17T12:46:01'),
('A1',  N'आरामदायी आरसीसी इमारत ', N'', NULL, 56, 56, '2022-04-09T17:52:40'),
('B1',  N'उच्च दर्जाचे एल.बी.एस. इमारत', N'', NULL, 56, 56, '2022-06-17T12:46:25'),
('C1',  N'उच्च दर्जाचे विटा सीमेंट च्या भिंती व टिन कवेलूचे छत असलेले इमारत ', N'', NULL, 56, 56, '2022-06-17T12:46:37'),
('WA1', N'आरामदायी RCC-व्हरांडा', N'', NULL, 56, NULL, NULL),
('WB1', N'उच्च दर्जाचे LBS व्हरांडा ', N'', NULL, 56, 56, '2022-06-17T12:46:51'),
('WC1', N'उच्च दर्जाचे विटा सीमेंट च्या भिंती व टिन कवेलूचे छत व्हरांडा', N'', NULL, 56, 56, '2022-06-17T12:46:59'),
('STEEL', N'Steel Structure', N'S', 2, NULL, NULL, NULL),
('BRICK', N'Brick Masonry', N'B', 3, NULL, NULL, NULL),
('WOOD',  N'Wooden Structure', N'W', 4, NULL, NULL, NULL);


SET IDENTITY_INSERT [PTIS].[CategoryMaster] ON;
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (1,'Apartment',N'Apartment_10');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (2,'Apartment',N'Apartment_10P');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (3,'Apartment',N'Apartment_C1');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (4,'Apartment',N'Apartment_C2');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (5,'Apartment',N'Apartment');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (6,'Apartment',N'Apartment_10C1');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (7,'Apartment',N'Apartment_10C2');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (8,'Apartment',N'Apartment_10PC1');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (9,'Apartment',N'Apartment_10PC2');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (10,'Apartment',N'Apartment_20C1');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (11,'Apartment',N'Apartment_20C2');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (12,'Individual','Individual');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName],[SubCategoryName]) VALUES (13,'Individual','Individual With Lift');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (14,'Individual Partition');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (15,'Industry');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (16,'IndustryL');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (17,'Plot');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (18,'Government Property');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (19,'Multi Commercial Apartment');
INSERT INTO [PTIS].[CategoryMaster] ([CategoryID], [CategoryName]) VALUES (20,'Individual Chal');
SET IDENTITY_INSERT [PTIS].[CategoryMaster] OFF;
-- [PTIS].[SubCategory]


SET IDENTITY_INSERT [PTIS].[SubZoneDetailsForCV] ON;
-- [PTIS].[SubZoneDetailsForCV]

INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('1', 'Z1', '98/440 ', N' भूभाग :- उत्तरेस हार्बर रेल्वे लाईन, पूर्वेस पूर्व द्रुतगती महामार्ग व पश्चिमेस वॉर्ड हद्द यामधील मिळकती', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('2', 'Z1', '98/440A ', N' भुभाग: हार्बर रेल्वे लाईनच्या उत्तरेकडील टिळकनगर मध्ये दर्शविलेल्या मिळकती.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('3', 'Z1', '98/441 ', N'भुभाग: द्रुतगती मार्ग, महात्मा गांधी मार्ग व वॉर्ड हद्द यांनी वेढलेला भाग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('4', 'Z1', '98/442', N'भुभाग: द्रुतगती मार्ग, रामकृष्ण चेंबूरकर मार्ग व व्ही एन. पूरब मार्ग यांनी वेढलेला भूभाग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('5', 'Z1', '98/442A', N'भुभाग - उत्तरेस पुर्व दुतगती महामार्ग, दक्षिणेस मुल्यदर विभाग क्र. 98/443 चा भाग, व पुर्वेस मुल्यदर विभाग क्र. 98/442 चा भाग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('6', 'Z1', '98/443', N'भुभाग: उत्तरेस व्ही. एन. पूरब मार्ग, पूर्वेस रामकृष्ण चेंबूरकर मार्ग व दक्षिणेस गाव हद्द, पश्चिमेस गुडस् रेल्वे लाईन', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('7', 'Z1', '98/444 ', N' भुभाग: उत्तरेस व पूर्वेस गाव हद्द, पश्चिमेस पूर्व द्रुतगती महामार्ग व दक्षिणेस नकाशा मध्ये दर्शविल्यानुसार गाव हद्द', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('8', 'Z1', '98/444A ', N' भूभाग - दक्षिणेस हार्बर रेल्वे लाईन व उत्तरेस नकाशात दर्शविलेल्याप्रमाणे हद्द यामधील मिळकती.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('9', 'Z1', '98/445', N'भुभाग: उत्तरेस रेल्वे, पुर्वेस गाव हद्द, दक्षिणेस व्ही. एन. पुरव मार्ग व पश्चिमेस रामकृष्ण चेंबूरकर मार्ग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('10', 'Z1', '98/445A ', N' भुभाग सुभाष नगर म्हाडा संकुला मधील समाविष्ट मिळकती.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('11', 'Z1', '98/446 ', N'भुभाग: व्ही.एन.पुरव मार्गाच्या दक्षिणेकडील भाग, गाव सीमा व रामकृष्ण चेंबूरकर मार्ग यांनी वेढलेला भाग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('12', 'Z1', '98/447 ', N'भुभाग: वॉर्ड हद्द, मालवाहतूक रेल्व मार्ग व गाव सीमा यांनी वेढलेला भाग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('13', 'Z1', '98/448', N'रस्ता: व्ही.एन.पुरव मार्ग- सुमननगर ते शिवाजी महाराज चौक.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('14', 'Z1', '98/449 ', N'रस्ता: आचार्य उद्यान (डायमंड गार्डन) सर्कल ते चेंबूर रेल्वे स्टेशन जोडणारा सेंट्रल अँव्हेन्यू रोड (स्टेशन रोड)', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('15', 'Z1', '98/450', N'रस्ता: चेंबूर रेल्वे स्टेशन ते बोरला गाव जोडणारा एन. जी. आचार्य मार्ग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('16', 'Z1', '98/451', N'रस्ता: चोईतराम गिडवानी मार्ग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('17', 'Z1', '98/452', N'रस्ता : रामकृष्ण चेंबूरकर मार्ग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('18', 'Z1', '98/453 ', N'भुभाग: उत्तरेस गावाची हद्द, पूर्वेस वॉर्ड सीमा, दक्षिणस स.गो.बर्वे मार्ग, पश्चिमेस गाव हद्द.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('19', 'Z1', '98/454 ', N'भुभाग: उत्तरेस, स.गो.बर्वे मार्ग, दक्षिणेस व पश्चिमेस गाव सीमा, पूर्वे वॉर्ड हद्द.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('20', 'Z1', '98/455', N'रस्ता : स.गो.बर्वे मार्ग.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('21', 'Z1', '98/456 ', N'भुभाग: चेंबूर गावातील "एन" वॉर्डातील मिळकती.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('22', 'Z1', '98/445/1 ', N' भुभाग: चेंबूर गावठाण क्षेत्रा मधील मिळकती.', NULL, NULL, NULL);
INSERT INTO [PTIS].[SubZoneDetailsForCV] ([SubZoneId], [MoujaName], [SubZoneNo], [SubZoneName], [UpdatedBy], [UpdatedDate], [CreatedBy]) VALUES ('23', 'Z1', '98/446/1 ', N' भुभाग: चेंबूर चरई गावठाण क्षेत्रा मधील मिळकती.', NULL, NULL, NULL);
SET IDENTITY_INSERT [PTIS].[SubZoneDetailsForCV] OFF;
-- [PTIS].[CitySurveyNoMaster]




SET IDENTITY_INSERT [PTIS].[SubTypeOfUseMaster] ON;
INSERT [PTIS].[SubTypeOfUseMaster] ([SubTypeOfUseId], [Description], [TypeOfUseID], [CreatedBy], [UpdatedBy], [UpdatedDate], [SearchKey], [SearchSequence]) VALUES
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
  (1521, N'बँक/वित्तीय व संस्था कार्यालय ', N'S', NULL, NULL, NULL, N'', 0);

INSERT [PTIS].[SubTypeOfUseMaster] ([SubTypeOfUseId], [Description], [TypeOfUseID], [CreatedBy], [UpdatedBy], [UpdatedDate], [SearchKey], [SearchSequence]) VALUES
 (1522, N'बँक/वित्तीय संस्था', N'S', NULL, NULL, NULL, N'', 0),
  (1523, N'फुट वेअर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1524, N'फूटवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1525, N'फूड पॅकिंग अँड हाऊस किपींग', N'S', NULL, NULL, NULL, N'', 0),
  (1526, N'खाजगी अभ्यासिका', N'S', NULL, NULL, NULL, N'', 0),
  (1527, N'खाजगी रुग्णालय', N'S', NULL, NULL, NULL, N'', 0),
  (1528, N'खाजगी शाळा', N'S', NULL, NULL, NULL, N'', 0),
  (1529, N'पिठ गिरणी', N'S', NULL, NULL, NULL, N'', 0),
  (1530, N'पी ओ पी शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1531, N'पीओपि सीलिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1532, N'पीठ गिरण', N'S', NULL, NULL, NULL, N'', 0),
  (1533, N'पीठ गिरणी', N'S', NULL, NULL, NULL, N'', 0),
  (1534, N'पॉईंट सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1535, N'पोर्टेबल केबिन गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1536, N'फर्निशिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1537, N'फेर्निशिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1538, N'फर्निशिंग आणि  मट्ट्रेस्सेस', N'S', NULL, NULL, NULL, N'', 0),
  (1539, N'फर्निशिंग व मॅट्रेस', N'S', NULL, NULL, NULL, N'', 0),
  (1540, N'फर्निशिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1541, N'फ़र्निशिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1542, N'फुर्निशिंग शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1543, N'फरसण मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1544, N'फरसान मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1545, N'फरसान विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1546, N'फरसान शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1547, N'फूल विक्रेता', N'S', NULL, NULL, NULL, N'', 0),
  (1548, N'फ्लोअर मिल ', N'S', NULL, NULL, NULL, N'', 0),
  (1549, N'फळ भाजी दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1550, N'फळ मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (1551, N'फळ व भाजी आणि किराणा स्टोअर ', N'S', NULL, NULL, NULL, N'', 0),
  (1552, N'फळ विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1553, N'फळांचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1554, N'फॅशन डिजाइनिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (1555, N'फॅशन डिजायनर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1556, N'फॅसिलिटी मॅनेजमेंट', N'S', NULL, NULL, NULL, N'', 0),
  (1557, N'फाईनान्स', N'S', NULL, NULL, NULL, N'', 0),
  (1558, N'फाईनान्स ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1559, N'फायनन्स', N'S', NULL, NULL, NULL, N'', 0),
  (1560, N'फायनान्स', N'S', NULL, NULL, NULL, N'', 0),
  (1561, N'फ़ायनान्स', N'S', NULL, NULL, NULL, N'', 0),
  (1562, N'फायनान्स सेर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1563, N'फार्मा ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1564, N'फार्मा होलसेल ', N'S', NULL, NULL, NULL, N'', 0),
  (1565, N'केबल इंटरप्राजेस ', N'S', NULL, NULL, NULL, N'', 0),
  (1566, N'कम्प्युटर क्लासेस ', N'S', NULL, NULL, NULL, N'', 0),
  (1567, N'कम्प्युटर दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1568, N'कम्प्युटर पार्ट्स अँड मोबाइल रिपेर', N'S', NULL, NULL, NULL, N'', 0),
  (1569, N'कम्प्युटर रिपेयरिंग सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1570, N'कम्प्युटर रीपेरिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (1571, N'कम्प्युटर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1572, N'कम्प्युटर सेल्स अँड सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1573, N'केमिकल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1574, N'केमिस्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1575, N'केमिस्ट व टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1576, N'कर्टन बेडशीट सोफा कोच', N'S', NULL, NULL, NULL, N'', 0),
  (1577, N'करटन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1578, N'कर्टन शॉप  ', N'S', NULL, NULL, NULL, N'', 0),
  (1579, N'करटल', N'S', NULL, NULL, NULL, N'', 0),
  (1580, N'क्रेन स्पेअर पार्ट डीलर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1581, N'कुरिअर', N'S', NULL, NULL, NULL, N'', 0),
  (1582, N'कूरिअर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1583, N'क्रिकेट बॅट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1584, N'कुरीअर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1585, N'कुरीयर', N'S', NULL, NULL, NULL, N'', 0),
  (1586, N'कुरीयर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1587, N'क्रोकरी होम अप्लायंसेस टाय अँड गिफ्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1588, N'कलेक्शन', N'S', NULL, NULL, NULL, N'', 0),
  (1589, N'कलेक्शन सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1590, N'कलर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1591, N'कलरचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1592, N'क्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1593, N'क्लास/स्टेशनरी झेरॉक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1594, N'क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (1596, N'क्लिनिकल लॅब', N'S', NULL, NULL, NULL, N'', 0),
  (1597, N'क्लीनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1598, N'क्लोथ वेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1599, N'कुशन मेकिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1600, N'कस्ट्म क्लियरन्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1601, N'कस्टमर सर्विस', N'S', NULL, NULL, NULL, N'', 0),
  (1602, N'कांदा बटाटा व्यापारी', N'S', NULL, NULL, NULL, N'', 0),
  (1603, N'कांदा बटाटा होलसेल ', N'S', NULL, NULL, NULL, N'', 0),
  (1604, N'कापड दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1605, N'कापड शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1606, N'कार गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1607, N'कार डेकोर ', N'S', NULL, NULL, NULL, N'', 0),
  (1608, N'कार डेकोरेशन दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1609, N'कार डिटेलिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1610, N'कार डीलर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1611, N'कार डीलर शोरूम', N'S', NULL, NULL, NULL, N'', 0),
  (1612, N'कार बॅटरी शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1613, N'कार बाइक बॅटरी शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1614, N'कार वॉश सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1615, N'कार शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1616, N'कार स्पेअर पार्ट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1617, N'कार सर्विस', N'S', NULL, NULL, NULL, N'', 0),
  (1618, N'कार सोल्यूशन्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1619, N'कारपेट आणि वालपेपर सर्विस  ', N'S', NULL, NULL, NULL, N'', 0),
  (1620, N'कारपेट व वॉलपेपर शॉप  ', N'S', NULL, NULL, NULL, N'', 0),
  (1621, N'कारपेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1622, N'कार्यलय', N'S', NULL, NULL, NULL, N'', 0),
  (1624, N'कार्यालय (गोल्ड लोन )', N'S', NULL, NULL, NULL, N'', 0),
  (1625, N'कार्यालय (वित्तीय संस्था)', N'S', NULL, NULL, NULL, N'', 0),
  (1626, N'कार्यालय(ऑनलाइन एज्युकेशन)', N'S', NULL, NULL, NULL, N'', 0),
  (1627, N'कार्यालय(वित्तीय)', N'S', NULL, NULL, NULL, N'', 0),
  (1628, N'किचन अप्लायेन्सेस', N'S', NULL, NULL, NULL, N'', 0),
  (1629, N'किचन ऑक्सेसरीज ', N'S', NULL, NULL, NULL, N'', 0),
  (1630, N'किचन ग्रोसरी', N'S', NULL, NULL, NULL, N'', 0),
  (1631, N'किचन स्टुडिओ', N'S', NULL, NULL, NULL, N'', 0),
  (1632, N'किचन होम', N'S', NULL, NULL, NULL, N'', 0),
  (1633, N'किड्स क्लिनिक', N'S', NULL, NULL, NULL, N'', 0),
  (1634, N'किड्स वेयर', N'S', NULL, NULL, NULL, N'', 0),
  (1635, N'किड्स स्कूल', N'S', NULL, NULL, NULL, N'', 0),
  (1636, N'किरणा ', N'S', NULL, NULL, NULL, N'', 0),
  (1637, N'किराणा', N'S', NULL, NULL, NULL, N'', 0),
  (1638, N'किराणा दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1639, N'किराणा दुकान व स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1640, N'किराणा मार्केट', N'S', NULL, NULL, NULL, N'', 0),
  (1641, N'किराणा शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1642, N'किराणा स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1643, N'किराणा स्टोअर (मिनीमॉल)', N'S', NULL, NULL, NULL, N'', 0),
  (1644, N'किराणा स्टोअर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1645, N'किराणा स्टोर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1646, N'किराणा सामानाचे दुकान ', N'S', NULL, NULL, NULL, N'', 0),
  (1647, N'की मेकर', N'S', NULL, NULL, NULL, N'', 0),
  (1648, N'कीचेन इंटेरीअल', N'S', NULL, NULL, NULL, N'', 0),
  (1649, N'कॉ म्यानेजमेंट सर्विर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1650, N'कॉम्प्युटर क्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1651, N'कॉम्प्युटर रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1652, N'कॉम्प्युटर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1653, N'कॉस्टमॅटिक शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1654, N'कॉस्मॅटिक', N'S', NULL, NULL, NULL, N'', 0),
  (1655, N'कॉस्मेटिक', N'S', NULL, NULL, NULL, N'', 0),
  (1656, N'कॉस्मेटिक  क्रॉकरी', N'S', NULL, NULL, NULL, N'', 0),
  (1657, N'कॉस्मेटिक अँड गिफ्ट शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1658, N'कॉस्मेटिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1659, N'कॉस्मेटिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1660, N'कोचिंग क्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1661, N'कोचिंग क्लासेस', N'S', NULL, NULL, NULL, N'', 0),
  (1662, N'कुंटेकर केबिन सेल्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1663, N'कंटेनर केबिन', N'S', NULL, NULL, NULL, N'', 0),
  (1664, N'आई केअर सेंटर ', N'S', NULL, NULL, NULL, N'', 0),
  (1665, N'कडधान्य गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1666, N'कडधान्य स्टॉक गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1667, N'कुंड्या आणि झाडे विक्री ', N'S', NULL, NULL, NULL, N'', 0),
  (1668, N'कन्स्ट्रक्शन', N'S', NULL, NULL, NULL, N'', 0),
  (1669, N'कन्स्ट्रकशन ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1670, N'कन्स्ट्रक्शन ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1671, N'कन्सलटंटींग हाऊस', N'S', NULL, NULL, NULL, N'', 0),
  (1672, N'कन्सल्टन्सी', N'S', NULL, NULL, NULL, N'', 0),
  (1673, N'कन्सलटन्सी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1674, N'कपडे', N'S', NULL, NULL, NULL, N'', 0),
  (1675, N'कपडे विक्री ', N'S', NULL, NULL, NULL, N'', 0),
  (1676, N'कपडे शिलाई दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1677, N'कपड्याचे गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1678, N'कपड्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1679, N'कपड्यांच दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1680, N'कपड्यांचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1681, N'कपड्याचे रेडिमेट दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1682, N'कपडा', N'S', NULL, NULL, NULL, N'', 0),
  (1683, N'कपडा गोडाउन', N'S', NULL, NULL, NULL, N'', 0),
  (1684, N'कपडा दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1685, N'कपडा व चप्पल', N'S', NULL, NULL, NULL, N'', 0),
  (1686, N'कपडा व साडीचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1687, N'कपडा शिलाई ', N'S', NULL, NULL, NULL, N'', 0),
  (1688, N'कपद्याचे दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1689, N'अॅडवायजर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1690, N'अभ्यासिका', N'S', NULL, NULL, NULL, N'', 0),
  (1691, N'अभ्यासिका(खाजगी)', N'S', NULL, NULL, NULL, N'', 0),
  (1692, N'अॅल्युमिनियम वर्क शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1693, N'अॅल्युमिनियम विंडो (ऑफिस)', N'S', NULL, NULL, NULL, N'', 0),
  (1694, N'असोसिएशन', N'S', NULL, NULL, NULL, N'', 0),
  (1696, N'अॅक्वा शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1697, N'अकाऊंट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1698, N'अकाऊंट कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1699, N'अग्रीकल्चर लँड सेकंड होम', N'S', NULL, NULL, NULL, N'', 0),
  (1700, N'जिम फिटनेस स्टुडिओ ', N'S', NULL, NULL, NULL, N'', 0),
  (1701, N'कंन्स्ट्रक्शन ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1703, N'मेडिकल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1705, N'जनरल स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1706, N'पान शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1707, N'कंपनी/ कारखाने नवीन ना हरकत दाखले', N'S', NULL, NULL, NULL, N'', 0),
  (1708, N'पेट्रोल  पंप नुतनिकरण ना हरकत दाखला', N'S', NULL, NULL, NULL, N'', 0),
  (1709, N'नवीन उद्योगधंदा परवाना', N'S', NULL, NULL, NULL, N'', 0),
  (1710, N'नवीन व्यवसाय परवाना देणे', N'S', NULL, NULL, NULL, N'', 0),
  (1711, N'व्यवसाय परवाना नुतनीकरण', N'S', NULL, NULL, NULL, N'', 0),
  (1712, N'साठा परवाना नुतनीकरण ', N'S', NULL, NULL, NULL, N'', 0),
  (1713, N'आटा चक्की', N'S', NULL, NULL, NULL, N'', 0),
  (1714, N'आय ग्लास', N'S', NULL, NULL, NULL, N'', 0),
  (1715, N'आयुरयोगा सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1716, N'आयुर्वेदिक दुकान', N'S', NULL, NULL, NULL, N'', 0),
  (1717, N'आयुर्वेदिक मेडिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1718, N'आयुर्वेदिक व युनाणी हब', N'S', NULL, NULL, NULL, N'', 0),
  (1719, N'आयुर्वेदिक सेंटर व साडी सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1720, N'आर्किटेक कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1721, N'आर्किटेक्चर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1722, N'आर्ट क्राफ्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1723, N'आर्युवेदिक स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1724, N'इजिनियरिंग ', N'S', NULL, NULL, NULL, N'', 0),
  (1725, N'इंजीनिअरिंग ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1726, N'इंजीनिअरिंग कंपनी ( ऑफिस)', N'S', NULL, NULL, NULL, N'', 0),
  (1727, N'इंटरनेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1728, N'इंटरनेट सर्व्हिसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1729, N'इंटरप्राइझेस', N'S', NULL, NULL, NULL, N'', 0),
  (1730, N'इंटेरियर डिझायनिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1731, N'इंटेरियर डिसायनीग ऑफिस ', N'S', NULL, NULL, NULL, N'', 0),
  (1732, N'इंटेरियल ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1733, N'इंटेरीअर डिजायनर', N'S', NULL, NULL, NULL, N'', 0),
  (1734, N'इंडस्ट्रीज सर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1735, N'इनवटर बॅटरी ', N'S', NULL, NULL, NULL, N'', 0),
  (1736, N'इन्वटर बॅटरी विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1737, N'इनवेसमेंट कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1738, N'इन्शुरन्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1739, N'इन्शुरन्स ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1740, N'इन्शुरन्स कं. लि.', N'S', NULL, NULL, NULL, N'', 0),
  (1741, N'इलेक्ट्रिक', N'S', NULL, NULL, NULL, N'', 0),
  (1742, N'इलेक्ट्रिक अँड हार्डवेअर शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1743, N'इलेक्ट्रिक अँड हार्डवेर ', N'S', NULL, NULL, NULL, N'', 0),
  (1744, N'इलेक्ट्रिक आणि हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0),
  (1745, N'इलेक्ट्रिक बाइक शोरूम', N'S', NULL, NULL, NULL, N'', 0),
  (1746, N'इलेक्ट्रिक रिपेअरींग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1747, N'इलेक्ट्रिक रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1748, N'इलेक्ट्रिक रीपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1749, N'इलेक्ट्रिक लाइट ', N'S', NULL, NULL, NULL, N'', 0),
  (1750, N'इलेक्ट्रिक व हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1751, N'इलेक्ट्रिक वस्तु विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1752, N'इलेक्ट्रिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1753, N'इलेक्ट्रिक स्कूटर विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1754, N'इलेक्ट्रिक सामान दुरूस्ती', N'S', NULL, NULL, NULL, N'', 0),
  (1755, N'इलेक्ट्रिक हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0),
  (1756, N'इलेक्ट्रिक हार्डवेअर स्टोअर', N'S', NULL, NULL, NULL, N'', 0),
  (1757, N'इलेक्ट्रिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1758, N'इलेक्ट्रिकल अँड हार्डवेअर ', N'S', NULL, NULL, NULL, N'', 0),
  (1759, N'इलेक्ट्रिकल्स', N'S', NULL, NULL, NULL, N'', 0),
  (1760, N'इलेक्ट्रिकल्स अँड हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1761, N'इलेक्ट्रिक्स अँड हार्डवेअर', N'S', NULL, NULL, NULL, N'', 0),
  (1762, N'इलेक्ट्रॉनिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1763, N'इलेक्ट्रॉनिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1764, N'इलेक्ट्रॉनिक्स  रीपेअरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1765, N'इलेक्टीक्लर्स', N'S', NULL, NULL, NULL, N'', 0),
  (1766, N'इंशुरंस सल्लागार', N'S', NULL, NULL, NULL, N'', 0),
  (1767, N'इंस्टीट्यूट', N'S', NULL, NULL, NULL, N'', 0),
  (1768, N'इस्त्री', N'S', NULL, NULL, NULL, N'', 0),
  (1769, N'ईलेक्ट्रिशन', N'S', NULL, NULL, NULL, N'', 0),
  (1770, N'उस सप्लायर्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1772, N'एक्सिस बँक  ', N'S', NULL, NULL, NULL, N'', 0),
  (1773, N'एजेंट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1774, N'एजन्सी ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1775, N'एंजिनियर ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1776, N'एंटरप्रायजेस', N'S', NULL, NULL, NULL, N'', 0),
  (1777, N'एटीएम', N'S', NULL, NULL, NULL, N'', 0),
  (1778, N'एड्वोकेट ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1779, N'एम.एस.पाईप गोडाउन ', N'S', NULL, NULL, NULL, N'', 0),
  (1780, N'एम्ब्रोइडरी', N'S', NULL, NULL, NULL, N'', 0),
  (1781, N'एल आय सी  फायनान्स', N'S', NULL, NULL, NULL, N'', 0),
  (1782, N'एल आय सी कार्यालय', N'S', NULL, NULL, NULL, N'', 0),
  (1783, N'एल.आय.सी. ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1784, N'एलेक्ट्रोनिक स्टोर', N'S', NULL, NULL, NULL, N'', 0),
  (1785, N'एलुमिनियम अँड ग्लास वर्क', N'S', NULL, NULL, NULL, N'', 0),
  (1786, N'एव्हेंट एजन्सि', N'S', NULL, NULL, NULL, N'', 0),
  (1787, N'एसी रेर्पैरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1788, N'एसी रिपेरिंग', N'S', NULL, NULL, NULL, N'', 0),
  (1789, N'ऑइल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1790, N'ऑटो गॅरेज', N'S', NULL, NULL, NULL, N'', 0),
  (1791, N'ऑटो पार्ट्स आणि सर्विस', N'S', NULL, NULL, NULL, N'', 0),
  (1792, N'ऑटोमोबाइल', N'S', NULL, NULL, NULL, N'', 0),
  (1793, N'ऑटोमोबाइल पार्ट सर्विसेस ', N'S', NULL, NULL, NULL, N'', 0),
  (1794, N'ऑटोमोबाइल रीपेयरिंग शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1795, N'ऑटोमोबाइल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1796, N'ऑटोमोबाइल स्पेअरपार्ट शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1797, N'ऑटोमोबाईल अँड वॉशिंग सेंटर', N'S', NULL, NULL, NULL, N'', 0),
  (1798, N'ऑटोमोबाईल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1799, N'ऑनलाइन ग्रोसरी', N'S', NULL, NULL, NULL, N'', 0),
  (1800, N'ऑनलाइन ग्रोसरी डेलिवेरी', N'S', NULL, NULL, NULL, N'', 0),
  (1801, N'ऑनलाइन शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1802, N'ऑप्टिक', N'S', NULL, NULL, NULL, N'', 0),
  (1803, N'ऑप्टिक शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1804, N'ऑप्टिकल', N'S', NULL, NULL, NULL, N'', 0),
  (1805, N'ऑप्टिकल शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1806, N'ऑप्टिकल्स शॉप ', N'S', NULL, NULL, NULL, N'', 0),
  (1807, N'ऑप्टिक्स', N'S', NULL, NULL, NULL, N'', 0),
  (1808, N'ऑप्टिक्स शॉप', N'S', NULL, NULL, NULL, N'', 0),
  (1809, N'ऑफिस ( कनस्टटसी ऑफिस )', N'S', NULL, NULL, NULL, N'', 0),
  (1810, N'ऑफिस + स्टेशनरी', N'S', NULL, NULL, NULL, N'', 0),
  (1811, N'ऑफिस लॉजिस्टिक्स सेर्विसेस', N'S', NULL, NULL, NULL, N'', 0),
  (1812, N'ओपटीकल्स ', N'S', NULL, NULL, NULL, N'', 0),
  (1813, N'ओल्ड पेपर मार्ट', N'S', NULL, NULL, NULL, N'', 0),
  (1814, N'औषद विक्री', N'S', NULL, NULL, NULL, N'', 0),
  (1815, N'उद्योगधंदा परवाना नुतनीकरण  ', N'S', NULL, NULL, NULL, N'', 0),
  (1816, N'( अग्रो प्रोडक्ट )ऑफिस', N'S', NULL, NULL, NULL, N'', 0),
  (1821, N'आईस्क्रीम पार्लर', N'S', 68, NULL, NULL, N'', 0),
  (1822, N'एनजीओ', N'S', 68, NULL, NULL, N'', 0),
  (1823, N'योगा ', N'GM', 68, NULL, NULL, N'', 0),
  (1824, N'झुंबा ', N'GM', 68, NULL, NULL, N'', 0),
  (1826, N'वस्तु निर्मिती', N'S', NULL, NULL, NULL, N'', 0),
  (1828, N'पार्कींग', N'N', 72, NULL, NULL, N'', 0),
  (1829, N'रिफ्युज एरिया', N'N', 72, NULL, NULL, N'', 0),
  (1830, N'पार्किंग', N'GR', 70, NULL, NULL, N'', 0),
  (1831, N'पेट्स क्लिनिक', N'D', 68, NULL, NULL, N'', 0),
  (1832, N'विद्यालय', N'T', 72, NULL, NULL, N'', 0),
  (1835, N'औद्योगिक', N'NI', 66, NULL, NULL, N'', 0),
  (1836, N'इंडेक्स-2', N'C', 74, NULL, NULL, N'', 0),
  (1854, N'स्टोअर रूम', N'R', 72, NULL, NULL, N'', 0),
  (1932, N'Other', N'ABLC', NULL, NULL, NULL, N'', 0),
  (2012, N'व्हिजिटर्स पार्किंग', N'SPK', NULL, NULL, NULL, N'', 0),
  (2013, N'कार पार्किंग', N'OPK', NULL, NULL, NULL, N'', 0),
  (2015, N'सायकल  पार्किंग ', N'OPK', NULL, NULL, NULL, N'', 0),
  (2019, N'बाईक पार्किंग', N'OPKC', NULL, NULL, NULL, N'', 0),
  (2026, N'लॉबी', N'ACH', 91, NULL, NULL, N'', 0),
  (2028, N'वॉचमन रूम', N'ACH', 91, NULL, NULL, N'', 0),
  (2030, N'बॅडमिंटन कोर्ट', N'ACH', 91, NULL, NULL, N'', 0),
  (2032, N'चेस एरिया', N'ACH', 91, NULL, NULL, N'', 0),
  (2034, N'कॅरम एरिया', N'ACH', 56, NULL, NULL, N'', 0),
  (2036, N'पंप रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2038, N'आरएमएस रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2040, N'इलेक्ट्रिक रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2042, N'गोडाऊन', N'ACH', 56, NULL, NULL, N'', 0),
  (2044, N'रेस्टॉरंट', N'ACH', 56, NULL, NULL, N'', 0),
  (2046, N'डिपार्टमेंटल स्टोअर', N'ACH', 56, NULL, NULL, N'', 0),
  (2048, N'बँक्वेट हॉल', N'ACH', 56, NULL, NULL, N'', 0),
  (2050, N'क्रेच', N'ACH', 56, NULL, NULL, N'', 0),
  (2054, N'टेबल टेनिस एरिया', N'ACH', 56, NULL, NULL, N'', 0),
  (2056, N'स्नूकर / अॅडमिन एरिया', N'ACH', 56, NULL, NULL, N'', 0),
  (2059, N'ए.व्ही. रूम', N'ACHC', 56, NULL, NULL, N'', 0),
  (2060, N'जेन्ट्स टॉयलेट', N'ACH', 56, NULL, NULL, N'', 0),
  (2063, N'कॉमन वॉशरूम', N'ACHC', 56, NULL, NULL, N'', 0),
  (2065, N'हँडीकॅप वॉशरूम', N'ACHC', 56, NULL, NULL, N'', 0),
  (2066, N'लेडीज वॉशरूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2068, N'स्विमिंग पूल', N'ACH', 56, NULL, NULL, N'', 0),
  (2070, N'एल.व्ही.एस. रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2072, N'फिटनेस सेंटर', N'ACH', 56, NULL, NULL, N'', 0),
  (2074, N'कॅफेटेरिया', N'ACH', 56, NULL, NULL, N'', 0),
  (2076, N'सोसायटी रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2078, N'ड्रायव्हर रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2080, N'गेस्ट रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2082, N'रेस्ट रूम & चेंजिंग रूम', N'ACH', 56, NULL, NULL, N'', 0),
  (2084, N'जानिटर रूम', N'ACH', 56, NULL, NULL, N'', 0);

 SET IDENTITY_INSERT [PTIS].[SubTypeOfUseMaster] OFF;


SET IDENTITY_INSERT [PTIS].[ApplyTaxesMasterPrime] ON;
INSERT [PTIS].[ApplyTaxesMasterPrime] ([Id], [TypeOfUseId], [Type], [GeneralTax], [StateEducationTax], [StateEmploymentTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [Interest], [UpdatedBy], [CreatedBy], [UpdatedDate]) VALUES
  (1, N'C', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:11:21.870' AS DateTime)),
  (2, N'T', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (3, N'V', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (4, N'R', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-11-03T18:12:05.883' AS DateTime)),
  (5, N'UC', N'N', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T16:07:10.000' AS DateTime)),
  (6, N'SPK', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:42:13.880' AS DateTime)),
  (7, N'N', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (8, N'EG', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:13:01.293' AS DateTime)),
  (9, N'GO', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:16:07.720' AS DateTime)),
  (10, N'GR', N'R', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:16:23.870' AS DateTime)),
  (11, N'HO', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:16:52.030' AS DateTime)),
  (12, N'LB', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:22:33.823' AS DateTime)),
  (13, N'UCC', N'N', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2023-12-16T15:59:46.000' AS DateTime)),
  (14, N'MTR', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:27:33.283' AS DateTime)),
  (15, N'FF', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:13:55.743' AS DateTime)),
  (16, N'WGC', N'C', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:45:00.740' AS DateTime)),
  (17, N'WEG', N'C', 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2023-12-16T15:55:36.000' AS DateTime)),
  (18, N'WEP', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:44:33.077' AS DateTime)),
  (19, N'WGR', N'R', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:45:17.013' AS DateTime)),
  (20, N'PC', N'N', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T16:04:33.000' AS DateTime)),
  (21, N'S', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:41:40.610' AS DateTime)),
  (22, N'D', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:12:41.407' AS DateTime)),
  (23, N'B', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:11:06.360' AS DateTime)),
  (24, N'SW', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:43:32.933' AS DateTime)),
  (25, N'I', N'I', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:17:05.750' AS DateTime)),
  (26, N'EP', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:13:38.150' AS DateTime)),
  (27, N'WR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-06-24T16:25:03.120' AS DateTime)),
  (28, N'WC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:43:47.103' AS DateTime)),
  (29, N'CC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:11:35.770' AS DateTime)),
  (30, N'CG', N'C', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:37:56.000' AS DateTime)),
  (31, N'CR', N'R', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:38:16.000' AS DateTime)),
  (32, N'OPR', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:29:27.737' AS DateTime)),
  (33, N'OPC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:28:47.710' AS DateTime)),
  (34, N'PTR', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:41:02.927' AS DateTime)),
  (35, N'GC', N'C', 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:14:23.620' AS DateTime)),
  (36, N'O', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:28:14.613' AS DateTime)),
  (37, N'M', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:22:57.470' AS DateTime)),
  (38, N'KT', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:21:48.757' AS DateTime)),
  (39, N'H', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:16:38.080' AS DateTime)),
  (40, N'OPK', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:29:00.030' AS DateTime)),
  (41, N'WI', N'I', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:45:45.680' AS DateTime)),
  (42, N'OP', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:28:34.497' AS DateTime)),
  (43, N'WCGR', N'R', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2023-12-16T15:55:49.000' AS DateTime)),
  (44, N'WCGC', N'C', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2023-12-16T15:55:59.000' AS DateTime)),
  (45, N'CH', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:12:04.450' AS DateTime)),
  (46, N'L', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:22:19.773' AS DateTime)),
  (47, N'AG', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (48, N'ACH', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:06:11.403' AS DateTime)),
  (49, N'AGM', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:07:28.743' AS DateTime)),
  (50, N'AH', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:08:35.993' AS DateTime)),
  (51, N'AMH', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:10:10.920' AS DateTime)),
  (52, N'AO', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:10:39.110' AS DateTime)),
  (53, N'APG', N'N', 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-18T13:44:02.000' AS DateTime)),
  (54, N'ASW', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-04-29T16:03:22.850' AS DateTime)),
  (55, N'AWC', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-13T15:53:34.723' AS DateTime)),
  (56, N'CCO', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (57, N'CCR', N'C', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:31:33.000' AS DateTime)),
  (58, N'CGC', N'C', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:38:02.000' AS DateTime)),
  (59, N'ENCC', N'C', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:39:16.000' AS DateTime)),
  (60, N'ENCEG', N'R', 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:43:12.000' AS DateTime)),
  (61, N'ENCEP', N'C', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:42:06.000' AS DateTime)),
  (62, N'ENCI', N'I', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:44:55.000' AS DateTime)),
  (63, N'ENCR', N'R', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T15:45:21.000' AS DateTime)),
  (64, N'GM', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:14:53.230' AS DateTime)),
  (65, N'GMR', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:15:42.760' AS DateTime)),
  (66, N'KTR', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:22:05.933' AS DateTime)),
  (67, N'NPD', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:27:58.223' AS DateTime)),
  (68, N'OBR', N'N', 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 0, CAST(N'2023-12-16T16:02:51.000' AS DateTime)),
  (69, N'OPKC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:29:13.360' AS DateTime)),
  (70, N'RCO', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (71, N'RGN', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-13T15:50:28.373' AS DateTime)),
  (72, N'SPKC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:43:18.367' AS DateTime)),
  (73, N'WT', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:49:50.967' AS DateTime)),
  (74, N'PG', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:33:03.957' AS DateTime)),
  (75, N'GA', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (76, N'RFG', N'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2023-12-16T15:02:14.000' AS DateTime)),
  (77, N'EHO', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-01T13:13:21.213' AS DateTime)),
  (78, N'PF', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:29:48.223' AS DateTime)),
  (79, N'NR', N'R', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, NULL),
  (80, N'NC', N'C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, NULL),
  (81, N'NI', N'I', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, NULL),
  (82, N'ICR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 74, CAST(N'2025-05-01T13:20:53.703' AS DateTime)),
  (83, N'ICC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 74, CAST(N'2025-05-01T13:18:20.983' AS DateTime)),
  (84, N'ICI', N'I', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 74, CAST(N'2025-05-01T13:20:01.613' AS DateTime)),
  (85, N'ICRT', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:21:17.567' AS DateTime)),
  (86, N'ICCT', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:19:15.687' AS DateTime)),
  (87, N'ICIT', N'I', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:20:20.723' AS DateTime)),
  (88, N'ICHT', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:19:47.653' AS DateTime)),
  (89, N'ICH', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:19:33.150' AS DateTime)),
  (90, N'ICP', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 66, CAST(N'2025-05-01T13:20:39.573' AS DateTime)),
  (92, N'OAH', N'C', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, NULL),
  (93, N'ABLR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-04-28T19:57:24.817' AS DateTime)),
  (94, N'ABLC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-01T13:04:55.250' AS DateTime)),
  (95, N'IT', N'I', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-01T13:21:32.763' AS DateTime)),
  (96, N'LR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-03T15:43:43.867' AS DateTime)),
  (97, N'MR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-03T15:45:33.360' AS DateTime)),
  (98, N'AWA', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-03T15:44:28.547' AS DateTime)),
  (99, N'FCR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-03T15:36:12.807' AS DateTime)),
  (100, N'SR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 0, CAST(N'2025-05-01T13:11:21.870' AS DateTime)),
  (101, N'TL', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-13T15:22:18.713' AS DateTime)),
  (102, N'OL', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-05-13T15:23:32.153' AS DateTime)),
  (103, N'OWC', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (104, N'FIRR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (105, N'GRR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (106, N'ICPRT', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (107, N'ISR', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (108, N'PH', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (109, N'WAT', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-08-20T15:13:53.667' AS DateTime)),
  (110, N'SI', N'R', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 55, CAST(N'2025-09-17T16:17:28.537' AS DateTime)),
  (111, N'ACHC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 91, 91, CAST(N'2025-10-01T16:36:38.753' AS DateTime)),
  (112, N'ASWC', N'C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 91, 91, CAST(N'2025-10-01T16:39:42.407' AS DateTime));

SET IDENTITY_INSERT [PTIS].[ApplyTaxesMasterPrime] OFF


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


INSERT INTO [PTIS].[AgeFactorCVMaster]
([ConstructionId], [AgeFrom], [AgeTo], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('WE', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WD', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC1', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB1', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA1', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('OPR', 61, 999, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('op', 61, 999, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('ER', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('E', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('DR', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('D', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('CR', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C1', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C', 61, 999, 0.15, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('BR', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B1', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('AR', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A1', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A', 61, 999, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WE', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WD', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC1', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB1', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA1', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('OPR', 51, 60, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('op', 51, 60, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('ER', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('E', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('DR', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('D', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('CR', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C1', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C', 51, 60, 0.20, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('BR', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B1', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('AR', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A1', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A', 51, 60, 0.40, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WE', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WD', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC1', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB1', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA1', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('OPR', 41, 50, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('op', 41, 50, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('ER', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('E', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('DR', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('D', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('CR', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C1', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C', 41, 50, 0.30, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('BR', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B1', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('AR', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A1', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A', 41, 50, 0.50, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WE', 31, 40, 0.45, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WD', 31, 40, 0.45, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC1', 31, 40, 0.45, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC', 31, 40, 0.45, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB1', 31, 40, 0.60, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB', 31, 40, 0.60, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA1', 31, 40, 0.60, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA', 31, 40, 0.60, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('OPR', 31, 40, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WD', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WC', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WB', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('WA', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('OPR', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('op', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('ER', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('E', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('DR', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('D', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('CR', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('C', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('BR', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('B', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('AR', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A1', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL),
  ('A', 0, 2, 1.00, '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);
-- [PTIS].[PropertyTypeCategoryMaster]




SET IDENTITY_INSERT [PTIS].[PropertyTypeCategoryMaster] ON;
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([PropertyTypeCategoryID], [PropertyTypeCategory], [isActive]) VALUES ('2',N'निवासी','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([PropertyTypeCategoryID], [PropertyTypeCategory], [isActive]) VALUES ('3',N'अनिवासी','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([PropertyTypeCategoryID], [PropertyTypeCategory], [isActive]) VALUES ('4',N'शासकीय मालमत्ता','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([PropertyTypeCategoryID], [PropertyTypeCategory], [isActive]) VALUES ('5',N'शैक्षणिक','1');
INSERT INTO [PTIS].[PropertyTypeCategoryMaster] ([PropertyTypeCategoryID], [PropertyTypeCategory], [isActive]) VALUES ('6',N'औद्योगिक','1');
SET IDENTITY_INSERT [PTIS].[PropertyTypeCategoryMaster] OFF;
-- [PTIS].[PropertyTypeMaster]


SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] ON;

INSERT INTO [PTIS].[PropertyTypeMaster]
([PropertyTypeID], [PropertyDescription], [Type], [isActive], [PropertyTypeGroup],
 [SearchKey], [SearchSequence], [PropertyTypeCategoryID],
 [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES
(1,  N'खाजगी शाळा', 'C', 1, N'बिगर निवासी', N'E', 1, NULL, NULL, NULL, NULL),
(2,  N'म.न.पा.शाळा', 'N', 1, N'नगरपरिषद मालमत्ता', N'N', 1, NULL, NULL, NULL, NULL),
(5,  N'खाजगी रुग्णालय', 'C', 1, N'बिगर निवासी', N'D', 1, NULL, NULL, NULL, NULL),
(6,  N'शासकीय रुग्णालय', 'C', 1, N'बिगर निवासी', N'G', 2, NULL, NULL, NULL, NULL),
(8,  N'म.न.पा.चे रुग्णालय', 'N', 1, N'नगरपरिषद मालमत्ता', N'D', 4, NULL, NULL, NULL, NULL),
(10, N'बँक व वित्तीय संस्था', 'C', 1, N'बिगर निवासी', N'B', 1, NULL, NULL, NULL, NULL),
(11, N'धार्मिक स्थळ', 'R', 1, N'धार्मीक', N'T', 1, NULL, NULL, NULL, NULL),
(12, N'निवासी', 'R', 1, N'निवासी', N'R', 1, 2, NULL, NULL, NULL),
(13, N'दुकान', 'C', 1, N'बिगर निवासी', N'S', 1, NULL, NULL, NULL, NULL),
(14, N'रेस्टॉरंट आणि बार', 'C', 1, N'बिगर निवासी', N'H', 1, NULL, NULL, NULL, NULL),
(16, N'म.न.पा.चे.कार्यालय', 'N', 1, N'नगरपरिषद मालमत्ता', N'N', 2, NULL, NULL, NULL, NULL),
(17, N'शासकीय कार्यालय', 'C', 1, N'बिगर निवासी', N'G', 3, NULL, NULL, NULL, NULL),
(21, N'म.न.पा. व इतर मालमत्ता', 'N', 1, N'नगरपरिषद मालमत्ता', N'N', 2, NULL, NULL, NULL, NULL),
(22, N'प्लॉट', 'R', 1, N'प्लॉट', N'O', 1, NULL, NULL, NULL, NULL),
(23, N'निवासी व दुकान', 'R-C', 1, N'मिश्र', N'R', 2, NULL, NULL, NULL, NULL),
(24, N'अतिक्रमण', 'R', 1, N'निवासी', N'R', 3, NULL, NULL, NULL, NULL),
(25, N'मा शासकीय मालमत्ता', 'C', 1, N'बिगर निवासी', N'G', 4, NULL, NULL, NULL, NULL),
(27, N'मोबाईल टॉवर', 'C', 1, N'बिगर निवासी', N'T', 2, NULL, NULL, NULL, NULL),
(28, N'पेट्रोल पंप', 'C', 1, N'बिगर निवासी', N'P', 1, NULL, NULL, NULL, NULL),
(29, N'हॉटेल', 'C', 1, N'बिगर निवासी', N'H', 2, NULL, NULL, NULL, NULL),
(30, N'लॉज', 'C', 1, N'बिगर निवासी', N'L', 1, NULL, NULL, NULL, NULL),
(31, N'निवासी व हॉटेल', 'R-C', 1, N'मिश्र', N'R', 4, NULL, NULL, NULL, NULL),
(32, N'गोडाऊन', 'C', 1, N'बिगर निवासी', N'S', 2, NULL, NULL, NULL, NULL),
(33, N'चालू बांधकाम', 'R', 1, N'निवासी', N'U', 1, NULL, NULL, NULL, NULL),
(34, N'गोठा', 'R', 1, N'निवासी', N'R', 5, NULL, NULL, NULL, NULL),
(35, N'पडीत', 'R', 1, N'निवासी', N'R', 6, NULL, NULL, NULL, NULL),
(36, N'कार्यालय', 'C', 1, N'बिगर निवासी', N'O', 2, NULL, NULL, NULL, NULL),
(37, N'म.न.पा.दुकान गाळे', 'N', 1, N'नगरपरिषद मालमत्ता', N'N', 4, NULL, NULL, NULL, NULL),
(38, N'वसतिगृह', 'C', 1, N'बिगर निवासी', N'H', 2, NULL, NULL, NULL, NULL),
(39, N'व्यायाम शाळा', 'C', 1, N'बिगर निवासी', N'G', 5, NULL, NULL, NULL, NULL),
(41, N'पार्किंग', 'C', 1, N'बिगर निवासी', N'P', 2, NULL, NULL, NULL, NULL),
(42, N'निवासी व कार्यालय', 'R-C', 1, N'मिश्र', N'R', 8, NULL, NULL, NULL, NULL),
(44, N'वाचनालय', 'C', 1, N'बिगर निवासी', N'L', 2, NULL, NULL, NULL, NULL),
(45, N'केंद्र शासकीय मालमत्ता', 'C', 1, N'बिगर निवासी', N'C', 1, NULL, NULL, NULL, NULL),
(46, N'खाजगी रुग्णालय व निवासी', 'R-C', 1, N'मिश्र', N'D', 5, NULL, NULL, NULL, NULL),
(47, N'धार्मिक स्थळ व अनिवासी', 'R-C', 1, N'मिश्र', N'T', 3, NULL, NULL, NULL, NULL),
(48, N'शासकीय वसतिगृह', 'C', 1, N'बिगर निवासी', N'G', 7, NULL, NULL, NULL, NULL),
(49, N'लॉंन', 'C', 1, N'बिगर निवासी', N'L', 3, NULL, NULL, NULL, NULL),
(50, N'चित्रपटगृह', 'C', 1, N'बिगर निवासी', N'T', 4, NULL, NULL, NULL, NULL),
(51, N'शोरूम', 'C', 1, N'बिगर निवासी', N'S', 4, NULL, NULL, NULL, NULL),
(52, N'कोचिंग क्लासेस', 'C', 1, N'बिगर निवासी', N'C', 2, NULL, NULL, NULL, NULL),
(53, N'खाजगी रुग्णालय व दुकान', 'C', 1, N'बिगर निवासी', N'D', 7, NULL, NULL, NULL, NULL),
(54, N'मंगल कार्यालय व निवासी', 'R-C', 1, N'मिश्र', N'M', 2, NULL, NULL, NULL, NULL),
(55, N'निवासी व औद्योगिक', 'R-C', 1, N'औद्योगिक', N'I', 2, NULL, NULL, NULL, NULL),
(57, N'दुकान व पडीत', 'R-C', 1, N'मिश्र', N'S', 5, NULL, NULL, NULL, NULL),
(58, N'निवासी व पडीत', 'R', 1, N'निवासी', N'R', 10, NULL, NULL, NULL, NULL),
(59, N'निवासी  व बँक', 'R-C', 1, N'मिश्र', N'B', 2, NULL, NULL, NULL, NULL),
(63, N'खाजगी शाळा व निवासी', 'R-C', 1, N'मिश्र', N'E', 2, NULL, NULL, NULL, NULL),
(64, N'दुकान व मंगल कार्यालय', 'C', 1, N'बिगर निवासी', N'S', 6, NULL, NULL, NULL, NULL),
(66, N'दुकान व कार्यालय', 'C', 1, N'बिगर निवासी', N'S', 3, NULL, NULL, NULL, NULL),
(69, N'निवासी व अनिवासी', 'R-C', 1, N'मिश्र', N'C', 6, NULL, NULL, NULL, NULL),
(70, N'कारखाना व कार्यालय', 'C', 1, N'बिगर निवासी', N'I', 3, NULL, NULL, NULL, NULL),
(77, N'दवाखाना व हॉटेल', 'C', 1, N'बिगर निवासी', N'D', 10, NULL, NULL, NULL, NULL),
(78, N'बँक व अनिवासी', 'C', 1, N'बिगर निवासी', N'B', 6, NULL, NULL, NULL, NULL),
(79, N'हॉटेल व दुकान', 'C', 1, N'बिगर निवासी', N'H', 6, NULL, NULL, NULL, NULL),
(80, N'निवासी,गोडाउन,दुकान', 'R-C', 1, N'मिश्र', N'C', 8, NULL, NULL, NULL, NULL),
(82, N'अनिवासी', 'C', 1, N'बिगर निवासी', N'C', 2, NULL, NULL, NULL, NULL),
(83, N'कारखाना व गोडाउन', 'C', 1, N'बिगर निवासी', N'I', 4, NULL, NULL, NULL, NULL),
(88, N'शैक्षणिक शासकीय', 'C', 1, N'बिगर निवासी', N'E', 4, NULL, NULL, NULL, NULL),
(92, N'औद्योगिक', 'I', 1, N'औद्योगिक', N'I', 1, NULL, NULL, NULL, NULL),
(94, N'मॉल', 'C', 1, N'बिगर निवासी', N'M', 3, NULL, NULL, NULL, NULL),
(108, N'शासकीय मालमत्ता', 'C', 1, N'बिगर निवासी', N'n',5, NULL, NULL, NULL, NULL),
(110, N'धार्मिक स्थळ व निवासी', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(111, N'निवासी व गोडावून', 'R-C', 1, N'मिश्र', N'',1,  NULL, NULL, NULL, NULL),
(113, N'मंगल कार्यालय', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(115, N'निवासी व कोचिंग क्लासेस', 'R-C', 1, N'मिश्र', N'',1,  NULL, NULL, NULL, NULL),
(118, N'अंगणवाडी', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(119, N'निवासी व अंगणवाडी', 'R-C', 1, N'मिश्र', N'',1,  NULL, NULL, NULL, NULL),
(127, N'गोडावून व दुकान', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(132, N'शेती', 'R', 1, N'प्लॉट', N'',1,  NULL, NULL, NULL, NULL),
(133, N'मोबाईल टॉवर व निवासी', 'R-C', 1, N'मिश्र', N'',1,  NULL, NULL, NULL, NULL),
(134, N'सामाजिक सभागृह', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(135, N'मनपा गार्डन/ओपनस्पेस', 'C', 1, N'R', N'',1,  NULL, NULL, NULL, NULL),
(136, N'मनपा इतर भूखंड', 'R', 1, N'R', N'',1,  NULL, NULL, NULL, NULL),
(137, N'नर्सरी', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(138, N'पेयिंग गेस्ट', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(139, N'पॅथॉलॉजी लॅब', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(140, N'अॅमिनीटी', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(141, N'रिफ्युज एरिया', 'N', 1, N'R', N'',1,  NULL, NULL, NULL, NULL),
(142, N'निवासी व चालू बांधकाम', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(144, N'पोल्ट्रीफार्म', 'C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(145, N'अनिवासी व चालू बांधकाम', 'R-C', 1, N'बिगर निवासी', N'',1,  NULL, NULL, NULL, NULL),
(146, N'निवासी व गोठा', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(147, N'प्लॉट व अनिवासी', 'C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(148, N'निवासी व खुला भूखंड', 'R', 1, N'निवासी', N'',1,  NULL, NULL, NULL, NULL),
(149, N'अनिवासी व खुला भूखंड', 'C', 1, N'अनिवासी', N'',1,  NULL, NULL, NULL, NULL),
(151, N'औद्योगिक व अनिवासी', 'I-C', 1, N'औद्योगिक व अनिवासी', N'',1,  NULL, NULL, NULL, NULL),
(152, N'औद्योगिक व मिश्र', 'R-C', 1, N'औद्योगिक व मिश्र', N'',1,  NULL, NULL, NULL, NULL),
(153, N'निवासी , औद्यागिक , अनिवासी', 'R-C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(154, N'निवासी व वाचनालय', 'R-C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(155, N'बांधकाम पूर्ण मा. वापरात नाही', 'R-C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(156, N'शेती व अनिवासी', 'R-C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(157, N'क्लिनिक', 'C', 1, N'अनिवासी', N'',1,  NULL, NULL, NULL, NULL),
(158, N'उपहारगृह', 'C', 1, N'अनिवासी', N'',1,  NULL, NULL, NULL, NULL),
(159, N'धार्मिक स्थळ,निवासी व अनिवासी', 'R-C', 1, N'R-C', N'',1,  NULL, NULL, NULL, NULL),
(160, N'माहिती व तंत्रज्ञान उद्योग', 'I', 1, N'I', N'',1,  NULL, NULL, NULL, NULL),
(161, N'सामाजिक संस्था', 'R', 1, N'R', N'',1,  NULL, NULL, NULL, NULL);

SET IDENTITY_INSERT [PTIS].[PropertyTypeMaster] OFF;




SET IDENTITY_INSERT [PTIS].[AssessmentMaster] ON;
INSERT [PTIS].[AssessmentMaster] ([AssessmentID], [FromYear], [ToYear], [MaxYear], [MinRV], [NPAddress], [ThirdPartyName], [ThirdPartyAddress], [ThirdPartyContact], [ThirdPartyWebSite], [ThirdPartyEmail], [NPRemark], [ThirdPartyRemark], [SrNo], [NPIcon], [ThirdPartyIcon], [NPImage], [ThirdPartyImage], [NPcon], [NPContactNo], [NPEmail], [NPWebsite], [ThirdPartyCopyRight], [CouncilID], [NPTitle], [NPAddressInLocal], [PartyNameInlocal], [PartyAddressInlocal], [CreatedBy], [UpdatedBy], [UpdatedDate], [NPPrefix]) VALUES
  (1, 2023, 2027, 2024, 708, N'Thane', N'STHAPATYA CONSULTANTS I PVT LTD', N'Amrarvati', N'0123456789', N'https://sthapatyaconsultants.com', N'STHAPATYACONSULTANTS@GMAIL.COM', N'TaxInfo 13.0 Lic No SCP1/01/08', N'',  N'5512', 0x, 0x, 0x, 0x, N'', N'020-67333333', N'dmctax@tanecity.gov.in', N'https://thanecity.gov.in/', N'Copyright © 2020-2021 Sthapatya Consultants (I) Pvt Ltd', 1, N'ठाणे महानगरपालिका', N'ठाणे', N'स्थापत्य कन्सल्टंट (ई) प्रा.लि.', N'अमरावती', NULL, 55, CAST(N'2025-03-24T18:20:45.293' AS DateTime), N'TMC');

SET IDENTITY_INSERT [PTIS].[AssessmentMaster] OFF;


INSERT INTO [PTIS].[FloorMaster]
([FloorID], [Description], [SequenceNo], [MaxFloorNo], [CreatedBy], [UpdatedBy], [UpdatedDate])
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



set identity_insert [PTIS].[FloorFactorCVMaster] on;
INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('1', 'G', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('2', '1', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('3', '2', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('4', '3', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('5', '4', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('6', '5', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('7', '6', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('8', '7', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('9', '8', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('10', 'B', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('11', '9', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('12', '10', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('13', '11', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('14', '12', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('15', '13', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('16', '14', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('17', 'M', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('18', '15', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('19', '16', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('20', '17', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('21', '18', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('22', '19', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('23', '20', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('24', '21', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('25', '22', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('26', '23', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('27', '24', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('28', '25', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('29', '26', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('30', '27', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('31', '28', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('32', '29', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('33', '30', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('34', '31', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('35', '32', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('36', 'OP', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('37', '33', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('38', '34', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('39', '35', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('40', '36', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('41', '37', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('42', '38', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('43', '39', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

INSERT INTO [PTIS].[FloorFactorCVMaster]
([Id], [FloorID], [FactorWithLift], [FactorWithoutLift], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('44', '40', '1.00', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL);

SET IDENTITY_INSERT [PTIS].[FloorFactorCVMaster] OFF;
-- [PTIS].[RoomNoCountMaster]





SET IDENTITY_INSERT [PTIS].[RoomNoCountMaster] ON;
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('704','1');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('705','2');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('706','3');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('707','4');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('708','5');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('709','6');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('710','7');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('711','8');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('712','9');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('713','10');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('714','11');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('715','12');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('716','13');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('717','14');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('718','15');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('719','16');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('720','17');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('721','18');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('722','19');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('723','20');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('724','21');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('725','22');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('726','23');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('727','24');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('728','25');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('729','26');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('730','27');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('731','28');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('732','29');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('733','30');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('734','31');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('735','32');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('736','33');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('737','34');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('738','35');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('739','36');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('740','37');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('741','38');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('742','39');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('743','40');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('744','41');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('745','42');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('746','43');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('747','44');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('748','45');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('749','46');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('750','47');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('751','48');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('752','49');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('753','50');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('754','51');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('755','52');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('756','53');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('757','54');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('758','55');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('759','56');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('760','57');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('761','58');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('762','59');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('763','60');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('764','61');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('765','62');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('766','63');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('767','64');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('768','65');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('769','66');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('770','67');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('771','68');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('772','69');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('773','70');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('774','71');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('775','72');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('776','73');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('777','74');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('778','75');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('779','76');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('780','77');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('781','78');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('782','79');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('783','80');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('784','81');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('785','82');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('786','83');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('787','84');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('788','85');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('789','86');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('790','87');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('791','88');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('792','89');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('793','90');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('794','91');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('795','92');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('796','93');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('797','94');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('798','95');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('799','96');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('800','97');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('801','98');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('802','99');
INSERT INTO [PTIS].[RoomNoCountMaster] ([Id], [RoomNo]) VALUES ('803','100');
SET IDENTITY_INSERT [PTIS].[RoomNoCountMaster] OFF;
-- [PTIS].[NatureFactorCVMaster]


SET IDENTITY_INSERT [PTIS].[NatureFactorCVMaster] ON;


INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('1', 'A', '1.00', '2024-04-01', '2025-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('2', 'B', '0.80', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('3', 'C', '0.70', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('4', 'D', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('5', 'E', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('6', 'AR', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('7', 'BR', '0.80', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('8', 'CR', '0.70', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('9', 'DR', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('10', 'ER', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('11', 'WA', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('12', 'WB', '0.80', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('13', 'WC', '0.70', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('14', 'WD', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('15', 'WE', '0.60', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('16', 'A1', '1.50', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('17', 'B1', '1.30', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('18', 'C1', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('19', 'WA1', '1.50', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('20', 'WB1', '1.30', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('21', 'WC1', '1.00', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

INSERT INTO [PTIS].[NatureFactorCVMaster]
([Id], [ConstructionId], [Factor], [EffectiveFrom], [EffectiveTo], [Code], [CreatedBy], [UpdatedBy], [UpdatedDate])
VALUES ('25', 'A', '1.50', '2025-04-01', '2026-03-31', NULL, NULL, NULL, NULL);

SET IDENTITY_INSERT [PTIS].[NatureFactorCVMaster] OFF;
-- [PTIS].[ParkingTypeMaster]




SET IDENTITY_INSERT [PTIS].[ParkingTypeMaster] ON;
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('1','OPK','1','R',N'ओपन पार्किंग');
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('2','SPK','1','R',N'स्टील पार्किंग');
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('3','OPKC','1','C',N'ओपन पार्किंग अनिवासी');
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('4','SPKC','1','C',N'स्टील पार्किंग अनिवासी');
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('5','OPKI','1','I',N'ओपन पार्किंग औदयोगिक');
INSERT INTO [PTIS].[ParkingTypeMaster] ([Id], [TypeOfUseId], [Active], [Type], [Description]) VALUES ('6','SPKI','1','I',N'स्टील पार्किंग औदयोगिक');
SET IDENTITY_INSERT [PTIS].[ParkingTypeMaster] OFF;
-- [PTIS].[PartTypeMaster]



SET IDENTITY_INSERT [PTIS].[PartTypeMaster] ON;
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('1','C');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('2','Government Property');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('3','Individual');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('4','Individual Chal');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('5','Individual Partition');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('6','Industry');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('7','IndustryL');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('8','Plot');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('9','R');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('10','RH');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('11','utilsub');
INSERT INTO [PTIS].[PartTypeMaster] ([PartTypeID], [PartType]) VALUES ('13','Apartment');
SET IDENTITY_INSERT [PTIS].[PartTypeMaster] OFF;



INSERT INTO [PTIS].[SubFloorMaster] ( [SubFloorID], [SubFloorDescription], [SubFloorPercentage]) VALUES ('Loft','LOFT','50.00');
-- [PTIS].[SubFloorMaster]

INSERT INTO [PTIS].[SubFloorMaster] ( [SubFloorID], [SubFloorDescription], [SubFloorPercentage]) VALUES ('Attic','ATTIC','50.00');
INSERT INTO [PTIS].[SubFloorMaster] ( [SubFloorID], [SubFloorDescription], [SubFloorPercentage]) VALUES ('Mezzanine','MEZZANINE','70.00');
-- [PTIS].[SubmissionRemarkMaster]





SET IDENTITY_INSERT [PTIS].[SubmissionRemarkMaster] ON;
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('1','Hall','N','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('2','Kit/Din','N','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('3','BED1','N','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('4','BED2','N','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('5','BED3','N','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('6','Hall Bal ENC','E','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('7','Kit Bal ENC','E','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('8','Hall Bal','O','0');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('9','Bed Bal','O','0');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('10','Kit Bal','O','0');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('11','W/C/Bath','WB','2');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('12','WC','W','2');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('13','BED1 Bal ENC','E','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('14','BED2 Bal ENC','E','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('15','BED3 Bal ENC','E','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('16','Bath','B','2');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('17','Shop','A','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('18','Passage','A','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('19','Office','A','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('20','PSG','A','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('21','Individual','A','1');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('26','Parking','N','3');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('27','Other','N','2');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('28','Rooms','N','4');
INSERT INTO [PTIS].[SubmissionRemarkMaster] ([SubmissionRemarkMasterID], [SubmissionRemark], [RemarkType], [IsAreaRemark]) VALUES ('29','Staire','E','2');
SET IDENTITY_INSERT [PTIS].[SubmissionRemarkMaster] OFF;
-- [PTIS].[UsageCategoryMaster]



INSERT [PTIS].[UsageCategoryMaster] ([UsageCategoryID], [Description], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
  (1, N'1', NULL, NULL, NULL),
  (2, N'2', NULL, NULL, NULL),
  (3, N'3', NULL, NULL, NULL),
  (4, N'4', NULL, NULL, NULL);
-- [PTIS].[PropertyTaxSlabWiseMaster]


SET IDENTITY_INSERT [PTIS].[PropertyTaxSlabWiseMaster] ON;
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('R', '2023', '1.00', '12,001.00', '24.00', '1', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('R', '2023', '12,001.00', '30,001.00', '27.00', '2', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('R', '2023', '30,001.00', '999,999,999.00', '35.00', '3', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('C', '2023', '1.00', '12,001.00', '27.00', '4', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('C', '2023', '12,001.00', '30,001.00', '30.00', '5', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('C', '2023', '30,001.00', '999,999,999.00', '37.00', '6', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('I', '2023', '1.00', '12,001.00', '27.00', '7', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('I', '2023', '12,001.00', '30,001.00', '30.00', '8', NULL, NULL, NULL);
INSERT INTO [PTIS].[PropertyTaxSlabWiseMaster] ([Type], [Year], [MinRV], [MaxRV], [Rate], [Id], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES ('I', '2023', '30,001.00', '999,999,999.00', '37.00', '9', NULL, NULL, NULL);
SET IDENTITY_INSERT [PTIS].[PropertyTaxSlabWiseMaster] OFF;
-- [PTIS].[TaxZoneMaster]




INSERT [PTIS].[TaxZoneMaster] ([TaxZoneNo], [TaxZoneType], [Remark], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
  (N'1', N'1', N'A', NULL, NULL, NULL),
  (N'2', N'2', N'B', NULL, NULL, NULL),
  (N'3', N'3', N'C', NULL, NULL, NULL),
  (N'Z', N'DEFAULT', N'DEFAULT', NULL, NULL, NULL),
  (N'1U', N'1U', N'AU', NULL, NULL, NULL),
  (N'2U', N'2U', N'BU', NULL, NULL, NULL),
  (N'3U', N'3U', N'CU', NULL, NULL, NULL);
-- [PTIS].[RateSectionMaster]


INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'1',  N'UTHALSAR');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'2',  N'NAUPADA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'3',  N'KOPRI');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'4',  N'KALWA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'5',  N'VITAVA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'6',  N'KHAREGAON');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'7',  N'MUMBRA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'8',  N'KAUSA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'9',  N'SHIL');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'10', N'DIVA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'11', N'WAGLE');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'12', N'VARTAK');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'13', N'MAJIWADA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'14', N'BALKUM');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'15', N'MANPADA');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'16', N'KOLSHET');
INSERT INTO [PTIS].[RateSectionMaster] ([RateSectionNo], [Description]) VALUES (N'17', N'OWALA');
-- [PTIS].[TypeOfUseGroupMaster]





SET IDENTITY_INSERT [PTIS].[RateMaster] ON;
INSERT [PTIS].[RateMaster] ([Year], [TaxZoneNo], [ConstructionID], [TypeOfUseGroupID], [RateSquareMeter], [RateSquareFeet], [FloorID], [CreatedBy], [UpdatedBy], [UpdatedDate], [RateRemark], [MinYear], [MaxYear], [RateSectionNo], [Id]) VALUES
(2025, N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824357),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824358),
(2025, N'1', N'A', N'C', 1020.4300, 10983.9085, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824359),
(2025, N'1', N'A', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824360),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824361),
(2025, N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824362),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824363),
(2025, N'1', N'B', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824364),
(2025, N'1', N'B', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824365),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2824366),
(2025, N'1', N'A', N'C', 1130.2200, 12165.6881, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824367),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824368),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824369),
(2025, N'1', N'A', N'C', 807.3000, 8689.7772, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824370),
(2025, N'1', N'B', N'C', 807.3000, 8689.7772, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824371),
(2025, N'1', N'C', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824372),
(2025, N'1', N'D', N'C', 406.8800, 4379.6563, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824373),
(2025, N'1', N'E', N'C', 406.8800, 4379.6563, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824374),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824375),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824376),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824377),
(2025, N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824378),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824379),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824380),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824381),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824382),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824383),
(2025, N'1', N'C', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824384),
(2025, N'1', N'D', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824385),
(2025, N'1', N'E', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824386),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'5', 2824387),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824388),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824389),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824390),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824391),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824392),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824393),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824394),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824395),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824396),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824397),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824398),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'5', 2824399),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824400),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824401),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824402),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824403),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824404),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824405),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824406),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824407),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2824408),
(2025, N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824409),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2824410),
(2025, N'1', N'A', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824411),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2824412),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824413),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2824414),
(2025, N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824415),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824416),
(2025, N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824417),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2824418),
(2025, N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2824419),
(2025, N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824420),
(2025, N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824421),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824422),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824423),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824424),
(2025, N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824425),
(2025, N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824426),
(2025, N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824427),
(2025, N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824428),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824429),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824430),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824431),
(2025, N'1', N'B', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824432),
(2025, N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824433),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824971),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824972),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824973),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824974),
(2025, N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824975),
(2025, N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824976),
(2025, N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824977),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824978),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824979),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824980),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824981),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824982),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824983),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824984),
(2025, N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824985),
(2025, N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824986),
(2025, N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824987),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824988),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824989),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'13', 2824990),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824991),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824992),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824993),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824994),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824995),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824996),
(2025, N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824997),
(2025, N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824998),
(2025, N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2824999),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825000),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825001),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'13', 2825002),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825003),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825004),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825005),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825006),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825007),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825008),
(2025, N'1', N'A', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825009),
(2025, N'1', N'B', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825010),
(2025, N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825011),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825012),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825013),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'13', 2825014),
(2025, N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825015),
(2025, N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825016),
(2025, N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825017),
(2025, N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825018),
(2025, N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825019),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825020),
(2025, N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825021),
(2025, N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825022),
(2025, N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825023),
(2025, N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825024),
(2025, N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825025),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'13', 2825026),
(2025, N'1', N'A', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825027),
(2025, N'1', N'B', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825028),
(2025, N'1', N'C', N'R', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825029),
(2025, N'1', N'D', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825030),
(2025, N'1', N'E', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825031),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825032),
(2025, N'1', N'A', N'C', 1207.7200, 12999.8981, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825033),
(2025, N'1', N'B', N'C', 1207.7200, 12999.8981, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825034),
(2025, N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825035),
(2025, N'1', N'D', N'C', 607.0900, 6534.7168, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825036),
(2025, N'1', N'E', N'C', 607.0900, 6534.7168, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825037),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'13', 2825038),
(2025, N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825039),
(2025, N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825040),
(2025, N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825041),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825042),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825043),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825044),
(2025, N'1', N'A', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825045),
(2025, N'1', N'B', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825046),
(2025, N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824434),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824435),
(2025, N'1', N'A', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824436),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824437),
(2025, N'1', N'B', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2824438),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824439),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824440),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2824441),
(2025, N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824442),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824443),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824444),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824445),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824446),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2824447),
(2025, N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824448),
(2025, N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824449),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824450),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824451),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824452),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824453),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824454),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824455),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824456),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824457),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2824458),
(2025, N'1', N'B', N'R', 213.1300, 2294.1313, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824459),
(2025, N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824460),
(2025, N'1', N'D', N'R', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824461),
(2025, N'1', N'E', N'R', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824462),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824463),
(2025, N'1', N'A', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824464),
(2025, N'1', N'B', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824465),
(2025, N'1', N'C', N'C', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824466),
(2025, N'1', N'D', N'C', 310.0000, 3336.8400, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824467),
(2025, N'1', N'E', N'C', 310.0000, 3336.8400, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2824468),
(2025, N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824469),
(2025, N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824470),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824471),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824472),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824473),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824474),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824475),
(2025, N'1', N'C', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824476),
(2025, N'1', N'D', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824477),
(2025, N'1', N'E', N'C', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824478),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2824479),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824480),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824481),
(2025, N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824482),
(2025, N'1', N'D', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824483),
(2025, N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824484),
(2025, N'1', N'E', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824485),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2824486),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824487),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2824488),
(2025, N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2824489),
(2025, N'1', N'A', N'R', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824490),
(2025, N'1', N'C', N'C', 678.1300, 7299.3913, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824491),
(2025, N'1', N'B', N'R', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824492),
(2025, N'1', N'D', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824493),
(2025, N'1', N'E', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824494),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2824495),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824496),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824497),
(2025, N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824498),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2824499),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824500),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824501),
(2025, N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824502),
(2025, N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2824503),
(2025, N'1', N'D', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2824504),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824505),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824506),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824507),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824508),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824509),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824510),
(2025, N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825047),
(2025, N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825048),
(2025, N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825049),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'14', 2825050),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825051),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825052),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825053),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825054),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825055),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825056),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825057),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825058),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825059),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825060),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825061),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'14', 2825062),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825063),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825064),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825065),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825066),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825067),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825068),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825069),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825070),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825071),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825072),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825073),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'14', 2825074),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825075),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825076),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825077),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825078),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825079),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825080),
(2025, N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825081),
(2025, N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825082),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825083),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825084),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825085),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'14', 2825086),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825087),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825088),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825089),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825090),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825091),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825092),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825093),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825094),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825095),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825096),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825097),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'14', 2825098),
(2025, N'1', N'A', N'R', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825099),
(2025, N'1', N'B', N'R', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825100),
(2025, N'1', N'C', N'R', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825101),
(2025, N'1', N'D', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825102),
(2025, N'1', N'E', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825103),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825104),
(2025, N'1', N'A', N'C', 800.8400, 8620.2418, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825105),
(2025, N'1', N'B', N'C', 800.8400, 8620.2418, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825106),
(2025, N'1', N'C', N'C', 477.9200, 5144.3309, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825107),
(2025, N'1', N'D', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825108),
(2025, N'1', N'E', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825109),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'14', 2825110),
(2025, N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825111),
(2025, N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825112),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825113),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825114),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825115),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825116),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825117),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825118),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825119),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825120),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825121),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825122),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824511),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2824512),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824513),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824514),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824515),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824516),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824517),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824518),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824519),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824520),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824521),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2824522),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824523),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824524),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824525),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824526),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824527),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824528),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824529),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824530),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824531),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824532),
(2025, N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2824533),
(2025, N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824534),
(2025, N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824535),
(2025, N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824536),
(2025, N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824537),
(2025, N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824538),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824539),
(2025, N'1', N'A', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824540),
(2025, N'1', N'B', N'C', 904.1800, 9732.5935, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824541),
(2025, N'1', N'C', N'C', 723.3400, 7786.0318, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824542),
(2025, N'1', N'D', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2824543),
(2025, N'1', N'A', N'C', 1420.8500, 15294.0294, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824544),
(2025, N'1', N'B', N'C', 1420.8500, 15294.0294, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824545),
(2025, N'1', N'C', N'C', 852.5100, 9176.4176, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824546),
(2025, N'1', N'D', N'C', 710.4200, 7646.9609, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824547),
(2025, N'1', N'E', N'C', 710.4200, 7646.9609, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824548),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824549),
(2025, N'1', N'A', N'R', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824550),
(2025, N'1', N'B', N'R', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824551),
(2025, N'1', N'C', N'R', 245.4200, 2641.7009, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824552),
(2025, N'1', N'D', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824553),
(2025, N'1', N'E', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824554),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'2', 2824555),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2824556),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824557),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2824558),
(2025, N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824559),
(2025, N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824560),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824561),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824562),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824563),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824564),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824565),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824566),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824567),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824568),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2824569),
(2025, N'1', N'B', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824570),
(2025, N'1', N'C', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824571),
(2025, N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824572),
(2025, N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824573),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824574),
(2025, N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824575),
(2025, N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824576),
(2025, N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824577),
(2025, N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824578),
(2025, N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824579),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2824580),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824581),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824582),
(2025, N'1', N'C', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824583),
(2025, N'1', N'D', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824584),
(2025, N'1', N'E', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824585),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824586),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824587),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825123),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825124),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825125),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825126),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825127),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825128),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825129),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825130),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825131),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825132),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825133),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825134),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825135),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825136),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825137),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825138),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825139),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825140),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825141),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825142),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825143),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'15', 2825144),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825145),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825146),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825147),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825148),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825149),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825150),
(2025, N'1', N'A', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825151),
(2025, N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825152),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825153),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825154),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825155),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'15', 2825156),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825157),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825158),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825159),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825160),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825161),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825162),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825163),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825164),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825165),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825166),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825167),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'15', 2825168),
(2025, N'1', N'B', N'R', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825169),
(2025, N'1', N'C', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825170),
(2025, N'1', N'D', N'R', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825171),
(2025, N'1', N'E', N'R', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825172),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825173),
(2025, N'1', N'A', N'R', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825174),
(2025, N'1', N'B', N'C', 1110.8400, 11957.0818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825175),
(2025, N'1', N'C', N'C', 671.6700, 7229.8559, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825176),
(2025, N'1', N'D', N'C', 555.4200, 5978.5409, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825177),
(2025, N'1', N'E', N'C', 555.4200, 5978.5409, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825178),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825179),
(2025, N'1', N'A', N'C', 1110.8400, 11957.0818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'15', 2825180),
(2025, N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825181),
(2025, N'1', N'B', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825182),
(2025, N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825183),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825184),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825185),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825186),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825187),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825188),
(2025, N'1', N'A', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825189),
(2025, N'1', N'B', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825190),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825191),
(2025, N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825192),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825193),
(2025, N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825194),
(2025, N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825195),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825196),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'16', 2825197),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825198),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824588),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824589),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824590),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824591),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'7', 2824592),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824593),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824594),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824595),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824596),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824597),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824598),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824599),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824600),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824601),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824602),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824603),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'7', 2824604),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824605),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824606),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824607),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824608),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824609),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824610),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824611),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824612),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824613),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824614),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824615),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'7', 2824616),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824617),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824618),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824619),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824620),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824621),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824622),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824623),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824624),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824625),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824626),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824627),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'7', 2824628),
(2025, N'1', N'A', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824629),
(2025, N'1', N'B', N'R', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824630),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824631),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824632),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824633),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824634),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824635),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824636),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824637),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824638),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824639),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'7', 2824640),
(2025, N'1', N'A', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824641),
(2025, N'1', N'B', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824642),
(2025, N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824643),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824644),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824645),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824646),
(2025, N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824647),
(2025, N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824648),
(2025, N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824649),
(2025, N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824650),
(2025, N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824651),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'7', 2824652),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824653),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824654),
(2025, N'1', N'C', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824655),
(2025, N'1', N'D', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824656),
(2025, N'1', N'E', N'R', 45.2100, 486.6404, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824657),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824658),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824659),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824660),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824661),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824662),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824663),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'8', 2824664),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825199),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825200),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825201),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825202),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825203),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825204),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825205),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825206),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825207),
(2025, N'1', N'C', N'C', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825208),
(2025, N'1', N'D', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825209),
(2025, N'1', N'E', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825210),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'16', 2825211),
(2025, N'1', N'A', N'R', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825212),
(2025, N'1', N'B', N'R', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825213),
(2025, N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825214),
(2025, N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825215),
(2025, N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825216),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825217),
(2025, N'1', N'A', N'C', 794.3800, 8550.7063, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825218),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825219),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825220),
(2025, N'1', N'B', N'C', 794.3800, 8550.7063, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825221),
(2025, N'1', N'C', N'C', 477.9200, 5144.3309, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825222),
(2025, N'1', N'B', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825223),
(2025, N'1', N'D', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825224),
(2025, N'1', N'E', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825225),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825226),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'16', 2825227),
(2025, N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825228),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825229),
(2025, N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825230),
(2025, N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825231),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825232),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825233),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825234),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825235),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825236),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825237),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825238),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825239),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825240),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825241),
(2025, N'1', N'A', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825242),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825243),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825244),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825245),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825246),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825247),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825248),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825249),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825250),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825251),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825252),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825253),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825254),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825255),
(2025, N'1', N'E', N'C', 632.9200, 6812.7509, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2825256),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'2', 2825257),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825258),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825259),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'5', 2825260),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825261),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825262),
(2025, N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2825263),
(2025, N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'15', 2825264),
(2025, N'1', N'A', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'15', 2825265),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825266),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825267),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825268),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825269),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'5', 2825270),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'5', 2825271),
(2025, N'1', N'A', N'R', 213.1300, 2294.1313, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2825272),
(2025, N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825273),
(2025, N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825274),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824665),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824666),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824667),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824668),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824669),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824670),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824671),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824672),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824673),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824674),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824675),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824676),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'8', 2824677),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824678),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824679),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824680),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824681),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824682),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824683),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824684),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824685),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824686),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824687),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'8', 2824688),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824689),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824690),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824691),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824692),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824693),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824694),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824695),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824696),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824697),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824698),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'8', 2824699),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824700),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824701),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824702),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824703),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824704),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824705),
(2025, N'1', N'A', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824706),
(2025, N'1', N'B', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824707),
(2025, N'1', N'C', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824708),
(2025, N'1', N'D', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824709),
(2025, N'1', N'E', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824710),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'8', 2824711),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824712),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824713),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824714),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824715),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824716),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824717),
(2025, N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824718),
(2025, N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824719),
(2025, N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824720),
(2025, N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824721),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824722),
(2025, N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824723),
(2025, N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'8', 2824724),
(2025, N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824725),
(2025, N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824726),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824727),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824728),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824729),
(2025, N'1', N'A', N'C', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824730),
(2025, N'1', N'B', N'C', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824731),
(2025, N'1', N'C', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824732),
(2025, N'1', N'D', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824733),
(2025, N'1', N'E', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824734),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'9', 2824735),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824736),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824737),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824738),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824739),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824740),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2824741),
(2025, N'1', N'B', N'C', 1130.2200, 12165.6881, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'1', 2825275),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825276),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825277),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'5', 2825278),
(2025, N'1', N'A', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'6', 2825279),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2825280),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'6', 2825281),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2825282),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'6', 2825283),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2825284),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'6', 2825285),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'2', 2825286),
(2025, N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825287),
(2025, N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825288),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825289),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825290),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825291),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825292),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'2', 2825293),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825294),
(2025, N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825295),
(2025, N'1', N'A', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825296),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'1', 2825297),
(2025, N'1', N'B', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825298),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825299),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825300),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825301),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825302),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825303),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825304),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825305),
(2025, N'1', N'A', N'C', 355.2100, 3823.4804, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825306),
(2025, N'1', N'B', N'C', 355.2100, 3823.4804, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825307),
(2025, N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825308),
(2025, N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825309),
(2025, N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825310),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'3', 2825311),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825312),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825313),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825314),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825315),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825316),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825317),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825318),
(2025, N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825319),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825320),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825321),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'3', 2825322),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825323),
(2025, N'1', N'C', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825324),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825325),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825326),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825327),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825328),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825329),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825330),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825331),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825332),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825333),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'3', 2825334),
(2025, N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825335),
(2025, N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825336),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825337),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825338),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825339),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825340),
(2025, N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825341),
(2025, N'1', N'C', N'C', 400.4200, 4310.1209, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825342),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825343),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825344),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'3', 2825345),
(2025, N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825346),
(2025, N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825347),
(2025, N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825348),
(2025, N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825349),
(2025, N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825350),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825351),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824742),
(2025, N'1', N'C', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824743),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824744),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824745),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824746),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824747),
(2025, N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824748),
(2025, N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824749),
(2025, N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824750),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824751),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824752),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'9', 2824753),
(2025, N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824754),
(2025, N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824755),
(2025, N'1', N'C', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824756),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824757),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824758),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824759),
(2025, N'1', N'A', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824760),
(2025, N'1', N'B', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824761),
(2025, N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824762),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824763),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824764),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'9', 2824765),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824766),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824767),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824768),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824769),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824770),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824771),
(2025, N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824772),
(2025, N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824773),
(2025, N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824774),
(2025, N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824775),
(2025, N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824776),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'9', 2824777),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824778),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824779),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824780),
(2025, N'1', N'D', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824781),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824782),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824783),
(2025, N'1', N'B', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824784),
(2025, N'1', N'C', N'C', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824785),
(2025, N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824786),
(2025, N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824787),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824788),
(2025, N'1', N'A', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'9', 2824789),
(2025, N'1', N'A', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824790),
(2025, N'1', N'B', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824791),
(2025, N'1', N'C', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824792),
(2025, N'1', N'D', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824793),
(2025, N'1', N'E', N'R', 38.7500, 417.1050, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824794),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824795),
(2025, N'1', N'B', N'C', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824796),
(2025, N'1', N'C', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824797),
(2025, N'1', N'D', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824798),
(2025, N'1', N'E', N'C', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824799),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824800),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824801),
(2025, N'1', N'A', N'C', 109.7900, 1181.7796, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'10', 2824802),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824803),
(2025, N'1', N'C', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824804),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824805),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824806),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824807),
(2025, N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824808),
(2025, N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824809),
(2025, N'1', N'C', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824810),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824811),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824812),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'10', 2824813),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824814),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824815),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824816),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824817),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824818),
(2025, N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825352),
(2025, N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825353),
(2025, N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825354),
(2025, N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825355),
(2025, N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825356),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'3', 2825357),
(2025, N'1', N'A', N'C', 968.7600, 10427.7326, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825358),
(2025, N'1', N'B', N'C', 968.7600, 10427.7326, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825359),
(2025, N'1', N'C', N'C', 581.2600, 6256.6826, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825360),
(2025, N'1', N'D', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825361),
(2025, N'1', N'E', N'C', 484.3800, 5213.8663, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825362),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825363),
(2025, N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825364),
(2025, N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825365),
(2025, N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825366),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825367),
(2025, N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825368),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825369),
(2025, N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825370),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'3', 2825371),
(2025, N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825372),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825373),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825374),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825375),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825376),
(2025, N'1', N'D', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825377),
(2025, N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825378),
(2025, N'1', N'E', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825379),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825380),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825381),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825382),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825383),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825384),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825385),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825386),
(2025, N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825387),
(2025, N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825388),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825389),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825390),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'4', 2825391),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825392),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825393),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825394),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825395),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825396),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825397),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825398),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825399),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825400),
(2025, N'1', N'A', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825401),
(2025, N'1', N'B', N'C', 387.5000, 4171.0500, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825402),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825403),
(2025, N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825404),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825405),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825406),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825407),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825408),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'4', 2825409),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825410),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825411),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825412),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825413),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825414),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825415),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825416),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825417),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825418),
(2025, N'1', N'B', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825419),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825420),
(2025, N'1', N'C', N'C', 335.8400, 3614.9818, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825421),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825422),
(2025, N'1', N'E', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825423),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825424),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825425),
(2025, N'1', N'B', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825426),
(2025, N'1', N'A', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825427),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825428),
(2025, N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824819),
(2025, N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824820),
(2025, N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824821),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824822),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824823),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2824824),
(2025, N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824825),
(2025, N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824826),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824827),
(2025, N'1', N'D', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824828),
(2025, N'1', N'E', N'R', 58.1300, 625.7113, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824829),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824830),
(2025, N'1', N'A', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824831),
(2025, N'1', N'B', N'C', 148.5400, 1598.8846, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824832),
(2025, N'1', N'C', N'C', 122.7100, 1320.8504, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824833),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824834),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824835),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'10', 2824836),
(2025, N'1', N'A', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824837),
(2025, N'1', N'B', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824838),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824839),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824840),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824841),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824842),
(2025, N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824843),
(2025, N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824844),
(2025, N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824845),
(2025, N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824846),
(2025, N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824847),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'10', 2824848),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824849),
(2025, N'1', N'B', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824850),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824851),
(2025, N'1', N'D', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824852),
(2025, N'1', N'E', N'R', 71.0400, 764.6746, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824853),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824854),
(2025, N'1', N'A', N'C', 348.7500, 3753.9450, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824855),
(2025, N'1', N'B', N'C', 348.7500, 3753.9450, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824856),
(2025, N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824857),
(2025, N'1', N'D', N'C', 174.3800, 1877.0263, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824858),
(2025, N'1', N'E', N'C', 174.3800, 1877.0263, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824859),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'10', 2824860),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824861),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824862),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824863),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824864),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824865),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824866),
(2025, N'1', N'A', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824867),
(2025, N'1', N'B', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824868),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824869),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824870),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824871),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'11', 2824872),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824873),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824874),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824875),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824876),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824877),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824878),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824879),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824880),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824881),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824882),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824883),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'11', 2824884),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824885),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824886),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824887),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824888),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824889),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824890),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824891),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824892),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824893),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824894),
(2025, N'1', N'A', N'C', 445.6300, 4796.7613, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'4', 2825429),
(2025, N'1', N'B', N'R', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825430),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825431),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825432);
GO
INSERT [PTIS].[RateMaster] ([Year], [TaxZoneNo], [ConstructionID], [TypeOfUseGroupID], [RateSquareMeter], [RateSquareFeet], [FloorID], [CreatedBy], [UpdatedBy], [UpdatedDate], [RateRemark], [MinYear], [MaxYear], [RateSectionNo], [Id]) VALUES
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825433),
(2025, N'1', N'D', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825434),
(2025, N'1', N'E', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825435),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825436),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825437),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825438),
(2025, N'1', N'E', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'4', 2825439),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825440),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'6', 2825441),
(2025, N'1', N'A', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'6', 2825442),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825443),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825444),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825445),
(2025, N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825446),
(2025, N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825447),
(2025, N'1', N'C', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825448),
(2025, N'1', N'D', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825449),
(2025, N'1', N'E', N'C', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825450),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'17', 2825451),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825452),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825453),
(2025, N'1', N'C', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825454),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825455),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825456),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825457),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825458),
(2025, N'1', N'A', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825459),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825460),
(2025, N'1', N'B', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825461),
(2025, N'1', N'C', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825462),
(2025, N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825463),
(2025, N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825464),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'17', 2825465),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825466),
(2025, N'1', N'B', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825467),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825468),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825469),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825470),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825471),
(2025, N'1', N'A', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825472),
(2025, N'1', N'B', N'C', 155.0000, 1668.4200, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825473),
(2025, N'1', N'C', N'C', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825474),
(2025, N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825475),
(2025, N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825476),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'17', 2825477),
(2025, N'1', N'A', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825478),
(2025, N'1', N'B', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825479),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825480),
(2025, N'1', N'D', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825481),
(2025, N'1', N'E', N'R', 51.6700, 556.1759, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825482),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825483),
(2025, N'1', N'A', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825484),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825485),
(2025, N'1', N'B', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825486),
(2025, N'1', N'C', N'C', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825487),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825488),
(2025, N'1', N'D', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825489),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825490),
(2025, N'1', N'E', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825491),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'17', 2825492),
(2025, N'1', N'C', N'C', 238.9600, 2572.1654, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825493),
(2025, N'1', N'A', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825494),
(2025, N'1', N'B', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825495),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'16', 2825496),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825497),
(2025, N'1', N'C', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825498),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825499),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825500),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825501),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825502),
(2025, N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825503),
(2025, N'1', N'C', N'C', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825504),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824895),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'11', 2824896),
(2025, N'1', N'A', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824897),
(2025, N'1', N'B', N'R', 135.6300, 1459.9213, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824898),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824899),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824900),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824901),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824902),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824903),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824904),
(2025, N'1', N'C', N'C', 271.2500, 2919.7350, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824905),
(2025, N'1', N'D', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824906),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824907),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'11', 2824908),
(2025, N'1', N'A', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824909),
(2025, N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824910),
(2025, N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824911),
(2025, N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824912),
(2025, N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824913),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824914),
(2025, N'1', N'A', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824915),
(2025, N'1', N'B', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824916),
(2025, N'1', N'C', N'C', 413.3400, 4449.1918, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824917),
(2025, N'1', N'D', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824918),
(2025, N'1', N'E', N'C', 361.6700, 3893.0159, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824919),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'11', 2824920),
(2025, N'1', N'A', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824921),
(2025, N'1', N'B', N'R', 368.1300, 3962.5513, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824922),
(2025, N'1', N'C', N'R', 219.5900, 2363.6668, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824923),
(2025, N'1', N'D', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824924),
(2025, N'1', N'E', N'R', 187.2900, 2015.9896, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824925),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824926),
(2025, N'1', N'A', N'C', 936.4700, 10080.1631, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824927),
(2025, N'1', N'B', N'C', 936.4700, 10080.1631, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824928),
(2025, N'1', N'C', N'C', 561.8800, 6048.0763, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824929),
(2025, N'1', N'D', N'C', 471.4600, 5074.7954, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824930),
(2025, N'1', N'E', N'C', 471.4600, 5074.7954, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824931),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'11', 2824932),
(2025, N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824933),
(2025, N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824934),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824935),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824936),
(2025, N'1', N'E', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824937),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824938),
(2025, N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824939),
(2025, N'1', N'B', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824940),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824941),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824942),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824943),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'12', 2824944),
(2025, N'1', N'B', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824945),
(2025, N'1', N'C', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824946),
(2025, N'1', N'D', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824947),
(2025, N'1', N'E', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824948),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824949),
(2025, N'1', N'A', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824950),
(2025, N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824951),
(2025, N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824952),
(2025, N'1', N'D', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824953),
(2025, N'1', N'E', N'C', 452.0900, 4866.2968, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824954),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'12', 2824955),
(2025, N'1', N'A', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824956),
(2025, N'1', N'B', N'R', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824957),
(2025, N'1', N'C', N'R', 206.6700, 2224.5959, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824958),
(2025, N'1', N'D', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824959),
(2025, N'1', N'E', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824960),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824961),
(2025, N'1', N'B', N'C', 1020.4300, 10983.9085, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824962),
(2025, N'1', N'C', N'C', 613.5500, 6604.2522, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824963),
(2025, N'1', N'D', N'C', 510.2100, 5491.9004, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824964),
(2025, N'1', N'E', N'C', 510.2100, 5491.9004, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824965),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'12', 2824966),
(2025, N'1', N'A', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824967),
(2025, N'1', N'B', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824968),
(2025, N'1', N'C', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824969),
(2025, N'1', N'D', N'R', 64.5800, 695.1391, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'13', 2824970),
(2025, N'1', N'C', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825505),
(2025, N'1', N'D', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825506),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'16', 2825507),
(2025, N'1', N'E', N'C', 180.8400, 1946.5618, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825508),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825509),
(2025, N'1', N'C', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825510),
(2025, N'1', N'A', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825511),
(2025, N'1', N'A', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'17', 2825512),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825513),
(2025, N'1', N'C', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'12', 2825514),
(2025, N'1', N'B', N'R', 232.5000, 2502.6300, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825515),
(2025, N'1', N'C', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825516),
(2025, N'1', N'D', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825517),
(2025, N'1', N'E', N'R', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825518),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825519),
(2025, N'1', N'A', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825520),
(2025, N'1', N'B', N'C', 568.3400, 6117.6118, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825521),
(2025, N'1', N'C', N'C', 342.3000, 3684.5172, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825522),
(2025, N'1', N'D', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825523),
(2025, N'1', N'C', N'R', 90.4200, 973.2809, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825524),
(2025, N'1', N'E', N'C', 284.1700, 3058.8059, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825525),
(2025, N'1', N'D', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825526),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2016, 2025, N'17', 2825527),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825528),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825529),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825530),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825531),
(2025, N'1', N'A', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825532),
(2025, N'1', N'B', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825533),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825534),
(2025, N'1', N'C', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825535),
(2025, N'1', N'C', N'R', 96.8800, 1042.8163, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825536),
(2025, N'1', N'D', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825537),
(2025, N'1', N'E', N'C', 116.2500, 1251.3150, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825538),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825539),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825540),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825541),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825542),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825543),
(2025, N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825544),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825545),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825546),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'1', 2825547),
(2025, N'1', N'A', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825548),
(2025, N'1', N'B', N'C', 594.1700, 6395.6459, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825549),
(2025, N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825550),
(2025, N'1', N'B', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825551),
(2025, N'1', N'C', N'R', 103.3300, 1112.2441, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825552),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825553),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825554),
(2025, N'1', N'E', N'C', 193.7500, 2085.5250, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'16', 2825555),
(2025, N'1', N'C', N'C', 419.8000, 4518.7272, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825556),
(2025, N'1', N'A', N'R', 77.5000, 834.2100, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'10', 2825557),
(2025, N'1', N'D', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825558),
(2025, N'1', N'A', N'C', 129.1700, 1390.3859, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'9', 2825559),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825560),
(2025, N'1', N'E', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825561),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825562),
(2025, N'1', N'B', N'C', 374.5900, 4032.0868, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825563),
(2025, N'1', N'A', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825564),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825565),
(2025, N'1', N'C', N'C', 258.3400, 2780.7718, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'2', 2825566),
(2025, N'1', N'E', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825567),
(2025, N'1', N'OP', N'C', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'12', 2825568),
(2025, N'1', N'OP', N'R', 0.0000, 0.0000, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'1', 2825569),
(2025, N'1', N'C', N'C', 290.6300, 3128.3413, N'G', NULL, NULL, NULL, N'YearWise Rate', 1998, 1998, N'2', 2825570),
(2025, N'1', N'A', N'R', 161.4600, 1737.9554, N'G', NULL, NULL, NULL, N'YearWise Rate', 2003, 2004, N'1', 2825571),
(2025, N'1', N'D', N'R', 83.9600, 903.7454, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825572),
(2025, N'1', N'B', N'C', 645.8400, 6951.8218, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825573),
(2025, N'1', N'C', N'R', 167.9200, 1807.4909, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825574),
(2025, N'1', N'C', N'C', 516.6700, 5561.4359, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'4', 2825575),
(2025, N'1', N'B', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825576),
(2025, N'1', N'E', N'C', 226.0400, 2433.0946, N'G', NULL, NULL, NULL, N'YearWise Rate', 1999, 2002, N'12', 2825577),
(2025, N'1', N'D', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825578),
(2025, N'1', N'A', N'C', 322.9200, 3475.9109, N'G', NULL, NULL, NULL, N'YearWise Rate', 1700, 1997, N'4', 2825579),
(2025, N'1', N'E', N'R', 142.0800, 1529.3491, N'G', NULL, NULL, NULL, N'YearWise Rate', 2005, 2015, N'1', 2825580);

SET IDENTITY_INSERT [PTIS].[RateMaster] OFF

SET IDENTITY_INSERT [PTIS].[ActiveTaxesMaster] ON;
GO

INSERT [PTIS].[ActiveTaxesMaster]
(
    [TaxNameID], [TaxName], [TaxNameAlias], [DisplayOrder],
    [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]
)
VALUES
(1,  N'GeneralTax',           N'सामान्य कर रु.',                    1,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(2,  N'StateEducationTax',    N'शिक्षण कर रु.',                      2,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(3,  N'StateEmploymentTax',   N'रोजगार हमी कर रु.',                  3,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(4,  N'SpEducationTax',       N'शिक्षण उपकर रु.',                    4,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(5,  N'DrainCess',            N'घ.क शु. रु.',                       5,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(6,  N'RoadCess',             N'रस्ता कर रु.',                       6,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(7,  N'TreeCess',             N'वृक्ष उपकर रु.',                     7,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(8,  N'SewageDisposalCess',   N'मलप्रवाह सुविधा लाभ कर रु.',         8,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(9,  N'SanitationCess',       N'प्रशासकीय सेवा शुल्क रु.',           9,  1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(10, N'WaterBenefitCess',     N'पाणीपुरवठा लाभ कर रु.',             10, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(11, N'SpWaterCess',          N'मल निस्सा रण लाभ रु.',              11, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(12, N'WaterBill',            N'मागणी नोटीस फी रु.',                12, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(13, N'FireCess',             N'अग्नि. कर रु.',                      13, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(14, N'Penalty',              N'थकीत शास्ती रु.',                    14, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(15, N'BigBuilding',          N'मोठी इमारत कर रु.',                  15, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(16, N'LightCess',            N'विशेष साफसफाई कर रु.',              16, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(17, N'ServiceTax',           N' ',                                  17, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(19, N'IllegalConstPenalty',  N'अनधिकृत बांध काम शास्ती रु. ',      18, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(20, N'Tax1',                 N'कर १ रु.',                           19, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(21, N'Tax2',                 N'कर २ रु.',                           20, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(22, N'Tax3',                 N'कर ४ रु..',                          21, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(23, N'Tax4',                 N'कर ४ रु.',                           22, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(24, N'Tax5',                 N'कर ५ रु.',                           23, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(25, N'Tax6',                 N'कर ५ रु.',                           24, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(26, N'Tax7',                 N'कर ६ रु.',                           25, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(27, N'Tax8',                 N'कर ७ रु.',                           26, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(28, N'Tax9',                 N'कर ९ रु.',                           27, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(29, N'Tax10',                N'कर १० रु.',                          28, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(30, N'Interest',             N'चालू मा.कर शास्ती रु.',              29, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(31, N'Discount',             N'विशेष सूट रु.',                      30, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(32, N'TaxTotal',             N'एकूण कर रु.',                         31, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL),
(33, N'NetTotal',             N'निव्वळ एकूण कर रु.',                  32, 1, NULL, CAST(N'2026-01-28T15:29:24.287' AS DateTime), NULL, NULL);

GO
SET IDENTITY_INSERT [PTIS].[ActiveTaxesMaster] OFF;
GO



INSERT [PTIS].[RateSectionDetails] ([RateSectionNo], [WardNo]) VALUES
  (N'1', N'NK10'),
  (N'1', N'NK11'),
  (N'1', N'NK12'),
  (N'1', N'NK131'),
  (N'1', N'NK132'),
  (N'1', N'NK133'),
  (N'1', N'NK134'),
  (N'1', N'NK135'),
  (N'1', N'NK136'),
  (N'1', N'NKMAJOR3'),
  (N'1', N'UT115'),
  (N'1', N'UT116'),
  (N'1', N'UT117'),
  (N'1', N'UT118'),
  (N'1', N'UT119'),
  (N'1', N'UT120'),
  (N'1', N'UT121'),
  (N'1', N'UT122'),
  (N'1', N'UT123'),
  (N'1', N'UT124'),
  (N'1', N'UT125'),
  (N'1', N'UT126'),
  (N'1', N'UT127'),
  (N'1', N'UT128'),
  (N'1', N'UT129'),
  (N'1', N'UT130'),
  (N'1', N'UTMAJOR2'),
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
  (N'2', N'NK13'),
  (N'2', N'NK14'),
  (N'2', N'NK15'),
  (N'2', N'NK16'),
  (N'2', N'NK17'),
  (N'2', N'NK18'),
  (N'2', N'NK19'),
  (N'2', N'NK20'),
  (N'2', N'NK25'),
  (N'2', N'NK26'),
  (N'2', N'NK27'),
  (N'2', N'NK28'),
  (N'2', N'NK29'),
  (N'2', N'NK30'),
  (N'2', N'NK31'),
  (N'2', N'NK32'),
  (N'2', N'NK8'),
  (N'2', N'NK9'),
  (N'2', N'NKMAJOR1'),
  (N'2', N'UTMAJOR1'),
  (N'3', N'NK5'),
  (N'3', N'NK6'),
  (N'3', N'NK7'),
  (N'3', N'NKMAJOR2'),
  (N'4', N'KL137'),
  (N'4', N'KL138'),
  (N'4', N'KL142'),
  (N'4', N'KL143'),
  (N'4', N'KL144'),
  (N'4', N'KL145'),
  (N'4', N'KL146'),
  (N'4', N'KL147'),
  (N'4', N'KL148'),
  (N'4', N'KL149'),
  (N'4', N'KL150'),
  (N'4', N'KL151'),
  (N'4', N'KLMAJOR2'),
  (N'5', N'KL139'),
  (N'5', N'KL140'),
  (N'5', N'KL141'),
  (N'5', N'KLMAJOR1'),
  (N'5', N'TEST'),
  (N'6', N'KL152'),
  (N'6', N'KL153'),
  (N'6', N'KL154'),
  (N'6', N'KL155'),
  (N'6', N'KL156'),
  (N'6', N'KLMAJOR3'),
  (N'7', N'MU157'),
  (N'7', N'MU158'),
  (N'7', N'MU159'),
  (N'7', N'MU160'),
  (N'7', N'MU163'),
  (N'7', N'MU164'),
  (N'7', N'MU165'),
  (N'7', N'MU166'),
  (N'7', N'MU167'),
  (N'7', N'MU168'),
  (N'7', N'MUMAJOR1'),
  (N'8', N'MUMAJOR2'),
  (N'8', N'MUMAJOR3'),
  (N'9', N'DI172'),
  (N'9', N'DI174'),
  (N'9', N'DIMAJOR2'),
  (N'9', N'MUMAJOR4');
-- [PTIS].[YearMaster]


INSERT INTO [PTIS].[YearMaster] (  [Year], [IsActive]) VALUES ( '2022','0');
INSERT INTO [PTIS].[YearMaster] (  [Year], [IsActive]) VALUES ( '2023','0');
INSERT INTO [PTIS].[YearMaster] (  [Year], [IsActive]) VALUES ( '2024','0');
INSERT INTO [PTIS].[YearMaster] (  [Year], [IsActive]) VALUES ( '2025','1');





-- SET IDENTITY_INSERT [PTIS].[TaxPercentageMasterCV] ON
-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
--   (1, N'C', N'अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL);
-- -- [PTIS].[TaxPercentageMasterCV]


-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES
--   (2, N'T', N'धार्मिक स्थळ', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '','',NULL,Getdate(),NULL,NULL);

-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
--   (3, N'V', N'V-व्हरांडा टॉयल॓ट बाथ', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (4, N'R', N'निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (5, N'UC', N'बांधकाम चालू ', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (6, N'SPK', N'स्टील पार्किंग ', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (7, N'N', N'मनपा मालमत्ता', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (8, N'EG', N'शैक्षणिक शासकीय ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (9, N'GO', N'गोडाऊन', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (10, N'GR', N'शासकीय निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (11, N'HO', N'खाजगी वसतिगृह', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (12, N'LB', N'वाचनालय/लायब्ररी ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (13, N'UCC', N'बांधकाम चालु-अनिवासी ', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (14, N'MTR', N'टॉवर जागा', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (15, N'FF', N'स्वातंत्र्य सैनिक', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (16, N'WGC', N'WGC-व्हरांडा  शासकीय अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (17, N'WEG', N'WEG-व्हरांडा शैक्षणीक शासकीय', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (18, N'WEP', N'WEP-व्हरांडा खाजगी शैक्षणीक ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (19, N'WGR', N'WGR-व्हरांडा शासकीय निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (20, N'PC', N'पार्किंग अनिवासी', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (21, N'S', N'दुकान', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (22, N'D', N'दवाखाना', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (23, N'B', N'बँक', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (24, N'SW', N'जलतरण तलाव', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (25, N'I', N'कारखाना', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (26, N'EP', N'खाजगी शैक्षणिक', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (27, N'WR', N'WR-व्हरांडा निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (28, N'WC', N'WC-व्हरांडा अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (29, N'CC', N'कोचिंग क्लासेस', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (30, N'CG', N'केंद्र शासकीय मालमत्ता', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (31, N'CR', N'केंद्र शासकीय मालमत्ता निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (32, N'OPR', N'खुला भूखंड निवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (33, N'OPC', N'खुला भूखंड अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (34, N'PTR', N'पेट्रोल पंप', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (35, N'GC', N'शासकीय अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (36, N'O', N'ऑफिस', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (37, N'M', N'मंगल कार्यालय', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (38, N'KT', N'मल्टीप्लेक्स', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (39, N'H', N'हॉटेल', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (40, N'OPK', N'ओपन पार्किंग', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (41, N'WI', N'WI-व्हरांडा औद्योगिक', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (42, N'OP', N'खुला भूखंड', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (43, N'WCGR', N'WCGR-केंद्र शासकीय मालमत्ता', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (44, N'WCGC', N'WCGC-केंद्र शासकीय मालमत्ता', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (45, N'CH', N'सामाजिक सभागृह', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (46, N'L', N'लॉज', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (47, N'AG', N'शेती', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (48, N'ACH', N'क्लब हाऊस ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (49, N'AGM', N'सोसायटी जिम', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (50, N'AH', N'कॉमन हॉल', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (51, N'AMH', N'मल्टीपर्पज हॉल', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (52, N'AO', N'सोसायटी ऑफीस ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (53, N'APG', N'खेळाचे मैदान', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (54, N'ASW', N'सोसायटी स्विमिंग पूल', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (55, N'AWC', N'वॉचमन कॅबिन', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (56, N'CCO', N'C-कॉरिडॉर', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (57, N'CCR', N'CCR-ट्युशन क्लासेस ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (58, N'CGC', N'केंद्र शासन वाणिज्य मालमत्ता', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (59, N'ENCC', N'ENCC', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (60, N'ENCEG', N'ENCEG', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (61, N'ENCEP', N'ENCEP', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (62, N'ENCI', N'ENCI', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (63, N'ENCR', N'ENCR', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (64, N'GM', N'व्यायाम शाळा ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (65, N'GMR', N'GMR-व्यायाम शाळा', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (66, N'KTR', N'KTR-टॉकीज/चित्रपट गृह', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (67, N'NPD', N'न.प.दुकान गाळे', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (68, N'OBR', N'OBR', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (69, N'OPKC', N'ओपन पार्किंग अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (70, N'RCO', N'R-कॉरिडॉर', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (71, N'RGN', N'जनरेटर रूम/मिटर रूम', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (72, N'SPKC', N'स्टील पार्किंग अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (73, N'WT', N'R-टॉवर', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (74, N'PG', N'पेयिंग गेस्ट', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (75, N'GA', N'गार्डन', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (76, N'RFG', N'रिफ्युज एरिया', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (77, N'PH', N'पंप हाऊस रूम', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (78, N'SR', N' स्टोअर रूम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (79, N'WAT', N' वॉटर टॅंक', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (80, N'ISR', N'इनडोअर स्पोर्ट रूम ', N'N',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (81, N'EHO', N'शैक्षणिक संस्था-वसतिगृह', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (82, N'PF', N'पोल्ट्रीफार्म', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (83, N'NR', N'सर्व्हेक्षण निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (84, N'NC', N'सर्व्हेक्षण अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (85, N'NI', N'सर्व्हेक्षण औद्योगिक', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (86, N'ICR', N'अनधिकृत बांधकाम निवासी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (87, N'ICC', N'अनधिकृत बांधकाम अनिवासी ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (88, N'ICI', N'अनधिकृत बांधकाम औद्योगिक', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (89, N'ICRT', N'निवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (90, N'ICCT', N'अनिवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (91, N'ICIT', N'औद्योगिक शास्तीस पात्र अनधिकृत बांधकाम ', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (92, N'ICHT', N'हॉटेल शास्तीस पात्र अनधिकृत बांधकाम', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (93, N'ICH', N'हॉटेल अनधिकृत बांधकाम', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (94, N'ICP', N'अनधिकृत बांधकाम निवासी पार्किंग', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (95, N'ICPRT', N'निवासी पार्किंग शास्तीस पात्र अनधिकृत बांधकाम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (96, N'OAH', N'वृद्धाश्रम', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (97, N'ABLC', N'टेरेस-बाल्कनी अनिवासी', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (98, N'ABLOP', N'ओपन टेरेस', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (99, N'ABLR', N'टेरेस-बाल्कनी ', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (100, N'ACHC', N'क्लब हाऊस C', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (101, N'ASWC', N'सोसायटी स्विमिंग पूल C', N'C',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (102, N'AWA', N'वेटिंग एरिया', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (103, N'FCR', N'फायर कंट्रोल रूम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL);

-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (104, N'FIRR', N'फायर रूम
-- ', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL)
-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (105, N'GRR', N'गारबेज रूम
-- ', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL)
-- INSERT [PTIS].[TaxPercentageMasterCV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
--   (106, N'IT', N'माहिती व तंत्रज्ञान उद्योग', N'I',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (107, N'LR', N'लिफ्ट रूम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (108, N'MR', N'Mail रूम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (109, N'OL', N'ओपनिंग लॉबी', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (110, N'OWC', N'सेंद्रिय कचरा कन्व्हर्टर रूम', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (111, N'SI', N'सामाजिक संस्था', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
--   (112, N'TL', N'टेरेस लिफ्ट', N'R',1800,2028, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL);

-- SET IDENTITY_INSERT [PTIS].[TaxPercentageMasterCV] OFF


SET IDENTITY_INSERT [PTIS].[TaxPercentageMasterRV] ON
INSERT [PTIS].[TaxPercentageMasterRV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
  (1, N'C', N'अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (2, N'T', N'धार्मिक स्थळ', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (3, N'V', N'V-व्हरांडा टॉयल॓ट बाथ', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (4, N'R', N'निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (5, N'UC', N'बांधकाम चालू ', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (6, N'SPK', N'स्टील पार्किंग ', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (7, N'N', N'मनपा मालमत्ता', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (8, N'EG', N'शैक्षणिक शासकीय ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (9, N'GO', N'गोडाऊन', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (10, N'GR', N'शासकीय निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (11, N'HO', N'खाजगी वसतिगृह', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (12, N'LB', N'वाचनालय/लायब्ररी ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (13, N'UCC', N'बांधकाम चालु-अनिवासी ', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (14, N'MTR', N'टॉवर जागा', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (15, N'FF', N'स्वातंत्र्य सैनिक', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (16, N'WGC', N'WGC-व्हरांडा  शासकीय अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (17, N'WEG', N'WEG-व्हरांडा शैक्षणीक शासकीय', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (18, N'WEP', N'WEP-व्हरांडा खाजगी शैक्षणीक ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (19, N'WGR', N'WGR-व्हरांडा शासकीय निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (20, N'PC', N'पार्किंग अनिवासी', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (21, N'S', N'दुकान', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (22, N'D', N'दवाखाना', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (23, N'B', N'बँक', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (24, N'SW', N'जलतरण तलाव', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (25, N'I', N'कारखाना', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (26, N'EP', N'खाजगी शैक्षणिक', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (27, N'WR', N'WR-व्हरांडा निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (28, N'WC', N'WC-व्हरांडा अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (29, N'CC', N'कोचिंग क्लासेस', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (30, N'CG', N'केंद्र शासकीय मालमत्ता', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (31, N'CR', N'केंद्र शासकीय मालमत्ता निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (32, N'OPR', N'खुला भूखंड निवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (33, N'OPC', N'खुला भूखंड अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (34, N'PTR', N'पेट्रोल पंप', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (35, N'GC', N'शासकीय अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (36, N'O', N'ऑफिस', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (37, N'M', N'मंगल कार्यालय', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (38, N'KT', N'मल्टीप्लेक्स', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (39, N'H', N'हॉटेल', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (40, N'OPK', N'ओपन पार्किंग', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (41, N'WI', N'WI-व्हरांडा औद्योगिक', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (42, N'OP', N'खुला भूखंड', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (43, N'WCGR', N'WCGR-केंद्र शासकीय मालमत्ता', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (44, N'WCGC', N'WCGC-केंद्र शासकीय मालमत्ता', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (45, N'CH', N'सामाजिक सभागृह', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (46, N'L', N'लॉज', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (47, N'AG', N'शेती', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (48, N'ACH', N'क्लब हाऊस ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (49, N'AGM', N'सोसायटी जिम', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (50, N'AH', N'कॉमन हॉल', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (51, N'AMH', N'मल्टीपर्पज हॉल', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (52, N'AO', N'सोसायटी ऑफीस ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (53, N'APG', N'खेळाचे मैदान', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (54, N'ASW', N'सोसायटी स्विमिंग पूल', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (55, N'AWC', N'वॉचमन कॅबिन', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (56, N'CCO', N'C-कॉरिडॉर', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (57, N'CCR', N'CCR-ट्युशन क्लासेस ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (58, N'CGC', N'केंद्र शासन वाणिज्य मालमत्ता', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (59, N'ENCC', N'ENCC', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (60, N'ENCEG', N'ENCEG', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (61, N'ENCEP', N'ENCEP', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (62, N'ENCI', N'ENCI', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (63, N'ENCR', N'ENCR', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (64, N'GM', N'व्यायाम शाळा ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (65, N'GMR', N'GMR-व्यायाम शाळा', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (66, N'KTR', N'KTR-टॉकीज/चित्रपट गृह', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (67, N'NPD', N'न.प.दुकान गाळे', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (68, N'OBR', N'OBR', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (69, N'OPKC', N'ओपन पार्किंग अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (70, N'RCO', N'R-कॉरिडॉर', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (71, N'RGN', N'जनरेटर रूम/मिटर रूम', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (72, N'SPKC', N'स्टील पार्किंग अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (73, N'WT', N'R-टॉवर', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (74, N'PG', N'पेयिंग गेस्ट', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (75, N'GA', N'गार्डन', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (76, N'RFG', N'रिफ्युज एरिया', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (77, N'PH', N'पंप हाऊस रूम', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (78, N'SR', N' स्टोअर रूम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (79, N'WAT', N' वॉटर टॅंक', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (80, N'ISR', N'इनडोअर स्पोर्ट रूम ', N'N',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (81, N'EHO', N'शैक्षणिक संस्था-वसतिगृह', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (82, N'PF', N'पोल्ट्रीफार्म', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (83, N'NR', N'सर्व्हेक्षण निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (84, N'NC', N'सर्व्हेक्षण अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (85, N'NI', N'सर्व्हेक्षण औद्योगिक', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (86, N'ICR', N'अनधिकृत बांधकाम निवासी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (87, N'ICC', N'अनधिकृत बांधकाम अनिवासी ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (88, N'ICI', N'अनधिकृत बांधकाम औद्योगिक', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (89, N'ICRT', N'निवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (90, N'ICCT', N'अनिवासी शास्तीस पात्र अनधिकृत बांधकाम ', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (91, N'ICIT', N'औद्योगिक शास्तीस पात्र अनधिकृत बांधकाम ', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (92, N'ICHT', N'हॉटेल शास्तीस पात्र अनधिकृत बांधकाम', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (93, N'ICH', N'हॉटेल अनधिकृत बांधकाम', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (94, N'ICP', N'अनधिकृत बांधकाम निवासी पार्किंग', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (95, N'ICPRT', N'निवासी पार्किंग शास्तीस पात्र अनधिकृत बांधकाम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (96, N'OAH', N'वृद्धाश्रम', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (97, N'ABLC', N'टेरेस-बाल्कनी अनिवासी', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (98, N'ABLOP', N'ओपन टेरेस', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (99, N'ABLR', N'टेरेस-बाल्कनी ', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (100, N'ACHC', N'क्लब हाऊस C', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (101, N'ASWC', N'सोसायटी स्विमिंग पूल C', N'C',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (102, N'AWA', N'वेटिंग एरिया', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (103, N'FCR', N'फायर कंट्रोल रूम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL);
-- [PTIS].[TaxPercentageMasterRV]


INSERT [PTIS].[TaxPercentageMasterRV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (104, N'FIRR', N'फायर रूम
', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL)
INSERT [PTIS].[TaxPercentageMasterRV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (105, N'GRR', N'गारबेज रूम
', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL)
INSERT [PTIS].[TaxPercentageMasterRV] ([Id], [TypeOfUseId], [Description], [Type],[FromYear],[ToYear], [GeneralTax], [TreeCess], [SpWaterCess], [RoadCess], [FireCess], [LightCess], [WaterBenefitCess], [SewageDisposalCess], [SpEducationTax], [SanitationCess], [DrainCess], [WaterBill], [BigBuilding], [IllegalConstPenalty], [UserCharges], [ServiceTax], [Tax1], [Tax2], [Tax3], [Tax4], [Tax5], [Tax6], [Tax7], [Tax8], [Tax9], [Tax10], [OldPenalty], [EffectiveFrom], [EffectiveTo], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES
  (106, N'IT', N'माहिती व तंत्रज्ञान उद्योग', N'I',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (107, N'LR', N'लिफ्ट रूम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (108, N'MR', N'Mail रूम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (109, N'OL', N'ओपनिंग लॉबी', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (110, N'OWC', N'सेंद्रिय कचरा कन्व्हर्टर रूम', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (111, N'SI', N'सामाजिक संस्था', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL),
  (112, N'TL', N'टेरेस लिफ्ट', N'R',1800,2028,  1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, 1.0000, '', '', NULL, NULL, NULL);

SET IDENTITY_INSERT [PTIS].[TaxPercentageMasterRV] OFF



---- global master data -- start----------

GO
SET IDENTITY_INSERT [PTIS].[GenderMaster] ON 
GO
INSERT [PTIS].[GenderMaster] ([GenderID], [GenderName]) VALUES (1, N'Female')
GO
INSERT [PTIS].[GenderMaster] ([GenderID], [GenderName]) VALUES (2, N'Male')
GO
INSERT [PTIS].[GenderMaster] ([GenderID], [GenderName]) VALUES (3, N'Transgender')
GO
INSERT [PTIS].[GenderMaster] ([GenderID], [GenderName]) VALUES (4,N'फर्म')
GO
SET IDENTITY_INSERT [PTIS].[GenderMaster] OFF



SET IDENTITY_INSERT [PTIS].[DocumentMaster] ON 
GO
INSERT [PTIS].[DocumentMaster] ([DocID], [DocumentName], [DocPrefix]) VALUES (1, N'Aadhar Card', N'ADR')
GO
INSERT [PTIS].[DocumentMaster] ([DocID], [DocumentName], [DocPrefix]) VALUES (2, N'Index2', N'IND2')
GO
INSERT [PTIS].[DocumentMaster] ([DocID], [DocumentName], [DocPrefix]) VALUES (4, N'Satbara Utara', N'712')
GO
INSERT [PTIS].[DocumentMaster] ([DocID], [DocumentName], [DocPrefix]) VALUES (5, N'Kharidi Khat', N'KHAT')
GO
SET IDENTITY_INSERT [PTIS].[DocumentMaster] OFF


GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'कायम','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'बाल्कनी close केली','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'बाल्कनी close  होती  Open केली','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'क्षेत्रफळात बदल','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'वापरात बदल','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'अतिरिक्त बांधकाम केले','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'BHK बदल','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'भाडे माहिती बदल','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'बाह्य मोजणीचे अंतर्गत मोजणी केली','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'मालमत्ता वगळणे','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'इतर','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'नव्याने सर्वेक्षण पूर्ण','SurveyApp')
GO
INSERT [PTIS].[PropertyVisitMeasurementMaster] ([PropertyVisitAndMeasurement],[Flag]) VALUES (N'प्लॉट वर नवीन बांधकाम केले','SurveyApp')

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
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (1, N'Pilot', N'SocietyName', N'SocietyName', 1, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (2, N'Pilot', N'SecretoryName', N'SecretoryName', 2, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (3, N'Pilot', N'MobileNo', N'MobileNo', 3, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (4, N'Pilot', N'EmailID', N'EmailID', 4, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (5, N'Pilot', N'Address', N'Address', 5, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (6, N'Pilot', N'Pincode', N'Pincode', 6, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (7, N'Pilot', N'OwnerName', N'OwnerName', 7, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (8, N'Pilot', N'OccupierName', N'OccupierName', 8, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (9, N'Pilot', N'ShopName', N'ShopName', 9, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (10, N'Pilot', N'BuildingPhoto', N'BuildingPhoto', 10, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (11, N'Pilot', N'WingPhoto', N'WingPhoto', 11, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (12, N'Pilot', N'WingBoardPhoto', N'WingBoardPhoto', 12, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (13, N'SocietyCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (14, N'SocietyCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (15, N'SocietyCommon', N'BlockNo', N'BlockNo', 3, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (16, N'SocietyCommon', N'SocietyName', N'SocietyName', 4, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (17, N'SocietyCommon', N'SecretoryName', N'SecretoryName', 5, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (18, N'SocietyCommon', N'MobileNo', N'MobileNo', 6, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (19, N'SocietyCommon', N'EmailID', N'EmailID', 7, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (20, N'SocietyCommon', N'Address', N'Address', 8, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (21, N'SocietyCommon', N'Pincode', N'Pincode', 9, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (22, N'SocietyCommon', N'OCCertificate', N'OCCertificate', 10, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (23, N'SocietyCommon', N'OCDate', N'OCDate', 11, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (24, N'SocietyCommon', N'AminityArea', N'AminityArea', 12, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (25, N'SocietyCommon', N'BuildingPhoto', N'BuildingPhoto', 13, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (26, N'SocietyCommon', N'GreenProperty', N'GreenProperty', 14, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (27, N'SocietyCommon', N'BuildingYear', N'BuildingYear', 15, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (28, N'WingCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (29, N'WingCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (30, N'WingCommon', N'BlockNo', N'BlockNo', 3, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (31, N'WingCommon', N'SocietyName', N'SocietyName', 4, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (32, N'WingCommon', N'SecretoryName', N'SecretoryName', 5, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (33, N'WingCommon', N'MobileNo', N'MobileNo', 6, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (34, N'WingCommon', N'EmailID', N'EmailID', 7, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (35, N'WingCommon', N'Address', N'Address', 8, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (36, N'WingCommon', N'Pincode', N'Pincode', 9, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (37, N'WingCommon', N'OCCertificate', N'OCCertificate', 10, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (38, N'WingCommon', N'OCDate', N'OCDate', 11, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (39, N'WingCommon', N'AminityArea', N'AminityArea', 12, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (40, N'WingCommon', N'BuildingPhoto', N'BuildingPhoto', 13, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (41, N'WingCommon', N'GreenProperty', N'GreenProperty', 14, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (42, N'WingCommon', N'WingYear', N'WingYear', 15, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (43, N'WingGeneration', N'Year', N'Year', 1, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (44, N'IndividualCommon', N'SurveyNo', N'SurveyNo', 1, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (45, N'IndividualCommon', N'PlotNo', N'PlotNo', 2, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (46, N'IndividualCommon', N'MobileNo', N'MobileNo', 3, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (47, N'IndividualCommon', N'EmailID', N'EmailID', 4, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (48, N'IndividualCommon', N'Address', N'Address', 5, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (49, N'IndividualCommon', N'Pincode', N'Pincode', 6, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (50, N'IndividualCommon', N'OwnerName', N'OwnerName', 7, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (51, N'IndividualCommon', N'OccupierName', N'OccupierName', 1, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (52, N'IndividualCommon', N'ShopName', N'ShopName', 9, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (53, N'IndividualCommon', N'BuildingPhoto', N'BuildingPhoto', 10, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (54, N'IndividualCommon', N'BlockNo', N'BlockNo', 11, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (55, N'IndividualCommon', N'Year', N'Year', 12, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (56, N'IndividualCommon', N'TotalArea', N'TotalArea', 13, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (57, N'IndividualCommon', N'Photo', N'Photo', 14, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (58, N'IndividualCommon', N'Sign', N'Sign', 15, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (59, N'FlatCommon', N'OwnerName', N'OwnerName', 1, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (60, N'FlatCommon', N'OccupierName', N'OccupierName', 2, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (61, N'FlatCommon', N'ShopName', N'ShopName', 3, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (62, N'FlatCommon', N'MobileNo', N'MobileNo', 4, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (63, N'FlatCommon', N'EmailID', N'EmailID', 5, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (64, N'FlatCommon', N'Photo', N'Photo', 6, NULL, NULL, NULL, 1, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (65, N'FlatCommon', N'Sign', N'Sign', 7, NULL, NULL, NULL, 0, 1)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (66, N'FlatCommon', N'FlatArea', N'FlatArea', 8, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (67, N'FlatCommon', N'AmenityDirectSubmission', N'AmenityDirectSubmission', 9, NULL, NULL, NULL, 0, 0)
GO
INSERT [PTIS].[MobileScreenValidationMaster] ([TabScreenID], [TabScreenName], [Flag], [Alias], [DefaultSequenceNo], [CreatedBy], [UpdatedBy], [UpdatedDate], [DefaultNumberingAccess], [DefaultSurveyAccess]) VALUES (68, N'IndividualCommon', N'DirectIndividualSubmission', N'DirectIndividualSubmission', 16, NULL, NULL, NULL, 0, 0)
GO
SET IDENTITY_INSERT [PTIS].[MobileScreenValidationMaster] OFF
GO


GO
INSERT INTO [PTIS].BlockMaster (WardNo, BlockNo)
VALUES
('UT1', 1),
('UT1', 2),
('UT1', 3),
('UT1', 4),
('UT1', 5),
('UT1', 6),
('UT1', 7),
('UT1', 8),
('UT1', 9),
('UT1', 10),
('UT1', 11),
('UT1', 12),
('UT1', 13),
('UT1', 14),
('UT1', 15),
('UT1', 16),
('UT1', 17);
GO
----- global master-- end---


INSERT INTO [PTIS].[RuleMaster]
(RuleCode,Category,DisplayName,Description,DataType,DefaultValue,IsActive)
VALUES
('AppealCommittee', 'Policy', 'IsAppealCommittee', 'Appeal Committee Enabled', 'bit', NULL, 0),
('AsPerOldApply', 'Policy', 'AsPerOldApply', 'As Per Old Policy', 'bit', NULL, 0),
('AsPerOldForNewProperty', 'Policy', 'AsPerOldForNewProperty', 'As Per Old For New Property', 'bit', NULL, 0),
('AssessmentCompleted', 'Workflow', 'AssessmentCompleted', 'Assessment Completed', 'bit', NULL, 0),
('BigBuildingTaxApply', 'Calculation', 'BigBuildingTaxApply', 'Big Building Tax Applicable', 'bit', NULL, 1),
('CalOnRenterRent', 'Calculation', 'CalOnRenterRent', 'Calc On Renter Rent', 'bit', NULL, 1),
('CalOnSingleRenterRent', 'Calculation', 'CalOnSingleRenterRent', 'Calc On Single Renter Rent', 'bit', NULL, 1),
('CVForPlot', 'Calculation', 'CVForPlot', 'CV With Open Plot', 'bit', NULL, 0),
('DataEntryLock', 'Locking', 'DataEntryLock', 'Data Entry Lock', 'bit', NULL, 0),
('EduEmpOnRV', 'Calculation', 'EduEmpOnRV', 'Edu/Emp Tax on RV', 'bit', NULL, 0),
('EnableLanguage', 'Security', 'EnableLanguage', 'Enable Language Support', 'bit', NULL, 1),
('HearingApply', 'Policy', 'IsHearing', 'Hearing Enabled', 'bit', NULL, 0),
('HistoryLock', 'Locking', 'HistoryLock', 'Add History Lock', 'bit', NULL, 1),
('MaintainanceApply', 'Calculation', 'MaintainanceApply', 'Maintenance Applied', 'bit', NULL, 1),
('MaintainancePercentage', 'Calculation', 'MaintainancePercentage', 'MaintainancePercentage', 'int', '10', 1),
('MinimumRVApply', 'Policy', 'MinimumRVApply', 'Use Minimum RV', 'bit', NULL, 1),
('MixAssessmentApply', 'Policy', 'MixAssessmentApply', 'Mixed Assessment', 'bit', NULL, 0),
('PenaltyMonthly', 'AMC', 'PenaltyMonthly', 'Penalty Monthly', 'bit', NULL, 1),
('PlotTaxApplicable', 'Policy', 'PlotTaxApplicable', 'Plot Tax Applicable', 'bit', NULL, 1),
('PolicyLock', 'Locking', 'PolicyLock', 'Policy Lock', 'bit', NULL, 1),
('RetaintionPolicyApply', 'Policy', 'RetaintionPolicyApply', 'Retention (old)', 'bit', NULL, 1),
('SectorWisePenalty', 'System', 'SectorWisePenalty', 'Sector-wise Penalty', 'bit', NULL, 0),
('ShowPhotoAndPlan', 'System', 'ShowPhotoAndPlan', 'Show Photo And Plan', 'bit', NULL, 1),
('TaxesOnCV', 'Calculation', 'TaxesOnCV', 'Taxes On CV', 'bit', NULL, 0),
('TaxesOnRV', 'Calculation', 'TaxesOnRV', 'Taxes On RV', 'bit', NULL, 1),
('TaxOnBuiltUpArea', 'Calculation', 'TaxOnBuiltUpArea', 'TaxOnBuiltUpArea', 'bit', NULL, 0),
('TaxOnToilet', 'Calculation', 'TaxOnToilet', 'Tax On Toilet', 'bit', NULL, 0),
('UserChargesOnPropertyType', 'Calculation', 'UserChargesOnPropertyType', 'UserChargesOnPropertyType', 'bit', NULL, 1);


GO