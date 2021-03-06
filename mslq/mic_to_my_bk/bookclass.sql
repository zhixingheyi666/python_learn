if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookClass]
GO

CREATE TABLE [dbo].[BookClass] (
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Clerk] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[price] [real] NOT NULL ,
	[sk] [smallint] NULL ,
	[inForm] [int] NULL ,
	[Ddid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

