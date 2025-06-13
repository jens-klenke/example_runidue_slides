library(ivreg)
library(haven)
library(Matrix)

set.seed(1234)

# setwd("C:/Users/Christoph.Hanck/sciebo2/Lehre/Methoden der Ökonometrie/Folien/WS2024")
setwd("C:/Users/OEK-Admin/sciebo/Lehre/Methoden der Ökonometrie/Folien/WS2024")

# difference between K_2 and rank difference does not occur when there is no determinacy between variables:

n <- 1000
y <- rnorm(n)
x <- rnorm(n)
x.endog1 <- rnorm(n)
x.endog2 <- rnorm(n)
x.endog2 <- z1 + x.endog1                            # rank deficient case

z1 <- rnorm(n)
z2 <- rnorm(n)
z3 <- rnorm(n)
TSLS <- ivreg(y ~ x | x.endog1 + x.endog2 | z1 + z2 + z3, x=T)
summary(TSLS)

TSLS.drop <- ivreg(y ~ x | x.endog1 + x.endog2 | z2 + z3, x=T)
summary(TSLS.drop)
# trying to reproduce Stata from the formula in Baum et al. (2003)
ols <- lm(y ~ x.endog1 + x.endog2 + x) 
ols.varest <- summary(ols)$sigma^2
# ols.varest <- mean(resid(ols)^2) # no dof correction, makes no difference

tsls.varest <- TSLS$sigma^2

D <- ols.varest*(solve(crossprod(TSLS$x$projected)) - solve(crossprod(model.matrix(ols)))) # Wu T_4, Baum eq (47)
# D <- tsls.varest*(solve(crossprod(TSLS$x$projected)) - solve(crossprod(model.matrix(ols)))) # Wu T_3, Baum eq (48)
# D <- (tsls.varest*solve(crossprod(TSLS$x$projected)) - ols.varest*solve(crossprod(model.matrix(ols)))) # standard Hausman, Baum eq (46)

contrast <- c(coef(TSLS)-coef(ols))
H <- t(contrast)%*%MASS::ginv(D)%*%contrast #*n not sure the times n belongs as in Baum, after all variance term is not scaled

# only the coefficients on the endogenous variables, see Hansen (although the same according to him, see further below...)

contrast <- c(coef(TSLS)[2:3]-coef(ols)[2:3])
X2 <- model.matrix(ols)[ , 2:3]
X1 <- model.matrix(ols)[ , c(1,4)]
Z <- TSLS$x$instruments
P_Z <- Z%*%solve(crossprod(Z))%*%t(Z)
P_1 <- X1%*%solve(crossprod(X1))%*%t(X1)
M_1 <- diag(n) - P_1

# control function approach
resids <- residuals(lm(X2 ~ Z))
controlfunction <- lm(y ~ model.matrix(ols) + resids - 1)
cf.varest <- summary(controlfunction)$sigma^2

D <- ols.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- tsls.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- cf.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- (tsls.varest*solve() - ols.varest*solve()) # standard Hausman, Baum eq (46)

H.partial <- t(contrast)%*%MASS::ginv(D)%*%contrast #*n not sure the times n belongs as in Baum, after all variance term is not scaled
H
H.partial
ivreg:::ivdiag(TSLS)[3,3]*ivreg:::ivdiag(TSLS)[3,1]

dataset <- data.frame(y, x, x.endog1, x.endog2, z1, z2 ,z3)
writexl::write_xlsx(dataset, path="C:/Users/OEK-Admin/Dropbox/dwhdata.xlsx")
