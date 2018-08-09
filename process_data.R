library(tidyverse)
df <- read_csv("2017_ssbm_h2h.csv")

player_names <- df$X2[2:51]

N_wins <- df %>% 
    filter(X1 %in% 1:50) %>%
    select("Armada":"Mafia") %>%
    mutate_all(as.numeric) %>%
    replace(is.na(.), 0) %>%
    as.matrix

colnames(N_wins) <- NULL

