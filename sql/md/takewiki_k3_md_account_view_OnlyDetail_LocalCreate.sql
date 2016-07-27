if object_id('takewiki_k3_md_account_view_OnlyDetail') is not null
drop view takewiki_k3_md_account_view_OnlyDetail
go
create view takewiki_k3_md_account_view_OnlyDetail
as
select  * from takewiki_k3_md_account_view
where fdetail=1
go

--takewiki_QueryTable 'takewiki_k3_md_account_view_OnlyDetail'