

if object_id('takewiki_k3_md_account_getCurrentLevel') is not null
drop function  takewiki_k3_md_account_getCurrentLevel
go
create function takewiki_k3_md_account_getCurrentLevel
(@FItemID int) returns int
as
begin
declare @FLevel int
select @FLevel=flevel  from takewiki_k3_md_account_view
where FItemID = @FItemID
return @FLevel
end
go
--usage
-- select dbo.takewiki_k3_md_account_getCurrentLevel(1051)
-- select dbo.takewiki_k3_md_account_getCurrentLevel(1091)