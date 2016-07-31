if object_id('takewiki_k3_md_department_view_rebuild') is not null
drop proc takewiki_k3_md_department_view_rebuild
go
create proc takewiki_k3_md_department_view_rebuild (@FromDB nvarchar(50)='')
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
if @FromDB = ''
   select @FromDB = db_name()
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_department_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_department_view'
--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_department_view '+N'
 as'+space(3)+N'
select a.FItemID,a.FNumber,a.FName,a.FParentID,a.FLevel,a.FDetail,a.FDeleted,c.FName as FDeptProperty,d.FName as FCostCalcType from '
 +@FromDB+N'.dbo.t_item   a   inner join  '
 +@FromDB+N'.dbo.t_department b  on a.FItemID=b.FItemID  inner join  '
 +@FromDB+N'.dbo.t_submessage c on b.fdproperty=c.finterid inner join '
 +@FromDB+N'.dbo.t_submessage d on b.FCostAccountType=d.finterid  where a.fitemclassid=2 
and c.ftypeid=303
and d.ftypeid=172 '
--select @sql_pre
---select @sql_run
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

---takewiki_k3_md_department_view_rebuild AIS20160721134104
---sp_helptext takewiki_k3_md_deparment_view
---tsda  takewiki_k3_md_deparment_view 