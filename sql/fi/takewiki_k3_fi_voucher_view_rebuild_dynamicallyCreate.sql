if object_id('takewiki_k3_fi_voucher_view_rebuild') is not null
drop proc takewiki_k3_fi_voucher_view_rebuild
go
create proc takewiki_k3_fi_voucher_view_rebuild (@FromDB nvarchar(50)='')
as
begin
declare @sql_pre nvarchar(max)
declare @sql_run nvarchar(max)
select @sql_pre =N'if object_id('+char(39)+N'takewiki_k3_fi_voucher_view'+char(39)+N') is not null
drop view  '+N'takewiki_k3_fi_voucher_view'
---select @sql_pre
exec sp_executesql @sql_pre
if @FromDB = ''
 begin
   select @FromDB = db_name()
 end

--char(39)是用于取代'的func
select @sql_run = N'create view  '+N'takewiki_k3_fi_voucher_view '+N'
 as'+space(3)+N'
select FVoucherID,FDate,FYear,FPeriod,FGroupID,FNumber,FExplanation,FDebitTotal,FCreditTotal,FInternalInd,FChecked,FPosted,FCheckerID,FPosterID,
FTranType,FTransDate from '+@FromDB+N'.dbo.t_Voucher'

--select @sql_pre
---select @sql_run

exec sp_executesql @sql_run
end
go

---takewiki_k3_fi_voucher_view_rebuild ''
-- takewiki_k3_fi_voucher_view_rebuild 'AIS20160721134104'
---tsda  takewiki_k3_fi_voucher_view