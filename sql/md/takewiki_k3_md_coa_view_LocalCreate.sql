if object_id('takewiki_k3_md_COA_view') is not null
drop view takewiki_k3_md_COA_view
go
create view takewiki_k3_md_COA_view
as
select faccountid,fnumber,fname,flevel,fdetail,fparentid,fdelete from t_account
go
---select *from takewiki_k3_md_coa_view

