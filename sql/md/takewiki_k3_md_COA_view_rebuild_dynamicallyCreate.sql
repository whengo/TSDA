﻿if object_id('takewiki_k3_md_COA_view_rebuild') is not null
drop proc takewiki_k3_md_COA_view_rebuild
go
create proc takewiki_k3_md_COA_view_rebuild (@FromDB nvarchar(50)='')
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
if @FromDB = ''
   select @FromDB = db_name()
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_COA_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_COA_view'
--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_COA_view '+N'
 as
select faccountid as FItemID,fnumber,fname,flevel,fdetail,fparentid,fdelete from  '+@FromDB+N'.dbo.t_account
go'
--select @sql_pre
---select @sql_run
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

--  exec takewiki_k3_md_COA_view_rebuild
--  exec takewiki_k3_md_COA_view_rebuild 'AIS20141027173850'
--  exec takewiki_k3_md_COA_view_rebuild 'AIS20160721134104'

---  takewiki_querytable 'takewiki_k3_md_COA_view'