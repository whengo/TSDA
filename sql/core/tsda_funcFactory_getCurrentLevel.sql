if object_id('tsda_funcFactory_getCurrentLevel') is not null 
drop  proc tsda_funcFactory_getCurrentLevel
go
create proc tsda_funcFactory_getCurrentLevel
(@Func_Name nvarchar(80),@Table_view_name nvarchar(80),@ID_Field_Name nvarchar(30),
@Level_Field_Name nvarchar(30) )
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FItemid  int ) returns int
as
begin --0
declare @FLevel int
select @FLevel = '+@Level_Field_Name +N'  from   '+ @Table_view_name +
N'  where '+@ID_Field_Name + N' = @FItemid '+
N'
return @FLevel
end
'
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

--exec tsda_funcFactory_getCurrentLevel 'takewiki_k3_md_department_func_getCurrentLevel'，'takewiki_k3_md_department_view','FItemID','FLevel'
--tsda takewiki_k3_md_department_view

--select dbo.takewiki_k3_md_department_func_getCurrentLevel(235)
--select dbo.takewiki_k3_md_department_func_getCurrentLevel(255)
