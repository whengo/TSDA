if OBJECT_ID(N'takewiki_k3_md_currency_view') is not null
begin
drop view takewiki_k3_md_currency_view
end
go
create view takewiki_k3_md_currency_view
as
select fcurrencyID as FItemID,FNumber,FName,FScale,FDeleted from t_currency

go

--select * from  takewiki_k3_md_currency_view