library(tidyverse)
health <- read_delim("health.csv", delim = ";")
ages <- read_delim("Ages.csv", delim = ";")

View(health)
View(ages)

summary(health)
summary(ages)

ages[is.na(ages)] <- 0
health[is.na(health)] <- 0
summary(ages)

rlang::last_trace()