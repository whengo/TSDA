if OBJECT_ID(N'takewiki_k3_md_itemclass_sp_Show') is not null
begin 
drop proc takewiki_k3_md_itemclass_sp_Show
end
go
create proc takewiki_k3_md_itemclass_sp_Show
as
select * from  takewiki_k3_md_itemclass_view
--usage
--exec takewiki_k3_md_itemclass_sp_Show
go