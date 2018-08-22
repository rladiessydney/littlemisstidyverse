# Another problem solving exercise!
#
# This script has four MISSING_PARTs that you'll need to fix

# load packages
library(tidyverse)

# import the data
tidy_users <- read_csv("./datasets/tidy_users.csv")

# the example count the total number of users each month,
# and story it in a column named total_users
monthly_users <- tidy_users %>%
  group_by( MISSING_PART ) %>%
  summarise(
    MISSING_PART = sum( MISSING_PART ) 
  )

# print the summary to the console 
MISSING_PART

# then, because I like pictures, make a bar graph (notice
# that the months appear in chronological/numerical order,
# but we don't have any names... we'll fix that later)
month_pic <- monthly_users %>% 
  ggplot(aes(x = Month, y = total_users)) + 
  geom_col()  # "col" is short for columns??

# ... and draw it
plot(month_pic)

