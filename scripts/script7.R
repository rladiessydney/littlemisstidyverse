# load packages 
library(tidyverse)

# a new data set! this is from an experient i ran looking at
# how people reason about... stuff. really the details don't
# matter, other than to note that there are multiple observations
# per person...
reasoning <- read_csv("./datasets/frames_ex2.csv")

# use filter to extract the data from person with id = 12
person <- reasoning %>% 
  filter(id == 12)

# take a look
print(person)

# let's look at their average "response" across each of the
# 7 test items
generalisation <- person %>%
  group_by(test_item) %>%
  summarise(mean_response = mean(response))

# plot it
pic <- generalisation %>% 
  ggplot(aes(x = test_item, y = mean_response)) +
  geom_point() + 
  geom_smooth(method = lm)

plot(pic)

