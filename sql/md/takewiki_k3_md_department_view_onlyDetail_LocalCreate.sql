﻿if object_id('takewiki_k3_md_department_view_onlyDetail') is not null
drop view takewiki_k3_md_department_view_onlyDetail
go
create view takewiki_k3_md_department_view_onlyDetail
as
select * from takewiki_k3_md_department_view
where fdetail=1
go
--tsda takewiki_k3_md_department_view_onlyDetail