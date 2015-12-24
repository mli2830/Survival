library(survival)
obs <- as.data.frame(obs)

coxph(Surv(start.yrs, end.yrs, OI) ~ logVL, data=obs)
coxph(Surv(start.yrs, end.yrs, OI) ~ cumVL + logVL, data=obs)