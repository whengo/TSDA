if OBJECT_ID('takewiki_k3_md_account_view_Ext1_rebuild') is not null
drop proc takewiki_k3_md_account_view_Ext1_rebuild
go

create proc takewiki_k3_md_account_view_Ext1_rebuild (@FromDB nvarchar(50)='')
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_account_view_Ext1'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_account_view_Ext1'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_account_view_Ext1 '+N'
 as'+space(3)+N'
select faccountid as FItemID,FFullName,FGroupID from  '
+@FromDB+N'.dbo.t_account '

exec sp_executesql @sql_run
end
go

---takewiki_k3_md_account_view_Ext1_rebuild ''
--   tsda 'takewiki_k3_md_account_view_Ext1'
-- takewiki_k3_md_account_view_Ext1_rebuild 'AIS20141027173850'

