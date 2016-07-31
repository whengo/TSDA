--建立表结构
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL

DROP TABLE dbo.Employees;

CREATE TABLE dbo.Employees

(

Org_Node hierarchyid NOT NULL,

EmployeeId INT NOT NULL,

Title VARCHAR(50) NOT NULL,

Org_Level AS Org_Node.GetLevel()

);

GO
--插入数据
INSERT INTO dbo.Employees VALUEs ('/',1,'总经理')

INSERT INTO dbo.Employees VALUEs ('/1/',2,'副总经理A')
INSERT INTO dbo.Employees VALUEs ('/2/',3,'副总经理B')

INSERT INTO dbo.Employees VALUEs ('/1/1/',4,'部门经理A')

INSERT INTO dbo.Employees VALUEs ('/1/2/',5,'部门经理B')

INSERT INTO dbo.Employees VALUEs ('/1/1/1/',6,'员工A')

--查询 
SELECT *,

Org_Node.ToString() AS Org_Node_Str

FROM dbo.Employees;

----查询父项节点 

DECLARE @EmpNode AS  hierarchyid;

SELECT @EmpNode = Org_Node

FROM dbo.Employees

WHERE EmployeeId = 4;

SELECT *,Org_Node.ToString() AS Org_Node_Str

FROM dbo.Employees

WHERE @EmpNode.IsDescendantOf(Org_Node) = 1;

---查询了项节点

DECLARE @EmpNode AS hierarchyid;

SELECT @EmpNode = Org_Node

FROM dbo.Employees

WHERE EmployeeId = 4; --节点为“/1/1/”

SELECT *,Org_Node.ToString() AS Org_Node_Str

--ToString() 而不是tostring()区分大小写这里
FROM dbo.Employees

WHERE Org_Node.IsDescendantOf(@EmpNode)= 1;

---
DECLARE @EmpNode AS hierarchyid;

SELECT @EmpNode = CAST('/' AS hierarchyid);

--实现转换

SELECT *,Org_Node.ToString() AS Org_Node_Str

FROM dbo.Employees

WHERE Org_Node.GetAncestor(2) = @EmpNode;

---增加新的节点
DECLARE @Manager AS hierarchyid, @Child1 AS hierarchyid;

SELECT @Manager = Org_Node

FROM dbo.Employees

WHERE EmployeeId = 5; --获取部门经理B的节点

SELECT @Child1 = Org_Node

FROM dbo.Employees

WHERE EmployeeId = 10; --获取上面语句新增员工B的节点

INSERT INTO dbo.Employees VALUES --在“/1/2/1/”后面新增一个节点

(@Manager.GetDescendant(@Child1, NULL), 11, '员工C');

--tsda 'employees'

select  org_node.toString() AS TTTT ,*  from  employees

SELECT *,

Org_Node.ToString() AS Org_Node_Str

FROM dbo.Employees;

SELECT  Org_Node.ToString() AS Org_Node_Str, *



FROM dbo.Employees;

---/1/2/1/


select org_node.getDecendant().ToString()  from employees
where employeeid=8