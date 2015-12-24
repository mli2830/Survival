library(dplyr)

threshVL <- 400
set.seed(2017)

obs <- mutate(group_by(obs, id)
              , setPoint = rlnorm(1, meanlog=7, sdlog=1)
              , VL = rlnorm(n(), meanlog=log(setPoint), sdlog=1)
              , VL = pmax(VL, threshVL)
              , logVL = log(VL)
              , cumVL = cumsum(logVL)
)

summary(obs)