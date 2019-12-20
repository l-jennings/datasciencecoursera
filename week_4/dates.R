d2 <- Sys.Date()
d2

class(d2)

## formatting dates

# %d = day as number
# %a = abbreviated weekday
# %A = unabbreviated weekday
# %m = month as number
# %b = abbreviated month
# %B = unabbreviated month
# %y = two digit year
# %Y = four digit year

format(d2, "%a, %b, %d")

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1] - z[2])

# weekdays function tells you what day of the week it is

weekdays(d2)

# can convert to Julian date - number of days since origin (1970-01-01)

julian(d2)

# lubridate converts dates and times into a standard format

library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-1983")

ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz = "Pacific/Auckland")
?Sys.timezone

# some functions use different syntax

x <- dmy(c("1jan1960", "2jan1960", "31mar1960", "30jul1960"))
wday(x[1]) # gives week day as number
wday(x[1], label = T) # gives weekday name
