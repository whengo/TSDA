--rsda definition
--one of the core proc in tsda 
if object_id('tsda') is not null
   drop proc tsda
go
create  proc tsda
(
@TableName nvarchar (80) ='t_icitem',
@FieldList nvarchar (400)='*',
@DBName nvarchar(50)='',
@DBType nvarchar(30)='K3ERP', 
@Schema nvarchar (30)='dbo')
as

set nocount on 
begin
declare @sql nvarchar(max)=N''
if @DBName =''
  begin
  select @DBName = db_name()
  end
if @DBType = 'K3ERP'
begin
select @sql=N'select '+@FieldList+N'  from  '+@DBName+N'.'+@Schema+N'.'+@TableName 
end
exec sp_executesql @sql
end
go
