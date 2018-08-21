# load packages & import data
library(tidyverse)
tidy_nails <- read_csv("./datasets/tidy_nails.csv")

# gather
long_nails <- tidy_nails %>%
  gather(key = "kind", value = "count", technicians, salons)

# make a pretty picture
nail_art <- long_nails %>%
  ggplot(aes(x = population, y = count)) +
  geom_smooth(colour = "grey70", method = "lm") +
  geom_point(aes(colour = region, shape = factor(year)), size = 2) + 
  facet_wrap(~kind, scales = "free_y") 

# plot it
plot(nail_art)
