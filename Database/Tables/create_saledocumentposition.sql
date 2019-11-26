USE [ProjektBD]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALEDOCUMENTPOSITION](
	SALEDOCUMENTPOSITIONID INT IDENTITY(1,1),
	DOCUMENTID INT NOT NULL,
	PRODUCTID INT NOT NULL,
	VATRATEID TINYINT NOT NULL,
	UNITPRICE MONEY NOT NULL,
	NETSUM MONEY NOT NULL,
	GROSSSUM MONEY NOT NULL,
	QUANTITY INT NOT NULL,
	FOREIGN KEY(DOCUMENTID) REFERENCES SALEDOCUMENT(DOCUMENTID),
	FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID),
	FOREIGN KEY(VATRATEID) REFERENCES VATRATE(VATRATEID),
	CONSTRAINT SDPOSITION_CHK_DOCUMENTID CHECK ( DOCUMENTID > 0 ),
	CONSTRAINT SDPOSITION_CHK_PRODUCTID CHECK ( PRODUCTID > 0 ),
	CONSTRAINT SDPOSITION_CHK_VATRATEID CHECK ( VATRATEID > 0 ),
	CONSTRAINT SDPOSITION_CHK_NETSUM CHECK ( NETSUM > 0 ),
	CONSTRAINT SDPOSITION_CHK_GROSSSUM CHECK ( GROSSSUM > 0 ),
	CONSTRAINT SDPOSITION_CHK_QUANTITY CHECK ( QUANTITY > 0 ),
	CONSTRAINT SDPOSITION_CHK_UNITPRICE CHECK ( UNITPRICE > 0 ),
	CONSTRAINT [PK_SALEDOCUMENTPOSITION] PRIMARY KEY CLUSTERED 
	(
		[SALEDOCUMENTPOSITIONID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO