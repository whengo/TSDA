if object_id('tsda_funcFactory_getNameByItemID') is not null 
drop  proc tsda_funcFactory_getNameByItemID
go
create proc tsda_funcFactory_getNameByItemID
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Name_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' ( @FItemID int ) returns nvarchar(80)
as
begin --0
declare @FName nvarchar(80)'+
N' select @FName =  '+ @Name_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@ItemID_Field_Name +N'  = @FItemID
   return @FName
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

-- tsda 'takewiki_k3_md_department_view'
-- tsda_funcFactory_getNameByItemID 'takewiki_k3_md_department_func_getNameByItemID',
-- 'takewiki_k3_md_department_view',
--'FItemID',
-- 'FName'
-- select dbo.takewiki_k3_md_department_func_getNameByItemID(234)
-- select dbo.takewiki_k3_md_department_func_getNameByItemID(243)


