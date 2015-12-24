library(survival)
obs <- as.data.frame(obs)

coxph(Surv(start.yrs, end.yrs, OI) ~ logVL, data=obs)
coxph(Surv(start.yrs, end.yrs, OI) ~ cumVL + logVL, data=obs)

print("mike is adding offset term in coxph")

coxph(Surv(start.yrs, end.yrs, OI) ~ cumVL + logVL + offset(ldur), data=obs)

coxph(Surv(start.yrs, end.yrs, OI) ~ cumVL + logVL + offset(dur), data=obs)
