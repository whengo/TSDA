if object_id('tsda_funcFactory_getParentIDByLevel') is not null 
drop  proc tsda_funcFactory_getParentIDByLevel
go
create proc tsda_funcFactory_getParentIDByLevel
(@Func_Name nvarchar(80),@Table_view_name nvarchar(80),@ID_Field_Name nvarchar(30),@Parent_Field_Name nvarchar(30),@Level_Field_name nvarchar(30) )
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre = N'if object_id('+char(39)+@Func_Name+char(39)+N') is not null
drop function   '+@Func_Name 
select @sql_run =N'create function  '+@Func_Name +N'(@FItemid  int,  @FLevel int) returns int
as
begin --0
declare @FParentID int
declare @CurrentLevel int  
  select @CurrentLevel = '+space(3)+@Level_Field_name+N' from  '+@Table_view_name +
N'  where   '+@ID_Field_Name+N'=@FItemID
 if @FLevel>= @CurrentLevel
 select @FParentID = -1
 else
 begin--1
      declare @i int
      select @i=@FItemid
      declare @tempParentid int  '+
   N' select @tempParentID  =  '+@Parent_Field_Name +N'  from  '+ @Table_view_name +
   N'  where  '+@ID_Field_Name +N'  =@i  '+
      N'select @CurrentLevel = @CurrentLevel -1
      while @CurrentLevel>@Flevel
      begin --2
      select @i = @tempParentID
      select @tempParentID =  '+ @Parent_Field_Name  +N'  from  '+@Table_view_name +
   N'  where  ' +@ID_Field_Name +N' =  @i   
   select @CurrentLevel =   @CurrentLevel -1     
      
      end --2
      select @FParentID  =  @tempParentID
   
 end --1
 
 return @FParentid

end --0'
exec sp_executesql @sql_pre
exec sp_executesql @sql_run
end

go

--usage

---exec tsda_funcFactory_getParentIDByLevel 'test_fuc_getParentIDByLevel','test_parent','FItemID','FParentID','FLevel'
---select dbo.test_fuc_getParentIDByLevel(5,1)

--- sp_helptext tsda_funcFactory_getParentIDByLevel



---create table  test_parent
-- (--- FItemID int,FParentID int ,Flevel int )

-- insert into test_parent values(1,null,1)
-- insert into test_parent values(2,null,1)
-- insert into test_parent values(3,null,1)
-- insert into test_parent values(4,1,2)
-- insert into test_parent values(5,1,2)
-- insert into test_parent values(6,4,3)
-- insert into test_parent values(7,4,3)
-- insert into test_parent values(8,5,3)


-- select * from test_parent


-- exec tsda_funcFactory_getParentIDByLevel 'test_fuc_getParentIDByLevel','test_parent','FItemID','FParentID','FLevel'

-- select dbo.test_fuc_getParentIDByLevel(5,1)