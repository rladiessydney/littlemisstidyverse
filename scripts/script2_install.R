# The goal in the LMT tutorial is to get you started doing DATA ANALYSIS in 
# R as quickly as possible, so there will be lots of moments where we'll skip
# over some of the long, complicated explanations for WHY we're doing things
# in a particular way. I'll try to refer to these parts as **sorcery**, meaning
# that there is actually a perfectly sensible explanation, but it's waaaay too
# time consuming.

# So let's get started. First you need to install tidyverse. Here is the command
# that you need:

install.packages("tidyverse")

# Note that the quote marks "" are required here. There will be other commands
# where quotes aren't needed. This is one of the sorcery things.

# You only need to *install* a package once. If you can get this script to run
# then you will not need to install tidyverse ever again (sort of - more sorcery)
# because it is always on your computer.

# However you DO need to load tidyverse. Every time. So let's do that. 

library(tidyverse)

# Notice that this doesn't have quote marks (sorcery). You will also notice that
# every one of my scripts later will start with a library(tidyverse) command. 

# Finally, let's just check that tidyverse is installed and properly loaded. This
# command will draw a pretty picture:

pic <- USArrests %>% 
  ggplot(aes(x = Murder, y = Assault, colour = UrbanPop)) +
  geom_point() + 
  geom_smooth(method = lm)

plot(pic)

# You should be looking at a plot displaying the number of arrests for murder
# (per 100,000 residents) in the US in 1973 against the number of arrests for
# assault. Each dot is a different US state, and the colour of the markers 
# reflects the percent of the populatiuon living in urban areas. Laid over the
# top is the best fitting regression line plus prediction interval.

# That's quite a lot to get from one short section of R code!


# COMMON ISSUE #1: If you are looking at an error message that reads...
#
#    Error in (blah blah blah) could not find function "%>%"
#
# It means you don't have tidyverse loaded. Try the library(tidyverse) 
# command from line 22 above

# COMMON ISSUE #2: If you are looking at an error message that reads...
#
#    Error in library(tidyverse) : there is no package called ‘tidyverse’
#
# It means you don't have tidyverse *installed*. Check out the installation
# command on line 11 above




