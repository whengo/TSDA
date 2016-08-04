---solution for bei jing 
update a  set a.FVchInterID=0    from  icstockbill  a where 
a.FInterID  in 
(
select finterid from ICStockBill  a 
where a.FDate between '2016-06-01' and '2016-06-30'
and a.FTranType=21
and a.FVchInterID not in 
(select FVoucherID from t_Voucher))
