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