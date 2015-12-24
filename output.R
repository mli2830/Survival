obs <- with(obs, data.frame(
  id, start.yrs, end.yrs, VLrec, physRisk, OI
))

#rdsave (obs)