?scale

a<-1:10;
b=11：20;
t=cbind(a,b);
t;
class(t);
d<-scale(t);
mean(d);
sd(d);
?cor
d;
cor(d);
r<-eigen(cor(d));
e<-cor(d);
r$values*r$vectors-t(e)*r$vectors
cor(d);
?eigen
 v<-r$vectors;
lam<-r$values;
 v*lam*v^(-1)+e;
 lam
 diag(lam);
 ;
 diag(lam)*v-e*v;
 
 i=c(1,1);
 li=diag(i);li;
 (e-lam*li)*v;
 
 
 
 