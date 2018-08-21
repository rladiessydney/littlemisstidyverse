# This script is part of a do it yourself exercise (orange slides!)
# It won'r run properly until you edit it to fix the problems with it.
# For this exercise, you need to find all every BROKEN-BIT and replace
# it with the right answer!

# Tip: you can select lines of code and then click the RUN button 
# above if you just want to run a few lines at a time 

# load packages
library(BROKEN-BIT)

# import the data
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