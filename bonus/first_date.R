# make a nicer version of the users data using
# the lubridate package (part of tidyverse)
library(tidyverse)
library(lubridate)

# load the original data set
users <- read_csv("./datasets/users.csv")

# break up the date using lubridate functions!
tidy_users <- users %>%
  mutate(
    Date = mdy(Date),
    DayNum = as.numeric(Date - Date[1] + 1),
    Day = day(Date),
    Month = month(Date),
    Year = year(Date),
    Weekday = weekdays(Date)
  )

# save the data
tidy_users %>% write_csv("./datasets/tidy_users.csv")