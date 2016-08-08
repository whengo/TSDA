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