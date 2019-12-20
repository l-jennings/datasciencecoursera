library(dplyr)

chicago <- readRDS("chicago.rds")

head(chicago)
dim(chicago)

str(chicago)
names(chicago)

## look at all columns between city and dptp
head(select(chicago, city:dptp))

## or all columns except
head(select(chicago, -(city:dptp)))

## filter function

chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)

## filter based on multiple columns

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd >80)
head(chic.f)

## arrange to reorder rows

chicago <- arrange(chicago, date)
head(chicago)

chicago <- arrange(chicago, desc(date))
head(chicago)

## rename function - for specific columns
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)

## creating a new variable - pm25 with mean taken off - using mutate

chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = T))

head(chicago)

## group by function - split a df by categorical variables
## create a factor variable defining days as either hot or cold

chicago <- mutate(chicago, tempcat = factor(1 * (tmpd >= 80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
hotcold

## what is the mean pm2.5, max ozone, median NO2 for hot and cold days?
summarise(hotcold, pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2))

## can also create a summary for each year

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarise(years, pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2))

## create a summary of pollutant variables by month

chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarise(pm25 = mean(pm25, na.rm = T),
 o3 = max(o3tmean2), no2 = median(no2tmean2))




