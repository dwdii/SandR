library(ggplot2)
#
# Concept of Lack of Fit test using bootstrap approach
#
bootstrapSigmaFitTest <- function(formula, data)
{

  lmIris <- lm(formula, data)
  smLm <- summary(lmIris)
  #nrow(iris)
  
  # Bootstrap: sub sample and remodel to get sigmas
  bsigma <- vector(length=1000)
  for(i in 1:1000) 
  {
    subData <- data[sample(50, rep=TRUE),]
    newLm <- lm(formula, subData)
    bsigma[i] <- summary(newLm)$sigma
  }
  
  # Compare OLS sigma to 95% CI of bootstrap sigma
  retVal <- list(smLm$sigma^2, quantile(bsigma^2, c(0.025, 0.975)))
  
  return(retVal)
}

# OLS Linear Model of Iris data to predict Petal.Width
mFormula <- Petal.Width ~ Sepal.Length + Sepal.Width + Petal.Length
print(bootstrapSigmaFitTest(mFormula, iris))

mFormula2 <- Petal.Width ~ Petal.Length
print(bootstrapSigmaFitTest(mFormula2, iris))

#g1 <- ggplot(iris) + geom_point(aes(Petal.Length, Petal.Width))
#g1


# References:
#
# https://stat.ethz.ch/pipermail/r-help/2012-April/308935.html