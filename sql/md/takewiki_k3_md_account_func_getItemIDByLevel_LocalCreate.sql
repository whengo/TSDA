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