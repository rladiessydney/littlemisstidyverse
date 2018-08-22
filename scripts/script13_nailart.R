# load packages & import data
library(tidyverse)
tidy_nails <- read_csv("./datasets/tidy_nails.csv")

# manicure...
tidy_nails <- tidy_nails %>% 
  mutate(
    salons = 100000 * salons / population,
    technicians = 100000 * technicians / population
  ) %>% 
  select(-population) %>%
  arrange(state)

# layer...
nail_art <- tidy_nails %>%
  ggplot(aes(
    x = salons, 
    y = technicians, 
    group = state, 
    colour = region)) +
  geom_line(
    alpha = .4, 
    lwd = 1.5) +
  geom_point(
    data = tidy_nails %>% 
      filter(year == 2017), 
    size = 3) +
  xlim(0,50) + 
  xlab("Salons per 100k") + 
  ylab("Technicians per 100k") + 
  facet_wrap(~ region)

# stamp...
plot(nail_art)
