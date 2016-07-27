

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

