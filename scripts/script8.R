# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# problem 1: create a transformed "user_rank" variable
# that ranks the days by number of Users on the site.
# we'll use the rank() function from base R
tidy_users <- tidy_users %>% 
  mutate(user_rank = rank(-Users)) %>%
  arrange(user_rank)

# problem 2: you can add multiple variables at once this way
tidy_users <- tidy_users %>% 
  mutate(
    #YOUR-NEW-VAR1 = CODE,
    #YOUR-NEW-VAR2 = MORE-CODE
  )

# problem 3: create a transformed "cat_month" variable
# that takes the numeric Month variable and converts it
# to a factor (i.e., declare it categorical)
tidy_users <- tidy_users %>% 
  mutate(cat_month = factor(Month)) 

# print the factor to the console
print(tidy_users$cat_month)

# okay, let's try again. first, let's clean up our failed
# version by using select:
tidy_users <- tidy_users %>% 
  select(-cat_month) 

# problem 4: okay, notice that R converted it with the
# "levels" of the factor in numerical order? now let's do it
# properly, attaching appropriate labels!
tidy_users <- tidy_users %>% 
  mutate(
    named_month = Month %>% 
      factor(labels = c("Mar","Apr","May","Jun", "Jul", "Aug")) 
  )

# revisit the graph from script 4...
pic <- tidy_users %>%
  group_by(named_month) %>%                 # group by named_month
  summarise(total_users = sum(Users)) %>%   # count users by month
  ggplot(aes(x = named_month, y = total_users)) +   # set up the plot
  geom_bar(stat = "identity") +                     # add the bars
  xlab("Month (2018)") +             # nicer x-axis label
  ylab("Total Number of Users") +    # nicer y-axis label
  theme_bw()                         # use a black & white theme
plot(pic)

# this comes out nicer!



