# load packages & import data
library(tidyverse)
tidy_nails <- read_csv("./datasets/tidy_nails.csv")

# --- PRELIMINARIES ---

# construct the pointy_nails data: first convert to 
# number of salons/technicians per 100k population
tidy_nails <- tidy_nails %>% 
  mutate(
    salons = 100000 * salons / population,
    technicians = 100000 * technicians / population
  ) %>% 
  select(-population) %>%
  arrange(state)

# now repeat the gather operation, so that we have the
# kind of measure (techs/salons) and the count
long_nails <- tidy_nails %>%
  gather(key = "kind", value = "count", technicians, salons)

# next "unite" the "kind" and "year" variables into a
# single variable with four levels: "salon_2016", etc.
pointy_nails <- long_nails %>%
  unite("kind_year", kind, year) %>%
  arrange(state, kind_year)


# --- SPREAD ---

flat_nails <- pointy_nails %>%
  spread(key = "kind_year", value = "count")
