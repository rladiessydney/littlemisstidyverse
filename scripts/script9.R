# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# this script contains all the source code shown in the ggplot section,
# with some annotations added to make it a little clearer

# ----- PRELIMINARIES -----

# we need to copy some of the work from script8.R...
tidy_users <- tidy_users %>%
  mutate(
    named_month = Month %>% 
      factor(labels = c("Mar","Apr","May","Jun", "Jul", "Aug")) 
  )

# ----- BAR GRAPHS -----

# to draw a bar graph, you usually need data in a form where 
# there is a single number for the y-axis height, so we'll
# start by doing that for the "monthly user counts"...
monthly_users <- tidy_users %>%
  group_by(named_month) %>%
  summarise(
    total_users = sum(Users) 
  ) 

# now the graph itself: we need an x-axis aesthetic (i.e. the
# month) and a y-axis aesthetic. 
pic1 <- monthly_users %>%
  ggplot(aes(x = named_month, y = total_users)) +  # set up the plot
  geom_col()  # display as "columns" (see also geom_bar)

# ggplot allows you to keep adding layers to existing plots and
# create new ones. so let's add plot customisations:
pic2 <- pic1 +
  xlab("Month (2018)") +           # nicer x-axis label
  ylab("Total Number of Users") +  # nicer y-axis label
  theme_bw()                       # use a black & white theme

# now we have both plots stored as variables. let's plot them:
plot(pic1)
plot(pic2)



# ----- POINTS AND LINES -----

# in the simplest form, points and lines simply need x and 
# y aesthetics, and the defaults are okay so this is a
# reasonably pretty plot
pic3 <- tidy_users %>% 
  ggplot(aes(x = DayNum, y = Users)) +
  geom_point() +
  geom_line()

# you can make it prettier by adding a colour aesthetic to
# clearly delineate the months, and add some nicer labels
# to the x-axis, y-axis and colour legend:
pic4 <- tidy_users %>% 
  ggplot(aes(x = DayNum, y = Users, colour = named_month)) +
  geom_point(size = 3, alpha = 0.2) +        # large plot markers, mostly transparent
  geom_line() + 
  scale_x_continuous(name = "Day Number") +  # note... xlab("Day Number") does the same thing! 
  scale_y_continuous(name = "User Count") + 
  scale_colour_discrete(name = "Month")

plot(pic3)
plot(pic4)



# ----- HISTOGRAMS (& FACETING) ----- 

pic5 <- tidy_users %>%
  ggplot(aes(x = Users)) + 
  geom_histogram(bins = 20) + 
  xlab("User Count") + 
  ylab("Frequency")

pic6 <- pic5 + 
  facet_wrap(~named_month)


plot(pic5)
plot(pic6)

