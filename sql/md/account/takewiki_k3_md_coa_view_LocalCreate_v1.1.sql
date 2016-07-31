if object_id('takewiki_k3_md_COA_view') is not null
drop view takewiki_k3_md_COA_view
go
create view takewiki_k3_md_COA_view
as
select faccountid as FItemID,fnumber,fname,flevel,fdetail,fparentid,fdelete from t_account
go
---select *from takewiki_k3_md_coa_view

--v1.0
--select faccountid,fnumber,fname,flevel,fdetail,fparentid,fdelete from t_account
--v1.1
--change log
--select faccountid as FItemID,fnumber,fname,flevel,fdetail,fparentid,fdelete from t_account
