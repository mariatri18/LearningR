library(tidyverse)
library(ggplot2)

health <- read_delim("health.csv", delim = ";")
ages <- read_delim("Ages.csv", delim = ";")
countryTotal <- read_delim("countryTotal.csv", delim = ";")
total <- read_delim("TotalPopulation.csv", delim = ";")

View(health)
View(ages)
View(countryTotal)
View(total)

summary(health)
summary(ages)

ages[is.na(ages)] <- 0
health[is.na(health)] <- 0

summary(ages)
summary(health)


#Male people from 2016 in Europe countries
ggplot(data = countryTotal) + 
  geom_point(mapping = aes(x = country, y = male), color = "blue")

#refugee per country
ggplot(data = countryTotal) + 
  geom_bar(mapping = aes(x = refugee), fill = "lightblue")


# Create Data
data <- data.frame(
  Country= c("Greece","Russia","Germany","United Kingdom","France",
           "Italy","Spain","Ukraine","Poland","Romania","Netherlands",
           "Belgium","Czech Republic","Portugal","Sweden","Hungary","Belarus",
           "Austria","Serbia","Switzerland","Bulgaria","Denmark","Finland",	"Norway",
           "Ireland","Croatia",	"Moldova","Bosnia and Herzegovina","Albania",	"Lithuania",
           "North Macedonia","Slovenia","Latvia","Estonia","Montenegro","Luxembourg","Malta",
           "Iceland","Andorra","Monaco","Liechtenstein","San Marino"),
  value=c(1236443,144342397,82348669,65611593,66724104,
          60627498,46484062,45004673,37970087,19702267,
          17030314,11331422,10566332,10325452,9923085,
          9814023,9469379,8736668,3672802,8373338,7127822,
          5728010,5495303,5234519,4755335,4174349,2803186,
          3480986,2876101,2868231,2072490,2065042,1959537,
          1315790,622303,582014,455356,335439,72540,37071,
          37609,33834
)
)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=Country)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

# Inner Join
merged_data <- merge(total, countryTotal, by = "country")

#View of inner join only for two columns from six total columns
print(merged_data[c("country","PopulationTotal")])
view(merged_data)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

#For Loop
output <- for (i in 1:10) {
  random_number <- sample(1:100, 1)
  result <- paste0(i,"-> ", random_number)
  print(result)
}

#Function that calculate factorial
factorial <- function(n) {
  result <- 1
  for (i in 1:n) {
    result <- result * i
  }
  return(result)
}

# Usage example
number <- 4
factorial_result <- factorial(number)
print(factorial_result)