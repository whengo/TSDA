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