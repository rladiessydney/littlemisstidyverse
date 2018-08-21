# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# for the next example, calculate the MEAN number of users on 
# the website as a function of the day of the week: the 
# variable "weekday_users" should have two columns, one named
# "Weekday" and the other named "mean_users".
weekday_users <- tidy_users %>%
  group_by(Weekday) %>%
  summarise(
    mean_users = mean(Users) 
  )

# print the summary to the console 
print(weekday_users)

# construct the graph and draw it (notice that this time 
# we have the labels, but they're in alphabetical order 
# rather than week day order... we'll fix that later too!)
weekday_pic <- weekday_users %>% 
  ggplot(aes(x = Weekday, y = mean_users)) + 
  geom_bar(stat = "identity")  

plot(weekday_pic)