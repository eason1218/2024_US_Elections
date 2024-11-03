#### Preamble ####
# Purpose: Simulates polling data with support percentages and vote counts for candidates across multiple pollsters.
# Author: YiZhuo Li
# Date: 2 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)
set.seed(853)

library(tidyverse)

# Function to generate percentages that sum to 1
generate_percentages <- function(n) {
  percentages <- runif(n) # Generate random numbers
  percentages <- percentages / sum(percentages) # Normalize to sum to 1
  return(percentages)
}

# Initialize an empty tibble to store the results
simulate_poll <- tibble()

# Loop through pollsters
for (i in 1:222) {
  pollster_name <- paste("Pollster", i)

  # Generate percentages for 4 candidates
  percentages <- generate_percentages(4)

  # Generate random count numbers between 1 and 200 for each candidate
  counts <- sample(1:200, 4, replace = TRUE)

  # Create a tibble for this pollster with an additional count column
  pollster_data <- tibble(
    pollster = pollster_name,
    candidate = paste("Candidate", 1:4),
    percentage = percentages,
    count = counts
  )

  # Combine with the main data frame
  simulate_poll <- bind_rows(simulate_poll, pollster_data)
}

# View the result
print(simulate_poll)

#### Save data ####
write_csv(simulate_poll, "simulated_data.csv")
