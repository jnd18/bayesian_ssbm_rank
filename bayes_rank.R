library(magrittr)
library(tidyverse)
library(rstan)

rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

N_players <- 50

N_games <- N_wins + t(N_wins)

data_list <- list(
    N_players = N_players,
    N_wins = N_wins,
    N_games = N_games
)

# stan fit
fit <- stan(
    file = 'bayes_rank.stan',
    data = data_list,
    iter = 10000,
    chains = 4
)

