if  object_id(N'takewiki_k3_md_itemclass_func_getSQLTableNameByName') is not null
begin
drop function takewiki_k3_md_itemclass_func_getSQLTableNameByName
end
go
create function takewiki_k3_md_itemclass_func_getSQLTableNameByName (@FName nvarchar(30))
returns nvarchar(50)
as
begin
declare @SQLTableName nvarchar(50)
select  @SQLTableName= FSQLTableName from takewiki_k3_md_itemclass_view
where FName =@FName
return @SQLTableName
end
go
---select dbo.takewiki_k3_md_itemclass_func_getSQLTableNameByName('供应商')