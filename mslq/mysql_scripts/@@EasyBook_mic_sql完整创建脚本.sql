/****** Object:  Database EasyBook    Script Date: 2016/12/24 17:50:37 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'EasyBook')
	DROP DATABASE [EasyBook]
GO

CREATE DATABASE [EasyBook]  ON (NAME = N'EasyBook_Data', FILENAME = N'D:\MicroSQL_STUDY\MSSQL$STUDY0A\Data\EasyBook.MDF' , SIZE = 31, FILEGROWTH = 10%) LOG ON (NAME = N'EasyBook_log', FILENAME = N'D:\MicroSQL_STUDY\MSSQL$STUDY0A\Data\EasyBook_LOG.LDF' , SIZE = 19, FILEGROWTH = 10%)
GO

exec sp_dboption N'EasyBook', N'autoclose', N'false'
GO

exec sp_dboption N'EasyBook', N'bulkcopy', N'false'
GO

exec sp_dboption N'EasyBook', N'trunc. log', N'true'
GO

exec sp_dboption N'EasyBook', N'torn page detection', N'false'
GO

exec sp_dboption N'EasyBook', N'read only', N'false'
GO

exec sp_dboption N'EasyBook', N'dbo use', N'false'
GO

exec sp_dboption N'EasyBook', N'single', N'false'
GO

exec sp_dboption N'EasyBook', N'autoshrink', N'false'
GO

exec sp_dboption N'EasyBook', N'ANSI null default', N'false'
GO

exec sp_dboption N'EasyBook', N'recursive triggers', N'false'
GO

exec sp_dboption N'EasyBook', N'ANSI nulls', N'false'
GO

exec sp_dboption N'EasyBook', N'concat null yields null', N'false'
GO

exec sp_dboption N'EasyBook', N'cursor close on commit', N'false'
GO

exec sp_dboption N'EasyBook', N'default to local cursor', N'false'
GO

exec sp_dboption N'EasyBook', N'quoted identifier', N'false'
GO

exec sp_dboption N'EasyBook', N'ANSI warnings', N'false'
GO

exec sp_dboption N'EasyBook', N'auto create statistics', N'true'
GO

exec sp_dboption N'EasyBook', N'auto update statistics', N'true'
GO

if( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
	exec sp_dboption N'EasyBook', N'db chaining', N'false'
GO

use [EasyBook]
GO

/****** Object:  Trigger dbo.AVClass_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVClass_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[AVClass_delete]
GO

/****** Object:  Trigger dbo.AVClass_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVClass_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[AVClass_insert]
GO

/****** Object:  Trigger dbo.AVClass_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVClass_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[AVClass_update]
GO

/****** Object:  Trigger dbo.AVList_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVList_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[AVList_delete]
GO

/****** Object:  Trigger dbo.AVList_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVList_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[AVList_update]
GO

/****** Object:  Trigger dbo.BookClass_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookClass_delete]
GO

/****** Object:  Trigger dbo.BookClass_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookClass_insert]
GO

/****** Object:  Trigger dbo.BookClass_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookClass_update]
GO

/****** Object:  Trigger dbo.BookList_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookList_delete]
GO

/****** Object:  Trigger dbo.BookList_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookList_insert]
GO

/****** Object:  Trigger dbo.BookList_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BookList_update]
GO

/****** Object:  Trigger dbo.BorrowRightGroup_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightGroup_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BorrowRightGroup_delete]
GO

/****** Object:  Trigger dbo.BorrowRightList_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightList_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BorrowRightList_delete]
GO

/****** Object:  Trigger dbo.BorrowRightList_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightList_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[BorrowRightList_insert]
GO

/****** Object:  Trigger dbo.DDList_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DDList_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[DDList_update]
GO

/****** Object:  Trigger dbo.Department_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Department_delete]
GO

/****** Object:  Trigger dbo.Department_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Department_update]
GO

/****** Object:  Trigger dbo.FromList_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FromList_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[FromList_delete]
GO

/****** Object:  Trigger dbo.LendWork_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendWork_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[LendWork_insert]
GO

/****** Object:  Trigger dbo.Publish_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Publish_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Publish_delete]
GO

/****** Object:  Trigger dbo.Publish_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Publish_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Publish_update]
GO

/****** Object:  Trigger dbo.Reader_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Reader_insert]
GO

/****** Object:  Trigger dbo.Reader_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Reader_update]
GO

/****** Object:  Trigger dbo.Reader_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[Reader_delete]
GO

/****** Object:  Trigger dbo.SaveQk_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveQk_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[SaveQk_delete]
GO

/****** Object:  Trigger dbo.DyqkList_Delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DyqkList_Delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[DyqkList_Delete]
GO

/****** Object:  Trigger dbo.kqList_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[kqList_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[kqList_delete]
GO

/****** Object:  Trigger dbo.nrList_Delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nrList_Delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[nrList_Delete]
GO

/****** Object:  Trigger dbo.sklist_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sklist_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[sklist_delete]
GO

/****** Object:  Trigger dbo.smfield_insert    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smfield_insert]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[smfield_insert]
GO

/****** Object:  Trigger dbo.smGroup_Delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smGroup_Delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[smGroup_Delete]
GO

/****** Object:  Trigger dbo.zdBook_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zdBook_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[zdBook_delete]
GO

/****** Object:  Trigger dbo.zdBook_update    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zdBook_update]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[zdBook_update]
GO

/****** Object:  Trigger dbo.zktable_delete    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zktable_delete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[zktable_delete]
GO

/****** Object:  Stored Procedure dbo.GetRid    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetRid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetRid]
GO

/****** Object:  Stored Procedure dbo.InsLogUser    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsLogUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[InsLogUser]
GO

/****** Object:  Stored Procedure dbo.get_textok    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_textok]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[get_textok]
GO

/****** Object:  Stored Procedure dbo.GetAVSn    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetAVSn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetAVSn]
GO

/****** Object:  Stored Procedure dbo.GetBookSn    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetBookSn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetBookSn]
GO

/****** Object:  Stored Procedure dbo.get_text    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_text]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[get_text]
GO

/****** Object:  View dbo.BcidInSkName    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidInSkName]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidInSkName]
GO

/****** Object:  View dbo.BcidLendName    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLendName]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLendName]
GO

/****** Object:  View dbo.plist    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[plist]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[plist]
GO

/****** Object:  View dbo.qknrView    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qknrView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qknrView]
GO

/****** Object:  View dbo.AVLending    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[AVLending]
GO

/****** Object:  View dbo.BcidLendCount    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLendCount]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLendCount]
GO

/****** Object:  View dbo.BcidLending    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLending]
GO

/****** Object:  View dbo.BooksInSk    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BooksInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BooksInSk]
GO

/****** Object:  View dbo.Lending    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Lending]
GO

/****** Object:  View dbo.LendingInSk    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendingInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[LendingInSk]
GO

/****** Object:  View dbo.NotLending    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NotLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[NotLending]
GO

/****** Object:  View dbo.NotLendingInSk    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NotLendingInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[NotLendingInSk]
GO

/****** Object:  View dbo.ReaderInSk    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReaderInSk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[ReaderInSk]
GO

/****** Object:  View dbo.bcidinsk    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcidinsk]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bcidinsk]
GO

/****** Object:  View dbo.bcidsumlend    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcidsumlend]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[bcidsumlend]
GO

/****** Object:  View dbo.qkLendIng    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkLendIng]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qkLendIng]
GO

/****** Object:  Table [dbo].[AADP]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AADP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AADP]
GO

/****** Object:  Table [dbo].[AADW]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AADW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AADW]
GO

/****** Object:  Table [dbo].[AALendWork]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AALendWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AALendWork]
GO

/****** Object:  Table [dbo].[AARD]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AARD]
GO

/****** Object:  Table [dbo].[AVClass]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVClass]
GO

/****** Object:  Table [dbo].[AVLend]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVLend]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVLend]
GO

/****** Object:  Table [dbo].[AVList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AVList]
GO

/****** Object:  Table [dbo].[Alendwork07]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Alendwork07]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Alendwork07]
GO

/****** Object:  Table [dbo].[Alendwork10]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Alendwork10]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Alendwork10]
GO

/****** Object:  Table [dbo].[BadList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BadList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BadList]
GO

/****** Object:  Table [dbo].[BarCode]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BarCode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BarCode]
GO

/****** Object:  Table [dbo].[BookClass]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookClass]
GO

/****** Object:  Table [dbo].[BookGroup]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookGroup]
GO

/****** Object:  Table [dbo].[BookList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookList]
GO

/****** Object:  Table [dbo].[BookOut]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookOut]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookOut]
GO

/****** Object:  Table [dbo].[BookState]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BookState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BookState]
GO

/****** Object:  Table [dbo].[BorrowRightGroup]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BorrowRightGroup]
GO

/****** Object:  Table [dbo].[BorrowRightList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowRightList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BorrowRightList]
GO

/****** Object:  Table [dbo].[Bulletin]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bulletin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Bulletin]
GO

/****** Object:  Table [dbo].[CardStyle]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CardStyle]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CardStyle]
GO

/****** Object:  Table [dbo].[DDCCLC4]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DDCCLC4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DDCCLC4]
GO

/****** Object:  Table [dbo].[DDlist]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DDlist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DDlist]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Department]
GO

/****** Object:  Table [dbo].[FindInfo]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FindInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FindInfo]
GO

/****** Object:  Table [dbo].[FineList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FineList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FineList]
GO

/****** Object:  Table [dbo].[FromList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FromList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FromList]
GO

/****** Object:  Table [dbo].[InfoList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InfoList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InfoList]
GO

/****** Object:  Table [dbo].[LendWork]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LendWork]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LendWork]
GO

/****** Object:  Table [dbo].[Lendqk]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Lendqk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Lendqk]
GO

/****** Object:  Table [dbo].[LogUser]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LogUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LogUser]
GO

/****** Object:  Table [dbo].[LostCard]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LostCard]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LostCard]
GO

/****** Object:  Table [dbo].[MarginSet]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MarginSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MarginSet]
GO

/****** Object:  Table [dbo].[MyComputerList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MyComputerList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MyComputerList]
GO

/****** Object:  Table [dbo].[NewBook]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBook]
GO

/****** Object:  Table [dbo].[NewBookZD]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZD]
GO

/****** Object:  Table [dbo].[NewBookZDRid]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZDRid]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZDRid]
GO

/****** Object:  Table [dbo].[NewBookZDState]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[NewBookZDState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[NewBookZDState]
GO

/****** Object:  Table [dbo].[Nofine]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Nofine]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Nofine]
GO

/****** Object:  Table [dbo].[OpRecord]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OpRecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OpRecord]
GO

/****** Object:  Table [dbo].[OtherSet]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OtherSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OtherSet]
GO

/****** Object:  Table [dbo].[Preengage]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Preengage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Preengage]
GO

/****** Object:  Table [dbo].[PrinterSet]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrinterSet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PrinterSet]
GO

/****** Object:  Table [dbo].[Publish]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Publish]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Publish]
GO

/****** Object:  Table [dbo].[Qklist]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Qklist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Qklist]
GO

/****** Object:  Table [dbo].[Reader]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reader]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Reader]
GO

/****** Object:  Table [dbo].[SaveQk]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SaveQk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SaveQk]
GO

/****** Object:  Table [dbo].[SoftVersion]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SoftVersion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SoftVersion]
GO

/****** Object:  Table [dbo].[SysInfo]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SysInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SysInfo]
GO

/****** Object:  Table [dbo].[TmpRid]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TmpRid]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TmpRid]
GO

/****** Object:  Table [dbo].[bcode]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bcode]
GO

/****** Object:  Table [dbo].[bcodelist]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[bcodelist]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[bcodelist]
GO

/****** Object:  Table [dbo].[classical]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[classical]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[classical]
GO

/****** Object:  Table [dbo].[dygl]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dygl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dygl]
GO

/****** Object:  Table [dbo].[dyqkList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dyqkList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dyqkList]
GO

/****** Object:  Table [dbo].[holidays]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[holidays]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[holidays]
GO

/****** Object:  Table [dbo].[hsgx]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[hsgx]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hsgx]
GO

/****** Object:  Table [dbo].[infomation]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[infomation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[infomation]
GO

/****** Object:  Table [dbo].[information]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[information]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[information]
GO

/****** Object:  Table [dbo].[intro]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[intro]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[intro]
GO

/****** Object:  Table [dbo].[jcff]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcff]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcff]
GO

/****** Object:  Table [dbo].[jcpc]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcpc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcpc]
GO

/****** Object:  Table [dbo].[jcrk]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jcrk]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jcrk]
GO

/****** Object:  Table [dbo].[kqList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[kqList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[kqList]
GO

/****** Object:  Table [dbo].[libraryname]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[libraryname]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[libraryname]
GO

/****** Object:  Table [dbo].[mytmptext]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[mytmptext]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[mytmptext]
GO

/****** Object:  Table [dbo].[newtextinfo]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[newtextinfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[newtextinfo]
GO

/****** Object:  Table [dbo].[nrList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nrList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[nrList]
GO

/****** Object:  Table [dbo].[opentime]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[opentime]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[opentime]
GO

/****** Object:  Table [dbo].[pubfile]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pubfile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[pubfile]
GO

/****** Object:  Table [dbo].[qa]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qa]
GO

/****** Object:  Table [dbo].[qaState]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qaState]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qaState]
GO

/****** Object:  Table [dbo].[qkFindInfo]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkFindInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkFindInfo]
GO

/****** Object:  Table [dbo].[qkOut]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkOut]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkOut]
GO

/****** Object:  Table [dbo].[qkflhhz]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qkflhhz]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qkflhhz]
GO

/****** Object:  Table [dbo].[qknrList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qknrList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[qknrList]
GO

/****** Object:  Table [dbo].[skList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[skList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[skList]
GO

/****** Object:  Table [dbo].[smField]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smField]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smField]
GO

/****** Object:  Table [dbo].[smGroup]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smGroup]
GO

/****** Object:  Table [dbo].[smList]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[smList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[smList]
GO

/****** Object:  Table [dbo].[xhpic]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[xhpic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[xhpic]
GO

/****** Object:  Table [dbo].[ybkset]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ybkset]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ybkset]
GO

/****** Object:  Table [dbo].[zdBook]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zdBook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zdBook]
GO

/****** Object:  Table [dbo].[zkTable]    Script Date: 2016/12/24 17:50:40 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zkTable]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zkTable]
GO

/****** Object:  Login BookUser    Script Date: 2016/12/24 17:50:37 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'BookUser')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'EasyBook', @loginlang = N'简体中文'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'BookUser', null, @logindb, @loginlang
END
GO

/****** Object:  User BookUser    Script Date: 2016/12/24 17:50:37 ******/
if not exists (select * from dbo.sysusers where name = N'BookUser')
	EXEC sp_grantdbaccess N'BookUser'
GO

/****** Object:  User dbo    Script Date: 2016/12/24 17:50:37 ******/
/****** Object:  User guest    Script Date: 2016/12/24 17:50:37 ******/
if not exists (select * from dbo.sysusers where name = N'guest' and hasdbaccess = 1)
	EXEC sp_grantdbaccess N'guest'
GO

/****** Object:  User BookUser    Script Date: 2016/12/24 17:50:37 ******/
exec sp_addrolemember N'db_owner', N'BookUser'
GO

/****** Object:  Table [dbo].[AADP]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AADP] (
	[DepName] [varchar] (60) NULL ,
	[Leader] [varchar] (30) NULL ,
	[grade] [varchar] (5) NULL ,
	[IsFinish] [int] NULL ,
	[Rgid] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AADW]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AADW] (
	[Bcid] [varchar] (60) NOT NULL ,
	[translator] [varchar] (90) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AALendWork]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AALendWork] (
	[Rid] [varchar] (20) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) NOT NULL ,
	[boperator] [varchar] (30) NULL ,
	[bid] [varchar] (16) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AARD]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AARD] (
	[Rid] [varchar] (20) NOT NULL ,
	[Name] [varchar] (30) NOT NULL ,
	[DepID] [int] NOT NULL ,
	[Picture] [text] NULL ,
	[isFine] [tinyint] NULL ,
	[isGs] [tinyint] NULL ,
	[IsFinish] [tinyint] NULL ,
	[Rgid] [int] NULL ,
	[GuestPassWord] [varchar] (10) NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AVClass]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AVClass] (
	[Bcid] [varchar] (20) NOT NULL ,
	[Bid] [varchar] (16) NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Clerk] [varchar] (30) NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[price] [real] NOT NULL ,
	[sk] [smallint] NOT NULL ,
	[inFrom] [int] NULL ,
	[ddid] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AVLend]    Script Date: 2016/12/24 17:50:40 ******/
CREATE TABLE [dbo].[AVLend] (
	[Rid] [varchar] (20) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) NOT NULL ,
	[boperator] [varchar] (30) NULL ,
	[Bid] [varchar] (16) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AVList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[AVList] (
	[ISBN] [varchar] (30) NULL ,
	[BCid] [varchar] (20) NOT NULL ,
	[Title] [varchar] (180) NOT NULL ,
	[Writer] [varchar] (80) NULL ,
	[Epitome] [varchar] (200) NULL ,
	[LongTime] [varchar] (10) NULL ,
	[Price] [money] NULL ,
	[PublishDate] [datetime] NULL ,
	[PageMode] [varchar] (30) NULL ,
	[stuffer] [varchar] (180) NULL ,
	[matter] [varchar] (20) NULL ,
	[Version] [varchar] (8) NULL ,
	[extName] [varchar] (180) NULL ,
	[Translator] [varchar] (30) NULL ,
	[keyword] [varchar] (60) NULL ,
	[PubLish] [varchar] (180) NOT NULL ,
	[pubAdds] [varchar] (60) NULL ,
	[Number] [int] NOT NULL ,
	[frameNo] [varchar] (7) NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[BcidSn] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Alendwork07]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Alendwork07] (
	[Rid] [varchar] (20) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) NOT NULL ,
	[boperator] [varchar] (30) NULL ,
	[bid] [varchar] (16) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Alendwork10]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Alendwork10] (
	[Rid] [varchar] (20) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) NOT NULL ,
	[boperator] [varchar] (30) NULL ,
	[bid] [varchar] (16) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BadList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BadList] (
	[Bid] [varchar] (16) NOT NULL ,
	[Epitome] [varchar] (80) NULL ,
	[badDate] [datetime] NULL ,
	[Operator] [varchar] (30) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BarCode]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BarCode] (
	[State] [smallint] NOT NULL ,
	[MaxLen] [smallint] NOT NULL ,
	[Ident] [varchar] (50) NULL ,
	[IdentLen] [smallint] NOT NULL ,
	[maxid] [int] NULL ,
	[Nums] [int] NULL ,
	[TSide] [int] NULL ,
	[LSide] [int] NULL ,
	[LSpace] [int] NULL ,
	[CSpace] [int] NULL ,
	[WithName] [char] (1) NULL ,
	[TwinBar] [char] (1) NULL ,
	[RSide] [int] NULL ,
	[BSide] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookClass]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BookClass] (
	[Bcid] [varchar] (20) NOT NULL ,
	[Bid] [varchar] (16) NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Clerk] [varchar] (30) NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[price] [real] NOT NULL ,
	[sk] [smallint] NULL ,
	[inForm] [int] NULL ,
	[Ddid] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookGroup]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BookGroup] (
	[gid] [varchar] (4) NOT NULL ,
	[groupName] [varchar] (40) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BookList] (
	[ISBN] [varchar] (30) NULL ,
	[BCid] [varchar] (20) NOT NULL ,
	[Title] [varchar] (180) NOT NULL ,
	[Writer] [varchar] (80) NULL ,
	[Epitome] [varchar] (800) NULL ,
	[Pages] [int] NULL ,
	[Price] [real] NULL ,
	[PublishDate] [datetime] NULL ,
	[PageMode] [varchar] (30) NULL ,
	[Version] [varchar] (30) NULL ,
	[extName] [varchar] (180) NULL ,
	[translator] [varchar] (90) NULL ,
	[keyword] [varchar] (60) NULL ,
	[PubID] [varchar] (13) NOT NULL ,
	[Number] [smallint] NULL ,
	[frameNo] [varchar] (7) NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[BcidSn] [int] NULL ,
	[cbm] [varchar] (180) NULL ,
	[cbzz] [varchar] (80) NULL ,
	[PYTitle] [varchar] (200) NULL ,
	[PYWriter] [varchar] (200) NULL ,
	[PYTitleSZ] [varchar] (40) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookOut]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BookOut] (
	[Bid] [varchar] (16) NOT NULL ,
	[OutDate] [datetime] NULL ,
	[State] [tinyint] NULL ,
	[Epitome] [varchar] (100) NULL ,
	[Clerk] [varchar] (30) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BookState]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BookState] (
	[State] [varchar] (8) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BorrowRightGroup]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BorrowRightGroup] (
	[Rgid] [int] IDENTITY (1, 1) NOT NULL ,
	[RgName] [varchar] (50) NOT NULL ,
	[canOrder] [tinyint] NOT NULL ,
	[MaxPreen] [smallint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BorrowRightList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[BorrowRightList] (
	[Rgid] [int] NOT NULL ,
	[Rlid] [int] IDENTITY (1, 1) NOT NULL ,
	[RightList] [varchar] (26) NOT NULL ,
	[MaxDays] [smallint] NOT NULL ,
	[MaxBooks] [smallint] NOT NULL ,
	[penalty] [money] NOT NULL ,
	[State] [smallint] NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Bulletin]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Bulletin] (
	[id1] [int] NULL ,
	[Title1] [varchar] (200) NULL ,
	[Content1] [varchar] (1000) NULL ,
	[Date1] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CardStyle]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[CardStyle] (
	[LSide] [int] NULL ,
	[TSide] [int] NULL ,
	[RSide] [int] NULL ,
	[BSide] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DDCCLC4]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[DDCCLC4] (
	[DDC] [varchar] (20) NULL ,
	[CLC4] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DDlist]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[DDlist] (
	[DDid] [varchar] (10) NOT NULL ,
	[zdDate] [datetime] NOT NULL ,
	[Fid] [int] NOT NULL ,
	[IsZd] [tinyint] NOT NULL ,
	[Clerk] [varchar] (10) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Department] (
	[DepName] [varchar] (60) NULL ,
	[DepID] [int] IDENTITY (1, 1) NOT NULL ,
	[Leader] [varchar] (30) NULL ,
	[grade] [varchar] (5) NULL ,
	[IsFinish] [int] NULL ,
	[Rgid] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FindInfo]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[FindInfo] (
	[code] [tinyint] NULL ,
	[Cname] [varchar] (20) NULL ,
	[FileName] [varchar] (20) NULL ,
	[type] [tinyint] NULL ,
	[ShowWidth] [smallint] NULL ,
	[ImeMode] [tinyint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FineList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[FineList] (
	[FineDate] [datetime] NULL ,
	[FindState] [tinyint] NULL ,
	[Fine] [real] NULL ,
	[OpName] [varchar] (30) NULL ,
	[FootNote] [varchar] (80) NULL ,
	[FineID] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FromList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[FromList] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[FromName] [varchar] (60) NOT NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InfoList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[InfoList] (
	[FromPc] [varchar] (250) NULL ,
	[TargetPc] [varchar] (250) NULL ,
	[Info] [varchar] (300) NULL ,
	[time1] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LendWork]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[LendWork] (
	[Rid] [varchar] (20) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[ReturnDate] [datetime] NOT NULL ,
	[BackDate] [datetime] NULL ,
	[loperator] [varchar] (30) NOT NULL ,
	[boperator] [varchar] (30) NULL ,
	[bid] [varchar] (16) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Lendqk]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Lendqk] (
	[Sqkid] [int] NOT NULL ,
	[Rid] [varchar] (20) NOT NULL ,
	[LendDate] [datetime] NOT NULL ,
	[Loperator] [varchar] (30) NOT NULL ,
	[BackDate] [datetime] NULL ,
	[boperator] [varchar] (30) NULL ,
	[ReturnDate] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LogUser]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[LogUser] (
	[Name] [varchar] (30) NOT NULL ,
	[IDKey] [varchar] (10) NULL ,
	[Operator] [varchar] (10) NOT NULL ,
	[Rights] [varchar] (60) NULL ,
	[SavePaper] [char] (1) NULL ,
	[AutoCenter] [char] (1) NULL ,
	[iRatio] [int] NULL ,
	[CardWidth] [int] NULL ,
	[CardHeight] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LostCard]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[LostCard] (
	[Rid] [varchar] (20) NOT NULL ,
	[LostDate] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MarginSet]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[MarginSet] (
	[Section] [varchar] (100) NULL ,
	[RTopM] [int] NULL ,
	[RLeftM] [int] NULL ,
	[YCenter] [varchar] (1) NULL ,
	[Y1] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MyComputerList]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[MyComputerList] (
	[ComputerName] [varchar] (250) NULL ,
	[LoginTime] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NewBook]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[NewBook] (
	[id1] [int] NULL ,
	[Title1] [varchar] (200) NULL ,
	[Content1] [varchar] (1000) NULL ,
	[Date1] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NewBookZD]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[NewBookZD] (
	[number] [int] NULL ,
	[Title] [varchar] (80) NULL ,
	[Writer] [varchar] (80) NULL ,
	[ISBN] [varchar] (30) NULL ,
	[KeyWord] [varchar] (160) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NewBookZDRid]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[NewBookZDRid] (
	[Rid] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NewBookZDState]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[NewBookZDState] (
	[Claim1] [varchar] (200) NULL ,
	[State1] [varchar] (1) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Nofine]    Script Date: 2016/12/24 17:50:41 ******/
CREATE TABLE [dbo].[Nofine] (
	[Rid] [varchar] (20) NULL ,
	[Bid] [varchar] (16) NULL ,
	[Fine] [real] NULL ,
	[FineDate] [datetime] NULL ,
	[State] [tinyint] NULL ,
	[FootNote] [varchar] (100) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OpRecord]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[OpRecord] (
	[Time] [varchar] (50) NULL ,
	[Action] [varchar] (250) NULL ,
	[Operator] [varchar] (30) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OtherSet]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[OtherSet] (
	[str1] [varchar] (100) NULL ,
	[str2] [varchar] (100) NULL ,
	[str3] [varchar] (100) NULL ,
	[str4] [varchar] (100) NULL ,
	[str5] [varchar] (100) NULL ,
	[str6] [varchar] (100) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Preengage]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[Preengage] (
	[Rid] [varchar] (20) NULL ,
	[Bcid] [varchar] (20) NULL ,
	[PreeDate] [datetime] NULL ,
	[Bid] [varchar] (16) NULL ,
	[IsReader] [tinyint] NULL ,
	[Kind] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PrinterSet]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[PrinterSet] (
	[Section] [varchar] (100) NOT NULL ,
	[PrinterName] [varchar] (150) NULL ,
	[PaperSize] [varchar] (10) NULL ,
	[PaperLength] [varchar] (10) NULL ,
	[PaperWidth] [varchar] (10) NULL ,
	[Orientation] [varchar] (10) NULL ,
	[BinIndex] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Publish]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[Publish] (
	[PubId] [varchar] (13) NOT NULL ,
	[Publish] [varchar] (180) NOT NULL ,
	[Adds] [varchar] (60) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Qklist]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[Qklist] (
	[yfdh] [varchar] (6) NOT NULL ,
	[ISSN] [varchar] (9) NULL ,
	[CN] [varchar] (16) NULL ,
	[Name] [varchar] (60) NOT NULL ,
	[mprice] [money] NULL ,
	[lprice] [money] NULL ,
	[kqid] [smallint] NOT NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Reader]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[Reader] (
	[Name] [varchar] (30) NOT NULL ,
	[Rid] [varchar] (20) NOT NULL ,
	[DepID] [int] NOT NULL ,
	[Picture] [text] NULL ,
	[isFine] [tinyint] NULL ,
	[isGs] [tinyint] NULL ,
	[IsFinish] [tinyint] NULL ,
	[Rgid] [int] NULL ,
	[GuestPassWord] [varchar] (10) NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SaveQk]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[SaveQk] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[qkid] [int] NOT NULL ,
	[ICount] [int] NOT NULL ,
	[State] [smallint] NOT NULL ,
	[Price] [money] NOT NULL ,
	[sk] [int] NOT NULL ,
	[Clerk] [varchar] (30) NOT NULL ,
	[EnterDate] [datetime] NOT NULL ,
	[SqkCode] [char] (17) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SoftVersion]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[SoftVersion] (
	[Version] [varchar] (10) NULL ,
	[CompileDate] [varchar] (8) NULL ,
	[BkupPath] [varchar] (300) NULL ,
	[str1] [varchar] (100) NULL ,
	[str2] [varchar] (100) NULL ,
	[str3] [varchar] (100) NULL ,
	[str4] [varchar] (200) NULL ,
	[str5] [varchar] (200) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SysInfo]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[SysInfo] (
	[Mention] [varchar] (100) NULL ,
	[MaxLimit] [int] NULL ,
	[LimitKey] [char] (10) NOT NULL ,
	[ErrOperations] [int] NULL ,
	[MaxHistory] [int] NULL ,
	[xs] [varchar] (10) NULL ,
	[cs] [varchar] (10) NULL ,
	[gs] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TmpRid]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[TmpRid] (
	[Rid] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[bcode]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[bcode] (
	[Name] [varchar] (50) NULL ,
	[Code] [varchar] (8) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[bcodelist]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[bcodelist] (
	[code] [varchar] (20) NOT NULL ,
	[name] [varchar] (160) NOT NULL ,
	[rank] [tinyint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[classical]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[classical] (
	[Bcid] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[dygl]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[dygl] (
	[date1] [datetime] NULL ,
	[depname] [varchar] (60) NULL ,
	[name] [varchar] (60) NULL ,
	[rid] [varchar] (20) NULL ,
	[fy] [int] NULL ,
	[dy] [int] NULL ,
	[bz] [varchar] (80) NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[dyqkList]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[dyqkList] (
	[yfdh] [varchar] (6) NOT NULL ,
	[issn] [varchar] (30) NULL ,
	[cn] [varchar] (12) NULL ,
	[name] [varchar] (60) NOT NULL ,
	[year] [varchar] (4) NOT NULL ,
	[kqid] [smallint] NOT NULL ,
	[dyDate] [int] NOT NULL ,
	[bcid] [varchar] (20) NOT NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[dys] [int] NULL ,
	[publish] [varchar] (60) NULL ,
	[inDate] [datetime] NOT NULL ,
	[dyz] [varchar] (10) NOT NULL ,
	[isQk] [tinyint] NOT NULL ,
	[isHD] [tinyint] NULL ,
	[lxprice] [money] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[holidays]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[holidays] (
	[UseHoliday] [varchar] (10) NULL ,
	[HolidayFrom] [datetime] NULL ,
	[HolidayTo] [datetime] NULL ,
	[HolidayReturn] [datetime] NULL ,
	[str1] [varchar] (30) NULL ,
	[str2] [varchar] (30) NULL ,
	[str3] [varchar] (100) NULL ,
	[str4] [varchar] (100) NULL ,
	[str5] [varchar] (100) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hsgx]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[hsgx] (
	[Bcid] [varchar] (20) NULL ,
	[userid] [varchar] (30) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[infomation]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[infomation] (
	[nid] [int] IDENTITY (1, 1) NOT NULL ,
	[ntitle] [varchar] (200) NULL ,
	[ncontent] [varchar] (1000) NULL ,
	[ptime] [datetime] NULL ,
	[ntype] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[information]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[information] (
	[nid] [int] IDENTITY (1, 1) NOT NULL ,
	[ntitle] [varchar] (200) NULL ,
	[ncontent] [varchar] (1000) NULL ,
	[ptime] [datetime] NULL ,
	[ntype] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[intro]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[intro] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ztitle] [varchar] (200) NULL ,
	[zcontent] [text] NULL ,
	[type] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[jcff]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[jcff] (
	[pcid] [int] NULL ,
	[jcid] [int] NULL ,
	[yfs] [int] NULL ,
	[sfs] [int] NULL ,
	[lqr] [varchar] (40) NULL ,
	[ffr] [varchar] (40) NULL ,
	[iddisp] [int] NULL ,
	[ffrq] [datetime] NULL ,
	[depname] [varchar] (60) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[jcpc]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[jcpc] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[pcname] [varchar] (40) NULL ,
	[iddisp] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[jcrk]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[jcrk] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[iddisp] [int] NULL ,
	[pc] [int] NULL ,
	[jcname] [varchar] (100) NULL ,
	[rkr] [varchar] (40) NULL ,
	[rkrq] [datetime] NULL ,
	[rks] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[kqList]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[kqList] (
	[kqid] [smallint] NOT NULL ,
	[kqName] [varchar] (6) NOT NULL ,
	[kqsj] [smallint] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[libraryname]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[libraryname] (
	[UserName] [varchar] (100) NULL ,
	[Serial] [varchar] (100) NULL ,
	[SN1] [varchar] (20) NULL ,
	[SN2] [varchar] (20) NULL ,
	[SN3] [datetime] NULL ,
	[MentionDays] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[mytmptext]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[mytmptext] (
	[seq_no] [int] IDENTITY (1, 1) NOT NULL ,
	[text_chunk] [text] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[newtextinfo]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[newtextinfo] (
	[seq_no] [int] NOT NULL ,
	[text_chunk] [varchar] (255) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[nrList]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[nrList] (
	[Name] [varchar] (100) NOT NULL ,
	[id] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[opentime]    Script Date: 2016/12/24 17:50:42 ******/
CREATE TABLE [dbo].[opentime] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ititle] [varchar] (200) NULL ,
	[startt] [varchar] (100) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[pubfile]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[pubfile] (
	[filename] [varchar] (40) NULL ,
	[lines] [int] NULL ,
	[date] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qa]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qa] (
	[id1] [int] NULL ,
	[qafrom] [varchar] (30) NULL ,
	[Title1] [varchar] (200) NULL ,
	[Content1] [varchar] (1000) NULL ,
	[Date1] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qaState]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qaState] (
	[State1] [varchar] (1) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qkFindInfo]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qkFindInfo] (
	[code] [tinyint] NOT NULL ,
	[Cname] [varchar] (20) NULL ,
	[FileName] [varchar] (20) NULL ,
	[type] [tinyint] NULL ,
	[ShowWidth] [smallint] NULL ,
	[ImeMode] [tinyint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qkOut]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qkOut] (
	[dyqkid] [int] NOT NULL ,
	[OutDate] [datetime] NOT NULL ,
	[State] [tinyint] NOT NULL ,
	[Epitome] [varchar] (100) NULL ,
	[Clerk] [varchar] (30) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qkflhhz]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qkflhhz] (
	[hz] [varchar] (10) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[qknrList]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[qknrList] (
	[Title] [varchar] (100) NOT NULL ,
	[Writer] [varchar] (100) NOT NULL ,
	[KeyWord] [varchar] (100) NULL ,
	[lr] [varchar] (250) NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[keyid] [int] NULL ,
	[SqkCode] [char] (17) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[skList]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[skList] (
	[skName] [varchar] (60) NOT NULL ,
	[sk] [smallint] IDENTITY (1, 1) NOT NULL ,
	[idDisp] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[smField]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[smField] (
	[Code] [smallint] NOT NULL ,
	[smID] [int] NOT NULL ,
	[smSort] [smallint] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[smGroup]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[smGroup] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[smName] [varchar] (100) NOT NULL ,
	[Operator] [varchar] (30) NULL ,
	[term] [datetime] NULL ,
	[EditDate] [datetime] NOT NULL ,
	[State] [smallint] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[smList]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[smList] (
	[smBcid] [varchar] (20) NOT NULL ,
	[smid] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[xhpic]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[xhpic] (
	[picture] [text] NULL ,
	[left1] [int] NULL ,
	[top1] [int] NULL ,
	[right1] [int] NULL ,
	[bottom1] [int] NULL ,
	[WithXh] [int] NULL ,
	[AutoZoom] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ybkset]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[ybkset] (
	[AutoLY] [varchar] (60) NULL ,
	[YXWJ] [varchar] (2) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[zdBook]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[zdBook] (
	[zdBcid] [varchar] (10) NOT NULL ,
	[Bcid] [varchar] (20) NOT NULL ,
	[ISBN] [varchar] (30) NULL ,
	[Title] [varchar] (180) NOT NULL ,
	[Writer] [varchar] (100) NULL ,
	[zds] [int] NOT NULL ,
	[yds] [int] NOT NULL ,
	[ddid] [varchar] (10) NOT NULL ,
	[Price] [money] NOT NULL ,
	[iscc] [tinyint] NOT NULL ,
	[pubid] [varchar] (13) NULL ,
	[NewBcid] [varchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[zkTable]    Script Date: 2016/12/24 17:50:43 ******/
CREATE TABLE [dbo].[zkTable] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[zkid] [varchar] (10) NOT NULL ,
	[zkDate] [datetime] NOT NULL ,
	[tsfrom] [varchar] (40) NULL ,
	[djhm] [varchar] (20) NOT NULL ,
	[bz] [varchar] (100) NULL ,
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
	[zkyear] [varchar] (4) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BookClass] WITH NOCHECK ADD 
	CONSTRAINT [PK__BookClass__Bid__0A7D9A4A] PRIMARY KEY  CLUSTERED 
	(
		[Bid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BookGroup] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[gid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BookList] WITH NOCHECK ADD 
	CONSTRAINT [PK__BookList__38996AB5] PRIMARY KEY  CLUSTERED 
	(
		[BCid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BookOut] WITH NOCHECK ADD 
	CONSTRAINT [PK__BookOut__Bid__17D79568] PRIMARY KEY  CLUSTERED 
	(
		[Bid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Department] WITH NOCHECK ADD 
	CONSTRAINT [PK__Departmen__DepID__1D906EBE] PRIMARY KEY  CLUSTERED 
	(
		[DepID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Publish] WITH NOCHECK ADD 
	CONSTRAINT [PK__Publish__3D5E1FD2] PRIMARY KEY  CLUSTERED 
	(
		[PubId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[bcode] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[Code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[dyqkList] WITH NOCHECK ADD 
	CONSTRAINT [PK_dyQkList_2__11] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[infomation] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[nid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[information] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[nid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[kqList] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[kqid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AVClass] ADD 
	CONSTRAINT [AVClass_BID] PRIMARY KEY  NONCLUSTERED 
	(
		[Bid]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [AVClass_Bcid_Index] ON [dbo].[AVClass]([Bcid]) ON [PRIMARY]
GO

 CREATE  INDEX [AVClass_Bcid_sk] ON [dbo].[AVClass]([sk]) ON [PRIMARY]
GO

 CREATE  INDEX [AVLend_Bcid_Index] ON [dbo].[AVLend]([Bcid]) ON [PRIMARY]
GO

 CREATE  INDEX [AVLend_Bid_Index] ON [dbo].[AVLend]([Bid]) ON [PRIMARY]
GO

 CREATE  INDEX [AVLend_Rid_Index] ON [dbo].[AVLend]([Rid]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AVList] ADD 
	CONSTRAINT [DF_AVList_Price] DEFAULT (0) FOR [Price],
	CONSTRAINT [DF_AVList_Number] DEFAULT (0) FOR [Number],
	CONSTRAINT [AVList_BCID] PRIMARY KEY  NONCLUSTERED 
	(
		[BCid]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [AVList_BcidSn_Index] ON [dbo].[AVList]([BcidSn]) ON [PRIMARY]
GO

 CREATE  INDEX [AVList_Title_Index] ON [dbo].[AVList]([Title]) ON [PRIMARY]
GO

 CREATE  INDEX [AVList_Writer_Index] ON [dbo].[AVList]([Writer]) ON [PRIMARY]
GO

 CREATE  INDEX [Bid] ON [dbo].[BadList]([Bid]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BarCode] ADD 
	CONSTRAINT [DF_BarCode_MaxLen_2__11] DEFAULT (8) FOR [MaxLen],
	CONSTRAINT [DF_BarCode_IdentLen_1__11] DEFAULT (0) FOR [IdentLen],
	CONSTRAINT [DF_BarCode_maxid_3__11] DEFAULT (1) FOR [maxid],
	CONSTRAINT [PK_BarCode_1__10] PRIMARY KEY  NONCLUSTERED 
	(
		[State]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BookClass] ADD 
	CONSTRAINT [DF__BookClass__State__0B71BE83] DEFAULT (0) FOR [State],
	CONSTRAINT [DF__BookClass__price__0C65E2BC] DEFAULT (0) FOR [price],
	CONSTRAINT [DF__BookClass__inFor__4B180DA3] DEFAULT (0) FOR [inForm]
GO

 CREATE  INDEX [Bcid] ON [dbo].[BookClass]([Bcid]) ON [PRIMARY]
GO

 CREATE  INDEX [State] ON [dbo].[BookClass]([State]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BookList] ADD 
	CONSTRAINT [DF__BookList__Pages__1312E04B] DEFAULT (0) FOR [Pages],
	CONSTRAINT [DF__BookList__Price__14070484] DEFAULT (0) FOR [Price],
	CONSTRAINT [DF__BookList__Number__14FB28BD] DEFAULT (0) FOR [Number],
	CONSTRAINT [DF_BookList_EnterDate_1__11] DEFAULT (getdate()) FOR [EnterDate]
GO

 CREATE  INDEX [BCid] ON [dbo].[BookList]([BCid]) ON [PRIMARY]
GO

 CREATE  INDEX [ISBN] ON [dbo].[BookList]([ISBN]) ON [PRIMARY]
GO

 CREATE  INDEX [keyword] ON [dbo].[BookList]([keyword]) ON [PRIMARY]
GO

 CREATE  INDEX [Number] ON [dbo].[BookList]([Number]) ON [PRIMARY]
GO

 CREATE  INDEX [PubID] ON [dbo].[BookList]([PubID]) ON [PRIMARY]
GO

 CREATE  INDEX [PublishDate] ON [dbo].[BookList]([PublishDate]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BookOut] ADD 
	CONSTRAINT [DF__BookOut__State__18CBB9A1] DEFAULT (0) FOR [State]
GO

 CREATE  INDEX [State] ON [dbo].[BookOut]([State]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BorrowRightGroup] ADD 
	CONSTRAINT [DF__LendRight__isGue__5A5A5133] DEFAULT (0) FOR [canOrder],
	CONSTRAINT [DF_BorrowRightGroup_MaxPreen] DEFAULT (1) FOR [MaxPreen],
	CONSTRAINT [PK___3__10] PRIMARY KEY  NONCLUSTERED 
	(
		[Rgid]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_BorrowRightGroup] UNIQUE  NONCLUSTERED 
	(
		[RgName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BorrowRightList] ADD 
	CONSTRAINT [DF__LendRight__penal__5E2AE217] DEFAULT (0) FOR [penalty],
	CONSTRAINT [DF__LendRight__State__5F1F0650] DEFAULT (0) FOR [State],
	CONSTRAINT [PK___4__10] PRIMARY KEY  NONCLUSTERED 
	(
		[Rlid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DDlist] ADD 
	CONSTRAINT [DF__DDlist__zdDate__51C50B32] DEFAULT (getdate()) FOR [zdDate],
	CONSTRAINT [DF__DDlist__Fid__52B92F6B] DEFAULT (0) FOR [Fid],
	CONSTRAINT [DF__DDlist__IsZd__53AD53A4] DEFAULT (0) FOR [IsZd],
	CONSTRAINT [PK___1__11] PRIMARY KEY  NONCLUSTERED 
	(
		[DDid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FineList] ADD 
	CONSTRAINT [DF__FineList__FindSt__2719D8F8] DEFAULT (0) FOR [FindState],
	CONSTRAINT [DF__FineList__Fine__280DFD31] DEFAULT (0) FOR [Fine]
GO

 CREATE  INDEX [FineDate] ON [dbo].[FineList]([FineDate]) ON [PRIMARY]
GO

 CREATE  INDEX [FineID] ON [dbo].[FineList]([FineID]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FromList] ADD 
	CONSTRAINT [PK_FromList_1__10] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

 CREATE  UNIQUE  INDEX [FromList_index_FromName] ON [dbo].[FromList]([FromName]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InfoList] ADD 
	CONSTRAINT [DF__InfoList__time1__76619304] DEFAULT (getdate()) FOR [time1]
GO

 CREATE  INDEX [BackDate] ON [dbo].[LendWork]([BackDate]) ON [PRIMARY]
GO

 CREATE  INDEX [Bcid1] ON [dbo].[LendWork]([Bcid]) ON [PRIMARY]
GO

 CREATE  INDEX [bid] ON [dbo].[LendWork]([bid]) ON [PRIMARY]
GO

 CREATE  INDEX [LendDate] ON [dbo].[LendWork]([LendDate]) ON [PRIMARY]
GO

 CREATE  INDEX [ReturnDate] ON [dbo].[LendWork]([ReturnDate]) ON [PRIMARY]
GO

 CREATE  INDEX [Rid] ON [dbo].[LendWork]([Rid]) ON [PRIMARY]
GO

 CREATE  INDEX [Lendqk_index_BackDate] ON [dbo].[Lendqk]([BackDate]) ON [PRIMARY]
GO

 CREATE  INDEX [Lendqk_index_Rid] ON [dbo].[Lendqk]([Rid]) ON [PRIMARY]
GO

 CREATE  INDEX [Lendqk_index_Sqkid] ON [dbo].[Lendqk]([Sqkid]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LogUser] ADD 
	CONSTRAINT [DF__LogUser__iRatio__62AFA012] DEFAULT (3) FOR [iRatio],
	CONSTRAINT [DF__LogUser__CardWid__63A3C44B] DEFAULT (75) FOR [CardWidth],
	CONSTRAINT [DF__LogUser__CardHei__6497E884] DEFAULT (60) FOR [CardHeight]
GO

ALTER TABLE [dbo].[LostCard] ADD 
	CONSTRAINT [DF_LostCard_LostDate] DEFAULT (getdate()) FOR [LostDate]
GO

ALTER TABLE [dbo].[Nofine] ADD 
	CONSTRAINT [DF__Nofine__Fine__2CD2B24E] DEFAULT (0) FOR [Fine],
	CONSTRAINT [DF__NoFine__State__4DF47A4E] DEFAULT (0) FOR [State]
GO

 CREATE  INDEX [Bid] ON [dbo].[Nofine]([Bid]) ON [PRIMARY]
GO

 CREATE  INDEX [Rid] ON [dbo].[Nofine]([Rid]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Preengage] ADD 
	CONSTRAINT [DF__Preengage__IsRea__4EE89E87] DEFAULT (0) FOR [IsReader]
GO

 CREATE  INDEX [Bcid] ON [dbo].[Preengage]([Bcid]) ON [PRIMARY]
GO

 CREATE  INDEX [Bid1] ON [dbo].[Preengage]([Bid]) ON [PRIMARY]
GO

 CREATE  INDEX [PreeDate] ON [dbo].[Preengage]([PreeDate]) ON [PRIMARY]
GO

 CREATE  INDEX [Rid] ON [dbo].[Preengage]([Rid]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [PubId] ON [dbo].[Publish]([PubId]) ON [PRIMARY]
GO

 CREATE  INDEX [Publish] ON [dbo].[Publish]([Publish]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Qklist] ADD 
	CONSTRAINT [PK_Qklist_1__10] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Reader] ADD 
	CONSTRAINT [DF__Reader__DepID__3D091A17] DEFAULT (0) FOR [DepID],
	CONSTRAINT [DF__Reader__isFine__3DFD3E50] DEFAULT (0) FOR [isFine],
	CONSTRAINT [DF__Reader__isGs__3EF16289] DEFAULT (0) FOR [isGs],
	CONSTRAINT [DF__Reader__IsFinish__3FE586C2] DEFAULT (0) FOR [IsFinish],
	CONSTRAINT [DF__Reader__Rgid__4D005615] DEFAULT (0) FOR [Rgid],
	CONSTRAINT [DF__reader__idDisp__3C89F72A] DEFAULT (0) FOR [idDisp],
	CONSTRAINT [PK_Reader_1__12] PRIMARY KEY  NONCLUSTERED 
	(
		[Rid]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [DepID] ON [dbo].[Reader]([DepID]) ON [PRIMARY]
GO

 CREATE  INDEX [IsFinish] ON [dbo].[Reader]([IsFinish]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SaveQk] ADD 
	CONSTRAINT [DF_SaveQk_State_3__10] DEFAULT (0) FOR [State],
	CONSTRAINT [DF_SaveQk_Price_2__10] DEFAULT (0) FOR [Price],
	CONSTRAINT [DF_SaveQk_EntreDate_1__10] DEFAULT (getdate()) FOR [EnterDate],
	CONSTRAINT [PK_SaveQk_4__10] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [SaveQk_Index_SqkCode] ON [dbo].[SaveQk]([SqkCode]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SysInfo] ADD 
	CONSTRAINT [DF__SysInfo__xs__1352D76D] DEFAULT (null) FOR [xs],
	CONSTRAINT [DF__SysInfo__cs__1446FBA6] DEFAULT (null) FOR [cs],
	CONSTRAINT [DF__SysInfo__gs__153B1FDF] DEFAULT (null) FOR [gs]
GO

ALTER TABLE [dbo].[bcodelist] ADD 
	CONSTRAINT [IX_bcodelist] UNIQUE  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[dyqkList] ADD 
	CONSTRAINT [DF__dyqkList__lxpric__2B0043CC] DEFAULT (0) FOR [lxprice]
GO

 CREATE  INDEX [dyQkList_ISSN] ON [dbo].[dyqkList]([issn]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [qkDy_INdex_yfisye] ON [dbo].[dyqkList]([yfdh], [issn], [year]) ON [PRIMARY]
GO

 CREATE  INDEX [qkDyList_Index_Yfdh] ON [dbo].[dyqkList]([yfdh]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [kqList_INDEX_kqName] ON [dbo].[kqList]([kqName]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[libraryname] ADD 
	CONSTRAINT [DF_libraryname_UserName] DEFAULT (user_name()) FOR [UserName],
	CONSTRAINT [DF_libraryname_Serial] DEFAULT (2001) FOR [Serial],
	CONSTRAINT [DF_libraryname_MentionDays] DEFAULT (31) FOR [MentionDays]
GO

 CREATE  INDEX [seq_index] ON [dbo].[newtextinfo]([seq_no]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[qkFindInfo] ADD 
	CONSTRAINT [PK_qkFindInfo_1__10] PRIMARY KEY  NONCLUSTERED 
	(
		[code]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[qkOut] ADD 
	CONSTRAINT [DF__qkOut__OutDate__04508AFF] DEFAULT (getdate()) FOR [OutDate],
	CONSTRAINT [DF__qkOut__State__0544AF38] DEFAULT (2) FOR [State]
GO

ALTER TABLE [dbo].[qknrList] ADD 
	CONSTRAINT [PK_qkLrList_1__12] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[skList] ADD 
	CONSTRAINT [PK___1__16] PRIMARY KEY  NONCLUSTERED 
	(
		[sk]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[smGroup] ADD 
	CONSTRAINT [DF_smGroup_EditDate_6__10] DEFAULT (getdate()) FOR [EditDate],
	CONSTRAINT [DF_smGroup_State_7__10] DEFAULT (0) FOR [State],
	CONSTRAINT [PK_smGroup_10] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

 CREATE  UNIQUE  INDEX [smList_BcidSmid_I] ON [dbo].[smList]([smBcid], [smid]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[zdBook] ADD 
	CONSTRAINT [DF_zdBook_yds_4__10] DEFAULT (0) FOR [yds],
	CONSTRAINT [DF__zdBook__Price__0BF1ACC7] DEFAULT (0) FOR [Price],
	CONSTRAINT [DF__zdBook__isCc__0CE5D100] DEFAULT (0) FOR [iscc],
	CONSTRAINT [PK_zdBook_1__10] PRIMARY KEY  NONCLUSTERED 
	(
		[zdBcid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[zkTable] ADD 
	CONSTRAINT [PK_zkTable_1__16] PRIMARY KEY  NONCLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [zk_index_djhm] ON [dbo].[zkTable]([djhm]) ON [PRIMARY]
GO

 CREATE  INDEX [zk_index_year] ON [dbo].[zkTable]([zkyear]) ON [PRIMARY]
GO

 CREATE  INDEX [zk_index_zkDate] ON [dbo].[zkTable]([zkDate]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [zk_index_zkid] ON [dbo].[zkTable]([zkid]) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.AVLending    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.BcidLendCount    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.BcidLending    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.BooksInSk    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.Lending    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.LendingInSk    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.NotLending    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.NotLendingInSk    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.ReaderInSk    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.bcidinsk    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.bcidsumlend    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.qkLendIng    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.BcidInSkName    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.BcidLendName    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.plist    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  View dbo.qknrView    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  Stored Procedure dbo.GetAVSn    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  Stored Procedure dbo.GetBookSn    Script Date: 2016/12/24 17:50:43 ******/
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

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.get_text    Script Date: 2016/12/24 17:50:43 ******/
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

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.GetRid    Script Date: 2016/12/24 17:50:43 ******/

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

/****** Object:  Stored Procedure dbo.InsLogUser    Script Date: 2016/12/24 17:50:43 ******/
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

/****** Object:  Stored Procedure dbo.get_textok    Script Date: 2016/12/24 17:50:43 ******/
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

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.AVClass_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER AVClass_delete ON dbo.AVClass FOR DELETE AS 
 BEGIN 
 DELETE BadList FROM Deleted WHERE  BadList.Bid=Deleted.Bid
 DELETE BookOut FROM Deleted WHERE  BookOut.Bid=Deleted.Bid
 DELETE LendWork FROM Deleted WHERE  LendWork.bid=Deleted.Bid
 DELETE Nofine FROM Deleted WHERE  Nofine.Bid=Deleted.Bid
 DELETE Preengage FROM Deleted WHERE  Preengage.Bid=Deleted.Bid
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.AVClass_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER AVClass_insert ON dbo.AVClass FOR INSERT AS 
 IF (SELECT count(*) FROM AVList,Inserted WHERE AVList.BCid=Inserted.Bcid)=0 
 BEGIN 
 IF (SELECT COUNT(*) FROM Inserted)>0 
  BEGIN
  RAISERROR('主表AVList无相应的编码',18,1)
  ROLLBACK TRANSACTION
  END
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.AVClass_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER AVClass_update ON dbo.AVClass FOR UPDATE AS 
 IF UPDATE(Bid) 
 BEGIN 
 UPDATE BadList SET BadList.Bid = Inserted.Bid FROM inserted,deleted WHERE  BadList.Bid=Deleted.Bid
 UPDATE BookOut SET BookOut.Bid = Inserted.Bid FROM inserted,deleted WHERE  BookOut.Bid=Deleted.Bid
 UPDATE LendWork SET LendWork.bid = Inserted.Bid FROM inserted,deleted WHERE  LendWork.bid=Deleted.Bid
 UPDATE Nofine SET Nofine.Bid = Inserted.Bid FROM inserted,deleted WHERE  Nofine.Bid=Deleted.Bid
 UPDATE Preengage SET Preengage.Bid = Inserted.Bid FROM inserted,deleted WHERE  Preengage.Bid=Deleted.Bid
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.AVList_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER AVList_delete ON dbo.AVList FOR DELETE AS 
 BEGIN
   DELETE AVClass FROM Deleted WHERE  AVClass.Bcid=Deleted.BCid
   DELETE AVLend FROM Deleted WHERE  AVLend.Bcid=Deleted.BCid
   ExitTrigger:
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

/****** Object:  Trigger dbo.AVList_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER AVList_update ON dbo.AVList FOR UPDATE AS
 IF UPDATE(BCid) 
  BEGIN
    UPDATE AVClass SET AVClass.Bcid = Inserted.BCid FROM inserted,deleted WHERE  AVClass.Bcid=Deleted.BCid
    UPDATE AVLend SET AVLend.Bcid = Inserted.BCid FROM inserted,deleted WHERE  AVLend.Bcid=Deleted.BCid
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

/****** Object:  Trigger dbo.BookClass_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookClass_delete ON dbo.BookClass FOR DELETE AS 
BEGIN 
 DELETE BadList FROM Deleted WHERE  BadList.Bid=Deleted.Bid
 DELETE BookOut FROM Deleted WHERE  BookOut.Bid=Deleted.Bid
 DELETE LendWork FROM Deleted WHERE  LendWork.bid=Deleted.Bid
 DELETE Nofine FROM Deleted WHERE  Nofine.Bid=Deleted.Bid
 DELETE Preengage FROM Deleted WHERE  Preengage.Bid=Deleted.Bid
 exitTrigger:
END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BookClass_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookClass_insert ON dbo.BookClass FOR INSERT AS 
 IF (SELECT count(*) FROM BookList,Inserted WHERE BookList.BCid=Inserted.Bcid)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
     RAISERROR('主表BookList无相应的编码',18,1)
     ROLLBACK TRANSACTION
   GOTO exitTrigger
   END
 END
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BookClass_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookClass_update ON dbo.BookClass FOR UPDATE AS 
 IF UPDATE(Bid) BEGIN 
 UPDATE BadList SET BadList.Bid = Inserted.Bid FROM inserted,deleted WHERE  BadList.Bid=Deleted.Bid
 UPDATE BookOut SET BookOut.Bid = Inserted.Bid FROM inserted,deleted WHERE  BookOut.Bid=Deleted.Bid
 UPDATE LendWork SET LendWork.bid = Inserted.Bid FROM inserted,deleted WHERE  LendWork.bid=Deleted.Bid
 UPDATE Nofine SET Nofine.Bid = Inserted.Bid FROM inserted,deleted WHERE  Nofine.Bid=Deleted.Bid
 UPDATE Preengage SET Preengage.Bid = Inserted.Bid FROM inserted,deleted WHERE  Preengage.Bid=Deleted.Bid
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BookList_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookList_delete ON dbo.BookList FOR DELETE AS 
 BEGIN
  Update zdBook Set NewBcid=Null,yds=0 From Deleted,zdBook Where NewBcid=deleted.Bcid
  DELETE BookClass FROM Deleted WHERE  BookClass.Bcid=Deleted.BCid
  DELETE LendWork FROM Deleted WHERE  LendWork.Bcid=Deleted.BCid
  DELETE Preengage FROM Deleted WHERE  Preengage.Bcid=Deleted.BCid
  DELETE smList FROM Deleted WHERE  smList.smBcid=Deleted.BCid
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

/****** Object:  Trigger dbo.BookList_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookList_insert ON dbo.BookList FOR INSERT AS 
 IF (SELECT count(*) FROM Publish,Inserted WHERE  Publish.PubId=Inserted.PubID)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 
   BEGIN
     RAISERROR('主表Publish无相应的编码',18,1)
     ROLLBACK TRANSACTION
     GOTO exitTrigger
   END
 END
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BookList_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BookList_update ON dbo.BookList FOR UPDATE AS
 IF UPDATE(BCid) 
 BEGIN
  UPDATE BookClass SET BookClass.Bcid = Inserted.BCid FROM inserted,deleted WHERE  BookClass.Bcid=Deleted.BCid
  UPDATE zdBook SET zdBook.NewBcid = Inserted.BCid FROM inserted,deleted WHERE  zdBook.NewBcid=Deleted.BCid
  UPDATE LendWork SET LendWork.Bcid = Inserted.BCid FROM inserted,deleted WHERE  LendWork.Bcid=Deleted.BCid
  UPDATE Preengage SET Preengage.Bcid = Inserted.BCid FROM inserted,deleted WHERE  Preengage.Bcid=Deleted.BCid
  UPDATE smList SET smList.smBcid = Inserted.BCid FROM inserted,deleted WHERE  smList.smBcid=Deleted.BCid
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

/****** Object:  Trigger dbo.BorrowRightGroup_delete    Script Date: 2016/12/24 17:50:43 ******/
 CREATE TRIGGER BorrowRightGroup_delete ON BorrowRightGroup FOR DELETE AS 
 BEGIN 
  DELETE BorrowRightList FROM Deleted WHERE BorrowRightList.Rgid=Deleted.Rgid
  DELETE Department FROM Deleted WHERE Department.Rgid=Deleted.Rgid
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BorrowRightList_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BorrowRightList_delete ON dbo.BorrowRightList FOR delete AS
 IF (SELECT count(*) FROM Reader,deleted WHERE Reader.Rgid=deleted.Rgid)>0
 BEGIN
  RAISERROR(' 读者库中已有对应于该类的读者,不能删除 ',18,1)
  Rollback TRANSACTION
   GoTo exitTrigger
 End
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.BorrowRightList_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER BorrowRightList_insert ON dbo.BorrowRightList FOR INSERT AS
 IF (SELECT count(*) FROM BorrowRightGroup,Inserted WHERE BorrowRightGroup.Rgid=Inserted.Rgid)=0
 BEGIN
 IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
 RAISERROR(' 主表BorrowRightGroup无相应的编码 ',18,1)
  Rollback TRANSACTION
   GoTo exitTrigger
    End
  End
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.DDList_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER DDList_update ON DDList FOR UPDATE AS
 IF UPDATE(DDid) 
 BEGIN
   UPDATE zdBook SET zdBook.DDid = Inserted.DDid FROM inserted,deleted WHERE  zdBook.DDid=Deleted.DDid
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

/****** Object:  Trigger dbo.Department_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Department_delete ON Department FOR DELETE AS
 BEGIN
  DELETE Reader FROM Deleted WHERE Reader.DepID=Deleted.DepID
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.Department_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Department_update ON Department FOR UPDATE AS
 IF UPDATE(DepID)
 BEGIN
  UPDATE Reader SET Reader.DepID = Inserted.DepID FROM inserted,deleted WHERE Reader.DepID=Deleted.DepID
 END
 IF UPDATE(RgID)
 BEGIN
  UPDATE Reader SET Reader.RgID = Inserted.RgID FROM inserted,deleted WHERE Reader.DepID=Deleted.DepID 
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.FromList_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER FromList_delete ON dbo.FromList FOR DELETE AS 
 BEGIN
   IF (SELECT COUNT(*) FROM DDList, Deleted WHERE DDlist.Fid=Deleted.id)>0
   BEGIN
     RAISERROR ('本条目存在相关的重要信息,禁止删除',18,1)
     Rollback TRANSACTION
     GoTo exitTrigger
   End
   exitTrigger:
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

/****** Object:  Trigger dbo.LendWork_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER LendWork_insert ON dbo.LendWork FOR INSERT AS 
 IF (SELECT count(*) FROM BookClass,Inserted WHERE  BookClass.Bid=Inserted.bid)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
     RAISERROR('主表BookClass无相应的编码',18,1)
     ROLLBACK TRANSACTION
   GOTO exitTrigger
   END
 END
 IF (SELECT count(*) FROM BookList,Inserted WHERE  BookList.BCid=Inserted.Bcid)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
     RAISERROR('主表BookList无相应的编码',18,1)
     ROLLBACK TRANSACTION
   GOTO exitTrigger
   END
 END
 IF (SELECT count(*) FROM Reader,Inserted WHERE  Reader.Rid=Inserted.Rid)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
     RAISERROR('主表Reader无相应的编码',18,1)
     ROLLBACK TRANSACTION
   GOTO exitTrigger
   END
 END
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.Publish_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Publish_delete ON dbo.Publish FOR DELETE AS 
 BEGIN 
  DELETE BookList FROM Deleted WHERE  BookList.PubID=Deleted.PubId
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.Publish_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Publish_update ON dbo.Publish FOR UPDATE AS 
 IF UPDATE(PubId) 
 BEGIN 
   UPDATE BookList SET BookList.PubID = Inserted.PubId FROM inserted,deleted WHERE  BookList.PubID=Deleted.PubId
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.Reader_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Reader_insert ON dbo.Reader FOR INSERT AS 
 IF (SELECT count(*) FROM Department,Inserted WHERE  Department.DepID=Inserted.DepID)=0 
 BEGIN 
   IF (SELECT COUNT(*) FROM Inserted)>0 BEGIN
     RAISERROR('主表Department无相应的编码',18,1)
     ROLLBACK TRANSACTION
   GOTO ExitTrigger 
   END
 END
 ExitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.Reader_update    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Reader_update ON dbo.Reader FOR UPDATE AS
  IF UPDATE(Rid) 
  BEGIN
    UPDATE LendWork SET LendWork.Rid = Inserted.Rid FROM inserted,deleted WHERE  LendWork.Rid=Deleted.Rid
    UPDATE AVLend SET AVLend.Rid = Inserted.Rid FROM inserted,deleted WHERE AVLend.Rid=Deleted.Rid
    UPDATE Lendqk SET Lendqk.Rid = Inserted.Rid FROM inserted,deleted WHERE Lendqk.Rid=Deleted.Rid
    UPDATE Nofine SET Nofine.Rid = Inserted.Rid FROM inserted,deleted WHERE Nofine.Rid=Deleted.Rid
    UPDATE Preengage SET Preengage.Rid = Inserted.Rid FROM inserted,deleted WHERE  Preengage.Rid=Deleted.Rid
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

/****** Object:  Trigger dbo.Reader_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER Reader_delete ON Reader FOR DELETE AS 
 BEGIN
  DECLARE @@Rid varchar(20),@ii int
  select @ii=0
  select @@Rid=Rid from Deleted
  IF (SELECT count(*) FROM LendWork, Deleted WHERE LendWork.Rid=Deleted.Rid and LendWork.BackDate is NULL)>0
  BEGIN
   RAISERROR('读者 %s 尚有未归还书籍，不能删除!',18,1,@@Rid)
   ROLLBACK TRANSACTION
   select @ii=1
  END
  IF (SELECT count(*) FROM AVLend, Deleted WHERE AVLend.Rid=Deleted.Rid and AVLend.BackDate is NULL)>0
  BEGIN
   RAISERROR('读者 %s 尚有未归还音像，不能删除!',18,1,@@Rid)
   ROLLBACK TRANSACTION
   select @ii=1
  END
  IF (SELECT count(*) FROM Lendqk, Deleted WHERE Lendqk.Rid=Deleted.Rid and Lendqk.BackDate is NULL)>0
  BEGIN
   RAISERROR('读者 %s 尚有未归还期刊，不能删除!',18,1,@@Rid)
   ROLLBACK TRANSACTION
   select @ii=1
  END
  IF @ii=0
  BEGIN
   DELETE LendWork FROM Deleted WHERE  LendWork.Rid=Deleted.Rid
   DELETE AVLend FROM Deleted WHERE  AVLend.Rid=Deleted.Rid
   DELETE Nofine FROM Deleted WHERE  Nofine.Rid=Deleted.Rid
   DELETE Lendqk FROM Deleted WHERE  Lendqk.Rid=Deleted.Rid
   DELETE Preengage FROM Deleted WHERE  Preengage.Rid=Deleted.Rid
  END
 END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.SaveQk_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER SaveQk_delete ON dbo.SaveQk FOR DELETE AS 
BEGIN 
 DELETE Lendqk FROM Deleted WHERE Lendqk.sqkid=Deleted.id
 exitTrigger:
END

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.DyqkList_Delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER DyqkList_Delete ON dbo.dyqkList FOR DELETE AS 
 BEGIN 
   DELETE Saveqk FROM Deleted WHERE  SaveQk.qkid=Deleted.id
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

/****** Object:  Trigger dbo.kqList_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER kqList_delete ON kqlist FOR DELETE,UPDATE AS 
 BEGIN
  IF (SELECT COUNT(*) FROM qkList,dyqklist,Deleted WHERE Deleted.kqid=qklist.kqid or Deleted.kqid=dyqklist.kqid)>0
   BEGIN
     RAISERROR ('本条目有相关信息，现禁止删除或修改',18,1)
     Rollback TRANSACTION
     GoTo ExitTrigger
   End
  ExitTrigger:
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

/****** Object:  Trigger dbo.nrList_Delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER nrList_Delete ON nrList FOR  DELETE 
 AS Begin 
  Update qknrList Set keyid=0 From qknrList,Deleted Where qknrList.keyid=Deleted.id 
 End 

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.sklist_delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER sklist_delete ON dbo.skList FOR DELETE AS 
 BEGIN
  IF (SELECT count(*) FROM BookClass, Deleted WHERE BookClass.sk=Deleted.sk)>0
  BEGIN 
    RAISERROR('该书库中有图书,不能删除!',18,1)
    ROLLBACK TRANSACTION
    GOTO ExitTrigger 
  END
  IF (SELECT count(*) FROM AVClass, Deleted WHERE AVClass.sk=Deleted.sk)>0
  BEGIN 
    RAISERROR('该书库中有音像，不能删除!',18,1)
    ROLLBACK TRANSACTION
    GOTO ExitTrigger 
  END
  IF (SELECT count(*) FROM saveqk, Deleted WHERE saveqk.sk=Deleted.sk)>0
  BEGIN 
    RAISERROR('该书库中有期刊，不能删除!',18,1)
    ROLLBACK TRANSACTION
    GOTO ExitTrigger 
  END
  ExitTrigger:
 End

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.smfield_insert    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER smfield_insert ON smfield FOR INSERT AS
 IF (SELECT count(*) FROM smgroup,Inserted WHERE smgroup.id=Inserted.smid)=0
 BEGIN
   RAISERROR(' 主表smGroup无相应的编码 ',18,1)
   Rollback TRANSACTION
   GoTo exitTrigger
 End
 exitTrigger:

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.smGroup_Delete    Script Date: 2016/12/24 17:50:43 ******/
CREATE TRIGGER smGroup_Delete ON dbo.smGroup
 FOR DELETE AS 
  BEGIN
    DELETE smList FROM Deleted WHERE  smList.smid=Deleted.id
    DELETE smField FROM Deleted WHERE  smField.smid=Deleted.id
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

/****** Object:  Trigger dbo.zdBook_delete    Script Date: 2016/12/24 17:50:44 ******/
CREATE TRIGGER zdBook_delete ON dbo.zdBook FOR DELETE AS 
BEGIN
  Declare @@s varchar(50)
  Select @@s=zdBcid+':'+NewBcid from Deleted
  IF (SELECT count(*) FROM BookList,Deleted WHERE BookList.Bcid=Deleted.NewBcid and BookList.Number>0)>0
  BEGIN 
    RAISERROR('征订图书 %s 已有书到，不能删除!',18,1,@@s)
    ROLLBACK TRANSACTION
    GOTO ExitTrigger 
  END
  DELETE BookList FROM Deleted WHERE  BookList.Bcid=Deleted.NewBCid
  ExitTrigger:
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

/****** Object:  Trigger dbo.zdBook_update    Script Date: 2016/12/24 17:50:44 ******/
CREATE TRIGGER zdBook_update ON dbo.zdBook FOR UPDATE AS
 IF UPDATE(Title) OR Update(Writer) OR Update(ISBN) 
  BEGIN
    UPDATE zdBook SET iscc=1 FROM zdBook,inserted,deleted WHERE  zdbook.zdBcid=Deleted.zdBCid
  End

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Trigger dbo.zktable_delete    Script Date: 2016/12/24 17:50:44 ******/
CREATE TRIGGER zktable_delete ON dbo.zktable FOR DELETE AS 
 BEGIN
  Declare @@s varchar(50)
  Select @@s=zkid from Deleted
  IF (SELECT count(*) FROM BookClass,Deleted WHERE BookClass.inForm=Deleted.id)>0
  BEGIN 
    RAISERROR('总括登记 %s 已有图书，不能删除!',18,1,@@s)
    ROLLBACK TRANSACTION
    GOTO ExitTrigger 
  END
  ExitTrigger:
 End

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

