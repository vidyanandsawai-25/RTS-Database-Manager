-- ============================================================================
-- RTS Module Version 1.3.0 - Statutory Seeds (MRTSA 2015)
-- ============================================================================
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
DELETE FROM [RTS].[AppealFlowStageMaster];
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