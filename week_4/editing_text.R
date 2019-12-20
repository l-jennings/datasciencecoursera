if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")

cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

## change to all letters to lower case

tolower(names(cameraData))
# can also to toupper

## separating words that are separated by "."

splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

## fixing character vectors with sapply

splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

##

fileUrl1 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileUrl2 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"

download.file(fileUrl1, destfile="./data/reviews.csv", method = "curl")
download.file(fileUrl2, destfile = "./data/solutions.csv")

reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

head(reviews, 2)

# remove underscores from column names

names(reviews)
sub("_", "", names(reviews),) #but if there are multiple "_", only the first is replaces

testName <- "this_is_a_test"
gsub("_","", testName)

## searching for specific values
# search for all intersections that include Alameda as one of the roads

grep("Alameda", cameraData$intersection)

# grepl will return TRUE whenever "Alameda" appears
# then you can create a table to see how many roads intersect it
table(grepl("Alameda", cameraData$intersection))

# then you can subset out all rows of data where Alameda isn't part of the intersection
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]

#### more about grep ####
# value = TRUE will return the values where the search is true, rather than index no.s

grep("Alameda", cameraData$intersection, value = T)

# you can search for values that do not appear in the data
grep("LibStreet", cameraData$intersection) ## resturns integer = 0
length(grep("LibStreet", cameraData$intersection)) # good way to check
# if a value appears in a vector

##### useful string functions #####

library(stringr)

# number of characters
nchar("Libby Jennings")

# remove part of the string - take only 1st-7th letters
substr("Libby Jennings", 1, 7)

# paste two strings together
paste("Libby", "Jennings")
paste0("Libby", "Jennings")

# trim excess spaces at end of string
str_trim("lib      ")








