 --tsda 'takewiki_k3_md_supplier_view'
 --go
 tsda_funcFactory_getItemIDByNumber 'takewiki_k3_md_supplier_func_getItemIDByNumber',
 'takewiki_k3_md_supplier_view',
'FItemID',
 'FNumber'
 --go
 --select dbo.takewiki_k3_md_supplier_func_getItemIDByNumber('01.001')
 --select dbo.takewiki_k3_md_supplier_func_getItemIDByNumber('01.045')
