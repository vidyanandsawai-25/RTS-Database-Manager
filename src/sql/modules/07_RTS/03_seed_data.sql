SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =========================================
-- RTS DepartmentMaster Seed Data
-- =========================================
;WITH SeedDepartments AS (
    SELECT * FROM (VALUES
        (N'Property Tax'),
        (N'Trade License'),
        (N'Water Connection'),
        (N'NOC'),
        (N'Birth & Death'),
        (N'Town Planning'),
        (N'Marriage Certificate'),
        (N'Education'),
        (N'Health'),
        (N'Sanitation'),
        (N'Tree'),
        (N'Hawkers'),
        (N'RTS Integration')
    ) AS V (DepartmentName)
)
INSERT INTO [RTS].[DepartmentMaster] ([DepartmentName], [DeptIcon], [IsActive], [CreatedBy], [CreatedDate])
SELECT S.DepartmentName, NULL, 1, 0, GETDATE()
FROM SeedDepartments S
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[DepartmentMaster] D WHERE D.DepartmentName = S.DepartmentName
);
GO


-- =========================================
-- RTS Services Seed Data
-- =========================================
;WITH SeedServices AS (
    SELECT * FROM (VALUES
        (N'Property Tax', 7176, N'New assessment', N'https://onesolutionakola.tabamc.in/selfAssessment/index'),
        (N'Property Tax', 7177, N'Re-assessment', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7178, N'Preparation of tax demand notice', N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate'),
        (N'Property Tax', 7179, N'Grant of tax exemption', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7180, N'Exemption from property tax', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7181, N'Self-assessment', N'https://onesolutionakola.tabamc.in/selfAssessment/index'),
        (N'Property Tax', 7182, N'Filing of objection', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7183, N'Sub-division of property', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7184, N'Re-assessment after demolition and reconstruction', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7185, N'Issuance of property tax extract', N'https://onesolutionakola.tabamc.in/Citizens/RaiseApplication'),
        (N'Property Tax', 7186, N'Issuance of no-dues certificate', N'https://onesolutionakola.tabamc.in/Citizens/DownLoadCertificate'),
        (N'Property Tax', 7187, N'Property transfer certificate based on document', N'https://onesolutionakola.tabamc.in/Citizens/MutationView'),
        (N'Property Tax', 7188, N'Property transfer certificate by inheritance', N'https://onesolutionakola.tabamc.in/Citizens/MutationView'),

        (N'Trade License', 7190, N'Obtaining new license', NULL),
        (N'Trade License', 7191, N'Renewal of license', NULL),
        (N'Trade License', 7192, N'Transfer of license', NULL),
        (N'Trade License', 7193, N'Issuance of duplicate copy of license', NULL),
        (N'Trade License', 7194, N'Change of business / establishment name', NULL),
        (N'Trade License', 7195, N'Change of business type', NULL),
        (N'Trade License', 7196, N'Change of name of license holder / partner', NULL),
        (N'Trade License', 7197, N'Addition / removal of partner in firm', NULL),
        (N'Trade License', 7198, N'Cancellation of license', NULL),
        (N'Trade License', 7199, N'Notice on renewal of expired license', NULL),
        (N'Trade License', 7200, N'Issuance of lodging house license', NULL),
        (N'Trade License', NULL, N'Renewal of lodging house license', NULL),
        (N'Trade License', NULL, N'Issuance of marriage hall / auditorium license', NULL),
        (N'Trade License', NULL, N'Renewal of marriage hall / auditorium license', NULL),

        (N'Water Connection', 7162, N'Change in water connection charges', NULL),
        (N'Water Connection', 7163, N'Temporary / permanent disconnection of water connection', NULL),
        (N'Water Connection', 7164, N'Reconnection', NULL),
        (N'Water Connection', 7165, N'Change of usage', NULL),
        (N'Water Connection', 7166, N'Preparation of water bill', NULL),
        (N'Water Connection', 7167, N'Issuance of plumber license', NULL),
        (N'Water Connection', 7168, N'Renewal of plumber license', NULL),
        (N'Water Connection', NULL, N'Issuance of no-dues certificate', NULL),
        (N'Water Connection', 7170, N'Complaint regarding faulty meter', NULL),
        (N'Water Connection', 7171, N'Complaint regarding unauthorized connection', NULL),
        (N'Water Connection', 7172, N'Complaint regarding water pressure', NULL),
        (N'Water Connection', 7173, N'Complaint regarding water quality', NULL),
        (N'Water Connection', 7174, N'Provision of water connection', NULL),
        (N'Water Connection', 7175, N'Provision of drainage connection', NULL),

        (N'NOC', NULL, N'NOC for trade / business / storage', NULL),
        (N'NOC', NULL, N'NOC for mandap (pandal)', NULL),
        (N'NOC', NULL, N'Issuance of fire NOC', NULL),
        (N'NOC', NULL, N'Issuance of final fire NOC', NULL),
        
        (N'Birth & Death', NULL, N'Issuance of birth certificate', NULL),
        (N'Birth & Death', NULL, N'Issuance of death certificate', NULL),
        
        (N'Town Planning', NULL, N'Issuance of zone certificate', NULL),
        (N'Town Planning', NULL, N'Issuance of part map', NULL),
        (N'Town Planning', NULL, N'Issuance of construction permit', NULL),
        (N'Town Planning', NULL, N'Issuance of plinth certificate', NULL),
        (N'Town Planning', NULL, N'Issuance of occupancy certificate', NULL),
        (N'Town Planning', NULL, N'Permission to lay underground telecom OFC cable', NULL),
        
        (N'Marriage Certificate', NULL, N'Issuance of marriage registration certificate', NULL),
        
        (N'Education', NULL, N'School leaving certificate and duplicate', NULL),
        (N'Education', NULL, N'Issuance of transfer certificate', NULL),
        (N'Education', NULL, N'Issuance of duplicate mark sheet', NULL),
        
        (N'Health', NULL, N'Nursing home license under Registration Act, 1949', NULL),
        (N'Health', NULL, N'Renewal of nursing home license', NULL),
        (N'Health', NULL, N'Change of nursing home license holder / partner', NULL),
        
        (N'Sanitation', NULL, N'Filling of potholes on roads', NULL),
        (N'Sanitation', NULL, N'Maintenance of drain covers', NULL),
        (N'Sanitation', NULL, N'Maintaining cleanliness', NULL),
        
        (N'Tree', NULL, N'Permission for tree felling under Trees Act, 1975', NULL),
        
        (N'Hawkers', NULL, N'Issuance of hawker registration certificate', NULL)
    ) AS V (DeptName, RTSServiceId, ServiceName, ServiceUrl)
)
INSERT INTO [RTS].[Services] ([DepartmentId], [RTSServiceId], [ServiceName], [ServiceUrl], [IsActive], [CreatedBy], [CreatedDate])
SELECT D.Id, S.RTSServiceId, S.ServiceName, S.ServiceUrl, 1, 0, GETDATE()
FROM SeedServices S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[Services] X WHERE X.DepartmentId = D.Id AND X.ServiceName = S.ServiceName
);
GO


-- =========================================
-- RTS FieldDefinition Seed Data
-- =========================================
;WITH SeedFieldDefinitions AS (
    SELECT * FROM (VALUES
        -- Section 1: Applicant Information
        (N'NOC', N'Issuance of final fire NOC', N'first_name', N'FirstName', N'First Name', N'Text', N'Applicant Information', NULL, NULL, N'required,maxlength:100', 1, 1, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'middle_name', N'MiddleName', N'Middle Name', N'Text', N'Applicant Information', NULL, NULL, N'maxlength:100', 0, 2, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'last_name', N'LastName', N'Last Name', N'Text', N'Applicant Information', NULL, NULL, N'required,maxlength:100', 1, 3, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'mobile_number', N'MobileNumber', N'Mobile Number', N'Mobile', N'Applicant Information', NULL, NULL, N'required,mobile,maxlength:10', 1, 4, NULL, NULL, 10),
        (N'NOC', N'Issuance of final fire NOC', N'aadhar_card_no', N'AadharCardNo', N'Aadhar Card No', N'Aadhaar', N'Applicant Information', NULL, NULL, N'required,aadhaar,maxlength:12', 1, 5, NULL, NULL, 12),
        (N'NOC', N'Issuance of final fire NOC', N'email', N'Email', N'Email', N'Email', N'Applicant Information', NULL, NULL, N'email,maxlength:100', 0, 6, NULL, NULL, 100),

        -- Section 2: Owner Details
        (N'NOC', N'Issuance of final fire NOC', N'owner_same_as_applicant', N'OwnerSameAsApplicant', N'Owner details same as Applicant', N'Checkbox', N'Owner Details', NULL, NULL, NULL, 0, 7, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'owner_first_name', N'OwnerFirstName', N'Owner First Name', N'Text', N'Owner Details', NULL, NULL, N'required,maxlength:100', 1, 8, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'owner_middle_name', N'OwnerMiddleName', N'Owner Middle Name', N'Text', N'Owner Details', NULL, NULL, N'maxlength:100', 0, 9, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'owner_last_name', N'OwnerLastName', N'Owner Last Name', N'Text', N'Owner Details', NULL, NULL, N'maxlength:100', 0, 10, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'owner_mobile_number', N'OwnerMobileNumber', N'Owner Mobile Number', N'Mobile', N'Owner Details', NULL, NULL, N'required,mobile,maxlength:10', 1, 11, NULL, NULL, 10),
        (N'NOC', N'Issuance of final fire NOC', N'owner_email', N'OwnerEmail', N'Owner Email', N'Email', N'Owner Details', NULL, NULL, N'email,maxlength:100', 0, 12, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'owner_aadhar_number', N'OwnerAadharNumber', N'Owner Aadhar Number', N'Aadhaar', N'Owner Details', NULL, NULL, N'required,aadhaar,maxlength:12', 1, 13, NULL, NULL, 12),
        (N'NOC', N'Issuance of final fire NOC', N'owner_pan_number', N'OwnerPANNumber', N'Owner PAN Number', N'PAN', N'Owner Details', NULL, NULL, N'pan,maxlength:10', 0, 14, NULL, NULL, 10),
        (N'NOC', N'Issuance of final fire NOC', N'owner_city', N'OwnerCity', N'Owner City', N'Text', N'Owner Details', NULL, NULL, N'required,maxlength:100', 1, 15, NULL, NULL, 100),
        (N'NOC', N'Issuance of final fire NOC', N'owner_state', N'OwnerState', N'Owner State', N'Text', N'Owner Details', NULL, NULL, N'required,maxlength:100', 1, 16, NULL, NULL, 100),

        -- Section 3: Business Activity & License Details
        (N'NOC', N'Issuance of final fire NOC', N'type_of_activity', N'TypeOfActivity', N'Type of Activity', N'Dropdown', N'Business Activity & License Details', N'["Food","Chemical","Retail","Industrial"]', NULL, N'required', 1, 17, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'new_business_proposal', N'NewBusinessProposal', N'New Business Proposal', N'Dropdown', N'Business Activity & License Details', N'["Yes","No"]', NULL, N'required', 1, 18, NULL, NULL, NULL),

        -- Section 4: Storage, Safety & Hazard Details
        (N'NOC', N'Issuance of final fire NOC', N'nature_of_goods', N'NatureOfGoodsStoredTraded', N'Nature of Goods Stored / Traded', N'Dropdown', N'Storage, Safety & Hazard Details', N'["Food Grains","Perishable Goods","Non-Perishable Goods","Textiles / Cloth","Electronics","Machinery / Equipment","Chemicals","Construction Material","Fertilizers","Hazardous Goods","Mixed / Multiple Goods","Others"]', NULL, N'required', 1, 19, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'flammable_explosive_goods', N'FlammableExplosiveGoods', N'Flammable/Explosive Goods?', N'Dropdown', N'Storage, Safety & Hazard Details', N'["Yes","No"]', NULL, N'required', 1, 20, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'flammable_material_details', N'FlammableMaterialDetails', N'Flammable Material Details', N'Textarea', N'Storage, Safety & Hazard Details', NULL, NULL, N'maxlength:500', 0, 21, NULL, NULL, 500),

        -- Section 5: Compliance & Approval Details
        (N'NOC', N'Issuance of final fire NOC', N'fire_noc_up_to_date', N'FireNOCUpToDate', N'Fire NOC Up-to-date?', N'Dropdown', N'Compliance & Approval Details', N'["Yes","No"]', NULL, N'required', 1, 22, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'police_noc_submitted', N'PoliceNOCSubmitted', N'Police NOC Submitted?', N'Dropdown', N'Compliance & Approval Details', N'["Yes","No"]', NULL, N'required', 1, 23, NULL, NULL, NULL),

        -- Section 6: Documents
        (N'NOC', N'Issuance of final fire NOC', N'ownership_rent_agreement', N'OwnershipRentAgreement', N'Ownership / Rent Agreement', N'File', N'Documents', NULL, NULL, N'required,file:pdf,jpg,jpeg,png,maxsize:5mb', 1, 24, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'latest_property_tax_receipt', N'LatestPropertyTaxReceipt', N'Latest Property Tax Receipt', N'File', N'Documents', NULL, NULL, N'required,file:pdf,jpg,jpeg,png,maxsize:5mb', 1, 25, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'proposed_plan_architect_signed', N'ProposedPlanArchitectSigned', N'Proposed Plan (Architect Signed)', N'File', N'Documents', NULL, NULL, N'required,file:pdf,jpg,jpeg,png,maxsize:5mb', 1, 26, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'fire_noc_certificate', N'FireNOCCertificate', N'Fire NOC Certificate', N'File', N'Documents', NULL, NULL, N'file:pdf,jpg,jpeg,png,maxsize:5mb', 0, 27, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'police_noc_certificate', N'PoliceNoObjectionCertificate', N'Police No-Objection Certificate', N'File', N'Documents', NULL, NULL, N'file:pdf,jpg,jpeg,png,maxsize:5mb', 0, 28, NULL, NULL, NULL),
        (N'NOC', N'Issuance of final fire NOC', N'owner_id_proof', N'OwnerIDProof', N'Owner ID Proof', N'File', N'Documents', NULL, NULL, N'required,file:pdf,jpg,jpeg,png,maxsize:5mb', 1, 29, NULL, NULL, NULL),

        -- Section 7: Declaration
        (N'NOC', N'Issuance of final fire NOC', N'declaration_acceptance', N'DeclarationAcceptance', N'I hereby declare that the information provided is true and correct.', N'Checkbox', N'Declaration', NULL, NULL, N'required', 1, 30, NULL, NULL, NULL)
    ) AS V (DeptName, SvcName, FieldCode, FieldName, FieldLabel, FieldType, FieldGroup, OptionsJson, DefaultValue, ValidationRules, IsRequired, DisplayOrder, MinValue, MaxValue, MaxLength)
)
INSERT INTO [RTS].[FieldDefinition] (
    [DepartmentId], [ServiceId], [FieldCode], [FieldName], [FieldLabel], [FieldType], [FieldGroup], 
    [OptionsJson], [DefaultValue], [ValidationRules], [IsRequired], [DisplayOrder], 
    [MinValue], [MaxValue], [MaxLength], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT D.Id, Svc.Id, S.FieldCode, S.FieldName, S.FieldLabel, S.FieldType, S.FieldGroup, 
       S.OptionsJson, S.DefaultValue, S.ValidationRules, S.IsRequired, S.DisplayOrder, 
       S.MinValue, S.MaxValue, S.MaxLength, 1, 0, 0, GETDATE()
FROM SeedFieldDefinitions S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[Services] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldDefinition] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.FieldCode = S.FieldCode
);
GO


-- =========================================
-- RTS ApplicationDetails Seed Data
-- =========================================
;WITH SeedApplications AS (
    SELECT * FROM (VALUES
        (N'Education', N'School leaving certificate and duplicate', 3425, N'Submitted'),
        (N'Water Connection', N'Temporary / permanent disconnection of water connection', 3452, N'Submitted')
    ) AS V (DeptName, SvcName, OwnerId, ApplicationStatus)
)
INSERT INTO [RTS].[ApplicationDetails] ([DepartmentId], [ServiceId], [OwnerId], [ApplicationStatus], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate])
SELECT D.Id, Svc.Id, S.OwnerId, S.ApplicationStatus, 1, 0, 0, GETDATE()
FROM SeedApplications S
INNER JOIN [RTS].[DepartmentMaster] D ON D.DepartmentName = S.DeptName
INNER JOIN [RTS].[Services] Svc ON Svc.DepartmentId = D.Id AND Svc.ServiceName = S.SvcName
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[ApplicationDetails] X 
    WHERE X.DepartmentId = D.Id AND X.ServiceId = Svc.Id AND X.OwnerId = S.OwnerId
);
GO


-- =========================================
-- RTS FieldValue Seed Data
-- =========================================
;WITH SeedFieldValues AS (
    SELECT * FROM (VALUES
        (N'first_name', N'first_name', N'Aditya Fatke', NULL, NULL, NULL, NULL),
        (N'middle_name', N'middle_name', N'Kumar', NULL, NULL, NULL, NULL),
        (N'last_name', N'last_name', N'Fatke', NULL, NULL, NULL, NULL),
        (N'mobile_number', N'mobile_number', N'9876543210', NULL, NULL, NULL, NULL),
        (N'aadhar_card_no', N'aadhar_card_no', N'123412341234', NULL, NULL, NULL, NULL),
        (N'email', N'email', N'aditya@example.com', NULL, NULL, NULL, NULL)
    ) AS V (FieldCode, FieldName, TextValue, NumberValue, DateValue, BooleanValue, DocumentGuid)
)
INSERT INTO [RTS].[FieldValue] (
    [ApplicationId], [FieldDefinitionId], [FieldName], [TextValue], [NumberValue], [DateValue], [BooleanValue], [DocumentGuid], [IsActive], [MarkedForDeletion], [CreatedBy], [CreatedDate]
)
SELECT App.Id, FD.Id, S.FieldName, S.TextValue, S.NumberValue, S.DateValue, S.BooleanValue, S.DocumentGuid, 1, 0, 0, GETDATE()
FROM SeedFieldValues S
CROSS JOIN (
    SELECT TOP 1 Id 
    FROM [RTS].[ApplicationDetails] 
    WHERE DepartmentId = (SELECT Id FROM [RTS].[DepartmentMaster] WHERE DepartmentName = 'Education')
) App
INNER JOIN [RTS].[FieldDefinition] FD ON FD.FieldCode = S.FieldCode
WHERE NOT EXISTS (
    SELECT 1 FROM [RTS].[FieldValue] X WHERE X.ApplicationId = App.Id AND X.FieldDefinitionId = FD.Id
);
GO
