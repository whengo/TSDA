--tsda 'takewiki_k3_md_department_view'

exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_department_func_getItemIDByName',
 'takewiki_k3_md_department_view',
'FItemid',
'FName'
--select dbo.takewiki_k3_md_department_func_getItemIDByName('生产部')
