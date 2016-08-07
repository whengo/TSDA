alter table icstockbill add fautocreateperiod nvarchar(4000)

select fautocreateperiod  from icstockbill

alter  table  icstockbill drop column  fautocreateperiod