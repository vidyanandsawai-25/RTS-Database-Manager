SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =========================================================
-- RTS DepartmentMaster Seed Data
-- =========================================================
;WITH SeedDepartments AS (
    SELECT * FROM (VALUES
        (N'Property Tax',          N'मालमत्ता कर',                         N'Home',           1),
        (N'Water Connection',      N'पाणी पुरवठा',                         N'Droplets',       2),
        (N'Trade License',         N'व्यवसाय परवाना',                       N'Briefcase',      3),
        (N'Town Planning',         N'नगर रचना',                             N'Map',            4),
        (N'Birth & Death',         N'जन्म आणि मृत्यू',                      N'HeartPulse',     5),
        (N'Education',             N'शिक्षण',                               N'GraduationCap',  6),
        (N'Health',                N'आरोग्य',                               N'Activity',       7),
        (N'NOC',                   N'ना हरकत प्रमाणपत्र (NOC)',             N'ShieldCheck',    8),
        (N'Marriage Certificate',  N'लग्न नोंदणी प्रमाणपत्र',              N'Heart',          9),
        (N'Tree',                  N'वृक्ष प्राधिकरण',                      N'TreePine',       10),
        (N'Sanitation',            N'स्वच्छता विभाग',                       N'Trash2',         11)
    ) AS V (DepartmentName, DepartmentNameLocal, DepartmentIcon, DisplayOrder)
)
INSERT INTO [RTS].[DepartmentMaster] ([DepartmentName], [DepartmentNameLocal], [DepartmentIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate])
SELECT S.DepartmentName, S.DepartmentNameLocal, S.DepartmentIcon, S.DisplayOrder, 1, 0, GETDATE()
FROM SeedDepartments S
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[DepartmentMaster] D WHERE D.DepartmentName = S.DepartmentName
);
GO

-- =========================================================
-- RTS ServiceMaster Seed Data
-- =========================================================  
;WITH SeedServices AS (
    SELECT * FROM (VALUES
        -- Birth & Death (dept order 5)
        (N'Birth & Death', 7204, N'Birth Certificate',                          N'जन्माचा दाखला',                               NULL, N'Baby',          1),
        (N'Birth & Death', 7205, N'Death Certificate',                          N'मृत्यूचा दाखला',                              NULL, N'HeartOff',       2),
        -- Education (dept order 6)
        (N'Education',     8273, N'School Leaving / Duplicate Certificate',     N'शाळा सोडल्याचे / दुय्यम प्रमाणपत्र',         NULL, N'FileText',       1),
        -- Health (dept order 7)
        (N'Health',        8270, N'New Nursing Home License',                   N'नवीन नर्सिंग होम परवाना',                     NULL, N'PlusSquare',     1),
        (N'Health',        8271, N'Renew Nursing Home License',                 N'नर्सिंग होम परवाना नूतनीकरण',                 NULL, N'PlusSquare',     2),
        (N'Health',        8272, N'Update Licensee / Partner Name',             N'परवानाधारक / भागीदार नाव अद्ययावत करणे',     NULL, N'UserPlus',       3),
        -- Marriage Certificate (dept order 9)
        (N'Marriage Certificate', 7121, N'Marriage Registration Certificate',   N'विवाह नोंदणी प्रमाणपत्र',                     NULL, N'Heart',          1),
        -- NOC (dept order 8)
        (N'NOC',           7200, N'Trade / Business Non-Revocation NOC',        N'व्यवसाय / व्यापार ना-हरकत प्रमाणपत्र',       NULL, N'ShieldCheck',    1),
        (N'NOC',           7201, N'Mandap No-Damage Certificate',               N'मंडप नुकसान न केल्याचे प्रमाणपत्र',          NULL, N'Building2',      2),
        (N'NOC',           7202, N'Fire Extinguisher Certificate',              N'अग्निशामक परवाना',                            NULL, N'Flame',          3),
        (N'NOC',           7203, N'Final Fire Exemption Certificate',           N'अंतिम अग्निशामक सूट प्रमाणपत्र',             NULL, N'Flame',          4),
        -- Property Tax (dept order 1)
        (N'Property Tax',  7176, N'New Taxation',                               N'नवीन कर आकारणी',                              NULL, N'Home',           1),
        (N'Property Tax',  7177, N'Re-Taxation',                                N'पुनर्कर आकारणी',                              NULL, N'Home',           2),
        (N'Property Tax',  7178, N'Preparation of Tax Demand Letter',           N'कर मागणी पत्र तयार करणे',                     NULL, N'FileText',       3),
        (N'Property Tax',  7271, N'Issuance of Property Tax Assessment Copy',   N'मालमत्ता कर आकारणी उतारा (८ अ) देणे',        NULL, N'FileText',       4),
        (N'Property Tax',  7179, N'Avail Tax Exemption',                        N'कर सवलत मिळवणे',                              NULL, N'Receipt',        5),
        (N'Property Tax',  7180, N'Tax Exemption for Non-Resident Properties',  N'अनिवासी मालमत्तेसाठी कर सवलत',               NULL, N'Receipt',        6),
        (N'Property Tax',  7182, N'Registration of Objection',                  N'हरकत नोंदणी',                                 NULL, N'AlertTriangle',  7),
        (N'Property Tax',  7184, N'Property Demolition',                        N'मालमत्ता पाडणे',                              NULL, N'Hammer',         8),
        (N'Property Tax',  7186, N'No Dues Certificate',                        N'थकबाकी नसल्याचे प्रमाणपत्र (ना-हरकत)',       NULL, N'FileCheck',      9),
        (N'Property Tax',  7187, N'Transfer of Property Certificate',           N'मालमत्ता हस्तांतरण प्रमाणपत्र',               NULL, N'UserCheck',      10),
        -- Town Planning (dept order 4)
        (N'Town Planning', 7207, N'Issuance of Zone Certificate',               N'झोन दाखला देणे',                              NULL, N'Map',            1),
        (N'Town Planning', 7208, N'Giving Part Map',                            N'भाग नकाशा देणे',                              NULL, N'Map',            2),
        (N'Town Planning', 7209, N'Issuance of Construction Permit',            N'बांधकाम परवानगी देणे',                        NULL, N'HardHat',        3),
        (N'Town Planning', 7210, N'Tillage Certificate',                        N'जमीन मोजणी दाखला',                            NULL, N'MapPin',         4),
        (N'Town Planning', 7211, N'Issuance of Occupancy Certificate',          N'भोगवटा प्रमाणपत्र देणे',                      NULL, N'Key',            5),
        (N'Town Planning', 8277, N'Underground OFC Cable Permission',           N'भूमिगत ओएफसी केबल परवानगी',                   NULL, N'Cable',          6),
        (N'Town Planning', 9001, N'Filling Potholes on City Roads',             N'शहरातील रस्त्यांवरील खड्डे भरणे',             NULL, N'Wrench',         7),
        (N'Town Planning', 9002, N'Maintaining & Securing Sewer Covers',        N'गटार झाकणांची देखभाल आणि सुरक्षा',           NULL, N'Shield',         8),
        (N'Town Planning', 9003, N'Road Cutting Permission',                    N'रस्ता खोदाई परवानगी',                         NULL, N'Wrench',         9),
        (N'Town Planning', 8279, N'Mobile Tower Permission',                    N'मोबाईल टॉवर उभारणी परवानगी',                  NULL, N'Radio',          10),
        -- Trade License (dept order 3)
        (N'Trade License', 7190, N'New Trade License',                          N'नवीन व्यवसाय परवाना',                         NULL, N'Briefcase',      1),
        (N'Trade License', 7191, N'Renew License',                              N'परवाना नूतनीकरण',                             NULL, N'Briefcase',      2),
        (N'Trade License', 7192, N'License Transfer',                           N'परवाना हस्तांतरण',                            NULL, N'Briefcase',      3),
        (N'Trade License', 7193, N'Secondary Copy of License',                  N'परवान्याची दुय्यम प्रत देणे',                 NULL, N'Briefcase',      4),
        (N'Trade License', 7194, N'Change of Business Name',                    N'व्यवसायाच्या नावात बदल करणे',                 NULL, N'Briefcase',      5),
        (N'Trade License', 7195, N'Changing Occupations',                       N'व्यवसाय बदल करणे',                            NULL, N'Briefcase',      6),
        (N'Trade License', 7197, N'Change in Number of Partners',               N'भागीदारांच्या संख्येत बदल करणे',              NULL, N'Briefcase',      7),
        (N'Trade License', 7198, N'Cancellation of License',                    N'परवाना रद्द करणे',                            NULL, N'Briefcase',      8),
        (N'Trade License', 7199, N'Auto Renewal Of Trade License',              N'व्यवसाय परवान्याचे स्वयंचलित नूतनीकरण',      NULL, N'Briefcase',      9),
        (N'Trade License', 8266, N'Licensing of Lodging Houses',                N'लॉजिंग हाऊससाठी परवाना देणे',                 NULL, N'Hotel',          10),
        (N'Trade License', 8267, N'Renew Lodging House License',                N'लॉजिंग हाऊस परवाना नूतनीकरण',                 NULL, N'Hotel',          11),
        (N'Trade License', 8268, N'Licensing of Mangal Office / Auditorium',    N'मंगल कार्यालय / सभागृह परवाना',               NULL, N'Building2',      12),
        (N'Trade License', 8269, N'Renew Mangal Office / Hall License',         N'मंगल कार्यालय / सभागृह परवाना नूतनीकरण',     NULL, N'Building2',      13),
        (N'Trade License', 8278, N'Hawker Registration Certificate',            N'फेरीवाला नोंदणी प्रमाणपत्र',                  NULL, N'Store',          14),
        (N'Trade License', 7167, N'Plumbers license',                           N'प्लंबर परवाना देणे',                          NULL, N'Wrench',         15),
        (N'Trade License', 7168, N'Plumber License Renewal',                    N'प्लंबर परवाना नूतनीकरण',                      NULL, N'Wrench',         16),
        (N'Trade License', 7169, N'Trade License Type Change Request',          N'व्यवसाय परवाना प्रकार बदलण्याची विनंती',     NULL, N'Briefcase',      17),
        (N'Trade License', 7601, N'Movie Shooting License New and Renewal',     N'चित्रपट चित्रीकरण परवाना देणे व नूतनीकरण',   NULL, N'Camera',         18),
        -- Tree (dept order 10)
        (N'Tree',          8276, N'Tree Felling Permission (Sec 8)',             N'झाड तोडण्याची परवानगी देणे',                  NULL, N'TreePine',       1),
        -- Sanitation (dept order 11)
        (N'Sanitation',    8255, N'Maintaining Manhole / Sewer Covers',         N'मॅनहोल / गटार झाकणांची दुरुस्ती',             NULL, N'Trash2',         1),
        (N'Sanitation',    7175, N'Providing drainage connections',             N'ड्रेनेज जोडणी देणे',                          NULL, N'Droplet',        2),
        -- Water Connection (dept order 2)
        (N'Water Connection', 7174, N'To provide a connection',                 N'नवीन नळ जोडणी देणे',                          NULL, N'Droplets',       1),
        (N'Water Connection', 7162, N'Changing the connection size',            N'नळ जोडणीचा आकार बदलणे',                       NULL, N'Droplets',       2),
        (N'Water Connection', 7163, N'Temporary / permanent disconnection',     N'तात्पुरती / कायमची नळ जोडणी खंडित करणे',     NULL, N'Droplets',       3),
        (N'Water Connection', 7164, N'To Reconnect',                            N'नळ जोडणी पुन्हा जोडणे',                       NULL, N'Droplets',       4),
        (N'Water Connection', 7155, N'Certificate of no arrears',               N'पाणीपट्टी थकबाकी नसल्याचा दाखला',             NULL, N'FileCheck',      5),
        (N'Water Connection', 7170, N'Reporting faulty meters',                 N'सदोष मीटरबद्दल तक्रार नोंदवणे',               NULL, N'AlertTriangle',  6),
        (N'Water Connection', 7171, N'Reporting unauthorized tap connections',  N'अनधिकृत नळ जोडण्यांबद्दल तक्रार नोंदवणे',   NULL, N'AlertTriangle',  7),
        (N'Water Connection', 7172, N'Water pressure capacity complaint',       N'पाण्याच्या दाबाबाबत तक्रार नोंदवणे',          NULL, N'AlertTriangle',  8),
        (N'Water Connection', 7173, N'Water quality complaint',                 N'पाण्याच्या गुणवत्तेबद्दल तक्रार नोंदवणे',    NULL, N'AlertTriangle',  9)
    ) AS V (DeptName, GovtServiceCode, ServiceName, ServiceNameLocal, ServiceUrl, ServiceIcon, DisplayOrder)
)
INSERT INTO [RTS].[ServiceMaster] ([DepartmentId], [GovtServiceCode], [ServiceName], [ServiceNameLocal], [ServiceUrl], [ServiceIcon], [DisplayOrder], [IsActive], [CreatedBy], [CreatedDate], [Sla], [Fees], [FeesRequired])
SELECT D.Id, S.GovtServiceCode, S.ServiceName, S.ServiceNameLocal, S.ServiceUrl, S.ServiceIcon, S.DisplayOrder, 1, 0, GETDATE(),
    CASE 
        WHEN S.GovtServiceCode = 7204 THEN N'7 Days'
        WHEN S.GovtServiceCode = 7205 THEN N'7 Days'
        WHEN S.GovtServiceCode = 7121 THEN N'15 Days'
        WHEN S.GovtServiceCode = 7176 THEN N'30 Days'
        WHEN S.GovtServiceCode = 7190 THEN N'30 Days'
        WHEN S.GovtServiceCode = 7174 THEN N'15 Days'
        ELSE N'7 Days'
    END,
    CASE 
        WHEN S.GovtServiceCode = 7204 THEN 50.00
        WHEN S.GovtServiceCode = 7205 THEN 0.00
        WHEN S.GovtServiceCode = 7121 THEN 100.00
        WHEN S.GovtServiceCode = 7176 THEN 200.00
        WHEN S.GovtServiceCode = 7190 THEN 500.00
        WHEN S.GovtServiceCode = 7174 THEN 150.00
        ELSE 0.00
    END,
    CASE 
        WHEN S.GovtServiceCode IN (7205) THEN 0
        ELSE 1
    END
FROM SeedServices S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ServiceMaster] X WHERE X.DepartmentId = D.Id AND X.ServiceName = S.ServiceName
);
GO

-- =========================================================
-- RTS FieldDefinition Seed Data
-- =========================================================
;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFirstName', N'groomFirstName', N'Groom First Name', N'text', N'Bridegroom Details', NULL, 1, 7, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMiddleName', N'groomMiddleName', N'Groom Middle Name', N'text', N'Bridegroom Details', NULL, 0, 8, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomLastName', N'groomLastName', N'Groom Last Name', N'text', N'Bridegroom Details', NULL, 1, 9, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAge', N'groomAge', N'Age', N'number', N'Bridegroom Details', NULL, 1, 10, NULL, N'{"min":21,"max":120}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomDateOfBirth', N'groomDateOfBirth', N'Date of Birth', N'date', N'Bridegroom Details', NULL, 1, 11, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAadhaar', N'groomAadhaar', N'Aadhaar Number', N'text', N'Bridegroom Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherFirstName', N'groomFatherFirstName', N'Father''s First Name', N'text', N'Bridegroom Details', NULL, 1, 13, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherMiddleName', N'groomFatherMiddleName', N'Father''s Middle Name', N'text', N'Bridegroom Details', NULL, 0, 14, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomFatherLastName', N'groomFatherLastName', N'Father''s Last Name', N'text', N'Bridegroom Details', NULL, 1, 15, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherFirstName', N'groomMotherFirstName', N'Mother''s First Name', N'text', N'Bridegroom Details', NULL, 1, 16, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherMiddleName', N'groomMotherMiddleName', N'Mother''s Middle Name', N'text', N'Bridegroom Details', NULL, 0, 17, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomMotherLastName', N'groomMotherLastName', N'Mother''s Last Name', N'text', N'Bridegroom Details', NULL, 1, 18, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomparentCity', N'groomparentCity', N'groomParent City', N'text', N'Bridegroom Details', NULL, 1, 19, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomparentState', N'groomparentState', N'groomParent State', N'text', N'Bridegroom Details', NULL, 1, 20, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomOccupation', N'groomOccupation', N'Occupation', N'text', N'Bridegroom Details', NULL, 0, 21, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomReligion', N'groomReligion', N'Religion', N'select', N'Bridegroom Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 22, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFirstName', N'brideFirstName', N'Bride First Name', N'text', N'Bride Details', NULL, 1, 23, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMiddleName', N'brideMiddleName', N'Bride Middle Name', N'text', N'Bride Details', NULL, 0, 24, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideLastName', N'brideLastName', N'Bride Last Name', N'text', N'Bride Details', NULL, 1, 25, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAge', N'brideAge', N'Age', N'number', N'Bride Details', NULL, 1, 26, NULL, N'{"min":18,"max":120}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideDateOfBirth', N'brideDateOfBirth', N'Date of Birth', N'date', N'Bride Details', NULL, 1, 27, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAadhaar', N'brideAadhaar', N'Aadhaar Number', N'text', N'Bride Details', NULL, 1, 28, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherFirstName', N'brideFatherFirstName', N'Father''s First Name', N'text', N'Bride Details', NULL, 1, 29, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherMiddleName', N'brideFatherMiddleName', N'Father''s Middle Name', N'text', N'Bride Details', NULL, 0, 30, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideFatherLastName', N'brideFatherLastName', N'Father''s Last Name', N'text', N'Bride Details', NULL, 1, 31, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherFirstName', N'brideMotherFirstName', N'Mother''s First Name', N'text', N'Bride Details', NULL, 1, 32, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherMiddleName', N'brideMotherMiddleName', N'Mother''s Middle Name', N'text', N'Bride Details', NULL, 0, 33, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideMotherLastName', N'brideMotherLastName', N'Mother''s Last Name', N'text', N'Bride Details', NULL, 1, 34, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideparentCity', N'brideparentCity', N'brideParent City', N'text', N'Bride Details', NULL, 1, 35, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideparentState', N'brideparentState', N'brideParent State', N'text', N'Bride Details', NULL, 1, 36, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideOccupation', N'brideOccupation', N'Occupation', N'text', N'Bride Details', NULL, 0, 37, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideReligion', N'brideReligion', N'Religion', N'select', N'Bride Details', N'[{"value":"hindu","label":{"en":"Hindu","hi":"हिंदू","mr":"हिंदू"}},{"value":"muslim","label":{"en":"Muslim","hi":"मुस्लिम","mr":"मुस्लिम"}},{"value":"christian","label":{"en":"Christian","hi":"ईसाई","mr":"ख्रिश्चन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 38, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageDate', N'marriageDate', N'Date of Marriage', N'date', N'Marriage Details', NULL, 1, 39, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriagePlace', N'marriagePlace', N'Place of Marriage', N'text', N'Marriage Details', NULL, 1, 40, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageCity', N'marriageCity', N'marriage City', N'text', N'Marriage Details', NULL, 1, 41, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'marriageState', N'marriageState', N'marriage State', N'text', N'Marriage Details', NULL, 1, 42, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1FirstName', N'witness1FirstName', N'Witness 1 First Name', N'text', N'Marriage Details', NULL, 1, 43, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1MiddleName', N'witness1MiddleName', N'Witness 1 Middle Name', N'text', N'Marriage Details', NULL, 0, 44, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1LastName', N'witness1LastName', N'Witness 1 Last Name', N'text', N'Marriage Details', NULL, 1, 45, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2FirstName', N'witness2FirstName', N'Witness 2 First Name', N'text', N'Marriage Details', NULL, 1, 46, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2MiddleName', N'witness2MiddleName', N'Witness 2 Middle Name', N'text', N'Marriage Details', NULL, 0, 47, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2LastName', N'witness2LastName', N'Witness 2 Last Name', N'text', N'Marriage Details', NULL, 1, 48, NULL, NULL),
    (N'Marriage Certificate', N'Marriage Registration Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 49, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Providing drainage connections', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 1, 5, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Sanitation', N'Providing drainage connections', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Property / Location Details', N'[]', 1, 7, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Property / Location Details', N'[]', 0, 8, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Property / Location Details', N'[]', 0, 9, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Property / Location Details', NULL, 0, 10, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Property / Location Details', NULL, 0, 11, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'premisesOccupancyType', N'premisesOccupancyType', N'Premises Type', N'select', N'Property / Location Details', N'[{"value":"owned","label":{"en":"Owned","hi":"स्वामित्व","mr":"स्वतःचे"}},{"value":"rented","label":{"en":"Rented","hi":"किराये पर","mr":"भाड्याने"}}]', 1, 12, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'connectionType', N'connectionType', N'Connection Type', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"new","label":{"en":"New Connection","hi":"नया कनेक्शन","mr":"पहिल्यांदा नवीन कनेक्शन"}},{"value":"reconnection","label":{"en":"Re-connection","hi":"री-कनेक्शन","mr":"जुनं बंद झालेलं कनेक्शन पुन्हा सुरू करायचं"}},{"value":"additional","label":{"en":"Additional Connection","hi":"अतिरिक्त कनेक्शन","mr":"आधी कनेक्शन आहे, अजून एक कनेक्शन हवं"}}]', 1, 13, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'useType', N'useType', N'Use Type', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"घर / फ्लॅट"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"दुकान / ऑफिस"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"घर + दुकान (दोन्ही)"}}]', 1, 14, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'noOfUnits', N'noOfUnits', N'No. of Units (optional)', N'number', N'Drainage / Sewer Connection Request', NULL, 0, 15, NULL, N'{"min":0}'),
    (N'Sanitation', N'Providing drainage connections', N'existingArrangement', N'existingArrangement', N'Current Wastewater Arrangement', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"septic_tank","label":{"en":"Septic Tank","hi":"सेप्टिक टँक","mr":"सेप्टिक टँक मध्ये"}},{"value":"soak_pit","label":{"en":"Soak Pit","hi":"सोख पिट","mr":"सोख पिट मध्ये"}},{"value":"open_drain","label":{"en":"Open Drain","hi":"खुली नाली","mr":"उघड्या नालीत"}},{"value":"already_connected_issue","label":{"en":"Already Connected (Issue)","hi":"आधीच कनेक्शन आहे (समस्या)","mr":"आधीच कनेक्शन आहे पण त्रास आहे"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 16, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'approxDistanceToSewerLineMeters', N'approxDistanceToSewerLineMeters', N'Approx. distance to nearest sewer line (meters) (optional)', N'number', N'Drainage / Sewer Connection Request', NULL, 0, 17, NULL, N'{"min":0}'),
    (N'Sanitation', N'Providing drainage connections', N'roadCuttingRequired', N'roadCuttingRequired', N'Road Cutting Required?', N'select', N'Drainage / Sewer Connection Request', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 18, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'roadCuttingDetails', N'roadCuttingDetails', N'Road Cutting Details (optional)', N'textarea', N'Drainage / Sewer Connection Request', NULL, 0, 19, NULL, NULL),
    (N'Sanitation', N'Providing drainage connections', N'oldConnectionRefNo', N'oldConnectionRefNo', N'Old Connection Ref No (optional)', N'text', N'Drainage / Sewer Connection Request', NULL, 0, 20, 50, N'{"maxLength":50}'),
    (N'Sanitation', N'Providing drainage connections', N'tradeLicenseNo', N'tradeLicenseNo', N'Trade License No (optional)', N'text', N'Drainage / Sewer Connection Request', NULL, 0, 21, 50, N'{"maxLength":50}'),
    (N'Sanitation', N'Providing drainage connections', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerFirstName', N'ownerFirstName', N'Owner First Name', N'text', N'Owner Details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerMiddleName', N'ownerMiddleName', N'Owner Middle Name', N'text', N'Owner Details', NULL, 0, 8, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerLastName', N'ownerLastName', N'Owner Last Name', N'text', N'Owner Details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerMobile', N'ownerMobile', N'Owner Mobile Number', N'tel', N'Owner Details', NULL, 1, 10, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerEmail', N'ownerEmail', N'Owner Email', N'email', N'Owner Details', NULL, 0, 11, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerAadhar', N'ownerAadhar', N'Owner Aadhar Number', N'text', N'Owner Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'panNumber', N'panNumber', N'Owner PAN Number', N'text', N'Owner Details', NULL, 0, 13, 10, N'{"pattern":"^[A-Z]{5}[0-9]{4}[A-Z]{1}$","maxLength":10}'),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerCity', N'ownerCity', N'Owner City', N'text', N'Owner Details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'ownerState', N'ownerState', N'Owner State', N'text', N'Owner Details', NULL, 1, 15, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'businessName', N'businessName', N'Business / Trade Name', N'text', N'Business Activity & Licensing Details', NULL, 1, 16, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'workers', N'workers', N'Number of Employees', N'number', N'Business Activity & Licensing Details', NULL, 1, 17, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment Number', N'text', N'Business Activity & Licensing Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'propertyTaxReceiptNo', N'propertyTaxReceiptNo', N'Property Tax Receipt Number', N'text', N'Business Activity & Licensing Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'businessAddress', N'businessAddress', N'Business Address', N'textarea', N'Business Activity & Licensing Details', NULL, 1, 20, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'activityType', N'activityType', N'Type of Activity', N'select', N'Business Activity & Licensing Details', N'[{"value":"food","label":{"en":"Food","hi":"खाद्य","mr":"अन्न"}},{"value":"chemical","label":{"en":"Chemical","hi":"रासायनिक","mr":"रासायनिक"}},{"value":"retail","label":{"en":"Retail","hi":"खुदरा","mr":"किरकोळ"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}}]', 1, 21, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'licenseCategory', N'licenseCategory', N'Licensing Category', N'select', N'Business Activity & Licensing Details', N'[{"value":"general","label":{"en":"General","hi":"सामान्य","mr":"सामान्य"}},{"value":"special","label":{"en":"Special","hi":"विशेष","mr":"विशेष"}},{"value":"hazardous","label":{"en":"Hazardous","hi":"जोखिमयुक्त","mr":"जोखीमयुक्त"}}]', 1, 22, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'specialCategory', N'specialCategory', N'Specify License Category (if Special)', N'text', N'Business Activity & Licensing Details', NULL, 1, 23, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'newBusinessProposal', N'newBusinessProposal', N'New Business Proposal?', N'select', N'Business Activity & Licensing Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 24, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'workingHours', N'workingHours', N'Working Hours', N'text', N'Business Activity & Licensing Details', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'fssaiLicense', N'fssaiLicense', N'FSSAI License No. (For Food Trade)', N'text', N'Business Activity & Licensing Details', NULL, 0, 26, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'natureOfGoods', N'natureOfGoods', N'Nature of Goods Stored / Traded', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"food_grains","label":{"en":"Food Grains","hi":"अनाज","mr":"धान्य"}},{"value":"perishable_goods","label":{"en":"Perishable Goods","hi":"नाशवंत वस्तू","mr":"नाशवंत माल"}},{"value":"non_perishable_goods","label":{"en":"Non-Perishable Goods","hi":"अविनाशी वस्तू","mr":"अविनाशी माल"}},{"value":"textiles","label":{"en":"Textiles / Cloth","hi":"कपड़ा","mr":"कापड"}},{"value":"electronics","label":{"en":"Electronics","hi":"इलेक्ट्रॉनिक्स","mr":"इलेक्ट्रॉनिक्स"}},{"value":"machinery","label":{"en":"Machinery / Equipment","hi":"यंत्रसामग्री","mr":"यंत्रसामग्री"}},{"value":"chemicals","label":{"en":"Chemicals","hi":"रसायने","mr":"रसायने"}},{"value":"construction_material","label":{"en":"Construction Material","hi":"बांधकाम साहित्य","mr":"बांधकाम साहित्य"}},{"value":"fertilizers","label":{"en":"Fertilizers","hi":"खते","mr":"खते"}},{"value":"hazardous_goods","label":{"en":"Hazardous Goods","hi":"धोकादायक वस्तू","mr":"धोकादायक माल"}},{"value":"mixed_goods","label":{"en":"Mixed / Multiple Goods","hi":"मिश्रित माल","mr":"मिश्र माल"}},{"value":"others","label":{"en":"Others","hi":"इतर","mr":"इतर"}}]', 1, 27, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'flammableGoods', N'flammableGoods', N'Flammable/Explosive Goods?', N'select', N'Storage, Safety & Hazard Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 28, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'flammableGoodsDetail', N'flammableGoodsDetail', N'Flammable Material Details', N'textarea', N'Storage, Safety & Hazard Details', NULL, 0, 29, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'fireNocUpdated', N'fireNocUpdated', N'Fire NOC Up-to-date?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 30, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'policeNocSubmitted', N'policeNocSubmitted', N'Police NOC Submitted?', N'select', N'Compliance & Approval Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 31, NULL, NULL),
    (N'NOC', N'Trade / Business Non-Revocation NOC', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 32, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerFirstName', N'ownerFirstName', N'Owner First Name', N'text', N'Owner Details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerMiddleName', N'ownerMiddleName', N'Owner Middle Name', N'text', N'Owner Details', NULL, 0, 8, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerLastName', N'ownerLastName', N'Owner Last Name', N'text', N'Owner Details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerMobile', N'ownerMobile', N'Owner Mobile Number', N'tel', N'Owner Details', NULL, 1, 10, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerEmail', N'ownerEmail', N'Owner Email', N'email', N'Owner Details', NULL, 0, 11, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerAadhar', N'ownerAadhar', N'Owner Aadhar Number', N'text', N'Owner Details', NULL, 1, 12, 12, N'{"pattern":"^[0-9]{12}$","maxLength":12}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'panNumber', N'panNumber', N'Owner PAN Number', N'text', N'Owner Details', NULL, 0, 13, 10, N'{"pattern":"^[A-Z]{5}[0-9]{4}[A-Z]{1}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerCity', N'ownerCity', N'Owner City', N'text', N'Owner Details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'ownerState', N'ownerState', N'Owner State', N'text', N'Owner Details', NULL, 1, 15, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandalName', N'mandalName', N'Mandal Name (Reg. Charity Comm.)', N'text', N'Event & Permission Info', NULL, 0, 16, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'registrationNo', N'registrationNo', N'Registration Number', N'text', N'Event & Permission Info', NULL, 0, 17, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'registrationYear', N'registrationYear', N'Registration Year', N'number', N'Event & Permission Info', NULL, 0, 18, NULL, N'{"min":1900,"max":2100}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'chairmanName', N'chairmanName', N'Name of Chairman/Secretary', N'text', N'Event & Permission Info', NULL, 0, 19, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contactNo', N'contactNo', N'Contact No. (President/Secretary)', N'tel', N'Event & Permission Info', NULL, 0, 20, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventType', N'eventType', N'Type of Event', N'select', N'Event & Permission Info', N'[{"value":"marriage","label":{"en":"Marriage","hi":"विवाह","mr":"लग्न"}},{"value":"festival","label":{"en":"Festival","hi":"त्योहार","mr":"सण"}},{"value":"cultural","label":{"en":"Cultural Program","hi":"सांस्कृतिक कार्यक्रम","mr":"सांस्कृतिक कार्यक्रम"}},{"value":"political","label":{"en":"Political Rally","hi":"राजनीतिक सभा","mr":"राजकीय सभा"}},{"value":"exhibition","label":{"en":"Exhibition","hi":"प्रदर्शनी","mr":"प्रदर्शनी"}},{"value":"commercial","label":{"en":"Commercial Event","hi":"व्यावसायिक कार्यक्रम","mr":"व्यावसायिक कार्यक्रम"}}]', 1, 21, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventStartDate', N'eventStartDate', N'Event Start Date', N'date', N'Event & Permission Info', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'eventEndDate', N'eventEndDate', N'Event End Date', N'date', N'Event & Permission Info', NULL, 1, 23, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'placeOwnership', N'placeOwnership', N'Ownership of Tent Place', N'select', N'Event & Permission Info', N'[{"value":"Private","label":{"en":"Private","hi":"निजी","mr":"खाजगी"}},{"value":"Municipal","label":{"en":"Municipal/Council","hi":"नगर निगम","mr":"महापालिका/परिषद"}},{"value":"Public","label":{"en":"Public Road","hi":"सार्वजनिक सड़क","mr":"सार्वजनिक रस्ता"}}]', 1, 24, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'zoneNo', N'zoneNo', N'Zone', N'select', N'Event & Permission Info', N'[{"value":"East","label":{"en":"East Zone","hi":"पूर्व ज़ोन","mr":"पूर्व झोन"}},{"value":"West","label":{"en":"West Zone","hi":"पश्चिम ज़ोन","mr":"पश्चिम झोन"}},{"value":"North","label":{"en":"North Zone","hi":"उत्तर ज़ोन","mr":"उत्तर झोन"}},{"value":"South","label":{"en":"South Zone","hi":"दक्षिण ज़ोन","mr":"दक्षिण झोन"}}]', 1, 25, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'wardArea', N'wardArea', N'Ward Area', N'text', N'Event & Permission Info', NULL, 1, 26, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'plotNo', N'plotNo', N'Plot No', N'text', N'Event & Permission Info', NULL, 1, 27, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'pandolAddress', N'pandolAddress', N'Pandol / Stage Address', N'textarea', N'Event & Permission Info', NULL, 1, 28, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapType', N'mandapType', N'Mandap Type', N'select', N'Mandap Structural Details', N'[{"value":"temporary","label":{"en":"Temporary Mandap","hi":"अस्थायी मंडप","mr":"तात्पुरता मंडप"}},{"value":"stage","label":{"en":"Stage / Platform","hi":"स्टेज / मंच","mr":"स्टेज / व्यासपीठ"}},{"value":"shamiyana","label":{"en":"Shamiyana / Tent","hi":"शामियाना / तंबू","mr":"शामियाना / तंबू"}}]', 1, 29, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapArea', N'mandapArea', N'Mandap Area (sq.ft.)', N'number', N'Mandap Structural Details', NULL, 1, 30, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'areaSqFt', N'areaSqFt', N'Area (Sq Ft)', N'number', N'Mandap Structural Details', NULL, 1, 31, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'volunteers', N'volunteers', N'No. of Volunteers', N'number', N'Mandap Structural Details', NULL, 1, 32, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'numberOfPillars', N'numberOfPillars', N'No. of Pillars / Support Beams', N'number', N'Mandap Structural Details', NULL, 1, 33, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'beamMaterial', N'beamMaterial', N'Material Used (Wood/Iron/Steel/Aluminum)', N'text', N'Mandap Structural Details', NULL, 1, 34, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'structuralEngineerName', N'structuralEngineerName', N'Structural Engineer / Fabricator Name', N'text', N'Mandap Structural Details', NULL, 1, 35, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'mandapHeight', N'mandapHeight', N'Mandap Height (feet)', N'number', N'Mandap Structural Details', NULL, 1, 36, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'windLoadResistance', N'windLoadResistance', N'Wind Load Resistance Tested?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 37, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'fireExtinguishersAvailable', N'fireExtinguishersAvailable', N'Fire Extinguishers Available?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 38, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'extinguisherCount', N'extinguisherCount', N'Number of Extinguishers', N'number', N'Mandap Structural Details', NULL, 0, 39, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'electricalLoad', N'electricalLoad', N'Electrical Load Installed (kW)', N'number', N'Mandap Structural Details', NULL, 1, 40, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'earthingProvided', N'earthingProvided', N'Earthing Provided?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 41, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'crowdCapacity', N'crowdCapacity', N'Expected Crowd Capacity', N'number', N'Mandap Structural Details', NULL, 1, 42, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'emergencyExits', N'emergencyExits', N'Number of Emergency Exits', N'number', N'Mandap Structural Details', NULL, 1, 43, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'generatorUsed', N'generatorUsed', N'Generator to be Used?', N'select', N'Mandap Structural Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 44, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contractorAddress', N'contractorAddress', N'Pandol Contractor Address', N'textarea', N'Contractors Info', NULL, 1, 45, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'contractorContact', N'contractorContact', N'Pandol Contractor Contact', N'tel', N'Contractors Info', NULL, 1, 46, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorName', N'decoratorName', N'Decorator/Electrical Name', N'text', N'Contractors Info', NULL, 1, 47, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorAddress', N'decoratorAddress', N'Decorator/Electrical Address', N'textarea', N'Contractors Info', NULL, 1, 48, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'decoratorContact', N'decoratorContact', N'Decorator/Electrical Contact', N'tel', N'Contractors Info', NULL, 1, 49, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundName', N'soundName', N'Sound/Speaker Contractor Name', N'text', N'Contractors Info', NULL, 1, 50, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundAddress', N'soundAddress', N'Sound/Speaker Address', N'textarea', N'Contractors Info', NULL, 1, 51, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundContact', N'soundContact', N'Sound/Speaker Contact', N'tel', N'Contractors Info', NULL, 1, 52, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Mandap No-Damage Certificate', N'soundType', N'soundType', N'Sound/Speaker Type', N'select', N'Contractors Info', N'[{"value":"DJ","label":{"en":"DJ System","hi":"डीजे सिस्टम","mr":"डीजे सिस्टम"}},{"value":"Loudspeaker","label":{"en":"Loudspeaker","hi":"लाउडस्पीकर","mr":"लाउडस्पीकर"}},{"value":"Traditional","label":{"en":"Traditional Instruments","hi":"पारंपरिक वाद्ययंत्र","mr":"पारंपारिक वाद्ये"}}]', 1, 53, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'policeStation', N'policeStation', N'Concerned Police Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 54, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'trafficPoliceStation', N'trafficPoliceStation', N'Concerned Traffic Police Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 55, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'fireStation', N'fireStation', N'Nearest Fire Station', N'text', N'Applicant Undertaking & Compliance', NULL, 1, 56, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'noDamageGuarantee', N'noDamageGuarantee', N'Guarantee that No Damage Will Be Caused to Public Property', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 57, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'cleanlinessAssurance', N'cleanlinessAssurance', N'Assurance to Clean the Area After Event', N'select', N'Applicant Undertaking & Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 58, NULL, NULL),
    (N'NOC', N'Mandap No-Damage Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 59, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerName', N'ownerName', N'Name of Owner', N'text', N'Owner & Premises details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerMobile', N'ownerMobile', N'Mobile Number', N'tel', N'Owner & Premises details', NULL, 1, 8, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'ownerEmail', N'ownerEmail', N'Email Address', N'email', N'Owner & Premises details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessName', N'businessName', N'Name of Industry / Business / Firm', N'text', N'Owner & Premises details', NULL, 1, 10, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessCity', N'businessCity', N'business City', N'text', N'Owner & Premises details', NULL, 1, 11, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'businessState', N'businessState', N'business State', N'text', N'Owner & Premises details', NULL, 1, 12, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment No.', N'text', N'Owner & Premises details', NULL, 1, 13, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'zoneWard', N'zoneWard', N'Zone/Ward', N'text', N'Owner & Premises details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'propertyType', N'propertyType', N'Occupancy Type', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', 1, 15, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'totalBuiltupArea', N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'number', N'Fire Safety & Building Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'floors', N'floors', N'No. of Floors', N'number', N'Fire Safety & Building Details', NULL, 1, 17, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'workers', N'workers', N'No. of Workers/Employees', N'number', N'Fire Safety & Building Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'extinguisherCountProposed', N'extinguisherCountProposed', N'Proposed No. of Fire Extinguishers', N'number', N'Fire Safety & Building Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'emergencyExitCountProposed', N'emergencyExitCountProposed', N'Proposed No. of Emergency Exits', N'number', N'Fire Safety & Building Details', NULL, 1, 20, NULL, N'{"min":1}'),
    (N'NOC', N'Fire Extinguisher Certificate', N'musterPointProposed', N'musterPointProposed', N'Proposed Assembly / Muster Point Details', N'textarea', N'Fire Safety & Building Details', NULL, 0, 21, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'flammableMaterialsProposed', N'flammableMaterialsProposed', N'Any Highly Flammable Materials to be Stored?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 22, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'flammableMaterialDetailsProposed', N'flammableMaterialDetailsProposed', N'Details of Flammable Materials (If Yes)', N'textarea', N'Fire Safety & Building Details', NULL, 0, 23, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'buildingDetailsAsMap', N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'textarea', N'Fire Safety & Building Details', NULL, 1, 24, NULL, NULL),
    (N'NOC', N'Fire Extinguisher Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerName', N'ownerName', N'Name of Owner', N'text', N'Owner & Premises details', NULL, 1, 7, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerMobile', N'ownerMobile', N'Mobile Number', N'tel', N'Owner & Premises details', NULL, 1, 8, 10, N'{"pattern":"^[0-9]{10}$","maxLength":10}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'ownerEmail', N'ownerEmail', N'Email Address', N'email', N'Owner & Premises details', NULL, 0, 9, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessName', N'businessName', N'Name of Industry / Business / Firm', N'text', N'Owner & Premises details', NULL, 1, 10, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessCity', N'businessCity', N'business City', N'text', N'Owner & Premises details', NULL, 1, 11, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'businessState', N'businessState', N'business State', N'text', N'Owner & Premises details', NULL, 1, 12, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'propertyTaxNo', N'propertyTaxNo', N'Property Tax Assessment No.', N'text', N'Owner & Premises details', NULL, 1, 13, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'NOC', N'Final Fire Exemption Certificate', N'zoneWard', N'zoneWard', N'Zone/Ward', N'text', N'Owner & Premises details', NULL, 1, 14, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'propertyType', N'propertyType', N'Occupancy Type', N'select', N'Owner & Premises details', N'[{"value":"commercial","label":{"en":"Commercial","hi":"व्यावसायिक","mr":"व्यावसायिक"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"warehouse","label":{"en":"Warehouse/Storage","hi":"गोदाम/भंडारण","mr":"वेअरहाउस/साठवण"}},{"value":"office","label":{"en":"Office","hi":"कार्यालय","mr":"कार्यालय"}}]', 1, 15, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'totalBuiltupArea', N'totalBuiltupArea', N'Total Built-up Area (sq.m)', N'number', N'Fire Safety & Building Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'floors', N'floors', N'No. of Floors', N'number', N'Fire Safety & Building Details', NULL, 1, 17, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'workers', N'workers', N'No. of Workers/Employees', N'number', N'Fire Safety & Building Details', NULL, 1, 18, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherCount', N'extinguisherCount', N'No. of Fire Extinguishers Installed', N'number', N'Fire Safety & Building Details', NULL, 1, 19, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherType', N'extinguisherType', N'Type of Extinguishers', N'select', N'Fire Safety & Building Details', N'[{"value":"co2","label":{"en":"CO₂","hi":"CO₂","mr":"CO₂"}},{"value":"dcp","label":{"en":"DCP","hi":"DCP","mr":"DCP"}},{"value":"water","label":{"en":"Water","hi":"पानी","mr":"पाणी"}},{"value":"foam","label":{"en":"Foam","hi":"फोम","mr":"फोम"}}]', 1, 20, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'extinguisherDensity', N'extinguisherDensity', N'Fire Extinguishers Per 100 Sq.ft.', N'number', N'Fire Safety & Building Details', NULL, 0, 21, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'lastRefillDate', N'lastRefillDate', N'Last Refill/Service Date', N'date', N'Fire Safety & Building Details', NULL, 1, 22, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'nextRefillDueDate', N'nextRefillDueDate', N'Next Service Due Date', N'date', N'Fire Safety & Building Details', NULL, 0, 23, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'installerAgency', N'installerAgency', N'Installer/Service Agency Name', N'text', N'Fire Safety & Building Details', NULL, 1, 24, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'serviceAgencyLicenseNo', N'serviceAgencyLicenseNo', N'Service Agency License No.', N'text', N'Fire Safety & Building Details', NULL, 1, 25, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'emergencyExitCount', N'emergencyExitCount', N'No. of Emergency Exits', N'number', N'Fire Safety & Building Details', NULL, 1, 26, NULL, N'{"min":1}'),
    (N'NOC', N'Final Fire Exemption Certificate', N'exitSignage', N'exitSignage', N'Exit Direction Signage Installed', N'select', N'Fire Safety & Building Details', N'[{"value":"illuminated","label":{"en":"Illuminated","hi":"प्रकाशयुक्त","mr":"प्रकाशयुक्त"}},{"value":"nonIlluminated","label":{"en":"Non-Illuminated","hi":"अप्रकाशित","mr":"अप्रकाशित"}},{"value":"no","label":{"en":"Not Installed","hi":"स्थापित नहीं","mr":"बसवलेले नाही"}}]', 1, 27, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'routeMarking', N'routeMarking', N'Evacuation Route Marked', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"partial","label":{"en":"Partially","hi":"आंशिक","mr":"आंशिक"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 28, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'fireStaircaseAvailable', N'fireStaircaseAvailable', N'Dedicated Fire Staircase', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 29, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'musterPoint', N'musterPoint', N'Assembly / Muster Point Details', N'textarea', N'Fire Safety & Building Details', NULL, 0, 30, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'fireAlarmInstalled', N'fireAlarmInstalled', N'Fire Alarm System Installed?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 31, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'hydrantSprinklerInstalled', N'hydrantSprinklerInstalled', N'Hydrant / Sprinkler System Installed?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 32, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'earthingCertified', N'earthingCertified', N'Earthing System Certified?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 33, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'flammableMaterials', N'flammableMaterials', N'Any Highly Flammable Materials Stored?', N'select', N'Fire Safety & Building Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 34, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'flammableMaterialDetails', N'flammableMaterialDetails', N'Details of Flammable Materials (If Yes)', N'textarea', N'Fire Safety & Building Details', NULL, 0, 35, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'buildingDetailsAsMap', N'buildingDetailsAsMap', N'Details as per Approved/Proposed Map (Signed by Architect & Owner)', N'textarea', N'Fire Safety & Building Details', NULL, 1, 36, NULL, NULL),
    (N'NOC', N'Final Fire Exemption Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 37, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'dateOfBirth', N'dateOfBirth', N'Date of Birth (DD-MM-YYYY)', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 1, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'gender', N'gender', N'Sex', N'select', N'Section 1 — Child, Birth & Registrar Details', N'[{"value":"Male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"Female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"Transgender Person","label":{"en":"Transgender","hi":"ट्रांसजेंडर","mr":"ट्रान्सजेंडर"}}]', 1, 2, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childFirstName', N'childFirstName', N'Child First Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 3, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childMiddleName', N'childMiddleName', N'Child Middle Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 4, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childLastName', N'childLastName', N'Child Last Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 5, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'childAadhaar', N'childAadhaar', N'Aadhaar No. (Optional)', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 6, 14, N'{"pattern":"^[0-9]{12}$|^[0-9]{4}-[0-9]{4}-[0-9]{4}$","maxLength":14}'),
    (N'Birth & Death', N'Birth Certificate', N'placeOfBirthType', N'placeOfBirthType', N'Place of Birth Type', N'select', N'Section 1 — Child, Birth & Registrar Details', N'[{"value":"hospital","label":{"en":"Hospital / Institution","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"house","label":{"en":"House","hi":"घर","mr":"घर"}},{"value":"other","label":{"en":"Other Place","hi":"अन्य स्थान","mr":"इतर ठिकाण"}}]', 1, 7, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'hospitalName', N'hospitalName', N'Hospital / Institution Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 8, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceAddress', N'birthPlaceAddress', N'Complete Birth Address', N'textarea', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 9, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceSubDistrict', N'birthPlaceSubDistrict', N'Sub-district', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 10, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceDistrict', N'birthPlaceDistrict', N'District', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 11, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlaceState', N'birthPlaceState', N'State / UT', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 12, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'birthPlacePinCode', N'birthPlacePinCode', N'PIN Code', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 1, 13, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Birth Certificate', N'_registrar_header', N'_registrar_header', N'--- Registrar Details ---', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 14, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationNo', N'registrationNo', N'Registration No.', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 15, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationDate', N'registrationDate', N'Registration Date', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 16, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrationUnit', N'registrationUnit', N'Registration Unit', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 17, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarTownVillage', N'registrarTownVillage', N'Town / Village', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 18, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarDistrict', N'registrarDistrict', N'District', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 19, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarSubDistrict', N'registrarSubDistrict', N'Sub-district', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 20, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarName', N'registrarName', N'Registrar Name', N'text', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 21, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarSignatureDate', N'registrarSignatureDate', N'Registrar Signature Date', N'date', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 22, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'registrarRemarks', N'registrarRemarks', N'Remarks', N'textarea', N'Section 1 — Child, Birth & Registrar Details', NULL, 0, 23, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentHouseNo', N'permanentHouseNo', N'House No.', N'text', N'Section 2 — Address Information', NULL, 1, 24, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentLocality', N'permanentLocality', N'Locality', N'text', N'Section 2 — Address Information', NULL, 1, 25, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentWard', N'permanentWard', N'Ward No.', N'text', N'Section 2 — Address Information', NULL, 0, 26, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentTownVillage', N'permanentTownVillage', N'Town / Village', N'text', N'Section 2 — Address Information', NULL, 1, 27, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentSubDistrict', N'permanentSubDistrict', N'Sub-district', N'text', N'Section 2 — Address Information', NULL, 1, 28, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentDistrict', N'permanentDistrict', N'District', N'text', N'Section 2 — Address Information', NULL, 1, 29, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentState', N'permanentState', N'State / UT', N'text', N'Section 2 — Address Information', NULL, 1, 30, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'permanentPinCode', N'permanentPinCode', N'PIN Code', N'text', N'Section 2 — Address Information', NULL, 1, 31, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Birth Certificate', N'permanentAddressProofType', N'permanentAddressProofType', N'Permanent Address Proof Type', N'select', N'Section 2 — Address Information', N'[{"value":"aadhaar","label":{"en":"Aadhaar Card","hi":"आधार","mr":"आधार"}}]', 1, 32, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'addressProofLast4Digits', N'addressProofLast4Digits', N'Last 4 Digits', N'text', N'Section 2 — Address Information', NULL, 1, 33, 4, N'{"pattern":"^[0-9]{4}$","maxLength":4}'),
    (N'Birth & Death', N'Birth Certificate', N'motherFirstName', N'motherFirstName', N'Mother First Name', N'text', N'Section 3 — Mother''s Information', NULL, 1, 34, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherMiddleName', N'motherMiddleName', N'Mother Middle Name', N'text', N'Section 3 — Mother''s Information', NULL, 0, 35, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherLastName', N'motherLastName', N'Mother Last Name', N'text', N'Section 3 — Mother''s Information', NULL, 0, 36, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherAadhaar', N'motherAadhaar', N'Mother Aadhaar No.', N'text', N'Section 3 — Mother''s Information', NULL, 0, 37, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherMobile', N'motherMobile', N'Mother Mobile No.', N'tel', N'Section 3 — Mother''s Information', NULL, 1, 38, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherEmail', N'motherEmail', N'Mother Email ID', N'email', N'Section 3 — Mother''s Information', NULL, 0, 39, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'motherAgeAtMarriage', N'motherAgeAtMarriage', N'Age at First Marriage', N'number', N'Section 3 — Mother''s Information', NULL, 1, 40, NULL, N'{"min":18,"max":100}'),
    (N'Birth & Death', N'Birth Certificate', N'motherAgeAtBirth', N'motherAgeAtBirth', N'Age at This Birth', N'number', N'Section 3 — Mother''s Information', NULL, 1, 41, NULL, N'{"min":15,"max":100}'),
    (N'Birth & Death', N'Birth Certificate', N'childrenBornAlive', N'childrenBornAlive', N'Children Born Alive', N'number', N'Section 3 — Mother''s Information', NULL, 1, 42, NULL, N'{"min":1,"max":30}'),
    (N'Birth & Death', N'Birth Certificate', N'fatherFirstName', N'fatherFirstName', N'Father First Name', N'text', N'Section 4 — Father''s Information', NULL, 1, 43, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherMiddleName', N'fatherMiddleName', N'Father Middle Name', N'text', N'Section 4 — Father''s Information', NULL, 0, 44, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherLastName', N'fatherLastName', N'Father Last Name', N'text', N'Section 4 — Father''s Information', NULL, 0, 45, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherAadhaar', N'fatherAadhaar', N'Father Aadhaar No.', N'text', N'Section 4 — Father''s Information', NULL, 0, 46, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherMobile', N'fatherMobile', N'Father Mobile No.', N'tel', N'Section 4 — Father''s Information', NULL, 1, 47, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'fatherEmail', N'fatherEmail', N'Father Email ID', N'email', N'Section 4 — Father''s Information', NULL, 0, 48, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantFirstName', N'informantFirstName', N'Informant First Name', N'text', N'Section 5 — Informant Details', NULL, 1, 49, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantMiddleName', N'informantMiddleName', N'Informant Middle Name', N'text', N'Section 5 — Informant Details', NULL, 0, 50, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantLastName', N'informantLastName', N'Informant Last Name', N'text', N'Section 5 — Informant Details', NULL, 0, 51, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantMobile', N'informantMobile', N'Informant Mobile', N'tel', N'Section 5 — Informant Details', NULL, 1, 52, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'informantAddress', N'informantAddress', N'Informant Address', N'textarea', N'Section 5 — Informant Details', NULL, 1, 53, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'declarationAccuracy', N'declarationAccuracy', N'I confirm info is accurate', N'select', N'Section 5 — Informant Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 54, NULL, NULL),
    (N'Birth & Death', N'Birth Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 55, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedFirstName', N'deceasedFirstName', N'Deceased First Name', N'text', N'Deceased Person Information', NULL, 1, 7, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedMiddleName', N'deceasedMiddleName', N'Deceased Middle Name', N'text', N'Deceased Person Information', NULL, 0, 8, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deceasedLastName', N'deceasedLastName', N'Deceased Last Name', N'text', N'Deceased Person Information', NULL, 1, 9, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'dateOfDeath', N'dateOfDeath', N'Date of Death', N'date', N'Deceased Person Information', NULL, 1, 10, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'timeOfDeath', N'timeOfDeath', N'Time of Death', N'text', N'Deceased Person Information', NULL, 1, 11, NULL, N'{"pattern":"^([01]?[0-9]|2[0-3]):[0-5][0-9]$"}'),
    (N'Birth & Death', N'Death Certificate', N'age', N'age', N'Age at Death', N'number', N'Deceased Person Information', NULL, 1, 12, NULL, N'{"min":0,"max":150}'),
    (N'Birth & Death', N'Death Certificate', N'gender', N'gender', N'Gender', N'select', N'Deceased Person Information', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 13, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathType', N'deathType', N'Type of Death', N'select', N'Death Circumstance Details', N'[{"value":"natural","label":{"en":"Natural","hi":"प्राकृतिक","mr":"नैसर्गिक"}},{"value":"accidental","label":{"en":"Accidental/External Cause","hi":"दुर्घटना/बाह्य कारण","mr":"अपघात/बाह्य कारण"}}]', 1, 14, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathNature', N'deathNature', N'Nature of Death (If Accidental)', N'select', N'Death Circumstance Details', N'[{"value":"accident","label":{"en":"Accidental","hi":"दुर्घटना","mr":"अपघाताने"}},{"value":"suicide","label":{"en":"Suicide","hi":"आत्महत्या","mr":"आत्महत्या"}},{"value":"homicide","label":{"en":"Homicide","hi":"हत्या","mr":"खून"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 15, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceHouseNo', N'incidentPlaceHouseNo', N'Incident House No.', N'text', N'Death Circumstance Details', NULL, 0, 16, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceLocality', N'incidentPlaceLocality', N'Incident Locality/Area', N'textarea', N'Death Circumstance Details', NULL, 0, 17, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceTown', N'incidentPlaceTown', N'Town/City', N'text', N'Death Circumstance Details', NULL, 0, 18, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceDistrict', N'incidentPlaceDistrict', N'District', N'text', N'Death Circumstance Details', NULL, 0, 19, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlaceState', N'incidentPlaceState', N'State', N'text', N'Death Circumstance Details', NULL, 0, 20, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'incidentPlacePinCode', N'incidentPlacePinCode', N'PIN Code', N'text', N'Death Circumstance Details', NULL, 0, 21, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}')
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Birth & Death', N'Death Certificate', N'policeStation', N'policeStation', N'Police Station Name', N'text', N'Death Circumstance Details', NULL, 0, 22, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firCaseNumber', N'firCaseNumber', N'FIR / Case Number', N'text', N'Death Circumstance Details', NULL, 0, 23, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstTreatmentHospital', N'firstTreatmentHospital', N'First Medical Treatment Hospital Name', N'text', N'Death Circumstance Details', NULL, 0, 24, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'firstTreatmentAddress', N'firstTreatmentAddress', N'First Treatment Hospital Address', N'textarea', N'Death Circumstance Details', NULL, 0, 25, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathDeclaredHospital', N'deathDeclaredHospital', N'Death Declared Hospital Name', N'text', N'Death Circumstance Details', NULL, 0, 26, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathDeclaredAddress', N'deathDeclaredAddress', N'Death Declared Hospital Address', N'textarea', N'Death Circumstance Details', NULL, 0, 27, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'placeOfDeathType', N'placeOfDeathType', N'Place of Death', N'select', N'Place of Death', N'[{"value":"hospital","label":{"en":"Hospital","hi":"अस्पताल","mr":"रुग्णालय"}},{"value":"home","label":{"en":"Home","hi":"घर","mr":"घर"}},{"value":"road","label":{"en":"Road/Public Place","hi":"सड़क/सार्वजनिक स्थान","mr":"रस्ता/सार्वजनिक ठिकाण"}}]', 1, 28, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'hospitalName', N'hospitalName', N'Hospital/Institution Name', N'text', N'Place of Death', NULL, 0, 29, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathAddress', N'deathAddress', N'Complete Death Address', N'textarea', N'Place of Death', NULL, 1, 30, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deathPinCode', N'deathPinCode', N'PIN Code', N'text', N'Place of Death', NULL, 0, 31, 6, N'{"pattern":"^[0-9]{6}$","maxLength":6}'),
    (N'Birth & Death', N'Death Certificate', N'deactivateAadhaar', N'deactivateAadhaar', N'Aadhaar Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 32, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deactivatePAN', N'deactivatePAN', N'PAN Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 33, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'cancelPassport', N'cancelPassport', N'Passport Cancellation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 34, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deleteVoterID', N'deleteVoterID', N'Voter ID Deletion', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 35, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'terminatePension', N'terminatePension', N'Pension Account Termination', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 36, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'freezeBankAccount', N'freezeBankAccount', N'Bank Account Freeze Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 37, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'deactivateSIM', N'deactivateSIM', N'SIM/Telecom Deactivation', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 38, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'closeDigitalWallet', N'closeDigitalWallet', N'UPI/Digital Wallet Closure', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 39, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'notifyInsurance', N'notifyInsurance', N'Insurance Company Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 40, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'notifyLoanCredit', N'notifyLoanCredit', N'Loan/Credit Liability Notification', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"yes","label":{"en":"Yes","hi":"हां","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"not-applicable","label":{"en":"Not Applicable","hi":"लागू नहीं","mr":"लागू नाही"}}]', 1, 41, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'digitalDeactivationConsent', N'digitalDeactivationConsent', N'Consent Declaration', N'select', N'Digital Identity Deactivation Matrix', N'[{"value":"agree","label":{"en":"I give consent for government departments to deactivate all digital identities associated with the deceased as per law","hi":"मैं मृतक से जुड़ी सभी डिजिटल पहचानों को कानून के अनुसार निष्क्रिय करने के लिए सरकारी विभागों को सहमति देता/देती हूं","mr":"मी मृत व्यक्तीशी संबंधित सर्व डिजिटल ओळख कायद्यानुसार निष्क्रिय करण्यासाठी सरकारी विभागांना संमती देतो"}}]', 1, 42, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'addressVerifiedUsing', N'addressVerifiedUsing', N'Permanent Address Verified Using', N'select', N'Permanent Address Verification', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}},{"value":"utility-bill","label":{"en":"Utility Bill","hi":"उपयोगिता बिल","mr":"युटिलिटी बिल"}},{"value":"ration-card","label":{"en":"Ration Card","hi":"राशन कार्ड","mr":"रेशन कार्ड"}},{"value":"tax-receipt","label":{"en":"Municipal Tax Receipt","hi":"नगरपालिका कर रसीद","mr":"नगरपालिका कर पावती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 43, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'verifiedByRegistrar', N'verifiedByRegistrar', N'Verified by Registrar', N'select', N'Permanent Address Verification', N'[{"value":"yes","label":{"en":"Yes, Verified","hi":"हां, सत्यापित","mr":"होय, पडताळले"}},{"value":"pending","label":{"en":"Pending Verification","hi":"सत्यापन लंबित","mr":"पडताळणी प्रलंबित"}}]', 0, 44, NULL, NULL),
    (N'Birth & Death', N'Death Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 45, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Zone Certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'purpose', N'purpose', N'Purpose', N'select', N'Request Details', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"court","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Request Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Zone Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Giving Part Map', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Giving Part Map', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Giving Part Map', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'purpose', N'purpose', N'Purpose', N'select', N'Part Map Request', N'[{"value":"sale","label":{"en":"Sale / Registry","hi":"विक्री / नोंदणी","mr":"विक्री / नोंदणी"}},{"value":"loan","label":{"en":"Bank Loan","hi":"बँक कर्ज","mr":"बँक कर्ज"}},{"value":"buildingPermission","label":{"en":"Building Permission","hi":"बांधकाम परवानगी","mr":"बांधकाम परवानगी"}},{"value":"legal","label":{"en":"Court / Legal","hi":"न्यायालय / कायदेशीर","mr":"न्यायालय / कायदेशीर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'partMapType', N'partMapType', N'Part Map Type', N'select', N'Part Map Request', N'[{"value":"dp","label":{"en":"City Development Map (DP)","hi":"शहर विकास नकाशा (DP)","mr":"शहर विकास नकाशा (DP)"}},{"value":"tps","label":{"en":"TP Scheme Map (TPS)","hi":"टी.पी. स्कीम नकाशा (TPS)","mr":"टी.पी. स्कीम नकाशा (TPS)"}},{"value":"rp","label":{"en":"Regional Map (RP)","hi":"प्रादेशिक नकाशा (RP)","mr":"प्रादेशिक नकाशा (RP)"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Part Map Request', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"relative","label":{"en":"Relative","hi":"नातेवाईक","mr":"नातेवाईक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Giving Part Map', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'plotAreaSqm', N'plotAreaSqm', N'Plot Area (sq. m) (Auto)', N'number', N'Ward / Zone & Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'ctsSurveyNo', N'ctsSurveyNo', N'CTS / Survey No (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'typeOfWork', N'typeOfWork', N'Type of Work', N'select', N'Construction Proposal Details', N'[{"value":"new","label":{"en":"New Construction","hi":"नवीन निर्माण","mr":"नवीन बांधकाम"}},{"value":"addition","label":{"en":"Addition (Extra)","hi":"अतिरिक्त","mr":"अतिरिक्त (मजला/भाग)"}},{"value":"alteration","label":{"en":"Alteration (Change)","hi":"बदल","mr":"बदल (Alteration)"}},{"value":"redevelopment","label":{"en":"Redevelopment","hi":"पुनर्विकास","mr":"पुनर्विकास"}},{"value":"repair","label":{"en":"Repair","hi":"दुरुस्ती","mr":"दुरुस्ती"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'buildingUse', N'buildingUse', N'Building Use', N'select', N'Construction Proposal Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed Use","hi":"मिश्रित","mr":"मिश्र वापर"}},{"value":"industrial","label":{"en":"Industrial","hi":"औद्योगिक","mr":"औद्योगिक"}},{"value":"institutional","label":{"en":"Institutional","hi":"संस्थात्मक","mr":"संस्थात्मक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'proposedFloors', N'proposedFloors', N'Total Floors (Proposed)', N'number', N'Construction Proposal Details', NULL, 1, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'proposedBuiltUpAreaSqm', N'proposedBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'number', N'Construction Proposal Details', NULL, 1, 17, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'hasBasementOrStilt', N'hasBasementOrStilt', N'Basement / Stilt Parking?', N'select', N'Construction Proposal Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 18, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'buildingHeightM', N'buildingHeightM', N'Building Height (m) (if known)', N'number', N'Construction Proposal Details', NULL, 0, 19, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'briefWorkDescription', N'briefWorkDescription', N'Brief Description (optional)', N'textarea', N'Construction Proposal Details', NULL, 0, 20, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'submittedThroughLicensedPerson', N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 21, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectName', N'architectName', N'Architect/Engineer Name', N'text', N'Architect / Engineer Details', NULL, 1, 22, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectLicenseNo', N'architectLicenseNo', N'License / Registration No', N'text', N'Architect / Engineer Details', NULL, 1, 23, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectMobile', N'architectMobile', N'Mobile Number', N'text', N'Architect / Engineer Details', NULL, 1, 24, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Construction Permit', N'architectEmail', N'architectEmail', N'Email (optional)', N'text', N'Architect / Engineer Details', NULL, 0, 25, NULL, NULL),
    (N'Town Planning', N'Issuance of Construction Permit', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 26, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Applicant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantAddress', N'applicantAddress', N'Residential Address', N'textarea', N'Applicant Details', NULL, 1, 4, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}},{"value":"passport","label":{"en":"Passport","hi":"पासपोर्ट","mr":"पासपोर्ट"}}]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 6, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"representative","label":{"en":"Representative","hi":"प्रतिनिधि","mr":"प्रतिनिधी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 7, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Ward / Zone & Property Details', N'[]', 1, 8, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Ward / Zone & Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Ward / Zone & Property Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Ward / Zone & Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'ocType', N'ocType', N'OC Type', N'select', N'OC Request Details', N'[{"value":"full","label":{"en":"Full OC","hi":"पूर्ण ओसी","mr":"पूर्ण ओसी"}},{"value":"part","label":{"en":"Part OC","hi":"आंशिक ओसी","mr":"आंशिक ओसी"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'buildingPermissionRefNo', N'buildingPermissionRefNo', N'Building Permission / CC Reference No', N'text', N'OC Request Details', NULL, 1, 14, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'completionDate', N'completionDate', N'Completion Date', N'date', N'OC Request Details', NULL, 1, 15, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'totalFloorsConstructed', N'totalFloorsConstructed', N'Total Floors Constructed', N'number', N'OC Request Details', NULL, 1, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'totalBuiltUpAreaSqm', N'totalBuiltUpAreaSqm', N'Total Built-up Area (sq. m)', N'number', N'OC Request Details', NULL, 1, 17, NULL, N'{"min":0}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'OC Request Details', NULL, 0, 18, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'submittedThroughLicensedPerson', N'submittedThroughLicensedPerson', N'Submitted through Licensed Architect/Engineer?', N'select', N'Architect / Engineer Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 19, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectName', N'architectName', N'Architect/Engineer Name', N'text', N'Architect / Engineer Details', NULL, 0, 20, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectLicenseNo', N'architectLicenseNo', N'License / Registration No', N'text', N'Architect / Engineer Details', NULL, 0, 21, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectMobile', N'architectMobile', N'Mobile Number', N'text', N'Architect / Engineer Details', NULL, 0, 22, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'architectEmail', N'architectEmail', N'Email (optional)', N'text', N'Architect / Engineer Details', NULL, 0, 23, NULL, NULL),
    (N'Town Planning', N'Issuance of Occupancy Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 24, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'complainantFullName', N'complainantFullName', N'Full Name', N'text', N'Complainant Details', NULL, 1, 1, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Complainant Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Complainant Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'complainantAddress', N'complainantAddress', N'Address (optional)', N'textarea', N'Complainant Details', NULL, 0, 4, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'wardId', N'wardId', N'Ward', N'select', N'Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'zoneId', N'zoneId', N'Zone', N'select', N'Location Details', N'[]', 1, 6, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'areaName', N'areaName', N'Area / Locality', N'text', N'Location Details', NULL, 1, 7, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Location Details', NULL, 1, 8, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'landmark', N'landmark', N'Landmark', N'text', N'Location Details', NULL, 1, 9, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Location Details', NULL, 0, 10, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'coverType', N'coverType', N'Cover Type', N'select', N'Issue Details', N'[{"value":"manhole","label":{"en":"Manhole Cover","hi":"मॅनहोल कव्हर","mr":"मॅनहोल कव्हर"}},{"value":"sewer","label":{"en":"Sewer Cover","hi":"सीवर कव्हर","mr":"सीवर कव्हर"}},{"value":"storm_water","label":{"en":"Storm Water Cover","hi":"स्टॉर्म वॉटर कव्हर","mr":"स्टॉर्म वॉटर कव्हर"}}]', 1, 11, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'issueType', N'issueType', N'Issue Type', N'select', N'Issue Details', N'[{"value":"missing","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब"}},{"value":"broken","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले"}},{"value":"loose","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल"}},{"value":"sunken","label":{"en":"Cover Sunken (Level mismatch)","hi":"कव्हर खाली बसले","mr":"कव्हर खाली बसले"}},{"value":"open","label":{"en":"Chamber Open","hi":"चेंबर उघडे","mr":"चेंबर उघडे"}},{"value":"noise","label":{"en":"Noise / Vibration","hi":"आवाज/कंपन","mr":"आवाज/कंपन"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Issue Details', N'[{"value":"high","label":{"en":"High (Accident risk)","hi":"उच्च (अपघाताचा धोका)","mr":"उच्च (अपघाताचा धोका)"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}}]', 1, 13, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'issueDescription', N'issueDescription', N'Issue Description', N'textarea', N'Issue Details', NULL, 1, 14, NULL, NULL),
    (N'Sanitation', N'Maintaining Manhole / Sewer Covers', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 15, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'firstName', N'firstName', N'First Name', N'text', N'Applicant Information', NULL, 1, 1, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'middleName', N'middleName', N'Middle Name', N'text', N'Applicant Information', NULL, 0, 2, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastName', N'lastName', N'Last Name', N'text', N'Applicant Information', NULL, 1, 3, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'mobileNumber', N'mobileNumber', N'Mobile Number', N'tel', N'Applicant Information', NULL, 1, 4, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'aadharNo', N'aadharNo', N'Aadhar Card No', N'text', N'Applicant Information', NULL, 1, 5, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'email', N'email', N'Email', N'email', N'Applicant Information', NULL, 0, 6, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'relationshipToStudent', N'relationshipToStudent', N'Relationship to Student', N'select', N'Applicant Information', N'[{"value":"self","label":{"en":"Self (Student)","hi":"स्वयं (छात्र)","mr":"स्वतः (विद्यार्थी)"}},{"value":"parent","label":{"en":"Parent","hi":"अभिभावक","mr":"पालक"}},{"value":"guardian","label":{"en":"Guardian","hi":"संरक्षक","mr":"संरक्षक"}}]', 1, 7, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'guardianFullName', N'guardianFullName', N'Parent/Guardian Full Name', N'text', N'Applicant Information', NULL, 1, 8, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'rollNumber', N'rollNumber', N'Roll Number', N'text', N'Student Details', NULL, 0, 9, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'studentName', N'studentName', N'Student Full Name', N'text', N'Student Details', NULL, 1, 10, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'dateOfBirth', N'dateOfBirth', N'Date of Birth', N'date', N'Student Details', NULL, 1, 11, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'gender', N'gender', N'Gender', N'select', N'Student Details', N'[{"value":"male","label":{"en":"Male","hi":"पुरुष","mr":"पुरुष"}},{"value":"female","label":{"en":"Female","hi":"महिला","mr":"महिला"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 12, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'motherName', N'motherName', N'Mother''s Name', N'text', N'Student Details', NULL, 1, 13, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'fatherName', N'fatherName', N'Father''s Name', N'text', N'Student Details', NULL, 1, 14, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'aadharLast4', N'aadharLast4', N'Aadhaar Last 4 Digits (optional)', N'text', N'Student Details', NULL, 0, 15, 4, N'{"maxLength":4}'),
    (N'Education', N'School Leaving / Duplicate Certificate', N'schoolName', N'schoolName', N'School Name', N'text', N'School Details', NULL, 1, 16, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastStandardStudied', N'lastStandardStudied', N'Last Standard/Class Studied', N'text', N'School Details', NULL, 1, 17, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'yearOfLeaving', N'yearOfLeaving', N'Year of Leaving', N'text', N'School Details', NULL, 1, 18, 4, N'{"maxLength":4}'),
    (N'Education', N'School Leaving / Duplicate Certificate', N'certificateType', N'certificateType', N'Certificate Type', N'select', N'School Details', N'[{"value":"leaving","label":{"en":"Leaving Certificate","hi":"लीविंग प्रमाणपत्र","mr":"शाळा सोडल्याचा दाखला"}},{"value":"duplicate","label":{"en":"Duplicate Certificate","hi":"डुप्लिकेट प्रमाणपत्र","mr":"डुप्लिकेट प्रमाणपत्र"}},{"value":"migration","label":{"en":"Migration Certificate","hi":"स्थानांतरण प्रमाणपत्र","mr":"स्थलांतर प्रमाणपत्र"}}]', 1, 19, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastAttendanceDate', N'lastAttendanceDate', N'Last Attendance Date', N'date', N'School Details', NULL, 0, 20, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'boardOrUniversity', N'boardOrUniversity', N'Board / University', N'text', N'School Details', NULL, 0, 21, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'reasonForLeaving', N'reasonForLeaving', N'Reason for Leaving', N'select', N'Certificate Details', N'[{"value":"transfer","label":{"en":"Transfer","hi":"स्थानांतरण","mr":"बदली"}},{"value":"higherStudies","label":{"en":"Higher Studies","hi":"उच्च शिक्षा","mr":"उच्च शिक्षण"}},{"value":"familyShift","label":{"en":"Family Shift","hi":"परिवार स्थानांतरण","mr":"कुटुंब स्थलांतर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 22, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'pendingDuesCleared', N'pendingDuesCleared', N'Any Pending Dues Cleared?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 23, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'duplicateReason', N'duplicateReason', N'Reason for Duplicate', N'select', N'Certificate Details', N'[{"value":"lost","label":{"en":"Lost","hi":"खो गया","mr":"हरवले"}},{"value":"damaged","label":{"en":"Damaged","hi":"क्षतिग्रस्त","mr":"खराब झाले"}},{"value":"misplaced","label":{"en":"Misplaced","hi":"गुम हो गया","mr":"ठेवले तेथे सापडत नाही"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 24, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'originalCertificateNumber', N'originalCertificateNumber', N'Original Certificate No. (if known)', N'text', N'Certificate Details', NULL, 0, 25, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'policeComplaintFiled', N'policeComplaintFiled', N'Police Complaint Filed?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 26, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'affidavitProvided', N'affidavitProvided', N'Affidavit Provided?', N'select', N'Certificate Details', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 0, 27, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'lastExamPassed', N'lastExamPassed', N'Last Exam Passed', N'text', N'Certificate Details', NULL, 0, 28, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'seatOrRegNo', N'seatOrRegNo', N'Seat No / Registration No', N'text', N'Certificate Details', NULL, 0, 29, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'destinationInstituteName', N'destinationInstituteName', N'Destination Institute (optional)', N'text', N'Certificate Details', NULL, 0, 30, NULL, NULL),
    (N'Education', N'School Leaving / Duplicate Certificate', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 31, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant Details', N'[{"value":"individual","label":{"en":"Individual","hi":"वैयक्तिक","mr":"वैयक्तिक"}},{"value":"society","label":{"en":"Society","hi":"सोसायटी","mr":"सोसायटी"}},{"value":"company","label":{"en":"Company","hi":"कंपनी","mr":"कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantFullName', N'applicantFullName', N'Full Name', N'text', N'Applicant Details', NULL, 1, 2, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 4, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantAddress', N'applicantAddress', N'Address (optional)', N'textarea', N'Applicant Details', NULL, 0, 5, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'idProofType', N'idProofType', N'ID Proof Type', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 1, 6, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'idProofNumber', N'idProofNumber', N'ID Proof Number', N'text', N'Applicant Details', NULL, 1, 7, 20, N'{"maxLength":20}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'applicantRelationship', N'applicantRelationship', N'Relationship to Property', N'select', N'Applicant Details', N'[{"value":"owner","label":{"en":"Owner","hi":"मालक","mr":"मालक"}},{"value":"poa","label":{"en":"POA Holder","hi":"POA धारक","mr":"मुखत्यार (POA)"}},{"value":"tenant","label":{"en":"Tenant","hi":"किरायेदार","mr":"भाडेकरू"}},{"value":"society_authorized","label":{"en":"Society (Authorized)","hi":"सोसायटी (अधिकृत)","mr":"सोसायटी (अधिकृत)"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 8, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Location / Property Details', N'[]', 0, 9, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Location / Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Location / Property Details', N'[]', 0, 11, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Location / Property Details', NULL, 0, 12, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Address (Auto)', N'textarea', N'Location / Property Details', NULL, 0, 13, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'areaName', N'areaName', N'Area / Locality', N'text', N'Location / Property Details', NULL, 0, 14, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Location / Property Details', NULL, 0, 15, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'landmark', N'landmark', N'Landmark', N'text', N'Location / Property Details', NULL, 0, 16, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Location / Property Details', NULL, 0, 17, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'actionRequested', N'actionRequested', N'What do you want to do?', N'select', N'Tree Request Details', N'[{"value":"felling","label":{"en":"Cut the tree (Felling)","hi":"झाड तोडणे","mr":"झाड तोडणे"}},{"value":"pruning","label":{"en":"Cut branches (Pruning)","hi":"फांद्या छाटणे","mr":"फांद्या छाटणे"}},{"value":"transplant","label":{"en":"Shift the tree (Transplant)","hi":"झाड हलवणे","mr":"झाड हलवणे (ट्रान्सप्लांट)"}}]', 1, 18, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'noOfTrees', N'noOfTrees', N'How many trees?', N'number', N'Tree Request Details', NULL, 1, 19, NULL, N'{"min":1}'),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'treeLocationType', N'treeLocationType', N'Where is the tree located?', N'select', N'Tree Request Details', N'[{"value":"inside_property","label":{"en":"Inside my property","hi":"मालमत्तेमध्ये","mr":"माझ्या मालमत्तेमध्ये"}},{"value":"society_premises","label":{"en":"Society premises","hi":"सोसायटीमध्ये","mr":"सोसायटीमध्ये"}},{"value":"roadside_public","label":{"en":"Roadside / Public place","hi":"रस्त्यालगत / सार्वजनिक","mr":"रस्त्यालगत / सार्वजनिक"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 20, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'reasonCategory', N'reasonCategory', N'Reason', N'select', N'Tree Request Details', N'[{"value":"dangerous","label":{"en":"Dangerous (risk of falling)","hi":"धोकादायक","mr":"धोकादायक (पडण्याचा धोका)"}},{"value":"diseased","label":{"en":"Diseased / Dead","hi":"रोगग्रस्त / सुकलेले","mr":"रोगग्रस्त / सुकलेले"}},{"value":"obstruction","label":{"en":"Obstruction / nuisance","hi":"अडथळा / त्रास","mr":"अडथळा / त्रास"}},{"value":"construction","label":{"en":"Construction / development work","hi":"बांधकाम/विकास काम","mr":"बांधकाम/विकास काम"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 21, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'isImmediateDanger', N'isImmediateDanger', N'Is it an emergency danger?', N'select', N'Tree Request Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 22, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'dangerExplanation', N'dangerExplanation', N'Explain the danger (if yes)', N'textarea', N'Tree Request Details', NULL, 0, 23, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'treeDetails', N'treeDetails', N'Tree Details', N'textarea', N'Tree Request Details', NULL, 1, 24, NULL, NULL),
    (N'Tree', N'Tree Felling Permission (Sec 8)', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 25, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant / Organization Details', N'[{"value":"telecom_isp","label":{"en":"Telecom / ISP","hi":"टेलिकॉम / ISP","mr":"टेलिकॉम / ISP"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"government","label":{"en":"Government","hi":"शासकीय","mr":"शासकीय"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'organizationName', N'organizationName', N'Organization / Company Name', N'text', N'Applicant / Organization Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'authorizedSignatoryName', N'authorizedSignatoryName', N'Authorized Signatory Name', N'text', N'Applicant / Organization Details', NULL, 1, 3, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant / Organization Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'email', N'email', N'Email (recommended)', N'text', N'Applicant / Organization Details', NULL, 0, 5, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'officeAddress', N'officeAddress', N'Office Address', N'textarea', N'Applicant / Organization Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'licenseOrRegistrationNo', N'licenseOrRegistrationNo', N'License / Registration No (if any)', N'text', N'Applicant / Organization Details', NULL, 0, 7, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'gstNo', N'gstNo', N'GST No (if any)', N'text', N'Applicant / Organization Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'wardId', N'wardId', N'Ward', N'select', N'Work Location Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'zoneId', N'zoneId', N'Zone', N'select', N'Work Location Details', N'[]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'workAreaType', N'workAreaType', N'Work Area Type', N'select', N'Work Location Details', N'[{"value":"main_road","label":{"en":"Main Road","hi":"मुख्य रस्ता","mr":"मुख्य रस्ता"}},{"value":"internal_road","label":{"en":"Internal Road","hi":"अंतर्गत रस्ता","mr":"अंतर्गत रस्ता"}},{"value":"footpath","label":{"en":"Footpath","hi":"फुटपाथ","mr":"फुटपाथ"}},{"value":"divider","label":{"en":"Divider","hi":"डिव्हायडर","mr":"डिव्हायडर"}},{"value":"garden_open_space","label":{"en":"Garden / Open Space","hi":"बाग / मोकळी जागा","mr":"बाग / मोकळी जागा"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 11, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Work Location Details', NULL, 1, 12, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'fromLocation', N'fromLocation', N'From Location', N'text', N'Work Location Details', NULL, 1, 13, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'toLocation', N'toLocation', N'To Location', N'text', N'Work Location Details', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'landmark', N'landmark', N'Landmark (optional)', N'text', N'Work Location Details', NULL, 0, 15, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'totalRouteLengthMeters', N'totalRouteLengthMeters', N'Total Route Length (meters)', N'number', N'Work Location Details', NULL, 1, 16, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'methodOfLaying', N'methodOfLaying', N'Method of Laying', N'select', N'Excavation / Laying Details', N'[{"value":"open_trench","label":{"en":"Open Trench (Excavation)","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम (Open Trench)"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"बोरिंग (HDD)","mr":"बोरिंग (HDD)"}},{"value":"micro_trenching","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}},{"value":"existing_duct","label":{"en":"Use Existing Duct","hi":"विद्यमान डक्ट वापरणे","mr":"विद्यमान डक्ट वापरणे"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trenchWidthCm', N'trenchWidthCm', N'Trench Width (cm)', N'number', N'Excavation / Laying Details', NULL, 0, 18, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trenchDepthCm', N'trenchDepthCm', N'Trench Depth (cm)', N'number', N'Excavation / Laying Details', NULL, 0, 19, NULL, N'{"min":1}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'roadCrossingsCount', N'roadCrossingsCount', N'No. of Road Crossings', N'number', N'Excavation / Laying Details', NULL, 1, 20, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'ductPipeSize', N'ductPipeSize', N'Duct / HDPE Pipe Size', N'text', N'Excavation / Laying Details', NULL, 1, 21, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'noOfDucts', N'noOfDucts', N'No. of Ducts (optional)', N'number', N'Excavation / Laying Details', NULL, 0, 22, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'handholesChambersCount', N'handholesChambersCount', N'Handholes / Chambers (optional)', N'number', N'Excavation / Laying Details', NULL, 0, 23, NULL, N'{"min":0}'),
    (N'Town Planning', N'Underground OFC Cable Permission', N'expectedStartDate', N'expectedStartDate', N'Expected Start Date', N'date', N'Excavation / Laying Details', NULL, 1, 24, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'expectedEndDate', N'expectedEndDate', N'Expected End Date', N'date', N'Excavation / Laying Details', NULL, 1, 25, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'trafficManagementRequired', N'trafficManagementRequired', N'Traffic Management Required?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 26, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
    (N'Town Planning', N'Underground OFC Cable Permission', N'barricadingAndSafety', N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', 1, 27, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'restorationResponsibility', N'restorationResponsibility', N'Restoration Responsibility', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'restorationType', N'restorationType', N'Restoration Type', N'select', N'Safety & Restoration', N'[{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 29, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'undertakingConsent', N'undertakingConsent', N'Undertaking / Indemnity Consent', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', 1, 30, NULL, NULL),
    (N'Town Planning', N'Underground OFC Cable Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 31, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant / Company Details', N'[{"value":"telecom_operator","label":{"en":"Telecom Operator","hi":"टेलिकॉम ऑपरेटर","mr":"टेलिकॉम ऑपरेटर"}},{"value":"tower_infra","label":{"en":"Tower Infrastructure Company","hi":"टॉवर इन्फ्रा कंपनी","mr":"टॉवर इन्फ्रा कंपनी"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'companyName', N'companyName', N'Company / Organization Name', N'text', N'Applicant / Company Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'authorizedSignatoryName', N'authorizedSignatoryName', N'Authorized Signatory Name', N'text', N'Applicant / Company Details', NULL, 1, 3, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant / Company Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Mobile Tower Permission', N'email', N'email', N'Email', N'text', N'Applicant / Company Details', NULL, 1, 5, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'officeAddress', N'officeAddress', N'Office Address', N'textarea', N'Applicant / Company Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'dotLicenseOrRegNo', N'dotLicenseOrRegNo', N'DoT/License/Registration No (if any)', N'text', N'Applicant / Company Details', NULL, 0, 7, 50, N'{"maxLength":50}'),
    (N'Town Planning', N'Mobile Tower Permission', N'gstNo', N'gstNo', N'GST No (optional)', N'text', N'Applicant / Company Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Mobile Tower Permission', N'propertyNo', N'propertyNo', N'Select Property No / UPIC', N'select', N'Site / Property Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'wardId', N'wardId', N'Ward (Auto)', N'select', N'Site / Property Details', N'[]', 0, 10, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'zoneId', N'zoneId', N'Zone (Auto)', N'select', N'Site / Property Details', N'[]', 0, 11, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fetchedOwnerName', N'fetchedOwnerName', N'Owner Name (Auto)', N'text', N'Site / Property Details', NULL, 0, 12, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fetchedPropertyAddress', N'fetchedPropertyAddress', N'Property Address (Auto)', N'textarea', N'Site / Property Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'siteType', N'siteType', N'Site Type', N'select', N'Site / Property Details', N'[{"value":"rooftop","label":{"en":"Rooftop (Terrace)","hi":"रूफटॉप (टेरेस)","mr":"रूफटॉप (टेरेस)"}},{"value":"ground_base","label":{"en":"Ground Base","hi":"ग्राउंड बेस","mr":"ग्राउंड बेस"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'buildingUse', N'buildingUse', N'Building Use (optional)', N'select', N'Site / Property Details', N'[{"value":"residential","label":{"en":"Residential","hi":"आवासीय","mr":"निवासी"}},{"value":"commercial","label":{"en":"Commercial","hi":"वाणिज्यिक","mr":"व्यावसायिक"}},{"value":"mixed","label":{"en":"Mixed","hi":"मिश्रित","mr":"मिश्र"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 0, 15, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'totalFloorsInBuilding', N'totalFloorsInBuilding', N'Total Floors in Building (optional)', N'number', N'Site / Property Details', NULL, 0, 16, NULL, N'{"min":0}'),
    (N'Town Planning', N'Mobile Tower Permission', N'towerType', N'towerType', N'Tower Type', N'select', N'Tower / Equipment Details', N'[{"value":"rooftop_pole","label":{"en":"Rooftop Pole","hi":"रूफटॉप पोल","mr":"रूफटॉप पोल"}},{"value":"rooftop_tower","label":{"en":"Rooftop Tower","hi":"रूफटॉप टॉवर","mr":"रूफटॉप टॉवर"}},{"value":"ground_base_tower","label":{"en":"Ground Base Tower","hi":"ग्राउंड बेस टॉवर","mr":"ग्राउंड बेस टॉवर"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'towerHeightMeters', N'towerHeightMeters', N'Tower Height (meters)', N'number', N'Tower / Equipment Details', NULL, 1, 18, NULL, N'{"min":1}'),
    (N'Town Planning', N'Mobile Tower Permission', N'antennaCount', N'antennaCount', N'No. of Antennas', N'number', N'Tower / Equipment Details', NULL, 1, 19, NULL, N'{"min":1}'),
    (N'Town Planning', N'Mobile Tower Permission', N'dgSetAvailable', N'dgSetAvailable', N'DG Set Available?', N'select', N'Tower / Equipment Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 20, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'dgCapacityKva', N'dgCapacityKva', N'DG Capacity (kVA)', N'number', N'Tower / Equipment Details', NULL, 0, 21, NULL, N'{"min":0}'),
    (N'Town Planning', N'Mobile Tower Permission', N'equipmentRoomAvailable', N'equipmentRoomAvailable', N'Equipment/Shelter Room?', N'select', N'Tower / Equipment Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 22, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'proposedInstallationDate', N'proposedInstallationDate', N'Proposed Installation Date (optional)', N'date', N'Tower / Equipment Details', NULL, 0, 23, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'structuralSafetyCertificateAvailable', N'structuralSafetyCertificateAvailable', N'Structural Safety Certificate Available?', N'select', N'Safety / Compliance', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 24, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'fireNocApplicable', N'fireNocApplicable', N'Fire NOC Applicable?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 25, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'sacfaClearanceAvailable', N'sacfaClearanceAvailable', N'SACFA Clearance Available?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 26, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'aaiNocApplicable', N'aaiNocApplicable', N'AAI/Airport NOC Applicable?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 27, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'nearSchoolHospital', N'nearSchoolHospital', N'Is there a School/Hospital within 100m?', N'select', N'Safety / Compliance', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Safety / Compliance', NULL, 0, 29, NULL, NULL),
    (N'Town Planning', N'Mobile Tower Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 30, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'citizenFullName', N'citizenFullName', N'Full Name', N'text', N'Citizen Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Citizen Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Citizen Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'wardId', N'wardId', N'Ward', N'select', N'Pothole Location Details', N'[]', 1, 4, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'zoneId', N'zoneId', N'Zone', N'select', N'Pothole Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'areaName', N'areaName', N'Area / Locality', N'text', N'Pothole Location Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Pothole Location Details', NULL, 1, 7, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'landmark', N'landmark', N'Landmark', N'text', N'Pothole Location Details', NULL, 1, 8, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'fromLocation', N'fromLocation', N'From (optional)', N'text', N'Pothole Location Details', NULL, 0, 9, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'toLocation', N'toLocation', N'To (optional)', N'text', N'Pothole Location Details', NULL, 0, 10, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Pothole Location Details', NULL, 0, 11, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'potholeCount', N'potholeCount', N'Number of Potholes', N'number', N'Pothole Details', NULL, 1, 12, NULL, N'{"min":1}'),
    (N'Town Planning', N'Filling Potholes on City Roads', N'potholeSize', N'potholeSize', N'Pothole Size', N'select', N'Pothole Details', N'[{"value":"small","label":{"en":"Small","hi":"लहान","mr":"लहान"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"large","label":{"en":"Large","hi":"मोठा","mr":"मोठा"}}]', 1, 13, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Pothole Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', 1, 14, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'accidentOrDamage', N'accidentOrDamage', N'Any accident/vehicle damage?', N'select', N'Pothole Details', N'[{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}},{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}}]', 0, 15, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Pothole Details', NULL, 0, 16, NULL, NULL),
    (N'Town Planning', N'Filling Potholes on City Roads', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 17, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'citizenFullName', N'citizenFullName', N'Full Name', N'text', N'Citizen Details', NULL, 1, 1, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Citizen Details', NULL, 1, 2, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'alternateMobileNo', N'alternateMobileNo', N'Alternate Mobile (optional)', N'text', N'Citizen Details', NULL, 0, 3, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'wardId', N'wardId', N'Ward', N'select', N'Sewer Cover Location Details', N'[]', 1, 4, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'zoneId', N'zoneId', N'Zone', N'select', N'Sewer Cover Location Details', N'[]', 1, 5, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'areaName', N'areaName', N'Area / Locality', N'text', N'Sewer Cover Location Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Sewer Cover Location Details', NULL, 1, 7, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'landmark', N'landmark', N'Landmark', N'text', N'Sewer Cover Location Details', NULL, 1, 8, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Sewer Cover Location Details', NULL, 0, 9, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'issueType', N'issueType', N'Issue Type', N'select', N'Sewer Cover Issue Details', N'[{"value":"missing_cover","label":{"en":"Cover Missing","hi":"कव्हर गायब","mr":"कव्हर गायब आहे"}},{"value":"broken_cover","label":{"en":"Cover Broken","hi":"कव्हर तुटले","mr":"कव्हर तुटले आहे"}},{"value":"loose_cover","label":{"en":"Cover Loose / Moving","hi":"कव्हर सैल","mr":"कव्हर सैल/हलते"}},{"value":"uneven_level","label":{"en":"Uneven Level","hi":"लेव्हल नाही","mr":"कव्हर उंच-खाली (लेव्हल नाही)"}},{"value":"damaged_frame","label":{"en":"Frame Damaged","hi":"फ्रेम डॅमेज","mr":"चेंबर फ्रेम तुटली/डॅमेज"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'riskLevel', N'riskLevel', N'Risk Level', N'select', N'Sewer Cover Issue Details', N'[{"value":"low","label":{"en":"Low","hi":"कमी","mr":"कमी"}},{"value":"medium","label":{"en":"Medium","hi":"मध्यम","mr":"मध्यम"}},{"value":"high","label":{"en":"High","hi":"जास्त","mr":"जास्त"}}]', 1, 11, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'coverCount', N'coverCount', N'Number of Covers', N'number', N'Sewer Cover Issue Details', NULL, 1, 12, NULL, N'{"min":1}'),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'remarks', N'remarks', N'Remarks (optional)', N'textarea', N'Sewer Cover Issue Details', NULL, 0, 13, NULL, NULL),
    (N'Town Planning', N'Maintaining & Securing Sewer Covers', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantType', N'applicantType', N'Applicant Type', N'select', N'Applicant Details', N'[{"value":"citizen","label":{"en":"Citizen","hi":"नागरिक","mr":"नागरिक"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}},{"value":"utility_company","label":{"en":"Utility Company","hi":"युटिलिटी कंपनी","mr":"युटिलिटी कंपनी"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 1, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantNameOrCompany', N'applicantNameOrCompany', N'Applicant / Company Name', N'text', N'Applicant Details', NULL, 1, 2, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'authorizedPersonName', N'authorizedPersonName', N'Authorized Person Name (if applicable)', N'text', N'Applicant Details', NULL, 0, 3, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'mobileNo', N'mobileNo', N'Mobile Number', N'text', N'Applicant Details', NULL, 1, 4, 10, N'{"minLength":10,"maxLength":10}'),
    (N'Town Planning', N'Road Cutting Permission', N'email', N'email', N'Email (optional)', N'text', N'Applicant Details', NULL, 0, 5, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'applicantAddress', N'applicantAddress', N'Address', N'textarea', N'Applicant Details', NULL, 1, 6, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'idProofType', N'idProofType', N'ID Proof Type (for citizen)', N'select', N'Applicant Details', N'[{"value":"aadhaar","label":{"en":"Aadhaar","hi":"आधार","mr":"आधार"}},{"value":"voter","label":{"en":"Voter ID","hi":"वोटर आईडी","mr":"मतदार ओळखपत्र"}},{"value":"pan","label":{"en":"PAN","hi":"पैन","mr":"पॅन"}},{"value":"dl","label":{"en":"Driving License","hi":"ड्राइविंग लाइसेंस","mr":"ड्रायव्हिंग लायसन्स"}}]', 0, 7, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'idProofNumber', N'idProofNumber', N'ID Proof Number (for citizen)', N'text', N'Applicant Details', NULL, 0, 8, 20, N'{"maxLength":20}'),
    (N'Town Planning', N'Road Cutting Permission', N'wardId', N'wardId', N'Ward', N'select', N'Work Location Details', N'[]', 1, 9, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'zoneId', N'zoneId', N'Zone', N'select', N'Work Location Details', N'[]', 1, 10, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'roadStreetName', N'roadStreetName', N'Road / Street Name', N'text', N'Work Location Details', NULL, 1, 11, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'fromLocation', N'fromLocation', N'From Location', N'text', N'Work Location Details', NULL, 1, 12, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'toLocation', N'toLocation', N'To Location', N'text', N'Work Location Details', NULL, 1, 13, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'landmark', N'landmark', N'Landmark', N'text', N'Work Location Details', NULL, 1, 14, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'totalLengthMeters', N'totalLengthMeters', N'Total Length (meters)', N'number', N'Work Location Details', NULL, 1, 15, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'googleMapLink', N'googleMapLink', N'Google Map Link (optional)', N'text', N'Work Location Details', NULL, 0, 16, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'purpose', N'purpose', N'Purpose / Reason', N'select', N'Road Cutting Details', N'[{"value":"water_connection","label":{"en":"Water Connection","hi":"पाणी कनेक्शन","mr":"पाणी कनेक्शन"}},{"value":"sewer_connection","label":{"en":"Sewer/Drainage Connection","hi":"ड्रेनेज कनेक्शन","mr":"ड्रेनेज कनेक्शन"}},{"value":"electric_cable","label":{"en":"Electric Cable","hi":"विद्युत केबल","mr":"विद्युत केबल"}},{"value":"gas_pipeline","label":{"en":"Gas Pipeline","hi":"गॅस लाईन","mr":"गॅस लाईन"}},{"value":"ofc","label":{"en":"OFC / Telecom Cable","hi":"OFC / टेलिकॉम","mr":"OFC / टेलिकॉम"}},{"value":"repair","label":{"en":"Repair / Maintenance","hi":"दुरुस्ती","mr":"दुरुस्ती"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 17, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'excavationMethod', N'excavationMethod', N'Method', N'select', N'Road Cutting Details', N'[{"value":"open_trench","label":{"en":"Open Trench","hi":"उघडे खोदकाम","mr":"उघडे खोदकाम"}},{"value":"hdd_boring","label":{"en":"HDD (Boring)","hi":"HDD (बोरिंग)","mr":"HDD (बोरिंग)"}},{"value":"micro_trench","label":{"en":"Micro-trenching","hi":"मायक्रो ट्रेंचिंग","mr":"मायक्रो ट्रेंचिंग"}}]', 1, 18, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'surfaceType', N'surfaceType', N'Surface Type', N'select', N'Road Cutting Details', N'[{"value":"asphalt","label":{"en":"Asphalt (Tar)","hi":"डांबर","mr":"डांबर"}},{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 19, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'cuttingWidthCm', N'cuttingWidthCm', N'Cutting Width (cm)', N'number', N'Road Cutting Details', NULL, 1, 20, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'cuttingDepthCm', N'cuttingDepthCm', N'Cutting Depth (cm)', N'number', N'Road Cutting Details', NULL, 1, 21, NULL, N'{"min":1}'),
    (N'Town Planning', N'Road Cutting Permission', N'roadCrossingsCount', N'roadCrossingsCount', N'No. of Road Crossings (optional)', N'number', N'Road Cutting Details', NULL, 0, 22, NULL, N'{"min":0}'),
    (N'Town Planning', N'Road Cutting Permission', N'expectedStartDate', N'expectedStartDate', N'Expected Start Date', N'date', N'Road Cutting Details', NULL, 1, 23, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'expectedEndDate', N'expectedEndDate', N'Expected End Date', N'date', N'Road Cutting Details', NULL, 1, 24, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'trafficManagementRequired', N'trafficManagementRequired', N'Traffic Management Required?', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes","hi":"हाँ","mr":"होय"}},{"value":"no","label":{"en":"No","hi":"नहीं","mr":"नाही"}}]', 1, 25, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'barricadingAndSafety', N'barricadingAndSafety', N'Barricading & Safety Arrangement', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, will provide","hi":"हाँ, करू","mr":"होय, करणार"}}]', 1, 26, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'restorationResponsibility', N'restorationResponsibility', N'Restoration Responsibility', N'select', N'Safety & Restoration', N'[{"value":"applicant","label":{"en":"Applicant","hi":"आवेदक","mr":"अर्जदार"}},{"value":"contractor","label":{"en":"Contractor","hi":"कॉन्ट्रॅक्टर","mr":"कॉन्ट्रॅक्टर"}}]', 1, 27, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'restorationType', N'restorationType', N'Restoration Type', N'select', N'Safety & Restoration', N'[{"value":"asphalt","label":{"en":"Asphalt","hi":"डांबर","mr":"डांबर"}},{"value":"cc_road","label":{"en":"CC Road","hi":"सीसी रस्ता","mr":"सीसी रस्ता"}},{"value":"paver_blocks","label":{"en":"Paver Blocks","hi":"पेवर ब्लॉक्स","mr":"पेवर ब्लॉक्स"}},{"value":"footpath_tiles","label":{"en":"Footpath Tiles","hi":"फुटपाथ टाईल्स","mr":"फुटपाथ टाईल्स"}},{"value":"other","label":{"en":"Other","hi":"अन्य","mr":"इतर"}}]', 1, 28, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'undertakingConsent', N'undertakingConsent', N'Undertaking / Indemnity Consent', N'select', N'Safety & Restoration', N'[{"value":"yes","label":{"en":"Yes, I agree","hi":"हाँ, सहमत","mr":"होय, मी सहमत आहे"}}]', 1, 29, NULL, NULL),
    (N'Town Planning', N'Road Cutting Permission', N'declaration', N'declaration', N'I hereby declare that the information provided is true and correct.', N'checkbox', N'Declaration', NULL, 1, 30, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, IsRequired, DisplayOrder, MaxLength, ValidationRules)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, NULL, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO

-- =========================================================
-- RTS Document Upload Fields Seed Data (file inputs)
-- =========================================================
;WITH SeedDocumentFields AS (
    SELECT * FROM (VALUES
        -- Marriage Registration Certificate Document Uploads
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'groomAgeProofDoc', N'Groom Age Proof Document', N'file', N'Document Uploads', 1, 50),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'brideAgeProofDoc', N'Bride Age Proof Document', N'file', N'Document Uploads', 1, 51),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'weddingInvitationDoc', N'Wedding Invitation Card', N'file', N'Document Uploads', 0, 52),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness1IdProofDoc', N'Witness 1 ID Proof', N'file', N'Document Uploads', 1, 53),
        (N'Marriage Certificate', N'Marriage Registration Certificate', N'witness2IdProofDoc', N'Witness 2 ID Proof', N'file', N'Document Uploads', 1, 54),
        -- Birth Certificate Document Uploads
        (N'Birth & Death',        N'Birth Certificate',                 N'dischargeCardDoc', N'Hospital Discharge Card', N'file', N'Document Uploads', 1, 56),
        (N'Birth & Death',        N'Birth Certificate',                 N'informantIdDoc', N'Informant ID Proof', N'file', N'Document Uploads', 1, 57),
        -- Death Certificate Document Uploads
        (N'Birth & Death',        N'Death Certificate',                 N'doctorCertificateDoc', N'Doctor Certificate of Cause of Death', N'file', N'Document Uploads', 1, 58),
        (N'Birth & Death',        N'Death Certificate',                 N'cremationCertificateDoc', N'Cremation / Burial Ground Certificate', N'file', N'Document Uploads', 1, 59),
        -- Drainage/Sanitation Connection Document Uploads
        (N'Sanitation',           N'Providing drainage connections',    N'idProofDoc', N'Applicant ID Proof Document', N'file', N'Document Uploads', 1, 23),
        (N'Sanitation',           N'Providing drainage connections',    N'propertyTaxReceiptDoc', N'Property Tax Receipt Document', N'file', N'Document Uploads', 1, 24),
        (N'Sanitation',           N'Providing drainage connections',    N'premisesMapDoc', N'Premises Layout Map', N'file', N'Document Uploads', 0, 25)
    ) AS V (DeptName, SvcName, FieldCode, FieldLabel, FieldType, FieldGroup, IsRequired, DisplayOrder)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldLabel], [FieldType], [FieldGroup], 
    [IsRequired], [DisplayOrder], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.IsRequired, S.DisplayOrder, 1, 0, 0, GETDATE()
FROM SeedDocumentFields S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO


-- =========================================================
-- RTS FieldDefinition Localized Labels Translations (Marathi)
-- =========================================================
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पहिले नाव' WHERE [FieldLabel] = 'First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मधले नाव' WHERE [FieldLabel] = 'Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आडनाव' WHERE [FieldLabel] = 'Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पूर्ण नाव' WHERE [FieldLabel] = 'Full Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मोबाईल नंबर' WHERE [FieldLabel] = 'Mobile Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ईमेल' WHERE [FieldLabel] = 'Email' OR [FieldLabel] = 'Email (optional)' OR [FieldLabel] = 'Owner Email';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आधार कार्ड क्रमांक' WHERE [FieldLabel] = 'Aadhar Card No' OR [FieldLabel] = 'Aadhaar Number' OR [FieldLabel] = 'Owner Aadhaar Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वय' WHERE [FieldLabel] = 'Age';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जन्मतारीख' WHERE [FieldLabel] = 'Date of Birth';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे पहिले नाव' WHERE [FieldLabel] = 'Father''s First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे मधले नाव' WHERE [FieldLabel] = 'Father''s Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वडिलांचे आडनाव' WHERE [FieldLabel] = 'Father''s Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे पहिले नाव' WHERE [FieldLabel] = 'Mother''s First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे मधले नाव' WHERE [FieldLabel] = 'Mother''s Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'आईचे आडनाव' WHERE [FieldLabel] = 'Mother''s Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पत्ता' WHERE [FieldLabel] = 'Residential Address' OR [FieldLabel] = 'Business Address' OR [FieldLabel] = 'Property Address (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय' WHERE [FieldLabel] = 'Occupation';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'धर्म' WHERE [FieldLabel] = 'Religion';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्न तारीख' WHERE [FieldLabel] = 'Date of Marriage';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्न ठिकाण' WHERE [FieldLabel] = 'Place of Marriage';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ पहिले नाव' WHERE [FieldLabel] = 'Witness 1 First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ मधले नाव' WHERE [FieldLabel] = 'Witness 1 Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ आडनाव' WHERE [FieldLabel] = 'Witness 1 Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ पहिले नाव' WHERE [FieldLabel] = 'Witness 2 First Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ मधले नाव' WHERE [FieldLabel] = 'Witness 2 Middle Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ आडनाव' WHERE [FieldLabel] = 'Witness 2 Last Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'घोषणापत्र / मी सहमत आहे' WHERE [FieldLabel] = 'I hereby declare that the information provided is true and correct.';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ओळखपत्राचा प्रकार' WHERE [FieldLabel] = 'ID Proof Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ओळखपत्र क्रमांक' WHERE [FieldLabel] = 'ID Proof Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता क्रमांक / युपीआयसी निवडा' WHERE [FieldLabel] = 'Select Property No / UPIC';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'प्रभाग क्रमांक (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Ward (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'झोन (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Zone (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालकाचे नाव (प्रणालीद्वारे)' WHERE [FieldLabel] = 'Owner Name (Auto)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जागेचा प्रकार' WHERE [FieldLabel] = 'Premises Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जोडणीचा प्रकार' WHERE [FieldLabel] = 'Connection Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'वापराचा प्रकार' WHERE [FieldLabel] = 'Use Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'युनिट्सची संख्या (पर्यायी)' WHERE [FieldLabel] = 'No. of Units (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'सांडपाण्याची सध्याची व्यवस्था' WHERE [FieldLabel] = 'Current Wastewater Arrangement';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जवळच्या गटार लाईनपासून अंदाजे अंतर (मीटरमध्ये)' WHERE [FieldLabel] = 'Approx. distance to nearest sewer line (meters) (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता खोदाई आवश्यक आहे का?' WHERE [FieldLabel] = 'Road Cutting Required?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता खोदाईचे तपशील (पर्यायी)' WHERE [FieldLabel] = 'Road Cutting Details (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जुना जोडणी संदर्भ क्रमांक (पर्यायी)' WHERE [FieldLabel] = 'Old Connection Ref No (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय परवाना क्रमांक (पर्यायी)' WHERE [FieldLabel] = 'Trade License No (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसाय / व्यापाराचे नाव' WHERE [FieldLabel] = 'Business / Trade Name';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'कर्मचाऱ्यांची संख्या' WHERE [FieldLabel] = 'Number of Employees';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कर आकारणी उतारा क्रमांक' WHERE [FieldLabel] = 'Property Tax Assessment Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कर पावती क्रमांक' WHERE [FieldLabel] = 'Property Tax Receipt Number';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'व्यवसायाचा प्रकार' WHERE [FieldLabel] = 'Type of Activity';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'परवाना वर्ग' WHERE [FieldLabel] = 'Licensing Category';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवीन व्यवसाय परवाना प्रस्ताव?' WHERE [FieldLabel] = 'New Business Proposal?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'कामाच्या वेळा' WHERE [FieldLabel] = 'Working Hours';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'FSSAI परवाना क्रमांक (अन्न व्यापारासाठी)' WHERE [FieldLabel] = 'FSSAI License No. (For Food Trade)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साठवलेल्या मालाचे प्रकार' WHERE [FieldLabel] = 'Nature of Goods Stored / Traded';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ज्वलनशील / स्फोटक माल आहे का?' WHERE [FieldLabel] = 'Flammable/Explosive Goods?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'ज्वलनशील मालाचे तपशील' WHERE [FieldLabel] = 'Flammable Material Details';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अग्निशामक परवाना अद्ययावत आहे का?' WHERE [FieldLabel] = 'Fire NOC Up-to-date?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पोलीस परवाना सादर केला आहे का?' WHERE [FieldLabel] = 'Police NOC Submitted?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'भाग / परिसर' WHERE [FieldLabel] = 'Area / Locality';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लँडमार्क (जवळचे ठिकाण)' WHERE [FieldLabel] = 'Landmark';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'एकूण लांबी (मीटरमध्ये)' WHERE [FieldLabel] = 'Total Length (meters)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'गूगल मॅप लिंक (पर्यायी)' WHERE [FieldLabel] = 'Google Map Link (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदकाम पद्धत' WHERE [FieldLabel] = 'Method';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पृष्ठभाग प्रकार' WHERE [FieldLabel] = 'Surface Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदाई रुंदी (सेमी)' WHERE [FieldLabel] = 'Cutting Width (cm)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'खोदाई खोली (सेमी)' WHERE [FieldLabel] = 'Cutting Depth (cm)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रस्ता ओलांडण्याची संख्या (पर्यायी)' WHERE [FieldLabel] = 'No. of Road Crossings (optional)';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अपेक्षित सुरू तारीख' WHERE [FieldLabel] = 'Expected Start Date';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अपेक्षित अंतिम तारीख' WHERE [FieldLabel] = 'Expected End Date';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रहदारी व्यवस्थापन आवश्यक आहे का?' WHERE [FieldLabel] = 'Traffic Management Required?';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'बॅरिकेडिंग आणि सुरक्षा व्यवस्था' WHERE [FieldLabel] = 'Barricading & Safety Arrangement';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पुनर्स्थापना जबाबदारी' WHERE [FieldLabel] = 'Restoration Responsibility';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'पुनर्स्थापना प्रकार' WHERE [FieldLabel] = 'Restoration Type';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'हमीपत्र / स्वीकृती पत्र' WHERE [FieldLabel] = 'Undertaking / Indemnity Consent';

-- Document Upload translations
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवरदेवाच्या वयाचा पुरावा' WHERE [FieldLabel] = 'Groom Age Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'नवरीच्या वयाचा पुरावा' WHERE [FieldLabel] = 'Bride Age Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'लग्नपत्रिका' WHERE [FieldLabel] = 'Wedding Invitation Card';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार १ ओळख पुरावा' WHERE [FieldLabel] = 'Witness 1 ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'साक्षीदार २ ओळख पुरावा' WHERE [FieldLabel] = 'Witness 2 ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'रुग्णालयाचा डिस्चार्ज कार्ड दाखला' WHERE [FieldLabel] = 'Hospital Discharge Card';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'माहिती देणाऱ्याचा ओळख पुरावा' WHERE [FieldLabel] = 'Informant ID Proof';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मृत्यूचे कारण दर्शविणारा डॉक्टरांचा दाखला' WHERE [FieldLabel] = 'Doctor Certificate of Cause of Death';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'स्मशानभूमी किंवा दफनभूमीचा दाखला' WHERE [FieldLabel] = 'Cremation / Burial Ground Certificate';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'अर्जदाराच्या ओळखपत्राचा पुरावा' WHERE [FieldLabel] = 'Applicant ID Proof Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'मालमत्ता कराची पावती' WHERE [FieldLabel] = 'Property Tax Receipt Document';
UPDATE [RTS].[FieldDefinition] SET [FieldLabelLocal] = N'जागेचा नकाशा / आराखडा' WHERE [FieldLabel] = 'Premises Layout Map';
GO

-- =========================================================
-- RTS ApprovalFlowMaster Seed Data
-- Only for services with no redirect URL (internal RTS flow)
-- =========================================================
;WITH SeedApprovalFlows AS (
    SELECT * FROM (VALUES
        -- Dept 4: Town Planning
        (N'Town Planning',     N'Issuance of Zone Certificate',                          N'Zone Certificate Approval Flow'),
        (N'Town Planning',     N'Giving Part Map',                                       N'Part Map Issuance Flow'),
        (N'Town Planning',     N'Issuance of Construction Permit',                       N'Construction Permit Approval Flow'),
        (N'Town Planning',     N'Issuance of plinth certificate',                        N'Plinth Certificate Approval Flow'),
        (N'Town Planning',     N'Issuance of Occupancy Certificate',                     N'Occupancy Certificate Approval Flow'),
        (N'Town Planning',     N'Underground OFC Cable Permission',                      N'OFC Cable Permission Flow'),
        (N'Town Planning',     N'Filling Potholes on City Roads',                        N'Pothole Repair Request Flow'),
        (N'Town Planning',     N'Maintaining & Securing Sewer Covers',                   N'Sewer Cover Maintenance Request Flow'),
        (N'Town Planning',     N'Road Cutting Permission',                               N'Road Cutting Permission Flow'),
        (N'Town Planning',     N'Mobile Tower Permission',                               N'Mobile Tower Permission Flow'),
        -- Dept 5: Birth & Death
        (N'Birth & Death',     N'Birth Certificate',                                     N'Birth Certificate Issuance Flow'),
        (N'Birth & Death',     N'Death Certificate',                                     N'Death Certificate Issuance Flow'),
        -- Dept 6: Education
        (N'Education',         N'School Leaving / Duplicate Certificate',                N'School Leaving Certificate Flow'),
        (N'Education',         N'Issuance of transfer certificate',                      N'Transfer Certificate Issuance Flow'),
        (N'Education',         N'Issuance of duplicate mark sheet',                      N'Duplicate Mark Sheet Issuance Flow'),
        -- Dept 7: Health
        (N'Health',            N'Nursing home license under Registration Act, 1949',     N'Nursing Home License Approval Flow'),
        (N'Health',            N'Renewal of nursing home license',                       N'Nursing Home License Renewal Flow'),
        (N'Health',            N'Change of nursing home license holder / partner name',  N'Nursing Home License Holder Change Flow'),
        -- Dept 8: NOC
        (N'NOC',               N'Trade / Business Non-Revocation NOC',                   N'Trade NOC Approval Flow'),
        (N'NOC',               N'Mandap No-Damage Certificate',                          N'Mandap No-Damage Certificate Flow'),
        (N'NOC',               N'Fire Extinguisher Certificate',                         N'Fire Extinguisher Certificate Flow'),
        (N'NOC',               N'Final Fire Exemption Certificate',                      N'Fire Exemption Certificate Flow'),
        -- Dept 9: Marriage Certificate
        (N'Marriage Certificate', N'Marriage Registration Certificate',                  N'Marriage Registration Certificate Flow'),
        -- Dept 10: Tree
        (N'Tree',              N'Tree Felling Permission (Sec 8)',                        N'Tree Felling Permission Flow'),
        -- Dept 11: Sanitation
        (N'Sanitation',        N'Maintaining Manhole / Sewer Covers',                    N'Manhole Maintenance Request Flow'),
        (N'Sanitation',        N'Maintaining cleanliness',                               N'Cleanliness Complaint Flow'),
        (N'Sanitation',        N'Providing drainage connections',                        N'Drainage Connection Approval Flow')
    ) AS V (DeptName, SvcName, FlowName)
)
INSERT INTO [RTS].[ApprovalFlowMaster] ([ServiceId], [ApprovalFlowName], [IsActive], [CreatedBy], [CreatedDate])
SELECT Svc.Id, S.FlowName, 1, 0, GETDATE()
FROM SeedApprovalFlows S
INNER JOIN [RTS].[DepartmentMaster] D  ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster]    Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ApprovalFlowMaster] F
    WHERE F.ServiceId = Svc.Id AND F.IsActive = 1
);
GO

-- =========================================================
-- RTS ApprovalFlowStageMaster Seed Data
-- Inserts stages per flow using service name lookup
-- =========================================================
;WITH SeedStages AS (
    SELECT * FROM (VALUES
        -- Town Planning: Zone Certificate (3 stages)
        (N'Town Planning', N'Issuance of Zone Certificate',                         1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Zone Certificate',                         2, N'Technical Review (Junior Officer)',      2, 3, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Zone Certificate',                         3, N'Final Approval (Senior Officer)',        3, 2, 0,1,1,1,0,1),
        -- Town Planning: Giving Part Map (3 stages)
        (N'Town Planning', N'Giving Part Map',                                      1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Giving Part Map',                                      2, N'Survey Verification (Junior Officer)',   2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Giving Part Map',                                      3, N'Final Approval (Senior Officer)',        3, 3, 0,1,1,1,0,1),
        -- Town Planning: Construction Permit (3 stages)
        (N'Town Planning', N'Issuance of Construction Permit',                      1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Construction Permit',                      2, N'Site Inspection (Junior Officer)',       2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Construction Permit',                      3, N'Final Approval (Senior Officer)',        3, 3, 0,1,1,1,0,1),
        -- Town Planning: Plinth Certificate (3 stages)
        (N'Town Planning', N'Issuance of plinth certificate',                       1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of plinth certificate',                       2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of plinth certificate',                       3, N'Plinth Approval (Senior Officer)',       3, 2, 0,1,1,1,0,1),
        -- Town Planning: Occupancy Certificate (3 stages)
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    2, N'Structural Inspection (Junior Officer)', 2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Issuance of Occupancy Certificate',                    3, N'Occupancy Approval (Senior Officer)',    3, 3, 0,1,1,1,0,1),
        -- Town Planning: OFC Cable (3 stages)
        (N'Town Planning', N'Underground OFC Cable Permission',                     1, N'Application Review (Clerk)',             1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Underground OFC Cable Permission',                     2, N'Technical Review (Junior Officer)',      2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Underground OFC Cable Permission',                     3, N'Final Approval (Senior Officer)',        3, 2, 0,1,1,1,0,1),
        -- Town Planning: Potholes (2 stages)
        (N'Town Planning', N'Filling Potholes on City Roads',                       1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Town Planning', N'Filling Potholes on City Roads',                       2, N'Field Inspection (Junior Officer)',      2, 3, 0,1,1,0,0,1),
        -- Town Planning: Sewer Covers (2 stages)
        (N'Town Planning', N'Maintaining & Securing Sewer Covers',                  1, N'Request Registration (Clerk)',           1, 1, 0,0,0,0,0,0),
        (N'Town Planning', N'Maintaining & Securing Sewer Covers',                  2, N'Field Verification (Junior Officer)',    2, 3, 0,1,1,0,0,1),
        -- Town Planning: Road Cutting (3 stages)
        (N'Town Planning', N'Road Cutting Permission',                              1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Road Cutting Permission',                              2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Town Planning', N'Road Cutting Permission',                              3, N'Permission Grant (Senior Officer)',      3, 2, 0,1,1,1,0,1),
        -- Town Planning: Mobile Tower (3 stages)
        (N'Town Planning', N'Mobile Tower Permission',                              1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Town Planning', N'Mobile Tower Permission',                              2, N'Technical Review (Junior Officer)',      2, 7, 1,0,0,1,0,0),
        (N'Town Planning', N'Mobile Tower Permission',                              3, N'Final Approval (Senior Officer)',        3, 5, 0,1,1,1,0,1),
        -- Birth & Death: Birth Certificate (2 stages)
        (N'Birth & Death', N'Birth Certificate',                                    1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Birth & Death', N'Birth Certificate',                                    2, N'Registrar Approval',                    2, 2, 0,1,1,1,0,1),
        -- Birth & Death: Death Certificate (2 stages)
        (N'Birth & Death', N'Death Certificate',                                    1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Birth & Death', N'Death Certificate',                                    2, N'Registrar Approval',                    2, 2, 0,1,1,1,0,1),
        -- Education: School Leaving Certificate (2 stages)
        (N'Education',     N'School Leaving / Duplicate Certificate',               1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'School Leaving / Duplicate Certificate',               2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Education: Transfer Certificate (2 stages)
        (N'Education',     N'Issuance of transfer certificate',                     1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'Issuance of transfer certificate',                     2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Education: Duplicate Mark Sheet (2 stages)
        (N'Education',     N'Issuance of duplicate mark sheet',                     1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'Education',     N'Issuance of duplicate mark sheet',                     2, N'Head Teacher Approval',                 2, 2, 0,1,1,1,0,1),
        -- Health: Nursing Home License (3 stages)
        (N'Health',        N'Nursing home license under Registration Act, 1949',    1, N'Document Verification (Clerk)',          1, 3, 1,0,0,1,0,0),
        (N'Health',        N'Nursing home license under Registration Act, 1949',    2, N'Health Inspection (Junior Officer)',     2, 7, 1,0,0,1,0,0),
        (N'Health',        N'Nursing home license under Registration Act, 1949',    3, N'License Grant (Senior Officer)',         3, 5, 0,1,1,1,0,1),
        -- Health: Nursing Home Renewal (2 stages)
        (N'Health',        N'Renewal of nursing home license',                      1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Health',        N'Renewal of nursing home license',                      2, N'Renewal Approval (Senior Officer)',      3, 3, 0,1,1,1,0,1),
        -- Health: Nursing Home Holder Change (2 stages)
        (N'Health',        N'Change of nursing home license holder / partner name', 1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Health',        N'Change of nursing home license holder / partner name', 2, N'Change Approval (Senior Officer)',       3, 3, 0,1,1,1,0,1),
        -- NOC: Trade NOC (2 stages)
        (N'NOC',           N'Trade / Business Non-Revocation NOC',                  1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Trade / Business Non-Revocation NOC',                  2, N'NOC Approval (Senior Officer)',          3, 3, 0,1,1,1,0,1),
        -- NOC: Mandap No-Damage (2 stages)
        (N'NOC',           N'Mandap No-Damage Certificate',                         1, N'Application Verification (Clerk)',       1, 1, 1,0,0,1,0,0),
        (N'NOC',           N'Mandap No-Damage Certificate',                         2, N'Certificate Approval (Senior Officer)', 3, 2, 0,1,1,1,0,1),
        -- NOC: Fire Extinguisher Certificate (3 stages)
        (N'NOC',           N'Fire Extinguisher Certificate',                        1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Fire Extinguisher Certificate',                        2, N'Fire Inspection (Junior Officer)',       2, 3, 1,0,0,1,0,0),
        (N'NOC',           N'Fire Extinguisher Certificate',                        3, N'Certificate Approval (Senior Officer)', 3, 2, 0,1,1,1,0,1),
        -- NOC: Final Fire Exemption (3 stages)
        (N'NOC',           N'Final Fire Exemption Certificate',                     1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'NOC',           N'Final Fire Exemption Certificate',                     2, N'Fire Safety Inspection (Junior Officer)',2, 5, 1,0,0,1,0,0),
        (N'NOC',           N'Final Fire Exemption Certificate',                     3, N'Exemption Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1),
        -- Marriage Certificate (2 stages)
        (N'Marriage Certificate', N'Marriage Registration Certificate',             1, N'Document Verification (Clerk)',          1, 2, 1,0,0,1,0,0),
        (N'Marriage Certificate', N'Marriage Registration Certificate',             2, N'Registrar Approval',                    2, 3, 0,1,1,1,0,1),
        -- Tree: Tree Felling (3 stages)
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      2, N'Site Inspection (Junior Officer)',       2, 7, 1,0,0,1,0,0),
        (N'Tree',          N'Tree Felling Permission (Sec 8)',                      3, N'Permission Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1),
        -- Sanitation: Manhole (2 stages)
        (N'Sanitation',    N'Maintaining Manhole / Sewer Covers',                   1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Sanitation',    N'Maintaining Manhole / Sewer Covers',                   2, N'Field Verification (Junior Officer)',    2, 3, 0,1,1,0,0,1),
        -- Sanitation: Cleanliness (2 stages)
        (N'Sanitation',    N'Maintaining cleanliness',                              1, N'Complaint Registration (Clerk)',         1, 1, 0,0,0,0,0,0),
        (N'Sanitation',    N'Maintaining cleanliness',                              2, N'Field Verification (Junior Officer)',    2, 2, 0,1,1,0,0,1),
        -- Sanitation: Drainage (3 stages)
        (N'Sanitation',    N'Providing drainage connections',                       1, N'Application Verification (Clerk)',       1, 2, 1,0,0,1,0,0),
        (N'Sanitation',    N'Providing drainage connections',                       2, N'Site Inspection (Junior Officer)',       2, 5, 1,0,0,1,0,0),
        (N'Sanitation',    N'Providing drainage connections',                       3, N'Connection Approval (Senior Officer)',   3, 3, 0,1,1,1,0,1)
    ) AS V (DeptName, SvcName, StageOrder, StageName, EmployeeTypeId, SLADays,
            CanVerifyDocument, CanApprove, CanReject, CanReturn, CanPay, IsFinalStage)
)
INSERT INTO [RTS].[ApprovalFlowStageMaster]
    ([ApprovalFlowId], [StageOrder], [StageName], [EmployeeTypeId], [SLADays],
     [CanVerifyDocument], [CanApprove], [CanReject], [CanReturn], [CanPay], [IsFinalStage])
SELECT
    F.Id,
    S.StageOrder,
    S.StageName,
    S.EmployeeTypeId,
    S.SLADays,
    S.CanVerifyDocument,
    S.CanApprove,
    S.CanReject,
    S.CanReturn,
    S.CanPay,
    S.IsFinalStage
FROM SeedStages S
INNER JOIN [RTS].[DepartmentMaster] D   ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[ServiceMaster]    Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
INNER JOIN [RTS].[ApprovalFlowMaster] F ON F.ServiceId = Svc.Id AND F.IsActive = 1
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ApprovalFlowStageMaster] ST
    WHERE ST.ApprovalFlowId = F.Id AND ST.StageOrder = S.StageOrder
);
GO
