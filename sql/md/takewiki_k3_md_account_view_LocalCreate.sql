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