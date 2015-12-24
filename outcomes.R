library(dplyr)

obs <- mutate(obs
              , timeHazard = base*(end.yrs-start.yrs)
              , lp = bet_VL*logVL + bet_cum*cumVL
              , hazard = timeHazard*exp(lp)
              , OI = rbinom(n(), size=1, prob=1-exp(-hazard))
)

# rdsave(obs)