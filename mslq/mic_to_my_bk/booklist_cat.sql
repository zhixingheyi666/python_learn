if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookList]
GO

CREATE TABLE [dbo].[BookList] (
	[ISBN] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[BCid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[Writer] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[Epitome] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Pages] [int] NULL ,
	[Price] [real] NULL ,
	[PublishDate] [datetime] NULL ,
	[PageMode] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Version] [varchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[extName] [varchar] (70) COLLATE Chinese_PRC_CI_AS NULL ,
	[translator] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[keyword] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[PubID] [varchar] (13) COLLATE Chinese_PRC_CI_AS NULL ,
	[id] [int] NOT NULL ,
	[publish] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[adds] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Caste] [int] NULL 
) ON [PRIMARY]
GO

ISBN,  
BCid,  
Title,  
Writer,  
Epitome,  
Pages,  
Price,  
PublishDate,  
PageMode,  
Version,  
extName,  
translator,  
keyword,  
PubID,  
Number,  
frameNo,  
EnterDate,  
BcidSn,  
cbm,  
cbzz,  
PYTitle,  
PYWriter,  
PYTitleSZ,  


