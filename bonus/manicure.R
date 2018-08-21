library(tidyverse)

# source for nails data: Nails Magazine:
# http://files.nailsmag.com/Handouts/NABB2017-18stats-LR.pdf
# http://files.nailsmag.com/Handouts/NABB2016-17industrystats.pdf
#
# source for population data: US Census Bureau
# https://www.census.gov/data/datasets/2017/demo/popest/state-total.html

# the raw data for the nails data are very untidy indeed, and in need of
# a professional manicure. we'll have to read the data into R with minimal
# processing, and do the work ourselves...

# read the raw files with no splitting
nails_raw_2017 <- read_delim(
  file = "./datasets/nails_raw_2017.txt",
  col_names = FALSE,
  delim = "////")

nails_raw_2016 <- read_delim(
  file = "./datasets/nails_raw_2016.txt",
  col_names = FALSE,
  delim = "////")

# add a "years" column
nails_raw_2017$year <- 2017
nails_raw_2016$year <- 2016

# concatenate
nails <- bind_rows(
  nails_raw_2017, nails_raw_2016
)

# strip out the commas
nails <- nails %>% mutate(
  X1 = X1 %>% 
    str_remove_all(",")
)

# to obtain the state names we need to
# remove all the numbers, and to make it
# nice we'll trim the trailing spaces
nails <- nails %>% mutate(
  state = X1 %>% 
    str_remove_all("[:digit:]") %>%  # regex sorcery!
    str_remove_all("[:punct:]") %>%   
    str_trim()
)

# to obtain the two numeric columns 
# we need to do the inverse: remove 
# all the alphabetic characters and
# (because Dist. of Columbia has a
# period) punctuation characters

nails <- nails %>% mutate(
  X2 = X1 %>% 
    str_remove_all("[:alpha:]") %>%  
    str_remove_all("[:punct:]") %>% 
    str_trim()
)

# the separate function in the tidyr
# package is smart enough to work out
# how to split the

nails <- nails %>% separate(
  col = X2,
  into = c("technicians", "salons")
)

# now get rid of X1...
nails <- nails %>% select(-X1)

# convert "Dist of Columbia" to "District of Columbia"
# so that the nails data matches US Census names
nails <- nails %>% 
  mutate(state = state %>% 
           str_replace_all("Dist", "District")
         )

# next step... the population data is
# downloaded from the US census 

pop <- read_csv("./datasets/nst-est2017-alldata.csv") 

pop <- pop %>%
  select(STATE,REGION,NAME,POPESTIMATE2016,POPESTIMATE2017) %>%
  filter(STATE > 0 & NAME != "Puerto Rico") %>%
  select(-STATE)

names(pop) <- c("region", "state","2016","2017")

pop <- pop %>% 
  gather(key = "year", value = "population", `2016`, `2017`)

# coerce year as numeric, and recode the US Census region
# number using the colloquial name
pop <- pop %>%
  mutate(
    year = year %>% as.numeric(),
    region = region %>% recode(
      "1" = "Northeast",
      "2" = "Midwest",
      "3" = "South",
      "4" = "West"
    )
  )

# data base join
tidy_nails <- full_join(nails, pop)

# and write it to a nice file
tidy_nails %>% write_csv("./datasets/tidy_nails.csv")


