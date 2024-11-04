#### Preamble ####
# Purpose: Clean the raw data
# Author: YiZhuo Li
# Date: 2 November, 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and `readr` package must be installed

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
poll <- read.csv("data/01-raw_data/raw_data.csv")

poll_of_polls <- poll %>%
  group_by(pollster, answer) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  group_by(pollster) %>%
  mutate(percentage = count / sum(count) * 100) %>%
  select(pollster, answer, percentage, count)

#### Save data ####
write_csv(poll_of_polls, "data/02-analysis_data/analysis_data.csv")
