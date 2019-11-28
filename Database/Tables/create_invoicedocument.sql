USE [ProjektBD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INVOICEDOCUMENT](
	[DOCUMENTID] [int] IDENTITY(1,1) NOT NULL,
	[DOCUMENTNUMBER] [nvarchar](50) NOT NULL DEFAULT NEXT VALUE FOR INVOICEDOCNUBMERSEQ;
	[CONTRACTORID] [int] NOT NULL,
	[USERID] [int] NOT NULL,
	[MODDATE] [datetime] NOT NULL DEFAULT GETDATE(),
	[CREATEDATE] [datetime] NOT NULL DEFAULT GETDATE(),
	[INVOICEDATE] [datetime] NULL,
	[GROSSSUM] [money] NOT NULL,
	[NETSUM] [money] NOT NULL,
	FOREIGN KEY(USERID) REFERENCES USERS(USERID),
	FOREIGN KEY(CONTRACTORID) REFERENCES CONTRACTOR(CONTRACTORID),
	CONSTRAINT INVOICEDOC_NETSUM CHECK ( NETSUM >0),
	CONSTRAINT [PK_INVOICEDOCUMENT] PRIMARY KEY CLUSTERED 
	(
		[DOCUMENTID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO