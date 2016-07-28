if object_id('takewiki_k3_md_currency_func_getRateByDate') is not null
drop function takewiki_k3_md_currency_func_getRateByDate
go
create function takewiki_k3_md_currency_func_getRateByDate
(@FItemID int,@FDate datetime,@CurrencyTypeName nvarchar(30)='公司汇率') returns decimal(18,8)
as
begin
  declare @FExchangeRate decimal(18,8)
 select @FExchangeRate = e.FExchangeRate  FROM  t_ExchangeRate  INNER JOIN
 t_ExchangeRateEntry  e ON t_ExchangeRate.FID=e.FID
 LEFT  JOIN t_Currency c ON e.FCyTo=c.FCurrencyID AND c.FCurrencyID<>0
 LEFT  JOIN v_BASE_ExRateType  ON e.FExchangeRateType=v_BASE_ExRateType.FID
 where v_BASE_ExRateType.fname=@CurrencyTypeName and  c.FCurrencyID=@FItemID
 and  @Fdate between e.fbegdate and e.fenddate
 return @FExchangeRate
---以上数据从汇率体系表中进行取值，主要包括t_ExchangeRateEntry，t_ExchangeRate
--- v_BASE_ExRateType为汇率类型，包括公司汇率与预算汇率2个预设项
end
go

--usage
-- declare @Fitemid int 
-- select @Fitemid = dbo.takewiki_k3_md_currency_func_getItemidbynumber('tk');
                       
-- select dbo.takewiki_k3_md_currency_func_getRateByDate (@Fitemid,'2016-06-05','公司汇率') 