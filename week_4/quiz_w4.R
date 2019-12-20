## q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./data/housing.csv")

housing <- read.csv("./data/housing.csv")

names(housing)

split <- strsplit(names(housing), split = "wgtp")
split[[123]]

## q2

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "./data/GDP_data.csv")

GDP <- read.csv("./data/GDP_data.csv", skip = 5, header = F)
GDP <- GDP[1:190, c(1,2,4,5)]
colnames(GDP) <- c("CountryCode", "Ranking", "countryNames", "DollarsMillions")
head(GDP)

GDP$DollarsMillions <- as.numeric(gsub(",", "", GDP$DollarsMillions))
head(GDP)

mean(GDP$DollarsMillions)

## q3

countryNames <- as.character(GDP$countryNames)
grep("^United", countryNames)

## q4

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "./data/ed_data.csv")
ed_data <- read.csv("./data/ed_data.csv")

merged_data <- merge(GDP, ed_data, by = "CountryCode")

notes <- merged_data$Special.Notes
length(grep("Fiscal year end: June", notes))

## q5
library(quantmod)
library(dplyr)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

twentytwelve <- (grep("^2012", sampleTimes))
length(twentytwelve) ## = 250

days <- as.character(weekdays(sampleTimes))
mondays <- grep("Monday", days)

sum(mondays %in% twentytwelve)
