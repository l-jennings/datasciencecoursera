restData <- read.csv("Restaurants.csv")

## Creating sequence - used to index 
# three ways to specify

# 1:10 increasing by 2
s1 <- seq(1, 10, by = 2)
s1

# 1:10, gives exactly three values
s2 <- seq(1, 10, length = 3)
s2

# seq along
x <- c(1, 3, 8, 25, 100); seq(along = x)

## subsetting variables

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

## creating binary variables - e.g. if the zip code is wrong
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

## creating categorical variables using cut command
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)
# can also use cut2 function in Hmisc package

## creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

## using the mutate function, g = number of quantile groups
library(Hmisc); library(plyr)

restData2 = mutate(restData, zipGroups = cut2(zipCode, g = 4))
table(restData2$zipGroups)
