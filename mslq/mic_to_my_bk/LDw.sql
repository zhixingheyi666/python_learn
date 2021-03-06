if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LendWork]
GO

CREATE TABLE [dbo].[LendWork] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[boperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

