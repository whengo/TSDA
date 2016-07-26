
if  object_id(N'takewiki_k3_md_itemclass_func_getItemClassIDByName') is not null
begin
drop function takewiki_k3_md_itemclass_func_getItemClassIDByName
end
go
create function takewiki_k3_md_itemclass_func_getItemClassIDByName (@FName nvarchar(30))
returns int
as
begin
declare @FItemClassID int
select  @FitemClassID= FItemClassid from takewiki_k3_md_itemclass_view
where FName =@FName
return @FItemClassID
end
go
---select dbo.takewiki_k3_md_itemclass_func_getItemClassIDByName('供应商')