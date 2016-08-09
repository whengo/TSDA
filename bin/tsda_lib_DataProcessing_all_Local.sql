
if object_id('takewiki_k3_md_account_func_getCurrentLevel') is not null
drop function  takewiki_k3_md_account_func_getCurrentLevel
go
create function takewiki_k3_md_account_func_getCurrentLevel
(@FItemID int) returns int
as
begin
declare @FLevel int
select @FLevel=flevel  from takewiki_k3_md_account_view
where FItemID = @FItemID
return @FLevel
end
go
--usage
-- select dbo.takewiki_k3_md_account_func_getCurrentLevel(1051)
-- select dbo.takewiki_k3_md_account_func_getCurrentLevel(1091)
if object_id('takewiki_k3_md_account_func_getFullNameByItemID') is not null
drop function takewiki_k3_md_account_func_getFullNameByItemID
go
create function takewiki_k3_md_account_func_getFullNameByItemID
(@FItemID int) returns nvarchar(250)
as
begin
declare @FFullName nvarchar(250)
   select @FFullName = FFullName from takewiki_k3_md_account_view_Ext1
   where FItemID = @FItemID
   return @FFullName
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getFullNameByItemID(1099)
if object_id('takewiki_k3_md_account_func_getItemIDByLevel') is not null
drop function  takewiki_k3_md_account_func_getItemIDByLevel
go
create function takewiki_k3_md_account_func_getItemIDByLevel
(@FItemID int,@FLevel int) returns int
as
begin
declare @LevelItemID int
  if dbo.takewiki_k3_md_account_func_getCurrentLevel(@FItemID) = @FLevel
  begin
   select @LevelItemID = @FItemid
   end
   else
   begin
   select @LevelItemID = dbo.takewiki_k3_md_account_func_getParentIDByLevel(@FItemID,@Flevel)
   end
   return @LevelItemID

end
go
--usage
-- select dbo.takewiki_k3_md_account_func_getItemIDByLevel(1106,3)
-- select dbo.takewiki_k3_md_account_func_getItemIDByLevel(1106,2)
-- select dbo.takewiki_k3_md_account_func_getItemIDByLevel(1106,1)
-- select dbo.takewiki_k3_md_account_func_getItemIDByLevel(1106,4)
if object_id('takewiki_k3_md_account_func_getItemIDByName') is not null
drop function  takewiki_k3_md_account_func_getItemIDByName
go
create function takewiki_k3_md_account_func_getItemIDByName
(@FName nvarchar(80)) returns int
as
begin
  declare @FItemID int

select @FItemID =FItemID from takewiki_k3_md_account_view
   where FName =@FName
   return @FItemID
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getItemIDByName('商誉')
-- select dbo.takewiki_k3_md_account_func_getItemIDByName('短期借款')
if object_id('takewiki_k3_md_account_func_getItemIDByNumber') is not null
drop function  takewiki_k3_md_account_func_getItemIDByNumber
go
create function takewiki_k3_md_account_func_getItemIDByNumber
(@FNumber nvarchar(30)) returns int
as
begin
  declare @FItemID int

select @FItemID =FItemID from takewiki_k3_md_account_view
   where FNumber =@FNumber
   return @FItemID
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getItemIDByNumber('6101.02')
-- select dbo.takewiki_k3_md_account_func_getItemIDByNumber('1001')

if object_id('takewiki_k3_md_account_func_getNameByItemID') is not null
drop function  takewiki_k3_md_account_func_getNameByItemID
go
create function takewiki_k3_md_account_func_getNameByItemID
(@FItemID int) returns nvarchar(80)
as
begin
  declare @FName nvarchar(80)

select @FName =FName from takewiki_k3_md_account_view
   where FItemID =@FItemID
   return @FName
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getNameByItemID(1001)
-- select dbo.takewiki_k3_md_account_func_getNameByItemID(1091)

if object_id('takewiki_k3_md_account_func_getNumberByItemID') is not null
drop function takewiki_k3_md_account_func_getNumberByItemID
go
create function takewiki_k3_md_account_func_getNumberByItemID
(@FItemID int) returns nvarchar(30)
as
begin
  declare @FNumber nvarchar(30)

select @FNumber =FNumber from takewiki_k3_md_account_view
   where FItemID =@FItemID
   return @FNumber
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getNumberByItemID(1001)
-- select dbo.takewiki_k3_md_account_func_getNumberByItemID(1091)


if object_id('takewiki_k3_md_account_func_getParentIDByLevel') is not null
drop function  takewiki_k3_md_account_func_getParentIDByLevel
go
create function takewiki_k3_md_account_func_getParentIDByLevel
(@FItemID int,@FLevel int) returns int
as
begin --0
declare @FParentID int
declare @CurrentLevel int
select @CurrentLevel =flevel from takewiki_k3_md_account_view
where fitemid=@FItemID
 if @FLevel>= @CurrentLevel
 select @FParentID = -1
 else
 begin--1
      declare @i int
      select @i=@FItemid
      declare @tempParentid int
   select @tempParentID= fparentid  from takewiki_k3_md_account_view
   where fitemid=@i
      select @CurrentLevel =@CurrentLevel -1
      while @CurrentLevel>@Flevel
      begin --2
      select @i= @tempParentID
      select @tempParentID= fparentid  from takewiki_k3_md_account_view
   where fitemid=@i
   select @CurrentLevel =@CurrentLevel -1     
      
      end --2
      select @FParentID=@tempParentID
   
 end --1
 
 return @FParentid

end --0
go
--usage 
-- select dbo.takewiki_k3_md_account_func_getParentIDByLevel(1107,2)
-- select dbo.takewiki_k3_md_account_func_getParentIDByLevel(1107,1)
-- select dbo.takewiki_k3_md_account_func_getParentIDByLevel(1107,3)
-- select dbo.takewiki_k3_md_account_func_getParentIDByLevel(1107,4)




if object_id('takewiki_k3_md_currency_func_getAmountDecimalByItemID') is not null
drop function takewiki_k3_md_currency_func_getAmountDecimalByItemID
go
create function takewiki_k3_md_currency_func_getAmountDecimalByItemID
(@FItemID int) returns int
as
begin
  declare @FScale int
  select @FScale = dbo.takewiki_k3_md_currency_func_getScaleByItemID(@FItemID)
  return @FScale
end
go
--usage
--select dbo.takewiki_k3_md_currency_func_getAmountDecimalByItemID(1)
--select dbo.takewiki_k3_md_currency_func_getAmountDecimalByItemID(1001)
--this func is the same as 
-- select dbo.takewiki_k3_md_currency_func_getScaleByItemID(1001)
if object_id('takewiki_k3_md_currency_func_getItemIDByName') is not null
drop function  takewiki_k3_md_currency_func_getItemIDByName
go
create function takewiki_k3_md_currency_func_getItemIDByName
(@FName nvarchar(80)) returns int
as
begin
  declare @FItemID int

select @FItemID =FItemID from takewiki_k3_md_currency_view
   where FName =@FName
   return @FItemID
end
go
--usage
--select dbo.takewiki_k3_md_currency_func_getItemIDByName('人民币')
--select dbo.takewiki_k3_md_currency_func_getItemIDByName('日元')
if object_id('takewiki_k3_md_currency_func_getItemIDByNumber') is not null
drop function  takewiki_k3_md_currency_func_getItemIDByNumber
go
create function takewiki_k3_md_currency_func_getItemIDByNumber
(@FNumber nvarchar(30)) returns int
as
begin
  declare @FItemID int

select @FItemID =FItemID from takewiki_k3_md_currency_view
   where FNumber =@FNumber
   return @FItemID
end
go
--usage

-- select dbo.takewiki_k3_md_currency_func_getitemidbynumber('RMB')
-- select dbo.takewiki_k3_md_currency_func_getitemidbynumber('JPY')


---takewiki_querytable 
if object_id('takewiki_k3_md_currency_func_getNameByItemID') is not null
drop function  takewiki_k3_md_currency_func_getNameByItemID
go
create function takewiki_k3_md_currency_func_getNameByItemID
(@FItemID int) returns nvarchar(80)
as
begin
  declare @FName nvarchar(80)

select @FName =FName from takewiki_k3_md_currency_view
   where FItemID =@FItemID
   return @FName
end
go
--usage

-- select dbo.takewiki_k3_md_currency_func_getNameByItemID(1)
-- select dbo.takewiki_k3_md_currency_func_getNameByItemID(1001)

-- takewiki_querytable 'takewiki_k3_md_currency_view'
if object_id('takewiki_k3_md_currency_func_getNumberByItemID') is not null
drop function takewiki_k3_md_currency_func_getNumberByItemID
go
create function takewiki_k3_md_currency_func_getNumberByItemID
(@FItemID int) returns nvarchar(30)
as
begin
  declare @FNumber nvarchar(30)

select @FNumber =FNumber from takewiki_k3_md_currency_view
   where FItemID =@FItemID
   return @FNumber
end
go
--usage
--  select dbo.takewiki_k3_md_currency_func_getNumberByItemID(1)
--  select dbo.takewiki_k3_md_currency_func_getNumberByItemID(1001)
if object_id('takewiki_k3_md_currency_func_getScaleByItemID') is not null
drop function  takewiki_k3_md_currency_func_getScaleByItemID
go
create function takewiki_k3_md_currency_func_getScaleByItemID
(@FItemID int) returns int
as
begin
  declare @FScale int

select @FScale =FScale from takewiki_k3_md_currency_view
   where FItemID =@FItemID
   return @FScale
end
go
--usage
--select dbo.takewiki_k3_md_currency_func_getScaleByItemID(1)
--select dbo.takewiki_k3_md_currency_func_getScaleByItemID(1001)

if  object_id(N'takewiki_k3_md_itemclass_func_getItemClassIDByName') is not null
begin
drop function takewiki_k3_md_itemclass_func_getItemClassIDByName
end
go
create function takewiki_k3_md_itemclass_func_getItemClassIDByName (@FName nvarchar(30))
returns int
as
begin
declare @FItemClassID int
select  @FitemClassID= FItemClassid from takewiki_k3_md_itemclass_view
where FName =@FName
return @FItemClassID
end
go
---select dbo.takewiki_k3_md_itemclass_func_getItemClassIDByName('供应商')
if  object_id(N'takewiki_k3_md_itemclass_func_getSQLTableNameByName') is not null
begin
drop function takewiki_k3_md_itemclass_func_getSQLTableNameByName
end
go
create function takewiki_k3_md_itemclass_func_getSQLTableNameByName (@FName nvarchar(30))
returns nvarchar(50)
as
begin
declare @SQLTableName nvarchar(50)
select  @SQLTableName= FSQLTableName from takewiki_k3_md_itemclass_view
where FName =@FName
return @SQLTableName
end
go
---select dbo.takewiki_k3_md_itemclass_func_getSQLTableNameByName('供应商')
if OBJECT_ID('takewiki_k3_md_itemclass_sp_getCountByName') is not null
drop proc takewiki_k3_md_itemclass_sp_getCountByName
go
create proc takewiki_k3_md_itemclass_sp_getCountByName(@FName nvarchar(30),@Count int out)
as
begin
declare @sql nvarchar(400)
select  @sql =N'select  @count = count(1) from takewiki_k3_md_itemclass_view where FName =@FName';
exec sp_executesql @sql,N'@count int out,@FName nvarchar(30)',@Count out,@FName
end
go
--Usage 

 --declare @count int 
 --exec takewiki_k3_md_itemclass_sp_getCountByName N'客户',@count out
 --select @count
if OBJECT_ID('takewiki_k3_md_itemclass_func_getCountByName') is not null
drop function  takewiki_k3_md_itemclass_func_getCountByName
go
create function  takewiki_k3_md_itemclass_func_getCountByName (@FName nvarchar(30))
returns int
as
begin
declare @count int
select  @count = count(1) from takewiki_k3_md_itemclass_view where FName =@FName
return @count
end
go
--Usage 
--select dbo.takewiki_k3_md_itemclass_func_getCountByName('供应商')
if OBJECT_ID(N'takewiki_k3_md_itemclass_sp_Show') is not null
begin 
drop proc takewiki_k3_md_itemclass_sp_Show
end
go
create proc takewiki_k3_md_itemclass_sp_Show
as
begin
select * from  takewiki_k3_md_itemclass_view
end
go
--usage
--exec takewiki_k3_md_itemclass_sp_Show
exec tsda_funcFactory_getCurrentLevel 
'takewiki_k3_md_customer_func_getCurrentLevel',
'takewiki_k3_md_customer_view','FItemID','FLevel'
---tsda takewiki_k3_md_customer_view

--select dbo.takewiki_k3_md_customer_func_getCurrentLevel(388)
--select dbo.takewiki_k3_md_customer_func_getCurrentLevel(384)
go
exec tsda_funcFactory_getItemIDByLevel 'takewiki_k3_md_customer_func_getItemIDByLevel',
'takewiki_k3_md_customer_func_getCurrentLevel',
'takewiki_k3_md_customer_func_getParentIDByLevel'

---  tsda 'takewiki_k3_md_customer_view'
 
 --  select dbo.takewiki_k3_md_customer_func_getItemIDByLevel(389,3)
  --  select dbo.takewiki_k3_md_customer_func_getItemIDByLevel(389,2)
   --  select dbo.takewiki_k3_md_customer_func_getItemIDByLevel(389,1)
go
 --tsda 'takewiki_k3_md_customer_view'
 --go
 tsda_funcFactory_getItemIDByNumber 'takewiki_k3_md_customer_func_getItemIDByNumber',
 'takewiki_k3_md_customer_view',
'FItemID',
 'FNumber'
 --go
 --select dbo.takewiki_k3_md_customer_func_getItemIDByNumber('004')
 --select dbo.takewiki_k3_md_customer_func_getItemIDByNumber('005')
 go

 -- tsda 'takewiki_k3_md_department_view'
tsda_funcFactory_getNameByItemID 'takewiki_k3_md_customer_func_getNameByItemID',
'takewiki_k3_md_customer_view',
'FItemID',
'FName'

--tsda takewiki_k3_md_customer_view
--select dbo.takewiki_k3_md_customer_func_getNameByItemID(378)
--select dbo.takewiki_k3_md_customer_func_getNameByItemID(379)
go
exec  tsda_funcFactory_getParentIDByLevel 'takewiki_k3_md_customer_func_getParentIDByLevel',
'takewiki_k3_md_customer_view',
'FItemID',
'FParentID',
'FLevel'

--tsda 'takewiki_k3_md_customer_view'
--select dbo.takewiki_k3_md_customer_func_getParentIDByLevel(388,3)
--select dbo.takewiki_k3_md_customer_func_getParentIDByLevel(388,2)
--select dbo.takewiki_k3_md_customer_func_getParentIDByLevel(388,1)
go

exec tsda_funcFactory_getCurrentLevel 
'takewiki_k3_md_department_func_getCurrentLevel',
'takewiki_k3_md_department_view','FItemID','FLevel'
---tsda takewiki_k3_md_department_view

--select dbo.takewiki_k3_md_department_func_getCurrentLevel(235)
--select dbo.takewiki_k3_md_department_func_getCurrentLevel(255)
go
exec tsda_funcFactory_getItemIDByLevel 'takewiki_k3_md_department_func_getItemIDByLevel',
'takewiki_k3_md_department_func_getCurrentLevel',
'takewiki_k3_md_department_func_getParentIDByLevel'

---  tsda 'takewiki_k3_md_department_view'
 
 --  select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,2)
  -- select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,1)
go
--tsda 'takewiki_k3_md_department_view'

exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_department_func_getItemIDByName',
 'takewiki_k3_md_department_view',
'FItemid',
'FName'
--select dbo.takewiki_k3_md_department_func_getItemIDByName('生产部')
go
 --tsda 'takewiki_k3_md_department_view'
 --go
 tsda_funcFactory_getItemIDByNumber 'takewiki_k3_md_department_func_getItemIDByNumber',
 'takewiki_k3_md_department_view',
'FItemID',
 'FNumber'
 --go
 --select dbo.takewiki_k3_md_department_func_getItemIDByNumber('002')
 --select dbo.takewiki_k3_md_department_func_getItemIDByNumber('6.08')
 
 go
 -- tsda 'takewiki_k3_md_department_view'
tsda_funcFactory_getNameByItemID 'takewiki_k3_md_department_func_getNameByItemID',
'takewiki_k3_md_department_view',
'FItemID',
'FName'
--select dbo.takewiki_k3_md_department_func_getNameByItemID(234)
--select dbo.takewiki_k3_md_department_func_getNameByItemID(243)
go
 --tsda 'takewiki_k3_md_department_view'
 tsda_funcFactory_getNumberByItemID 'takewiki_k3_md_department_func_getNumberByItemID',
 'takewiki_k3_md_department_view',
'FItemID',
 'FNumber'
 --select dbo.takewiki_k3_md_department_func_getNumberByItemID(234)
 --select dbo.takewiki_k3_md_department_func_getNumberByItemID(243)
 go
 exec tsda_funcFactory_getParentIDByLevel 'takewiki_k3_md_department_func_getParentIDByLevel',
'takewiki_k3_md_department_view','FItemID','FParentID','FLevel'
-- select dbo.takewiki_k3_md_department_func_getParentIDByLevel(259,1)
go

