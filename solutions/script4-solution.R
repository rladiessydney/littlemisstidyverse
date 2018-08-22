# load packages
library(tidyverse)

# import the data
tidy_users <- read_csv("./datasets/tidy_users.csv")

# the example count the total number of users each month
monthly_users <- tidy_users %>%
  group_by(Month) %>%
  summarise(
    total_users = sum(Users) 
  )

# print the summary to the console (notice that we
# don't have month names? We'll fix that later!!!)
print(monthly_users)

# then, because I like pictures, make a bar graph
month_pic <- monthly_users %>% 
  ggplot(aes(x = Month, y = total_users)) + 
  geom_col() 

# ... and draw it
plot(month_pic)

