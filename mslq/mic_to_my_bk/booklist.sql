if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookList]
GO

CREATE TABLE [dbo].[BookList] (
	[ISBN] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[BCid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Title] [varchar] (180) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Writer] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[Epitome] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL ,
	[Pages] [int] NULL ,
	[Price] [real] NULL ,
	[PublishDate] [datetime] NULL ,
	[PageMode] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Version] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[extName] [varchar] (180) COLLATE Chinese_PRC_CI_AS NULL ,
	[translator] [varchar] (90) COLLATE Chinese_PRC_CI_AS NULL ,
	[keyword] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[PubID] [varchar] (13) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Number] [smallint] NULL ,
	[frameNo] [varchar] (7) COLLATE Chinese_PRC_CI_AS NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[BcidSn] [int] NULL ,
	[cbm] [varchar] (180) COLLATE Chinese_PRC_CI_AS NULL ,
	[cbzz] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYTitle] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYWriter] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[PYTitleSZ] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

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


select count(distinct id)  
from booklist; 
select count(id)  
from booklist; 


select count(distinct bcid)  
from booklist; 
select count(bcid)  
from booklist; 



