myConn_win
library(RODBC)
myConn_sql3<-odbcConnect("myK3ERP_sql",uid="sa",pwd="takewiki")
mydata<-sqlQuery(myConn_sql3,"select fitemid,fstockid,fqty from icinventory")
mydata

library(reshape2)
install.packages("reshape2")
library(reshape2)
head(airquality)
melt(data = airquality,id.vars = c("Month","Day"))
names(airquality) <- tolower(names(airquality))
airquality
mydata2<-melt(airquality,id.vars = c("month","day"))
mydata2
mydata3<-dcast(mydata2,month~variable,fun.aggregate = mean,margins = c("month","variable"))
mydata3
mydata
mydata_inv<-melt(mydata,id.vars = c("fitemid","fstockid"),na.rm = TRUE)
mydata_inv
mydata_inv_sum <-dcast(data = mydata_inv,fitemid~variable,mean)
mydata_inv_sum

name=c("a","b","c")
yuwen=c(21,22,23)
shuxue=c(23,33,44)
yingyu=c(54,55,56)

score<-data.frame(name,yuwen,shuxue,yingyu)
score
s2<-melt(score,id.vars = c("name"))
s2
dcast(s2,name~variable,sum,margins = c("name",1))

score
s2
s2$variable="1"
s2
dcast(s2,name~variable,sum)
