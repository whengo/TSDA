 ---solution 
update a set  a.FSourceEntryID=a.FEntryID 
 from ICStockBillEntry a
 inner join POOrderEntry b
 on a.FSourceInterId=b.FInterID
 and a.FItemID=b.FItemID

 where  a. FInterID=7304
go
 
 
  update b set  b.FEntryID =a.FSourceEntryID
 from ICStockBillEntry a
 inner join POOrderEntry b
 on a.FSourceInterId=b.FInterID
 and a.FItemID=b.FItemID

 where  a. FInterID=7304
go
