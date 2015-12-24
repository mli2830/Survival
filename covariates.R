library(dplyr)

threshVL <- 400
set.seed(2017)
obs <- (obs %>% group_by(id)
          %>% mutate(setPoint = rlnorm(1, meanlog=7, sdlog=1)
              , VL = rlnorm(n(), meanlog=log(setPoint), sdlog=1)
              , VL = pmax(VL, threshVL)
              , logVL = log(VL)
              , cumVL = cumsum(logVL)
          )
)

summary(obs)
