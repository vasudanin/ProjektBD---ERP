USE [ProjektBD]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALEDOCUMENTPOSITION](
	SALEDOCUMENTPOSITIONID PRIMARY KEY IDENTITY(1,1),
	DOCUMENTID INT NOT NULL,
	PRODUCTID INT NOT NULL,
	VATRATEID TINYINT NOT NULL,
	NETSUM MONEY NOT NULL,
	GROSSSUM MONEY NOT NULL,
	FOREIGN KEY(DOCUMENTID) REFERENCES SALEDOCUMENT(DOCUMENTID),
	FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID),
	FOREIGN KEY(VATRATEID) REFERENCES VATRATE(VATRATEID),
	CONSTRAINT SDPOSITION_CHK_DOCUMENTID ( DOCUMENTID > 0 ),
	CONSTRAINT SDPOSITION_CHK_PRODUCTID ( PRODUCTID > 0 ),
	CONSTRAINT SDPOSITION_CHK_VATRATEID ( VATRATEID > 0 ),
	CONSTRAINT SDPOSITION_CHK_NETSUM ( NETSUM > 0 ),
	CONSTRAINT SDPOSITION_CHK_GROSSSUM ( GROSSSUM > 0 ),
) ON [PRIMARY]
GO