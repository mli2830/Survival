library(lme4)

summary(glmer(OI ~ cumVL + logVL + physRisk + period + (1|id) 
              , family = binomial(link = cloglog)
              , offset = ldur
              , data = obs
))