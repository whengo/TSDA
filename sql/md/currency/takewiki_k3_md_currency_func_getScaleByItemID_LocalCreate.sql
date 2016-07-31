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