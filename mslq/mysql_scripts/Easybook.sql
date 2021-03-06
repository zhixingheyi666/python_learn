if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAVSn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAVSn]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetBookSn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetBookSn]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetRid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetRid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsLogUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsLogUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_text]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[get_text]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_textok]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[get_textok]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidInSkName]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidInSkName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLendName]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLendName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[plist]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[plist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qknrView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qknrView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[AVLending]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLendCount]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLendCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLending]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BooksInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BooksInSk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Lending]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendingInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[LendingInSk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NotLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[NotLending]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NotLendingInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[NotLendingInSk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReaderInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[ReaderInSk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcidinsk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bcidinsk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcidsumlend]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bcidsumlend]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkLendIng]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qkLendIng]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AADP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AADP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AADW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AADW]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AALendWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AALendWork]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AARD]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVClass]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVLend]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVLend]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Alendwork07]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Alendwork07]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Alendwork10]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Alendwork10]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BadList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BadList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BarCode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BarCode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookClass]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookOut]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookOut]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BorrowRightGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BorrowRightList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bulletin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Bulletin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CardStyle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CardStyle]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DDCCLC4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DDCCLC4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DDlist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DDlist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Department]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FindInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FindInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FineList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FineList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FromList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FromList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InfoList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InfoList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LendWork]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lendqk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Lendqk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LogUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LogUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LostCard]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LostCard]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MarginSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MarginSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MyComputerList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MyComputerList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBook]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZD]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZDRid]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZDRid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZDState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZDState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Nofine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Nofine]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OpRecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OpRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OtherSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OtherSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Preengage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Preengage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrinterSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PrinterSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Publish]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Publish]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Qklist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Qklist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Reader]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveQk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SaveQk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SoftVersion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SoftVersion]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SysInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SysInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpRid]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TmpRid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bcode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcodelist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bcodelist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[classical]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[classical]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dygl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dygl]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dyqkList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dyqkList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[holidays]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[holidays]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[hsgx]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hsgx]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[infomation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[infomation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[information]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[information]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[intro]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[intro]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcff]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcpc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcpc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcrk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcrk]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[kqList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[kqList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[libraryname]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[libraryname]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mytmptext]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mytmptext]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[newtextinfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[newtextinfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nrList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[nrList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[opentime]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[opentime]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pubfile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[pubfile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qa]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qaState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qaState]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkFindInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkFindInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkOut]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkOut]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkflhhz]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkflhhz]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qknrList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qknrList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[skList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[skList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smField]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smField]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[xhpic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[xhpic]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ybkset]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ybkset]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zdBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zdBook]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zkTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zkTable]
GO

CREATE TABLE [dbo].[AADP] (
	[DepName] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[Leader] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[grade] [varchar] (5) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsFinish] [int] NULL ,
	[Rgid] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AADW] (
	[Bcid] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[translator] [varchar] (90) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AALendWork] (
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

CREATE TABLE [dbo].[AARD] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Name] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
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

CREATE TABLE [dbo].[AVClass] (
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Clerk] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[price] [real] NOT NULL ,
	[sk] [smallint] NOT NULL ,
	[inFrom] [int] NULL ,
	[ddid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AVLend] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[boperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AVList] (
	[ISBN] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[BCid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Title] [varchar] (180) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Writer] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[Epitome] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[LongTime] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Price] [money] NULL ,
	[PublishDate] [datetime] NULL ,
	[PageMode] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[stuffer] [varchar] (180) COLLATE Chinese_PRC_CI_AS NULL ,
	[matter] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Version] [varchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[extName] [varchar] (180) COLLATE Chinese_PRC_CI_AS NULL ,
	[Translator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[keyword] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[PubLish] [varchar] (180) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[pubAdds] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[Number] [int] NOT NULL ,
	[frameNo] [varchar] (7) COLLATE Chinese_PRC_CI_AS NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[BcidSn] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Alendwork07] (
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

CREATE TABLE [dbo].[Alendwork10] (
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

CREATE TABLE [dbo].[BadList] (
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Epitome] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[badDate] [datetime] NULL ,
	[Operator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BarCode] (
	[State] [smallint] NOT NULL ,
	[MaxLen] [smallint] NOT NULL ,
	[Ident] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IdentLen] [smallint] NOT NULL ,
	[maxid] [int] NULL ,
	[Nums] [int] NULL ,
	[TSide] [int] NULL ,
	[LSide] [int] NULL ,
	[LSpace] [int] NULL ,
	[CSpace] [int] NULL ,
	[WithName] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[TwinBar] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[RSide] [int] NULL ,
	[BSide] [int] NULL 
) ON [PRIMARY]
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

CREATE TABLE [dbo].[BookGroup] (
	[gid] [varchar] (4) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[groupName] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
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

CREATE TABLE [dbo].[BookOut] (
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[OutDate] [datetime] NULL ,
	[State] [tinyint] NULL ,
	[Epitome] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Clerk] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BookState] (
	[State] [varchar] (8) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BorrowRightGroup] (
	[Rgid] [int] IDENTITY (1, 1) NOT NULL ,
	[RgName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[canOrder] [tinyint] NOT NULL ,
	[MaxPreen] [smallint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BorrowRightList] (
	[Rgid] [int] NOT NULL ,
	[Rlid] [int] IDENTITY (1, 1) NOT NULL ,
	[RightList] [varchar] (26) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[MaxDays] [smallint] NOT NULL ,
	[MaxBooks] [smallint] NOT NULL ,
	[penalty] [money] NOT NULL ,
	[State] [smallint] NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Bulletin] (
	[id1] [int] NULL ,
	[Title1] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Date1] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CardStyle] (
	[LSide] [int] NULL ,
	[TSide] [int] NULL ,
	[RSide] [int] NULL ,
	[BSide] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DDCCLC4] (
	[DDC] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[CLC4] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DDlist] (
	[DDid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[zdDate] [datetime] NOT NULL ,
	[Fid] [int] NOT NULL ,
	[IsZd] [tinyint] NOT NULL ,
	[Clerk] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
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

CREATE TABLE [dbo].[FindInfo] (
	[code] [tinyint] NULL ,
	[Cname] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[type] [tinyint] NULL ,
	[ShowWidth] [smallint] NULL ,
	[ImeMode] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FineList] (
	[FineDate] [datetime] NULL ,
	[FindState] [tinyint] NULL ,
	[Fine] [real] NULL ,
	[OpName] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[FootNote] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[FineID] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FromList] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[FromName] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InfoList] (
	[FromPc] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[TargetPc] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[Info] [varchar] (300) COLLATE Chinese_PRC_CI_AS NULL ,
	[time1] [datetime] NULL 
) ON [PRIMARY]
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

CREATE TABLE [dbo].[Lendqk] (
	[Sqkid] [int] NOT NULL ,
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[Loperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[BackDate] [datetime] NULL ,
	[boperator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReturnDate] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LogUser] (
	[Name] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[IDKey] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Operator] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Rights] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[SavePaper] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[AutoCenter] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[iRatio] [int] NULL ,
	[CardWidth] [int] NULL ,
	[CardHeight] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LostCard] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LostDate] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MarginSet] (
	[Section] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[RTopM] [int] NULL ,
	[RLeftM] [int] NULL ,
	[YCenter] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[Y1] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MyComputerList] (
	[ComputerName] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NewBook] (
	[id1] [int] NULL ,
	[Title1] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Date1] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NewBookZD] (
	[number] [int] NULL ,
	[Title] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[Writer] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[ISBN] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[KeyWord] [varchar] (160) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NewBookZDRid] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NewBookZDState] (
	[Claim1] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[State1] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Nofine] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Fine] [real] NULL ,
	[FineDate] [datetime] NULL ,
	[State] [tinyint] NULL ,
	[FootNote] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OpRecord] (
	[Time] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Action] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[Operator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OtherSet] (
	[str1] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str2] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str3] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str4] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str5] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str6] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Preengage] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[PreeDate] [datetime] NULL ,
	[Bid] [varchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsReader] [tinyint] NULL ,
	[Kind] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PrinterSet] (
	[Section] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PrinterName] [varchar] (150) COLLATE Chinese_PRC_CI_AS NULL ,
	[PaperSize] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[PaperLength] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[PaperWidth] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Orientation] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[BinIndex] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Publish] (
	[PubId] [varchar] (13) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Publish] [varchar] (180) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Adds] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Qklist] (
	[yfdh] [varchar] (6) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ISSN] [varchar] (9) COLLATE Chinese_PRC_CI_AS NULL ,
	[CN] [varchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Name] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[mprice] [money] NULL ,
	[lprice] [money] NULL ,
	[kqid] [smallint] NOT NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
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

CREATE TABLE [dbo].[SaveQk] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[qkid] [int] NOT NULL ,
	[ICount] [int] NOT NULL ,
	[State] [smallint] NOT NULL ,
	[Price] [money] NOT NULL ,
	[sk] [int] NOT NULL ,
	[Clerk] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[SqkCode] [char] (17) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SoftVersion] (
	[Version] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[CompileDate] [varchar] (8) COLLATE Chinese_PRC_CI_AS NULL ,
	[BkupPath] [varchar] (300) COLLATE Chinese_PRC_CI_AS NULL ,
	[str1] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str2] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str3] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str4] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[str5] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SysInfo] (
	[Mention] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[MaxLimit] [int] NULL ,
	[LimitKey] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ErrOperations] [int] NULL ,
	[MaxHistory] [int] NULL ,
	[xs] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[cs] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[gs] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TmpRid] (
	[Rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bcode] (
	[Name] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Code] [varchar] (8) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bcodelist] (
	[code] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[name] [varchar] (160) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[rank] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[classical] (
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dygl] (
	[date1] [datetime] NULL ,
	[depname] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[name] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[rid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[fy] [int] NULL ,
	[dy] [int] NULL ,
	[bz] [varchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dyqkList] (
	[yfdh] [varchar] (6) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[issn] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[cn] [varchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[name] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[year] [varchar] (4) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[kqid] [smallint] NOT NULL ,
	[dyDate] [int] NOT NULL ,
	[bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[dys] [int] NULL ,
	[publish] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[inDate] [datetime] NOT NULL ,
	[dyz] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[isQk] [tinyint] NOT NULL ,
	[isHD] [tinyint] NULL ,
	[lxprice] [money] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[holidays] (
	[UseHoliday] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[HolidayFrom] [datetime] NULL ,
	[HolidayTo] [datetime] NULL ,
	[HolidayReturn] [datetime] NULL ,
	[str1] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[str2] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[str3] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str4] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[str5] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[hsgx] (
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[userid] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[infomation] (
	[nid] [int] IDENTITY (1, 1) NOT NULL ,
	[ntitle] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ncontent] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[ptime] [datetime] NULL ,
	[ntype] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[information] (
	[nid] [int] IDENTITY (1, 1) NOT NULL ,
	[ntitle] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[ncontent] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[ptime] [datetime] NULL ,
	[ntype] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[intro] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ztitle] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[zcontent] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[type] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[jcff] (
	[pcid] [int] NULL ,
	[jcid] [int] NULL ,
	[yfs] [int] NULL ,
	[sfs] [int] NULL ,
	[lqr] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[ffr] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[iddisp] [int] NULL ,
	[ffrq] [datetime] NULL ,
	[depname] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jcpc] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[pcname] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[iddisp] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[jcrk] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[iddisp] [int] NULL ,
	[pc] [int] NULL ,
	[jcname] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[rkr] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[rkrq] [datetime] NULL ,
	[rks] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[kqList] (
	[kqid] [smallint] NOT NULL ,
	[kqName] [varchar] (6) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[kqsj] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[libraryname] (
	[UserName] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Serial] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[SN1] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[SN2] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[SN3] [datetime] NULL ,
	[MentionDays] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mytmptext] (
	[seq_no] [int] IDENTITY (1, 1) NOT NULL ,
	[text_chunk] [text] COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[newtextinfo] (
	[seq_no] [int] NOT NULL ,
	[text_chunk] [varchar] (255) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[nrList] (
	[Name] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[opentime] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ititle] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[startt] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[pubfile] (
	[filename] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[lines] [int] NULL ,
	[date] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qa] (
	[id1] [int] NULL ,
	[qafrom] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title1] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Date1] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qaState] (
	[State1] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qkFindInfo] (
	[code] [tinyint] NOT NULL ,
	[Cname] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[FileName] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[type] [tinyint] NULL ,
	[ShowWidth] [smallint] NULL ,
	[ImeMode] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qkOut] (
	[dyqkid] [int] NOT NULL ,
	[OutDate] [datetime] NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Epitome] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Clerk] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qkflhhz] (
	[hz] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[qknrList] (
	[Title] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Writer] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[KeyWord] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[lr] [varchar] (250) COLLATE Chinese_PRC_CI_AS NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[keyid] [int] NULL ,
	[SqkCode] [char] (17) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[skList] (
	[skName] [varchar] (60) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[sk] [smallint] IDENTITY (1, 1) NOT NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[smField] (
	[Code] [smallint] NOT NULL ,
	[smID] [int] NOT NULL ,
	[smSort] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[smGroup] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[smName] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Operator] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[term] [datetime] NULL ,
	[EditDate] [datetime] NOT NULL ,
	[State] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[smList] (
	[smBcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[smid] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[xhpic] (
	[picture] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[left1] [int] NULL ,
	[top1] [int] NULL ,
	[right1] [int] NULL ,
	[bottom1] [int] NULL ,
	[WithXh] [int] NULL ,
	[AutoZoom] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ybkset] (
	[AutoLY] [varchar] (60) COLLATE Chinese_PRC_CI_AS NULL ,
	[YXWJ] [varchar] (2) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[zdBook] (
	[zdBcid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Bcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ISBN] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[Title] [varchar] (180) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Writer] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[zds] [int] NOT NULL ,
	[yds] [int] NOT NULL ,
	[ddid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Price] [money] NOT NULL ,
	[iscc] [tinyint] NOT NULL ,
	[pubid] [varchar] (13) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewBcid] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[zkTable] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[zkid] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[zkDate] [datetime] NOT NULL ,
	[tsfrom] [varchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[djhm] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[bz] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[zs1] [int] NULL ,
	[cs1] [int] NULL ,
	[je1] [money] NULL ,
	[zs2] [int] NULL ,
	[cs2] [int] NULL ,
	[je2] [money] NULL ,
	[zs3] [int] NULL ,
	[cs3] [int] NULL ,
	[je3] [money] NULL ,
	[zs4] [int] NULL ,
	[cs4] [int] NULL ,
	[je4] [money] NULL ,
	[zs5] [int] NULL ,
	[cs5] [int] NULL ,
	[je5] [money] NULL ,
	[isCount] [tinyint] NULL ,
	[zkyear] [varchar] (4) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW AVLending AS
 SELECT Department.DepName, Reader.Name, Reader.Rid, AVLend.bid, AVList.BCid, AVList.Title, AVLend.LendDate, AVLend.ReturnDate, Reader.Depid,AVList.Price,Department.grade
 FROM (AVLend JOIN AVList ON AVLend.Bcid = AVList.Bcid) JOIN (Department JOIN Reader ON Department.DepID = Reader.DepID) ON AVLend.Rid = Reader.Rid WHERE AVLend.BackDate is Null

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW BcidLendCount(Sums,BCid) AS
SELECT Count(*), LendWork.BCid
FROM LendWork GROUP BY LendWork.BCid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW BcidLending(SumLend,code) AS
SELECT count(LendWork.Bid), SubString(LendWork.BCid,1,1)
FROM LendWork Where LendWork.BackDate IS NULL
GROUP BY SubString(LendWork.BCid,1,1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW BooksInSk(sk,Bcid,Number,Price) AS 
 Select sk,Bcid,count(Bid),Sum(price) 
 From BookClass  Where state < 2  Group By Bcid,sk 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW Lending AS
SELECT Department.DepName, Reader.Name, Reader.Rid, LendWork.bid, BookList.BCid, BookList.Title, LendWork.LendDate, LendWork.ReturnDate, Reader.Depid,BookList.Price,Department.grade
FROM (LendWork INNER JOIN BookList ON LendWork.Bcid = BookList.Bcid) INNER JOIN (Department INNER JOIN Reader ON Department.DepID = Reader.DepID) ON LendWork.Rid = Reader.Rid
WHERE ((LendWork.BackDate) Is Null)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW LendingInSk(SumLend,sk,code) AS 
 SELECT count(Bid),sk, SubString(BCid,1,1) 
 From BookClass Where State = 1 GROUP BY SubString(BCid,1,1),sk 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW NotLending(sumlend,code) AS
SELECT count(Bid), SubString(BCid,1,1)
FROM BookClass WHERE State<>1
GROUP BY SubString(BCid,1,1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW NotLendingInSk(SumLend,sk,code) AS 
 SELECT count(Bid),sk, SubString(BCid,1,1) 
 From BookClass  Where State <> 1  GROUP BY SubString(BCid,1,1),sk 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW ReaderInSk AS select Lenddate,sk,Rid from LendWork,BookClass Where LendWork.bid=BookClass.bid Group By Lenddate,sk,Rid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW bcidinsk(code,SumLend,sk) AS 
 SELECT substring(bcid,1,1),count(Bcid),sk 
 FROM BookClass Where state<2 
 GROUP BY substring(bcid,1,1),sk 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW bcidsumlend(code,SumLend) AS
SELECT substring(bcid,1,1),Sum(BookList.Number) 
FROM BookList GROUP BY substring(bcid,1,1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW qkLendIng(DepName,Name,Rid,LendDate,Title,Bid,Bcid,Depid,BackDate,ReturnDate,grade) AS
 SELECT Department.DepName, Reader.Name, Lendqk.Rid, Lendqk.LendDate, dyQkList.name, dyQkList.year, SaveQk.ICount,department.Depid,BackDate,ReturnDate,Department.grade
 From Department, dyqklist, LendQk, Reader, saveqk
 Where Reader.DepID = Department.DepID And LendQk.Rid = Reader.Rid And saveqk.qkid = dyqklist.id And saveqk.id = LendQk.Sqkid And LendQk.BackDate Is Null

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW BcidInSkName(Code,Name,SumLend,sk ) AS 
 SELECT bcode.Code,bcode.Name, BcidInSk.SumLend,sk 
 FROM bcode,BcidInSk WHERE bcode.Code = BcidInSk.code

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW BcidLendName AS
SELECT bcode.Code, bcode.Name,bcidsumlend.SumLend
FROM bcode,bcidsumlend WHERE bcode.Code = bcidsumlend.code

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW plist(publish,ISBN, BCid,Title,Writer,Pages,Price,PublishDate,PageMode,Version,extName,translator,keyword,PubID,Number,frameNo,EnterDate,Epitome,cbm,cbzz,PYTitle,PYWriter,PYTitleSZ) AS 
 SELECT publish.publish, booklist.ISBN, booklist.BCid, booklist.Title, booklist.Writer, booklist.Pages, booklist.Price, booklist.PublishDate, booklist.PageMode,
 booklist.Version, booklist.extName, booklist.translator, booklist.keyword, booklist.PubID, booklist.Number, booklist.frameNo, booklist.EnterDate, booklist.Epitome,booklist.cbm,booklist.cbzz,booklist.PYTitle,booklist.PYWriter,booklist.PYTitleSZ
FROM booklist LEFT JOIN publish ON booklist.pubid = publish.pubid

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW qknrView(Name,qky,qkm,SqkCode,Title,Writer,KeyWord,Keyid,lr,lrid) AS
 Select DISTINCT name,dyqklist.year,saveqk.icount,Saveqk.sqkCode,Title,Writer,KeyWord,Keyid,lr,qknrList.id
 From dyqklist, saveqk, qknrList
 Where dyqklist.id = saveqk.qkid And saveqk.sqkCode = qknrList.sqkCode

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE GetAVSn @BCID varchar(30) AS
 BEGIN
   DECLARE AVSn SCROLL CURSOR FOR
    SELECT DISTINCT BcidSn AS sn FROM AVList WHERE Bcid LIKE @bcid+'/%'  and BcidSn>0 ORDER BY BcidSn
   Open AVSn
   Declare @sn int,@row int,@a char(10)
   select @sn=0,@row=1
   fetch first from AVSn into @sn
   while (@@Fetch_status<>-1)
    begin 
      if (@@Fetch_status<>-2)
      begin
        if @sn<>@row
        begin
          goto ok
        end
        select @row=@row+1
      end
      fetch next from AVSn into @sn
    end
   ok:
   close AVSn
   deallocate AVSn
   select @row
 END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

 CREATE PROCEDURE GetBookSn 
 @BCID varchar(30) 
 AS 
 BEGIN 
 DECLARE scorecursor SCROLL CURSOR FOR 
 SELECT DISTINCT BcidSn AS sn FROM BOOKLIST WHERE BCID LIKE @bcid+'/%' and BcidSn>0 ORDER BY bcidSn 
 OPEN scorecursor 
 DECLARE @sn int,@row int,@a char(10) 
 SELECT @sn=0,@row=1 
 FETCH FIRST FROM scorecursor INTO @sn 
 WHILE (@@Fetch_status<>-1) 
 BEGIN 
 IF (@@Fetch_status<>-2) 
 BEGIN 
 IF @sn<>@row 
 BEGIN 
 GoTo finish 
 End 
 SELECT @row=@row+1 
 End 
 FETCH NEXT FROM scorecursor INTO @sn 
 End 
 finish: 
 Close scorecursor 
 DEALLOCATE scorecursor
 SELECT 'aa'=@ROW 
 End 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE GetRid @Token char(1) AS
   declare @i1 int,@len int,@nmax int,@c1 varchar(10),@c2 varchar(10)

   select @len=convert(int,str1) from OtherSet
   select @c1='S1000000'
   select @c2='S1000000'
   select @nmax=9999999

   if @len>10 select @len=10

   while (len(@c1)<@len)
     begin
       select @c1=@c1+'0'
       select @c2=@c2+'0'
       select @nmax=@nmax*10+9
     end

   if (select count(*) from reader where rid like @Token+'%')>0
    begin
      select @c1=max(rid) from reader where rid like @Token+'%'
    end
   if (select count(*) from TmpRid where rid like @Token+'%')>0
    begin
      select @c2=max(rid) from TmpRid where rid like @Token+'%'
    end
   if @c1<@c2
    begin
     select @c1=@c2
    end

   select @i1=convert(int,substring(@c1,2,len(@c1))) 
   select @c2=@Token+convert(char(10),@i1+1)
   if (select count(*) from LostCard where Rid=@c2)>0 
    begin
      select @i1=@nmax
    end
      
   if @i1=@nmax
    begin
      select @i1=(@nmax+1)/10
      select @c2=@Token+convert(char(10),@i1+1)
      while (((select count(*) from reader where Rid=@c2)>0) or ((select count(*) from TmpRid where Rid=@c2)>0) or ((select count(*) from LostCard where Rid=@c2)>0)) and (@Token<>'[')
        begin
          select @i1=@i1+1
          select @c2=@Token+convert(char(10),@i1+1)
          if (@i1=@nmax)
           begin
             select @i1=(@nmax+1)/10
             select @Token=char(ascii(@Token)+1)
             select @c2=@Token+convert(char(10),@i1+1)
           end
        end
    end

   select @c1=convert(char(10),@i1+1)

   while (len(@c1)<@len-1)
     begin
       select @c1='0'+@c1
     end

   select 'aa'=@Token+@c1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE InsLogUser @Name char(30),@IDKey varchar(10),@Operator varchar(10),@Rights varchar(60),@SavePaper char(1),@AutoCenter char(1),@iRatio int,@CardWidth int,@CardHeight int AS
 if exists(select * from LogUser where Name=@Name) update LogUser set IDKey=@IDKey,Operator=@Operator,Rights=@Rights,SavePaper=@SavePaper,AutoCenter=@AutoCenter,iRatio=@iRatio,CardWidth=@CardWidth,CardHeight=@CardHeight 
 where Name=@Name else insert into LogUser values(@Name,@IDKey,@Operator,@Rights,@SavePaper,@AutoCenter,@iRatio,@CardWidth,@CardHeight)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE get_text @t_id varchar(12) 
 AS
  declare @mytextptr varbinary(16),@totalsize int,
    @lastread int,@readsize int
   begin tran
    select @mytextptr=TEXTPTR(Picture),@totalsize=DATALENGTH(Picture),@lastread=0,
     @readsize=CASE when(255<DATALENGTH(Picture)) then 255 else DATALENGTH(Picture) end
      from Reader (HOLDLOCK) where Rid=@t_id
    if @mytextptr is not NULL and @readsize>0
      while (@lastread<@totalsize)
       begin
         if ((@readsize+@lastread)>@totalsize)
          select @readsize=@totalsize-@lastread
         READTEXT Reader.Picture @mytextptr @lastread @readsize
         if (@@ERROR<>0) break
         select @lastread=@lastread+@readsize
       end
   commit tran

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE get_textok @t_id varchar(12)
  AS
   
  delete mytmptext
  delete newtextinfo
  insert mytmptext
    EXEC get_text @t_id 
  insert newtextinfo(seq_no,text_chunk)
    select seq_no,convert(varchar(255),text_chunk) 
      from mytmptext

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

