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