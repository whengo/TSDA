if OBJECT_ID('takewiki_k3_md_itemclass_sp_getCountByName') is not null
drop proc takewiki_k3_md_itemclass_sp_getCountByName
go
create proc takewiki_k3_md_itemclass_sp_getCountByName(@FName nvarchar(30),@Count int out)
as
begin
declare @sql nvarchar(400)
select  @sql =N'select  @count = count(1) from takewiki_k3_md_itemclass_view where FName =@FName';
exec sp_executesql @sql,N'@count int out,@FName nvarchar(30)',@Count out,@FName
end
go
--Usage 

 --declare @count int 
 --exec takewiki_k3_md_itemclass_sp_getCountByName N'客户',@count out
 --select @count
