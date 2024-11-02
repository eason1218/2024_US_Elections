#### Preamble ####
# Purpose: build the model for analysis
# Author: YiZhuo Li
# Date: 2 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and `rstan` package must be installed

#### Workspace setup ####
library(tidyverse)
library(rstan)

#### Read data ####
poll_of_polls <- read.csv("analysis_data.csv")

### Model data ####
stan_model_code <- "
data {
  int<lower=0> N;
  vector[N] percentage;
  int<lower=1> pollster[N];
  int<lower=1> K;
}
parameters {
  real mu;
  real<lower=0> sigma;
  vector[K] pollster_effect;
}
model {
  mu ~ normal(0, 1);
  sigma ~ cauchy(0, 1);
  pollster_effect ~ normal(0, sigma);

  for (i in 1:N) {
    percentage[i] ~ normal(mu + pollster_effect[pollster[i]], sigma);
  }
}
"


#### Save model ####
compiled_model <- stan_model(model_code = stan_model_code)
saveRDS(compiled_model, file = "first_model.rds")
