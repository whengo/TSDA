SQL Server2008函数大全（完整版） 
SQL2008 表达式：是常量、变量、列或函数等与运算符的任意组合。
一、字符串函数
函数 名称 参数 示例 说明
ascii(字符串表达式)
select ascii('abc') 返回 97
说明：返回字符串中最左侧的字符的ASCII 码。
char(整数表达式)
select char(100) 返回 d
说明：把ASCII 码转换为字符。
介于0 和 255 之间的整数。如果该整数表达式不在此范围内，将返回
NULL 值。
charindex(字符串表达式 1, 字符串表达式2[,整数表达式])  instr
select charindex('ab','BCabTabD') 返回 3
select charindex('ab','BCabTabD',4) 返回 6
说明：在字符串2 中查找字符串 1，如果存在返回第一个匹配的位置，如果不存在返回0。如果字符串 1 和字符串 2 中有一个是null 则返回 null。可以指定在字符串2 中查找的起始位置。
patindex(字符串表达式 1，字符串表达式 2)
select patindex('%ab%','123ab456')返回4
select patindex('ab%','123ab456')返回0
select patindex('___ab%','123ab456')返回1
select patindex('___ab_','123ab456')返回0
说明：在字符串表达式1中可以使用通配符，此字符串的第一个字符和最后一个字符通常是%。%表示任意多个字符，_表示任意字符返回字符串表达式2中字符串表达式 1 所指定模式第一次出现的起始位置。没有找到返回0。
difference(字符串表达式 1，字符串表达式 2)
select difference('Green','Greene')返回 4
返回一个0 到 4 的整数值，指示两个字符表达式的之间的相似程度。
0 表示几乎不同或完全不同，
4 表示几乎相同或完全相同。
说明：注意相似并不代表相等
left(字符串表达式，整数表达式)
select left('abcdefg',2) 返回 ab
说明：返回字符串中从左边开始指定个数的字符。
right(字符串表达式，整数表达式)
select right('abcdefg',2) 返回 fg
说明：返回字符串中从右边开始指定个数的字符。
len(字符串表达式)
select len('abcdefg') 返回 7
select len('abcdefg') 返回 7
说明：返回指定字符串表达式的字符数，其中不包含尾随空格。
lower(字符串表达式)  lcase
select lower('ABCDEF') 返回 abcdef
说明：返回大写字符数据转换为小写的字符表达式。
upper(字符串表达式)  ucase
select upper('abcdef')返回 ABCDEF
说明：返回小写字符数据转换为大写的字符表达式。
ltrim(字符串表达式)
select ltrim('abc')返回 abc
说明：返回删除了前导空格之后的字符表达式。
rtrim(字符串表达式)
select rtrim('abc')返回 abc
说明：返回删除了尾随空格之后的字符表达式。
reverse(字符串表达式)
select reverse('abcde')返回 edcba
说明：返回指定字符串反转后的新字符串
space(整数表达式)
select 'a'+space(2)+'b' 返回 a b
说明：返回由指定数目的空格组成的字符串。
str（float 型小数[,总长度[,小数点后保留的位数]]）
select str(123.451)返回123(123前面有空格)
select str(123.451,3)返回123
select str(123.451,7,3)返回123.451
select str(123.451,7,1)返回123.5
select str(123.451,5,3)返回123.5
select str(123.651,2)返回**
说明：返回由数字转换成的字符串。返回字符数不到总长度的前面补空格，超过总长度的截断小数位。如果需要截断整数位则返回**。
注意在截断时遵循四舍五入总长度。它包括小数点、符号、数字以及空格。默认值为10。小数点后最多保留16 位。默认不保留小数点后面的数字。
stuff(字符串表达式 1，开始位置，长度，字符串表达式 2)
select stuff('abcdef',2,2,'123')
返回 a123def
说明：在字符串表达式1.中在指定的开始位置删除指定长度的字符，并在指定的开始位置处插入字符串表达式2返回新字符串。
substring(字符串表达式，开始位置，长度)  mid
select substring('abcdef',2,2) 返回bc
说明：返回子字符串
replace(字符串表达式 1，字符串表达式 2，字符串表达式 3)
Select replace('abcttabchhabc','abc','123')
返回 123tt123hh123
说明：1．用字符串表达式3 替换字符串表达式 1 中出现的所有字符串表达式2 的匹配项。返回新的字符串。

二、日期和时间函数
函数名称
参数 示例 说明
dateadd(日期部分，数字，日期)
select dateadd(year,45,'1990-12-11')
返回 2035-12-11 00:00:00.000
select dateadd(month,45,'1990-12-11')
返回 1994-09-11 00:00:00.000
select dateadd(mm,45,'1990-12-11')
返回 1994-09-11 00:00:00.000
select dateadd(qq,12,'1990-12-11')
返回 1993-12-11 00:00:00.000
select dateadd(hh,12,'1990-12-11')
返回 1990-12-11 12:00:00.000
select dateadd(yy,-12,'1990-12-11')
返回 1978-12-11 00:00:00.000
返回给指定日期加上一个时间间隔后的新的日期值。
数字：用于与指定的日期部分相加的值。如果指定了非整数值，
则将舍弃该值的小数部分，舍弃时不遵循四舍五入。
日期：指定的原日期
在此函数中
dw，dy，dd 效果一样都表示天
datediff(日期部分，开始日期，结束日期)  datedif
select datediff(yy,'1990-12-11','2008-9-10')
说明：返回两个指定日期的指定日期部分的差的整数值。
在计算时由结束日期减去开始日期
返回 18
Select  datediff(mm,'2007-12-11','2008-9-10')
返回 9
在此函数中dw，dy，dd 效果一样都表示天
datename(日期部分，日期)
select datename(mm,'2007-12-11') 返回 12
select datename(dw,'2007-12-11') 返回星期二
select datename(dd, '2007-12-11') 返回 11
说明：返回表示指定日期的指定日期部分的字符串。
dw 表示一星期中星期几，wk 表示一年中的第几个星期
dy 表示一年中的第几天
datepart(日期部分，日期)
select datepart(mm,'2007-12-11') 返回 12
select datepart(dw,'2007-12-11') 返回 3
select datepart(dd, '2007-12-11') 返回 11
说明：返回表示指定日期的指定日期部分的整数。
wk 表示一年中的第几个星期
dy 表示一年中的第几天,
dw 表示一星期中星期几，返回整数默认 1 为星期天
getdate无参数 date
select getdate()
返回 2009-04-28 18:57:24.153
说明：返回当前系统日期和时间。
day(日期)
select day('2007-12-11')返回 11
说明：返回一个整数，表示指定日期的天的部分。
等价于
datepart(dd, 日期)
month(日期)
select month('2007-12-11')返回 12
说明：返回一个整数，表示指定日期的月的部分。
等价于
datepart(mm, 日期)
year(日期)
select year('2007-12-11')返回2007
返回一个整数，表示指定日期的年的部分。
等价于
datepart(yy, 日期)
getutcdate无参数
select getutcdate()
返回2009-04-28 10:57:24.153
说明：返回表示当前的UTC(世界标准时间)时间。即格林尼治时间（GMT）。
三、 日期部分（指定要返回新值的日期的组成部分。下表列出了 Microsoft SQL Server 2008 可识别的日期部分及其缩写。）
日期部分
含义
缩写year年yy, yyyy
quarter季qq, q
month月mm, m
dayofyear天（请看函数中的说明）dy, y
day天（请看函数中的说明）dd, d
week星期wk, ww
weekday天（请看函数中的说明）dw, w
hour小时hh
minute分钟mi, n
second秒ss, s
millisecond毫秒ms
四、 数学函数
函数名称 参数 示例 说明
abs(数值表达式)
select abs(-23.4)返回 23.4
说明：返回指定数值表达式的绝对值（正值）
pi无参数
select pi()返回 3.14159265358979
说明：返回π的值
cos(浮点表达式)
select cos(pi()/3)返回 0.5
说明：返回指定弧度的余弦值
sin(浮点表达式)
select sin(pi()/6)返回 0.5
说明：返回指定弧度的正弦值
cot(浮点表达式)
select cot(pi()/4)返回 1
说明：返回指定弧度的余切值。
tan(浮点表达式)
select tan(pi()/4)返回 1
说明：返回指定弧度的正切值。
acos(浮点表达式)
select acos(0.5)返回 1.0471975511966
说明：返回其余弦是所指定的数值表达式的弧度，求反余弦。
asin(浮点表达式)
select asin(0.5)返回 0.523598775598299
说明：返回其正弦是所指定的数值表达式的弧度，求反正弦。
atan(浮点表达式)
select atan(1)返回0.785398163397448
返回其正切是所指定的数值表达式的弧度，求反正切。
degrees(数值表达式)
select degrees(pi()/4) 返回45
说明：返回以弧度指定的角的相应角度。
radians(数值表达式)
select radians(180.0)
返回3.1415926535897931
说明：返回指定度数的弧度值。注意如果传入整数值则返回的结果将。
会省略小数部分
exp(浮点表达式)
select exp(4)返回54.5981500331442
返回求
e 的指定次幂，e=2.718281…
log(浮点表达式)
select log(6)返回1.79175946922805
说明：返回以 e 为底的对数，求自然对数。
Log10(浮点表达式)
select log10(100)返回2
返回以 10 为底的对数
ceiling(数值表达式)
select ceiling(5.44)返回6
select ceiling(-8.44)返回-8
说明：返回大于或等于指定数值表达式的最小整数。
floor(数值表达式)
select floor(5.44)返回5
select floor(-8.44)返回-9
说明：返回小于或等于指定数值表达式的最大整数。
power(数值表达式 1，数值表达式 2)
select power(5,2)返回25
说明：返回数值表达式1 的数值表达式 2 次幂
sqrt(数值表达式)
select sqrt(25)返回5
说明：返回数值表达式的平方根
sign(数值表达式)
select sign(6)返回1
select sign(-6)返回-1
select sign(0)返回0
说明：表达式为正返回+1，表达式为负返回-1，表达式为零返回0。
rand([整数表达式])
select rand(100)返回0.715436657367485
select rand()返回0.28463380767982
select rand()返回0.0131039082850364
说明：返回从0 到 1 之间的随机 float 值。整数表达式为种子，使用相同的种子产生随机数相同。即使用同一个种子值重复调用RAND() 会返回相同的结果。不指定种子则系统会随机生成种子。
round(数值表达式[,长度[,操作方式]])
select round(1236.555,2)返回1236.560
select round(1236.555,2,1)返回1236.550
select round(1236.555,0)返回1237.000
select round(1236.555,-1)返回1240.000
select round(1236.555,-1,1)返回1230.000
select round(1236.555,-2)返回1200.000
select round(1236.555,-3)返回1000.000
select round(1236.555,-4)返回0.000
select round(5236.555,-4)出现错误
select round(5236.555,-4,1)返回0.000
说明：返回一个数值，舍入到指定的长度。注意返回的数值和原数值的总位数没有变化。
长度：舍入精度。如果长度为正数，则将数值舍入到长度指定的小数位数。如果长度为负数，则将数值小数点左边部分舍入到长度指定的长度。注意如果长度为负数并且大于小数点前的数字个数，则将返回0。如果长度为负数并且等于小数点前的数字个数且操作方式为四舍五入时，最前面的一位小于5 返回 0，大于等于 5 导致错误出现，如果操作方法不是四舍五入时则不会出现错误，返回结果一律为0。
操作方式：默认为 0 遵循四舍五入，指定其他整数值则直接截断。
五、数据类型转换函数
（以下两种函数功能类似,但是 convert 在进行日期转换时还提供了丰富的样式，cast 只能进行普通的日期转换）。
函数名称 参数 示例 描述
convert(数据类型[(长度)]，表达式[，样式]）
select convert(nvarchar,123) 返回123
select N'年龄：'+convert(nvarchar,23)
返回 年龄：23（注意：如果想要在结果中正确显示中文需要在给定的字符串前面加上 N，加 N 是为了使数据库识别Unicode 字符）。
select convert(nvarchar ,getdate())
说明：将一种数据类型的表达式显式转换为另一种数据类型的表达式。长度：如果数据类型允许设置长度，可以设置长度，例如varchar(10)样式：用于将日期类型数据转换为字符数据类型的日期格式的样式。见下表
返回 04 28 2009 10:21PM
select convert(nvarchar ,getdate(),101)
返回 04/28/2009
select convert(nvarchar ,getdate(),120)
返回 2009-04-28 12:22:21
Select convert(nvarchar(10) ,getdate(),120)
返回 2009-04-28
cast(表达式 as 数据类型[(长度)])
select cast(123 as nvarchar)返回 123
select N'年龄:'+cast(23 as nvarchar)
返回 年龄：23
说明：将一种数据类型的表达式显式转换为另一种数据类型的表达式。日期类型数据转为字符数据类型的日期格式的部分样式表当两个不同数据类型的表达式用运算符组合后，数据类型优先级规则指定将优先级较低的数据类型优先转换为优先级较高的型。 如果此转换不是所支持的隐式转换，则返回错误。 当两个操作数表达式具有相同的数据类型时，运算的结果便为该数据类型。如果需要把优先级高的数据类型转换优先级低的数据类型时需要使用数据类型转换函数进行显示转换。
 
SQL Server 2005 对数据类型使用以下优先级顺序（先高后低）：
不带世纪数位 (yy)
带世纪数位 (yyyy)
标准
输入/输出-
0 或 100
默认设置mon dd yyyy hh:miAM（或 PM）1 101
美国
mm/dd/yyyy 2 102 ANSI yy.mm.dd 3103
英国/法国
dd/mm/yy 4 104
德国
dd.mm.yy 5 105
意大利
dd-mm-yy 120
ODBC 规范
yyyy-mm-dd hh:mi:ss(24h)
 
1、用户定义数据类型（最高） 2、sql_variant  3、xml  4、datetime  5、smalldatetime  6、float  7、real  8、decimal  9、money  10、smallmoney 11、bigint  12、int  13、smallint 14、tinyint  15、bit  16、ntext  17、text  18、image  19、timestamp  20、uniqueidentifier
21、nvarchar（包括 nvarchar(max)） 22、nchar  23、varchar （包括 varchar(max)） 24、char  25、varbinary（包括 varbinary(max)） 26、binary（最低）
系统函数
函数名称 参数 示例 描述
newid无参数
select newid()
返回 2E6861EF-F4DB-4FFE-85EA-638242F2E5F2
select newid()
返回 09BBDE6F-47C2-4E2E-81E8-AFC50592280C
返回一个GUID（全局唯一表示符）值
isnumeric(任意表达式)
select isnumeric(1111) 返回1
select isnumeric('123rr') 返回0
select isnumeric('123') 返回 1
判断表达式是否为数值类型或者是否可以转换成数值。是返回1，不是返回 0
isnull(任意表达式 1，任意表达式 2)
select isnull(null,N'没有值') 返回 没有值
select isnull(N'具体的值',N'没有值')
返回 具体的值
如果任意表达式1 不为 NULL，则返回它的值；否则，在将任意表达式2 的类型转换为任意表达式 1 的类型（如果这两个类型不同）后，返回任意表式2 的值。
isdate（任意表达式）
select isdate(getdate()) 返回1
select isdate('1988-1-1') 返回1
select isdate('198')返回0
确定输入表达式是否为有效日期或可转成有效的日期。是返回1，不是返回 0
排名函数
排名函数的常用使用格式：函数名() over (order by 列名 [asc|desc][,列名……])
注意：返回结果集会根据使用排名函数时指定的列进行排序，因此不要在 from 子句后面再次使用 order by，会导致排名混乱。
函数名称
参数 示例 描述
row_number无参数
select roductID,[Name],ListPrice, row_number() 
over(order by ListPrice desc) as rank 
from Production.Product
说明：为结果集内每一行进行编号，从1开始后面行依次加 1。
rank无参数
select ProductID,[Name],ListPrice,rank()
over(order by ListPrice desc) as rank
from Production.Product
说明：如果两个或多个行与一个排名关联，则每个关联行将得到相同的排名，排名不连续。例如，如果有价格最高的两种产品的价格相同，它们将列第一。由于已有两行排名在前，所以具有下一个最高价格的产品将排名第三。该排名等于该行之前的所有行数加一。因此，RANK 函数并不总返回连续整数。
dense_rank无参数
select ProductID,[Name],ListPrice,dense_rank()
over(order by ListPrice desc) as rank
from Production.Product
说明：如果两个或多个行与一个排名关联，则每个关联行将得到相同的排名，排名连续。例如，如果有价格最高的两种产品的价格相同，它们将并列第一，下一个最高价格的产品将排名第二。因此，DENSE_RANK 函数返回的数字没有间断，并且始终具有连续的排名。
聚合函数
聚合函数对一组值执行计算,并返回单个值。除了 COUNT 以外，聚合函数都会忽略空值。聚合函数经常与 SELECT 语句的 GROUP BY 子句一起使用。聚合函数的常用使用格式：函数名([all|distinct] 表达式)
all:默认值，对所有的值进行聚合函数运算包含重复值。distinct: 消除重复值后进行聚合函数运算。
函数名称 示例 描述
avg
SELECT avg(VacationHours) as '平均休假小时数' FROM HumanResources.Employee WHERE Title LIKE 'Vice President%'
返回 25
说明：返回组中各值的平均值。空值将被忽略。 表达式为数值表达式。
count
SELECT count(*)FROM Production.Product 返回504
SELECT count(Color)FROM Production.Product 返回 256
SELECT count(distinct Color)FROM Production.Product
返回 9
说明：返回组中的项数。COUNT(*) 返回组中的项数。包括 NULL 值和重复项。如果指定
表达式则忽略空值。表达式为任意表达式。
min
select min(ListPrice)from Production.Product返回0
说明：返回组中的最小值。空值将被忽略。表达式为数值表达式，字符串表达式，日期。
max
select max(ListPrice) from Production.Product
返回3578.27
说明：返回组中的最大值。空值将被忽略。表达式为数值表达式，字符串表达式，日期。
sum
SELECT sum(SickLeaveHours) as '总病假小时数'
FROM HumanResources.Employee
WHERE Title LIKE 'Vice President%'; 返回97
说明：返回组中所有值的和。空值将被忽略。表达式为数值表达式

