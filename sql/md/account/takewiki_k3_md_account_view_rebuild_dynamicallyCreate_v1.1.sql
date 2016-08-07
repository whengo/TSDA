if OBJECT_ID('takewiki_k3_md_account_view_rebuild') is not null
drop proc takewiki_k3_md_account_view_rebuild
go
--deptect whether the proc takewiki_k3_md_account_view_rebuild exitsts
--if exits then delete the proc 
create proc takewiki_k3_md_account_view_rebuild (@FromDB nvarchar(50)='')
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_account_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_account_view'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_account_view '+N'
 as'+space(3)+N'
select faccountid as FItemID,fnumber,fname,flevel,fdetail,fparentid,fdelete from  '
+@FromDB+N'.dbo.t_account '

exec sp_executesql @sql_run
end
go

---takewiki_k3_md_account_view_rebuild ''
--   tsda 'takewiki_k3_md_account_view'
-- takewiki_k3_md_account_view_rebuild 'AIS20141027173850'
---takewiki_k3_md_account_view_rebuild 'AIS20160721134104'
---sp_helptext takewiki_k3_md_customer_view
---tsda  takewiki_k3_md_customer_view 
