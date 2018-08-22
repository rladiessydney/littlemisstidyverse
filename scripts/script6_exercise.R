# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# problem 1... table showing the dates and user counts
# for only those days where I had 200+ users
tidy_users %>% 
  filter(Users > 200) %>% 
  select(Date, Users) %>%
  arrange(-Users)

# problem 2... 
tidy_users %>% 
  filter(Weekday == "Saturday" & Users > 50) %>%
  arrange(-Users)

# create a sorted table
tidy_users %>%
  group_by(Weekday) %>%
  summarise(mean_users = mean(Users)) %>%
  arrange(-mean_users)
