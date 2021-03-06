if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Reader]
GO

CREATE TABLE [dbo].[Reader] (
	[Name] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[DepID] [int] NOT NULL ,
	[Picture] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[isFine] [tinyint] NULL ,
	[isGs] [tinyint] NULL ,
	[IsFinish] [tinyint] NULL ,
	[Rgid] [int] NULL ,
	[GuestPassWord] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

