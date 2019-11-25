USE [ProjektBD]
GO

/****** Object:  Table [dbo].[CONTRACTORS]    Script Date: 23.11.2019 21:42:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CONTRACTORS](
	[CONTRACTORID] [int] NOT NULL,
	[NAME] [varchar](255) NULL,
	[ADDRESS] [varchar](255) NULL,
	[EMAIL] [varchar](max) NOT NULL,
	[NIP] [bigint] NOT NULL,
	[BANKACCOUNT] [int] NULL,
	CONSTRAINT [CHK_NIP] CHECK (
		dbo.IsValidNip(NIP) = 1
	),
	CONSTRAINT CHK_EMAIL CHECK (
		dbo.IsValidEmail(EMAIL) = 1
	),
	CONSTRAINT [PK_CONTRACTORS] PRIMARY KEY CLUSTERED 
	(
		[CONTRACTORID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE INDEX INDX_NIP on dbo.CONTRACTORS(NIP)
