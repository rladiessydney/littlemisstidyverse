# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# ---- Solution to Problem 1 ----

output1 <- tidy_users %>% 
  filter(Users > 200) %>% 
  select(Date, Users) %>%
  arrange(-Users)

print(output1)



# ---- Solution to Problem 2 ----

# Two possible answers to this. We could think about
# it as two separate "filter" operations...

output2 <- tidy_users %>% 
  filter(Weekday == "Saturday") %>% 
  filter(Users > 50) %>% 
  arrange(-Users)

# Or we could do it as one "filter" with a more 
# complex operation...

output2 <- tidy_users %>% 
  filter(Weekday == "Saturday" & Users > 50) %>%
  arrange(-Users)

# ... either one works :-)

print(output2)


# ---- Solution to Problem 3 ----

output3 <- tidy_users %>%
  group_by(Weekday) %>%
  summarise(mean_users = mean(Users)) %>%
  arrange(-mean_users)

print(output3)



# ---- Solution to Bonus ----

output4 <- tidy_users %>%
  filter(Weekday != "Saturday" & Weekday != "Sunday") %>%
  group_by(Weekday) %>%
  summarise(mean_users = mean(Users)) %>%
  arrange(-mean_users)

print(output4)



