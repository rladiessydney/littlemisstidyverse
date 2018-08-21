# load packages & import data
library(tidyverse)
tidy_users <- read_csv("./datasets/tidy_users.csv")

# this script contains all the source code shown in the ggplot section,
# with some annotations added to make it a little clearer. 

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
  geom_point(size = 3, alpha = 0.2) + # large plot markers, semi-transparent
  geom_line() + 
  scale_x_continuous(name = "Day Number") +  # same as xlab("Day Number")  
  scale_y_continuous(name = "User Count") + 
  scale_colour_discrete(name = "Month")

# draw the pictures
plot(pic3)
plot(pic4)



# ----- HISTOGRAMS ----- 

pic5 <- tidy_users %>%
  ggplot(aes(x = Users)) + 
  geom_histogram(bins = 20) + 
  xlab("User Count") + 
  ylab("Frequency")

plot(pic5)


# ----- BOXES AND VIOLINS ----- 

# Let's start by creating a plot that has aesthetics only,
# with no geoms added. It's worth taking a look at what
# this plot looks like before the geoms appear
pic6 <- tidy_users %>%
  ggplot(aes(
    x = named_month,
    y = Users,
    colour = named_month
  )) 

# Box and violin plots both provide methods for visualising
# the complete distribution of a sample. The boxplot uses 
# the Tukey "five number summary" (min, max, median, 25th and
# 75th quantiles), whereas the violin plot relies on kernel
# density estimation. They have different strengths and 
# weaknesses:
pic7 <- pic6 + geom_boxplot()
pic8 <- pic6 + geom_violin()

# draw
plot(pic6)
plot(pic7)
plot(pic8)



# ----- ADDING ERROR BARS ----- 

# the most typical use case is adding error bars 
# (e.g. +/- one standard error) to a plot that 
# displays a sample mean. so first we need to 
# summarise the data slightly differently:
users_summary <- tidy_users %>%
  group_by(named_month) %>%
  summarise(
    mean_user = mean(Users),    # mean
    sem = sd(Users) / sqrt(n()) # standard error
  )

# first let's set this up as a plot with the 
# appropriate aesthetics, no geoms:
pic9 <- users_summary %>%
  ggplot(aes(
    x = named_month,
    y = mean_user,
    ymin = mean_user - sem,
    ymax = mean_user + sem 
  )) 

# version 1: bar/column plot with error bars
pic10 <- pic9 + 
  geom_col() +
  geom_errorbar(width = .5)

# version 2: bar/column plot with error bars
pic11 <- pic9 + 
  geom_col(aes(fill = named_month)) +  # specify a fill aesthetic for this geom only
  geom_errorbar(width = .5)

# version 3: scatter plot with error bars
pic12 <- pic9 + 
  geom_point(size = 2) + 
  geom_line(aes(x = as.numeric(named_month))) + # lines require *continuous* x and y
  geom_errorbar(width = .5)

# draw
plot(pic10)
plot(pic11)
plot(pic12)


# ----- FACETTING A PLOT ----- 

# take our original histogram, and facet the plot by month
pic13 <- pic5 + facet_wrap(~ named_month)
pic14 <- pic5 + facet_grid(named_month ~ Weekday)

# draw
plot(pic13)
plot(pic14)

