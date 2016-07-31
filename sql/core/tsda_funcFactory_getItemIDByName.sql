if object_id('tsda_funcFactory_getItemIDByName') is not null 
drop  proc tsda_funcFactory_getItemIDByName
go
create proc tsda_funcFactory_getItemIDByName
(@Func_Name nvarchar(80),@Table_View_Name nvarchar(80),@ItemID_Field_Name  nvarchar(30),
@Name_Field_Name nvarchar(30))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FName nvarchar(80)) returns int
as
begin --0
declare @FItemID int '+
N' select @FItemID =  '+ @ItemID_Field_Name +N'  from  ' +@Table_View_Name
+N' where  '+@Name_Field_Name +N'  = @FName
   return @FItemID
end '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go


--tsda 'takewiki_k3_md_department_view'

--exec tsda_funcFactory_getItemIDByName 'takewiki_k3_md_department_func_getItemIDByName',
-- 'takewiki_k3_md_department_view',
--'FItemid',
--'FName'
--select dbo.takewiki_k3_md_department_func_getItemIDByName('生产部')

