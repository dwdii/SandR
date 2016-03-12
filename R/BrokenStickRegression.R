# Linear Models in R by Julian Faraway p121
data(LifeCycleSavings)
savings <- LifeCycleSavings
summary(savings)
g1 <- lm(sr ~ pop15, savings, subset=(pop15 < 35))
g2 <- lm(sr ~ pop15, savings, subset=(pop15 > 35))

plot(sr ~ pop15, savings, xlab="Pop'n under 15", ylab="Savings Rate")
abline(v=35, lty=5)

segments(20, g1$coef[1] + g1$coef[2]*20, 35, g1$coef[1] + g1$coef[2] * 35)
segments(48, g2$coef[1] + g2$coef[2]*48, 35, g2$coef[1] + g2$coef[2] * 35)

#####
# Linear Models in R by Julian Faraway p122
lhs <- function (x) ifelse(x < 35, 35-x, 0)
rhs <- function (x) ifelse(x < 35, 0, x-35)

gb <- lm(sr ~ lhs(pop15) + rhs(pop15), savings)

x <- seq(20, 48, by=1)
py <- gb$coef[1] + gb$coef[2] * lhs(x) + gb$coef[3] * rhs(x)
lines(x, py, lty=2)