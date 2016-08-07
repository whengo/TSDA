
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




