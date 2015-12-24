summary(glm(OI ~ cumVL + logVL + physRisk + period 
            , family = binomial(link = cloglog)
            , offset = ldur
            , data = obs
))