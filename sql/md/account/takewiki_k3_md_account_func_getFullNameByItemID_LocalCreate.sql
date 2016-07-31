if object_id('takewiki_k3_md_account_func_getFullNameByItemID') is not null
drop function takewiki_k3_md_account_func_getFullNameByItemID
go
create function takewiki_k3_md_account_func_getFullNameByItemID
(@FItemID int) returns nvarchar(250)
as
begin
declare @FFullName nvarchar(250)
   select @FFullName = FFullName from takewiki_k3_md_account_view_Ext1
   where FItemID = @FItemID
   return @FFullName
end
go
--usage

-- select dbo.takewiki_k3_md_account_func_getFullNameByItemID(1099)
--
--