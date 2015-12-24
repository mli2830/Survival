obs <- within(obs, {
  dur <- end.yrs - start.yrs
  ldur <- log(dur)
})

summary(glm(
  OI ~ cumVL + logVL,
  offset = ldur,
  family=binomial(link=cloglog),
  data=obs
))