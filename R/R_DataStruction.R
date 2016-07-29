#create a vector
my_vect <-1:100
my_vect
#create the matrix with 2 dims
my_matrix <-matrix(my_vect,nrow=5,ncol=20,byrow = TRUE)
my_matrix
#create the  array with 3 dim and each dim with 3 attributes
data<-1:27
my_array3 <-array(data=data,dim=c(3,3,3),dimnames = list(c("L1","L2","L3"),c("a","b","c"),c("I","II","III")))
my_array3
my_array3[1,,]
my_array3[,,1]
my_array3[,,"II"]
my_array3[3,3,3]
my_array3[,1,]
##  can not do in this way 
##  my_array3[,c("a,b"),]
my_array3[-1,,]
my_array3[c(1,2),c(2,3),]
my_array3[c(1,2),c(2,3),c(1,3)]
##truely it can be do by the R
my_account2[1:5,]
class(my_account2)
my_account2$faccountid=my_account2$faccountid+3
my_account2
#create factor
myfact<-as.factor(c("hu","apple","hu","apple","go"))
myfact
levels(my_account)
level(myfact)
str(myfact)
#create list 
mylist=list(list(1,2,3),c(1,2,3),c("go","go","go"))
mylist
mylist[[1]]
mylist[[1]][[3]]
