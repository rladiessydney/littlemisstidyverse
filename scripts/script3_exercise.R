# This script is part of a do it yourself exercise (orange slides!)
#
# The code won't run properly until you edit it to fix the problems.
# For this exercise, you need to find every BROKEN-BIT and replace
# it with the right answer!
#
# Note: It's also something of a problem solving exercise... the 
# slides haven't actually given you the answers to these problems
# the idea is to look at the code, the output etc, and try to work
# it out :-)
#
# Tip for new users: you can select lines of code and then click 
# the RUN button above if you just want to run a few lines at a time 

# load packages
library(BROKEN-BIT)

# load the tidy users data set
data_file <- "./datasets/BROKEN-BIT"  
tidy_users <- read_csv(BROKEN-BIT)

# print the data at the console
print(tidy_users)

# draw a simple scatter plot that displays the 
# number of users at the website as a function of
# the day number
scatter <- tidy_users %>%
  ggplot(aes(x = BROKEN-BIT, y = BROKEN-BIT)) + 
  geom_point()

BROKEN-BIT(scatter)

# If you can get this to work it will look *almost* identical to the
# one on the screen.... except there is no line on your version. How
# to fix this???
# 
#   HINT 1: There is function called geom_line() 
#
#   HINT 2: R takes symbols (operators) very seriously, so...
#     pay attention to where all the <-, +, =, == and %>%
#     operators appear in the code!
#
# Also... if you're stuck, the solution is in the solution folder!