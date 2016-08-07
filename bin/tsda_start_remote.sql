declare @DBName nvarchar(30)
select @DBName ='数据库'
exec takewiki_k3_md_account_view_rebuild @DBName
exec takewiki_k3_md_account_view_Ext1_rebuild @DBName
exec takewiki_k3_md_account_view_onlyDetail_rebuild 
exec takewiki_k3_md_currency_view_rebuild @DBName