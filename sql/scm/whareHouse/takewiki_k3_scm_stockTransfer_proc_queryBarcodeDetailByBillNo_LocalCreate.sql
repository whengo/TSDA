﻿if object_id('takewiki_k3_scm_stockTransfer_proc_queryBarcodeDetailByBillNo') is not null
drop proc takewiki_k3_scm_stockTransfer_proc_queryBarcodeDetailByBillNo
go
create proc takewiki_k3_scm_stockTransfer_proc_queryBarcodeDetailByBillNo( @billno varchar(30)   ) 
as     
begin    
select  a.FBillNo,a.FEntryID,ic.FNumber,ic.FName,ic.fmodel ,b.FBarcode,a.FQty,    
a.fusername FROM t_SUF_TranBarcodeDetail a    
inner join T_SUF_Barcode  b    
on a.FBarcodeID=b.FRowID    
inner join t_icitem ic     
on b.FItemID=ic.fitemid    
 where FTranTypeID=41 and FBillNo=@billno    
 order by a.FEntryID,b.FBarcode    
 end 