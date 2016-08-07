if object_id('takewiki_k3_scm_rptProc_queryBomNumberBySaleDateRange') is not null
drop proc takewiki_k3_scm_rptProc_queryBomNumberBySaleDateRange
go
create proc takewiki_k3_scm_rptProc_queryBomNumberBySaleDateRange
(
@StartDate datetime,
@EndDate datetime
)
as
begin
select 
s.FDate  销售订单日期,s.FBillNo 订单编号,ic.FNumber 物料代码,ic.FName 物料名称, ic.fmodel 规格型号,
isnull(b.FBOMNumber,'') as  BOM编号 from SEOrder s
inner join seorderentry se 
on s.finterid=se.finterid
inner join t_icitem  ic
on se.FItemID=ic.FItemID
left join ICBOM  b
on se.FItemID=b.FItemID
where s.FDate between @StartDate and @EndDate
order by s.fdate,s.FBillNo
end

--usage
--  exec takewiki_k3_scm_rptProc_queryBomNumberBySaleDateRange '2016-07-01','2016-07-31'