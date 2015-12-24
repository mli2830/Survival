library(survival)

obs <- as.data.frame(obs)

obs <- within(obs, {
  start.q <- round(6*start.yrs)
  end.q <- round(6*end.yrs)
})

coxph(Surv(start.q, end.q, OI) ~ logVL, data=obs)
coxph(Surv(start.q, end.q, OI) ~ cumVL + logVL, data=obs)