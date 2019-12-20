library(dplyr)

housing <- read.csv("getdata_data_ss06hid.csv")
dim(housing)

## q1
colnames(housing)

# AGS = 6 and ACR = 3

agricultureLogical <- housing$ACR == 3 & housing$AGS == 6
which(agricultureLogical)

## q2

library(jpeg)

jeff <- readJPEG(source = "getdata_jeff.jpg", native = TRUE)
jeff <- as.vector(jeff)
quantile(jeff, c(0.3, 0.8))

## q3
library(data.table)
GDP <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip = 5)
GDP <- GDP[ , c(1,2, 4,5)]
colnames(GDP) <- c("CountryCode", "Ranking", "Economy", "DollarsMillions")
GDP <- GDP[1:190 , ]
GDP$Ranking <- as.numeric(GDP$Ranking)


ed_data <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", header = T, check.names = T)

sum(GDP$CountryCode %in% ed_data$CountryCode)

# merge GDP and ed_data

merged_data <- merge(GDP, ed_data, by = "CountryCode")

relevant_data <- merged_data[, 1:3]
relevant_data <- arrange(relevant_data, desc(Ranking))
head(relevant_data)
relevant_data[13, ]

## q4

filtered <- filter(merged_data, Income.Group == "High income: nonOECD" | Income.Group == "High income: OECD")
Income_groups <- split(filtered, filtered$Income.Group)
nonOECD <- Income_groups$`High income: nonOECD`
OECD <- Income_groups$`High income: OECD`

mean(nonOECD$Ranking)
mean(OECD$Ranking)

## q5
library(Hmisc)

snip <- mutate(merged_data, GDP_groups = cut2(Ranking, g = 5))
table(snip$GDP_groups)


y <- which(snip$Income.Group == "Lower middle income")
loincome <- snip[y, 1]
x <- which(snip$GDP_groups == "[  1, 39)")
hiGDP_countries <- snip[x, 1]

sum(loincome %in% hiGDP_countries)

# wrong!!

