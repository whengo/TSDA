if object_id('takewiki_k3_scm_SaleOutStock_proc_ClearHookQtyByBillNo') is not null
drop proc takewiki_k3_scm_SaleOutStock_proc_ClearHookQtyByBillNo
go
create proc takewiki_k3_scm_SaleOutStock_proc_ClearHookQtyByBillNo
(@FBillNo nvarchar(30))
as 
--
--exec takewiki_k3_scm_SaleOutStock_proc_ClearHookQtyByBillNo
--for the saleOutStock after hook with saleInovice,when unHook the SaleInvoice
--should also Clear the hook qty on the saleoutstock

begin
set nocount on
update  a set  FAllHookQTY =0  from icstockbillentry a 
inner join icstockbill b
on a.finterid=b.finterid
where b.fbillno =@FBillNo and b.ftrantype=21
select 'updated' as result
end

--useage
-- exec takewiki_k3_scm_SaleOutStock_proc_ClearHookQtyByBillNo 'XOUT000010'