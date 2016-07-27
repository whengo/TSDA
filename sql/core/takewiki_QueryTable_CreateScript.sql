if object_id('takewiki_QueryTable') is not null
   drop proc  takewiki_QueryTable
go
create  proc takewiki_QueryTable
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
--usage

-- exec takewiki_QueryTable 'icstockbill','*','AIS20160721134104'
-- exec takewiki_QueryTable 'icstockbill','*'
-- exec takewiki_QueryTable 'icstockbill','*','AIS20160721134104'
-- exec takewiki_QueryTable 'icstockbillentry','*'
-- exec takewiki_QueryTable 't_account','faccountid,fnumber,fname','AIS20141027173850'
