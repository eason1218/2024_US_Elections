#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(dplyr)
library(rstan)
library(ggplot2)
library(knitr)
library(readr)
set.seed(853)

library(tidyverse)

# Function to generate percentages that sum to 1
generate_percentages <- function(n) {
  percentages <- runif(n)  # Generate random numbers
  percentages <- percentages / sum(percentages)  # Normalize to sum to 1
  return(percentages)
}

# Initialize an empty tibble to store the results
simulate_poll <- tibble()

# Loop through pollsters
for (i in 1:222) {
  pollster_name <- paste("Pollster", i)
  # Generate percentages for 4 candidates
  percentages <- generate_percentages(4)
  
  # Create a tibble for this pollster
  pollster_data <- tibble(
    pollster = pollster_name,
    candidate = paste("Candidate", 1:4),
    percentage = percentages
  )
  
  # Combine with the main data frame
  simulate_poll <- bind_rows(simulate_poll, pollster_data)
}

# View the result
print(simulate_poll)

#### Save data ####
write_csv(simulate_poll, "simulate_data.csv")
