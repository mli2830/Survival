library(survival)

obs <- as.data.frame(obs)

obs <- within(obs, {
  start.q <- round(4*start.yrs)
  end.q <- round(4*end.yrs)
})

coxph(Surv(start.q, end.q, OI) ~ cumVL + logVL + physRisk, data=obs)

coxph(Surv(start.q, end.q, OI) ~ cumVL + logVL + physRisk + immRisk, data=obs)