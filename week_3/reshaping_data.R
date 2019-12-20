library(reshape2)
head(mtcars)

## melt the dataset - tell the melt function which are ID variables and
## which are measurements
# mpg values at the top, hp values at the bottom of the dataframe

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt, n = 3)
tail(carMelt)

## casting data frames
# by default, function is length
cylData <- dcast(carMelt, cyl ~ variable)
cylData

# can also pass ways to summarise the data
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

## Averaging values

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

# using split/lapply
spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns
# across each list, sum the counts
sprCount <- lapply(spIns, sum)
sprCount
# turn back into a vector 
unlist(sprCount)

# or a bit faster : just use sapply
sapply(spIns, sum)

# or using plyr

ddply(InsectSprays, .(spray), summarize, sum = sum(count))
