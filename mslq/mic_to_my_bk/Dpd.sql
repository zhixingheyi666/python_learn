if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Department]
GO

CREATE TABLE [dbo].[Department] (
	[DepName] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[DepID] [int] IDENTITY (1, 1) NOT NULL ,
	[Leader] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[grade] [varchar] (5) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsFinish] [int] NULL ,
	[Rgid] [int] NULL 
) ON [PRIMARY]
GO

