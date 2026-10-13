SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ============================================================================
   RTS Module Master Seed Data - 100% Live Reference Master Seed
   Target: Clean RTS Module Masters with Booleans Properly Preserved
   ============================================================================ */

/* ----------------------------------------------------------------------------
   Table: [RTS].[DepartmentMaster] (13 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[DepartmentMaster] ON;
GO
MERGE INTO [RTS].[DepartmentMaster] AS target
USING (VALUES
    (1, N'PTAX', N'Property Tax', N'मालमत्ता कर', N'Home', 1, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (2, N'WATER', N'Water Connection', N'पाणी पुरवठा', N'Droplets', 2, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (3, N'TRADE', N'Trade License', N'व्यवसाय परवाना', N'Briefcase', 3, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (4, N'TP', N'Town Planning', N'नगर रचना', N'Map', 4, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (5, N'BND', N'Birth & Death', N'जन्म आणि मृत्यू', N'HeartPulse', 5, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (6, N'EDU', N'Education', N'शिक्षण', N'GraduationCap', 6, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (7, N'HLTH', N'Health', N'आरोग्य', N'Activity', 7, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (8, N'FIRE', N'Fire', N'अग्निशमन', N'Flame', 8, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (9, N'MARR', N'Marriage Certificate', N'लग्न नोंदणी प्रमाणपत्र', N'Heart', 9, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (10, N'TREE', N'Tree', N'वृक्ष प्राधिकरण', N'TreePine', 10, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (11, N'SANI', N'Sanitation', N'स्वच्छता विभाग', N'Trash2', 11, 1, 0, '2026-07-15T16:26:57.467', NULL, NULL),
    (12, N'PWD', N'PWD', N'सार्वजनिक बांधकाम विभाग', N'Building', 12, 1, 0, '2026-08-17T13:30:48.017', NULL, NULL),
    (13, N'NULM', N'NULM', N'राष्ट्रीय नागरी उपजीविका अभियान (फेरीवाला विभाग)', N'ShoppingBag', 13, 1, 1, '2026-08-26T12:00:00', NULL, NULL)
) AS source ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentCode] = source.[DepartmentCode],
        target.[DepartmentName] = source.[DepartmentName],
        target.[DepartmentNameLocal] = source.[DepartmentNameLocal],
        target.[DepartmentIcon] = source.[DepartmentIcon],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentCode], [DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentCode], source.[DepartmentName], source.[DepartmentNameLocal], source.[DepartmentIcon], source.[DisplayOrder], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [RTS].[DepartmentMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[ServiceMaster] (72 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ServiceMaster] ON;
GO
MERGE INTO [RTS].[ServiceMaster] AS target
USING (VALUES
    (19, 2, N'Change of Water Connection Usage Type', N'वापरामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 39, N'15 Days', 0.00, 0, 2, 1, 0, 1, 1, '2026-07-20T13:31:33.447', NULL, '2026-10-03T11:39:08.583'),
    (20, 2, N'Preparation of Water Bill', N'पाणी देयक तयार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileText', 40, N'3 Days', 0.00, 0, 2, 1, 0, 1, 1, '2026-07-20T13:31:33.447', NULL, '2026-10-03T11:39:08.583'),
    (26, 2, N'Complaint Regarding Water Pressure Capacity', N'पाण्याच्या दाब क्षमता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=19&upicid=', N'AlertTriangle', 46, N'3 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (33, 3, N'Changing Occupations / Business Type', N'व्यवसाय बदलणे', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=1', N'Briefcase', 13, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (36, 3, N'Cancellation of License', N'परवाना रद्द करणे', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=3', N'Briefcase', 16, N'15 Days', 0.00, 0, 2, 1, 0, 1, 1, '2026-07-20T13:31:33.447', NULL, '2026-10-03T11:39:08.583'),
    (43, 4, N'Issuance of Zone Certificate', N'झोन दाखला देणे', NULL, NULL, N'Map', 3, N'7 Days', 500.00, 1, 1, 1, 1, 1, 0, '2026-07-15T16:26:57.497', 2, '2026-10-03T11:39:08.583'),
    (44, 4, N'Giving Part Map', N'भाग नकाशा देणे', NULL, NULL, N'Map', 4, N'3 Days', 700.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (45, 4, N'Issuance of Construction Permit', N'बांधकाम परवाना देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'HardHat', 5, N'7 Days', 500.00, 1, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (46, 4, N'Issuance of plinth certificate', N'जोते प्रमाणपत्र देणे', NULL, NULL, N'MapPin', 6, N'7 Days', 200.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (47, 4, N'Issuance of Occupancy Certificate', N'भोगवटा प्रमाणपत्र देणे', NULL, N'https://mahavastu.maharashtra.gov.in/', N'Key', 7, N'7 Days', 0.00, 0, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (48, 12, N'Underground OFC Cable Permission', N'भुमिगत दुरसंचार वाहिनी (ऑप्टीकल फायबर केबल) टाकण्याकरीता परवानगी देणे', NULL, NULL, N'Cable', 61, N'60 Days', 120.00, 1, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', 1, '2026-09-17T15:53:08.023'),
    (49, 12, N'Filling Potholes on City Roads', N'रस्त्यांवरील खड्डे बुजविणे', NULL, NULL, N'Wrench', 63, N'5 Days', 0.00, 0, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (50, 12, N'Maintaining & Securing Sewer Covers', N'गटारांवरील झाकणे सुस्थितीत ठेवणे', NULL, NULL, N'Shield', 64, N'5 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (51, 12, N'Road Cutting Permission', N'रस्ता खोदाई परवानगी देणे', NULL, NULL, N'Wrench', 64, N'5 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-10-01T16:26:43.230', NULL, NULL),
    (53, 5, N'Birth Certificate', N'जन्म प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'Baby', 20, N'0 Days', 10.00, 1, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', 1, '2026-09-17T12:28:10.540'),
    (54, 5, N'Death Certificate', N'मृत्यु प्रमाणपत्र देणे', NULL, N'https://dc.crsorgi.gov.in/crs/Auth/general-public', N'HeartOff', 21, N'0 Days', 10.00, 1, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (55, 6, N'School Leaving / Duplicate Certificate', N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे', NULL, NULL, N'GraduationCap', 50, N'3 Days', 25.00, 1, 2, 1, 1, 0, 0, '2026-07-15T16:26:57.497', NULL, NULL),
    (56, 6, N'Issuance of transfer certificate', N'स्थलांतर दाखला देणे', NULL, NULL, N'GraduationCap', 51, N'15 Days', 25.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (57, 6, N'Issuance of duplicate mark sheet', N'गुणपत्रिकेची दुय्यम प्रत देणे', NULL, NULL, N'GraduationCap', 52, N'7 Days', 25.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (58, 7, N'Nursing home license', N'शुश्रूषा-गृह परवाना देणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 53, N'30 Days', 3500.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (59, 7, N'Renewal of nursing home license', N'शुश्रूषा-गृह परवान्याचे नुतनीकरण करणे', NULL, N'https://maha-mnhregistration.co.in/', N'PlusSquare', 54, N'30 Days', 3500.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (60, 7, N'Change of nursing home license holder / partner name', N'शुश्रूषा-गृह परवान्यावर परवानाधारक/भागीदाराचे नाव बदलणे', NULL, N'https://maha-mnhregistration.co.in/', N'UserPlus', 55, N'30 Days', 200.00, 1, 2, 1, 1, 0, 1, '2026-07-20T13:31:33.447', NULL, NULL),
    (61, 4, N'Trade / Business / Storage Non-Revocation NOC', N'व्यापार/व्यवसाय/साठा करण्यासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'ShieldCheck', 1, N'7 Days', 120.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (62, 4, N'Mandap NOC', N'मंडपासाठी ना-हरकत प्रमाणपत्र', NULL, NULL, N'Building2', 2, N'7 Days', 200.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (63, 8, N'Issuance of Fire Safety NOC', N'अग्निशमन नाहरकत दाखला देणे', NULL, N'#', N'Flame', 18, N'7 Days', 1000.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (64, 8, N'Issuance of Final Fire Exemption Certificate', N'अग्निशमन अंतिम नाहरकत दाखला देणे', NULL, N'#', N'Flame', 19, N'15 Days', 200.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (65, 9, N'Marriage Registration Certificate', N'विवाह नोंदणी प्रमाणपत्र देणे', NULL, NULL, N'Heart', 22, N'3 Days', 100.00, 1, 2, 1, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (66, 10, N'Tree Felling Permission', N'वृक्षतोड परवानगी देणे', NULL, NULL, N'TreePine', 62, N'45 Days', 2000.00, 1, 0, 0, 1, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (68, 11, N'Maintaining cleanliness', N'शहरात स्वच्छता राखणे', NULL, NULL, N'Trash2', 65, N'1 Days', 0.00, 0, 0, 0, 1, 1, 1, '2026-07-20T13:31:33.447', 1, '2026-09-16T16:37:50.180'),
    (69, 2, N'Providing drainage connections', N'जलनिःसारण जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=21&upicid=', N'Droplet', 49, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-15T16:26:57.497', NULL, '2026-10-03T11:39:08.583'),
    (80, 2, N'Provision of New Water Tap Connection', N'नळ जोडणी देणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=6&upicid=', N'Droplets', 48, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (81, 2, N'Changing the Water Connection Size', N'नळ जोडणी आकारामध्ये बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 36, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (82, 2, N'Temporary / Permanent Disconnection of Water Connection', N'तात्पुरते/कायमस्वरूपी नळ जोडणी खंडीत करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=10&upicid=', N'Droplets', 37, N'7 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (83, 2, N'Reconnection of Water Tap', N'पुनः जोडणी करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=14&upicid=', N'Droplets', 38, N'15 Days', 1000.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (84, 2, N'Water Bill No Dues Certificate', N'थकबाकी नसल्याचा दाखला', NULL, N'https://akolawatertest.tabamc.in/WaterBill/OnlineTaxAndNewConnectionPayment?upicid=', N'FileCheck', 43, N'3 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (85, 2, N'Complaint Regarding Faulty Water Meter', N'नादुरुस्त मीटर तक्रार करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=17&upicid=', N'AlertTriangle', 44, N'7 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (86, 2, N'Complaint Regarding Unauthorized Water Tap Connection', N'अनधिकृत नळ जोडणी तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=18&upicid=', N'AlertTriangle', 45, N'7 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (87, 2, N'Complaint Regarding Water Quality', N'पाण्याची गुणवत्ता तक्रार', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=20&upicid=', N'AlertTriangle', 47, N'3 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (100, 2, N'Issuance of Plumber License', N'प्लंबर परवाना', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=15&upicid=', N'Wrench', 41, N'15 Days', 1000.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (101, 2, N'Renewal of Plumber License', N'प्लंबर परवाना नुतनीकरण करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=16&upicid=', N'Wrench', 42, N'15 Days', 1000.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:44:51.083', NULL, '2026-10-03T11:39:08.583'),
    (137, 3, N'Obtaining New Trade License', N'नविन परवाना मिळणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General', N'Briefcase', 8, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (138, 3, N'Renewal of Trade License', N'परवान्याचे नुतनीकरण', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 9, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (139, 3, N'Transfer of Trade License', N'परवाना हस्तांतर', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=1', N'Briefcase', 10, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (140, 3, N'Duplicate Copy of Trade License', N'परवाना दुय्यम प्रत', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=2', N'Briefcase', 11, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (141, 3, N'Change of Business Name / Establishment / Address', N'व्यवसायाचे नाव बदलणे/प्रतिष्ठानात/पत्यात बदल', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=1', N'Briefcase', 12, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (142, 3, N'Change of License Holder / Partner Name', N'परवाना धारक/भागीदाराचे नाव बदलणे', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=1', N'Briefcase', 14, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (143, 3, N'Change in Number of Partners (Increase/Decrease)', N'भागीदाराच्या संख्येत बदल (वाढ/कमी)', NULL, N'https://test.tradeamc.org/SHEL/minorchanges?appType=1', N'Briefcase', 15, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (144, 3, N'Notice on Renewal of Expired License', N'कालबाह्य परवानासाठी नुतनीकरण सुचना', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 17, N'15 Days', 200.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (145, 1, N'New Property Tax Assessment', N'नव्याने कर आकारणी', NULL, N'https://testamc.tabamc.in/selfAssessment/index', N'Home', 23, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (146, 1, N'Re-Assessment of Property Tax', N'पुनः कर आकारणी', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/21?upicNo=', N'Home', 24, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (147, 1, N'Preparation of Tax Demand Notice', N'कराचे मागणी पत्र तयार करणे', NULL, N'https://testamc.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 25, N'3 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (148, 1, N'Avail Property Tax Exemption', N'कर माफी मिळणे', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/9?upicNo=', N'Receipt', 26, N'7 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (149, 1, N'Tax Exemption for Non-Resident Properties', N'रहिवास नसल्यास मालमत्तांना करात सुट मिळणे', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/20?upicNo=', N'Receipt', 27, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-07-23T16:27:10.443'),
    (150, 1, N'Property Tax Self-Assessment', N'स्वयंमुल्यांकन', NULL, N'https://testamc.tabamc.in/selfAssessment/index', N'Calculator', 28, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (151, 1, N'Registration of Objection on Tax Assessment', N'आक्षेप नोंदविणे', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/19?upicNo=', N'AlertTriangle', 29, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (152, 1, N'Sub-division of Property', N'उपविभागामध्ये मालमत्ता विभाजन', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/PropertySplit?upicNo=', N'GitFork', 30, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (153, 1, N'Re-assessment After Demolition and Reconstruction', N'मालमत्ता पाडणे व पुनःबांधणी कर आकारणे', NULL, N'https://testamc.tabamc.in/Citizens/RaiseApplication/ChangeInUse?upicNo=', N'Hammer', 31, N'15 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (154, 1, N'Issuance of Property Tax Assessment Copy (8A)', N'मालमत्ता कर उतारा देणे', NULL, N'https://testamc.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileText', 32, N'3 Days', 25.00, 1, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (155, 1, N'Issuance of No Dues Certificate', N'थकबाकी नसल्याचा दाखला देणे', NULL, N'https://testamc.tabamc.in/Citizens/DownLoadCertificate?upicNo=', N'FileCheck', 33, N'3 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (156, 1, N'Property Transfer Registration Certificate', N'अ) दस्ताऐवजाच्या आधारे मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे ब) वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', NULL, N'https://testamc.tabamc.in/Citizens/MutationView?upicNo=', N'UserCheck', 34, N'15 Days', 0.00, 0, 0, 0, 0, 1, 0, '2026-07-21T18:57:16.223', 3, '2026-10-03T11:39:08.583'),
    (157, 2, N'Change of Ownership Name', N'मालकी हक्कात बदल करणे', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'UserPlus', 35, N'7 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', 1, '2026-10-03T11:39:08.583'),
    (158, 3, N'Issuance of Lodging House License', N'लॉजिंग हाऊस परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 56, N'30 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (159, 3, N'Renewal of Lodging House License', N'लॉजिंग हाऊस परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Hotel', 57, N'30 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (160, 3, N'Issuance of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवाना देणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 58, N'30 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (161, 3, N'Renewal of Marriage Hall / Auditorium License', N'मंगल कार्यालय/सभागृह वगैरे परवान्याचे नुतनीकरण करणे', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Building2', 59, N'30 Days', 0.00, 0, 2, 1, 0, 1, 0, '2026-07-21T18:57:16.223', NULL, '2026-10-03T11:39:08.583'),
    (162, 13, N'Issuance of Hawker Registration Certificate', N'फेरीवाले नोंदणी प्रमाणपत्र देणे', NULL, NULL, NULL, 60, N'30 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-07-21T18:57:16.223', 3, '2026-10-03T11:39:08.583'),
    (163, 2, N'Water Non-Availability Certificate', N'पाणी अनुपलब्धता प्रमाणपत्र', NULL, N'https://akolawatertest.tabamc.in/WaterBill/Citizen?service=12&upicid=', N'Droplets', 50, N'7 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-10-01T18:07:11.620', NULL, NULL),
    (164, 3, N'Auto-renewal of Trade License', N'व्यवसाय परवाना स्वयंनुतनीकरण', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'briefcase', 60, N'15 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-10-01T18:13:14.610', NULL, NULL),
    (165, 3, N'Advertisement / Signage License', N'जाहिरात / आकाशचिन्ह परवाना', NULL, N'https://test.tradeamc.org/shel/TradeLicense?General?upicid=', N'Briefcase', 60, N'15 Days', 0.00, 0, 0, 0, 1, 1, 0, '2026-10-01T18:16:00.840', NULL, NULL),
    (166, 7, N'Food Business License NOC', N'खाद्य व्यवसाय परवाना ना-हरकत प्रमाणपत्र', NULL, NULL, N'PlusSquare', 53, N'30 Days', 3500.00, 1, 2, 1, 1, 1, 1, '2026-10-02T11:05:13.290', NULL, NULL),
    (167, 7, N'Food Registration Health NOC', N'खाद्य नोंदणी आरोग्य ना-हरकत प्रमाणपत्र', NULL, NULL, N'PlusSquare', 53, N'30 Days', 3500.00, 1, 2, 1, 1, 1, 1, '2026-10-02T11:06:17.090', NULL, NULL),
    (170, 1, N'Property Transfer Registration Certificate - Inheritance', N'वारसा हक्काने मालमत्ता हस्तांतरण नोंद प्रमाणपत्र देणे', NULL, N'https://testamc.tabamc.in/Citizens/MutationView?upicNo=', N'UserCheck', 35, N'15 Days', 0.00, 0, 0, 0, 0, 1, 0, '2026-10-03T11:37:10.417', NULL, '2026-10-03T11:39:08.583')
) AS source ([Id], [DepartmentId], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [CertificateType], [IsCertificateRequired], [IsSmsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[DepartmentId] = source.[DepartmentId],
        target.[ServiceName] = source.[ServiceName],
        target.[ServiceNameLocal] = source.[ServiceNameLocal],
        target.[Description] = source.[Description],
        target.[ServiceUrl] = source.[ServiceUrl],
        target.[ServiceIcon] = source.[ServiceIcon],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[Sla] = source.[Sla],
        target.[Fees] = source.[Fees],
        target.[FeesRequired] = source.[FeesRequired],
        target.[CertificateType] = source.[CertificateType],
        target.[IsCertificateRequired] = source.[IsCertificateRequired],
        target.[IsSmsEnabled] = source.[IsSmsEnabled],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceName], [ServiceNameLocal], [Description], [ServiceUrl], [ServiceIcon], [DisplayOrder], [Sla], [Fees], [FeesRequired], [CertificateType], [IsCertificateRequired], [IsSmsEnabled], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceName], source.[ServiceNameLocal], source.[Description], source.[ServiceUrl], source.[ServiceIcon], source.[DisplayOrder], source.[Sla], source.[Fees], source.[FeesRequired], source.[CertificateType], source.[IsCertificateRequired], source.[IsSmsEnabled], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [RTS].[ServiceMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[FieldDefinition] (869 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[FieldDefinition] ON;
GO
MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    
    (1, 4, 61, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (4, 4, 61, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (5, 4, 61, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (6, 4, 61, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (7, 4, 61, N'ownerFirstName', N'Owner Full Name', N'मालकाचे पूर्ण नाव', N'text', N'Owner Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (10, 4, 61, N'ownerMobile', N'Owner Mobile Number', N'मालकाचा मोबाईल क्रमांक', N'tel', N'Owner Details', NULL, NULL, NULL, 1, 10, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (11, 4, 61, N'ownerEmail', N'Owner Email', N'मालकाचा ई-मेल', N'email', N'Owner Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (12, 4, 61, N'ownerAadhar', N'Owner Aadhar Number', N'मालकाचा आधार क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (13, 4, 61, N'panNumber', N'Owner PAN Number', N'मालकाचा पॅन क्रमांक', N'text', N'Owner Details', NULL, NULL, N'{
  "pattern": "^[A-Z]{5}[0-9]{4}[A-Z]{1}$",
  "exactLength": 10,
  "inputMode": "text",
  "normalize": ["trim", "uppercase", "removeSpaces"],
  "message": "Enter a valid PAN number, for example ABCDE1234F."
}', 0, 13, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (14, 4, 61, N'ownerCity', N'Owner City', N'मालकाचे शहर', N'text', N'Owner Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (15, 4, 61, N'ownerState', N'Owner State', N'मालकाचे राज्य', N'text', N'Owner Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (16, 4, 61, N'businessName', N'Business / Trade Name', N'व्यवसाय / व्यापाराचे नाव', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (17, 4, 61, N'workers', N'Number of Employees', N'कर्मचाऱ्यांची संख्या', N'number', N'Business Activity & Licensing Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (18, 4, 61, N'propertyTaxNo', N'Property Tax Assessment Number', N'मालमत्ता कर आकारणी उतारा क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (19, 4, 61, N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'मालमत्ता कर पावती क्रमांक', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (20, 4, 61, N'businessAddress', N'Business Address', N'पत्ता', N'textarea', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (21, 4, 61, N'activityType', N'Type of Activity', N'व्यवसायाचा प्रकार', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (22, 4, 61, N'licenseCategory', N'Licensing Category', N'परवाना वर्ग', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (23, 4, 61, N'specialCategory', N'Specify License Category (if Special)', N'परवाना श्रेणी नमूद करा (विशेष असल्यास)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (24, 4, 61, N'newBusinessProposal', N'New Business Proposal?', N'नवीन व्यवसाय परवाना प्रस्ताव?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (25, 4, 61, N'workingHours', N'Working Hours', N'कामाच्या वेळा', N'text', N'Business Activity & Licensing Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "pattern": "^(0?[1-9]|1[0-9]|2[0-4])$",
  "message": "Enter valid work hours between 1 and 24."
}', 1, 25, 1.0000, 24.0000, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (26, 4, 61, N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)', N'text', N'Business Activity & Licensing Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (27, 4, 61, N'natureOfGoods', N'Nature of Goods Stored / Traded', N'साठवलेल्या मालाचे प्रकार', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (28, 4, 61, N'flammableGoods', N'Flammable/Explosive Goods?', N'ज्वलनशील / स्फोटक माल आहे का?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (29, 4, 61, N'flammableGoodsDetail', N'Flammable Material Details', N'ज्वलनशील मालाचे तपशील', N'text', N'Storage, Safety & Hazard Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (30, 9, 65, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (31, 9, 65, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (32, 9, 65, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (33, 9, 65, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (34, 9, 65, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (35, 9, 65, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (36, 9, 65, N'groomFirstName', N'Groom First Name', N'वराचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (37, 9, 65, N'groomMiddleName', N'Groom Middle Name', N'वराचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (38, 9, 65, N'groomLastName', N'Groom Last Name', N'वराचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (39, 9, 65, N'groomAge', N'Age', N'वय', N'number', N'Bridegroom Details', NULL, NULL, N'{"min":21,"max":100}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (40, 9, 65, N'groomDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bridegroom Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (41, 9, 65, N'groomAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bridegroom Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 12, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (42, 9, 65, N'groomFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (43, 9, 65, N'groomFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (44, 9, 65, N'groomFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (45, 9, 65, N'groomMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (46, 9, 65, N'groomMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (47, 9, 65, N'groomMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (48, 9, 65, N'groomparentCity', N'groomParent City', N'वराच्या पालकांचे शहर', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (49, 9, 65, N'groomparentState', N'groomParent State', N'वराच्या पालकांचे राज्य', N'text', N'Bridegroom Details', NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (50, 9, 65, N'groomOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bridegroom Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (51, 9, 65, N'groomReligion', N'Religion', N'धर्म', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (52, 9, 65, N'brideFirstName', N'Bride First Name', N'वधूचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (53, 9, 65, N'brideMiddleName', N'Bride Middle Name', N'वधूचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (54, 9, 65, N'brideLastName', N'Bride Last Name', N'वधूचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (55, 9, 65, N'brideAge', N'Age', N'वय', N'number', N'Bride Details', NULL, NULL, N'{"min":18,"max":100}', 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (56, 9, 65, N'brideDateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Bride Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (57, 9, 65, N'brideAadhaar', N'Aadhaar Number', N'आधार कार्ड क्रमांक', N'text', N'Bride Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 28, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (58, 9, 65, N'brideFatherFirstName', N'Father''s First Name', N'वडिलांचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (59, 9, 65, N'brideFatherMiddleName', N'Father''s Middle Name', N'वडिलांचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (60, 9, 65, N'brideFatherLastName', N'Father''s Last Name', N'वडिलांचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (61, 9, 65, N'brideMotherFirstName', N'Mother''s First Name', N'आईचे पहिले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (62, 9, 65, N'brideMotherMiddleName', N'Mother''s Middle Name', N'आईचे मधले नाव', N'text', N'Bride Details', NULL, NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (63, 9, 65, N'brideMotherLastName', N'Mother''s Last Name', N'आईचे आडनाव', N'text', N'Bride Details', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (64, 9, 65, N'brideparentCity', N'brideParent City', N'वधूच्या पालकांचे शहर', N'text', N'Bride Details', NULL, NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (65, 9, 65, N'brideparentState', N'brideParent State', N'वधूच्या पालकांचे राज्य', N'text', N'Bride Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (66, 9, 65, N'brideOccupation', N'Occupation', N'व्यवसाय', N'text', N'Bride Details', NULL, NULL, NULL, 0, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (67, 9, 65, N'brideReligion', N'Religion', N'धर्म', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (68, 9, 65, N'marriageDate', N'Date of Marriage', N'लग्न तारीख', N'date', N'Marriage Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (69, 9, 65, N'marriagePlace', N'Place of Marriage', N'लग्न ठिकाण', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (70, 9, 65, N'marriageCity', N'marriage City', N'विवाहाचे शहर', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (71, 9, 65, N'marriageState', N'marriage State', N'विवाहाचे राज्य', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (72, 9, 65, N'witness1FirstName', N'Witness 1 First Name', N'साक्षीदार १ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (73, 9, 65, N'witness1MiddleName', N'Witness 1 Middle Name', N'साक्षीदार १ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (74, 9, 65, N'witness1LastName', N'Witness 1 Last Name', N'साक्षीदार १ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (75, 9, 65, N'witness2FirstName', N'Witness 2 First Name', N'साक्षीदार २ पहिले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 46, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (76, 9, 65, N'witness2MiddleName', N'Witness 2 Middle Name', N'साक्षीदार २ मधले नाव', N'text', N'Marriage Details', NULL, NULL, NULL, 0, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (77, 9, 65, N'witness2LastName', N'Witness 2 Last Name', N'साक्षीदार २ आडनाव', N'text', N'Marriage Details', NULL, NULL, NULL, 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (78, 9, 65, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (79, 2, 69, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (80, 2, 69, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (81, 2, 69, N'email', N'Email (optional)', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (82, 2, 69, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (83, 2, 69, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (84, 2, 69, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (85, 2, 69, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property / Location Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (86, 2, 69, N'wardId', N'Ward', N'प्रभाग', N'select', N'Property / Location Details', N'[
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
]', NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (87, 2, 69, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property / Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (88, 2, 69, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Property / Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (89, 2, 69, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Property / Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (90, 2, 69, N'premisesOccupancyType', N'Premises Type', N'जागेचा प्रकार', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (91, 2, 69, N'connectionType', N'Connection Type', N'जोडणीचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (92, 2, 69, N'useType', N'Use Type', N'वापराचा प्रकार', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (93, 2, 69, N'noOfUnits', N'No. of Units (optional)', N'युनिट्सची संख्या (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (94, 2, 69, N'existingArrangement', N'Current Wastewater Arrangement', N'सांडपाण्याची सध्याची व्यवस्था', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (95, 2, 69, N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (96, 2, 69, N'roadCuttingRequired', N'Road Cutting Required?', N'रस्ता खोदाई आवश्यक आहे का?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (97, 2, 69, N'roadCuttingDetails', N'Road Cutting Details (optional)', N'रस्ता खोदाईचे तपशील (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (98, 2, 69, N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)', N'number', N'Drainage / Sewer Connection Request', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (99, 2, 69, N'tradeLicenseNo', N'Trade License No (optional)', N'व्यवसाय परवाना क्रमांक (पर्यायी)', N'text', N'Drainage / Sewer Connection Request', NULL, NULL, NULL, 0, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (100, 2, 69, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (101, 4, 61, N'fireNocUpdated', N'Fire NOC Up-to-date?', N'अग्निशामक परवाना अद्ययावत आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (102, 4, 61, N'policeNocSubmitted', N'Police NOC Submitted?', N'पोलीस परवाना सादर केला आहे का?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (103, 4, 61, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (158, 4, 62, N'trafficPoliceStation', N'Concerned Traffic Police Station', N'संबंधित वाहतूक पोलीस स्टेशन', N'select', N'Applicant Undertaking & Compliance', N'[
  {
    "value": "Akola City Traffic Police Branch",
    "label": {
      "en": "Akola City Traffic Police Branch",
      "hi": "????? ??? ??????? ????? ????",
      "mr": "????? ??? ?????? ????? ????"
    }
  }
]', NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (163, 8, 63, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (164, 8, 63, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (165, 8, 63, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (166, 8, 63, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (167, 8, 63, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (168, 8, 63, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:05:28.417'),
    (169, 8, 63, N'ownerName', N'Name of Owner', N'मालकाचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (170, 8, 63, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (171, 8, 63, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:05:28.417'),
    (172, 8, 63, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (173, 8, 63, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (174, 8, 63, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:12:38.640'),
    (175, 8, 63, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
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
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:18:27.640'),
    (177, 8, 63, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (178, 8, 63, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (179, 8, 63, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (180, 8, 63, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (181, 8, 63, N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'प्रस्तावित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (182, 8, 63, N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'प्रस्तावित आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (183, 8, 63, N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'प्रस्तावित एकत्रीकरण / मस्टर पॉईंट तपशील', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:27:43.313'),
    (184, 8, 63, N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'अत्यंत ज्वलनशील साहित्य साठविण्यात येणार आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (185, 8, 63, N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (186, 8, 63, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (187, 8, 63, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (188, 8, 64, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (189, 8, 64, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (190, 8, 64, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (191, 8, 64, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (192, 8, 64, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (193, 8, 64, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (194, 8, 64, N'ownerName', N'Name of Owner', N'मालकाचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (195, 8, 64, N'ownerMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Owner & Premises details', NULL, NULL, NULL, 1, 8, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (196, 8, 64, N'ownerEmail', N'Email Address', N'मालकाचा ई-मेल पत्ता', N'email', N'Owner & Premises details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (197, 8, 64, N'businessName', N'Name of Industry / Business / Firm', N'उद्योग / व्यवसाय / फर्मचे नाव', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (198, 8, 64, N'businessCity', N'business City', N'व्यवसायाचे शहर', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (199, 8, 64, N'businessState', N'business State', N'व्यवसायाचे राज्य', N'select', N'Owner & Premises details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', 0, '2026-08-18T19:12:38.640'),
    (200, 8, 64, N'propertyTaxNo', N'Property Tax Assessment No.', N'मालमत्ता कर आकारणी क्रमांक', N'text', N'Owner & Premises details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (201, 5, 53, N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'जन्मतारीख (दि-महा-वर्ष)', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (202, 5, 53, N'gender', N'Sex', N'लिंग', N'select', N'Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (203, 5, 53, N'childFirstName', N'Child First Name', N'बालकाचे पहिले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (204, 5, 53, N'childMiddleName', N'Child Middle Name', N'बालकाचे मधले नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (205, 5, 53, N'childLastName', N'Child Last Name', N'बालकाचे आडनाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (206, 5, 53, N'childAadhaar', N'Aadhaar No. (Optional)', N'बालकाचा आधार क्रमांक (ऐच्छिक)', N'text', N'Child, Birth & Registrar Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 12, NULL, NULL, 14, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (207, 5, 53, N'placeOfBirthType', N'Place of Birth Type', N'जन्मस्थळाचा प्रकार', N'select', N'Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (208, 5, 53, N'hospitalName', N'Hospital / Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (209, 5, 53, N'birthPlaceAddress', N'Complete Birth Address', N'संपूर्ण जन्मस्थळाचा पत्ता', N'textarea', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (210, 5, 53, N'birthPlaceSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (211, 5, 53, N'birthPlaceDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, N'Akola', NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (212, 5, 53, N'birthPlaceState', N'State / UT', N'राज्य / केंद्रशासित प्रदेश', N'Select', N'Child, Birth & Registrar Details', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', N'Maharashtra', NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T17:39:22.510'),
    (213, 5, 53, N'birthPlacePinCode', N'PIN Code', N'पिन कोड', N'number', N'Child, Birth & Registrar Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (214, 5, 53, N'_registrar_header', N'Registrar Details', N'निबंधकाचा तपशील', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (215, 5, 53, N'registrationNo', N'Registration No.', N'नोंदणी क्रमांक', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (216, 5, 53, N'registrationDate', N'Registration Date', N'नोंदणी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (217, 5, 53, N'registrationUnit', N'Registration Unit', N'नोंदणी युनिट', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (218, 5, 53, N'registrarTownVillage', N'Town / Village', N'शहर / गाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (219, 5, 53, N'registrarDistrict', N'District', N'जिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, N'Akola', NULL, 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (220, 5, 53, N'registrarSubDistrict', N'Sub-district', N'उपजिल्हा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (221, 5, 53, N'registrarName', N'Registrar Name', N'निबंधकाचे नाव', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (222, 5, 53, N'registrarSignatureDate', N'Registrar Signature Date', N'निबंधक स्वाक्षरी तारीख', N'date', N'Child, Birth & Registrar Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (223, 5, 53, N'registrarRemarks', N'Remarks', N'शेरा', N'text', N'Child, Birth & Registrar Details', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (224, 5, 53, N'permanentHouseNo', N'House No.', N'कायमचा घर क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (225, 5, 53, N'permanentLocality', N'Locality', N'कायमचा परिसर / वस्ती', N'text', N'Address Information', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (226, 5, 53, N'permanentWard', N'Ward No.', N'कायमचा प्रभाग क्रमांक', N'text', N'Address Information', NULL, NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (227, 5, 53, N'permanentTownVillage', N'Town / Village', N'कायमचे शहर / गाव', N'text', N'Address Information', NULL, NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (228, 5, 53, N'permanentSubDistrict', N'Sub-district', N'कायमचा उपजिल्हा', N'text', N'Address Information', NULL, NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (229, 5, 53, N'permanentDistrict', N'District', N'कायमचा जिल्हा', N'text', N'Address Information', NULL, N'Akola', NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (230, 5, 53, N'permanentState', N'State / UT', N'कायमचे राज्य / केंद्रशासित प्रदेश', N'Select', N'Address Information', N'[{"value":"Maharashtra","label":{"en":"Maharashtra"}}]', N'Maharashtra', NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T17:39:22.510'),
    (231, 5, 53, N'permanentPinCode', N'PIN Code', N'कायमचा पिन कोड', N'text', N'Address Information', NULL, NULL, NULL, 1, 37, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (232, 5, 53, N'permanentAddressProofType', N'Permanent Address Proof Type', N'कायमच्या पत्त्याच्या पुराव्याचा प्रकार', N'select', N'Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (233, 5, 53, N'addressProofLast4Digits', N'Last 4 Digits', N'पत्ता पुराव्याचे शेवटचे 4 अंक', N'text', N'Address Information', NULL, NULL, NULL, 1, 39, NULL, NULL, 4, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (234, 5, 53, N'motherFirstName', N'Mother First Name', N'आईचे पहिले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (235, 5, 53, N'motherMiddleName', N'Mother Middle Name', N'आईचे मधले नाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (236, 5, 53, N'motherLastName', N'Mother Last Name', N'आईचे आडनाव', N'text', N'Mother''s Information', NULL, NULL, NULL, 0, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (237, 5, 53, N'motherAadhaar', N'Mother Aadhaar No.', N'आईचा आधार क्रमांक', N'text', N'Mother''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 43, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T18:01:18.293'),
    (238, 5, 53, N'motherMobile', N'Mother Mobile No.', N'आईचा मोबाईल क्रमांक', N'tel', N'Mother''s Information', NULL, NULL, NULL, 1, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (239, 5, 53, N'motherEmail', N'Mother Email ID', N'आईचा ई-मेल आयडी', N'email', N'Mother''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (240, 5, 53, N'motherAgeAtMarriage', N'Age at First Marriage', N'पहिल्या विवाहावेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 46, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (241, 5, 53, N'motherAgeAtBirth', N'Age at This Birth', N'या प्रसूतीवेळी आईचे वय', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 47, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (242, 5, 53, N'childrenBornAlive', N'Children Born Alive', N'जिवंत जन्मलेल्या बालकांची संख्या', N'number', N'Mother''s Information', NULL, NULL, N'{"min":0}', 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (243, 5, 53, N'fatherFirstName', N'Father First Name', N'वडिलांचे पहिले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (244, 5, 53, N'fatherMiddleName', N'Father Middle Name', N'वडिलांचे मधले नाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (245, 5, 53, N'fatherLastName', N'Father Last Name', N'वडिलांचे आडनाव', N'text', N'Father''s Information', NULL, NULL, NULL, 0, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (246, 5, 53, N'fatherAadhaar', N'Father Aadhaar No.', N'वडिलांचा आधार क्रमांक', N'text', N'Father''s Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 52, NULL, NULL, 12, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T18:25:46.050'),
    (247, 5, 53, N'fatherMobile', N'Father Mobile No.', N'वडिलांचा मोबाईल क्रमांक', N'tel', N'Father''s Information', NULL, NULL, NULL, 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (248, 5, 53, N'fatherEmail', N'Father Email ID', N'वडिलांचा ई-मेल आयडी', N'email', N'Father''s Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (249, 5, 53, N'informantFirstName', N'Informant First Name', N'माहिती देणाऱ्याचे पहिले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (250, 5, 53, N'informantMiddleName', N'Informant Middle Name', N'माहिती देणाऱ्याचे मधले नाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (251, 5, 53, N'informantLastName', N'Informant Last Name', N'माहिती देणाऱ्याचे आडनाव', N'text', N'Informant Details', NULL, NULL, NULL, 0, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (252, 5, 53, N'informantMobile', N'Informant Mobile', N'माहिती देणाऱ्याचा मोबाईल क्रमांक', N'tel', N'Informant Details', NULL, NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (253, 5, 53, N'informantAddress', N'Informant Address', N'माहिती देणाऱ्याचा पत्ता', N'textarea', N'Informant Details', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (254, 5, 53, N'declarationAccuracy', N'I confirm info is accurate', N'मी पुष्टी करतो / करते की दिलेली माहिती अचूक आहे', N'select', N'Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (255, 5, 53, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 61, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (256, 5, 54, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (257, 5, 54, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (258, 5, 54, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (259, 5, 54, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (260, 5, 54, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (261, 5, 54, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (262, 5, 54, N'deceasedFirstName', N'Deceased First Name', N'मृत व्यक्तीचे पहिले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (263, 5, 54, N'deceasedMiddleName', N'Deceased Middle Name', N'मृत व्यक्तीचे मधले नाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (264, 5, 54, N'deceasedLastName', N'Deceased Last Name', N'मृत व्यक्तीचे आडनाव', N'text', N'Deceased Person Information', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (265, 5, 54, N'dateOfDeath', N'Date of Death', N'मृत्यूची तारीख', N'date', N'Deceased Person Information', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (266, 5, 54, N'timeOfDeath', N'Time of Death', N'मृत्यूची वेळ', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (267, 5, 54, N'age', N'Age at Death', N'मृत्यूसमयी वय', N'number', N'Deceased Person Information', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (268, 5, 54, N'gender', N'Gender', N'लिंग', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (269, 5, 54, N'deathType', N'Type of Death', N'मृत्यूचा प्रकार', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (270, 5, 54, N'deathNature', N'Nature of Death (If Accidental)', N'मृत्यूचे स्वरूप (अपघाती असल्यास)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (271, 5, 54, N'incidentPlaceHouseNo', N'Incident House No.', N'घटनास्थळाचा घर क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (272, 5, 54, N'incidentPlaceLocality', N'Incident Locality/Area', N'घटनास्थळाचा परिसर / क्षेत्र', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (273, 5, 54, N'incidentPlaceTown', N'Town/City', N'घटनास्थळाचे शहर / गाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (274, 5, 54, N'incidentPlaceDistrict', N'District', N'घटनास्थळाचा जिल्हा', N'text', N'Death Circumstance Details', NULL, N'Akola', NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (275, 5, 54, N'incidentPlaceState', N'State', N'घटनास्थळाचे राज्य', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (276, 5, 54, N'incidentPlacePinCode', N'PIN Code', N'घटनास्थळाचा पिन कोड', N'number', N'Death Circumstance Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
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
    ]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T19:18:27.640'),
    (278, 8, 64, N'propertyType', N'Occupancy Type', N'वापराचा प्रकार', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (279, 8, 64, N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (280, 8, 64, N'floors', N'No. of Floors', N'मजल्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (281, 8, 64, N'workers', N'No. of Workers/Employees', N'कामगार / कर्मचाऱ्यांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (282, 8, 64, N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'स्थापित अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (283, 8, 64, N'extinguisherType', N'Type of Extinguishers', N'अग्निशामक यंत्रांचा प्रकार', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (284, 8, 64, N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'प्रति 100 चौ. फूट अग्निशामक यंत्रांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (285, 8, 64, N'lastRefillDate', N'Last Refill/Service Date', N'शेवटची रिफिल / सर्व्हिस तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (286, 8, 64, N'nextRefillDueDate', N'Next Service Due Date', N'पुढील सर्व्हिसची नियोजित तारीख', N'date', N'Fire Safety & Building Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (287, 8, 64, N'installerAgency', N'Installer/Service Agency Name', N'इंस्टॉलर / सेवा संस्थेचे नाव', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', 0, '2026-08-18T19:41:05.413'),
    (288, 8, 64, N'serviceAgencyLicenseNo', N'Service Agency License No.', N'सेवा संस्थेचा परवाना क्रमांक', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (289, 8, 64, N'emergencyExitCount', N'No. of Emergency Exits', N'आपत्कालीन बाहेर पडण्याच्या मार्गांची संख्या', N'number', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (290, 8, 64, N'exitSignage', N'Exit Direction Signage Installed', N'बाहेर पडण्याचे दिशादर्शक फलक बसवले आहेत का?', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (291, 8, 64, N'routeMarking', N'Evacuation Route Marked', N'बाहेर पडण्याचा मार्ग चिन्हांकित केला आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (292, 8, 64, N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'स्वतंत्र अग्निसुरक्षा जिना उपलब्ध आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (293, 8, 64, N'musterPoint', N'Assembly / Muster Point Details', N'एकत्रीकरण / मस्टर पॉईंट तपशील', N'textarea', N'Fire Safety & Building Details', NULL, NULL, N'{"min":0}', 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (294, 8, 64, N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'फायर अलार्म प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (295, 8, 64, N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'हायड्रंट / स्प्रिंकलर प्रणाली बसवली आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (296, 8, 64, N'earthingCertified', N'Earthing System Certified?', N'अर्थिंग प्रणाली प्रमाणित आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (297, 8, 64, N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'अत्यंत ज्वलनशील साहित्य साठवले आहे का?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (298, 8, 64, N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'ज्वलनशील साहित्याचा तपशील (होय असल्यास)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 0, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (299, 8, 64, N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'मंजूर / प्रस्तावित नकाशानुसार इमारतीचा तपशील (वास्तुविशारद व मालक स्वाक्षरीसह)', N'text', N'Fire Safety & Building Details', NULL, NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (300, 8, 64, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (301, 4, 43, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (302, 4, 43, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (303, 4, 43, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (304, 4, 43, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (305, 4, 43, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (306, 4, 43, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{"maxLength": 15, "pattern": "^[A-Za-z0-9/-]+$}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (307, 4, 43, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (309, 4, 43, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (310, 4, 43, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (311, 4, 43, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (312, 4, 43, N'purpose', N'Purpose', N'उद्देश', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (313, 4, 43, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (314, 4, 43, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (315, 4, 44, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (316, 4, 44, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (317, 4, 44, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (318, 4, 44, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (319, 4, 44, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (320, 4, 44, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (321, 4, 44, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (323, 4, 44, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (324, 4, 44, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (325, 4, 44, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (326, 4, 44, N'purpose', N'Purpose', N'उद्देश', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (327, 4, 44, N'partMapType', N'Part Map Type', N'भाग नकाशाचा प्रकार', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (328, 4, 44, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (329, 4, 44, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (330, 4, 45, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (331, 4, 45, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (332, 4, 45, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (333, 4, 45, N'applicantAddress', N'Residential Address', N'पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (334, 4, 45, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (335, 4, 45, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (336, 4, 45, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (338, 4, 45, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (339, 4, 45, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (340, 4, 45, N'fetchedPropertyAddress', N'Property Address (Auto)', N'पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (341, 4, 45, N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'प्लॉटचे क्षेत्रफळ (चौ. मी.)', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (342, 4, 45, N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'सीटीएस / सर्व्हे क्रमांक', N'number', N'Ward / Zone & Property Details', NULL, NULL, N'{"min":0}', 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (343, 4, 45, N'typeOfWork', N'Type of Work', N'कामाचा प्रकार', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (344, 4, 45, N'buildingUse', N'Building Use', N'इमारतीचा वापर', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (345, 4, 45, N'proposedFloors', N'Total Floors (Proposed)', N'प्रस्तावित एकूण मजले', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (346, 4, 45, N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'प्रस्तावित एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (347, 4, 45, N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'तळघर / स्टिल्ट पार्किंग आहे का?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (348, 4, 45, N'buildingHeightM', N'Building Height (m) (if known)', N'इमारतीची उंची (मी.) (माहित असल्यास)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (349, 4, 45, N'briefWorkDescription', N'Brief Description (optional)', N'कामाचे संक्षिप्त वर्णन (ऐच्छिक)', N'number', N'Construction Proposal Details', NULL, NULL, N'{"min":0}', 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (350, 4, 45, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (351, 4, 45, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (352, 4, 45, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (353, 4, 45, N'architectMobile', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 24, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (354, 4, 45, N'architectEmail', N'Email (optional)', N'ईमेल', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (355, 4, 45, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (356, 4, 47, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (357, 4, 47, N'mobileNo', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (358, 4, 47, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (359, 4, 47, N'applicantAddress', N'Residential Address', N'निवासी पत्ता', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (360, 4, 47, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (361, 4, 47, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (362, 4, 47, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी संबंध', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 0, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (363, 4, 47, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी', N'text', N'Ward / Zone & Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
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
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (365, 4, 47, N'zoneId', N'Zone', N'झोन', N'select', N'Ward / Zone & Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (366, 4, 47, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव', N'text', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (367, 4, 47, N'fetchedPropertyAddress', N'Property Address (Auto)', N'मालमत्तेचा पत्ता', N'textarea', N'Ward / Zone & Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (368, 4, 47, N'ocType', N'OC Type', N'भोगवटा प्रमाणपत्राचा प्रकार', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (369, 4, 47, N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'बांधकाम परवानगी / सीसी संदर्भ क्रमांक', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 14, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (370, 4, 47, N'completionDate', N'Completion Date', N'पूर्णत्वाची तारीख', N'date', N'OC Request Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (371, 4, 47, N'totalFloorsConstructed', N'Total Floors Constructed', N'बांधलेल्या एकूण मजल्यांची संख्या', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (372, 4, 47, N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'एकूण बांधकाम क्षेत्रफळ (चौ. मी.)', N'number', N'OC Request Details', NULL, NULL, N'{"min":0}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (373, 4, 47, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'OC Request Details', NULL, NULL, NULL, 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (374, 4, 47, N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'परवानाधारक वास्तुविशारद / अभियंत्यामार्फत सादर केले आहे का?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (375, 4, 47, N'architectName', N'Architect/Engineer Name', N'वास्तुविशारद / अभियंत्याचे नाव', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (376, 4, 47, N'architectLicenseNo', N'License / Registration No', N'परवाना / नोंदणी क्रमांक', N'text', N'Architect / Engineer Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (377, 5, 54, N'policeStation', N'Police Station Name', N'पोलीस स्टेशनचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (378, 5, 54, N'firCaseNumber', N'FIR / Case Number', N'एफआयआर / प्रकरण क्रमांक', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (379, 5, 54, N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'प्रथम वैद्यकीय उपचार केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (380, 5, 54, N'firstTreatmentAddress', N'First Treatment Hospital Address', N'प्रथम उपचार रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (381, 5, 54, N'deathDeclaredHospital', N'Death Declared Hospital Name', N'मृत्यू घोषित केलेल्या रुग्णालयाचे नाव', N'text', N'Death Circumstance Details', NULL, NULL, NULL, 0, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (382, 5, 54, N'deathDeclaredAddress', N'Death Declared Hospital Address', N'मृत्यू घोषित केलेल्या रुग्णालयाचा पत्ता', N'textarea', N'Death Circumstance Details', NULL, NULL, NULL, 0, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (383, 5, 54, N'placeOfDeathType', N'Place of Death', N'मृत्यूस्थळाचा प्रकार', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (384, 5, 54, N'hospitalName', N'Hospital/Institution Name', N'रुग्णालय / संस्थेचे नाव', N'text', N'Place of Death', NULL, NULL, NULL, 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (385, 5, 54, N'deathAddress', N'Complete Death Address', N'मृत्यूस्थळाचा संपूर्ण पत्ता', N'textarea', N'Place of Death', NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (386, 5, 54, N'deathPinCode', N'PIN Code', N'पिन कोड', N'number', N'Place of Death', NULL, NULL, N'{"min":0}', 0, 31, NULL, NULL, 6, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (387, 5, 54, N'deactivateAadhaar', N'Aadhaar Deactivation', N'आधार निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 32, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (388, 5, 54, N'deactivatePAN', N'PAN Deactivation', N'पॅन निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 33, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (389, 5, 54, N'cancelPassport', N'Passport Cancellation', N'पासपोर्ट रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 34, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (390, 5, 54, N'deleteVoterID', N'Voter ID Deletion', N'मतदार ओळखपत्र रद्द करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 35, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (391, 5, 54, N'terminatePension', N'Pension Account Termination', N'पेन्शन खाते बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 36, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (392, 5, 54, N'freezeBankAccount', N'Bank Account Freeze Notification', N'बँक खाते गोठविण्याची सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 37, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (393, 5, 54, N'deactivateSIM', N'SIM/Telecom Deactivation', N'सिम / दूरसंचार सेवा निष्क्रिय करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 38, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (394, 5, 54, N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'यूपीआय / डिजिटल वॉलेट बंद करणे', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (395, 5, 54, N'notifyInsurance', N'Insurance Company Notification', N'विमा कंपनीला सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 40, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (396, 5, 54, N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'कर्ज / क्रेडिट दायित्वाबाबत सूचना', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', NULL, NULL, 1, 41, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (397, 5, 54, N'digitalDeactivationConsent', N'Consent Declaration', N'डिजिटल सेवा निष्क्रिय करण्यास संमती', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (398, 5, 54, N'addressVerifiedUsing', N'Permanent Address Verified Using', N'कायमचा पत्ता पडताळणीचा आधार', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 43, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (399, 5, 54, N'verifiedByRegistrar', N'Verified by Registrar', N'निबंधकाद्वारे पडताळणी', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', NULL, NULL, 0, 44, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (400, 5, 54, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.690', NULL, NULL),
    (401, 4, 47, N'architectMobile', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Architect / Engineer Details', NULL, NULL, NULL, 1, 22, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (402, 4, 47, N'architectEmail', N'Email (optional)', N'ई-मेल (ऐच्छिक)', N'email', N'Architect / Engineer Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (403, 4, 47, N'declaration', N'I hereby declare that the construction has been completed as per the approved plan and applicable rules.', N'मी घोषित करतो की बांधकाम मंजूर नकाशा व लागू नियमांनुसार पूर्ण झाले आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (404, 12, 48, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (405, 12, 48, N'organizationName', N'Organization / Company Name', N'संस्था / कंपनीचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (406, 12, 48, N'authorizedSignatoryName', N'Authorized Signatory Name', N'अधिकृत स्वाक्षरीकर्त्याचे नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (407, 12, 48, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (408, 12, 48, N'email', N'Email', N'ईमेल', N'email', N'Applicant / Organization Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (409, 12, 48, N'officeAddress', N'Office Address', N'कार्यालयाचा पत्ता', N'textarea', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (410, 12, 48, N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'परवाना / नोंदणी क्रमांक (असल्यास)', N'text', N'Applicant / Organization Details', NULL, NULL, NULL, 0, 7, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (411, 12, 48, N'gstNo', N'GST No (if any)', N'जीएसटी क्रमांक (असल्यास)', N'number', N'Applicant / Organization Details', NULL, NULL, N'{"min":0}', 0, 8, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
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
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (413, 12, 48, N'zoneId', N'Zone', N'झोन', N'select', N'Work Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 9, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (414, 12, 48, N'workAreaType', N'Work Area Type', N'कार्यक्षेत्राचा प्रकार', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (415, 12, 48, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (416, 12, 48, N'fromLocation', N'From Location', N'सुरुवातीचे ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (417, 12, 48, N'toLocation', N'To Location', N'अंतिम ठिकाण', N'text', N'Work Location Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (418, 12, 48, N'landmark', N'Landmark (optional)', N'जवळची खूण (ऐच्छिक)', N'text', N'Work Location Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (419, 12, 48, N'totalRouteLengthMeters', N'Total Route Length (meters)', N'मार्गाची एकूण लांबी (मीटरमध्ये)', N'number', N'Work Location Details', NULL, NULL, N'{"min":0}', 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (420, 12, 48, N'methodOfLaying', N'Method of Laying', N'वाहिनी टाकण्याची पद्धत', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (421, 12, 48, N'trenchWidthCm', N'Trench Width (cm)', N'चराची रुंदी (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (422, 12, 48, N'trenchDepthCm', N'Trench Depth (cm)', N'चराची खोली (सेंटीमीटरमध्ये)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (423, 12, 48, N'roadCrossingsCount', N'No. of Road Crossings', N'रस्ता ओलांडण्यांची संख्या', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (424, 12, 48, N'ductPipeSize', N'Duct / HDPE Pipe Size', N'डक्ट / एचडीपीई पाईपचा आकार', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 1, 21, NULL, NULL, 50, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (425, 12, 48, N'noOfDucts', N'No. of Ducts (optional)', N'डक्टची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (426, 12, 48, N'handholesChambersCount', N'Handholes / Chambers (optional)', N'हँडहोल्स / चेंबर्सची संख्या (ऐच्छिक)', N'number', N'Excavation / Laying Details', NULL, NULL, N'{"min":0}', 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (427, 12, 48, N'expectedStartDate', N'Expected Start Date', N'अपेक्षित सुरू तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (428, 12, 48, N'expectedEndDate', N'Expected End Date', N'अपेक्षित अंतिम तारीख', N'date', N'Excavation / Laying Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (429, 12, 48, N'trafficManagementRequired', N'Traffic Management Required?', N'रहदारी व्यवस्थापन आवश्यक आहे का?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (430, 6, 55, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (431, 6, 55, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (432, 6, 55, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (433, 6, 55, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (434, 6, 55, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (435, 6, 55, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (436, 6, 55, N'relationshipToStudent', N'Relationship to Student', N'विद्यार्थ्याशी नाते', N'select', N'Applicant Information', N'[
  {
    "value": "self",
    "label": {
      "en": "Self (Student)",
      "hi": "स्वयं (छात्र)",
      "mr": "स्वतः (विद्यार्थी)"
    }
  },
  {
    "value": "parent",
    "label": {
      "en": "Parent",
      "hi": "अभिभावक",
      "mr": "पालक"
    }
  },
  {
    "value": "guardian",
    "label": {
      "en": "Guardian",
      "hi": "संरक्षक",
      "mr": "संरक्षक"
    }
  }
]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (437, 6, 55, N'guardianFullName', N'Parent/Guardian Full Name', N'पालक / संरक्षकाचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (438, 6, 55, N'rollNumber', N'Roll Number', N'अनुक्रमांक', N'text', N'Student Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (439, 6, 55, N'studentName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (440, 6, 55, N'dateOfBirth', N'Date of Birth', N'जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (441, 6, 55, N'gender', N'Gender', N'लिंग', N'select', N'Student Details', N'[
  {
    "value": "male",
    "label": {
      "en": "Male",
      "hi": "पुरुष",
      "mr": "पुरुष"
    }
  },
  {
    "value": "female",
    "label": {
      "en": "Female",
      "hi": "महिला",
      "mr": "महिला"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (442, 6, 55, N'motherName', N'Mother''s Name', N'आईचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (443, 6, 55, N'fatherName', N'Father''s Name', N'वडिलांचे नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (444, 6, 55, N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'आधार क्रमांकाचे शेवटचे 4 अंक (ऐच्छिक)', N'text', N'Student Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 4,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 0, 15, NULL, NULL, 4, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (445, 6, 55, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {
    "value": "Marathi Boys School No. 4, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 4, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ४, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ४, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 7, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 7, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ७, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ७, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 9, Kala Maroti",
    "label": {
      "en": "Marathi Boys School No. 9, Kala Maroti",
      "hi": "मराठी बालक विद्यालय क्र. ९, काळा मारोती",
      "mr": "मराठी मुलांची शाळा क्र. ९, काळा मारोती"
    }
  },
  {
    "value": "Marathi Boys School No. 12, Naigaon",
    "label": {
      "en": "Marathi Boys School No. 12, Naigaon",
      "hi": "मराठी बालक विद्यालय क्र. १२, नायगाव",
      "mr": "मराठी मुलांची शाळा क्र. १२, नायगाव"
    }
  },
  {
    "value": "Marathi Boys School No. 14, Sindhi Camp",
    "label": {
      "en": "Marathi Boys School No. 14, Sindhi Camp",
      "hi": "मराठी बालक विद्यालय क्र. १४, सिंधी कॅम्प",
      "mr": "मराठी मुलांची शाळा क्र. १४, सिंधी कॅम्प"
    }
  },
  {
    "value": "Marathi Boys School No. 16, Adarsh Colony",
    "label": {
      "en": "Marathi Boys School No. 16, Adarsh Colony",
      "hi": "मराठी बालक विद्यालय क्र. १६, आदर्श कॉलनी",
      "mr": "मराठी मुलांची शाळा क्र. १६, आदर्श कॉलनी"
    }
  },
  {
    "value": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
    "label": {
      "en": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
      "hi": "मराठी बालक विद्यालय क्र. १७, शिव नगर, पानी की टंकी के पास",
      "mr": "मराठी मुलांची शाळा क्र. १७, शिव नगर, पाण्याच्या टाकीजवळ"
    }
  },
  {
    "value": "Marathi Boys School No. 18, Ashok Nagar",
    "label": {
      "en": "Marathi Boys School No. 18, Ashok Nagar",
      "hi": "मराठी बालक विद्यालय क्र. १८, अशोक नगर",
      "mr": "मराठी मुलांची शाळा क्र. १८, अशोक नगर"
    }
  },
  {
    "value": "Marathi Boys School No. 19, Harihar Peth",
    "label": {
      "en": "Marathi Boys School No. 19, Harihar Peth",
      "hi": "मराठी बालक विद्यालय क्र. १९, हरीहर पेठ",
      "mr": "मराठी मुलांची शाळा क्र. १९, हरीहर पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 22, Krishna Nagar",
    "label": {
      "en": "Marathi Boys School No. 22, Krushi Nagar",
      "hi": "मराठी बालक विद्यालय क्र. २२, कृषी नगर",
      "mr": "मराठी मुलांची शाळा क्र. २२, कृषी नगर"
    } 
  },
  {
    "value": "Marathi Boys School No. 26, Shiv Sena Vasahat",
    "label": {
      "en": "Marathi Boys School No. 26, Shiv Sena Vasahat",
      "hi": "मराठी बालक विद्यालय क्र. २६, शिवसेना वसाहत",
      "mr": "मराठी मुलांची शाळा क्र. २६, शिवसेना वसाहत"
    }
  },
  {
    "value": "Hindi Boys School No. 1, Near City Kotwali",
    "label": {
      "en": "Hindi Boys School No. 1, Near City Kotwali",
      "hi": "हिंदी बालक विद्यालय क्र. १, सिटी कोतवाली के पास",
      "mr": "हिंदी बालक शाळा क्र. १, सिटी कोतवाली जवळ"
    }
  },
  {
    "value": "Hindi Boys School No. 2, Ashok Nagar",
    "label": {
      "en": "Hindi Boys School No. 2, Ashok Nagar",
      "hi": "हिंदी बालक विद्यालय क्र. २, अशोक नगर",
      "mr": "हिंदी बालक शाळा क्र. २, अशोक नगर"
    }
  },
  {
    "value": "Hindi Boys School No. 6, Lakkadganj",
    "label": {
      "en": "Hindi Boys School No. 6, Lakkadganj",
      "hi": "हिंदी बालक विद्यालय क्र. ६, लक्कडगंज",
      "mr": "हिंदी बालक शाळा क्र. ६, लक्कडगंज"
    }
  },
  {
    "value": "Hindi Boys School No. 8, Harihar Peth",
    "label": {
      "en": "Hindi Boys School No. 8, Harihar Peth",
      "hi": "हिंदी बालक विद्यालय क्र. ८, हरीहर पेठ",
      "mr": "हिंदी बालक शाळा क्र. ८, हरीहर पेठ"
    }
  },
  {
    "value": "Sindhi Hindi School No. 1, Gandhi Nagar",
    "label": {
      "en": "Sindhi Hindi School No. 1, Gandhi Nagar",
      "hi": "सिंधी हिंदी बालक विद्यालय क्र. १, गांधी नगर",
      "mr": "सिंधी हिंदी शाळा क्र. १, गांधी नगर"
    }
  },
  {
    "value": "Gujarati Boys School No. 1, Swatantryaveer Vidyalaya",
    "label": {
      "en": "Gujarati Boys School No. 1, Swawlambi Vidyalaya",
      "hi": "गुजराती बालक विद्यालय क्र. १, स्वावलंबी विद्यालय",
      "mr": "गुजराती बालक शाळा क्र. १, स्वावलंबी विद्यालय"
    }
  },
  {
    "value": "Urdu Boys School No. 1, Near AMC",
    "label": {
      "en": "Urdu Boys School No. 1, Near AMC",
      "hi": "उर्दू बालक विद्यालय क्र. १, मनपा जवळ",
      "mr": "उर्दू मुलांची शाळा क्र. १, मनपा जवळ"
    }
  },
  {
    "value": "Urdu Boys School No. 2, Potha Chowk",
    "label": {
      "en": "Urdu Boys School No. 2, Pola Chowk",
      "hi": "उर्दू बालक विद्यालय क्र. २, पोळा चौक",
      "mr": "उर्दू मुलांची शाळा क्र. २, पोळा चौक"
    }
  },
  {
    "value": "Urdu Boys School No. 6, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 6, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. ६, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. ६, अकोट फैल"
    }
  },
  {
    "value": "Urdu Boys School No. 7, Naigaon",
    "label": {
      "en": "Urdu Boys School No. 7, Naigaon",
      "hi": "उर्दू बालक विद्यालय क्र. ७, नायगाव",
      "mr": "उर्दू मुलांची शाळा क्र. ७, नायगाव"
    }
  },
  {
    "value": "Urdu Boys School No. 8, Lakkadganj",
    "label": {
      "en": "Urdu Boys School No. 8, Lakkadganj",
      "hi": "उर्दू बालक विद्यालय क्र. ८, लक्कडगंज",
      "mr": "उर्दू मुलांची शाळा क्र. ८, लक्कडगंज"
    }
  },
  {
    "value": "Urdu Boys School No. 9, Khadan",
    "label": {
      "en": "Urdu Boys School No. 9, Khadan",
      "hi": "उर्दू बालक विद्यालय क्र. ९, खदान",
      "mr": "उर्दू मुलांची शाळा क्र. ९, खदान"
    }
  },
  {
    "value": "Urdu Boys School No. 10, Dabki Road",
    "label": {
      "en": "Urdu Boys School No. 10, Dabki Road",
      "hi": "उर्दू बालक विद्यालय क्र. १०, डाबकी रोड",
      "mr": "उर्दू मुलांची शाळा क्र. १०, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Boys School No. 11, Harihar Peth",
    "label": {
      "en": "Urdu Boys School No. 11, Harihar Peth",
      "hi": "उर्दू बालक विद्यालय क्र. ११, हरीहर पेठ",
      "mr": "उर्दू मुलांची शाळा क्र. ११, हरीहर पेठ"
    }
  },
  {
    "value": "Urdu Boys School No. 12, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 12, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. १२, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. १२, अकोट फैल"
    }
  },
  {
    "value": "Urdu Girls School No. 1, Gandhi Road",
    "label": {
      "en": "Urdu Girls School No. 1, Gandhi Road",
      "hi": "उर्दू कन्या विद्यालय क्र. १, गांधी रोड",
      "mr": "उर्दू कन्या शाळा क्र. १, गांधी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 3, Pola Chowk",
    "label": {
      "en": "Urdu Girls School No. 3, Pola Chowk",
      "hi": "उर्दू कन्या विद्यालय क्र. ३, पोळा चौक",
      "mr": "उर्दू कन्या शाळा क्र. ३, पोळा चौक"
    }
  },
  {
    "value": "Urdu Girls School No. 4, Dabki Road",
    "label": {
      "en": "Urdu Girls School No. 4, Dabki Road",
      "hi": "उर्दू कन्या विद्यालय क्र. ४, डाबकी रोड",
      "mr": "उर्दू कन्या शाळा क्र. ४, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 5, Harihar Peth",
    "label": {
      "en": "Urdu Girls School No. 5, Harihar Peth",
      "hi": "उर्दू कन्या विद्यालय क्र. ५, हरीहर पेठ",
      "mr": "उर्दू कन्या शाळा क्र. ५, हरीहर पेठ"
    }
  }
]', NULL, NULL, 1, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (446, 6, 55, N'lastStandardStudied', N'Last Standard/Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[
  {
    "value": "std_1",
    "label": {
      "en": "1st Std",
      "hi": "१ ली",
      "mr": "इयत्ता १ ली"
    }
  },
  {
    "value": "std_2",
    "label": {
      "en": "2nd Std",
      "hi": "२ री",
      "mr": "इयत्ता २ री"
    }
  },
  {
    "value": "std_3",
    "label": {
      "en": "3rd Std",
      "hi": "३ री",
      "mr": "इयत्ता ३ री"
    }
  },
  {
    "value": "std_4",
    "label": {
      "en": "4th Std",
      "hi": "४ थी",
      "mr": "इयत्ता ४ थी"
    }
  },
  {
    "value": "std_5",
    "label": {
      "en": "5th Std",
      "hi": "५ वी",
      "mr": "इयत्ता ५ वी"
    }
  },
  {
    "value": "std_6",
    "label": {
      "en": "6th Std",
      "hi": "६ वी",
      "mr": "इयत्ता ६ वी"
    }
  },
  {
    "value": "std_7",
    "label": {
      "en": "7th Std",
      "hi": "७ वी",
      "mr": "इयत्ता ७ वी"
    }
  },
  {
    "value": "std_8",
    "label": {
      "en": "8th Std",
      "hi": "८ वी",
      "mr": "इयत्ता ८ वी"
    }
  },
  {
    "value": "std_9",
    "label": {
      "en": "9th Std",
      "hi": "९ वी",
      "mr": "इयत्ता ९ वी"
    }
  },
  {
    "value": "std_10",
    "label": {
      "en": "10th Std",
      "hi": "१० वी",
      "mr": "इयत्ता १० वी"
    }
  }
]', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (447, 6, 55, N'yearOfLeaving', N'Year of Leaving', N'शाळा सोडल्याचे वर्ष', N'number', N'School Details', NULL, NULL, N'{"min":0}', 1, 18, NULL, NULL, 4, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (448, 6, 55, N'certificateType', N'Certificate Type', N'प्रमाणपत्राचा प्रकार', N'select', N'School Details', N'[
  {
    "value": "leaving",
    "label": {
      "en": "Leaving Certificate",
      "hi": "शालांत प्रमाणपत्र",
      "mr": "शाळा सोडल्याचा दाखला"
    }
  },
  {
    "value": "duplicate",
    "label": {
      "en": "Duplicate Certificate",
      "hi": "दुय्यम प्रमाणपत्र",
      "mr": "द्वितीय दाखला"
    }
  },
  {
    "value": "migration",
    "label": {
      "en": "Migration Certificate",
      "hi": "स्थानांतरण प्रमाणपत्र",
      "mr": "स्थलांतर प्रमाणपत्र"
    }
  }
]', NULL, NULL, 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (449, 6, 55, N'lastAttendanceDate', N'Last Attendance Date', N'शेवटची उपस्थिती तारीख', N'date', N'School Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 0, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (450, 6, 55, N'boardOrUniversity', N'Board / University', N'मंडळ / विद्यापीठ', N'text', N'School Details', NULL, NULL, NULL, 0, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (451, 6, 55, N'reasonForLeaving', N'Reason for Leaving', N'शाळा सोडण्याचे कारण', N'select', N'Certificate Details', N'[
  {
    "value": "transfer",
    "label": {
      "en": "Transfer",
      "hi": "स्थानांतरण",
      "mr": "बदली"
    }
  },
  {
    "value": "higherStudies",
    "label": {
      "en": "Higher Studies",
      "hi": "उच्च शिक्षा",
      "mr": "उच्च शिक्षण"
    }
  },
  {
    "value": "familyShift",
    "label": {
      "en": "Family Shift",
      "hi": "परिवार स्थानांतरण",
      "mr": "कुटुंब स्थलांतर"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (452, 6, 55, N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'सर्व थकीत देणी भरली आहेत का?', N'select', N'Certificate Details', N'[
  {
    "value": "yes",
    "label": {
      "en": "Yes",
      "hi": "हाँ",
      "mr": "होय"
    }
  },
  {
    "value": "no",
    "label": {
      "en": "No",
      "hi": "नहीं",
      "mr": "नाही"
    }
  }
]', NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (453, 6, 55, N'duplicateReason', N'Reason for Duplicate', N'डुप्लिकेट प्रमाणपत्राचे कारण', N'select', N'Certificate Details', N'[
  {
    "value": "lost",
    "label": {
      "en": "Original Certificate Lost",
      "hi": "मूल प्रमाणपत्र खो गया",
      "mr": "मूळ प्रमाणपत्र हरवले"
    }
  },
  {
    "value": "damaged",
    "label": {
      "en": "Original Certificate Damaged",
      "hi": "मूल प्रमाणपत्र क्षतिग्रस्त हो गया",
      "mr": "मूळ प्रमाणपत्र खराब झाले"
    }
  },
  {
    "value": "destroyed",
    "label": {
      "en": "Original Certificate Destroyed",
      "hi": "मूल प्रमाणपत्र नष्ट हो गया",
      "mr": "मूळ प्रमाणपत्र नष्ट झाले"
    }
  },
  {
    "value": "misplaced",
    "label": {
      "en": "Certificate Misplaced",
      "hi": "प्रमाणपत्र गुम हो गया",
      "mr": "प्रमाणपत्र सापडत नाही"
    }
  },
  {
    "value": "correction",
    "label": {
      "en": "Name / Details Correction",
      "hi": "नाम / विवरण सुधार",
      "mr": "नाव / माहिती दुरुस्ती"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (454, 6, 55, N'originalCertificateNumber', N'Original Certificate No. (if known)', N'मूळ प्रमाणपत्र क्रमांक (माहित असल्यास)', N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (455, 6, 55, N'policeComplaintFiled', N'Police Complaint Filed?', N'पोलीस तक्रार दाखल केली आहे का?', N'select', N'Certificate Details', N'[
  {
    "value": "yes",
    "label": {
      "en": "Yes",
      "hi": "हाँ",
      "mr": "होय"
    }
  },
  {
    "value": "no",
    "label": {
      "en": "No",
      "hi": "नहीं",
      "mr": "नाही"
    }
  }
]', NULL, NULL, 1, 26, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (456, 6, 55, N'affidavitProvided', N'Affidavit Provided?', N'प्रतिज्ञापत्र सादर केले आहे का?', N'select', N'Certificate Details', N'[
  {
    "value": "yes",
    "label": {
      "en": "Yes",
      "hi": "हाँ",
      "mr": "होय"
    }
  },
  {
    "value": "no",
    "label": {
      "en": "No",
      "hi": "नहीं",
      "mr": "नाही"
    }
  }
]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (457, 6, 55, N'lastExamPassed', N'Last Exam Passed', N'शेवटची उत्तीर्ण परीक्षा', N'number', N'Certificate Details', NULL, NULL, N'{"min":0}', 0, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (458, 6, 55, N'seatOrRegNo', N'Seat No / Registration No', N'आसन क्रमांक / नोंदणी क्रमांक', N'text', N'Certificate Details', NULL, NULL, N'{
  "maxLength": 13,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 0, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (459, 6, 55, N'destinationInstituteName', N'Destination Institute (optional)', N'प्रमाणपत्र पाठवायच्या संस्थेचे नाव (ऐच्छिक)', N'text', N'Certificate Details', NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (460, 6, 55, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (461, 10, 66, N'applicantType', N'Applicant Type', N'अर्जदाराचा प्रकार', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (462, 10, 66, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (463, 10, 66, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 3, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (464, 10, 66, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (465, 10, 66, N'applicantAddress', N'Address (optional)', N'पत्ता (ऐच्छिक)', N'textarea', N'Applicant Details', NULL, NULL, NULL, 0, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (466, 10, 66, N'idProofType', N'ID Proof Type', N'ओळखपत्राचा प्रकार', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (467, 10, 66, N'idProofNumber', N'ID Proof Number', N'ओळखपत्र क्रमांक', N'text', N'Applicant Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, 20, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (468, 10, 66, N'applicantRelationship', N'Relationship to Property', N'मालमत्तेशी असलेले नाते', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (469, 10, 66, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Location / Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
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
]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (471, 10, 66, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Location / Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 11, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (472, 10, 66, N'fetchedOwnerName', N'Owner Name', N'मालकाचे नाव (प्रणालीद्वारे)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (473, 10, 66, N'fetchedPropertyAddress', N'Address', N'पत्ता', N'textarea', N'Location / Property Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (474, 10, 66, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (475, 10, 66, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (476, 10, 66, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location / Property Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (477, 10, 66, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'map', N'Location / Property Details', NULL, NULL, NULL, 0, 17, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (478, 10, 66, N'actionRequested', N'What do you want to do?', N'आपण कोणती कार्यवाही करू इच्छिता?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (479, 10, 66, N'noOfTrees', N'How many trees?', N'झाडांची संख्या', N'number', N'Tree Request Details', NULL, NULL, N'{"min":0}', 1, 19, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (480, 10, 66, N'treeLocationType', N'Where is the tree located?', N'झाड कोणत्या ठिकाणी आहे?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 20, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (481, 10, 66, N'reasonCategory', N'Reason', N'कारण', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (482, 10, 66, N'isImmediateDanger', N'Is it an emergency danger?', N'तातडीचा धोका आहे का?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 1, 22, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (483, 10, 66, N'dangerExplanation', N'Explain the danger (if yes)', N'धोक्याचे स्पष्टीकरण द्या (होय असल्यास)', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (484, 10, 66, N'treeDetails', N'Tree Details', N'झाडाचा तपशील', N'textarea', N'Tree Request Details', NULL, NULL, NULL, 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (485, 10, 66, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (501, 12, 48, N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', NULL, NULL, 1, 27, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (502, 12, 48, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (503, 12, 48, N'restorationResponsibility', N'Restoration Responsibility', N'पुनर्स्थापना जबाबदारी', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', NULL, NULL, 1, 28, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (504, 12, 48, N'restorationType', N'Restoration Type', N'पुनर्स्थापना प्रकार', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 29, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (505, 12, 48, N'undertakingConsent', N'Undertaking / Indemnity Consent', N'हमीपत्र / स्वीकृती पत्र', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', NULL, NULL, 1, 30, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (506, 12, 49, N'accidentOrDamage', N'Any accident/vehicle damage?', N'कोणताही अपघात किंवा वाहनाचे नुकसान झाले आहे का?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', NULL, NULL, 0, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (507, 12, 49, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (508, 12, 49, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (509, 12, 49, N'citizenFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (510, 12, 49, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (511, 12, 49, N'fromLocation', N'From (optional)', N'सुरुवातीचे ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (512, 12, 49, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (513, 12, 49, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (514, 12, 49, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (515, 12, 49, N'potholeCount', N'Number of Potholes', N'खड्ड्यांची संख्या', N'number', N'Pothole Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (516, 12, 49, N'potholeSize', N'Pothole Size', N'खड्ड्याचा आकार', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (517, 12, 49, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Pothole Details', NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (518, 12, 49, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 14, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (519, 12, 49, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Pothole Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (520, 12, 49, N'toLocation', N'To (optional)', N'अंतिम ठिकाण (ऐच्छिक)', N'text', N'Pothole Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
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
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (522, 12, 49, N'zoneId', N'Zone', N'झोन', N'select', N'Pothole Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (523, 12, 50, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (524, 12, 50, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (525, 12, 50, N'citizenFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (526, 12, 50, N'coverCount', N'Number of Covers', N'झाकणांची संख्या', N'number', N'Sewer Cover Issue Details', NULL, NULL, N'{"min":0}', 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (527, 12, 50, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (528, 12, 50, N'googleMapLink', N'Google Map Link (optional)', N'गूगल मॅप लिंक (पर्यायी)', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (529, 12, 50, N'issueType', N'Issue Type', N'समस्येचा प्रकार', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (530, 12, 50, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (531, 12, 50, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (532, 12, 50, N'remarks', N'Remarks (optional)', N'शेरा (ऐच्छिक)', N'text', N'Sewer Cover Issue Details', NULL, NULL, NULL, 0, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (533, 12, 50, N'riskLevel', N'Risk Level', N'धोक्याची पातळी', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (534, 12, 50, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Sewer Cover Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
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
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (536, 12, 50, N'zoneId', N'Zone', N'झोन', N'select', N'Sewer Cover Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.763', NULL, NULL),
    (597, 5, 53, N'hospitalreportdoc', N'Hospital Report', N'रुग्णालयाचा अहवाल', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 62, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (598, 5, 53, N'adharcard', N'Parents Aadhar Card', N'पालकांचे आधार कार्ड', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 63, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (599, 5, 54, N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (600, 5, 54, N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'स्मशानभूमी किंवा दफनभूमीचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (601, 9, 65, N'groomAgeProofDoc', N'Groom Age Proof Document (School Leaving Certificate/Birth Certificate/Passport)', N'नवरदेवाच्या वयाचा पुरावा दस्तऐवज (शाळा सोडल्याचा दाखला/जन्म दाखला/पासपोर्ट)', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, '2026-09-10T08:23:06.233'),
    (602, 9, 65, N'brideAgeProofDoc', N'Bride Age Proof Document (School Leaving Certificate/Birth Certificate/Passport)', N'नवरीच्या वयाचा पुरावा दस्तऐवज (शाळा सोडल्याचा दाखला/जन्म दाखला/पासपोर्ट)', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, '2026-09-10T08:23:06.237'),
    (603, 9, 65, N'weddingInvitationDoc', N'Wedding Invitation Card (Original invitation card + 2 color wedding photographs. Note: For Muslim marriages, Nikahnama is required)', N'लग्नपत्रिका (मूळ लग्नपत्रिका + विवाहाची २ रंगीत छायाचित्रे. टीप: मुस्लिम विवाहासाठी निकाहनामा आवश्यक आहे)', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, '2026-09-10T08:23:06.237'),
    (604, 9, 65, N'witness1IdProofDoc', N'Witness 1 ID Proof (Voter ID Card/Aadhaar Card. Note: 2 passport-size photographs also required)', N'साक्षीदार १ ओळखपत्र पुरावा (मतदार ओळखपत्र/आधार कार्ड. टीप: २ पासपोर्ट आकाराचे फोटो देखील आवश्यक आहेत)', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, '2026-09-10T08:23:06.237'),
    (605, 9, 65, N'witness2IdProofDoc', N'Witness 2 ID Proof (Voter ID Card/Aadhaar Card. Note: 2 passport-size photographs also required)', N'साक्षीदार २ ओळखपत्र पुरावा (मतदार ओळखपत्र/आधार कार्ड. टीप: २ पासपोर्ट आकाराचे फोटो देखील आवश्यक आहेत)', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, '2026-09-10T08:23:06.237'),
    (606, 2, 69, N'idProofDoc', N'Applicant ID Proof Document', N'अर्जदाराच्या ओळखपत्राचा पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (607, 2, 69, N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 24, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (608, 2, 69, N'premisesMapDoc', N'Premises Layout Map', N'जागेचा नकाशा / आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 25, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.780', NULL, NULL),
    (1114, 4, 44, N'propertyTaxDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1115, 4, 45, N'buildingPlanDoc', N'Ownership Documents', N'मालकी हक्काची कागदपत्रे', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1116, 4, 45, N'architectCertDoc', N'Architect’s Certificate', N'वास्तुविशारदाचा दाखला', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1117, 4, 47, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1118, 4, 47, N'PlinthCertificateDoc', N'Plinth Certificate', N'जोते प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1119, 4, 43, N'ownershipDoc', N'7/12 Extract or City Survey Extract', N'७/१२ चा उतारा / सिटी सर्व्हेचा उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1124, 12, 48, N'routeMapDoc', N'Proposed OFC Cable Route Diagram', N'प्रस्तावित ओएफसी केबल मार्गाचा नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1125, 6, 55, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1126, 6, 55, N'previousMarksheetDoc', N'Latest Paid Tax Receipt', N'नवीनतम भरलेली कर पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, '2026-09-10T08:35:52.190'),
    (1134, 8, 64, N'fireSafetyBlueprintDoc', N'Approved Fire Safety Blueprint', N'मंजूर अग्निसुरक्षा आराखडा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1135, 8, 63, N'equipmentInvoiceDoc', N'Fire Equipment Purchase / Inspection Receipt', N'अग्निशमन उपकरण खरेदी / तपासणी पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1138, 4, 61, N'propertyTaxDoc', N'Property Tax Receipt Document', N'मालमत्ता कराची पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1139, 10, 66, N'treePhotosDoc', N'Clear Photographs of Tree(s)', N'झाडाचे स्पष्ट छायाचित्र', N'fileLatLog', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1140, 10, 66, N'ownershipDoc', N'Property Ownership / 7-12 Extract', N'मालमत्ता मालकीचा पुरावा / ७/१२ उतारा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (1141, 4, 46, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1142, 4, 46, N'architectName', N'Licensed Architect Name', N'परवानाधारक वास्तुविशारदाचे नाव', N'text', N'Architect Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1143, 4, 46, N'buildingPermitRefNo', N'Sanctioned Building Permit Ref No', N'मंजूर बांधकाम परवाना संदर्भ क्रमांक', N'text', N'Permit Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1144, 4, 46, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1145, 4, 46, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1146, 4, 46, N'propertyNo', N'Property No / UPIC', N'मालमत्ता क्रमांक / युपीआयसी निवडा', N'text', N'Property Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
]', NULL, NULL, 0, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1148, 4, 46, N'zoneId', N'Zone', N'झोन (प्रणालीद्वारे)', N'select', N'Property Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 0, 5, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1149, 7, 58, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1150, 7, 58, N'bmwClearanceNo', N'Bio Medical Waste Clearance No', N'जैव वैद्यकीय कचरा मंजुरी क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1151, 7, 58, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1152, 7, 58, N'doctorName', N'Chief Medical Officer / Doctor Name', N'मुख्य वैद्यकीय अधिकारी / डॉक्टरचे नाव', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1153, 7, 58, N'doctorRegNo', N'Doctor MMC/Medical Reg No', N'डॉक्टर एमएमसी / वैद्यकीय नोंदणी क्रमांक', N'text', N'Medical Staff Details', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1154, 7, 58, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', 0, '2026-08-18T18:36:51.673'),
    (1155, 7, 58, N'fireNocNo', N'Fire Safety NOC Number', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र क्रमांक', N'text', N'Compliance Details', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL)
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
        target.[IsRequired] = source.[IsRequired],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = source.[IsActive],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], source.[IsRequired], source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], source.[IsActive], source.[MarkedForDeletion], source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
MERGE INTO [RTS].[FieldDefinition] AS target
USING (VALUES
    
    (1156, 7, 58, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1157, 7, 58, N'nursingHomeAddress', N'Nursing Home Address', N'नर्सिंग होमचा पत्ता', N'textarea', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1158, 7, 58, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1159, 7, 58, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
}', 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1161, 7, 58, N'zoneId', N'Zone', N'झोन', N'select', N'Nursing Home Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, N'{
  "dependsOn":"zoneId",
  "filterByPrefix":true
}', 1, 7, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1162, 7, 59, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1163, 7, 59, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1164, 7, 59, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1165, 7, 59, N'licenseExpiryDate', N'License Expiry Date', N'परवाना समाप्ती तारीख', N'date', N'License Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1166, 7, 59, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1167, 7, 59, N'nursingHomeName', N'Nursing Home Name', N'नर्सिंग होमचे नाव', N'text', N'Nursing Home Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1168, 7, 59, N'totalBeds', N'Total Bed Capacity', N'एकूण खाटांची क्षमता', N'number', N'Facility Details', NULL, NULL, N'{"min":0}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
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
]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1170, 7, 60, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1171, 7, 60, N'currentHolderName', N'Current License Holder Name', N'सध्याच्या परवानाधारकाचे नाव', N'text', N'License Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1172, 7, 60, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1173, 7, 60, N'existingLicenseNo', N'Existing License Number', N'विद्यमान परवाना क्रमांक', N'text', N'License Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1174, 7, 60, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1175, 7, 60, N'proposedHolderName', N'Proposed New Holder / Partner Name', N'प्रस्तावित नवीन परवानाधारक / भागीदाराचे नाव', N'text', N'Update Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1176, 7, 60, N'reasonForChange', N'Reason for Change', N'बदलाचे कारण', N'select', N'Update Details', N'[{"value":"partner_add","label":{"en":"Addition of Partner","hi":"भागीदार जोडणे","mr":"भागीदार जोडणे"}},{"value":"partner_remove","label":{"en":"Removal of Partner","hi":"भागीदार काढणे","mr":"भागीदार काढणे"}},{"value":"sale","label":{"en":"Transfer / Sale","hi":"हस्तांतरण / विक्री","mr":"हस्तांतरण / विक्री"}},{"value":"inheritance","label":{"en":"Inheritance / Legal Heir","hi":"वारसा हक्क","mr":"वारसा हक्क"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:34.910', NULL, NULL),
    (1177, 11, 68, N'areaName', N'Area / Locality', N'भाग / परिसर', N'text', N'Location Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1178, 11, 68, N'cleanlinessIssueType', N'Cleanliness Issue Type', N'स्वच्छतेशी संबंधित समस्येचा प्रकार', N'select', N'Complaint Details', N'[{"value":"garbage","label":{"en":"Garbage Accumulation","hi":"कचरा साचणे","mr":"कचरा साचणे"}},{"value":"open_dumping","label":{"en":"Open Dumping","hi":"उघड्यावर कचरा","mr":"उघड्यावर कचरा टाकणे"}},{"value":"drainage_overflow","label":{"en":"Drainage Overflow","hi":"ड्रेनेज ओव्हरफ्लो","mr":"ड्रेनेज ओव्हरफ्लो"}},{"value":"sweeping_req","label":{"en":"Street Sweeping Required","hi":"रस्ता सफाई आवश्यक","mr":"रस्ता सफाई आवश्यक"}}]', NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1179, 11, 68, N'complainantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Complainant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1180, 11, 68, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1181, 11, 68, N'landmark', N'Landmark', N'लँडमार्क (जवळचे ठिकाण)', N'text', N'Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1182, 11, 68, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Complainant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
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
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1184, 11, 68, N'zoneId', N'Zone', N'झोन', N'select', N'Location Details', N'[
  {"value":"A","label":{"en":"A","hi":"A","mr":"प्रभाग समिती अ"}},
  {"value":"B","label":{"en":"B","hi":"B","mr":"प्रभाग समिती ब"}},
  {"value":"C","label":{"en":"C","hi":"C","mr":"प्रभाग समिती क"}},
  {"value":"D","label":{"en":"D","hi":"D","mr":"प्रभाग समिती ड"}}
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-21T18:45:49.343', NULL, NULL),
    (1185, 6, 56, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1186, 6, 56, N'dateOfBirth', N'Student Date of Birth', N'विद्यार्थ्याची जन्मतारीख', N'date', N'Student Details', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"today"}', 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1187, 6, 56, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1188, 6, 56, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1189, 6, 56, N'fatherFullName', N'Father / Guardian Full Name', N'वडील / पालक यांचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1190, 6, 56, N'grNumber', N'General Register (G.R.) / Roll No', N'जनरल रजिस्टर (जी.आर.) / रोल क्रमांक', N'text', N'School Details', NULL, NULL, N'{
  "maxLength": 15,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1191, 6, 56, N'lastStandardStudied', N'Last Standard / Class Studied', N'शेवटची शिकलेली इयत्ता / वर्ग', N'select', N'School Details', N'[{"value":"std_1","label":{"en":"1st Std","hi":"१ ली","mr":"इयत्ता १ ली"}},{"value":"std_2","label":{"en":"2nd Std","hi":"२ री","mr":"इयत्ता २ री"}},{"value":"std_3","label":{"en":"3rd Std","hi":"३ री","mr":"इयत्ता ३ री"}},{"value":"std_4","label":{"en":"4th Std","hi":"४ थी","mr":"इयत्ता ४ थी"}},{"value":"std_5","label":{"en":"5th Std","hi":"५ वी","mr":"इयत्ता ५ वी"}},{"value":"std_6","label":{"en":"6th Std","hi":"६ वी","mr":"इयत्ता ६ वी"}},{"value":"std_7","label":{"en":"7th Std","hi":"७ वी","mr":"इयत्ता ७ वी"}},{"value":"std_8","label":{"en":"8th Std","hi":"८ वी","mr":"इयत्ता ८ वी"}},{"value":"std_9","label":{"en":"9th Std","hi":"९ वी","mr":"इयत्ता ९ वी"}},{"value":"std_10","label":{"en":"10th Std","hi":"१० वी","mr":"इयत्ता १० वी"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1192, 6, 56, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1193, 6, 56, N'motherFullName', N'Mother Full Name', N'आईचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1194, 6, 56, N'reasonForTC', N'Reason for Transfer Certificate', N'बदली प्रमाणपत्राचे कारण', N'select', N'Request Details', N'[{"value":"parent_transfer","label":{"en":"Parent Job Transfer","hi":"पालकांची बदली","mr":"पालकांची नोकरीतील बदली"}},{"value":"higher_studies","label":{"en":"Higher Studies / Admission","hi":"पुढील शिक्षण","mr":"पुढील शिक्षण / प्रवेश"}},{"value":"residence_shift","label":{"en":"Change of Residence","hi":"रहिवास बदल","mr":"रहिवास बदल"}},{"value":"other","label":{"en":"Other Reason","hi":"इतर कारण","mr":"इतर कारण"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1195, 6, 56, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {
    "value": "Marathi Boys School No. 4, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 4, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ४, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ४, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 7, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 7, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ७, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ७, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 9, Kala Maroti",
    "label": {
      "en": "Marathi Boys School No. 9, Kala Maroti",
      "hi": "मराठी बालक विद्यालय क्र. ९, काळा मारोती",
      "mr": "मराठी मुलांची शाळा क्र. ९, काळा मारोती"
    }
  },
  {
    "value": "Marathi Boys School No. 12, Naigaon",
    "label": {
      "en": "Marathi Boys School No. 12, Naigaon",
      "hi": "मराठी बालक विद्यालय क्र. १२, नायगाव",
      "mr": "मराठी मुलांची शाळा क्र. १२, नायगाव"
    }
  },
  {
    "value": "Marathi Boys School No. 14, Sindhi Camp",
    "label": {
      "en": "Marathi Boys School No. 14, Sindhi Camp",
      "hi": "मराठी बालक विद्यालय क्र. १४, सिंधी कॅम्प",
      "mr": "मराठी मुलांची शाळा क्र. १४, सिंधी कॅम्प"
    }
  },
  {
    "value": "Marathi Boys School No. 16, Adarsh Colony",
    "label": {
      "en": "Marathi Boys School No. 16, Adarsh Colony",
      "hi": "मराठी बालक विद्यालय क्र. १६, आदर्श कॉलनी",
      "mr": "मराठी मुलांची शाळा क्र. १६, आदर्श कॉलनी"
    }
  },
  {
    "value": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
    "label": {
      "en": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
      "hi": "मराठी बालक विद्यालय क्र. १७, शिव नगर, पानी की टंकी के पास",
      "mr": "मराठी मुलांची शाळा क्र. १७, शिव नगर, पाण्याच्या टाकीजवळ"
    }
  },
  {
    "value": "Marathi Boys School No. 18, Ashok Nagar",
    "label": {
      "en": "Marathi Boys School No. 18, Ashok Nagar",
      "hi": "मराठी बालक विद्यालय क्र. १८, अशोक नगर",
      "mr": "मराठी मुलांची शाळा क्र. १८, अशोक नगर"
    }
  },
  {
    "value": "Marathi Boys School No. 19, Harihar Peth",
    "label": {
      "en": "Marathi Boys School No. 19, Harihar Peth",
      "hi": "मराठी बालक विद्यालय क्र. १९, हरीहर पेठ",
      "mr": "मराठी मुलांची शाळा क्र. १९, हरीहर पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 22, Krishna Nagar",
    "label": {
      "en": "Marathi Boys School No. 22, Krushi Nagar",
      "hi": "मराठी बालक विद्यालय क्र. २२, कृषी नगर",
      "mr": "मराठी मुलांची शाळा क्र. २२, कृषी नगर"
    } 
  },
  {
    "value": "Marathi Boys School No. 26, Shiv Sena Vasahat",
    "label": {
      "en": "Marathi Boys School No. 26, Shiv Sena Vasahat",
      "hi": "मराठी बालक विद्यालय क्र. २६, शिवसेना वसाहत",
      "mr": "मराठी मुलांची शाळा क्र. २६, शिवसेना वसाहत"
    }
  },
  {
    "value": "Hindi Boys School No. 1, Near City Kotwali",
    "label": {
      "en": "Hindi Boys School No. 1, Near City Kotwali",
      "hi": "हिंदी बालक विद्यालय क्र. १, सिटी कोतवाली के पास",
      "mr": "हिंदी बालक शाळा क्र. १, सिटी कोतवाली जवळ"
    }
  },
  {
    "value": "Hindi Boys School No. 2, Ashok Nagar",
    "label": {
      "en": "Hindi Boys School No. 2, Ashok Nagar",
      "hi": "हिंदी बालक विद्यालय क्र. २, अशोक नगर",
      "mr": "हिंदी बालक शाळा क्र. २, अशोक नगर"
    }
  },
  {
    "value": "Hindi Boys School No. 6, Lakkadganj",
    "label": {
      "en": "Hindi Boys School No. 6, Lakkadganj",
      "hi": "हिंदी बालक विद्यालय क्र. ६, लक्कडगंज",
      "mr": "हिंदी बालक शाळा क्र. ६, लक्कडगंज"
    }
  },
  {
    "value": "Hindi Boys School No. 8, Harihar Peth",
    "label": {
      "en": "Hindi Boys School No. 8, Harihar Peth",
      "hi": "हिंदी बालक विद्यालय क्र. ८, हरीहर पेठ",
      "mr": "हिंदी बालक शाळा क्र. ८, हरीहर पेठ"
    }
  },
  {
    "value": "Sindhi Hindi School No. 1, Gandhi Nagar",
    "label": {
      "en": "Sindhi Hindi School No. 1, Gandhi Nagar",
      "hi": "सिंधी हिंदी बालक विद्यालय क्र. १, गांधी नगर",
      "mr": "सिंधी हिंदी शाळा क्र. १, गांधी नगर"
    }
  },
  {
    "value": "Gujarati Boys School No. 1, Swatantryaveer Vidyalaya",
    "label": {
      "en": "Gujarati Boys School No. 1, Swawlambi Vidyalaya",
      "hi": "गुजराती बालक विद्यालय क्र. १, स्वावलंबी विद्यालय",
      "mr": "गुजराती बालक शाळा क्र. १, स्वावलंबी विद्यालय"
    }
  },
  {
    "value": "Urdu Boys School No. 1, Near AMC",
    "label": {
      "en": "Urdu Boys School No. 1, Near AMC",
      "hi": "उर्दू बालक विद्यालय क्र. १, मनपा जवळ",
      "mr": "उर्दू मुलांची शाळा क्र. १, मनपा जवळ"
    }
  },
  {
    "value": "Urdu Boys School No. 2, Potha Chowk",
    "label": {
      "en": "Urdu Boys School No. 2, Pola Chowk",
      "hi": "उर्दू बालक विद्यालय क्र. २, पोळा चौक",
      "mr": "उर्दू मुलांची शाळा क्र. २, पोळा चौक"
    }
  },
  {
    "value": "Urdu Boys School No. 6, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 6, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. ६, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. ६, अकोट फैल"
    }
  },
  {
    "value": "Urdu Boys School No. 7, Naigaon",
    "label": {
      "en": "Urdu Boys School No. 7, Naigaon",
      "hi": "उर्दू बालक विद्यालय क्र. ७, नायगाव",
      "mr": "उर्दू मुलांची शाळा क्र. ७, नायगाव"
    }
  },
  {
    "value": "Urdu Boys School No. 8, Lakkadganj",
    "label": {
      "en": "Urdu Boys School No. 8, Lakkadganj",
      "hi": "उर्दू बालक विद्यालय क्र. ८, लक्कडगंज",
      "mr": "उर्दू मुलांची शाळा क्र. ८, लक्कडगंज"
    }
  },
  {
    "value": "Urdu Boys School No. 9, Khadan",
    "label": {
      "en": "Urdu Boys School No. 9, Khadan",
      "hi": "उर्दू बालक विद्यालय क्र. ९, खदान",
      "mr": "उर्दू मुलांची शाळा क्र. ९, खदान"
    }
  },
  {
    "value": "Urdu Boys School No. 10, Dabki Road",
    "label": {
      "en": "Urdu Boys School No. 10, Dabki Road",
      "hi": "उर्दू बालक विद्यालय क्र. १०, डाबकी रोड",
      "mr": "उर्दू मुलांची शाळा क्र. १०, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Boys School No. 11, Harihar Peth",
    "label": {
      "en": "Urdu Boys School No. 11, Harihar Peth",
      "hi": "उर्दू बालक विद्यालय क्र. ११, हरीहर पेठ",
      "mr": "उर्दू मुलांची शाळा क्र. ११, हरीहर पेठ"
    }
  },
  {
    "value": "Urdu Boys School No. 12, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 12, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. १२, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. १२, अकोट फैल"
    }
  },
  {
    "value": "Urdu Girls School No. 1, Gandhi Road",
    "label": {
      "en": "Urdu Girls School No. 1, Gandhi Road",
      "hi": "उर्दू कन्या विद्यालय क्र. १, गांधी रोड",
      "mr": "उर्दू कन्या शाळा क्र. १, गांधी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 3, Pola Chowk",
    "label": {
      "en": "Urdu Girls School No. 3, Pola Chowk",
      "hi": "उर्दू कन्या विद्यालय क्र. ३, पोळा चौक",
      "mr": "उर्दू कन्या शाळा क्र. ३, पोळा चौक"
    }
  },
  {
    "value": "Urdu Girls School No. 4, Dabki Road",
    "label": {
      "en": "Urdu Girls School No. 4, Dabki Road",
      "hi": "उर्दू कन्या विद्यालय क्र. ४, डाबकी रोड",
      "mr": "उर्दू कन्या शाळा क्र. ४, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 5, Harihar Peth",
    "label": {
      "en": "Urdu Girls School No. 5, Harihar Peth",
      "hi": "उर्दू कन्या विद्यालय क्र. ५, हरीहर पेठ",
      "mr": "उर्दू कन्या शाळा क्र. ५, हरीहर पेठ"
    }
  }
]', NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1196, 6, 56, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1197, 6, 57, N'affidavitDetails', N'FIR / Affidavit Registration Details', N'एफआयआर / प्रतिज्ञापत्र नोंदणी तपशील', N'textarea', N'Request Details', NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1198, 6, 57, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1199, 6, 57, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1200, 6, 57, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1201, 6, 57, N'examinationPassed', N'Examination Name', N'परीक्षेचे नाव', N'select', N'Exam Details', N'[{"value":"ssc","label":{"en":"10th Board (SSC)","hi":"10वीं बोर्ड (SSC)","mr":"इयत्ता १० वी (SSC)"}},{"value":"std_5_scholarship","label":{"en":"5th Std Scholarship Exam","hi":"5वीं शिष्यवृत्ती","mr":"इयत्ता ५ वी शिष्यवृत्ती"}},{"value":"std_8_scholarship","label":{"en":"8th Std Scholarship Exam","hi":"8वीं शिष्यवृत्ती","mr":"इयत्ता ८ वी शिष्यवृत्ती"}},{"value":"primary_exam","label":{"en":"Annual Primary Exam","hi":"वार्षिक परीक्षा","mr":"वार्षिक परीक्षा"}},{"value":"other","label":{"en":"Other Exam","hi":"अन्य","mr":"इतर परीक्षा"}}]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1202, 6, 57, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 2, NULL, NULL, 10, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1203, 6, 57, N'passingYear', N'Passing Year', N'उत्तीर्ण वर्ष', N'number', N'Exam Details', NULL, NULL, N'{"min":0}', 1, 8, NULL, NULL, 4, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1204, 6, 57, N'reasonForDuplicate', N'Reason for Duplicate Marksheet', N'डुप्लिकेट गुणपत्रिकेचे कारण', N'select', N'Request Details', N'[{"value":"lost","label":{"en":"Original Lost","hi":"गहाळ झाले","mr":"मूळ गुणपत्रक गहाळ झाले"}},{"value":"damaged","label":{"en":"Original Damaged / Torn","hi":"खराब / फाटले","mr":"खराब / फाटले आहे"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"सापडत नाही","mr":"सापडत नाही"}}]', NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1205, 6, 57, N'schoolName', N'School Name', N'शाळेचे नाव', N'select', N'School Details', N'[
  {
    "value": "Marathi Boys School No. 4, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 4, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ४, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ४, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 7, Ramdas Peth",
    "label": {
      "en": "Marathi Boys School No. 7, Ramdas Peth",
      "hi": "मराठी बालक विद्यालय क्र. ७, रामदास पेठ",
      "mr": "मराठी मुलांची शाळा क्र. ७, रामदास पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 9, Kala Maroti",
    "label": {
      "en": "Marathi Boys School No. 9, Kala Maroti",
      "hi": "मराठी बालक विद्यालय क्र. ९, काळा मारोती",
      "mr": "मराठी मुलांची शाळा क्र. ९, काळा मारोती"
    }
  },
  {
    "value": "Marathi Boys School No. 12, Naigaon",
    "label": {
      "en": "Marathi Boys School No. 12, Naigaon",
      "hi": "मराठी बालक विद्यालय क्र. १२, नायगाव",
      "mr": "मराठी मुलांची शाळा क्र. १२, नायगाव"
    }
  },
  {
    "value": "Marathi Boys School No. 14, Sindhi Camp",
    "label": {
      "en": "Marathi Boys School No. 14, Sindhi Camp",
      "hi": "मराठी बालक विद्यालय क्र. १४, सिंधी कॅम्प",
      "mr": "मराठी मुलांची शाळा क्र. १४, सिंधी कॅम्प"
    }
  },
  {
    "value": "Marathi Boys School No. 16, Adarsh Colony",
    "label": {
      "en": "Marathi Boys School No. 16, Adarsh Colony",
      "hi": "मराठी बालक विद्यालय क्र. १६, आदर्श कॉलनी",
      "mr": "मराठी मुलांची शाळा क्र. १६, आदर्श कॉलनी"
    }
  },
  {
    "value": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
    "label": {
      "en": "Marathi Boys School No. 17, Shiv Nagar, Near Water Tank",
      "hi": "मराठी बालक विद्यालय क्र. १७, शिव नगर, पानी की टंकी के पास",
      "mr": "मराठी मुलांची शाळा क्र. १७, शिव नगर, पाण्याच्या टाकीजवळ"
    }
  },
  {
    "value": "Marathi Boys School No. 18, Ashok Nagar",
    "label": {
      "en": "Marathi Boys School No. 18, Ashok Nagar",
      "hi": "मराठी बालक विद्यालय क्र. १८, अशोक नगर",
      "mr": "मराठी मुलांची शाळा क्र. १८, अशोक नगर"
    }
  },
  {
    "value": "Marathi Boys School No. 19, Harihar Peth",
    "label": {
      "en": "Marathi Boys School No. 19, Harihar Peth",
      "hi": "मराठी बालक विद्यालय क्र. १९, हरीहर पेठ",
      "mr": "मराठी मुलांची शाळा क्र. १९, हरीहर पेठ"
    }
  },
  {
    "value": "Marathi Boys School No. 22, Krishna Nagar",
    "label": {
      "en": "Marathi Boys School No. 22, Krushi Nagar",
      "hi": "मराठी बालक विद्यालय क्र. २२, कृषी नगर",
      "mr": "मराठी मुलांची शाळा क्र. २२, कृषी नगर"
    } 
  },
  {
    "value": "Marathi Boys School No. 26, Shiv Sena Vasahat",
    "label": {
      "en": "Marathi Boys School No. 26, Shiv Sena Vasahat",
      "hi": "मराठी बालक विद्यालय क्र. २६, शिवसेना वसाहत",
      "mr": "मराठी मुलांची शाळा क्र. २६, शिवसेना वसाहत"
    }
  },
  {
    "value": "Hindi Boys School No. 1, Near City Kotwali",
    "label": {
      "en": "Hindi Boys School No. 1, Near City Kotwali",
      "hi": "हिंदी बालक विद्यालय क्र. १, सिटी कोतवाली के पास",
      "mr": "हिंदी बालक शाळा क्र. १, सिटी कोतवाली जवळ"
    }
  },
  {
    "value": "Hindi Boys School No. 2, Ashok Nagar",
    "label": {
      "en": "Hindi Boys School No. 2, Ashok Nagar",
      "hi": "हिंदी बालक विद्यालय क्र. २, अशोक नगर",
      "mr": "हिंदी बालक शाळा क्र. २, अशोक नगर"
    }
  },
  {
    "value": "Hindi Boys School No. 6, Lakkadganj",
    "label": {
      "en": "Hindi Boys School No. 6, Lakkadganj",
      "hi": "हिंदी बालक विद्यालय क्र. ६, लक्कडगंज",
      "mr": "हिंदी बालक शाळा क्र. ६, लक्कडगंज"
    }
  },
  {
    "value": "Hindi Boys School No. 8, Harihar Peth",
    "label": {
      "en": "Hindi Boys School No. 8, Harihar Peth",
      "hi": "हिंदी बालक विद्यालय क्र. ८, हरीहर पेठ",
      "mr": "हिंदी बालक शाळा क्र. ८, हरीहर पेठ"
    }
  },
  {
    "value": "Sindhi Hindi School No. 1, Gandhi Nagar",
    "label": {
      "en": "Sindhi Hindi School No. 1, Gandhi Nagar",
      "hi": "सिंधी हिंदी बालक विद्यालय क्र. १, गांधी नगर",
      "mr": "सिंधी हिंदी शाळा क्र. १, गांधी नगर"
    }
  },
  {
    "value": "Gujarati Boys School No. 1, Swatantryaveer Vidyalaya",
    "label": {
      "en": "Gujarati Boys School No. 1, Swawlambi Vidyalaya",
      "hi": "गुजराती बालक विद्यालय क्र. १, स्वावलंबी विद्यालय",
      "mr": "गुजराती बालक शाळा क्र. १, स्वावलंबी विद्यालय"
    }
  },
  {
    "value": "Urdu Boys School No. 1, Near AMC",
    "label": {
      "en": "Urdu Boys School No. 1, Near AMC",
      "hi": "उर्दू बालक विद्यालय क्र. १, मनपा जवळ",
      "mr": "उर्दू मुलांची शाळा क्र. १, मनपा जवळ"
    }
  },
  {
    "value": "Urdu Boys School No. 2, Potha Chowk",
    "label": {
      "en": "Urdu Boys School No. 2, Pola Chowk",
      "hi": "उर्दू बालक विद्यालय क्र. २, पोळा चौक",
      "mr": "उर्दू मुलांची शाळा क्र. २, पोळा चौक"
    }
  },
  {
    "value": "Urdu Boys School No. 6, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 6, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. ६, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. ६, अकोट फैल"
    }
  },
  {
    "value": "Urdu Boys School No. 7, Naigaon",
    "label": {
      "en": "Urdu Boys School No. 7, Naigaon",
      "hi": "उर्दू बालक विद्यालय क्र. ७, नायगाव",
      "mr": "उर्दू मुलांची शाळा क्र. ७, नायगाव"
    }
  },
  {
    "value": "Urdu Boys School No. 8, Lakkadganj",
    "label": {
      "en": "Urdu Boys School No. 8, Lakkadganj",
      "hi": "उर्दू बालक विद्यालय क्र. ८, लक्कडगंज",
      "mr": "उर्दू मुलांची शाळा क्र. ८, लक्कडगंज"
    }
  },
  {
    "value": "Urdu Boys School No. 9, Khadan",
    "label": {
      "en": "Urdu Boys School No. 9, Khadan",
      "hi": "उर्दू बालक विद्यालय क्र. ९, खदान",
      "mr": "उर्दू मुलांची शाळा क्र. ९, खदान"
    }
  },
  {
    "value": "Urdu Boys School No. 10, Dabki Road",
    "label": {
      "en": "Urdu Boys School No. 10, Dabki Road",
      "hi": "उर्दू बालक विद्यालय क्र. १०, डाबकी रोड",
      "mr": "उर्दू मुलांची शाळा क्र. १०, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Boys School No. 11, Harihar Peth",
    "label": {
      "en": "Urdu Boys School No. 11, Harihar Peth",
      "hi": "उर्दू बालक विद्यालय क्र. ११, हरीहर पेठ",
      "mr": "उर्दू मुलांची शाळा क्र. ११, हरीहर पेठ"
    }
  },
  {
    "value": "Urdu Boys School No. 12, Akot Fail",
    "label": {
      "en": "Urdu Boys School No. 12, Akot Fail",
      "hi": "उर्दू बालक विद्यालय क्र. १२, अकोट फैल",
      "mr": "उर्दू मुलांची शाळा क्र. १२, अकोट फैल"
    }
  },
  {
    "value": "Urdu Girls School No. 1, Gandhi Road",
    "label": {
      "en": "Urdu Girls School No. 1, Gandhi Road",
      "hi": "उर्दू कन्या विद्यालय क्र. १, गांधी रोड",
      "mr": "उर्दू कन्या शाळा क्र. १, गांधी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 3, Pola Chowk",
    "label": {
      "en": "Urdu Girls School No. 3, Pola Chowk",
      "hi": "उर्दू कन्या विद्यालय क्र. ३, पोळा चौक",
      "mr": "उर्दू कन्या शाळा क्र. ३, पोळा चौक"
    }
  },
  {
    "value": "Urdu Girls School No. 4, Dabki Road",
    "label": {
      "en": "Urdu Girls School No. 4, Dabki Road",
      "hi": "उर्दू कन्या विद्यालय क्र. ४, डाबकी रोड",
      "mr": "उर्दू कन्या शाळा क्र. ४, डाबकी रोड"
    }
  },
  {
    "value": "Urdu Girls School No. 5, Harihar Peth",
    "label": {
      "en": "Urdu Girls School No. 5, Harihar Peth",
      "hi": "उर्दू कन्या विद्यालय क्र. ५, हरीहर पेठ",
      "mr": "उर्दू कन्या शाळा क्र. ५, हरीहर पेठ"
    }
  }
]', NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1206, 6, 57, N'seatNumber', N'Seat / Roll Number', N'आसन क्रमांक / रोल क्रमांक', N'text', N'Exam Details', NULL, NULL, N'{
  "maxLength": 10,
  "pattern": "^[A-Za-z0-9/-]+$"
}', 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1207, 6, 57, N'studentFullName', N'Student Full Name', N'विद्यार्थ्याचे पूर्ण नाव', N'text', N'Student Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.123', NULL, NULL),
    (1208, 4, 46, N'CommencementCertificateDoc', N'Construction Commencement Certificate', N'बांधकाम आरंभ प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1210, 6, 56, N'previousMarksheetDoc', N'Latest Paid Tax Receipt', N'नवीनतम भरलेली कर पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, '2026-09-10T08:35:52.190'),
    (1211, 6, 56, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1212, 6, 57, N'firOrAffidavitDoc', N'Latest Paid Tax Receipt', N'नवीनतम भरलेली कर पावती', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, '2026-09-10T08:35:52.190'),
    (1213, 6, 57, N'studentIdDoc', N'Student ID Proof / Aadhaar', N'विद्यार्थी ओळखपत्र / आधार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1214, 7, 58, N'bmwAgreementDoc', N'Bio Medical Waste Disposal Agreement', N'जैव वैद्यकीय कचरा विल्हेवाट करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1215, 7, 58, N'doctorDegreeDoc', N'Chief Doctor MMC / Degree Certificate', N'मुख्य डॉक्टर एमएमसी / पदवी प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1216, 7, 58, N'fireNocDoc', N'Fire Safety NOC Document', N'अग्निसुरक्षा ना हरकत प्रमाणपत्र दस्तऐवज', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1217, 7, 59, N'fireNocDoc', N'Valid Fire Safety NOC', N'वैध अग्निसुरक्षा ना हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1218, 7, 59, N'oldLicenseDoc', N'Previous Nursing Home License Copy', N'मागील नर्सिंग होम परवान्याची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1219, 7, 60, N'newHolderIdDoc', N'ID Proof of New License Holder', N'नवीन परवानाधारकाचा ओळखपत्र पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1220, 7, 60, N'transferAgreementDoc', N'Transfer Agreement / Partnership Deed', N'हस्तांतरण करार / भागीदारी करारनामा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (1221, 11, 68, N'spotPhotoDoc', N'Spot Photograph of Location', N'ठिकाणाचे छायाचित्र', N'fileLatLog', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:51:28.150', NULL, NULL),
    (3004, 2, 19, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3005, 2, 20, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3006, 2, 26, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3008, 2, 80, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3009, 2, 81, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3010, 2, 82, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3011, 2, 83, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3012, 2, 84, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3013, 2, 85, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3014, 2, 86, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3015, 2, 87, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3016, 2, 100, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3017, 2, 101, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:37.940', NULL, NULL),
    (3018, 3, 33, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3019, 3, 36, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3020, 3, 137, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3021, 3, 138, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3022, 3, 139, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3023, 3, 140, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3024, 3, 141, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3025, 3, 142, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3026, 3, 143, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3027, 3, 144, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3028, 3, 158, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3029, 3, 159, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3030, 3, 160, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3031, 3, 161, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3032, 13, 162, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T17:59:44.977', NULL, NULL),
    (3033, 1, 145, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3034, 1, 146, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3035, 1, 147, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3036, 1, 148, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3037, 1, 149, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3038, 1, 150, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3039, 1, 151, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3040, 1, 152, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3041, 1, 153, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3042, 1, 154, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3043, 1, 155, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3044, 1, 156, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (3045, 1, 157, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-12T18:00:25.820', NULL, NULL),
    (4002, 12, 49, N'DOC_POTHOLE_PHOTO', N'Photo of Pothole Location', N'खड्ड्याचे छायाचित्र / फोटो', N'fileLatLog', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.233', NULL, NULL),
    (4003, 12, 50, N'DOC_SEWER_PHOTO', N'Photo of Damaged / Open Sewer Cover', N'उघड्या / तुटलेल्या मॅनहोलचे छायाचित्र', N'fileLatLog', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 14, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.253', NULL, NULL),
    (4004, 2, 19, N'DOC_WATER_BILL_19', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.277', NULL, NULL),
    (4005, 2, 19, N'DOC_APPLICANT_ID_19', N'Fitter Inspection Report', N'फिटर तपासणी अहवाल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.287', NULL, NULL),
    (4006, 2, 20, N'DOC_WATER_BILL_20', N'Previous Water Bill', N'मागील पाणीपट्टी बिल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.290', NULL, NULL),
    (4007, 2, 20, N'DOC_APPLICANT_ID_20', N'Current Photograph of the Water Meter', N'पाणी मीटरचा सद्यस्थितीतील छायाचित्र', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.293', NULL, NULL),
    (4008, 2, 26, N'DOC_WATER_BILL_26', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.297', NULL, NULL),
    (4010, 3, 33, N'DOC_RENT_AGREEMENT_33', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.307', NULL, NULL),
    (4011, 3, 33, N'DOC_APPLICANT_ID_33', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.310', NULL, NULL),
    (4013, 3, 36, N'DOC_RENT_AGREEMENT_36', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.320', NULL, NULL),
    (4014, 3, 36, N'DOC_APPLICANT_ID_36', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.327', NULL, NULL),
    (4016, 2, 80, N'DOC_WATER_BILL_80', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.330', NULL, NULL),
    (4017, 2, 80, N'DOC_APPLICANT_ID_80', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.370', NULL, NULL),
    (4018, 2, 81, N'DOC_WATER_BILL_81', N'Fitter Inspection Report.', N'फिटर तपासणी अहवाल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.373', NULL, NULL),
    (4020, 2, 82, N'DOC_WATER_BILL_82', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.380', NULL, NULL),
    (4021, 2, 82, N'DOC_APPLICANT_ID_82', N'Fitter Inspection Report', N'फिटर तपासणी अहवाल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.380', NULL, NULL),
    (4022, 2, 83, N'DOC_WATER_BILL_83', N'Previous Outstanding Water Bill Paid Receipt', N'मागील थकीत पाणीपट्टी बिल भरल्याची पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.383', NULL, NULL),
    (4024, 2, 84, N'DOC_WATER_BILL_84', N'Latest Paid Water Bill Receipt', N'नवीनतम पाणीपट्टी बिल भरल्याची पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.390', NULL, NULL),
    (4026, 2, 85, N'DOC_WATER_BILL_85', N'Site Inspection Report', N'स्थळ पाहणी अहवाल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.397', NULL, NULL),
    (4027, 2, 85, N'DOC_APPLICANT_ID_85', N'Photograph of the Faulty Water Meter', N'सदोष पाणी मीटरचे छायाचित्र', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.403', NULL, NULL),
    (4028, 2, 86, N'DOC_WATER_BILL_86', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.407', NULL, NULL),
    (4029, 2, 86, N'DOC_APPLICANT_ID_86', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.407', NULL, NULL),
    (4030, 2, 87, N'DOC_WATER_BILL_87', N'Latest Water Bill / Property Tax Receipt', N'चालू पाणी बिल / मालमत्ता कर पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.410', NULL, NULL),
    (4031, 2, 87, N'DOC_APPLICANT_ID_87', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.413', NULL, NULL),
    (4032, 2, 100, N'DOC_WATER_BILL_100', N'Experience Certificate', N'अनुभव प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.420', NULL, NULL),
    (4033, 2, 100, N'DOC_APPLICANT_ID_100', N'Aadhar Card', N'आधार कार्ड', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.473', NULL, NULL),
    (4035, 2, 101, N'DOC_APPLICANT_ID_101', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.480', NULL, NULL),
    (4036, 3, 137, N'DOC_RENT_AGREEMENT_137', N'Property Tax Paid Receipt', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.483', NULL, NULL),
    (4037, 3, 137, N'DOC_APPLICANT_ID_137', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.487', NULL, NULL),
    (4038, 3, 137, N'DOC_NOC_CERTIFICATE_137', N'Registration Certificate / Licence', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.490', NULL, NULL),
    (4039, 3, 138, N'DOC_RENT_AGREEMENT_138', N'Property Tax Paid Receipt', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.493', NULL, NULL),
    (4040, 3, 138, N'DOC_APPLICANT_ID_138', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.493', NULL, NULL),
    (4041, 3, 138, N'DOC_NOC_CERTIFICATE_138', N'Previous Trade Licence', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.497', NULL, NULL),
    (4043, 3, 139, N'DOC_APPLICANT_ID_139', N'Aadhaar Card of the New Licence Holder / Transferee', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.503', NULL, NULL),
    (4044, 3, 139, N'DOC_NOC_CERTIFICATE_139', N'Consent Letter / NOC', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.507', NULL, NULL),
    (4045, 3, 140, N'DOC_RENT_AGREEMENT_140', N'No mandatory document required', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.510', NULL, NULL),
    (4048, 3, 141, N'DOC_RENT_AGREEMENT_141', N'Registration Certificate / Licence', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.517', NULL, NULL),
    (4049, 3, 141, N'DOC_APPLICANT_ID_141', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.520', NULL, NULL),
    (4051, 3, 142, N'DOC_RENT_AGREEMENT_142', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.527', NULL, NULL),
    (4052, 3, 142, N'DOC_APPLICANT_ID_142', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.530', NULL, NULL),
    (4054, 3, 143, N'DOC_RENT_AGREEMENT_143', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.533', NULL, NULL),
    (4055, 3, 143, N'DOC_APPLICANT_ID_143', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.537', NULL, NULL),
    (4057, 3, 144, N'DOC_RENT_AGREEMENT_144', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.543', NULL, NULL),
    (4060, 1, 145, N'DOC_PROP_OWNERSHIP_145', N'Application form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.550', NULL, NULL),
    (4061, 1, 145, N'DOC_APPLICANT_ID_145', N'Registered Sale Deed / Purchase Deed', N'नोंदणीकृत विक्रीखत / खरेदीखत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.557', NULL, NULL),
    (4062, 1, 146, N'DOC_PROP_OWNERSHIP_146', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.560', NULL, NULL),
    (4063, 1, 146, N'DOC_APPLICANT_ID_146', N'Site Inspection Report', N'स्थळ पाहणी अहवाल', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.563', NULL, NULL),
    (4064, 1, 147, N'DOC_PROP_OWNERSHIP_147', N'No mandatory document required', N'कोणतेही अनिवार्य कागदपत्र आवश्यक नाही', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.567', NULL, NULL),
    (4066, 1, 148, N'DOC_PROP_OWNERSHIP_148', N'Application form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.570', NULL, NULL),
    (4067, 1, 148, N'DOC_APPLICANT_ID_148', N'Document proving eligibility for the requested tax exemption (as applicable)', N'मागितलेल्या कर सवलतीसाठी पात्रता सिद्ध करणारे कागदपत्र (लागू असल्यास)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.573', NULL, NULL),
    (4068, 1, 149, N'DOC_PROP_OWNERSHIP_149', N'No mandatory document required', N'कोणतेही अनिवार्य कागदपत्र आवश्यक नाही', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.577', NULL, NULL),
    (4070, 1, 150, N'DOC_PROP_OWNERSHIP_150', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.580', NULL, NULL),
    (4071, 1, 150, N'DOC_APPLICANT_ID_150', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.583', NULL, NULL),
    (4072, 1, 151, N'DOC_PROP_OWNERSHIP_151', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.587', NULL, NULL),
    (4074, 1, 152, N'DOC_PROP_OWNERSHIP_152', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.637', NULL, NULL),
    (4075, 1, 152, N'DOC_APPLICANT_ID_152', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.640', NULL, NULL),
    (4076, 1, 153, N'DOC_PROP_OWNERSHIP_153', N'Application form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.640', NULL, NULL),
    (4077, 1, 153, N'DOC_APPLICANT_ID_153', N'Property Ownership Document / Index-II', N'मालमत्ता मालकी हक्क पुरावा / इंडेक्स-२', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.643', NULL, NULL),
    (4078, 1, 154, N'DOC_PROP_OWNERSHIP_154', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.643', NULL, NULL),
    (4079, 1, 154, N'DOC_APPLICANT_ID_154', N'Current Financial Year Property Tax Paid Receipt', N'चालू आर्थिक वर्षातील मालमत्ता कर भरल्याची पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.647', NULL, NULL),
    (4080, 1, 155, N'DOC_PROP_OWNERSHIP_155', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.683', NULL, NULL),
    (4081, 1, 155, N'DOC_APPLICANT_ID_155', N'Current Financial Year Property Tax Paid Receipt', N'चालू आर्थिक वर्षातील मालमत्ता कर भरल्याची पावती', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.730', NULL, NULL),
    (4082, 1, 156, N'DOC_PROP_OWNERSHIP_156', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.730', NULL, NULL),
    (4083, 1, 156, N'DOC_APPLICANT_ID_156', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.733', NULL, NULL),
    (4084, 1, 157, N'DOC_PROP_OWNERSHIP_157', N'Application Form', N'विनंती अर्ज', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.733', NULL, NULL),
    (4085, 1, 157, N'DOC_APPLICANT_ID_157', N'Registered Sale Deed / Purchase Deed', N'नोंदणीकृत विक्रीखत / खरेदीखत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.737', NULL, NULL),
    (4086, 3, 158, N'DOC_RENT_AGREEMENT_158', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.737', NULL, NULL),
    (4087, 3, 158, N'DOC_APPLICANT_ID_158', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.740', NULL, NULL),
    (4088, 3, 158, N'DOC_NOC_CERTIFICATE_158', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.740', NULL, NULL),
    (4089, 3, 159, N'DOC_RENT_AGREEMENT_159', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.743', NULL, NULL),
    (4090, 3, 159, N'DOC_APPLICANT_ID_159', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.747', NULL, NULL),
    (4091, 3, 159, N'DOC_NOC_CERTIFICATE_159', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.747', NULL, NULL),
    (4092, 3, 160, N'DOC_RENT_AGREEMENT_160', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.750', NULL, NULL),
    (4093, 3, 160, N'DOC_APPLICANT_ID_160', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.750', NULL, NULL),
    (4094, 3, 160, N'DOC_NOC_CERTIFICATE_160', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.753', NULL, NULL),
    (4095, 3, 161, N'DOC_RENT_AGREEMENT_161', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.757', NULL, NULL),
    (4096, 3, 161, N'DOC_APPLICANT_ID_161', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.760', NULL, NULL),
    (4097, 3, 161, N'DOC_NOC_CERTIFICATE_161', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.760', NULL, NULL),
    (4099, 13, 162, N'DOC_APPLICANT_ID_162', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.767', NULL, NULL),
    (4101, 4, 61, N'approvedPlanDocument', N'Approved Plan / Map', N'मंजूर नकाशाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4102, 4, 61, N'sevenTwelveOrSaleDeedDocument', N'7/12 Extract / Sale Deed', N'७/१२ उतारा / खरेदी खत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4103, 4, 61, N'rentAgreementDocument', N'Rent Agreement', N'भाडे करार', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 0, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T21:57:15.420', NULL, NULL),
    (4104, 4, 44, N'measurementMapDocument', N'Measurement Map / City Survey Map', N'मोजणी नकाशा / सिटी सर्व्हे नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T22:31:22.380', NULL, NULL),
    (4105, 4, 45, N'buildingPlanDrawingDoc', N'Building Plan / Construction Drawing', N'बांधकाम आराखडा / नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T22:56:11.760', NULL, NULL),
    (4106, 4, 45, N'approvedDrawingCopyDoc', N'Copy of Approved Drawing', N'मंजूर रेखांकनाची प्रत', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 53, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-17T22:56:11.760', NULL, NULL),
    (5102, 5, 53, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5103, 5, 53, N'middleName', N'Middle Name', N'मधले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5104, 5, 53, N'lastName', N'Last Name', N'आडनाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5105, 5, 53, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5106, 5, 53, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (5107, 5, 53, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (6101, 4, 46, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23T12:58:35.560', NULL, NULL),
    (6102, 7, 59, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23T13:00:21.937', NULL, NULL),
    (6103, 7, 60, N'email', N'Email', N'ईमेल', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23T13:01:31.673', NULL, NULL),
    (6104, 11, 68, N'email', N'Email', N'ईमेल', N'email', N'Complainant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23T13:06:20.847', NULL, NULL),
    (6105, 12, 48, N'mobileNo', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant / Organization Details', NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-23T18:28:41.520', NULL, NULL),
    (7299, 1, 145, N'DOC_PROPERTY_RECORD_145', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7300, 1, 145, N'DOC_BUILDING_PERMISSION_145', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7301, 1, 145, N'DOC_SITE_INSPECTION_145', N'Site Inspection Report.', N'स्थळ तपासणी अहवाल', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7302, 1, 153, N'DOC_BUILDING_PERMISSION_153', N'Building Permission / Sanctioned Building Plan.', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7303, 1, 156, N'DOC_PROPERTY_RECORD_156', N'Registered Sale Deed / Purchase Deed', N'नोंदणीकृत विक्रीखत / खरेदीखत', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.383', NULL, NULL),
    (7304, 1, 156, N'DOC_BUILDING_PERMISSION_156', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7305, 1, 156, N'DOC_PUBLIC_NOTICE_156', N'Public Notice / Declaration.', N'जाहीरनामा / घोषणापत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7306, 1, 157, N'DOC_PROPERTY_RECORD_157', N'Property Record Extract (Form D)', N'मालमत्ता अभिलेख उतारा (नमुना ड)', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7307, 1, 157, N'DOC_BUILDING_PERMISSION_157', N'Building Permission / Sanctioned Building Plan', N'बांधकाम परवानगी / मंजूर बांधकाम नकाशा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7308, 1, 157, N'DOC_PUBLIC_NOTICE_157', N'Public Notice / Declaration.', N'जाहीरनामा / घोषणापत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:24:12.387', NULL, NULL),
    (7309, 2, 19, N'DOC_REQUIRED_03_19', N'Site Inspection Report.', N'स्थळ तपासणी अहवाल', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7310, 2, 80, N'DOC_REQUIRED_03_80', N'Licensed Plumber''s Licence', N'परवानाधारक प्लंबरचा परवाना', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7311, 2, 80, N'DOC_REQUIRED_04_80', N'Fitter Inspection Report (Form XII)', N'फिटर तपासणी अहवाल (नमुना १२)', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7312, 2, 80, N'DOC_REQUIRED_05_80', N'Proposed Water Pipeline Layout / Map', N'प्रस्तावित पाणी पाइपलाइन आराखडा / नकाशा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.127', NULL, NULL),
    (7313, 2, 80, N'DOC_REQUIRED_06_80', N'Agreement on Rs.100 Stamp Paper', N'₹100 च्या मुद्रांक कागदावरील करारनामा', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7314, 2, 80, N'DOC_REQUIRED_07_80', N'Water Meter Purchase Invoice.', N'पाणी मीटर खरेदीचे बिल', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7315, 2, 82, N'DOC_REQUIRED_03_82', N'Photograph showing that the side connection has been disconnected / cut.', N'साईड कनेक्शन तोडले / कट केल्याचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7316, 2, 85, N'DOC_REQUIRED_03_85', N'Invoice / Bill for the Newly Installed Water Meter.', N'नव्याने बसवलेल्या पाणी मीटरचे बिल', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.130', NULL, NULL),
    (7317, 2, 100, N'DOC_REQUIRED_03_100', N'School Leaving Certificate', N'शाळा सोडल्याचा दाखला', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7319, 2, 100, N'DOC_REQUIRED_05_100', N'PAN Card', N'पॅन कार्ड', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7320, 2, 100, N'DOC_REQUIRED_06_100', N'Recent Passport-size Photograph.', N'नुकताच काढलेला पासपोर्ट आकाराचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7321, 2, 101, N'DOC_REQUIRED_03_101', N'Recent Passport-size Photograph', N'नुकताच काढलेला पासपोर्ट आकाराचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7322, 2, 101, N'DOC_REQUIRED_04_101', N'Plumber Licence Renewal Form signed by the Junior Engineer.', N'कनिष्ठ अभियंत्यांच्या स्वाक्षरीसह प्लंबर परवाना नूतनीकरण अर्ज', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T16:53:31.133', NULL, NULL),
    (7423, 3, 137, N'DOC_REQUIRED_04_137', N'Photograph of the Business Premises', N'व्यवसायाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.923', NULL, NULL),
    (7424, 3, 137, N'DOC_REQUIRED_05_137', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'जागा भाड्याने घेतली असल्यास भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.923', NULL, NULL),
    (7425, 3, 137, N'DOC_REQUIRED_06_137', N'Valid FSSAI Licence for a food-related business.', N'खाद्यपदार्थ संबंधित व्यवसायासाठी वैध FSSAI परवाना', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.927', NULL, NULL),
    (7426, 3, 158, N'DOC_REQUIRED_04_158', N'Photograph of the Lodging House Premises', N'निवासगृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7427, 3, 158, N'DOC_REQUIRED_05_158', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented.', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7428, 3, 159, N'DOC_REQUIRED_04_159', N'Photograph of the Lodging House Premises', N'निवासगृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7429, 3, 159, N'DOC_REQUIRED_05_159', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.933', NULL, NULL),
    (7430, 3, 159, N'DOC_REQUIRED_06_159', N'Previous Lodging House Licence', N'मागील निवासगृह परवाना', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7431, 3, 160, N'DOC_REQUIRED_04_160', N'Photograph of the Marriage Hall / Auditorium Premises', N'विवाह सभागृह / प्रेक्षागृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7432, 3, 160, N'DOC_REQUIRED_05_160', N'Rent Agreement or Property Owner''s Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7433, 3, 160, N'DOC_REQUIRED_06_160', N'Fire Department Certificate / Fire NOC', N'अग्निशमन विभागाचे प्रमाणपत्र / अग्निशमन ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7434, 3, 160, N'DOC_REQUIRED_07_160', N'Photographs of Parking Facilities', N'पार्किंग सुविधांचे फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7435, 3, 160, N'DOC_REQUIRED_08_160', N'Sanitation Certificate from the Health Department', N'आरोग्य विभागाचे स्वच्छता प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7436, 3, 160, N'DOC_REQUIRED_09_160', N'Building Permission', N'बांधकाम परवानगी', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7437, 3, 160, N'DOC_REQUIRED_10_160', N'Copy of the Sanctioned Building Plan', N'मंजूर बांधकाम नकाशाची प्रत', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7438, 3, 160, N'DOC_REQUIRED_11_160', N'Water Conservation Certificate.', N'जलसंधारण प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.937', NULL, NULL),
    (7439, 3, 161, N'DOC_REQUIRED_04_161', N'Photograph of the Marriage Hall / Auditorium Premises', N'विवाह सभागृह / प्रेक्षागृहाच्या जागेचा फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7440, 3, 161, N'DOC_REQUIRED_05_161', N'Rent Agreement or Property Owner Consent Letter / NOC if the premises are rented', N'भाडे करारनामा किंवा मालमत्ता मालकाचे संमतीपत्र / ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7441, 3, 161, N'DOC_REQUIRED_06_161', N'Fire Department Certificate / Fire NOC', N'अग्निशमन विभागाचे प्रमाणपत्र / अग्निशमन ना हरकत प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7442, 3, 161, N'DOC_REQUIRED_07_161', N'Photographs of Parking Facilities', N'पार्किंग सुविधांचे फोटो', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7443, 3, 161, N'DOC_REQUIRED_08_161', N'Sanitation Certificate from the Health Department', N'आरोग्य विभागाचे स्वच्छता प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7444, 3, 161, N'DOC_REQUIRED_09_161', N'Building Permission', N'बांधकाम परवानगी', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7445, 3, 161, N'DOC_REQUIRED_10_161', N'Copy of the Sanctioned Building Plan', N'मंजूर बांधकाम नकाशाची प्रत', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7446, 3, 161, N'DOC_REQUIRED_11_161', N'Water Conservation Certificate', N'जलसंधारण प्रमाणपत्र', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (7447, 3, 161, N'DOC_REQUIRED_12_161', N'Previous Marriage Hall / Auditorium Licence', N'मागील विवाह सभागृह / प्रेक्षागृह परवाना', N'file', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-26T18:10:42.940', NULL, NULL),
    (8283, 4, 62, N'applicantFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, 200, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8284, 4, 62, N'mandalOrganizationName', N'Organization / Mandal Name', N'संस्था / मंडळाचे नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 0, 1, NULL, NULL, 200, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8285, 4, 62, N'mobileNumber', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8286, 4, 62, N'email', N'Email', N'ईमेल', N'email', N'Applicant Information', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8287, 4, 62, N'aadharNo', N'Aadhar Card No', N'आधार कार्ड क्रमांक', N'text', N'Applicant Information', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8288, 4, 62, N'fullPostalAddress', N'Full Postal Address', N'पूर्ण टपाल पत्ता', N'textarea', N'Applicant Information', NULL, NULL, N'{"maxLength":500}', 1, 1, NULL, NULL, 500, 1, 0, NULL, 0, '2026-08-27T16:44:50.810', NULL, NULL),
    (8289, 4, 62, N'eventType', N'Type of Event', N'कार्यक्रमाचा प्रकार', N'select', N'Event & Venue Details', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8290, 4, 62, N'mandapLocationAddress', N'Exact Location / Address of Proposed Mandap', N'प्रस्तावित मंडपाचे अचूक ठिकाण / पत्ता', N'textarea', N'Event & Venue Details', NULL, NULL, N'{"maxLength":500}', 1, 22, NULL, NULL, 500, 1, 0, NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
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
]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8292, 4, 62, N'landOwnershipType', N'Land Ownership Type', N'जमिनीच्या मालकीचा प्रकार', N'select', N'Event & Venue Details', N'[
      {"value":"municipalRoad","label":{"en":"Municipal Road","hi":"नगरपालिका सड़क","mr":"महानगरपालिका रस्ता"}},
      {"value":"publicFootpath","label":{"en":"Public Footpath","hi":"सार्वजनिक फुटपाथ","mr":"सार्वजनिक पदपथ"}},
      {"value":"municipalGround","label":{"en":"Municipal Ground","hi":"नगरपालिका मैदान","mr":"महानगरपालिका मैदान"}},
      {"value":"privateProperty","label":{"en":"Private Property","hi":"निजी संपत्ति","mr":"खाजगी मालमत्ता"}},
      {"value":"societyOpenArea","label":{"en":"Society Open Area","hi":"सोसाइटी खुला क्षेत्र","mr":"सोसायटी मोकळी जागा"}}
    ]', NULL, NULL, 1, 11, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8293, 4, 62, N'nearestLandmark', N'Nearest Landmark', N'जवळचे ओळखण्याजोगे ठिकाण', N'text', N'Event & Venue Details', NULL, NULL, N'{"maxLength":200}', 1, 11, NULL, NULL, 200, 1, 0, NULL, 0, '2026-08-27T16:46:37.340', NULL, NULL),
    (8294, 4, 62, N'eventStartDate', N'Event Start Date', N'कार्यक्रम सुरू होण्याची तारीख', N'date', N'Schedule & Dimensions', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8295, 4, 62, N'eventEndDate', N'Event End Date', N'कार्यक्रम समाप्तीची तारीख', N'date', N'Schedule & Dimensions', NULL, NULL, N'{"minDate":"1900-01-01","maxDate":"2099-12-31"}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8296, 4, 62, N'totalDays', N'Total Number of Days', N'एकूण दिवसांची संख्या', N'text', N'Schedule & Dimensions', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "minLength": 1,
  "maxLength": 2,
  "pattern": "^[1-9][0-9]{0,2}$"
}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8297, 4, 62, N'mandapLengthFt', N'Mandap Length (feet)', N'मंडपाची लांबी (फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{
  "inputMode":"numeric",
  "allow":"numeric",
  "minLength":1,
  "maxLength":5,
  "pattern":"^[1-9][0-9]{0,4}$"
}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8298, 4, 62, N'mandapWidthFt', N'Mandap Width (feet)', N'मंडपाची रुंदी (फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{
  "inputMode":"numeric",
  "allow":"numeric",
  "minLength":1,
  "maxLength":5,
  "pattern":"^[1-9][0-9]{0,4}$"
}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8299, 4, 62, N'totalOccupiedAreaSqFt', N'Total Occupied Area (Sq. Ft.)', N'एकूण व्यापलेले क्षेत्रफळ (चौ. फूट)', N'text', N'Schedule & Dimensions', NULL, NULL, N'{
  "inputMode":"numeric",
  "allow":"numeric",
  "minLength":1,
  "maxLength":5,
  "pattern":"^[1-9][0-9]{0,4}$"
}', 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:50:10.290', NULL, NULL),
    (8300, 4, 62, N'loudspeakerUsage', N'Loudspeaker Usage', N'ध्वनिक्षेपकाचा वापर', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8301, 4, 62, N'liveFoodCookingInsidePandal', N'Live Food Cooking Inside Pandal', N'मंडपामध्ये प्रत्यक्ष अन्न शिजविण्यात येणार आहे का?', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8302, 4, 62, N'restrictsPublicTrafficFlow', N'Restricts Public Traffic Flow', N'सार्वजनिक वाहतुकीच्या प्रवाहास अडथळा होणार आहे का?', N'select', N'Safety & Activity Checklists', N'[
      {"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},
      {"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}
    ]', NULL, NULL, 1, 31, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:52:03.687', NULL, NULL),
    (8303, 4, 62, N'siteLayoutPlanDoc', N'Site Layout Plan / Sketch Map', N'स्थळ आराखडा / स्केच नकाशा', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats":["pdf","jpg"],"accept":".pdf,.jpg","maxFileSizeMb":2}', 1, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T16:53:07.390', NULL, NULL),
    (8304, 4, 62, N'declaration', N'I hereby declare that the information provided is true and correct.', N'मी घोषित करतो / करते की दिलेली माहिती खरी व अचूक आहे.', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-27T17:05:27.567', NULL, NULL),
    (8305, 13, 162, N'Fathers/husbandname', N'Father / Husband Name', N'वडील / पतीचे नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:43:39.547', NULL, NULL),
    (8306, 13, 162, N'Dateofbirth', N'Date of Birth', N'जन्मतारीख', N'Date', N'Applicant Details', NULL, NULL, N'{
  "minDate": "1900-01-01",
  "maxDate": "today"
}', 1, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:51:38.453', NULL, NULL),
    (8307, 13, 162, N'gender', N'Gender', N'लिंग', N'select', N'Applicant Details', N'[
  {
    "value": "male",
    "label": {
      "en": "Male",
      "hi": "पुरुष",
      "mr": "पुरुष"
    }
  },
  {
    "value": "female",
    "label": {
      "en": "Female",
      "hi": "महिला",
      "mr": "स्त्री"
    }
  },
  {
    "value": "transgender",
    "label": {
      "en": "Transgender",
      "hi": "तृतीयपंथी",
      "mr": "तृतीयपंथी"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:53:52.197', NULL, NULL),
    (8308, 13, 162, N'category', N'Category', N'प्रवर्ग', N'select', N'Applicant Details', N'[
  {
    "value": "General",
    "label": {
      "en": "General",
      "hi": "सामान्य वर्ग",
      "mr": "सर्वसाधारण प्रवर्ग"
    }
  },
  {
    "value": "SC",
    "label": {
      "en": "SC (Scheduled Caste)",
      "hi": "अनुसूचित जाति",
      "mr": "अनुसूचित जाती"
    }
  },
  {
    "value": "ST",
    "label": {
      "en": "ST (Scheduled Tribe)",
      "hi": "अनुसूचित जनजाति",
      "mr": "अनुसूचित जमाती"
    }
  },
  {
    "value": "OBC",
    "label": {
      "en": "OBC (Other Backward Class)",
      "hi": "अन्य पिछड़ा वर्ग",
      "mr": "इतर मागासवर्ग"
    }
  },
  {
    "value": "VJNT",
    "label": {
      "en": "VJNT (Vimukta Jati and Nomadic Tribes)",
      "hi": "विमुक्त जातियाँ और घुमंतू जनजातियाँ",
      "mr": "विमुक्त जाती व भटक्या जमाती"
    }
  }
]', NULL, NULL, 0, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:54:27.910', NULL, NULL),
    (8309, 13, 162, N'Mobileno', N'Mobile Number', N'मोबाईल क्रमांक', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:56:22.213', NULL, NULL),
    (8310, 13, 162, N'email', N'Email Address', N'ईमेल पत्ता', N'text', N'Applicant Details', NULL, NULL, N'{
  "pattern":"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode":"email"
}', 0, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:56:57.097', NULL, NULL),
    (8311, 13, 162, N'aadharno', N'Aadhar Number', N'आधार क्रमांक', N'number', N'Applicant Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 1, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-27T19:58:18.433', NULL, NULL),
    (8312, 13, 162, N'houseno', N'House/Flat/Plot No', N'घर / सदनिका / भूखंड क्रमांक', N'text', N'Residential Address Details', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:02:58.740', NULL, NULL),
    (8313, 13, 162, N'buildingarea', N'Building / Area Name', N'इमारत / परिसराचे नाव', N'text', N'Residential Address Details', NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:03:55.270', NULL, NULL),
    (8314, 13, 162, N'city', N'City / District', N'शहर / जिल्हा', N'text', N'Residential Address Details', NULL, N'Akola', NULL, 1, 2, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:08:26.633', NULL, NULL),
    (8315, 13, 162, N'pincode', N'PIN Code', N'पिन कोड', N'number', N'Residential Address Details', NULL, NULL, N'{
      "pattern": "^[1-9][0-9]{5}$",
      "minLength": 6,
      "maxLength": 6,
      "inputMode": "numeric",
      "message": "Please enter a valid 6-digit PIN code."
    }', 1, 2, NULL, NULL, 6, 1, 0, NULL, NULL, '2026-08-28T11:09:19.913', NULL, NULL),
    (8316, 13, 162, N'natureofhawking', N'Nature of Hawking Activity', N'फेरीविक्रीच्या क्रियाकलापाचे स्वरूप', N'select', N'Vending / Hawking Details', N'[
  {
    "value": "mobile_roving_vending",
    "label": {
      "en": "Mobile / Roving Vending",
      "hi": "घूम-घूमकर बिक्री",
      "mr": "फिरून विक्री"
    }
  },
  {
    "value": "stationary_static_vending",
    "label": {
      "en": "Stationary / Static Vending",
      "hi": "एक निश्चित स्थान पर बिक्री",
      "mr": "एका निश्चित ठिकाणी विक्री"
    }
  }
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:11:17.027', NULL, NULL),
    (8317, 13, 162, N'categoryofgoods', N'Category of Goods Sold', N'विक्रीच्या वस्तूंची श्रेणी', N'select', N'Vending / Hawking Details', N'[
  {
    "value": "vegetables_fruits",
    "label": {
      "en": "Vegetables / Fruits",
      "hi": "सब्जियाँ / फल",
      "mr": "भाजीपाला / फळे"
    }
  },
  {
    "value": "fast_food_snacks",
    "label": {
      "en": "Fast Food / Snacks",
      "hi": "फास्ट फूड / नाश्ता",
      "mr": "फास्ट फूड / अल्पोपाहार"
    }
  },
  {
    "value": "garments",
    "label": {
      "en": "Garments",
      "hi": "कपड़े",
      "mr": "कपडे"
    }
  },
  {
    "value": "toys_general_items",
    "label": {
      "en": "Toys / General Items",
      "hi": "खिलौने / सामान्य वस्तुएँ",
      "mr": "खेळणी / सर्वसाधारण वस्तू"
    }
  },
  {
    "value": "books_stationery",
    "label": {
      "en": "Books / Stationery",
      "hi": "पुस्तकें / लेखन सामग्री",
      "mr": "पुस्तके / लेखनसामग्री"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:12:22.490', NULL, NULL),
    (8318, 13, 162, N'itemdescription', N'Specific Item Description', N'विक्रीच्या वस्तूचे तपशीलवार वर्णन', N'text', N'Vending / Hawking Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:13:37.073', NULL, NULL),
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
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:14:36.333', NULL, NULL),
    (8320, 13, 162, N'hawkinglocation', N'Exact Proposed Hawking Location / Landmark', N'प्रस्तावित फेरीविक्रीचे अचूक ठिकाण / जवळची खूण', N'text', N'Vending / Hawking Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:15:59.050', NULL, NULL),
    (8321, 13, 162, N'timingofbusiness', N'Timing of Business', N'व्यवसायाची वेळ', N'Time', N'Vending / Hawking Details', NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, 0, 0, NULL, NULL, '2026-08-28T11:17:06.103', NULL, NULL),
    (8322, 13, 162, N'equipment/structuretype', N'Equipment/Structure Type', N'उपकरण / संरचनेचा प्रकार', N'Select', N'Vending / Hawking Details', N'[
  {
    "value": "handcart_pushcart",
    "label": {
      "en": "Handcart / Pushcart",
      "hi": "हाथगाड़ी / ठेला",
      "mr": "हातगाडी / ढकलगाडी"
    }
  },
  {
    "value": "table_vend_box",
    "label": {
      "en": "Table / Vend-box",
      "hi": "मेज / बिक्री पेटी",
      "mr": "टेबल / विक्री पेटी"
    }
  },
  {
    "value": "basket_on_head",
    "label": {
      "en": "Basket on Head",
      "hi": "सिर पर टोकरी",
      "mr": "डोक्यावर टोपली"
    }
  },
  {
    "value": "sitting_on_pavement_cloth",
    "label": {
      "en": "Sitting on Pavement / Cloth",
      "hi": "फुटपाथ पर बैठकर / कपड़ा बिछाकर बिक्री",
      "mr": "पदपथावर बसून / कापड अंथरून विक्री"
    }
  }
]', NULL, NULL, 1, 3, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:19:25.490', NULL, NULL),
    (8324, 13, 162, N'DOC_PASSPORT_PHOTO', N'Passport Size Photograph', N'पासपोर्ट आकाराचा फोटो', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:23:18.217', NULL, NULL),
    (8325, 13, 162, N'DOC_RESIDENTIALPROOF', N'Residential Proof (Voter ID, Ration Card, or Electricity Bill)', N'रहिवासी पुरावा (मतदार ओळखपत्र, शिधापत्रिका किंवा वीज बिल)', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:24:58.003', NULL, NULL),
    (8326, 13, 162, N'DOC_MEDICALCERTIFICATE', N'Medical Fitness Certificate / Health Certificate', N'वैद्यकीय तंदुरुस्ती प्रमाणपत्र / आरोग्य प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:26:05.387', NULL, NULL),
    (8327, 13, 162, N'declaration', N'I hereby declare that the information provided is true and correct.', N'मी याद्वारे घोषित करतो/करते की प्रदान केलेली माहिती सत्य आणि अचूक आहे.', N'Checkbox', N'Declaration', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-28T11:54:05.720', NULL, NULL),
    (9284, 2, 26, N'DOC_APPLICANT_ID_26', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.300', NULL, NULL),
    (9287, 2, 84, N'DOC_APPLICANT_ID_84', N'Applicant ID Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.393', NULL, NULL),
    (9288, 3, 33, N'DOC_NOC_CERTIFICATE_33', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.317', NULL, NULL),
    (9289, 3, 36, N'DOC_NOC_CERTIFICATE_36', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.330', NULL, NULL),
    (9293, 3, 142, N'DOC_NOC_CERTIFICATE_142', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.530', NULL, NULL),
    (9294, 3, 143, N'DOC_NOC_CERTIFICATE_143', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.540', NULL, NULL),
    (9295, 3, 144, N'DOC_APPLICANT_ID_144', N'Applicant Identity Proof (Aadhaar / PAN)', N'अर्जदाराचा ओळख पुरावा (आधार / पॅन कार्ड)', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.543', NULL, NULL),
    (9296, 3, 144, N'DOC_NOC_CERTIFICATE_144', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.547', NULL, NULL),
    (9299, 4, 62, N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'कार्यक्रमानंतर परिसर स्वच्छ करण्याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9302, 4, 62, N'fireStation', N'Nearest Fire Station', N'जवळचे अग्निशमन केंद्र', N'select', N'Applicant Undertaking & Compliance', N'[
  {
    "value": "Akola Municipal Corporation Fire Station",
    "label": {
      "en": "Akola Municipal Corporation Fire Station",
      "hi": "????? ??? ???? ???????? ??????",
      "mr": "????? ???????????? ???????? ??????"
    }
  }
]', NULL, NULL, 1, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9308, 4, 62, N'mandapLayoutDoc', N'Local Police Station NOC', N'स्थानिक पोलीस ठाण्याचे ना-हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-21T18:44:51.360', NULL, NULL),
    (9309, 4, 62, N'mandapType', N'Mandap Type', N'मंडपाचा प्रकार', N'select', N'Schedule & Dimensions', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', NULL, NULL, 1, 21, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9311, 4, 62, N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'सार्वजनिक मालमत्तेचे कोणतेही नुकसान होणार नाही याची हमी', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', NULL, NULL, 1, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
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
]', NULL, NULL, 1, 54, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9317, 5, 53, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-08-22T19:09:03.640', NULL, NULL),
    (9318, 5, 54, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.647', NULL, NULL),
    (9319, 6, 55, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, 0, NULL, 0, '2026-07-15T16:26:57.730', NULL, NULL),
    (9320, 8, 63, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9321, 8, 64, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.597', NULL, NULL),
    (9322, 9, 65, N'firstName', N'First Name', N'पहिले नाव', N'text', N'Applicant Information', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-07-15T16:26:57.547', NULL, NULL),
    (9323, 13, 162, N'DOC_NOC_CERTIFICATE_162', N'NOC Certificate / Shop Act Copy', N'ना-हरकत प्रमाणपत्र / गुमास्ता परवाना प्रत', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.770', NULL, NULL),
    (9324, 13, 162, N'DOC_RENT_AGREEMENT_162', N'Premises Rent Agreement / Ownership Deed', N'जागेचा भाडे करारनामा / मालकी हक्क पुरावा', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 0, 5, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-08-17T13:01:13.763', NULL, NULL),
    (9325, 4, 62, N'idproof', N'Identity Proof', N'ओळख पुरावा', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-08-29T13:42:10.413', NULL, NULL),
    (9326, 9, 65, N'brideResidenceProofDoc', N'Bride Residence Proof Document (Ration Card / Voter ID Card / Aadhaar Card / Electricity Bill / Telephone Bill)', N'नवरीचा रहिवासी पुरावा दस्तऐवज (रेशन कार्ड / मतदार ओळखपत्र / आधार कार्ड / वीज बिल / टेलिफोन बिल)', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 55, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.237'),
    (9327, 9, 65, N'groomResidenceProofDoc', N'Groom Residence Proof Document (Ration Card / Voter ID Card / Aadhaar Card / Electricity Bill / Telephone Bill)', N'नवरदेवाचा रहिवासी पुरावा दस्तऐवज (रेशन कार्ड / मतदार ओळखपत्र / आधार कार्ड / वीज बिल / टेलिफोन बिल)', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 56, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.237'),
    (9328, 9, 65, N'witness3IdProofDoc', N'Witness 3 ID Proof (Voter ID Card/Aadhaar Card. Note: 2 passport-size photographs also required)', N'साक्षीदार ३ ओळखपत्र पुरावा (मतदार ओळखपत्र/आधार कार्ड. टीप: २ पासपोर्ट आकाराचे फोटो देखील आवश्यक आहेत)', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 1, 57, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.240'),
    (9329, 9, 65, N'divorceDecreeDoc', N'Divorce Decree (For Divorced Bride/Groom, if applicable): certified copy of the court divorce decree', N'घटस्फोटाचा आदेश (घटस्फोटित नवरी/नवरदेव यांच्यासाठी, लागू असल्यास): न्यायालयाच्या घटस्फोट आदेशाची प्रमाणित प्रत', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 0, 58, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.240'),
    (9330, 9, 65, N'deceasedSpouseDeathCertDoc', N'Death Certificate of Deceased Spouse (For Widowed Bride/Groom, if applicable): Original death certificate', N'मृत जोडीदाराचा मृत्यू दाखला (विधवा नवरी / विधुर नवरदेव यांच्यासाठी, लागू असल्यास): मूळ मृत्यू दाखला', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 0, 59, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.240'),
    (9331, 9, 65, N'outOfTownAffidavitDoc', N'If groom or bride is from out of town then Affidavit stating this marriage is not registered in their area', N'नवरदेव किंवा नवरी बाहेरगावचे असल्यास, हे लग्न त्यांच्या भागात नोंदणीकृत नाही असे नमूद करणारे प्रतिज्ञापत्र', N'file', N'Document Uploads', NULL, NULL, N'{
  "acceptedFormats": [
    "pdf",
    "jpg",
    "jpeg",
    "png"
  ],
  "accept": ".pdf,.jpg,.jpeg,.png",
  "maxFileSizeMb": 5
}', 0, 60, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T07:57:52.827', NULL, '2026-09-10T08:23:06.240'),
    (9332, 6, 55, N'passportSizePhotoDoc', N'Passport Size Photo', N'पासपोर्ट आकाराचा फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T08:31:39.943', NULL, NULL),
    (9333, 6, 56, N'passportSizePhotoDoc', N'Passport Size Photo', N'पासपोर्ट आकाराचा फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T08:31:39.943', NULL, NULL),
    (9334, 6, 57, N'passportSizePhotoDoc', N'Passport Size Photo', N'पासपोर्ट आकाराचा फोटो', N'file', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-09-10T08:31:39.943', NULL, NULL),
    (537, 12, 51, N'citizenFullName', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:43:24.783', NULL, NULL),
    (538, 12, 51, N'mobileno', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:45:23.050', NULL, NULL),
    (539, 12, 51, N'email', N'Email', N'ईमेल', N'email', N'Citizen Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:46:26.090', NULL, NULL),
    (540, 12, 51, N'wardId', N'Ward', N'प्रभाग', N'select', N'Road Location Details', N'[
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
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:49:08.283', NULL, NULL),
    (541, 12, 51, N'roadStreetName', N'Road / Street Name', N'रस्ता / गल्लीचे नाव', N'text', N'Road Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:51:32.510', NULL, NULL),
    (542, 12, 51, N'landmark', N'Landmark', N'जवळची खूण', N'text', N'Road Location Details', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T16:56:09.993', NULL, NULL),
    (543, 12, 51, N'fromLocation', N'From (optional)', N'सुरुवातीचे ठिकाण (ऐच्छिक)', N'text', N'Road Location Details', NULL, NULL, NULL, 0, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T17:00:43.357', NULL, NULL),
    (544, 12, 51, N'toLocation', N'To (optional)', N'अंतिम ठिकाण (ऐच्छिक)', N'text', N'Road Location Details', NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T17:02:02.967', NULL, NULL),
    (545, 12, 51, N'DOC_POTHOLE_PHOTO', N'Photo of Street/Road', N'रोड चे छायाचित्र / फोटो', N'fileLatLog', N'Document Uploads', NULL, NULL, N'{"acceptedFormats": ["pdf", "jpg", "jpeg", "png"],"accept": ".pdf,.jpg,.jpeg,.png","maxFileSizeMb": 5}', 1, 17, NULL, NULL, NULL, 1, 0, NULL, NULL, '2026-10-01T17:04:51.210', NULL, NULL),
    (546, 12, 51, N'declaration', N'I hereby declare that the information provided is true and correct.', N'घोषणापत्र / मी सहमत आहे', N'checkbox', N'Declaration', NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-01T17:08:13.310', NULL, NULL),
    (9335, 7, 167, N'applicantfullname', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T11:34:45.493', NULL, NULL),
    (9336, 7, 167, N'mobileno', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T11:36:58.653', NULL, NULL),
    (9337, 7, 167, N'email', N'Email Address', N'ई-मेल पत्ता', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern": "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode": "email"
}', 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T11:39:09.367', NULL, NULL),
    (9338, 7, 167, N'foodbusinesstype', N'Food Business Type', N'खाद्य व्यवसायाचा प्रकार', N'select', N'Business Location Details', N'[{
    "value": "restaurant",
    "label": {
      "en": "Restaurant / Eating House",
      "hi": "रेस्तरां / भोजनालय",
      "mr": "उपाहारगृह / भोजनालय"
    }
  },
  {
    "value": "tea_snacks",
    "label": {
      "en": "Tea and Snacks Centre",
      "hi": "चाय एवं नाश्ता केंद्र",
      "mr": "चहा व नाश्ता केंद्र"
    }
  },
  {
    "value": "bakery",
    "label": {
      "en": "Bakery",
      "hi": "बेकरी",
      "mr": "बेकरी"
    }
  },
  {
    "value": "sweet_shop",
    "label": {
      "en": "Sweet Shop",
      "hi": "मिठाई की दुकान",
      "mr": "मिठाईचे दुकान"
    }
  },
  {
    "value": "grocery",
    "label": {
      "en": "Grocery / Food Retail Shop",
      "hi": "किराना / खाद्य पदार्थों की खुदरा दुकान",
      "mr": "किराणा / खाद्यपदार्थ विक्री दुकान"
    }
  },
  {
    "value": "dairy",
    "label": {
      "en": "Milk and Dairy Products Shop",
      "hi": "दूध एवं दुग्ध उत्पादों की दुकान",
      "mr": "दूध व दुग्धजन्य पदार्थ विक्री दुकान"
    }
  },
  {
    "value": "fruit_vegetable",
    "label": {
      "en": "Fruit and Vegetable Shop",
      "hi": "फल एवं सब्जी की दुकान",
      "mr": "फळे व भाजीपाला विक्री दुकान"
    }
  },
  {
    "value": "meat_fish",
    "label": {
      "en": "Meat / Fish / Poultry Shop",
      "hi": "मांस / मछली / मुर्गे की दुकान",
      "mr": "मांस / मासे / कुक्कुट विक्री दुकान"
    }
  },
  {
    "value": "catering",
    "label": {
      "en": "Catering Service",
      "hi": "खानपान सेवा",
      "mr": "खानपान सेवा"
    }
  },
  {
    "value": "food_processing",
    "label": {
      "en": "Food Manufacturing / Processing",
      "hi": "खाद्य पदार्थ निर्माण / प्रसंस्करण",
      "mr": "खाद्यपदार्थ उत्पादन / प्रक्रिया"
    }
  },
  {
    "value": "food_stall",
    "label": {
      "en": "Food Stall / Handcart",
      "hi": "खाद्य पदार्थों का स्टॉल / ठेला",
      "mr": "खाद्यपदार्थ स्टॉल / हातगाडी"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T11:58:01.687', NULL, NULL),
    (9339, 7, 167, N'ward', N'Ward', N'प्रभाग', N'select', N'Business Location Details', N'[
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
]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:01:50.700', NULL, NULL),
    (9340, 7, 167, N'shopnumber', N'Shop / House Number', N'दुकान / घर क्रमांक', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:03:52.100', NULL, NULL),
    (9341, 7, 167, N'propertynumber', N'Business Premises Property Number', N'व्यवसायाच्या जागेचा मालमत्ता क्रमांक', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:05:35.670', NULL, NULL),
    (9342, 7, 167, N'DOC_affidavit', N'Premises Owner’s Consent through Affidavit', N'व्यवसायाच्या जागेच्या मालकाचे प्रतिज्ञापत्राद्वारे संमतीपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:07:43.507', NULL, NULL),
    (9343, 7, 167, N'DOC_taxreceipt', N'Current-Year Property Tax Receipt with Tax NOC', N'चालू वर्षाची मालमत्ता कर पावती व कर ना-हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:08:24.003', NULL, NULL),
    (9344, 7, 167, N'businessaddress', N'Business Address / Locality', N'व्यवसायाचा पत्ता / परिसर', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:10:25.183', NULL, NULL),
    (9345, 7, 166, N'applicantfullname', N'Applicant Full Name', N'अर्जदाराचे पूर्ण नाव', N'text', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:14:04.660', NULL, NULL),
    (9346, 7, 166, N'businessaddress', N'Business Address / Locality', N'व्यवसायाचा पत्ता / परिसर', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:15:28.370', NULL, NULL),
    (9347, 7, 166, N'DOC_affidavit', N'Premises Owner’s Consent through Affidavit', N'व्यवसायाच्या जागेच्या मालकाचे प्रतिज्ञापत्राद्वारे संमतीपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:16:36.607', NULL, NULL),
    (9348, 7, 166, N'DOC_taxreceipt', N'Current-Year Property Tax Receipt with Tax NOC', N'चालू वर्षाची मालमत्ता कर पावती व कर ना-हरकत प्रमाणपत्र', N'file', N'Document Uploads', NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:17:58.413', NULL, NULL),
    (9349, 7, 166, N'email', N'Email Address', N'ई-मेल पत्ता', N'email', N'Applicant Details', NULL, NULL, N'{
  "pattern": "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",
  "inputMode": "email"
}', 1, 3, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:19:35.523', NULL, NULL),
    (9350, 7, 166, N'foodbusinesstype', N'Food Business Type', N'खाद्य व्यवसायाचा प्रकार', N'select', N'Business Location Details', N'[{
    "value": "restaurant",
    "label": {
      "en": "Restaurant / Eating House",
      "hi": "रेस्तरां / भोजनालय",
      "mr": "उपाहारगृह / भोजनालय"
    }
  },
  {
    "value": "tea_snacks",
    "label": {
      "en": "Tea and Snacks Centre",
      "hi": "चाय एवं नाश्ता केंद्र",
      "mr": "चहा व नाश्ता केंद्र"
    }
  },
  {
    "value": "bakery",
    "label": {
      "en": "Bakery",
      "hi": "बेकरी",
      "mr": "बेकरी"
    }
  },
  {
    "value": "sweet_shop",
    "label": {
      "en": "Sweet Shop",
      "hi": "मिठाई की दुकान",
      "mr": "मिठाईचे दुकान"
    }
  },
  {
    "value": "grocery",
    "label": {
      "en": "Grocery / Food Retail Shop",
      "hi": "किराना / खाद्य पदार्थों की खुदरा दुकान",
      "mr": "किराणा / खाद्यपदार्थ विक्री दुकान"
    }
  },
  {
    "value": "dairy",
    "label": {
      "en": "Milk and Dairy Products Shop",
      "hi": "दूध एवं दुग्ध उत्पादों की दुकान",
      "mr": "दूध व दुग्धजन्य पदार्थ विक्री दुकान"
    }
  },
  {
    "value": "fruit_vegetable",
    "label": {
      "en": "Fruit and Vegetable Shop",
      "hi": "फल एवं सब्जी की दुकान",
      "mr": "फळे व भाजीपाला विक्री दुकान"
    }
  },
  {
    "value": "meat_fish",
    "label": {
      "en": "Meat / Fish / Poultry Shop",
      "hi": "मांस / मछली / मुर्गे की दुकान",
      "mr": "मांस / मासे / कुक्कुट विक्री दुकान"
    }
  },
  {
    "value": "catering",
    "label": {
      "en": "Catering Service",
      "hi": "खानपान सेवा",
      "mr": "खानपान सेवा"
    }
  },
  {
    "value": "food_processing",
    "label": {
      "en": "Food Manufacturing / Processing",
      "hi": "खाद्य पदार्थ निर्माण / प्रसंस्करण",
      "mr": "खाद्यपदार्थ उत्पादन / प्रक्रिया"
    }
  },
  {
    "value": "food_stall",
    "label": {
      "en": "Food Stall / Handcart",
      "hi": "खाद्य पदार्थों का स्टॉल / ठेला",
      "mr": "खाद्यपदार्थ स्टॉल / हातगाडी"
    }
  },
  {
    "value": "other",
    "label": {
      "en": "Other",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 4, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:22:50.477', NULL, NULL),
    (9352, 7, 166, N'mobileno', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Applicant Details', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:24:46.133', NULL, NULL),
    (9353, 7, 166, N'shopnumber', N'Shop / House Number', N'दुकान / घर क्रमांक', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:27:00.150', NULL, NULL),
    (9354, 7, 166, N'ward', N'Ward', N'प्रभाग', N'select', N'Business Location Details', N'[
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
]', NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:29:17.563', NULL, NULL),
    (9355, 7, 166, N'businessname', N'Business / Establishment Name', N'व्यवसायाचे / आस्थापनेचे नाव', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:32:55.443', NULL, NULL),
    (9356, 7, 166, N'propertyno', N'Business Premises Property Number', N'व्यवसायाच्या जागेचा मालमत्ता क्रमांक', N'text', N'Business Location Details', NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-02T12:37:18.570', NULL, NULL),
    (9357, 9, 65, N'witness1adhar', N'Witness 1 Aadhar Number', N'साक्षीदार १ आधार नंबर', N'number', N'Witness Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 45, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-03T12:29:42.923', NULL, NULL),
    (9358, 9, 65, N'witness2adhar', N'Witness 2 Aadhar Number', N'साक्षीदार २ आधार नंबर', N'number', N'Witness Details', NULL, NULL, N'{
  "inputMode": "numeric",
  "allow": "numeric",
  "exactLength": 12,
  "pattern": "^[2-9][0-9]{11}$",
  "message": "Enter a valid 12-digit Aadhaar number."
}', 1, 48, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-03T12:31:24.747', NULL, NULL),
    (9359, 9, 65, N'Priestfirstname', N'First Name', N'पहिले नाव', N'Text', N'Priest Details', NULL, NULL, NULL, 1, 49, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:02:04.710', NULL, NULL),
    (9360, 9, 65, N'Priestmiddlename', N'Middle Name', N'मधले नाव', N'Text', N'Priest Details', NULL, NULL, NULL, 1, 50, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:06:16.860', NULL, NULL),
    (9361, 9, 65, N'PriestLastname', N'Last Name', N'आडनाव', N'Text', N'Priest Details', NULL, NULL, NULL, 1, 51, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:07:36.463', NULL, NULL),
    (9362, 9, 65, N'Priest_age', N'Age', N'वय', N'number', N'Priest Details', NULL, NULL, NULL, 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:09:33.943', NULL, NULL),
    (9363, 9, 65, N'PriestReligion', N'Religion', N'धर्म', N'Select', N'Priest Details', N'[
  {
    "value": "buddha",
    "label": {
      "en": "Buddha",
      "hi": "बौद्ध",
      "mr": "बौद्ध"
    }
  },
  {
    "value": "christian",
    "label": {
      "en": "Christian",
      "hi": "ईसाई",
      "mr": "ईसाई"
    }
  },
  {
    "value": "hindu",
    "label": {
      "en": "Hindu",
      "hi": "हिंदू",
      "mr": "हिंदू"
    }
  },
  {
    "value": "jain",
    "label": {
      "en": "Jain",
      "hi": "जैन",
      "mr": "जैन"
    }
  },
  {
    "value": "marwadi",
    "label": {
      "en": "Marwadi",
      "hi": "मारवाड़ी",
      "mr": "मारवाडी"
    }
  },
  {
    "value": "muslim",
    "label": {
      "en": "Muslim",
      "hi": "मुस्लिम",
      "mr": "मुस्लिम"
    }
  },
  {
    "value": "sikh",
    "label": {
      "en": "Sikh",
      "hi": "सिख",
      "mr": "सिख"
    }
  },
  {
    "value": "parsi",
    "label": {
      "en": "Parsi",
      "hi": "पारसी",
      "mr": "पारसी"
    }
  },
    {
    "value": "others",
    "label": {
      "en": "Others",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 1, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:31:26.033', NULL, NULL),
    (9364, 9, 65, N'Priestmobno', N'Mobile Number', N'मोबाईल नंबर', N'tel', N'Priest Details', NULL, NULL, NULL, 0, 52, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:34:16.927', NULL, NULL),
    (9365, 9, 65, N'religionbyadoption', N'Religion by Adoption (if any)', N'स्वीकारलेला धर्म (असल्यास)', N'select', N'Groom Details', N'[
  {
    "value": "buddha",
    "label": {
      "en": "Buddha",
      "hi": "बौद्ध",
      "mr": "बौद्ध"
    }
  },
  {
    "value": "christian",
    "label": {
      "en": "Christian",
      "hi": "ईसाई",
      "mr": "ईसाई"
    }
  },
  {
    "value": "hindu",
    "label": {
      "en": "Hindu",
      "hi": "हिंदू",
      "mr": "हिंदू"
    }
  },
  {
    "value": "jain",
    "label": {
      "en": "Jain",
      "hi": "जैन",
      "mr": "जैन"
    }
  },
  {
    "value": "marwadi",
    "label": {
      "en": "Marwadi",
      "hi": "मारवाड़ी",
      "mr": "मारवाडी"
    }
  },
  {
    "value": "muslim",
    "label": {
      "en": "Muslim",
      "hi": "मुस्लिम",
      "mr": "मुस्लिम"
    }
  },
  {
    "value": "sikh",
    "label": {
      "en": "Sikh",
      "hi": "सिख",
      "mr": "सिख"
    }
  },
  {
    "value": "parsi",
    "label": {
      "en": "Parsi",
      "hi": "पारसी",
      "mr": "पारसी"
    }
  },
  {
    "value": "others",
    "label": {
      "en": "Others",
      "hi": "अन्य",
      "mr": "इतर"
    }
  }
]', NULL, NULL, 0, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T11:54:35.537', NULL, NULL),
    (9366, 9, 65, N'maritalstatus', N'Marital Status', N'वैवाहिक स्थिती', N'select', N'Groom Details', N'[
  {
    "value": "divorced",
    "label": {
      "en": "Divorced",
      "hi": "तलाकशुदा",
      "mr": "घटस्फोटित"
    }
  },
  {
    "value": "married",
    "label": {
      "en": "Married",
      "hi": "विवाहित",
      "mr": "विवाहित"
    }
  },
  {
    "value": "unmarried",
    "label": {
      "en": "Unmarried",
      "hi": "अविवाहित",
      "mr": "अविवाहित"
    }
  },
  {
    "value": "widow",
    "label": {
      "en": "Widow",
      "hi": "विधवा",
      "mr": "विधवा"
    }
  },
  {
    "value": "widower",
    "label": {
      "en": "Widower",
      "hi": "विधुर",
      "mr": "विधुर"
    }
  }
]', NULL, NULL, 1, 23, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T14:09:12.780', NULL, NULL),
    (9367, 9, 65, N'maritalstatusbride', N'Marital Status', N'वैवाहिक स्थिती', N'select', N'Bride Details', N'[
  {
    "value": "divorced",
    "label": {
      "en": "Divorced",
      "hi": "तलाकशुदा",
      "mr": "घटस्फोटित"
    }
  },
  {
    "value": "married",
    "label": {
      "en": "Married",
      "hi": "विवाहित",
      "mr": "विवाहित"
    }
  },
  {
    "value": "unmarried",
    "label": {
      "en": "Unmarried",
      "hi": "अविवाहित",
      "mr": "अविवाहित"
    }
  },
  {
    "value": "widow",
    "label": {
      "en": "Widow",
      "hi": "विधवा",
      "mr": "विधवा"
    }
  },
  {
    "value": "widower",
    "label": {
      "en": "Widower",
      "hi": "विधुर",
      "mr": "विधुर"
    }
  }
]', NULL, NULL, 1, 39, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T14:15:13.300', NULL, NULL),
    (9368, 9, 65, N'interreligionmarriage', N'Inter Religion Marriage', N'आंतरधर्मीय विवाह', N'select', N'Marriage Details', N'[
  {
    "value": "yes",
    "label": {
      "en": "Yes",
      "hi": "हाँ",
      "mr": "होय"
    }
  },
  {
    "value": "no",
    "label": {
      "en": "No",
      "hi": "नहीं",
      "mr": "नाही"
    }
  }
]', NULL, NULL, 1, 42, NULL, NULL, NULL, 1, 0, NULL, 0, '2026-10-10T14:22:23.397', NULL, NULL)
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
        target.[IsRequired] = source.[IsRequired],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[MinValue] = source.[MinValue],
        target.[MaxValue] = source.[MaxValue],
        target.[MaxLength] = source.[MaxLength],
        target.[IsActive] = source.[IsActive],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldLabelLocal], [FieldType], [FieldGroup], [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [MarkedForDeletionDate], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[DepartmentId], source.[ServiceId], source.[FieldCode], source.[FieldLabel], source.[FieldLabelLocal], source.[FieldType], source.[FieldGroup], source.[OptionsJson], source.[DefaultValue], source.[ValidationRules], source.[IsRequired], source.[DisplayOrder], source.[MinValue], source.[MaxValue], source.[MaxLength], source.[IsActive], source.[MarkedForDeletion], source.[MarkedForDeletionDate], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
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
    
    (36, 43, N'Issuance of Zone Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (37, 44, N'Giving Part Map Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (38, 45, N'Issuance of Construction Permit Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (39, 46, N'Issuance of plinth certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (40, 47, N'Issuance of Occupancy Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (41, 48, N'Underground OFC Cable Permission Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (42, 49, N'Filling Potholes on City Roads Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (43, 50, N'Maintaining & Securing Sewer Covers Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (44, 53, N'Birth Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (45, 54, N'Death Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (46, 55, N'School Leaving / Duplicate Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (47, 56, N'Issuance of transfer certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (48, 57, N'Issuance of duplicate mark sheet Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (49, 58, N'Nursing home license under Registration Act, 1949 Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (50, 59, N'Renewal of nursing home license Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (51, 60, N'Change of nursing home license holder / partner name Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (52, 61, N'Trade / Business / Storage Non-Revocation NOC Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (53, 62, N'Mandap NOC Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (54, 63, N'Issuance of Fire Safety NOC Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (55, 64, N'Issuance of Final Fire Exemption Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (56, 65, N'Marriage Registration Certificate Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (57, 66, N'Tree Felling Permission (Sec 8) Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (58, 68, N'Maintaining cleanliness Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (59, 69, N'Providing drainage connections Default Workflow', 1, 0, '2026-07-21T19:02:56.547', NULL, NULL),
    (1006, 19, N'Change of Water Connection Usage Type Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1007, 20, N'Preparation of Water Bill Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1008, 26, N'Complaint Regarding Water Pressure Capacity Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1009, 33, N'Changing Occupations / Business Type Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1010, 36, N'Cancellation of License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1011, 80, N'Provision of New Water Tap Connection Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1012, 81, N'Changing the Water Connection Size Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1013, 82, N'Temporary / Permanent Disconnection of Water Connection Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1014, 83, N'Reconnection of Water Tap Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1015, 84, N'Water Bill No Dues Certificate Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1016, 85, N'Complaint Regarding Faulty Water Meter Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1017, 86, N'Complaint Regarding Unauthorized Water Tap Connection Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1018, 87, N'Complaint Regarding Water Quality Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1019, 100, N'Issuance of Plumber License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1020, 101, N'Renewal of Plumber License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1021, 137, N'Obtaining New Trade License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1022, 138, N'Renewal of Trade License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1023, 139, N'Transfer of Trade License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1024, 140, N'Duplicate Copy of Trade License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1025, 141, N'Change of Business Name / Establishment / Address Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1026, 142, N'Change of License Holder / Partner Name Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1027, 143, N'Change in Number of Partners (Increase/Decrease) Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1028, 144, N'Notice on Renewal of Expired License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1029, 145, N'New Property Tax Assessment Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1030, 146, N'Re-Assessment of Property Tax Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1031, 147, N'Preparation of Tax Demand Notice Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1032, 148, N'Avail Property Tax Exemption Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1033, 149, N'Tax Exemption for Non-Resident Properties Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1034, 150, N'Property Tax Self-Assessment Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1035, 151, N'Registration of Objection on Tax Assessment Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1036, 152, N'Sub-division of Property Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1037, 153, N'Re-assessment After Demolition and Reconstruction Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1038, 154, N'Issuance of Property Tax Assessment Copy (8A) Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1039, 155, N'Issuance of No Dues Certificate Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1040, 156, N'Property Transfer Registration Certificate Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1041, 157, N'Change of Ownership Name Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1042, 158, N'Issuance of Lodging House License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1043, 159, N'Renewal of Lodging House License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1044, 160, N'Issuance of Marriage Hall / Auditorium License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1045, 161, N'Renewal of Marriage Hall / Auditorium License Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (1046, 162, N'Issuance of Hawker Registration Certificate Default Workflow', 1, 0, '2026-08-12T19:17:56.673', NULL, NULL),
    (60, 166, N'Food Business License NOC Default Workflow', 1, 0, '2026-10-06T10:52:29.000', NULL, NULL),
    (61, 167, N'Food Registration Health NOC Default workflow', 1, 0, '2026-10-06T10:53:11.000', NULL, NULL)
) AS source ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[ApprovalFlowName] = source.[ApprovalFlowName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ServiceId], source.[ApprovalFlowName], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [RTS].[ApprovalFlowMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[ApprovalFlowStageMaster] (197 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] ON;
GO
MERGE INTO [RTS].[ApprovalFlowStageMaster] AS target
USING (VALUES
    
    (1077, 36, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1078, 37, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1079, 38, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1080, 39, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1081, 40, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1082, 41, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1083, 42, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1084, 43, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1085, 44, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1086, 45, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1087, 46, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1088, 47, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1089, 48, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1090, 49, 1, N'Deputy Medical Officer of Health', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1091, 50, 1, N'Deputy Medical Officer of Health', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1092, 51, 1, N'Deputy Medical Officer of Health', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1093, 52, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1094, 53, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1095, 54, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1096, 55, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1097, 56, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1098, 57, 1, N'Zone Officer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1099, 58, 1, N'Clerk', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1101, 36, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1102, 37, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1103, 38, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1104, 39, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1105, 40, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1106, 41, 2, N'Executive Engineer', 2, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1107, 42, 2, N'Deputy Engineer', 2, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1108, 43, 2, N'Deputy Engineer', 2, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1109, 44, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1110, 45, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1111, 46, 2, N'School Principal', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1112, 47, 2, N'School Principal', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1113, 48, 2, N'School Principal', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1114, 49, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1115, 50, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1116, 51, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1117, 52, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1118, 53, 2, N'Junior Engineer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1119, 54, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1120, 55, 2, N'Fire Officer', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1121, 56, 2, N'Registrar', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1122, 57, 2, N'Clerk', 2, 4, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
    (1123, 58, 2, N'Senior Sanitary Inspector', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1125, 36, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1),
    (1126, 37, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1127, 38, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1128, 39, 3, N'Assistant Town Planner', 3, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1129, 40, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (1132, 57, 3, N'Deputy Commissioner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (2077, 1029, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2078, 1029, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2079, 1029, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2080, 1029, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2081, 1030, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2082, 1030, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2083, 1030, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2084, 1030, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2085, 1031, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2086, 1031, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2087, 1031, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2088, 1031, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2089, 1032, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2090, 1032, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2091, 1032, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2092, 1032, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2093, 1033, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2094, 1033, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2095, 1033, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2096, 1033, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2097, 1034, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2098, 1034, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2099, 1034, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2100, 1034, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2101, 1035, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2102, 1035, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2103, 1035, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2104, 1035, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2105, 1036, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2106, 1036, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2107, 1036, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2108, 1036, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2109, 1037, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2110, 1037, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2111, 1037, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2112, 1037, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2113, 1038, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2114, 1038, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2115, 1038, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2116, 1038, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2117, 1039, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2118, 1039, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2119, 1039, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2120, 1039, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2121, 1040, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2122, 1040, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2123, 1040, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2124, 1040, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2125, 1041, 1, N'Ward Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2126, 1041, 2, N'Ass. Town Planner', 2, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),
    (2127, 1041, 3, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2128, 1041, 4, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2129, 1006, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2130, 1006, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2131, 1006, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2132, 1007, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2133, 1007, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2134, 1007, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2135, 1008, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2136, 1008, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2137, 1008, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2138, 1011, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2139, 1011, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2140, 1011, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2141, 1012, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2142, 1012, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2143, 1012, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2144, 1013, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2145, 1013, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2146, 1013, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2147, 1014, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2148, 1014, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2149, 1014, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2150, 1015, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2151, 1015, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2152, 1015, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2153, 1016, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2154, 1016, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2155, 1016, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2156, 1017, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2157, 1017, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2158, 1017, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2159, 1018, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2160, 1018, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2161, 1018, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2162, 1019, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2163, 1019, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2164, 1019, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2165, 1020, 1, N'Junior Engineer', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2166, 1020, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2167, 1020, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2168, 1009, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2169, 1009, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2170, 1009, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2171, 1010, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2172, 1010, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2173, 1010, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2174, 1021, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2175, 1021, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2176, 1021, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2177, 1022, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2178, 1022, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2179, 1022, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2180, 1023, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2181, 1023, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2182, 1023, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2183, 1024, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2184, 1024, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2185, 1024, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2186, 1025, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2187, 1025, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2188, 1025, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2189, 1026, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2190, 1026, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2191, 1026, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2192, 1027, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2193, 1027, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2194, 1027, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2195, 1028, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2196, 1028, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2197, 1028, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2198, 1042, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2199, 1042, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2200, 1042, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2201, 1043, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2202, 1043, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2203, 1043, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2204, 1044, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2205, 1044, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2206, 1044, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2207, 1045, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2208, 1045, 2, N'Ass. Town Planner', 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
    (2209, 1045, 3, N'Ass. Town Planner', 4, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2210, 1046, 1, N'Clerk', 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0),
    (2211, 1046, 2, N'Head of the Department', 2, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
    (2215, 54, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (2216, 55, 3, N'Chief Fire Officer', 3, 5, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (3077, 52, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0),
    (3078, 53, 3, N'Assistant Town Planner', 3, 3, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1),
    (1133, 60, 1, N'Deputy Medical Officer of Health', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1134, 60, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1),
    (1135, 61, 1, N'Deputy Medical Officer of Health', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1),
    (1136, 61, 2, N'Medical Officer of Health', 2, 4, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1),
    (1137, 59, 1, N'Junior Engineer', 1, 3, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0),
    (1138, 59, 2, N'Deputy Engineer', 2, 2, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1)
) AS source ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanViewCertificate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ApprovalFlowId] = source.[ApprovalFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[SLADays] = source.[SLADays],
        target.[CanVerifyDocument] = source.[CanVerifyDocument],
        target.[CanApprove] = source.[CanApprove],
        target.[CanReject] = source.[CanReject],
        target.[CanReturn] = source.[CanReturn],
        target.[CanPay] = source.[CanPay],
        target.[IsFinalStage] = source.[IsFinalStage],
        target.[CanEdit] = source.[CanEdit],
        target.[CanViewNoteSheet] = source.[CanViewNoteSheet],
        target.[CanIssueCertificate] = source.[CanIssueCertificate],
        target.[CanViewCertificate] = source.[CanViewCertificate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ApprovalFlowId], [StageOrder], [StageName], [UserId], [SLADays], [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage], [CanEdit], [CanViewNoteSheet], [CanIssueCertificate], [CanViewCertificate])
    VALUES (source.[Id], source.[ApprovalFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[SLADays], source.[CanVerifyDocument], source.[CanApprove], source.[CanReject], source.[CanReturn], source.[CanPay], source.[IsFinalStage], source.[CanEdit], source.[CanViewNoteSheet], source.[CanIssueCertificate], source.[CanViewCertificate]);
GO
SET IDENTITY_INSERT [RTS].[ApprovalFlowStageMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[AppealTypeMaster] (3 rows)
   Statutory Appeal Grounds under MRTSA 2015 Section 8(1)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] ON;
GO
MERGE INTO [RTS].[AppealTypeMaster] AS target
USING (VALUES
    (1, N'Rejection of application without justifiable cause (MRTSA 2015 Sec 8(1)(b))', N'REJECTED', N'अवाजवी कारणास्तव अर्ज नामंजूर करणे (कलम ८(१)(ख))', N'पदनिर्देशित अधिकाऱ्याने पुरेसे कारण न देता अथवा कायद्यातील तरतुदींचे उल्लंघन करून अर्ज फेटाळला.', 1, '2026-08-11T12:21:38.987'),
    (2, N'Deficient or incomplete public service provided (MRTSA 2015 Sec 8(1))', N'DISAGREED', N'असमाधानकारक किंवा अपूर्ण सेवा मिळणे (कलम ८(१))', N'दिलेली सेवा अपूर्ण अथवा त्रुटीयुक्त असून नागरिकाच्या वैधानिक हक्कांची पूर्तता झालेली नाही.', 1, '2026-08-11T12:21:38.987'),
    (3, N'Failure to deliver service within stipulated time limit (MRTSA 2015 Sec 8(1)(a))', N'SLA_DUE', N'विहित मुदतीत सेवा न मिळणे (कलम ८(१)(क))', N'पदनिर्देशित अधिकाऱ्याने विहित मुदतीत कोणतीही कारवाई न करता सेवा देण्यास विलंब केला.', 1, '2026-08-11T12:21:38.987')
) AS source ([Id], [AppealTypeName], [Code], [AppealTypeNameLocal], [Description], [IsActive], [CreatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[AppealTypeName] = source.[AppealTypeName],
        target.[Code] = source.[Code],
        target.[AppealTypeNameLocal] = source.[AppealTypeNameLocal],
        target.[Description] = source.[Description],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [AppealTypeName], [Code], [AppealTypeNameLocal], [Description], [IsActive], [CreatedDate])
    VALUES (source.[Id], source.[AppealTypeName], source.[Code], source.[AppealTypeNameLocal], source.[Description], source.[IsActive], source.[CreatedDate]);
GO
SET IDENTITY_INSERT [RTS].[AppealTypeMaster] OFF;
GO
-- [RTS].[AppealFlowMaster] obsolete table removed
/* ----------------------------------------------------------------------------
   Table: [RTS].[AppealFlowStageMaster] (134 rows)
   Comprehensive Appellate Hierarchy across All 67 RTS Services under MRTSA 2015
   Stage 1: First Appellate Authority (FAA) | Stage 2: Second Appellate Authority (SAA)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] ON;
GO
DELETE FROM [RTS].[AppealFlowStageMaster] WHERE [AppealFlowId] <= 10;
GO
MERGE INTO [RTS].[AppealFlowStageMaster] AS target
USING (VALUES
    (1001, 36, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1002, 36, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1003, 37, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1004, 37, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1005, 38, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1006, 38, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1007, 39, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1008, 39, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1009, 40, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1010, 40, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1011, 41, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1012, 41, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1013, 42, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1014, 42, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1015, 43, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1016, 43, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1017, 44, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1018, 44, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1019, 45, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1020, 45, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1021, 46, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1022, 46, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1023, 47, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1024, 47, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1025, 48, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1026, 48, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1027, 49, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1028, 49, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1029, 50, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1030, 50, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1031, 51, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1032, 51, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1033, 52, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1034, 52, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1035, 53, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1036, 53, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1037, 54, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1038, 54, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1039, 55, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1040, 55, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1041, 56, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1042, 56, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1043, 57, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1044, 57, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1045, 58, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1046, 58, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1047, 59, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1048, 59, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1049, 1006, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1050, 1006, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1051, 1007, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1052, 1007, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1053, 1008, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1054, 1008, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1055, 1009, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1056, 1009, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1057, 1010, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1058, 1010, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1059, 1011, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1060, 1011, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1061, 1012, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1062, 1012, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1063, 1013, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1064, 1013, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1065, 1014, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1066, 1014, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1067, 1015, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1068, 1015, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1069, 1016, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1070, 1016, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1071, 1017, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1072, 1017, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1073, 1018, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1074, 1018, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1075, 1019, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1076, 1019, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1077, 1020, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1078, 1020, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1079, 1021, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1080, 1021, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1081, 1022, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1082, 1022, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1083, 1023, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1084, 1023, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1085, 1024, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1086, 1024, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1087, 1025, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1088, 1025, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1089, 1026, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1090, 1026, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1091, 1027, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1092, 1027, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1093, 1028, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1094, 1028, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1095, 1029, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1096, 1029, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1097, 1030, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1098, 1030, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1099, 1031, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1100, 1031, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1101, 1032, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1102, 1032, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1103, 1033, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1104, 1033, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1105, 1034, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1106, 1034, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1107, 1035, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1108, 1035, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1109, 1036, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1110, 1036, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1111, 1037, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1112, 1037, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1113, 1038, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1114, 1038, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1115, 1039, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1116, 1039, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1117, 1040, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1118, 1040, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1119, 1041, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1120, 1041, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1121, 1042, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1122, 1042, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1123, 1043, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1124, 1043, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1125, 1044, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1126, 1044, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1127, 1045, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1128, 1045, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1129, 1046, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1130, 1046, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1131, 60, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1132, 60, 2, N'Second Appellate Authority', 2005, 1, 1, 1),
    (1133, 61, 1, N'First Appellate Authority', 2004, 1, 1, 1),
    (1134, 61, 2, N'Second Appellate Authority', 2005, 1, 1, 1)
) AS source ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [CanApprove], [CanReject], [CanReturn])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[AppealFlowId] = source.[AppealFlowId],
        target.[StageOrder] = source.[StageOrder],
        target.[StageName] = source.[StageName],
        target.[UserId] = source.[UserId],
        target.[CanApprove] = source.[CanApprove],
        target.[CanReject] = source.[CanReject],
        target.[CanReturn] = source.[CanReturn]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [AppealFlowId], [StageOrder], [StageName], [UserId], [CanApprove], [CanReject], [CanReturn])
    VALUES (source.[Id], source.[AppealFlowId], source.[StageOrder], source.[StageName], source.[UserId], source.[CanApprove], source.[CanReject], source.[CanReturn]);
GO
SET IDENTITY_INSERT [RTS].[AppealFlowStageMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[CertificateCoreTemplateMaster] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[CertificateCoreTemplateMaster] ON;
GO
MERGE INTO [RTS].[CertificateCoreTemplateMaster] AS target
USING (VALUES
    
    (1, N'New Certificate Template', N'CERT_TEMPLATE', NULL, N'<div class="certificate-repeatable-header" data-certificate-section="header" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:44mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:12mm;top:38mm;width:40mm;height:10mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251110575-qpk3w" style="position:absolute;left:182mm;top:6mm;width:20mm;height:8mm;;;z-index:11;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;"><span style="background-color: transparent;">RTS00023191</span></div></div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div></div>', N'<div class="certificate-canvas-pages" data-certificate-multipage="true"><section class="certificate-canvas-document" data-certificate-page="1" style="position:relative;width:210mm;height:297mm;background:#ffffff;overflow:hidden;box-sizing:border-box;page-break-after:auto"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:44mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:12mm;top:38mm;width:40mm;height:10mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251110575-qpk3w" style="position:absolute;left:182mm;top:6mm;width:20mm;height:8mm;;;z-index:11;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;"><span style="background-color: transparent;">RTS00023191</span></div></div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div><div data-certificate-node="node-1788258263627-jebag" style="position:absolute;left:0mm;top:0mm;width:210mm;height:297mm;;;z-index:0.5;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:1.3mm double #1e3a8a;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788251739647-gnlqc" style="position:absolute;left:8mm;top:46mm;width:64mm;height:8mm;;;z-index:14;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">जा.क्र. मनपा/आर.टी.एस./२०२६/RTS00023191</div><div data-certificate-node="node-1788251802111-nzfcu" style="position:absolute;left:158mm;top:46mm;width:44mm;height:8mm;;;z-index:15;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;">दिनांक: 01/09/2026</div></div><div data-certificate-node="node-1788251893206-kk8zs" style="position:absolute;left:8mm;top:52mm;width:14mm;height:8mm;;;z-index:16;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>प्रति,</div></div><div data-certificate-node="node-1788251947382-5u948" style="position:absolute;left:10mm;top:56mm;width:42mm;height:16mm;;;z-index:17;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div><span style="background-color: transparent;">आदित्य संभाजी पाटके</span></div><div>प्लॉट क्र. २४, राम नगर, अकोला</div><div>९८७६५४३२१०</div></div><div data-certificate-node="node-1788252120415-jfp3b" style="position:absolute;left:10mm;top:72mm;width:106mm;height:14mm;;;z-index:18;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र. RTS00023191 दिनांक 24/08/2026</div></div><div data-certificate-node="node-1788256006606-li8j9" style="position:absolute;left:10mm;top:86mm;width:52mm;height:4mm;;;z-index:19;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">महोदय / महोदया,<div><div style="text-align: center;"><br></div></div></div><div data-certificate-node="node-1788256108032-7u9gp" style="position:absolute;left:8mm;top:90mm;width:192mm;height:14mm;;;z-index:20;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style="background-color: transparent;">(अर्ज क्र. RTS00023191 दि. 24/08/2026) नगररचना विभागामार्फत&nbsp;</span><span style="background-color: transparent;">पडताळणी करण्यात आली आहे.</span></div></div><div data-certificate-node="node-1788256214054-j7t4v" style="position:absolute;left:8mm;top:102mm;width:192mm;height:12mm;;;z-index:21;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style="background-color: transparent;">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style="background-color: transparent;">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div></div><div data-certificate-node="node-1788256361109-1z20c" style="position:absolute;left:10mm;top:116mm;width:190mm;height:22mm;;;z-index:23;transform:rotate(0deg);opacity:0.6;color:#0f172a;background:#ffeca8;border:0.5mm solid #1e3a8a;border-radius:1.5mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788256340990-s8jcu" style="position:absolute;left:10mm;top:116mm;width:76mm;height:10mm;;;z-index:24;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):</div><div data-certificate-node="node-1788256499469-g0hpd" style="position:absolute;left:8mm;top:142mm;width:20mm;height:8mm;;;z-index:25;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">शर्ती व अटी:</div><div data-certificate-node="node-1788256554661-c5ji5" style="position:absolute;left:12mm;top:146mm;width:190mm;height:12mm;;;z-index:26;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div></div><div data-certificate-node="node-1788256635309-f77sh" style="position:absolute;left:10mm;top:160mm;width:190mm;height:9mm;;;z-index:27;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p></div><div data-certificate-node="node-1788257546539-vefsg" style="position:absolute;left:8mm;top:278mm;width:194mm;height:8mm;;;z-index:31;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788349049327-qztsi" style="position:absolute;left:11mm;top:14mm;width:42mm;height:26mm;;;z-index:48;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="data:image/png;base64,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" alt="org_logo.png" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:98mm;top:272mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:142mm;top:258mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:14mm;top:242mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:10mm;top:239mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262186039-f8luy" style="position:absolute;left:18mm;top:234mm;width:26mm;height:4mm;;;z-index:42;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">01/09/2026</div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:84mm;top:230mm;width:30mm;height:28mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275519823-ctte8" style="position:absolute;left:142mm;top:236mm;width:56mm;height:20mm;;;z-index:45;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788333321376-b7z0h" style="position:absolute;left:12mm;top:246mm;width:30mm;height:29mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0.5mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></section></div>', N'<div class="certificate-repeatable-footer" data-certificate-section="footer" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:98mm;top:272mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:142mm;top:258mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:14mm;top:242mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:10mm;top:239mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262186039-f8luy" style="position:absolute;left:18mm;top:234mm;width:26mm;height:4mm;;;z-index:42;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">01/09/2026</div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:84mm;top:230mm;width:30mm;height:28mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275519823-ctte8" style="position:absolute;left:142mm;top:236mm;width:56mm;height:20mm;;;z-index:45;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788333321376-b7z0h" style="position:absolute;left:12mm;top:246mm;width:30mm;height:29mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0.5mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></div>', N'{"page":{"widthMm":210,"heightMm":297,"marginMm":10,"backgroundColor":"#ffffff","showGrid":true,"snapToGrid":true,"gridSizeMm":2,"pageCount":1,"headerHeightMm":47.5,"footerHeightMm":69.8,"headerEnabled":true,"footerEnabled":true},"rootIds":["node-1788184118093-v8kqj","node-1788185078852-u4jph","node-1788251399311-oltg1","node-1788250565617-xtniw","node-1788251077847-sfxkn","node-1788251110575-qpk3w","node-1788251570687-p9ecw","node-1788251739647-gnlqc","node-1788251802111-nzfcu","node-1788251893206-kk8zs","node-1788251947382-5u948","node-1788252120415-jfp3b","node-1788256006606-li8j9","node-1788256108032-7u9gp","node-1788256214054-j7t4v","node-1788256340990-s8jcu","node-1788256361109-1z20c","node-1788256499469-g0hpd","node-1788256554661-c5ji5","node-1788256635309-f77sh","node-1788257546539-vefsg","node-1788258263627-jebag","node-1788262140503-ys783","node-1788262168471-zav1u","node-1788262186039-f8luy","node-1788262226103-mayph","node-1788258066499-2y31i","node-1788257730275-4t07z","node-1788333321376-b7z0h","node-1788275519823-ctte8","node-1788349049327-qztsi"],"nodes":{"node-1788184118093-v8kqj":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":44,"width":194,"height":4,"zIndex":1,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788184118093-v8kqj","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788185078852-u4jph":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":12,"y":38,"width":40,"height":10,"zIndex":8,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\">अकोला महानगरपालिका, अकोला</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788185078852-u4jph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788250565617-xtniw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":8,"width":84,"height":14,"zIndex":9,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><b>अकोला महानगरपालिका, अकोला</b></div><div style=\"text-align: center;\"><b>नगर रचना</b></div><br>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788250565617-xtniw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":16,"fontWeight":350,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251077847-sfxkn":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":6,"width":38,"height":6,"zIndex":10,"rotation":0,"visible":true,"locked":false,"content":"RTS/2026/DOC-VERIFIED","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251077847-sfxkn","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":8,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251110575-qpk3w":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":182,"y":6,"width":20,"height":8,"zIndex":11,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: right;\"><span style=\"background-color: transparent;\">RTS00023191</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251110575-qpk3w","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":8,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251399311-oltg1":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":20,"width":88,"height":8,"zIndex":12,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251399311-oltg1","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":14,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251570687-p9ecw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":78,"y":28,"width":46,"height":12,"zIndex":13,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style=\"text-align: center;\">ई-मेल - akolamc@gmail.com<span style=\"background-color: transparent;\"></span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251570687-p9ecw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788251739647-gnlqc":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":46,"width":64,"height":8,"zIndex":14,"rotation":0,"visible":true,"locked":false,"content":"जा.क्र. मनपा/आर.टी.एस./२०२६/RTS00023191","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251739647-gnlqc","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251802111-nzfcu":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":158,"y":46,"width":44,"height":8,"zIndex":15,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: right;\">दिनांक: 01/09/2026</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251802111-nzfcu","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251893206-kk8zs":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":52,"width":14,"height":8,"zIndex":16,"rotation":0,"visible":true,"locked":false,"content":"<div>प्रति,</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251893206-kk8zs","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251947382-5u948":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":56,"width":42,"height":16,"zIndex":17,"rotation":0,"visible":true,"locked":false,"content":"<div><span style=\"background-color: transparent;\">आदित्य संभाजी पाटके</span></div><div>प्लॉट क्र. २४, राम नगर, अकोला</div><div>९८७६५४३२१०</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251947382-5u948","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788252120415-jfp3b":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":72,"width":106,"height":14,"zIndex":18,"rotation":0,"visible":true,"locked":true,"content":"<u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र. RTS00023191 दिनांक 24/08/2026</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788252120415-jfp3b","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256006606-li8j9":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":86,"width":52,"height":4,"zIndex":19,"rotation":0,"visible":true,"locked":false,"content":"महोदय / महोदया,<div><div style=\"text-align: center;\"><br></div></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256006606-li8j9","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788256108032-7u9gp":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":90,"width":192,"height":14,"zIndex":20,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style=\"background-color: transparent;\">(अर्ज क्र. RTS00023191 दि. 24/08/2026) नगररचना विभागामार्फत&nbsp;</span><span style=\"background-color: transparent;\">पडताळणी करण्यात आली आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256108032-7u9gp","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256214054-j7t4v":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":102,"width":192,"height":12,"zIndex":21,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style=\"background-color: transparent;\">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style=\"background-color: transparent;\">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256214054-j7t4v","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256340990-s8jcu":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":116,"width":76,"height":10,"zIndex":24,"rotation":0,"visible":true,"locked":false,"content":"अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256340990-s8jcu","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256361109-1z20c":{"type":"rectangle","name":"Rectangle","parentId":null,"childIds":[],"layout":"free","x":10,"y":116,"width":190,"height":22,"zIndex":23,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Rectangle","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256361109-1z20c","style":{"color":"#0f172a","backgroundColor":"#ffeca8","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":1.5,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":0.6,"padding":2,"objectFit":"contain"}},"node-1788256499469-g0hpd":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":142,"width":20,"height":8,"zIndex":25,"rotation":0,"visible":true,"locked":false,"content":"शर्ती व अटी:","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256499469-g0hpd","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256554661-c5ji5":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":12,"y":146,"width":190,"height":12,"zIndex":26,"rotation":0,"visible":true,"locked":false,"content":"१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256554661-c5ji5","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256635309-f77sh":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":160,"width":190,"height":9,"zIndex":27,"rotation":0,"visible":true,"locked":false,"content":"<p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256635309-f77sh","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257546539-vefsg":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":278,"width":194,"height":8,"zIndex":31,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257546539-vefsg","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257730275-4t07z":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":98,"y":272,"width":102,"height":4,"zIndex":33,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\"><span style=\"background-color: transparent;\">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257730275-4t07z","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258066499-2y31i":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":142,"y":258,"width":54,"height":10,"zIndex":35,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style=\"background-color: transparent;\">अकोला महानगरपालिका, अकोला</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788258066499-2y31i","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258263627-jebag":{"type":"rectangle","name":"Rectangle","parentId":null,"childIds":[],"layout":"free","x":0,"y":0,"width":210,"height":297,"zIndex":0.5,"rotation":0,"visible":true,"locked":true,"content":"","source":"","alt":"Rectangle","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":true,"dividerOrientation":"horizontal","id":"node-1788258263627-jebag","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":1.3,"borderEnabled":true,"borderStyle":"double","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788262140503-ys783":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":14,"y":242,"width":30,"height":4,"zIndex":40,"rotation":0,"visible":true,"locked":false,"content":"लिपिक / शाखा प्रमुख","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262140503-ys783","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262168471-zav1u":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":10,"y":239,"width":40,"height":4,"zIndex":41,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262168471-zav1u","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262186039-f8luy":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":18,"y":234,"width":26,"height":4,"zIndex":42,"rotation":0,"visible":true,"locked":false,"content":"01/09/2026","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262186039-f8luy","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262226103-mayph":{"type":"image","name":"Image","parentId":null,"childIds":[],"layout":"free","x":84,"y":230,"width":30,"height":28,"zIndex":43,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/ulb-seal.png","alt":"Municipal seal","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262226103-mayph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788275519823-ctte8":{"type":"signature","name":"Signature","parentId":null,"childIds":[],"layout":"free","x":142,"y":236,"width":56,"height":20,"zIndex":45,"rotation":0,"visible":true,"locked":false,"content":"{{DigitalSignature}}","source":"","alt":"Signature","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":true,"dividerOrientation":"horizontal","id":"node-1788275519823-ctte8","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788333321376-b7z0h":{"type":"qr","name":"QR Code","parentId":null,"childIds":[],"layout":"free","x":12,"y":246,"width":30,"height":29,"zIndex":47,"rotation":0,"visible":true,"locked":false,"content":"{{QRCode}}","source":"","alt":"QR Code","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788333321376-b7z0h","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0.5,"objectFit":"contain"}},"node-1788349049327-qztsi":{"type":"image","name":"org_logo.png","parentId":null,"childIds":[],"layout":"free","x":11,"y":14,"width":42,"height":26,"zIndex":48,"rotation":0,"visible":true,"locked":false,"content":"","source":"data:image/png;base64,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","alt":"org_logo.png","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788349049327-qztsi","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}}},"metadata":{"language":"en","migratedFromLegacy":false}}', 1, '2026-08-31T19:35:26.287', '2026-09-19T14:58:00.127', 1, 3, 0, NULL)
) AS source ([Id], [TemplateName], [TemplateCode], [Description], [HeaderContent], [BodyContent], [FooterContent], [DesignJson], [IsActive], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [MarkedForDeletion], [MarkedForDeletionDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[TemplateName] = source.[TemplateName],
        target.[TemplateCode] = source.[TemplateCode],
        target.[Description] = source.[Description],
        target.[HeaderContent] = source.[HeaderContent],
        target.[BodyContent] = source.[BodyContent],
        target.[FooterContent] = source.[FooterContent],
        target.[DesignJson] = source.[DesignJson],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [TemplateName], [TemplateCode], [Description], [HeaderContent], [BodyContent], [FooterContent], [DesignJson], [IsActive], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [MarkedForDeletion], [MarkedForDeletionDate])
    VALUES (source.[Id], source.[TemplateName], source.[TemplateCode], source.[Description], source.[HeaderContent], source.[BodyContent], source.[FooterContent], source.[DesignJson], source.[IsActive], source.[CreatedDate], source.[UpdatedDate], source.[CreatedBy], source.[UpdatedBy], source.[MarkedForDeletion], source.[MarkedForDeletionDate]);
GO
SET IDENTITY_INSERT [RTS].[CertificateCoreTemplateMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[ServiceCertificateMaster] (12 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ServiceCertificateMaster] ON;
GO
MERGE INTO [RTS].[ServiceCertificateMaster] AS target
USING (VALUES
    (1, 43, N'New Certificate Template', N'CERT_43', N'<div class="certificate-repeatable-header" data-certificate-section="header" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:44mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:10mm;top:36mm;width:30mm;height:12mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div></div>', N'<div class="certificate-canvas-pages" data-certificate-multipage="true"><section class="certificate-canvas-document" data-certificate-page="1" style="position:relative;width:210mm;height:297mm;background:#ffffff;overflow:hidden;box-sizing:border-box;page-break-after:auto"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:44mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:10mm;top:36mm;width:30mm;height:12mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div><div data-certificate-node="node-1788258263627-jebag" style="position:absolute;left:0mm;top:0mm;width:210mm;height:297mm;;;z-index:0.5;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:1.1mm double #1e3a8a;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788506441128-wxli2" style="position:absolute;left:32mm;top:64mm;width:146mm;height:148mm;;;z-index:1;transform:rotate(0deg);opacity:0.12;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><img src="/images/logo.png" alt="Municipal logo" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788256006606-li8j9" style="position:absolute;left:10mm;top:86mm;width:52mm;height:4mm;;;z-index:2;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">महोदय / महोदया,<div><div style="text-align: center;"><br></div></div></div><div data-certificate-node="node-1788256214054-j7t4v" style="position:absolute;left:8mm;top:102mm;width:192mm;height:12mm;;;z-index:2;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style="background-color: transparent;">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style="background-color: transparent;">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div></div><div data-certificate-node="node-1788251947382-5u948" style="position:absolute;left:12mm;top:58mm;width:69mm;height:17.5mm;;;z-index:3;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div><span data-certificate-tag="{{ApplicantName}}" contenteditable="false">{{ApplicantName}}</span></div><div><span data-certificate-tag="{{Field:applicantAddress}}" contenteditable="false">{{Field:applicantAddress}}</span></div><div><span data-certificate-tag="{{ApplicantMobile}}" contenteditable="false">{{ApplicantMobile}}</span></div></div><div data-certificate-node="node-1788256340990-s8jcu" style="position:absolute;left:8mm;top:154mm;width:76mm;height:10mm;;;z-index:3;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):</div><div data-certificate-node="node-1788256108032-7u9gp" style="position:absolute;left:8mm;top:90mm;width:192mm;height:14mm;;;z-index:4;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style="background-color: transparent;">(अर्ज क्र.&nbsp;</span><span data-certificate-tag="{{ApplicationNo}}" contenteditable="false">{{ApplicationNo}}</span><span style="background-color: transparent;">&nbsp;दि.&nbsp;</span><span style="background-color: transparent;">{{AppliedDate}}</span><span style="background-color: transparent;">) नगररचना विभागामार्फत&nbsp;</span><span style="background-color: transparent;">पडताळणी करण्यात आली आहे.</span></div></div><div data-certificate-node="node-1788274344668-0sdhp" style="position:absolute;left:12mm;top:160.5mm;width:186mm;height:16mm;;;z-index:4;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><span data-certificate-tag="{{OfficerRemark}}" contenteditable="false">{{OfficerRemark}}</span></div><div data-certificate-node="node-1788252120415-jfp3b" style="position:absolute;left:12mm;top:76mm;width:146mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र.&nbsp;<span data-certificate-tag="{{ApplicationNo}}" contenteditable="false">{{ApplicationNo}}</span>&nbsp;दिनांक&nbsp;<span style="background-color: transparent;">{{AppliedDate}}</span></div></div><div data-certificate-node="node-1788251739647-gnlqc" style="position:absolute;left:8mm;top:46mm;width:78mm;height:8mm;;;z-index:14;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">जा.क्र. मनपा/आर.टी.एस./२०२६/<span data-certificate-tag="{{ApplicationNo}}" contenteditable="false">{{ApplicationNo}}</span></div><div data-certificate-node="node-1788251893206-kk8zs" style="position:absolute;left:8mm;top:52mm;width:14mm;height:8mm;;;z-index:16;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>प्रति,</div></div><div data-certificate-node="node-1788256499469-g0hpd" style="position:absolute;left:8mm;top:118mm;width:20mm;height:8mm;;;z-index:25;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">शर्ती व अटी:</div><div data-certificate-node="node-1788256554661-c5ji5" style="position:absolute;left:10mm;top:122mm;width:190mm;height:12mm;;;z-index:26;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div></div><div data-certificate-node="node-1788256635309-f77sh" style="position:absolute;left:10mm;top:134mm;width:190mm;height:9mm;;;z-index:27;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p></div><div data-certificate-node="node-1788257546539-vefsg" style="position:absolute;left:8mm;top:278mm;width:194mm;height:8mm;;;z-index:31;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788273251362-n3a9q" style="position:absolute;left:164mm;top:48mm;width:36mm;height:6mm;;;z-index:45;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><span style="text-align: right;">दिनांक:&nbsp;</span>{{currentData}}</div><div data-certificate-node="node-1788336696578-s227f" style="position:absolute;left:8mm;top:8mm;width:34mm;height:30mm;;;z-index:48;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><img src="/images/logo.png" alt="Municipal logo" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788274409866-vcaev" style="position:absolute;left:10mm;top:252mm;width:38mm;height:6mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><span data-certificate-tag="{{currentData}}" contenteditable="false">{{currentData}}</span></div><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:96mm;top:284mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:122mm;top:270mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:10mm;top:266mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:8mm;top:260mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:56mm;top:240mm;width:32mm;height:30mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275558471-33haa" style="position:absolute;left:98mm;top:218mm;width:100mm;height:50mm;;;z-index:46;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788275586967-podn1" style="position:absolute;left:166mm;top:6mm;width:28mm;height:28mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></section></div>', N'<div class="certificate-repeatable-footer" data-certificate-section="footer" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788274409866-vcaev" style="position:absolute;left:10mm;top:252mm;width:38mm;height:6mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><span data-certificate-tag="{{currentData}}" contenteditable="false">{{currentData}}</span></div><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:96mm;top:284mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:122mm;top:270mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:10mm;top:266mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:8mm;top:260mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:56mm;top:240mm;width:32mm;height:30mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275558471-33haa" style="position:absolute;left:98mm;top:218mm;width:100mm;height:50mm;;;z-index:46;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788275586967-podn1" style="position:absolute;left:166mm;top:6mm;width:28mm;height:28mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></div>', NULL, NULL, N'{"page":{"widthMm":210,"heightMm":297,"marginMm":10,"backgroundColor":"#ffffff","showGrid":true,"snapToGrid":true,"gridSizeMm":2,"pageCount":1,"headerHeightMm":47.5,"footerHeightMm":69.8,"headerEnabled":true,"footerEnabled":true},"rootIds":["node-1788184118093-v8kqj","node-1788185078852-u4jph","node-1788251399311-oltg1","node-1788250565617-xtniw","node-1788251077847-sfxkn","node-1788251570687-p9ecw","node-1788251739647-gnlqc","node-1788251893206-kk8zs","node-1788251947382-5u948","node-1788252120415-jfp3b","node-1788256006606-li8j9","node-1788256108032-7u9gp","node-1788256214054-j7t4v","node-1788256340990-s8jcu","node-1788256499469-g0hpd","node-1788256554661-c5ji5","node-1788256635309-f77sh","node-1788257546539-vefsg","node-1788262140503-ys783","node-1788262168471-zav1u","node-1788262226103-mayph","node-1788258066499-2y31i","node-1788257730275-4t07z","node-1788273251362-n3a9q","node-1788258263627-jebag","node-1788274344668-0sdhp","node-1788336696578-s227f","node-1788275586967-podn1","node-1788275558471-33haa","node-1788506441128-wxli2","node-1788274409866-vcaev"],"nodes":{"node-1788184118093-v8kqj":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":44,"width":194,"height":4,"zIndex":1,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788184118093-v8kqj","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788185078852-u4jph":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":36,"width":30,"height":12,"zIndex":8,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\">अकोला महानगरपालिका, अकोला</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788185078852-u4jph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788250565617-xtniw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":8,"width":84,"height":14,"zIndex":9,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><b>अकोला महानगरपालिका, अकोला</b></div><div style=\"text-align: center;\"><b>नगर रचना</b></div><br>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788250565617-xtniw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":16,"fontWeight":350,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251077847-sfxkn":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":6,"width":38,"height":6,"zIndex":10,"rotation":0,"visible":true,"locked":false,"content":"RTS/2026/DOC-VERIFIED","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251077847-sfxkn","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":8,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251399311-oltg1":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":20,"width":88,"height":8,"zIndex":12,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251399311-oltg1","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":14,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251570687-p9ecw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":78,"y":28,"width":46,"height":12,"zIndex":13,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style=\"text-align: center;\">ई-मेल - akolamc@gmail.com<span style=\"background-color: transparent;\"></span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251570687-p9ecw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788251739647-gnlqc":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":46,"width":78,"height":8,"zIndex":14,"rotation":0,"visible":true,"locked":false,"content":"जा.क्र. मनपा/आर.टी.एस./२०२६/<span data-certificate-tag=\"{{ApplicationNo}}\" contenteditable=\"false\">{{ApplicationNo}}</span>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251739647-gnlqc","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251893206-kk8zs":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":52,"width":14,"height":8,"zIndex":16,"rotation":0,"visible":true,"locked":false,"content":"<div>प्रति,</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251893206-kk8zs","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251947382-5u948":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":12,"y":58,"width":69,"height":17.5,"zIndex":3,"rotation":0,"visible":true,"locked":false,"content":"<div><span data-certificate-tag=\"{{ApplicantName}}\" contenteditable=\"false\">{{ApplicantName}}</span></div><div><span data-certificate-tag=\"{{Field:applicantAddress}}\" contenteditable=\"false\">{{Field:applicantAddress}}</span></div><div><span data-certificate-tag=\"{{ApplicantMobile}}\" contenteditable=\"false\">{{ApplicantMobile}}</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251947382-5u948","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788252120415-jfp3b":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":12,"y":76,"width":146,"height":12,"zIndex":13,"rotation":0,"visible":true,"locked":false,"content":"<u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र.&nbsp;<span data-certificate-tag=\"{{ApplicationNo}}\" contenteditable=\"false\">{{ApplicationNo}}</span>&nbsp;दिनांक&nbsp;<span style=\"background-color: transparent;\">{{AppliedDate}}</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788252120415-jfp3b","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788256006606-li8j9":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":86,"width":52,"height":4,"zIndex":2,"rotation":0,"visible":true,"locked":false,"content":"महोदय / महोदया,<div><div style=\"text-align: center;\"><br></div></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256006606-li8j9","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788256108032-7u9gp":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":90,"width":192,"height":14,"zIndex":4,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style=\"background-color: transparent;\">(अर्ज क्र.&nbsp;</span><span data-certificate-tag=\"{{ApplicationNo}}\" contenteditable=\"false\">{{ApplicationNo}}</span><span style=\"background-color: transparent;\">&nbsp;दि.&nbsp;</span><span style=\"background-color: transparent;\">{{AppliedDate}}</span><span style=\"background-color: transparent;\">) नगररचना विभागामार्फत&nbsp;</span><span style=\"background-color: transparent;\">पडताळणी करण्यात आली आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256108032-7u9gp","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256214054-j7t4v":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":102,"width":192,"height":12,"zIndex":2,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style=\"background-color: transparent;\">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style=\"background-color: transparent;\">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256214054-j7t4v","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256340990-s8jcu":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":154,"width":76,"height":10,"zIndex":3,"rotation":0,"visible":true,"locked":false,"content":"अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256340990-s8jcu","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256499469-g0hpd":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":118,"width":20,"height":8,"zIndex":25,"rotation":0,"visible":true,"locked":false,"content":"शर्ती व अटी:","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256499469-g0hpd","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256554661-c5ji5":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":122,"width":190,"height":12,"zIndex":26,"rotation":0,"visible":true,"locked":false,"content":"१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256554661-c5ji5","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256635309-f77sh":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":134,"width":190,"height":9,"zIndex":27,"rotation":0,"visible":true,"locked":false,"content":"<p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256635309-f77sh","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257546539-vefsg":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":278,"width":194,"height":8,"zIndex":31,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257546539-vefsg","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257730275-4t07z":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":96,"y":284,"width":102,"height":4,"zIndex":33,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\"><span style=\"background-color: transparent;\">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257730275-4t07z","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258066499-2y31i":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":122,"y":270,"width":54,"height":10,"zIndex":35,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style=\"background-color: transparent;\">अकोला महानगरपालिका, अकोला</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788258066499-2y31i","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258263627-jebag":{"type":"rectangle","name":"Rectangle","parentId":null,"childIds":[],"layout":"free","x":0,"y":0,"width":210,"height":297,"zIndex":0.5,"rotation":0,"visible":true,"locked":true,"content":"","source":"","alt":"Rectangle","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788258263627-jebag","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":1.1,"borderEnabled":true,"borderStyle":"double","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788262140503-ys783":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":266,"width":30,"height":4,"zIndex":40,"rotation":0,"visible":true,"locked":false,"content":"लिपिक / शाखा प्रमुख","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262140503-ys783","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262168471-zav1u":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":260,"width":40,"height":4,"zIndex":41,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262168471-zav1u","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262226103-mayph":{"type":"image","name":"Image","parentId":null,"childIds":[],"layout":"free","x":56,"y":240,"width":32,"height":30,"zIndex":43,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/ulb-seal.png","alt":"Municipal seal","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262226103-mayph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788273251362-n3a9q":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":164,"y":48,"width":36,"height":6,"zIndex":45,"rotation":0,"visible":true,"locked":false,"content":"<span style=\"text-align: right;\">दिनांक:&nbsp;</span>{{currentData}}","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788273251362-n3a9q","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788274344668-0sdhp":{"type":"text","name":"Dynamic field {{OfficerRemark}}","parentId":null,"childIds":[],"layout":"free","x":12,"y":160.5,"width":186,"height":16,"zIndex":4,"rotation":0,"visible":true,"locked":false,"content":"<span data-certificate-tag=\"{{OfficerRemark}}\" contenteditable=\"false\">{{OfficerRemark}}</span>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788274344668-0sdhp","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788274409866-vcaev":{"type":"text","name":"Dynamic field {{currentData}}","parentId":null,"childIds":[],"layout":"free","x":10,"y":252,"width":38,"height":6,"zIndex":9,"rotation":0,"visible":true,"locked":false,"content":"<span data-certificate-tag=\"{{currentData}}\" contenteditable=\"false\">{{currentData}}</span>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788274409866-vcaev","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788275558471-33haa":{"type":"signature","name":"Signature","parentId":null,"childIds":[],"layout":"free","x":98,"y":218,"width":100,"height":50,"zIndex":46,"rotation":0,"visible":true,"locked":false,"content":"{{DigitalSignature}}","source":"","alt":"Signature","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788275558471-33haa","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788275586967-podn1":{"type":"qr","name":"QR Code","parentId":null,"childIds":[],"layout":"free","x":166,"y":6,"width":28,"height":28,"zIndex":47,"rotation":0,"visible":true,"locked":false,"content":"{{QRCode}}","source":"","alt":"QR Code","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788275586967-podn1","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788336696578-s227f":{"type":"image","name":"Image","parentId":null,"childIds":[],"layout":"free","x":8,"y":8,"width":34,"height":30,"zIndex":48,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/logo.png","alt":"Municipal logo","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788336696578-s227f","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788506441128-wxli2":{"type":"image","name":"Main Body Logo Image","parentId":null,"childIds":[],"layout":"free","x":32,"y":64,"width":146,"height":148,"zIndex":1,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/logo.png","alt":"Municipal logo","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":true,"dividerOrientation":"horizontal","id":"node-1788506441128-wxli2","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":0.12,"padding":2,"objectFit":"contain"}}},"metadata":{"language":"en","migratedFromLegacy":false}}', 1, 1, '2026-09-01T19:18:16.080', 1, '2026-09-09T16:18:42.280', 0, NULL),
    (2, 61, N'New Certificate Template', N'CERT_61', N'<div class="certificate-repeatable-header" data-certificate-section="header" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:42mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:4mm;top:28mm;width:30mm;height:12mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251110575-qpk3w" style="position:absolute;left:182mm;top:6mm;width:20mm;height:8mm;;;z-index:11;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;"><span style="background-color: transparent;">RTS00023191</span></div></div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div></div>', N'<div class="certificate-canvas-pages" data-certificate-multipage="true"><section class="certificate-canvas-document" data-certificate-page="1" style="position:relative;width:210mm;height:297mm;background:#ffffff;overflow:hidden;box-sizing:border-box;page-break-after:auto"><div data-certificate-node="node-1788184118093-v8kqj" style="position:absolute;left:8mm;top:42mm;width:194mm;height:4mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788185078852-u4jph" style="position:absolute;left:4mm;top:28mm;width:30mm;height:12mm;;;z-index:8;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;">अकोला महानगरपालिका, अकोला</div></div><div data-certificate-node="node-1788250565617-xtniw" style="position:absolute;left:58mm;top:8mm;width:84mm;height:14mm;;;z-index:9;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:16px;font-weight:350;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><b>अकोला महानगरपालिका, अकोला</b></div><div style="text-align: center;"><b>नगर रचना</b></div><br></div><div data-certificate-node="node-1788251077847-sfxkn" style="position:absolute;left:8mm;top:6mm;width:38mm;height:6mm;;;z-index:10;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">RTS/2026/DOC-VERIFIED</div><div data-certificate-node="node-1788251110575-qpk3w" style="position:absolute;left:182mm;top:6mm;width:20mm;height:8mm;;;z-index:11;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:8px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;"><span style="background-color: transparent;">RTS00023191</span></div></div><div data-certificate-node="node-1788251399311-oltg1" style="position:absolute;left:58mm;top:20mm;width:88mm;height:8mm;;;z-index:12;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:14px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div></div><div data-certificate-node="node-1788251570687-p9ecw" style="position:absolute;left:78mm;top:28mm;width:46mm;height:12mm;;;z-index:13;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: center;"><span style="background-color: transparent;">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style="text-align: center;">ई-मेल - akolamc@gmail.com<span style="background-color: transparent;"></span></div></div><div data-certificate-node="node-1788258263627-jebag" style="position:absolute;left:0mm;top:0mm;width:210mm;height:297mm;;;z-index:0.5;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:1.3mm double #1e3a8a;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788337021153-cbi9o" style="position:absolute;left:120mm;top:72mm;width:80mm;height:12mm;;;z-index:1;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788251739647-gnlqc" style="position:absolute;left:8mm;top:46mm;width:64mm;height:8mm;;;z-index:14;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">जा.क्र. मनपा/आर.टी.एस./२०२६/RTS00023191</div><div data-certificate-node="node-1788251802111-nzfcu" style="position:absolute;left:158mm;top:46mm;width:44mm;height:8mm;;;z-index:15;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div style="text-align: right;">दिनांक: 01/09/2026</div></div><div data-certificate-node="node-1788251893206-kk8zs" style="position:absolute;left:8mm;top:52mm;width:14mm;height:8mm;;;z-index:16;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>प्रति,</div></div><div data-certificate-node="node-1788251947382-5u948" style="position:absolute;left:10mm;top:56mm;width:42mm;height:18mm;;;z-index:17;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div><span data-certificate-tag="{{ApplicantName}}" contenteditable="false">{{ApplicantName}}</span></div><div>प्लॉट क्र. २४, राम नगर, अकोला</div><div><span data-certificate-tag="{{ApplicantMobile}}" contenteditable="false">{{ApplicantMobile}}</span></div></div><div data-certificate-node="node-1788252120415-jfp3b" style="position:absolute;left:10mm;top:72mm;width:106mm;height:14mm;;;z-index:18;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र. RTS00023191 दिनांक 24/08/2026</div></div><div data-certificate-node="node-1788256006606-li8j9" style="position:absolute;left:10mm;top:86mm;width:52mm;height:4mm;;;z-index:19;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">महोदय / महोदया,<div><div style="text-align: center;"><br></div></div></div><div data-certificate-node="node-1788256108032-7u9gp" style="position:absolute;left:8mm;top:90mm;width:192mm;height:14mm;;;z-index:20;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style="background-color: transparent;">(अर्ज क्र. RTS00023191 दि. 24/08/2026) नगररचना विभागामार्फत&nbsp;</span><span style="background-color: transparent;">पडताळणी करण्यात आली आहे.</span></div></div><div data-certificate-node="node-1788256214054-j7t4v" style="position:absolute;left:8mm;top:102mm;width:192mm;height:12mm;;;z-index:21;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style="background-color: transparent;">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style="background-color: transparent;">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div></div><div data-certificate-node="node-1788256361109-1z20c" style="position:absolute;left:10mm;top:116mm;width:190mm;height:22mm;;;z-index:23;transform:rotate(0deg);opacity:0.6;color:#0f172a;background:#ffeca8;border:0.5mm solid #1e3a8a;border-radius:1.5mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden"></div><div data-certificate-node="node-1788256340990-s8jcu" style="position:absolute;left:10mm;top:116mm;width:76mm;height:10mm;;;z-index:24;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):</div><div data-certificate-node="node-1788256499469-g0hpd" style="position:absolute;left:8mm;top:142mm;width:20mm;height:8mm;;;z-index:25;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">शर्ती व अटी:</div><div data-certificate-node="node-1788256554661-c5ji5" style="position:absolute;left:12mm;top:146mm;width:190mm;height:12mm;;;z-index:26;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div></div><div data-certificate-node="node-1788256635309-f77sh" style="position:absolute;left:10mm;top:160mm;width:190mm;height:9mm;;;z-index:27;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p></div><div data-certificate-node="node-1788257546539-vefsg" style="position:absolute;left:8mm;top:278mm;width:194mm;height:8mm;;;z-index:31;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788257573699-8ag7k" style="position:absolute;left:6mm;top:282mm;width:90mm;height:18mm;;;z-index:32;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:11px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden">D:\अकोला महानगरपालिका, अकोला\नगर रचना\Certificate</div><div data-certificate-node="node-1788333176664-lxlq1" style="position:absolute;left:12mm;top:14mm;width:14mm;height:14mm;;;z-index:46;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/logo.png" alt="Municipal logo" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:98mm;top:272mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:144mm;top:258mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:10mm;top:242mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:10mm;top:239mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262186039-f8luy" style="position:absolute;left:18mm;top:234mm;width:26mm;height:4mm;;;z-index:42;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">01/09/2026</div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:84mm;top:230mm;width:30mm;height:28mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275519823-ctte8" style="position:absolute;left:142mm;top:236mm;width:56mm;height:20mm;;;z-index:45;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788333321376-b7z0h" style="position:absolute;left:10mm;top:246mm;width:30mm;height:29mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0.5mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></section></div>', N'<div class="certificate-repeatable-footer" data-certificate-section="footer" style="position:relative;width:210mm;height:297mm;overflow:hidden;box-sizing:border-box"><div data-certificate-node="node-1788257730275-4t07z" style="position:absolute;left:98mm;top:272mm;width:102mm;height:4mm;;;z-index:33;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:9px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;"><span style="background-color: transparent;">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div></div><div data-certificate-node="node-1788258066499-2y31i" style="position:absolute;left:144mm;top:258mm;width:54mm;height:10mm;;;z-index:35;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><div style="text-align: justify;">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style="background-color: transparent;">अकोला महानगरपालिका, अकोला</span></div></div><div data-certificate-node="node-1788262140503-ys783" style="position:absolute;left:10mm;top:242mm;width:30mm;height:4mm;;;z-index:40;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">लिपिक / शाखा प्रमुख</div><div data-certificate-node="node-1788262168471-zav1u" style="position:absolute;left:10mm;top:239mm;width:40mm;height:4mm;;;z-index:41;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden;padding:0"><span style="position:absolute;left:0;top:50%;width:100%;border-top:0.5mm solid #1e3a8a;transform:translateY(-50%)"></span></div><div data-certificate-node="node-1788262186039-f8luy" style="position:absolute;left:18mm;top:234mm;width:26mm;height:4mm;;;z-index:42;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden">01/09/2026</div><div data-certificate-node="node-1788262226103-mayph" style="position:absolute;left:84mm;top:230mm;width:30mm;height:28mm;;;z-index:43;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0mm;box-sizing:border-box;overflow:hidden"><img src="/images/ulb-seal.png" alt="Municipal seal" style="width:100%;height:100%;object-fit:contain;display:block" /></div><div data-certificate-node="node-1788275519823-ctte8" style="position:absolute;left:142mm;top:236mm;width:56mm;height:20mm;;;z-index:45;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:2mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{DigitalSignature}}</div><div data-certificate-node="node-1788333321376-b7z0h" style="position:absolute;left:10mm;top:246mm;width:30mm;height:29mm;;;z-index:47;transform:rotate(0deg);opacity:1;color:#0f172a;background:transparent;border:none;border-radius:0mm;font-family:Noto Sans Devanagari, Segoe UI, sans-serif;font-size:12px;font-weight:400;font-style:normal;text-decoration:none;text-align:left;line-height:1.4;padding:0.5mm;box-sizing:border-box;overflow:hidden;display:flex;align-items:center;justify-content:center">{{QRCode}}</div></div>', NULL, NULL, N'{"page":{"widthMm":210,"heightMm":297,"marginMm":10,"backgroundColor":"#ffffff","showGrid":true,"snapToGrid":true,"gridSizeMm":2,"pageCount":1,"headerHeightMm":47.5,"footerHeightMm":69.8,"headerEnabled":true,"footerEnabled":true},"rootIds":["node-1788184118093-v8kqj","node-1788185078852-u4jph","node-1788251399311-oltg1","node-1788250565617-xtniw","node-1788251077847-sfxkn","node-1788251110575-qpk3w","node-1788251570687-p9ecw","node-1788251739647-gnlqc","node-1788251802111-nzfcu","node-1788251893206-kk8zs","node-1788251947382-5u948","node-1788252120415-jfp3b","node-1788256006606-li8j9","node-1788256108032-7u9gp","node-1788256214054-j7t4v","node-1788256340990-s8jcu","node-1788256361109-1z20c","node-1788256499469-g0hpd","node-1788256554661-c5ji5","node-1788256635309-f77sh","node-1788257546539-vefsg","node-1788257573699-8ag7k","node-1788258263627-jebag","node-1788262140503-ys783","node-1788262168471-zav1u","node-1788262186039-f8luy","node-1788262226103-mayph","node-1788258066499-2y31i","node-1788257730275-4t07z","node-1788333176664-lxlq1","node-1788333321376-b7z0h","node-1788275519823-ctte8","node-1788337021153-cbi9o"],"nodes":{"node-1788184118093-v8kqj":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":42,"width":194,"height":4,"zIndex":1,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788184118093-v8kqj","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788185078852-u4jph":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":4,"y":28,"width":30,"height":12,"zIndex":8,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\">अकोला महानगरपालिका, अकोला</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"dividerOrientation":"horizontal","id":"node-1788185078852-u4jph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"},"repeatOnAllPages":false},"node-1788250565617-xtniw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":8,"width":84,"height":14,"zIndex":9,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><b>अकोला महानगरपालिका, अकोला</b></div><div style=\"text-align: center;\"><b>नगर रचना</b></div><br>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788250565617-xtniw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":16,"fontWeight":350,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251077847-sfxkn":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":6,"width":38,"height":6,"zIndex":10,"rotation":0,"visible":true,"locked":false,"content":"RTS/2026/DOC-VERIFIED","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251077847-sfxkn","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":8,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251110575-qpk3w":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":182,"y":6,"width":20,"height":8,"zIndex":11,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: right;\"><span style=\"background-color: transparent;\">RTS00023191</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251110575-qpk3w","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":8,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251399311-oltg1":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":58,"y":20,"width":88,"height":8,"zIndex":12,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर रचना मजला,</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251399311-oltg1","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":14,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251570687-p9ecw":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":78,"y":28,"width":46,"height":12,"zIndex":13,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: center;\"><span style=\"background-color: transparent;\">बाजार, अकोला, महाराष्ट्र - ४४४००१</span></div><div style=\"text-align: center;\">ई-मेल - akolamc@gmail.com<span style=\"background-color: transparent;\"></span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"header","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251570687-p9ecw","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788251739647-gnlqc":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":46,"width":64,"height":8,"zIndex":14,"rotation":0,"visible":true,"locked":false,"content":"जा.क्र. मनपा/आर.टी.एस./२०२६/RTS00023191","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251739647-gnlqc","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251802111-nzfcu":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":158,"y":46,"width":44,"height":8,"zIndex":15,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: right;\">दिनांक: 01/09/2026</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251802111-nzfcu","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251893206-kk8zs":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":52,"width":14,"height":8,"zIndex":16,"rotation":0,"visible":true,"locked":false,"content":"<div>प्रति,</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251893206-kk8zs","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788251947382-5u948":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":56,"width":42,"height":18,"zIndex":17,"rotation":0,"visible":true,"locked":false,"content":"<div><span data-certificate-tag=\"{{ApplicantName}}\" contenteditable=\"false\">{{ApplicantName}}</span></div><div>प्लॉट क्र. २४, राम नगर, अकोला</div><div><span data-certificate-tag=\"{{ApplicantMobile}}\" contenteditable=\"false\">{{ApplicantMobile}}</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788251947382-5u948","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788252120415-jfp3b":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":72,"width":106,"height":14,"zIndex":18,"rotation":0,"visible":true,"locked":true,"content":"<u>विषय</u> :- खुल्या प्लॉटला बांधकाम अधिकृत प्रमाणपत्र देण्याबाबत.<div><u>संदर्भ</u> :- आपला ऑनलाइन RTS अर्ज क्र. RTS00023191 दिनांक 24/08/2026</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788252120415-jfp3b","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256006606-li8j9":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":86,"width":52,"height":4,"zIndex":19,"rotation":0,"visible":true,"locked":false,"content":"महोदय / महोदया,<div><div style=\"text-align: center;\"><br></div></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256006606-li8j9","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788256108032-7u9gp":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":90,"width":192,"height":14,"zIndex":20,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; नगररचना व विकास योजना नियमानुसार सादर केलेल्या दोन खुल्या अर्जाची&nbsp;<span style=\"background-color: transparent;\">(अर्ज क्र. RTS00023191 दि. 24/08/2026) नगररचना विभागामार्फत&nbsp;</span><span style=\"background-color: transparent;\">पडताळणी करण्यात आली आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256108032-7u9gp","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256214054-j7t4v":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":102,"width":192,"height":12,"zIndex":21,"rotation":0,"visible":true,"locked":false,"content":"<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; अधिकृत नगररचना अभिलेखानुसार सदर जागेत दोन तपशील खालील आहेत&nbsp;<span style=\"background-color: transparent;\">सोबतचे घटक (जागा: प्लॉट क्र. २४, राम नगर, अकोला)&nbsp;</span><span style=\"background-color: transparent;\">यांना दिनांक 01/09/2026 रोजी निर्गमित करण्यात येत आहे.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256214054-j7t4v","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256340990-s8jcu":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":116,"width":76,"height":10,"zIndex":24,"rotation":0,"visible":true,"locked":false,"content":"अधिकारी निर्णय व पडताळणी तपशील (Officer Inputs):","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256340990-s8jcu","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256361109-1z20c":{"type":"rectangle","name":"Rectangle","parentId":null,"childIds":[],"layout":"free","x":10,"y":116,"width":190,"height":22,"zIndex":23,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Rectangle","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256361109-1z20c","style":{"color":"#0f172a","backgroundColor":"#ffeca8","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":1.5,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":0.6,"padding":2,"objectFit":"contain"}},"node-1788256499469-g0hpd":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":8,"y":142,"width":20,"height":8,"zIndex":25,"rotation":0,"visible":true,"locked":false,"content":"शर्ती व अटी:","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256499469-g0hpd","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256554661-c5ji5":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":12,"y":146,"width":190,"height":12,"zIndex":26,"rotation":0,"visible":true,"locked":false,"content":"१. सदर खुल्या प्लॉट विकास योजना व नगररचना नियमावलीच्या अधीन राहील.<div>२. सदर बांधकामाच्या जागेचा मालकी हक्काचा किंवा कायदेशीरतेचा कोणताही दावा करता येणार नाही.</div>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256554661-c5ji5","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788256635309-f77sh":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":160,"width":190,"height":9,"zIndex":27,"rotation":0,"visible":true,"locked":false,"content":"<p>टिप :- सदर दाखल्याचा कालावधी हा दाखला दिलेल्या तारखेपासून १० दिवसांपर्यंत ग्राह्य धरता येईल.</p>","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788256635309-f77sh","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257546539-vefsg":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":8,"y":278,"width":194,"height":8,"zIndex":31,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257546539-vefsg","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788257573699-8ag7k":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":6,"y":282,"width":90,"height":18,"zIndex":32,"rotation":0,"visible":true,"locked":false,"content":"D:\\अकोला महानगरपालिका, अकोला\\नगर रचना\\Certificate","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257573699-8ag7k","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":11,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788257730275-4t07z":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":98,"y":272,"width":102,"height":4,"zIndex":33,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\"><span style=\"background-color: transparent;\">हे प्रमाणपत्र संगणकीय प्रणालीद्वारे डिजिटल स्वाक्षरीत जारी केले असून यावर प्रत्यक्ष स्वाक्षरीची आवश्यकता नाही.</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788257730275-4t07z","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":9,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258066499-2y31i":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":144,"y":258,"width":54,"height":10,"zIndex":35,"rotation":0,"visible":true,"locked":false,"content":"<div style=\"text-align: justify;\">सहायक आयुक्त / इतर अधिकारी&nbsp;<span style=\"background-color: transparent;\">अकोला महानगरपालिका, अकोला</span></div>","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788258066499-2y31i","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788258263627-jebag":{"type":"rectangle","name":"Rectangle","parentId":null,"childIds":[],"layout":"free","x":0,"y":0,"width":210,"height":297,"zIndex":0.5,"rotation":0,"visible":true,"locked":true,"content":"","source":"","alt":"Rectangle","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":true,"dividerOrientation":"horizontal","id":"node-1788258263627-jebag","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":1.3,"borderEnabled":true,"borderStyle":"double","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788262140503-ys783":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":10,"y":242,"width":30,"height":4,"zIndex":40,"rotation":0,"visible":true,"locked":false,"content":"लिपिक / शाखा प्रमुख","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262140503-ys783","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262168471-zav1u":{"type":"divider","name":"Divider","parentId":null,"childIds":[],"layout":"free","x":10,"y":239,"width":40,"height":4,"zIndex":41,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Divider","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262168471-zav1u","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0.5,"borderEnabled":true,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262186039-f8luy":{"type":"text","name":"Text","parentId":null,"childIds":[],"layout":"free","x":18,"y":234,"width":26,"height":4,"zIndex":42,"rotation":0,"visible":true,"locked":false,"content":"01/09/2026","source":"","alt":"Text","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262186039-f8luy","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788262226103-mayph":{"type":"image","name":"Image","parentId":null,"childIds":[],"layout":"free","x":84,"y":230,"width":30,"height":28,"zIndex":43,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/ulb-seal.png","alt":"Municipal seal","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788262226103-mayph","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788275519823-ctte8":{"type":"signature","name":"Signature","parentId":null,"childIds":[],"layout":"free","x":142,"y":236,"width":56,"height":20,"zIndex":45,"rotation":0,"visible":true,"locked":false,"content":"{{DigitalSignature}}","source":"","alt":"Signature","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":true,"dividerOrientation":"horizontal","id":"node-1788275519823-ctte8","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}},"node-1788333176664-lxlq1":{"type":"image","name":"Image","parentId":null,"childIds":[],"layout":"free","x":12,"y":14,"width":14,"height":14,"zIndex":46,"rotation":0,"visible":true,"locked":false,"content":"","source":"/images/logo.png","alt":"Municipal logo","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788333176664-lxlq1","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0,"objectFit":"contain"}},"node-1788333321376-b7z0h":{"type":"qr","name":"QR Code","parentId":null,"childIds":[],"layout":"free","x":10,"y":246,"width":30,"height":29,"zIndex":47,"rotation":0,"visible":true,"locked":false,"content":"{{QRCode}}","source":"","alt":"QR Code","columns":2,"gap":3,"section":"footer","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788333321376-b7z0h","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":0.5,"objectFit":"contain"}},"node-1788337021153-cbi9o":{"type":"text","name":"Dynamic field {{ApplicantMobile}}","parentId":null,"childIds":[],"layout":"free","x":120,"y":72,"width":80,"height":12,"zIndex":1,"rotation":0,"visible":true,"locked":false,"content":"","source":"","alt":"Text","columns":2,"gap":3,"section":"body","pageIndex":0,"repeatOnAllPages":false,"dividerOrientation":"horizontal","id":"node-1788337021153-cbi9o","style":{"color":"#0f172a","backgroundColor":"transparent","borderColor":"#1e3a8a","borderWidth":0,"borderEnabled":false,"borderStyle":"solid","borderRadius":0,"fontFamily":"Noto Sans Devanagari, Segoe UI, sans-serif","fontSize":12,"fontWeight":400,"fontStyle":"normal","textDecoration":"none","textAlign":"left","lineHeight":1.4,"opacity":1,"padding":2,"objectFit":"contain"}}},"metadata":{"language":"en","migratedFromLegacy":false}}', 1, 1, '2026-09-02T13:47:40.557', NULL, NULL, 0, NULL),
    (6, 55, N'विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे अधिकृत प्रमाणपत्र दाखला', N'CERT_55', NULL, N'
      <div class=''official-certificate-sheet p-6 md:p-8 bg-white border-[5px] border-double border-slate-900 relative shadow-sm transition-all'' style=''min-height: 297mm;''>
        <!-- Dynamic ULB Logo Background Watermark -->
        <div class=''absolute inset-0 flex items-center justify-center pointer-events-none z-0 overflow-hidden''>
                 <img src=''/images/org_logo.png'' alt=''ULB Watermark'' style=''opacity: 0.06;'' class=''w-72 h-72 object-contain filter grayscale'' onerror="this.style.display=''none''"/>
               </div>
    
            <div class=''header-letterhead relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>
              
              <div class=''flex justify-between items-center font-mono mb-1 opacity-80'' style=''font-size: 0.75em;''><div>RTS/2026/DOC-VERIFIED</div><div>{{ApplicationNo}}</div></div>
              <div class=''flex items-center justify-between gap-4''>
                <div class=''shrink-0 text-left'' style=''width: 85px;''><img src=''/images/org_logo.png'' alt=''ULB Logo'' style=''max-height: 75px; max-width: 75px;'' class=''object-contain'' onerror="this.style.display=''none''"/><div style=''font-size: 0.72em; font-weight: bold; margin-top: 2px; text-align: left; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका, अकोला</div></div>
                <div class=''flex-1 text-center'' style=''text-align: center !important;''>
                  <div style=''font-size: 1.45em; font-weight: bold; font-family: inherit; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका, अकोला</div>
                  <div style=''font-size: 1.05em; font-weight: bold; margin-top: 2px; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>शिक्षण</div>
                  <div style=''font-size: 0.85em; margin-top: 2px; opacity: 0.9; text-align: center !important; color: #0f172a !important; font-size: 14px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: center !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>एम. जी. रोड, मुख्य प्रशासकीय इमारत, नगर वाचनालय, शास्त्री पुतळ्याजवळ, जुना कापड बाजार, अकोला, महाराष्ट्र - ४४४००१</div>
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
              
              <div style=''margin-bottom: 0.25rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>विषय :- विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे बाबत अधिकृत प्रमाणपत्र पुरविणेबाबत.</div>
              <div style=''opacity: 0.95; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>संदर्भ :- आपला ऑनलाईन RTS अर्ज क्र. {{ApplicationNo}} दिनांक {{ApplicationDate}}</div>
            </div>
          
            <div class=''salutation-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 2px !important; padding-bottom: 2px !important; padding-left: 4px !important; padding-right: 4px !important; margin-bottom: 6px !important;  ''>
              
              <div style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: bold !important; font-style: normal !important; text-decoration: none !important;''>महोदय / महोदया,</div>
            </div>
          
            <div class=''narrative-body relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 6px !important; padding-right: 6px !important; margin-bottom: 12px !important;  ''>
              
              <p style=''text-indent: 2rem; margin-bottom: 0.5em; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>उपरोक्त विषयान्वये आपणास कळविण्यात येते की, आपण महाराष्ट्र लोकसेवा हक्क अधिनियमान्वये केलेल्या अर्जानुसार (अर्ज क्र. {{ApplicationNo}} दि. {{ApplicationDate}}), संबंधित कागदपत्रांची छाननी व स्थळ पाहणी नियमानुसार पूर्ण करण्यात आली आहे.</p>
              <p style=''text-indent: 2rem; color: #0f172a !important; font-size: 13px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.6 !important; text-align: justify !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सबब, विहित नियमांच्या अधीन राहून {{ApplicantName}} (रा. {{ApplicantAddress}}) यांना विद्यार्थ्याचा शाळा सोडण्याचा दाखला व दुय्यम प्रत दाखला देणे प्रमाणपत्र दिनांक {{ApprovalDate}} रोजी खालील अटी व शर्तींच्या अधीन राहून निर्गमित करण्यात येत आहे.</p>
            </div>
          
            {{OfficerFieldsBlock}}
          
              <div class=''conditions-block relative z-10 transition-all  relative''  style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important; width: 100%; padding-top: 8px !important; padding-bottom: 8px !important; padding-left: 8px !important; padding-right: 8px !important; margin-bottom: 12px !important;  ''>
                
                <div style=''margin-bottom: 0.5rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>शर्ती व अटी:</div>
                <ol style=''list-style-type: decimal; padding-left: 1.5rem; display: flex; flex-direction: column; gap: 0.35rem; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>
                  <li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>सदर दाखला शाळेतील अधिकृत जनरल रजिस्टर (G.R.) वरून पडताळणी करून जारी करण्यात आला आहे.</li><li style=''color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.5 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>दाखल्यात कोणताही खाडाखोड केल्यास तो अवैध ठरेल.</li>
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
                <div style=''font-size: 0.85em; opacity: 0.9; color: #0f172a !important; font-size: 12px !important; font-family: ''Noto Sans Devanagari'', ''Segoe UI'', Arial, sans-serif !important; line-height: 1.4 !important; text-align: left !important; font-weight: normal !important; font-style: normal !important; text-decoration: none !important;''>अकोला महानगरपालिका, अकोला</div>
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
              D:\अकोला महानगरपालिका, अकोला\शिक्षण\Certificate
            </div>
          </div>', NULL, N'["सदर दाखला शाळेतील अधिकृत जनरल रजिस्टर (G.R.) वरून पडताळणी करून जारी करण्यात आला आहे.","दाखल्यात कोणताही खाडाखोड केल्यास तो अवैध ठरेल."]', N'[{"fieldKey":"GRNo","fieldLabelMarathi":"जनरल रजिस्टर (G.R.) क्र.","fieldLabelEnglish":"G.R. No","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"MotherName","fieldLabelMarathi":"आईचे नाव","fieldLabelEnglish":"Mother Name","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"CasteCategory","fieldLabelMarathi":"धर्म व जात / प्रवर्ग","fieldLabelEnglish":"Religion & Caste","fieldType":"text","isMandatory":false,"defaultValue":null,"options":null},{"fieldKey":"BirthPlace","fieldLabelMarathi":"जन्मस्थान","fieldLabelEnglish":"Birth Place","fieldType":"text","isMandatory":false,"defaultValue":null,"options":null},{"fieldKey":"DOB","fieldLabelMarathi":"जन्मतारीख (DD/MM/YYYY)","fieldLabelEnglish":"Date of Birth","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"DOBWords","fieldLabelMarathi":"जन्मतारीख (अक्षरात)","fieldLabelEnglish":"DOB in Words","fieldType":"text","isMandatory":false,"defaultValue":null,"options":null},{"fieldKey":"AdmissionDate","fieldLabelMarathi":"प्रवेश दिनांक","fieldLabelEnglish":"Admission Date","fieldType":"text","isMandatory":false,"defaultValue":null,"options":null},{"fieldKey":"AdmissionStd","fieldLabelMarathi":"प्रवेशाची इयत्ता","fieldLabelEnglish":"Admission Std","fieldType":"text","isMandatory":false,"defaultValue":null,"options":null},{"fieldKey":"Conduct","fieldLabelMarathi":"प्रगती व वर्तणूक","fieldLabelEnglish":"Conduct & Progress","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"LeavingDate","fieldLabelMarathi":"शाळा सोडल्याचा दिनांक","fieldLabelEnglish":"Leaving Date","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"StandardStudied","fieldLabelMarathi":"शिकत असलेली इयत्ता","fieldLabelEnglish":"Standard Studied","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null},{"fieldKey":"ReasonForLeaving","fieldLabelMarathi":"शाळा सोडण्याचे कारण","fieldLabelEnglish":"Reason for Leaving","fieldType":"text","isMandatory":true,"defaultValue":null,"options":null}]', NULL, 1, NULL, '2026-08-26T15:03:44.843', 2, '2026-08-31T16:45:30.407', 0, NULL),
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
</div>', NULL, N'["रस्त्यावरील वाहतुकीस व पादचाऱ्यांना अडथळा निर्माण होणार नाही अशा पद्धतीने मंडप उभारणे आवश्यक आहे.","मुदत संपताच २४ तासांच्या आत मंडप काढून रस्ता पूर्ववत करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"Location","fieldLabelMarathi":"मंडपाचे ठिकाण","fieldLabelEnglish":"Mandap Location","fieldType":"text","isMandatory":true},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"परवानगी कालावधी","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क / अनामत पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T15:03:44.843', NULL, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["तोडलेल्या प्रत्येक वृक्षाच्या बदल्यात नियमानुसार नवीन वृक्षांची लागवड करून त्यांचे ३ वर्षे संवर्धन करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"परवानगी आदेश क्रमांक","fieldLabelEnglish":"Order No","fieldType":"text","isMandatory":true},{"fieldKey":"TreeCount","fieldLabelMarathi":"मंजूर वृक्षांची संख्या","fieldLabelEnglish":"Approved Tree Count","fieldType":"text","isMandatory":true},{"fieldKey":"ReplantCount","fieldLabelMarathi":"पुनर्लागवड करावयाची झाडे","fieldLabelEnglish":"Replant Trees Count","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T15:03:44.843', NULL, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["पुढील संपूर्ण बांधकाम मंजूर नकाशा, विकास नियंत्रण नियमावली व सुरक्षिततेच्या मानकांनुसारच करणे बंधनकारक आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"जोते आदेश क्रमांक","fieldLabelEnglish":"Plinth Order No","fieldType":"text","isMandatory":true},{"fieldKey":"BuildingPermitNo","fieldLabelMarathi":"बांधकाम परवानगी क्र.","fieldLabelEnglish":"Building Permit No","fieldType":"text","isMandatory":true},{"fieldKey":"ArchitectName","fieldLabelMarathi":"अभियंता / वास्तुविशारद नाव","fieldLabelEnglish":"Architect / Engineer","fieldType":"text","isMandatory":false},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T15:12:49.523', 2, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["सदर दाखला पुढील उच्च शिक्षण किंवा इतर संस्थेत प्रवेश घेण्यासाठी वैध आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"दाखला / जावक क्रमांक","fieldLabelEnglish":"Certificate No","fieldType":"text","isMandatory":true},{"fieldKey":"EnrollmentNo","fieldLabelMarathi":"नोंदणी / इनरोलमेंट क्र.","fieldLabelEnglish":"Enrollment No","fieldType":"text","isMandatory":false},{"fieldKey":"SchoolName","fieldLabelMarathi":"शाळेचे नाव","fieldLabelEnglish":"School Name","fieldType":"text","isMandatory":true},{"fieldKey":"ReasonForTransfer","fieldLabelMarathi":"स्थलांतराचे कारण","fieldLabelEnglish":"Reason for Transfer","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T15:12:49.523', NULL, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["सदर गुणपत्रक मूळ परीक्षा अभिलेखावरून पडताळणी करून अधिकृतरीत्या द्वितीय प्रत म्हणून जारी केले आहे.","या गुणपत्रकावर सक्षम प्राधिकाऱ्यांची डिजिटल स्वाक्षरी व QR पडताळणी समाविष्ट आहे."]', N'[{"fieldKey":"SeatNo","fieldLabelMarathi":"आसन / रोल नंबर","fieldLabelEnglish":"Seat / Roll No","fieldType":"text","isMandatory":true},{"fieldKey":"ExamName","fieldLabelMarathi":"परीक्षेचे नाव","fieldLabelEnglish":"Exam Name","fieldType":"text","isMandatory":true},{"fieldKey":"AcademicYear","fieldLabelMarathi":"शैक्षणिक वर्ष","fieldLabelEnglish":"Academic Year","fieldType":"text","isMandatory":true},{"fieldKey":"MarksMarathi","fieldLabelMarathi":"मराठी गुण","fieldLabelEnglish":"Marathi Marks","fieldType":"number","isMandatory":true},{"fieldKey":"MarksHindi","fieldLabelMarathi":"हिंदी गुण","fieldLabelEnglish":"Hindi Marks","fieldType":"number","isMandatory":true},{"fieldKey":"MarksEnglish","fieldLabelMarathi":"इंग्रजी गुण","fieldLabelEnglish":"English Marks","fieldType":"number","isMandatory":true},{"fieldKey":"MarksMaths","fieldLabelMarathi":"गणित गुण","fieldLabelEnglish":"Maths Marks","fieldType":"number","isMandatory":true},{"fieldKey":"MarksScience","fieldLabelMarathi":"विज्ञान गुण","fieldLabelEnglish":"Science Marks","fieldType":"number","isMandatory":true},{"fieldKey":"MarksSocialScience","fieldLabelMarathi":"सामाजिक शास्त्रे गुण","fieldLabelEnglish":"Social Science Marks","fieldType":"number","isMandatory":true},{"fieldKey":"TotalMarks","fieldLabelMarathi":"एकूण गुण (६०० पैकी)","fieldLabelEnglish":"Total Marks (out of 600)","fieldType":"number","isMandatory":true},{"fieldKey":"Percentage","fieldLabelMarathi":"टक्केवारी (%)","fieldLabelEnglish":"Percentage","fieldType":"text","isMandatory":true},{"fieldKey":"Grade","fieldLabelMarathi":"श्रेणी / निकाल (Grade/Pass)","fieldLabelEnglish":"Result Grade","fieldType":"text","isMandatory":true}]', NULL, 1, NULL, '2026-08-26T15:12:49.523', NULL, '2026-08-28T13:47:17.447', 0, NULL),
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
          </div>', NULL, N'["सदर दुरुस्तीचे काम मनपा बांधकाम विभागाच्या देखरेखीखाली दर्जेदार साहित्यासह पूर्ण करण्यात आले आहे."]', N'[{"fieldKey":"InspectionRemark","fieldLabelMarathi":"स्थळ पाहणी व छाननी शेरा","fieldLabelEnglish":"Site Inspection & Verification Remark","fieldType":"textarea","isMandatory":false},{"fieldKey":"SpecificValidityNote","fieldLabelMarathi":"विशेष वैधता नोंद","fieldLabelEnglish":"Special Validity Note","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T16:36:33.087', 2, '2026-08-29T11:29:53.703', 0, NULL),
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
</div>', NULL, N'["ड्रेनेज झाकण सुरक्षेच्या निकषांनुसार सुस्थितीत बसविण्यात आले असून नियमित तपासणी केली जाईल."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"काम पूर्तता क्रमांक","fieldLabelEnglish":"Completion No","fieldType":"text","isMandatory":true},{"fieldKey":"Location","fieldLabelMarathi":"ठिकाण / प्रभाग","fieldLabelEnglish":"Location / Ward","fieldType":"text","isMandatory":true},{"fieldKey":"CompletionDate","fieldLabelMarathi":"झाकण बसविल्याचा दिनांक","fieldLabelEnglish":"Completion Date","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T16:36:33.087', 2, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["परिसरात दैनंदिन स्वच्छता राखण्यासाठी नियमित घंटागाडी व सफाई कर्मचाऱ्यांची नेमणूक करण्यात आली आहे."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"कारवाई / अहवाल क्रमांक","fieldLabelEnglish":"Report / Outward No","fieldType":"text","isMandatory":true},{"fieldKey":"Location","fieldLabelMarathi":"स्वच्छता परिसर","fieldLabelEnglish":"Cleanliness Location","fieldType":"text","isMandatory":true},{"fieldKey":"CompletionDate","fieldLabelMarathi":"कार्यवाही दिनांक","fieldLabelEnglish":"Action Date","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T16:36:33.087', NULL, '2026-08-28T13:47:17.447', 0, NULL),
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
</div>', NULL, N'["सदर प्रमाणपत्र केवळ नियुक्त फेरीवाला क्षेत्रातच व्यवसाय करण्यासाठी वैध आहे.","वाहतुकीस अडथळा निर्माण होणार नाही व स्वच्छतेच्या नियमांचे पालन करणे बंधनकारक आहे.","सदर नोंदणी प्रमाणपत्र हस्तांतरणीय नाही."]', N'[{"fieldKey":"OrderNo","fieldLabelMarathi":"फेरीवाला नोंदणी क्रमांक","fieldLabelEnglish":"Vendor Reg No","fieldType":"text","isMandatory":true},{"fieldKey":"VendorType","fieldLabelMarathi":"फेरीवाला प्रकार (स्थिर/फिरता)","fieldLabelEnglish":"Vendor Type (Stationary/Mobile)","fieldType":"text","isMandatory":true},{"fieldKey":"VendingZone","fieldLabelMarathi":"मंजूर फेरीवाला क्षेत्र / झोन","fieldLabelEnglish":"Approved Vending Zone","fieldType":"text","isMandatory":false},{"fieldKey":"ValidityPeriod","fieldLabelMarathi":"वैधता मुदत","fieldLabelEnglish":"Validity Period","fieldType":"text","isMandatory":true},{"fieldKey":"ChallanNo","fieldLabelMarathi":"शुल्क पावती क्र.","fieldLabelEnglish":"Challan No","fieldType":"text","isMandatory":false}]', NULL, 1, NULL, '2026-08-26T16:36:33.087', NULL, '2026-08-28T13:47:17.447', 0, NULL)
) AS source ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [DesignJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
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
        target.[DesignJson] = source.[DesignJson],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[MarkedForDeletion] = source.[MarkedForDeletion],
        target.[MarkedForDeletionDate] = source.[MarkedForDeletionDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [TemplateName], [TemplateCode], [HeaderContent], [BodyContent], [FooterContent], [DefaultConditionsJson], [OfficerFieldsConfigJson], [DesignJson], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [MarkedForDeletion], [MarkedForDeletionDate])
    VALUES (source.[Id], source.[ServiceId], source.[TemplateName], source.[TemplateCode], source.[HeaderContent], source.[BodyContent], source.[FooterContent], source.[DefaultConditionsJson], source.[OfficerFieldsConfigJson], source.[DesignJson], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate], source.[MarkedForDeletion], source.[MarkedForDeletionDate]);
GO
SET IDENTITY_INSERT [RTS].[ServiceCertificateMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[PaymentModeMaster] (9 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] ON;
GO
MERGE INTO [RTS].[PaymentModeMaster] AS target
USING (VALUES
    
    (1, N'UPI', N'UPI / QR Code', N'युपीआय / क्यूआर कोड', N'QrCode', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (2, N'NETBANKING', N'Internet Banking', N'नेट बँकिंग', N'Building', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (3, N'CREDIT_CARD', N'Credit Card', N'क्रेडिट कार्ड', N'CreditCard', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (4, N'DEBIT_CARD', N'Debit Card', N'डेबिट कार्ड', N'CreditCard', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (5, N'WALLET', N'Digital Wallet', N'डिजिटल वॉलेट', N'Wallet', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (6, N'OFFLINE_CHALLAN', N'Offline Challan', N'ऑफलाइन चलन', N'FileText', 1, '2026-08-17T15:10:23.990', NULL, NULL, NULL),
    (7, N'CASH', N'Cash (???)', N'रोख', N'Banknote', 1, '2026-08-19T16:55:31.167', NULL, NULL, NULL),
    (8, N'CHEQUE', N'Cheque (??????)', N'धनादेश', N'FileText', 1, '2026-08-23T19:38:42.020', NULL, NULL, NULL),
    (1008, N'DD', N'Demand Draft (????)', N'डिमांड ड्राफ्ट', N'FileText', 1, '2026-09-07T17:27:27.380', NULL, NULL, NULL)
) AS source ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ModeCode] = source.[ModeCode],
        target.[ModeNameEn] = source.[ModeNameEn],
        target.[ModeNameMr] = source.[ModeNameMr],
        target.[IconName] = source.[IconName],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ModeCode], [ModeNameEn], [ModeNameMr], [IconName], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ModeCode], source.[ModeNameEn], source.[ModeNameMr], source.[IconName], source.[IsActive], source.[CreatedDate], source.[CreatedBy], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [RTS].[PaymentModeMaster] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[PaymentStatusMaster] (9 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[PaymentStatusMaster] ON;
GO
MERGE INTO [RTS].[PaymentStatusMaster] AS target
USING (VALUES
    (1, N'INITIATED', N'Initiated', N'सुरू केले', N'bg-amber-50 text-amber-700', 1, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (2, N'PENDING', N'Pending', N'प्रलंबित', N'bg-yellow-50 text-yellow-800', 2, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (3, N'SUCCESS', N'Success', N'यशस्वी', N'bg-emerald-50 text-emerald-700', 3, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (4, N'FAILED', N'Failed', N'अयशस्वी', N'bg-rose-50 text-rose-700', 4, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (5, N'REFUNDED', N'Refunded', N'परतावा केला', N'bg-purple-50 text-purple-700', 5, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (6, N'EXPIRED', N'Expired', N'कालबाह्य', N'bg-slate-50 text-slate-700', 6, 1, '2026-08-17T15:10:23.983', NULL, NULL, NULL),
    (7, N'PENDING_CLEARANCE', N'Pending Clearance', N'मंजुरी प्रलंबित', N'bg-amber-50 text-amber-700', 7, 1, '2026-10-11T17:30:00.000', NULL, NULL, NULL),
    (8, N'BOUNCED', N'Cheque / DD Bounced', N'धनादेश परत / बाउन्स', N'bg-rose-50 text-rose-700', 8, 1, '2026-10-11T17:30:00.000', NULL, NULL, NULL),
    (9, N'CANCELLED', N'Receipt Cancelled', N'पावती रद्द', N'bg-gray-100 text-gray-700', 9, 1, '2026-10-11T17:30:00.000', NULL, NULL, NULL)
) AS source ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[StatusCode] = source.[StatusCode],
        target.[StatusNameEn] = source.[StatusNameEn],
        target.[StatusNameMr] = source.[StatusNameMr],
        target.[BadgeColor] = source.[BadgeColor],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [StatusCode], [StatusNameEn], [StatusNameMr], [BadgeColor], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[StatusCode], source.[StatusNameEn], source.[StatusNameMr], source.[BadgeColor], source.[DisplayOrder], source.[IsActive], source.[CreatedDate], source.[CreatedBy], source.[UpdatedBy], source.[UpdatedDate]);
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
    (1, N'RAZORPAY', N'Razorpay Smart Gateway', NULL, N'rzp_test_SZLId8MmrfQwTX', N'd1TPunImUMBxcPDStAGUnOdj', N'd1TPunImUMBxcPDStAGUnOdj', N'https://api.razorpay.com/v1/checkout/embedded', N'INR', 1, 0, '2026-08-17T15:10:24', NULL, NULL, NULL)
) AS source ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsDefault], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
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
        target.[IsDefault] = source.[IsDefault],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[UpdatedBy] = source.[UpdatedBy]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [GatewayCode], [GatewayName], [MerchantId], [KeyId], [SecretKey], [WebhookSecret], [ServiceUrl], [Currency], [IsDefault], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
    VALUES (source.[Id], source.[GatewayCode], source.[GatewayName], source.[MerchantId], source.[KeyId], source.[SecretKey], source.[WebhookSecret], source.[ServiceUrl], source.[Currency], source.[IsDefault], source.[IsActive], source.[CreatedDate], source.[CreatedBy], source.[UpdatedDate], source.[UpdatedBy]);
GO
SET IDENTITY_INSERT [RTS].[PaymentGatewayConfig] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[ServiceOfficerAllocation] (161 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[ServiceOfficerAllocation] ON;
GO
MERGE INTO [RTS].[ServiceOfficerAllocation] AS target
USING (VALUES
    (1370, 19, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1374, 20, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1378, 26, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1382, 33, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1383, 33, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1384, 33, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1385, 33, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1386, 36, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1387, 36, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1388, 36, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1389, 36, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1390, 43, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1394, 44, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1398, 45, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1402, 46, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1406, 47, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1410, 48, 1, N'Zone A', N'झोन अ', N'Chetan Shankarpure', N'चेतन शंकरपुरे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'9673222213', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1414, 49, 1, N'Zone A', N'झोन अ', N'Satish Rathod', N'सतिश राठोड', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7350577080', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1415, 49, 2, N'Zone B', N'झोन ब', N'Manish Khatri', N'मनिष खत्री', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588757988', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1416, 49, 3, N'Zone C', N'झोन क', N'Swapnil Lahange', N'स्वप्निल लहांगे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'8329158110', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1417, 49, 4, N'Zone D', N'झोन ड', N'Hrishikesh Thakare', N'ऋषिकेश ठाकरे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588759824', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1418, 50, 1, N'Zone A', N'झोन अ', N'Satish Rathod', N'सतिश राठोड', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7350577080', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1419, 50, 2, N'Zone B', N'झोन ब', N'Manish Khatri', N'मनिष खत्री', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588757988', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1420, 50, 3, N'Zone C', N'झोन क', N'Swapnil Lahange', N'स्वप्निल लहांगे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'8329158110', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1421, 50, 4, N'Zone D', N'झोन ड', N'Hrishikesh Thakare', N'ऋषिकेश ठाकरे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588759824', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1422, 53, 1, N'Zone A', N'झोन अ', N'Kailash Thakur', N'कैलाश ठाकुर', N'Clerk', N'लिपिक', N'7709409303', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1426, 54, 1, N'Zone A', N'झोन अ', N'Akansha S. Hiwale', N'आकांशा हिवाळे', N'Clerk', N'लिपिक', N'9975130814', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1430, 55, 1, N'Zone A', N'झोन अ', N'Sanjay Kharate', N'संजय खराटे', N'Clerk', N'लिपिक', N'7709043333', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1434, 56, 1, N'Zone A', N'झोन अ', N'Sanjay Kharate', N'संजय खराटे', N'Clerk', N'लिपिक', N'7709043333', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1438, 57, 1, N'Zone A', N'झोन अ', N'Sanjay Kharate', N'संजय खराटे', N'Clerk', N'लिपिक', N'7709043333', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1442, 58, 1, N'Zone A', N'झोन अ', N'Dr. Anup Choudhary', N'डॉ. अनुप चौधरी', N'Deputy Medical Officer of Health', N'उप आरोग्य वेद्यकीय अधिकारी', N'7721818117', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1446, 59, 1, N'Zone A', N'झोन अ', N'Dr. Anup Choudhary', N'डॉ. अनुप चौधरी', N'Deputy Medical Officer of Health', N'उप आरोग्य वेद्यकीय अधिकारी', N'7721818117', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1450, 60, 1, N'Zone A', N'झोन अ', N'Dr. Anup Choudhary', N'डॉ. अनुप चौधरी', N'Deputy Medical Officer of Health', N'उप आरोग्य वेद्यकीय अधिकारी', N'7721818117', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1454, 61, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1458, 62, 1, N'Zone A', N'झोन अ', N'Pradip Gawande', N'प्रदिप गावंडे', N'Clerk', N'लिपिक', N'9850322977', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1462, 63, 1, N'Zone A', N'झोन अ', N'Manish Kathale', N'मनिष कठाळे', N'CLerk', N'लिपिक', N'9511885766', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1466, 64, 1, N'Zone A', N'झोन अ', N'Manish Kathale', N'मनिष कठाळे', N'CLerk', N'लिपिक', N'9511885766', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1470, 65, 1, N'Zone A', N'झोन अ', N'Lata P. Ghime', N'लता घिमे', N'Clerk', N'लिपिक', N'8080685518', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1474, 66, 1, N'Zone A', N'झोन अ', N'Sonali Surwade', N'सोनाली सुरवाडे', N'Clerk', N'लिपिक', N'9766859941', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1475, 66, 2, N'Zone B', N'झोन ब', N'Jayant Sule', N'जयंत सुळे', N'Clerk', N'लिपिक', N'7887309831', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1476, 66, 3, N'Zone C', N'झोन क', N'Hemant Shelwane', N'हेमंत शेलवणे', N'Clerk', N'लिपिक', N'7709043156', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1477, 66, 4, N'Zone D', N'झोन ड', N'Kamalkishor Yadav', N'कमलकिशोर यादव', N'Clerk', N'लिपिक', N'9763861654', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1478, 68, 1, N'Zone A', N'झोन अ', N'Prashant Rajurkar', N'प्रशांत राजुरकर', N'Head of Department', N'विभाग प्रमुख', N'8329184285', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1482, 69, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1486, 80, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1490, 81, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1494, 82, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1498, 83, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1502, 84, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1506, 85, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1510, 86, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1514, 87, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1518, 100, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1522, 101, 1, N'Zone A', N'झोन अ', N'Abhishek Gai', N'अभिषेक गाई', N'Officer', N'अधिकारी', N'8830913060', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1526, 137, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1527, 137, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1528, 137, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1529, 137, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1530, 138, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1531, 138, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1532, 138, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1533, 138, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1534, 139, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1535, 139, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1536, 139, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1537, 139, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1538, 140, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1539, 140, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1540, 140, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1541, 140, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1542, 141, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1543, 141, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1544, 141, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1545, 141, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1546, 142, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1547, 142, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1548, 142, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1549, 142, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1550, 143, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1551, 143, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1552, 143, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1553, 143, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1554, 144, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1555, 144, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1556, 144, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1557, 144, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1558, 145, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1559, 145, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1560, 145, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1561, 145, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1562, 146, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1563, 146, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1564, 146, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1565, 146, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1566, 147, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1567, 147, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1568, 147, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1569, 147, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1570, 148, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1571, 148, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1572, 148, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1573, 148, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1574, 149, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1575, 149, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1576, 149, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1577, 149, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1578, 150, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1579, 150, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1580, 150, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1581, 150, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1582, 151, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1583, 151, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1584, 151, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1585, 151, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1586, 152, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1587, 152, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1588, 152, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1589, 152, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1590, 153, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1591, 153, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1592, 153, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1593, 153, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1594, 154, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1595, 154, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1596, 154, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1597, 154, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1598, 155, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1599, 155, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1600, 155, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1601, 155, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1602, 156, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1603, 156, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1604, 156, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1605, 156, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1606, 157, 1, N'Zone A', N'झोन अ', N'Sudhir Misurkar', N'सुधीर मिसुरकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9850318838', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1607, 157, 2, N'Zone B', N'झोन ब', N'Ajay Shirsat', N'अजय शिरसाट', N'In-charge Assistant Tax Superintendent', N'प्र. सहा. कर अधीक्षक', N'8888738991', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1608, 157, 3, N'Zone C', N'झोन क', N'Pankaj Joglekar', N'पंकज जोगळेकर', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'7709043399', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1609, 157, 4, N'Zone D', N'झोन ड', N'Prashant Bole', N'प्रशांत बोळे', N'Assistant Tax Superintendent', N'सहा. कर अधीक्षक', N'9011432125', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1610, 158, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1611, 158, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1612, 158, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1613, 158, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1614, 159, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1615, 159, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1616, 159, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1617, 159, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1618, 160, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1619, 160, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1620, 160, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1621, 160, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1622, 161, 1, N'Zone A', N'झोन अ', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1623, 161, 2, N'Zone B', N'झोन ब', N'Gaurav Shrivas', N'गौरव श्रीवास', N'Officer', N'अधिकारी', N'8149260111', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1624, 161, 3, N'Zone C', N'झोन क', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1625, 161, 4, N'Zone D', N'झोन ड', N'Surendra Jadhav', N'सुरेंद्र जाधव', N'Officer', N'अधिकारी', N'7218743145', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1626, 162, 1, N'Zone A', N'झोन अ', N'Pramod Gaikwad', N'प्रमोद गायकवाड', N'Clerk', N'लिपिक', N'9421894208', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-09-09T15:45:35.310', 1, NULL, NULL),
    (1627, 51, 1, N'Zone A', N'झोन अ', N'Satish Rathod', N'सतिश राठोड', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7350577080', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-10-02T14:43:33.363', 1, NULL, NULL),
    (1628, 166, 1, N'Zone A', N'झोन अ', N'Dr. Anup Choudhary', N'डॉ. अनुप चौधरी', N'Deputy Medical Officer of Health', N'उप आरोग्य वेद्यकीय अधिकारी', N'7721818117', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-10-02T14:47:15.723', 1, NULL, NULL),
    (1629, 167, 1, N'Zone A', N'झोन अ', N'Dr. Anup Choudhary', N'डॉ. अनुप चौधरी', N'Deputy Medical Officer of Health', N'उप आरोग्य वेद्यकीय अधिकारी', N'7721818117', NULL, NULL, NULL, N'ZONE_OFFICER', 1, 1, '2026-10-02T14:47:29.383', 1, NULL, NULL),
    (1630, 51, 2, N'Zone B', N'झोन ब', N'Manish Khatri', N'मनिष खत्री', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588757988', NULL, NULL, NULL, N'ZONE_OFFICER', 2, 1, '2026-10-02T14:50:38.990', 1, NULL, NULL),
    (1631, 51, 3, N'Zone D', N'झोन ड', N'Hrishikesh Thakare', N'ऋषिकेश ठाकरे', N'Junior Engineer', N'कनिष्ठ अभियंता', N'7588759824', NULL, NULL, NULL, N'ZONE_OFFICER', 3, 1, '2026-10-02T14:52:04.887', 1, NULL, NULL),
    (1632, 51, 4, N'Zone D', N'झोन ड', N'Satish Rathod', N'सतिश राठोड', N'Satish Rathod', N'कनिष्ठ अभियंता', N'7350577080', NULL, NULL, NULL, N'ZONE_OFFICER', 4, 1, '2026-10-02T14:53:39.240', 1, NULL, NULL)
) AS source ([Id], [ServiceId], [ZoneId], [ZoneName], [ZoneNameLocal], [OfficerName], [OfficerNameLocal], [Designation], [DesignationLocal], [MobileNo], [Email], [OfficeAddress], [OfficeAddressLocal], [OfficerRole], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[ZoneId] = source.[ZoneId],
        target.[ZoneName] = source.[ZoneName],
        target.[ZoneNameLocal] = source.[ZoneNameLocal],
        target.[OfficerName] = source.[OfficerName],
        target.[OfficerNameLocal] = source.[OfficerNameLocal],
        target.[Designation] = source.[Designation],
        target.[DesignationLocal] = source.[DesignationLocal],
        target.[MobileNo] = source.[MobileNo],
        target.[Email] = source.[Email],
        target.[OfficeAddress] = source.[OfficeAddress],
        target.[OfficeAddressLocal] = source.[OfficeAddressLocal],
        target.[OfficerRole] = source.[OfficerRole],
        target.[DisplayOrder] = source.[DisplayOrder],
        target.[IsActive] = source.[IsActive],
        target.[CreatedDate] = source.[CreatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[UpdatedBy] = source.[UpdatedBy]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [ZoneId], [ZoneName], [ZoneNameLocal], [OfficerName], [OfficerNameLocal], [Designation], [DesignationLocal], [MobileNo], [Email], [OfficeAddress], [OfficeAddressLocal], [OfficerRole], [DisplayOrder], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy])
    VALUES (source.[Id], source.[ServiceId], source.[ZoneId], source.[ZoneName], source.[ZoneNameLocal], source.[OfficerName], source.[OfficerNameLocal], source.[Designation], source.[DesignationLocal], source.[MobileNo], source.[Email], source.[OfficeAddress], source.[OfficeAddressLocal], source.[OfficerRole], source.[DisplayOrder], source.[IsActive], source.[CreatedDate], source.[CreatedBy], source.[UpdatedDate], source.[UpdatedBy]);
GO
SET IDENTITY_INSERT [RTS].[ServiceOfficerAllocation] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[AapleSarkarConfiguration] (1 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AapleSarkarConfiguration] ON;
GO
MERGE INTO [RTS].[AapleSarkarConfiguration] AS target
USING (VALUES
    (1, 1, 2, 501, N'AKMCDEPT', N'GAKMCA8v4G8F', N'@pn@AKM@m@h@0nl!ne@30446', N'AKM@02@4', N'http://testcitizenservices.mahaitgov.in/Dept_Authentication.asmx', N'http://localhost:3000', N'http://localhost:3000/mr/service/aaple-sarkar-dashboard', N'https://rtsdashboarddeptapi.mahaitgov.in/api/Token/GetToken', N'https://rtsdashboarddeptapi.mahaitgov.in/api/Dashboard/PushDepartmentDetails', N'4332093E-07D9-4765-AA1E-4C6A640ACF94', N'AKMCDEPT', 6, 520, 4173, 1, 6, 0, 0, '2026-09-28T18:06:01', NULL, NULL, NULL, 1)
) AS source ([Id], [IntegrationId], [UlbId], [UlbDistrict], [ClientCode], [ChecksumKey], [EncryptionKey], [EncryptionIV], [ServiceUrl], [PortalBaseUrl], [DashboardUrl], [MahaITTokenUrl], [MahaITPushUrl], [MahaITClientSecretKey], [MahaITDepartmentCode], [Division], [District], [Taluka], [DailyPushEnabled], [MorningPushHour], [MorningPushMinute], [RunOnStartup], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsActive])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[IntegrationId] = source.[IntegrationId],
        target.[UlbId] = source.[UlbId],
        target.[UlbDistrict] = source.[UlbDistrict],
        target.[ClientCode] = source.[ClientCode],
        target.[ChecksumKey] = source.[ChecksumKey],
        target.[EncryptionKey] = source.[EncryptionKey],
        target.[EncryptionIV] = source.[EncryptionIV],
        target.[ServiceUrl] = source.[ServiceUrl],
        target.[PortalBaseUrl] = source.[PortalBaseUrl],
        target.[DashboardUrl] = source.[DashboardUrl],
        target.[MahaITTokenUrl] = source.[MahaITTokenUrl],
        target.[MahaITPushUrl] = source.[MahaITPushUrl],
        target.[MahaITClientSecretKey] = source.[MahaITClientSecretKey],
        target.[MahaITDepartmentCode] = source.[MahaITDepartmentCode],
        target.[Division] = source.[Division],
        target.[District] = source.[District],
        target.[Taluka] = source.[Taluka],
        target.[DailyPushEnabled] = source.[DailyPushEnabled],
        target.[MorningPushHour] = source.[MorningPushHour],
        target.[MorningPushMinute] = source.[MorningPushMinute],
        target.[RunOnStartup] = source.[RunOnStartup],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedDate] = source.[UpdatedDate],
        target.[CreatedBy] = source.[CreatedBy],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[IsActive] = source.[IsActive]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [IntegrationId], [UlbId], [UlbDistrict], [ClientCode], [ChecksumKey], [EncryptionKey], [EncryptionIV], [ServiceUrl], [PortalBaseUrl], [DashboardUrl], [MahaITTokenUrl], [MahaITPushUrl], [MahaITClientSecretKey], [MahaITDepartmentCode], [Division], [District], [Taluka], [DailyPushEnabled], [MorningPushHour], [MorningPushMinute], [RunOnStartup], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsActive])
    VALUES (source.[Id], source.[IntegrationId], source.[UlbId], source.[UlbDistrict], source.[ClientCode], source.[ChecksumKey], source.[EncryptionKey], source.[EncryptionIV], source.[ServiceUrl], source.[PortalBaseUrl], source.[DashboardUrl], source.[MahaITTokenUrl], source.[MahaITPushUrl], source.[MahaITClientSecretKey], source.[MahaITDepartmentCode], source.[Division], source.[District], source.[Taluka], source.[DailyPushEnabled], source.[MorningPushHour], source.[MorningPushMinute], source.[RunOnStartup], source.[CreatedDate], source.[UpdatedDate], source.[CreatedBy], source.[UpdatedBy], source.[IsActive]);
GO
SET IDENTITY_INSERT [RTS].[AapleSarkarConfiguration] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[AapleSarkarServiceMapping] (60 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[AapleSarkarServiceMapping] ON;
GO
MERGE INTO [RTS].[AapleSarkarServiceMapping] AS target
USING (VALUES
    
    (1, 19, 7165, N'Change of Water Connection Usage Type', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (2, 20, 7166, N'Preparation of Water Bill', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (3, 26, 7172, N'Complaint Regarding Water Pressure Capacity', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (4, 33, 7195, N'Changing Occupations / Business Type', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (5, 36, 7198, N'Cancellation of License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (6, 43, 7207, N'Issuance of Zone Certificate', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (7, 44, 7208, N'Giving Part Map', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (8, 49, 63, N'Filling Potholes on City Roads', 5, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (9, 50, 64, N'Maintaining & Securing Sewer Covers', 5, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (10, 51, 66, N'Road Cutting Permission', 5, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (11, 61, 7200, N'Trade / Business / Storage Non-Revocation NOC', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (12, 62, 7201, N'Mandap NOC', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (13, 63, 7202, N'Issuance of Fire Safety NOC', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (14, 64, 7203, N'Issuance of Final Fire Exemption Certificate', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (15, 65, 7206, N'Marriage Registration Certificate', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (16, 66, 8276, N'Tree Felling Permission', 45, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (17, 68, 65, N'Maintaining cleanliness', 1, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (18, 69, 7175, N'Providing drainage connections', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (19, 80, 7174, N'Provision of New Water Tap Connection', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (20, 81, 7162, N'Changing the Water Connection Size', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (21, 82, 7163, N'Temporary / Permanent Disconnection of Water Connection', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (22, 83, 7164, N'Reconnection of Water Tap', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (23, 84, 7169, N'Water Bill No Dues Certificate', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (24, 85, 7170, N'Complaint Regarding Faulty Water Meter', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (25, 86, 7171, N'Complaint Regarding Unauthorized Water Tap Connection', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (26, 87, 7173, N'Complaint Regarding Water Quality', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (27, 100, 7167, N'Issuance of Plumber License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (28, 101, 7168, N'Renewal of Plumber License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (29, 137, 7190, N'Obtaining New Trade License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (30, 138, 7191, N'Renewal of Trade License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (31, 139, 7192, N'Transfer of Trade License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (32, 140, 7193, N'Duplicate Copy of Trade License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (33, 141, 7194, N'Change of Business Name / Establishment / Address', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (34, 142, 7196, N'Change of License Holder / Partner Name', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (35, 143, 7197, N'Change in Number of Partners (Increase/Decrease)', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (36, 144, 7199, N'Notice on Renewal of Expired License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (37, 145, 7176, N'New Property Tax Assessment', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (38, 146, 7177, N'Re-Assessment of Property Tax', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (39, 147, 7178, N'Preparation of Tax Demand Notice', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (40, 148, 7179, N'Avail Property Tax Exemption', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (41, 149, 7180, N'Tax Exemption for Non-Resident Properties', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (42, 150, 7181, N'Property Tax Self-Assessment', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (43, 151, 7182, N'Registration of Objection on Tax Assessment', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (44, 152, 7183, N'Sub-division of Property', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (45, 153, 7184, N'Re-assessment After Demolition and Reconstruction', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (46, 154, 7185, N'Issuance of Property Tax Assessment Copy (8A)', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (47, 155, 7186, N'Issuance of No Dues Certificate', 3, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (48, 156, 7187, N'Property Transfer Registration Certificate', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (49, 157, 7189, N'Change of Ownership Name', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (50, 158, 8266, N'Issuance of Lodging House License', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (51, 159, 8267, N'Renewal of Lodging House License', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (52, 160, 8268, N'Issuance of Marriage Hall / Auditorium License', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (53, 161, 8269, N'Renewal of Marriage Hall / Auditorium License', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (54, 162, 8278, N'Issuance of Hawker Registration Certificate', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (55, 163, 7188, N'Water Non-Availability Certificate', 7, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (56, 164, 7189, N'Auto-renewal of Trade License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (57, 165, 7190, N'Advertisement / Signage License', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (58, 166, 7191, N'Food Business License NOC', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (59, 167, 7192, N'Food Registration Health NOC', 30, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1),
    (60, 170, 7188, N'Property Transfer Registration Certificate - Inheritance', 15, '2026-10-03T12:20:25.233', NULL, NULL, NULL, 1)
) AS source ([Id], [RtsServiceId], [MahaITServiceId], [GovtServiceName], [MaxProcessingDays], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsActive])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[RtsServiceId] = source.[RtsServiceId],
        target.[MahaITServiceId] = source.[MahaITServiceId],
        target.[GovtServiceName] = source.[GovtServiceName],
        target.[MaxProcessingDays] = source.[MaxProcessingDays],
        target.[IsActive] = source.[IsActive]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [RtsServiceId], [MahaITServiceId], [GovtServiceName], [MaxProcessingDays], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [IsActive])
    VALUES (source.[Id], source.[RtsServiceId], source.[MahaITServiceId], source.[GovtServiceName], source.[MaxProcessingDays], source.[CreatedDate], source.[UpdatedDate], source.[CreatedBy], source.[UpdatedBy], source.[IsActive]);
GO
SET IDENTITY_INSERT [RTS].[AapleSarkarServiceMapping] OFF;
GO
/* ----------------------------------------------------------------------------
   Table: [RTS].[RuleMaster] (10 rows)
   ---------------------------------------------------------------------------- */
SET IDENTITY_INSERT [RTS].[RuleMaster] ON;
GO
MERGE INTO [RTS].[RuleMaster] AS target
USING (VALUES
    (1, 62, N'Mandap NOC - Public Footpath type', NULL, NULL, NULL, NULL, N'ALL', N'FIXED', NULL, N'BASE_FEE', 1200.00, NULL, 1, N'FEE', NULL, 0, 1, 1002, '2026-10-11T14:06:00', NULL, NULL),
    (4, 62, N'Mandap NOC - Marriage Event Fee', N'eventType', 8289, N'=', N'marriage', NULL, NULL, NULL, N'BASE_FEE', 1200.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', 1002, '2026-10-05T20:12:11.314'),
    (5, 62, N'Mandap NOC - Festival Event Fee', N'eventType', 8289, N'=', N'festival', NULL, NULL, NULL, N'BASE_FEE', 1800.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', 1, '2026-10-02T13:51:34.238'),
    (6, 62, N'Mandap NOC - Cultural Program Fee', N'eventType', 8289, N'=', N'cultural', NULL, NULL, NULL, N'BASE_FEE', 2200.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', 1, '2026-10-02T13:51:34.262'),
    (7, 62, N'Mandap NOC - Political Rally Fee', N'eventType', 8289, N'=', N'political', NULL, NULL, NULL, N'BASE_FEE', 2500.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', NULL, NULL),
    (8, 62, N'Mandap NOC - Exhibition Fee', N'eventType', 8289, N'=', N'exhibition', NULL, NULL, NULL, N'BASE_FEE', 3000.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', NULL, NULL),
    (9, 62, N'Mandap NOC - Commercial Event Fee', N'eventType', 8289, N'=', N'commercial', NULL, NULL, NULL, N'BASE_FEE', 5000.00, NULL, 1, N'FEE', NULL, 0, 1, 1, '2026-10-01T19:11:35.492', NULL, NULL),
    (2002, 44, N'Giving Part Map - City Development Map (DP)', N'partMapType', 327, N'=', N'dp', NULL, NULL, NULL, N'STAGE_ALLOCATION', NULL, 1, 1, N'USER_ALLOCATION', N'{"approvalFlowStageId":1078,"stageOrder":1}', 0, 1, 1002, '2026-10-08T17:01:35.734', NULL, NULL),
    (2003, 44, N'Giving Part Map - TP Scheme Map (TPS)', N'partMapType', 327, N'=', N'tps', NULL, NULL, NULL, N'STAGE_ALLOCATION', NULL, 5, 1, N'USER_ALLOCATION', N'{"approvalFlowStageId":1078,"stageOrder":1}', 0, 1, 1002, '2026-10-08T17:03:28.332', NULL, NULL),
    (2004, 62, N'Mandap NOC', N'landOwnershipType', 8292, N'=', N'publicFootpath', NULL, NULL, NULL, N'ADDON_FEE', 100.00, NULL, 1, N'FEE', NULL, 0, 1, 1002, '2026-10-08T21:09:57.866', NULL, NULL)
) AS source ([Id], [ServiceId], [RuleDescription], [ConditionField], [ConditionFieldDefinitionId], [ComparisonOperator], [ExpectedValue], [ConditionMatchType], [CalculationType], [QuantityFieldDefinitionId], [RuleActionType], [RateAmount], [UserId], [Priority], [RuleGroup], [ActionValue], [IsCumulative], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
ON (target.[Id] = source.[Id])
WHEN MATCHED THEN
    UPDATE SET
        target.[ServiceId] = source.[ServiceId],
        target.[RuleDescription] = source.[RuleDescription],
        target.[ConditionField] = source.[ConditionField],
        target.[ConditionFieldDefinitionId] = source.[ConditionFieldDefinitionId],
        target.[ComparisonOperator] = source.[ComparisonOperator],
        target.[ExpectedValue] = source.[ExpectedValue],
        target.[ConditionMatchType] = source.[ConditionMatchType],
        target.[CalculationType] = source.[CalculationType],
        target.[QuantityFieldDefinitionId] = source.[QuantityFieldDefinitionId],
        target.[RuleActionType] = source.[RuleActionType],
        target.[RateAmount] = source.[RateAmount],
        target.[UserId] = source.[UserId],
        target.[Priority] = source.[Priority],
        target.[RuleGroup] = source.[RuleGroup],
        target.[ActionValue] = source.[ActionValue],
        target.[IsCumulative] = source.[IsCumulative],
        target.[IsActive] = source.[IsActive],
        target.[CreatedBy] = source.[CreatedBy],
        target.[CreatedDate] = source.[CreatedDate],
        target.[UpdatedBy] = source.[UpdatedBy],
        target.[UpdatedDate] = source.[UpdatedDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Id], [ServiceId], [RuleDescription], [ConditionField], [ConditionFieldDefinitionId], [ComparisonOperator], [ExpectedValue], [ConditionMatchType], [CalculationType], [QuantityFieldDefinitionId], [RuleActionType], [RateAmount], [UserId], [Priority], [RuleGroup], [ActionValue], [IsCumulative], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate])
    VALUES (source.[Id], source.[ServiceId], source.[RuleDescription], source.[ConditionField], source.[ConditionFieldDefinitionId], source.[ComparisonOperator], source.[ExpectedValue], source.[ConditionMatchType], source.[CalculationType], source.[QuantityFieldDefinitionId], source.[RuleActionType], source.[RateAmount], source.[UserId], source.[Priority], source.[RuleGroup], source.[ActionValue], source.[IsCumulative], source.[IsActive], source.[CreatedBy], source.[CreatedDate], source.[UpdatedBy], source.[UpdatedDate]);
GO
SET IDENTITY_INSERT [RTS].[RuleMaster] OFF;
GO
