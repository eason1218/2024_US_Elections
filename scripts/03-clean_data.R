#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)

#### Clean data ####
poll <-  read_csv("data/01-raw_data/raw_data.csv")

poll_of_polls <- poll %>%
  group_by(pollster, answer) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  group_by(pollster) %>%
  mutate(percentage = count / sum(count) * 100) %>%
  select(pollster, answer, percentage)

#### Save data ####
write_csv(poll_of_polls, "data/02-analysis_data/analysis_data.csv")
