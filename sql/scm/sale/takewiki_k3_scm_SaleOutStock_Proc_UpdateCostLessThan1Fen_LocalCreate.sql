if object_id('takewiki_k3_scm_saleOutStock_proc_UpdateCostLessThan1Fen') is not null
drop proc takewiki_k3_scm_saleOutStock_proc_UpdateCostLessThan1Fen
go
create proc takewiki_k3_scm_saleOutStock_proc_UpdateCostLessThan1Fen
	(@DBName nvarchar(30),@EndDate datetime)
as
begin
set nocount on 
declare @sql nvarchar(max)
select @sql = N'
update ie set ie.FAmount=case when abs(ie.FQty*ie.FPrice)>=0.01 then ie.FQty*ie.FPrice else SIGN(ie.FQty*ie.FPrice)*0.01 end
  from  '+@DBName +N'.dbo.icstockbill a 
inner join  '+@DBName+N'.dbo.ICStockBillEntry  ie
on a.FInterID=ie.FInterID
where a.FTranType=21 and abs(ie.FAmount)<0.01 and ie.fprice <>0
and a.FDate  <=  @FDate'
--print @sql
exec sp_executesql @sql,N'@FDate datetime',@EndDate
end
go

-- exec takewiki_k3_scm_saleOutStock_proc_UpdateCostLessThan1Fen  'AIS20141027173850','2016-08-01'
