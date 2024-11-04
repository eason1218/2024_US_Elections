#### Preamble ####
# Purpose: Downloads and saves the data from csv.
# Author: YiZhuo Li
# Date: 2 November, 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)

#### Download data ####
the_raw_data <- read_csv("data/01-raw_data/president_polls.csv")


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "data/01-raw_data/raw_data.csv")
