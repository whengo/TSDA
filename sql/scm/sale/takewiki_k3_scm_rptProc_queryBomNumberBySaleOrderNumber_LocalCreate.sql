if object_id('takewiki_k3_scm_rptProc_queryBomNumberBySaleOrderNumber') is not null
drop proc takewiki_k3_scm_rptProc_queryBomNumberBySaleOrderNumber
go
create proc takewiki_k3_scm_rptProc_queryBomNumberBySaleOrderNumber
(@Fnumber nvarchar(30))
as
begin
set nocount on
select s.FDate 订单日期 ,s.FBillNo 订单编号,ic.FNumber 物料代码,ic.FName 物料名称,isnull(b.FBOMNumber,'') as BOM编号  from SEOrder s
inner join seorderentry se 
on s.finterid=se.finterid
inner join t_icitem  ic
on se.FItemID=ic.FItemID
left join ICBOM  b
on se.FItemID=b.FItemID
where s.FBillNo =@Fnumber
---order by s.FBillNo
end
