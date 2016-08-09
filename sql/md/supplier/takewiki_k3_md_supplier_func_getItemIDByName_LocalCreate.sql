--tsda 'takewiki_k3_md_supplier_view'

exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_supplier_func_getItemIDByName',
 'takewiki_k3_md_supplier_view',
'FItemid',
'FName'
--usage
--select dbo.takewiki_k3_md_supplier_func_getItemIDByName('南通精亮贸易有限公司')
--select dbo.takewiki_k3_md_supplier_func_getItemIDByName('徐张建')


