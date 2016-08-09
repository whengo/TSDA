if object_id('takewiki_k3_md_department_view_rebuild') is not null
drop proc takewiki_k3_md_department_view_rebuild
go
create proc takewiki_k3_md_department_view_rebuild (@FromDB nvarchar(50)='')
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_md_department_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_md_department_view'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_md_department_view '+N'
 as'+space(3)+N'
select a.FItemID,a.FNumber,a.FName,a.FParentID,a.FLevel,a.FDetail,a.FDeleted,c.FName as FDeptProperty,d.FName as FCostCalcType from '
 +@FromDB+N'.dbo.t_item   a   left join  '
 +@FromDB+N'.dbo.t_department b  on a.FItemID=b.FItemID  left join  '
 +@FromDB+N'.dbo.t_submessage c on b.fdproperty=c.finterid left join '
 +@FromDB+N'.dbo.t_submessage d on b.FCostAccountType=d.finterid  where a.fitemclassid=2 
and c.ftypeid=303
and d.ftypeid=172 '+
N'union all
select e.FItemID,e.FNumber,e.FName,e.FParentID,e.FLevel,e.FDetail,e.FDeleted,'+char(39)+space(3)+char(39)+
N'  as FDeptProperty,'+char(39)+space(3)+char(39)+
N'  as FCostCalcType from '+@FromDB+N'.dbo.t_item e
where fitemclassid =2 and fdetail =0 '
--select @sql_pre
---select @sql_run

exec sp_executesql @sql_run
end
go

---takewiki_k3_md_department_view_rebuild ''
---sp_helptext takewiki_k3_md_deparment_view ''
---tsda  takewiki_k3_md_department_view 




--takewiki_k3_md_department_view_rebuild 'AIS20160721134104'

--takewiki_k3_md_department_view_rebuild 
--sp_helptext takewiki_k3_md_department_view
--drop view takewiki_k3_md_deparment_view
