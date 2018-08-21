# load packages & import data
library(tidyverse)
tidy_nails <- read_csv("./datasets/tidy_nails.csv")

tidy_nails <- tidy_nails %>% 
  mutate(
    salons = 100000 * salons / population,
    technicians = 100000 * technicians / population
  ) %>% 
  select(-population) %>%
  arrange(state)

long_nails <- tidy_nails %>%
  gather(key = "kind", value = "count", technicians, salons) 

very_long_nails <- long_nails %>%
  unite("kind_year", kind, year)

wide_nails <- very_long_nails %>%
  spread(key = "kind_year", value = "count")
