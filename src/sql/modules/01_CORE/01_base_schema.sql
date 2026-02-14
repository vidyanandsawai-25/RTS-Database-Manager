

/****** Object:  Table [CORE].[MultilingualDetails]    Script Date: 10-01-2026 16:09:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for Table: [CORE].[MultilingualResource] ******/

CREATE TABLE [CORE].[MultilingualResource](
	[Id] int NOT NULL IDENTITY(1,1) NOT FOR REPLICATION,
	[Context] [nvarchar](256) NOT NULL,
	[Key] [nvarchar](256) NOT NULL,
	[English] [nvarchar](500) NOT NULL,
	[Hindi] [nvarchar](500) NOT NULL,
	[Marathi] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MultilingualResource_IsActive] DEFAULT (1),
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT DF_MultilingualResource_CreatedDate DEFAULT (GETDATE()),
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	CONSTRAINT [PK_MultilingualResource] PRIMARY KEY CLUSTERED ([Id] ASC) 
)
GO
------- End of Script ******/


  