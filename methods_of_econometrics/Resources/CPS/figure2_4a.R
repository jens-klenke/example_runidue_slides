######################################################################
### This file generates Figure 2.4a
### Joint density of log wage and experience,
### Conditional mean of log wage given experience,
### for White men with 12-years education
######################################################################
### Uses data file cps09mar.txt
#########################################

dat <- read.table("cps09mar.txt")
wm <- (dat[,11]==1)&(dat[,2]==0)&(dat[,4]==12)
dat1 <- dat[wm,]
y <- as.matrix(log(dat1[,5]/(dat1[,6]*dat1[,7])))
x <- as.matrix(dat1[,1]-dat1[,4]-6)
n <- length(y)

#######################################################
## Joint PDF of LogWage and experience
#######################################################

## bandwidths
hx <- sd(x)/(n^(1/6))
hy <- sd(y)/(n^(1/6))

## evaluation region 
xg <- seq(0,47,.5)
yg <- seq(1.8,3.9,0.05)	
nx <- length(xg)
ny <- length(yg)
fjoint <- matrix(0,nx,ny)

## Joint density
for(i in 1:length(xg)){	
  fi <- dnorm(x - xg[i],sd=hx)
  for(j in 1:length(yg)){
    fj <- dnorm(y - yg[j],sd=hy)
    fjoint[i,j] <- mean(fi*fj)		
  }	
}

########################################################################
## Conditional Mean estimated by Local Linear Nonparametric Estimation
########################################################################

# Reference Rule
x1 <- matrix(1,n,1)
zz <- cbind(x1,x,x^2,x^3,x^4)
beta <- solve((t(zz)%*%zz),(t(zz)%*%y))
xtrim <- (x<=40)*(x>=0)
b <- mean(((beta[3]+x*3*beta[4]+(x^2)*6*beta[5])^2)*xtrim)
e <- y - zz%*%beta
sig <- (sum(e^2))/(n-5)
h <- 0.58*((40*sig/n/b)^.2)

# Local Linear Regression Estimation
mx <- xg
for (j in 1:length(mx)){
  xj <- x-xg[j]
  xx <- cbind(x1,xj)
  xh <- xx*(dnorm(xj/h)%*%cbind(1,1))
  beta <- solve(t(xh)%*%xx,t(xh)%*%y)
  mx[j] <- beta[1]
}

wd <- 1.4

par(mfrow = c(1, 2))
contour(xg,yg,fjoint,ylim=c(1.8,3.9),xlim=c(0,47),zlim=c(5*10^(-3),max(fjoint)),nlevels=7,drawlabels=FALSE,xlab="Labor Market Experience (Years)",ylab="Log Dollars per Hour",xaxs="i",yaxs="i",yaxt="n",xaxt="n",bty="n",lwd=wd)	
axis(side=1,seq(0,50,5),lwd=wd)
axis(side=2,seq(1.5,4.5,.5),lwd=wd)
lines(xg,mx,lwd=wd)
abline(v=5, col="red", lty="dashed")
abline(v=10, col="blue", lty="dashed")
abline(v=25, col="green", lty="dashed")
legend("bottomright","Conditional Expectation",lty=1,cex=.8,bty="n",lwd=wd)

#######################################################
## Conditional Density estimated by Gaussian Kernel 
#######################################################

## bandwidth 
hx <- sd(x)/(n^(1/6))
hy <- sd(y)/(n^(1/6))

## evaluation points
yg <- seq(0.8,4.8,0.02)

## conditional densities
fx5 <- dnorm(x-5,sd=hx)
fx10 <- dnorm(x-10,sd=hx)
fx25 <- dnorm(x-25,sd=hx)
fy5 <- matrix(nrow=length(yg),ncol=1)
fy10 <- matrix(nrow=length(yg),ncol=1)
fy25 <- matrix(nrow=length(yg),ncol=1)
for (i in 1:length(yg)){
  fy <- dnorm(y-yg[i],sd=hy)
  fy5[i] <- mean(fy*fx5)/mean(fx5)
  fy10[i] <- mean(fy*fx10)/mean(fx10)
  fy25[i] <- mean(fy*fx25)/mean(fx25)
}

wd <- 1.4

leg1 <- expression(X==5)
leg2 <- expression(X==10)
leg3 <- expression(X==25)

plot(yg,fy5,lty=1,type="l",title=NULL,xaxs="i",yaxs="i",xlab="Log Dollars per Hour",
     ylab="",xlim=c(0.8,4.7),ylim=c(0,1.06),yaxt="n",xaxt="n",bty="n",lwd=wd, col="red")
lines(yg,fy10,lwd=wd, col="blue")
lines(yg,fy25,lwd=wd, col="green")
axis(side=1,seq(1,4.5,0.5),lwd=wd)
text(1.3,.3,leg1)
text(1.8,.7,leg2)
text(3.8,.6,leg3)
arrows(1.5,.27,1.78,0.23,angle=20,length=.1,lwd=wd)
arrows(2.08,.68,2.37,0.64,angle=20,length=.1,lwd=wd)
arrows(3.6,.57,3.4,0.52,angle=20,length=.1,lwd=wd)
