--rsda definition
--one of the core proc in tsda 
if object_id('tsda') is not null
   drop proc tsda
go
create  proc tsda
(
@TableName nvarchar (80) ='t_icitem',
@FieldList nvarchar (400)='*',
@DBName nvarchar(50)='',
@DBType nvarchar(30)='K3ERP', 
@Schema nvarchar (30)='dbo')
as

set nocount on 
begin
declare @sql nvarchar(max)=N''
if @DBName =''
  begin
  select @DBName = db_name()
  end
if @DBType = 'K3ERP'
begin
select @sql=N'select '+@FieldList+N'  from  '+@DBName+N'.'+@Schema+N'.'+@TableName 
end
exec sp_executesql @sql
end
go
if OBJECT_ID('takewiki_k3_md_account_view_rebuild') is not null
drop proc takewiki_k3_md_account_view_rebuild
go
--V1.1
--build the view 'takewiki_k3_md_account_view'
--deptect whether the proc takewiki_k3_md_account_view_rebuild exitsts
--if exits then delete the proc 
create proc takewiki_k3_md_account_view_rebuild (@FromDB nvarchar(50)='')
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_account_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_account_view'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_account_view '+N'
 as'+space(3)+N'
select faccountid as FItemID,fnumber,fname,flevel,fdetail,fparentid,fdelete from  '
+@FromDB+N'.dbo.t_account '

exec sp_executesql @sql_run
end
go
if object_id('tsda_funcFactory_getParentIDByLevel') is not null 
drop  proc tsda_funcFactory_getParentIDByLevel
go
create proc tsda_funcFactory_getParentIDByLevel
(@Func_Name nvarchar(80),@Table_view_name nvarchar(80),@ID_Field_Name nvarchar(30),@Parent_Field_Name nvarchar(30),@Level_Field_name nvarchar(30) )
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N'(@FItemid  int,  @FLevel int) returns int
as
begin --0
declare @FParentID int
declare @CurrentLevel int  
  select @CurrentLevel = '+space(3)+@Level_Field_name+N' from  '+@Table_view_name +
N'  where   '+@ID_Field_Name+N'=@FItemID
 if @FLevel>= @CurrentLevel
 select @FParentID = -1
 else
 begin--1
      declare @i int
      select @i=@FItemid
      declare @tempParentid int  '+
   N' select @tempParentID  =  '+@Parent_Field_Name +N'  from  '+ @Table_view_name +
   N'  where  '+@ID_Field_Name +N'  =@i  '+
      N'select @CurrentLevel = @CurrentLevel -1
      while @CurrentLevel>@Flevel
      begin --2
      select @i = @tempParentID
      select @tempParentID =  '+ @Parent_Field_Name  +N'  from  '+@Table_view_name +
   N'  where  ' +@ID_Field_Name +N' =  @i   
   select @CurrentLevel =   @CurrentLevel -1     
      
      end --2
      select @FParentID  =  @tempParentID
   
 end --1
 
 return @FParentid

end --0'
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end

go

--usage

---exec tsda_funcFactory_getParentIDByLevel 'test_fuc_getParentIDByLevel','test_parent','FItemID','FParentID','FLevel'
---select dbo.test_fuc_getParentIDByLevel(5,1)

--- sp_helptext tsda_funcFactory_getParentIDByLevel



---create table  test_parent
-- (--- FItemID int,FParentID int ,Flevel int )

-- insert into test_parent values(1,null,1)
-- insert into test_parent values(2,null,1)
-- insert into test_parent values(3,null,1)
-- insert into test_parent values(4,1,2)
-- insert into test_parent values(5,1,2)
-- insert into test_parent values(6,4,3)
-- insert into test_parent values(7,4,3)
-- insert into test_parent values(8,5,3)


-- select * from test_parent


-- exec tsda_funcFactory_getParentIDByLevel 'test_fuc_getParentIDByLevel','test_parent','FItemID','FParentID','FLevel'

-- select dbo.test_fuc_getParentIDByLevel(5,1)
if object_id('tsda_funcFactory_getCurrentLevel') is not null 
drop  proc tsda_funcFactory_getCurrentLevel
go
create proc tsda_funcFactory_getCurrentLevel
(@Func_Name nvarchar(80),@Table_view_name nvarchar(80),@ID_Field_Name nvarchar(30),
@Level_Field_Name nvarchar(30) )
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FItemid  int ) returns int
as
begin --0
declare @FLevel int
select @FLevel = '+@Level_Field_Name +N'  from   '+ @Table_view_name +
N'  where '+@ID_Field_Name + N' = @FItemid '+
N'
return @FLevel
end
'
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

--exec tsda_funcFactory_getCurrentLevel 'takewiki_k3_md_department_func_getCurrentLevel'，'takewiki_k3_md_department_view','FItemID','FLevel'
--tsda takewiki_k3_md_department_view

--select dbo.takewiki_k3_md_department_func_getCurrentLevel(235)
--select dbo.takewiki_k3_md_department_func_getCurrentLevel(255)
if object_id('tsda_funcFactory_getItemIDByLevel') is not null 
drop  proc tsda_funcFactory_getItemIDByLevel
go
create proc tsda_funcFactory_getItemIDByLevel
(@Func_Name nvarchar(80),@getCurrentLevel_func_name nvarchar(80),@getParentIDByLevel_func_Name nvarchar(80))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FItemID int,@FLevel int ) returns int
as
begin --0
declare @LevelItemID int'+
N' if dbo.'+@getCurrentLevel_func_name+ N' (@FItemID) = @FLevel '+
N'   begin
select @LevelItemID = @FItemid
   end
   else
   begin
   select @LevelItemID = dbo.'+@getParentIDByLevel_func_Name+N' (@FItemID,@Flevel)
   end
    return @LevelItemID

end
   '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

-- exec tsda_funcFactory_getItemIDByLevel 'takewiki_k3_md_department_func_getItemIDByLevel',
-- 'takewiki_k3_md_department_func_getCurrentLevel',
-- 'takewiki_k3_md_department_func_getParentIDByLevel'
-- tsda 'takewiki_k3_md_department_view'
-- select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,2)
-- select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,1)
if object_id('tsda_funcFactory_getNameByItemID') is not null 
drop  proc tsda_funcFactory_getNameByItemID
go
create proc tsda_funcFactory_getNameByItemID
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Name_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' ( @FItemID int ) returns nvarchar(80)
as
begin --0
declare @FName nvarchar(80)'+
N' select @FName =  '+ @Name_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@ItemID_Field_Name +N'  = @FItemID
   return @FName
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

-- tsda 'takewiki_k3_md_department_view'
-- tsda_funcFactory_getNameByItemID 'takewiki_k3_md_department_func_getNameByItemID',
-- 'takewiki_k3_md_department_view',
--'FItemID',
-- 'FName'
-- select dbo.takewiki_k3_md_department_func_getNameByItemID(234)
-- select dbo.takewiki_k3_md_department_func_getNameByItemID(243)


if object_id('tsda_funcFactory_getItemIDByNumber') is not null 
drop  proc tsda_funcFactory_getItemIDByNumber
go
create proc tsda_funcFactory_getItemIDByNumber
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Number_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' ( @FNumber  nvarchar(80) ) returns int
as
begin --0
declare @FItemID int  '+
N' select @FItemID = '+ @ItemID_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@Number_Field_Name +N'  = @FNumber
   return @FItemID
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

-- tsda 'takewiki_k3_md_department_view'
-- go
-- tsda_funcFactory_getItemIDByNumber 'takewiki_k3_md_department_func_getItemIDByNumber',
-- 'takewiki_k3_md_department_view',
--'FItemID',
-- 'FNumber'
-- go
-- select dbo.takewiki_k3_md_department_func_getItemIDByNumber('002')
-- select dbo.takewiki_k3_md_department_func_getItemIDByNumber('6.08')
 
 if object_id('tsda_funcFactory_getItemIDByName') is not null 
drop  proc tsda_funcFactory_getItemIDByName
go
create proc tsda_funcFactory_getItemIDByName
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Name_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FName nvarchar(80)) returns int
as
begin --0
declare @FItemID int '+
N' select @FItemID =  '+ @ItemID_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@Name_Field_Name +N'  = @FName
   return @FItemID
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go


--tsda 'takewiki_k3_md_department_view'

--exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_department_func_getItemIDByName',
-- 'takewiki_k3_md_department_view',
--'FItemid',
--'FName'
--select dbo.takewiki_k3_md_department_func_getItemIDByName('生产部')

if object_id('tsda_funcFactory_getNumberByItemID') is not null 
drop  proc tsda_funcFactory_getNumberByItemID
go
create proc tsda_funcFactory_getNumberByItemID
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Number_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' ( @FItemID int ) returns nvarchar(80)
as
begin --0
declare @FNumber nvarchar(80)'+
N' select @FNumber =  '+ @Number_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@ItemID_Field_Name +N'  = @FItemID
   return @FNumber
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go
if OBJECT_ID('takewiki_k3_md_account_view_Ext1_rebuild') is not null
drop proc takewiki_k3_md_account_view_Ext1_rebuild
go

create proc takewiki_k3_md_account_view_Ext1_rebuild (@FromDB nvarchar(50)='')
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_account_view_Ext1'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_account_view_Ext1'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_account_view_Ext1 '+N'
 as'+space(3)+N'
select faccountid as FItemID,FFullName,FGroupID from  '
+@FromDB+N'.dbo.t_account '

exec sp_executesql @sql_run
end
go

---takewiki_k3_md_account_view_Ext1_rebuild ''
--   tsda 'takewiki_k3_md_account_view_Ext1'
-- takewiki_k3_md_account_view_Ext1_rebuild 'AIS20141027173850'



-- tsda 'takewiki_k3_md_department_view'
-- tsda_funcFactory_getNumberByItemID 'takewiki_k3_md_department_func_getNumberByItemID',
-- 'takewiki_k3_md_department_view',
--'FItemID',
-- 'FNumber'
-- select dbo.takewiki_k3_md_department_func_getNumberByItemID(234)
-- select dbo.takewiki_k3_md_department_func_getNumberByItemID(243)

if OBJECT_ID('takewiki_k3_md_account_view_onlyDetail_rebuild') is not null
drop proc takewiki_k3_md_account_view_onlyDetail_rebuild
go
--deptect whether the proc takewiki_k3_md_account_view_rebuild exitsts
--if exits then delete the proc 
create proc takewiki_k3_md_account_view_onlyDetail_rebuild 
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_account_view_onlyDetail'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_account_view_onlyDetail'
---select @sql_pre
exec sp_executesql @sql_pre

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_account_view_onlyDetail '+N'
 as'+space(3)+N'
select  * from takewiki_k3_md_account_view
where fdetail=1  '


exec sp_executesql @sql_run
end
go
 
 