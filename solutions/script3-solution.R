# This script is part of a do it yourself exercise (orange slides!)
# It won'r run properly until you edit it to fix the problems with it.
# For this exercise, you need to find all every BROKEN-BIT and replace
# it with the right answer!

# Tip: you can select lines of code and then click the RUN button 
# above if you just want to run a few lines at a time 

# load packages
library(tidyverse)

# import the data
data_file <- "./datasets/tidy_users.csv"  
tidy_users <- read_csv(data_file)

# print the data at the console
print(tidy_users)

# draw a simple scatter plot that displays the 
# number of Users at the website as a function of
# the DayNum
scatter <- tidy_users %>%
  ggplot(aes(x = DayNum, y = Users)) + 
  geom_point() + 
  geom_line()

plot(scatter)

