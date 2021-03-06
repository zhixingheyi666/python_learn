if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetRid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetRid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AVLending]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[AVLending]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BcidLendCount]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[BcidLendCount]
GO

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

