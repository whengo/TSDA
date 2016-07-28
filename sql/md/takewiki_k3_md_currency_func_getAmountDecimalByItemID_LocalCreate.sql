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