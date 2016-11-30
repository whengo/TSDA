
#set the dir for the rstudio on the github
# setwd("C:/data/github_local_win/TSDA/R");
#计算空值的个数na.count
na.count <-function(x)
{return (sum(is.na(x)))}
#x<-c(NA,NA,12,3,2);
#na.count(x);
