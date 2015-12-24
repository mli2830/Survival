library(dplyr)

obs <- mutate(obs
              , timeHazard = base*L*(exp(-start.yrs/L)-exp(-end.yrs/L))
              , lp = bet_VL*logVL + bet_cum*cumVL +
                bet_phys*physRisk + bet_imm*immRisk
              , hazard = timeHazard*exp(lp)
              , OI = rbinom(n(), size=1, prob=1-exp(-hazard))
)

obs <- within(obs, {
  period <- as.factor(round(4*start.yrs))
  ldur <- log(end.yrs-start.yrs)
})

# rdsave(obs)