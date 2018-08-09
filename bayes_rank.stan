data {
    int<lower=0> N_players;
    int<lower=0> N_wins[N_players, N_players];
    int<lower=0> N_games[N_players, N_players];
}
parameters {
    real skill[N_players];
}
model {
    skill ~ normal(0, 100);
    for (i in 1:(N_players - 1)) {
        for(j in (i + 1):N_players) {
            N_wins[i, j] ~ binomial_logit(N_games[i,j], skill[i] - skill[j]);
        }
    }
}
