if object_id('tsda_funcFactory_getItemIDByLevel') is not null 
drop  proc tsda_funcFactory_getItemIDByLevel
go
create proc tsda_funcFactory_getItemIDByLevel
(@Func_Name nvarchar(80),@getCurrentLevel_func_name nvarchar(80),@getParentIDByLevel_func_Name nvarchar(80))
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N' (@FItemID int,@FLevel int ) returns int
as
begin --0
declare @LevelItemID int'+
N' if dbo.'+@getCurrentLevel_func_name+ N' (@FItemID) = @FLevel '+
N'   begin
select @LevelItemID = @FItemid
   end
   else
   begin
   select @LevelItemID = dbo.'+@getParentIDByLevel_func_Name+N' (@FItemID,@Flevel)
   end
    return @LevelItemID

end
   '
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end
go

-- exec tsda_funcFactory_getItemIDByLevel 'takewiki_k3_md_department_func_getItemIDByLevel',
-- 'takewiki_k3_md_department_func_getCurrentLevel',
-- 'takewiki_k3_md_department_func_getParentIDByLevel'
-- tsda 'takewiki_k3_md_department_view'
-- select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,2)
-- select dbo.takewiki_k3_md_department_func_getItemIDByLevel(258,1)
