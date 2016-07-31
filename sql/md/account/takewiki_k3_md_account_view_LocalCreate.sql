if object_id('takewiki_k3_md_account_view') is not null
drop view takewiki_k3_md_account_view
go
create view takewiki_k3_md_account_view
as
select *  from  takewiki_k3_md_coa_view
go
---select * from takewiki_k3_md_account_view
--note by hawken.hu form takewiki
---select *  from  takewiki_k3_md_coa_view
---the two view is just has the same function
--视图不会自动更新，尤其是当takewiki_k3_md_coa_view的结构发生改变时
--因此需要重运行此脚本，相当于升级了一次，这个是一个bug