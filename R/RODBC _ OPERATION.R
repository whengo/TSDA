#upload the library RODBC
library(RODBC)
#get the connection by windows authentication
myConn_win <- odbcConnect(dsn="myK3ERP_win")
#myConn_win
myConn_sql<- odbcConnect(dsn = "myK3ERP_sql",uid="sa",pwd="takewiki")
myConn_sql

#read the SQLTable into the data.frame

my_account <-sqlFetch(myConn_win,sqtable = "t_account")
# view the table 
my_account
#view the column
my_account$FNumber
#get the data from sql statement
my_account2<-sqlQuery(myConn_win,query = "select faccountid,fnumber,fname from t_account")
#show the content of the my_account2
my_account2
#table(my_account2)
#drop table in the database
sqlDrop(myConn_win,"takewiki_item")
#save the conntent
sqlSave(myConn_sql,my_account2,"takewiki_account",rownames = FALSE,append = TRUE)
#close the conn
odbcClose(myConn_win)
odbcClose(myConn_sql)
