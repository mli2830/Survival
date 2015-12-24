library(survival)

obs <- as.data.frame(obs)

obs <- within(obs, {
  start.q <- round(2*start.yrs)
  end.q <- round(2*end.yrs)
})

coxph(Surv(start.q, end.q, OI) ~ logVL, data=obs)
coxph(Surv(start.q, end.q, OI) ~ cumVL + logVL, data=obs)