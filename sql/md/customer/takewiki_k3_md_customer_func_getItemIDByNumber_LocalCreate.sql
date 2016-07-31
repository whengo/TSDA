 --tsda 'takewiki_k3_md_customer_view'
 --go
 tsda_funcFactory_getItemIDByNumber 'takewiki_k3_md_customer_func_getItemIDByNumber',
 'takewiki_k3_md_customer_view',
'FItemID',
 'FNumber'
 --go
 --select dbo.takewiki_k3_md_customer_func_getItemIDByNumber('004')
 --select dbo.takewiki_k3_md_customer_func_getItemIDByNumber('005')