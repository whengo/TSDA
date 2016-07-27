if object_id('takewiki_k3_md_account_view_Ext1') is not null
  drop view takewiki_k3_md_account_view_Ext1
go
create view takewiki_k3_md_account_view_Ext1
as
select faccountid,FFullName,FGroupID from t_account
go
-- usage
-- select * from  takewiki_k3_md_account_view_Ext1