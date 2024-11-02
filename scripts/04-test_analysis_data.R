#### Preamble ####
# Purpose: Tests the structure and validity of the analysis data
# Author: YiZhuo Li
# Date: 2 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(tidyverse)

## read the data
poll_of_polls <- read_csv("analysis_data.csv")

#### Test data ####

# Test whether there are exactly 222 unique pollsters
unique_pollsters <- unique(simulate_poll$pollster)
num_unique_pollsters <- length(unique_pollsters)
if (num_unique_pollsters == 222) {
  message("Test Passed: Number of unique pollsters is equal to 222.")
} else {
  stop("Test Failed: Number of unique pollsters is not equal to 222.")
}

# Check if the candidate column is a string
is_candidate_string <- is.character(simulate_poll$candidate)
if (is_candidate_string) {
  message("Test Passed: The candidate column is a string.")
} else {
  stop("Test Failed: The candidate column is not a string.")
}

# Check if the percentage column is numeric
is_percentage_numeric <- is.numeric(simulate_poll$percentage)
if (is_percentage_numeric) {
  message("Test Passed: The percentage column is numeric.")
} else {
  stop("Test Failed: The percentage column is not numeric.")
}

# Check for NA values in the entire data frame
na_check <- any(is.na(simulate_poll))
if (!na_check) {
  message("Test Passed: There are no NA values in simulate_poll.")
} else {
  stop("Test Failed: There are NA values in simulate_poll.")
}

# Check for empty strings in the candidate, percentage, and pollster columns
empty_strings_check <- any(simulate_poll$candidate == "") ||
  any(simulate_poll$percentage == "") ||
  any(simulate_poll$pollster == "")
if (!empty_strings_check) {
  message("Test Passed: There are no empty strings in the candidate, percentage, or pollster columns.")
} else {
  stop("Test Failed: There are empty strings in one or more of the candidate, percentage, or pollster columns.")
}
