library(ivreg)
library(haven)
library(Matrix)

set.seed(1234)

# setwd("C:/Users/Christoph.Hanck/sciebo2/Lehre/Methoden der Ökonometrie/Folien/WS2024")
setwd("C:/Users/OEK-Admin/sciebo/Lehre/Methoden der Ökonometrie/Folien/WS2024")

card <- read_dta("Resources/Card1995/Card1995.dta") 
# card$exper <- card$age76 - card$ed76 - 6  # add experience variable
noise <- rnorm(nrow(card))
card$exper <- card$age76 - card$ed76 - 6 + noise # to prevent rank deficiency: 
card <- card[is.na(card$lwage76)==FALSE, ] # remove NAs

# simplified a little relative to textbook example
# TSLS <- ivreg(lwage76 ~ ed76 + exper | nearc4a + nearc4b + age76, data=card, x=T) # instruments

TSLS <- ivreg(lwage76 ~ black + reg76r + smsa76r # exogenous variables
              | ed76 + exper + I(exper^2/100) # endogenous variables
              | nearc4a + nearc4b + age76 
                + I(age76^2), data=card, x=T) # instruments

# difference between K_2 andrank difference does not occur when there is no determinacy between variables:

# n <- 100
# y <- rnorm(n)
# x <- rnorm(n)
# x.endog1 <- rnorm(n)
# x.endog2 <- rnorm(n)
# z1 <- rnorm(n)
# z2 <- rnorm(n)
# TSLS <- ivreg(y ~ x | x.endog1 + x.endog2 | z1 + z2) 

ivreg:::ivdiag(TSLS)

ivregcleaned <- function (obj) {
  y <- model.response(model.frame(obj))
  x <- model.matrix(obj, component = "regressors")
  z <- model.matrix(obj, component = "instruments")
  endo <- obj$endogenous
  inst <- obj$instruments
  
  rval <- matrix(NA, nrow = 1, ncol = 4L)
  colnames(rval) <- c("df1", "df2", "statistic", "p-value")
  rownames(rval) <- c("Wu-Hausman")
  
  lmfit <- function(x, y) {
    rval <- lm.fit(x, y)
    rval$x <- x
    rval$y <- y
    return(rval)
  }
  
  rss <- function(obj) sum(obj$residuals^2)
  
  wald <- function(obj0, obj1) {
    df <- c(obj1$rank - obj0$rank, obj1$df.residual)
    w <- ((rss(obj0) - rss(obj1))/df[1L])/(rss(obj1)/df[2L])
    pval <- pf(w, df[1L], df[2L], lower.tail = FALSE)
    c(df, w, pval)
  }
  
  aux1 <- lmfit(z, x[, endo])
  
  xfit <- as.matrix(aux1$fitted.values) # first stage fitted values, K_2 columns of them
  auxo <- lmfit(x, y)                   # structural regression
  print(auxo$rank)
  auxe <- lmfit(cbind(x, xfit), y)      # regress y on regressors and first stage fitted values?
  print(auxe$rank)
  print(auxe$df.residual)
  rval[1, ] <- wald(auxo, auxe)
  
  return(rval)
}

ivreg:::ivdiag(TSLS)
ivregcleaned(TSLS)

firststage <- cbind(fitted(lm(ed76 ~ nearc4a + nearc4b + age76 + I(age76^2) + black + reg76r + smsa76r, data=card)), 
                    fitted(lm(exper ~ nearc4a + nearc4b + age76 + I(age76^2) + black + reg76r + smsa76r, data=card)), 
                    fitted(lm(I(exper^2/100) ~ nearc4a + nearc4b + age76 + I(age76^2) + black + reg76r + smsa76r, data=card)))
secondstage <- lm(lwage76 ~ black + reg76r + smsa76r + firststage, data=card)
coef(secondstage) # same as TSLS below

firststage.withoutage <- cbind(fitted(lm(ed76 ~ nearc4a + nearc4b + I(age76^2) + black + reg76r + smsa76r, data=card)), 
                               fitted(lm(exper ~ nearc4a + nearc4b + I(age76^2) + black + reg76r + smsa76r, data=card)),
                               fitted(lm(I(exper^2/100) ~ nearc4a + nearc4b + I(age76^2) + black + reg76r + smsa76r, data=card)))
secondstage.withoutage <- lm(lwage76 ~ black + reg76r + smsa76r + firststage.withoutage, data=card)
coef(secondstage.withoutage) # not the same as TSLS below
coef(TSLS)

# trying to reproduce Stata from the formula in Baum et al. (2003)
ols <- lm(lwage76 ~ ed76 + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card) # pay attention to same order of coefficients as in TSLS!
# summary(ols)$cov.unscaled
ols.varest <- summary(ols)$sigma^2
# summary(ols)$df
ols.varest <- mean(resid(ols)^2) # no dof correction, makes no difference
# ols.varest <- sum(resid(ols)^2)/3000 # Achims dof?
# ols.varest*solve(crossprod(model.matrix(ols)))
                           
# TSLS$cov.unscaled
# crossprod(TSLS$x$projected)
tsls.varest <- TSLS$sigma^2
# tsls.varest*solve(crossprod(TSLS$x$projected))
# sqrt(diag(TSLS$sigma^2*solve(crossprod(TSLS$x$projected))))

D <- ols.varest*(solve(crossprod(TSLS$x$projected)) - solve(crossprod(model.matrix(ols)))) # Wu T_4, Baum eq (47)
# D <- tsls.varest*(solve(crossprod(TSLS$x$projected)) - solve(crossprod(model.matrix(ols)))) # Wu T_3, Baum eq (48)
# D <- (tsls.varest*solve(crossprod(TSLS$x$projected)) - ols.varest*solve(crossprod(model.matrix(ols)))) # standard Hausman, Baum eq (46)

n <- NROW(card)
contrast <- c(coef(TSLS)-coef(ols))
H <- t(contrast)%*%MASS::ginv(D)%*%contrast #*n not sure the times n belongs as in Baum, after all variance term is not scaled

# only the coefficients on the endogenous variables, see Hansen (although the same according to him, see further below...)

contrast <- c(coef(TSLS)[2:4]-coef(ols)[2:4])
X2 <- model.matrix(ols)[ , 2:4]
X1 <- model.matrix(ols)[ , c(1,5:ncol(model.matrix(ols)))]
Z <- TSLS$x$instruments
P_Z <- Z%*%solve(crossprod(Z))%*%t(Z)
P_1 <- X1%*%solve(crossprod(X1))%*%t(X1)
M_1 <- diag(n) - P_1

# control function approach
resids <- residuals(lm(X2 ~ Z))
controlfunction <- lm(card$lwage76 ~ model.matrix(ols) + resids - 1)
# cf.varest <- summary(controlfunction)$sigma^2

D <- ols.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- tsls.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- cf.varest*(solve(t(X2)%*%(P_Z-P_1)%*%X2) - solve(t(X2)%*%M_1%*%X2)) # Hansen, (12.64)
# D <- (tsls.varest*solve() - ols.varest*solve()) # standard Hausman, Baum eq (46)

H.partial <- t(contrast)%*%MASS::ginv(D)%*%contrast #*n not sure the times n belongs as in Baum, after all variance term is not scaled

# lmtest::coeftest(controlfunction)
