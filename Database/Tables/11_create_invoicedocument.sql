USE [ProjektBD]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INVOICEDOCUMENT](
	[DOCUMENTID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DOCUMENTNUMBER] [nvarchar](50) NOT NULL,
	[CONTRACTORID] [int] NOT NULL,
	[USERID] [int] NOT NULL,
	[MODDATE] [datetime] NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[INVOICEDATE] [datetime] NULL,
	[GROSSSUM] [money] NOT NULL,
	[NETSUM] [money] NOT NULL,
	FOREIGN KEY(USERID) REFERENCES USER(USERID),
	FOREIGN KEY(CONTRACTORID) REFERENCES CONTRACTOR(CONTRACTORID),
	CONSTRAINT INVOICEDOC_NETSUM CHECK ( NETSUM >0),
	CONSTRAINT INVOICEDOC_EMAIL CHECK ( dbo.IsValidEmail('EMAIL') = 1),
	CONSTRAINT INVOICEDOC_NIP CHECK ( dbo.IsValidNip('NIP') = 1)
) ON [PRIMARY]
GO