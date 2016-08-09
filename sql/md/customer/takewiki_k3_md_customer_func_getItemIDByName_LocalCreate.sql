--tsda 'takewiki_k3_md_customer_view'

exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_customer_func_getItemIDByName',
 'takewiki_k3_md_customer_view',
'FItemid',
'FName'
--usage
--select dbo.takewiki_k3_md_customer_func_getItemIDByName('北京明浩公司')
--select dbo.takewiki_k3_md_customer_func_getItemIDByName('PCE El Paso USA')

