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

FROM dbo.Employees

WHERE Org_Node.IsDescendantOf(@EmpNode)= 1;


