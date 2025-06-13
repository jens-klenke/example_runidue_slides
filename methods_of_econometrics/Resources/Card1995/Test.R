
library(haven)
card       <- read_dta("Card1995.dta")
card <- card[is.na(card$lwage76)==FALSE, ]
card$exper <- card$age76 - card$ed76 - 6  # add experience variable





ols <- lm(lwage76 ~ ed76, data=card) # KQ Schätzung


KQ <- lm(lwage76 ~ ed76 + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)

plot(lwage76 ~ ed76, data = card)
# plotte Resultate
abline(ols, col="blue")

?read_dta

linearHypothesis(KQ, c("STR=0", "expenditure=0"), white.adjust = "hc0")

waldtest(KQ, 1:6, vcov = vcovHC(KQ, type="HC0"))



IV <- ivreg(lwage76 ~ ed76 + exper + I(exper^2/100) + black + 
              reg76r + smsa76r
            | nearc4 + exper + I(exper^2/100) + black + 
              reg76r + smsa76r, data=card)

redf <- lm(ed76 ~ nearc4 + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)

# TSLS by hand
ivbyhand <- lm(lwage76~fitted(redf) + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)
ivbyhand



KQ <- lm(lwage76 ~ ed76 + exper + I(exper^2/100) + black +
        reg76r + smsa76r, data=card)
IV <- ivreg(lwage76 ~ ed76 + exper + I(exper^2/100) + black + reg76r + smsa76r
            | nearc4 + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)

# Reduzierte Form
redf <- lm(ed76 ~ nearc4 + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)

# TSLS by hand with incorrect standard errors (although by very little here)
ivbyhand <- lm(lwage76 ~ fitted(redf) + exper + I(exper^2/100) + black + reg76r + smsa76r, data=card)

stargazer(redf, KQ, IV, ivbyhand, type="text",
          keep=c("ed", "near", "exp", "bl"), keep.stat=c("n", "rsq"))

TSLS.b <- ivreg(lwage76 ~ black + reg76r + smsa76r 
              | ed76 + exper + I(exper^2/100)
              | nearc4b + age76 + I(age76^2), data=card)
summary(TSLS.b)

TSLS.a <- ivreg(lwage76 ~ black + reg76r + smsa76r 
              | ed76 + exper + I(exper^2/100)
              | nearc4a + age76 + I(age76^2), data=card)
summary(TSLS.a)




Y.bar <- matrix( rt(4000000, df=1.9), nrow=20000, ncol=200 )
Y.bar <- apply(Y.bar, 1, function(x) {cumsum(x)/1:length(x)})
x <- seq(-10,10,by=0.02)
par(mfrow=c(2,2))

# n=2
hist(Y.bar[2, ],   freq=FALSE, main="n=2", xlab="", xlim=c(-3, 3), ylim=c(0, 4))

# n=20
hist(Y.bar[20, ],  freq=FALSE, main="n=20", xlab="", xlim=c(-3, 3), ylim=c(0, 4))

# n=50
hist(Y.bar[50, ],  freq=FALSE, main="n=50", xlab="", xlim=c(-3, 3), ylim=c(0, 4))

# n=200
hist(Y.bar[200, ], freq=FALSE, main="n=200", xlab="", xlim=c(-3, 3), ylim=c(0, 4))



hist(Y.bar[, 2], breaks=seq.int(-10,10, by=0.2),  freq=FALSE, main="n=2", xlab="", xlim=c(-5000, 5000))







