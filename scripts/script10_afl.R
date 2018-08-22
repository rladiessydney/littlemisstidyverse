# load packages
library(tidyverse)

# read...
afl <- read_csv("./datasets/afl.csv")

# summarise...
attendance <- afl %>%
  group_by(year, game_type) %>%
  summarise(attendance = mean(attendance))

# visualise...
pic <- attendance %>%
  ggplot(aes(x = year, y = attendance)) +
  geom_point() + 
  facet_wrap(~ game_type) + 
  geom_smooth()

# output...
print(attendance)
plot(pic)