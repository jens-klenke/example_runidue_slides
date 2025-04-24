library(gamlss.dist)
library(VGAM)

x <- seq(-5,5,length=500)

nu <- 6
sigma <- sqrt((nu-2)/nu)

plot(x,dTF(x,sigma=sigma,nu = nu),type="l",lwd=2,xlab="",ylab="")

# the generalized t-distribution normalized to mean=0 and variance=1, see eg manual to above library
# it has kurtosis = 3*(nu-2)/(nu-4), see maple file KurtosisGeneralizedTDistr.mws
lines(x,dnorm(x),col="green",lwd=2)
legend(3, 0.3, c("HV1","HV2"), cex=1.3, col=c("black","green"), lwd=2, bty="n")
abline(v=0,lty=2 )

kurtosis <- 3*(nu-2)/(nu-4) 

# Laplace distribution, has kurtosis of 6 (no matter the scale parameter)
lines(x,dlaplace(x,scale=1/sqrt(2)),col="red",lwd=2) 
lines(x,dlaplace(x),col="blue",lwd=2) 
