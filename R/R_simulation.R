
#set the dir for the rstudio on the github
setwd("C:/data/github_local_win/TSDA/R");

#data manipulation in R
## function to be applied after wards; 

#定义一个func的函数

func <-function (x)
{
return (sum(is.na(x)))  
  
}
#test for the func
func(c(1,2,3,NA,4,NA));
#[1] 2

source("func_libs.r");
na.count(c(NA,NA,NA,NA,1,2));
#change the func to na.count in the package func_libs.r
library(MASS)
#其中apply是把数据应用的所有的行或行，这个由参数Margin确定
#MARGIN =1   ROW
#MARGIN=2   COLUMN
#X           dataset
#FUN         the name of the funcation to be calculated in the apply
na_count <- apply(X = Cars93,MARGIN = 2,FUN = na.count);
na_count;
#class(na_count);
#显示含有NA列与相应的个数
na_count[na_count>0];
# dim(Cars93);
#  [1] 93 27
(na_count_row <-apply(X=Cars93,MARGIN=1,FUN=na.count));
#按行显示NA的个数