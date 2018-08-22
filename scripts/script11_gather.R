# load packages & import data
library(tidyverse)
tidy_nails <- read_csv("./datasets/tidy_nails.csv")

# gather the data into a long form data frame:
#   key: "kind" will be either "technicians" or "salons"
#   value: "count" will indicate the number of techs/salons

long_nails <- tidy_nails %>%
  gather(key = "kind", value = "count", 
         technicians, salons)

# arrange it so the output is a little prettier
long_nails <- long_nails %>% 
  arrange(state, kind, year)

# print
print(long_nails)
