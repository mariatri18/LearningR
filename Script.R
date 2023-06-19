library(tidyverse)

health <- read_delim("health.csv", delim = ";")
ages <- read_delim("Ages.csv", delim = ";")
greece <- read_delim("Greece.csv", delim = ";")

View(health)
View(ages)
View(greece)

summary(health)
summary(ages)

ages[is.na(ages)] <- 0
health[is.na(health)] <- 0

summary(ages)
summary(health)


#Male people from 2016 in Europe countries
ggplot(data = greece) + 
  geom_point(mapping = aes(x = country, y = male), color = "blue")

#refugee per country
ggplot(data = greece) + 
  geom_bar(mapping = aes(x = refugee), fill = "lightblue")