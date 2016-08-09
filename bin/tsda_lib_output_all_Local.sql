﻿if object_id('takewiki_k3_md_account_view_MDXFormat') is not null
drop view takewiki_k3_md_account_view_MDXFormat
go
create view  takewiki_k3_md_account_view_MDXFormat
as
select 
FItemID,FNumber,FName,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,1) as FItemID_L1,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,1)) as FNumber_L1,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,1)) as FName_L1,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,2) as FItemID_L2,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,2)) as FNumber_L2,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,2)) as FName_L2,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,3) as FItemID_L3,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,3)) as FNumber_L3,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,3)) as FName_L3,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,4) as FItemID_L4,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,4)) as FNumber_L4,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,4)) as FName_L4,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,5) as FItemID_L5,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,5)) as FNumber_L5,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,5)) as FName_L5,
dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,6) as FItemID_L6,
dbo.takewiki_k3_md_account_func_getNumberByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,6)) as FNumber_L6,
dbo.takewiki_k3_md_account_func_getNameByItemID(dbo.takewiki_k3_md_account_func_getItemIDByLevel(FItemID,6)) as FName_L6
 from takewiki_k3_md_account_view_OnlyDetail
 go
 --usage

 --takewiki_querytable 'takewiki_k3_md_account_view_MDXFormat' 
if object_id('takewiki_k3_md_department_view_MDXFormat') is not null
drop view takewiki_k3_md_department_view_MDXFormat
go
create view  takewiki_k3_md_department_view_MDXFormat
as
select 
FItemID,FNumber,FName,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,1) as FItemID_L1,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,1)) as FNumber_L1,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,1)) as FName_L1,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,2) as FItemID_L2,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,2)) as FNumber_L2,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,2)) as FName_L2,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,3) as FItemID_L3,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,3)) as FNumber_L3,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,3)) as FName_L3,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,4) as FItemID_L4,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,4)) as FNumber_L4,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,4)) as FName_L4,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,5) as FItemID_L5,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,5)) as FNumber_L5,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,5)) as FName_L5,
dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,6) as FItemID_L6,
dbo.takewiki_k3_md_department_func_getNumberByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,6)) as FNumber_L6,
dbo.takewiki_k3_md_department_func_getNameByItemID(dbo.takewiki_k3_md_department_func_getItemIDByLevel(FItemID,6)) as FName_L6
 from takewiki_k3_md_department_view_OnlyDetail
 go
 --usage

 --tsda 'takewiki_k3_md_department_view_MDXFormat' 
 if object_id('takewiki_k3_md_customer_view_MDXFormat') is not null
drop view takewiki_k3_md_customer_view_MDXFormat
go
create view  takewiki_k3_md_customer_view_MDXFormat
as
select 
FItemID,FNumber,FName,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,1) as FItemID_L1,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,1)) as FNumber_L1,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,1)) as FName_L1,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,2) as FItemID_L2,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,2)) as FNumber_L2,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,2)) as FName_L2,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,3) as FItemID_L3,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,3)) as FNumber_L3,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,3)) as FName_L3,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,4) as FItemID_L4,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,4)) as FNumber_L4,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,4)) as FName_L4,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,5) as FItemID_L5,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,5)) as FNumber_L5,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,5)) as FName_L5,
dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,6) as FItemID_L6,
dbo.takewiki_k3_md_customer_func_getNumberByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,6)) as FNumber_L6,
dbo.takewiki_k3_md_customer_func_getNameByItemID(dbo.takewiki_k3_md_customer_func_getItemIDByLevel(FItemID,6)) as FName_L6
 from takewiki_k3_md_customer_view_OnlyDetail
 go
 --usage

 --tsda'takewiki_k3_md_customer_view_MDXFormat' 