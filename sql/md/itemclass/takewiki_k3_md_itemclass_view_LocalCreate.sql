if OBJECT_ID(N'takewiki_k3_md_itemclass_view') is not null
begin
drop view takewiki_k3_md_itemclass_view 
end
go
create view takewiki_k3_md_itemclass_view
as
select FItemClassID,FNumber,FName,FSQLTableName from t_ItemClass
go
