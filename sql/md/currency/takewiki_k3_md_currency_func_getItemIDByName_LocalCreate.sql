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