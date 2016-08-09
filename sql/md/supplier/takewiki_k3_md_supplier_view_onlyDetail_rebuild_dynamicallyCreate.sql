
if OBJECT_ID('takewiki_k3_md_supplier_view_onlyDetail_rebuild') is not null
drop proc takewiki_k3_md_supplier_view_onlyDetail_rebuild
go
create proc takewiki_k3_md_supplier_view_onlyDetail_rebuild
as
begin
--@FromDB 用于指定事实表的来源，主要包括来源于
--1） 来源于K3ERP数据库
--2） 来源于TSDA分析系统数据库
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_supplier_view_onlyDetail'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_supplier_view_onlyDetail'
---select @sql_pre
exec sp_executesql @sql_pre

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_supplier_view_onlyDetail '+N'
 as'+space(3)+N'
select * from takewiki_k3_md_supplier_view
where fdetail=1  '


exec sp_executesql @sql_run
end
go

---takewiki_k3_md_supplier_view_onlyDetail_rebuild
--   tsda 'takewiki_k3_md_supplier_view_onlyDetail'
