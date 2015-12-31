#Makefile 

current: target

target:	  first.simulate.Rout
	  less first.simulate.Rout

glm:	  base.glm.Rout
	  less base.glm.Rout

############################################

gitroot = ../
-include stuff.mk

-include $(ms)/git.mk

-include $(ms)/visual.mk
-include $(ms)/wrapR.mk
# -include oldlatex.mk

############################################

covariates.Rout: times.RData covariates.R
		 $(run-R)

%.Rout:		 %.R
		 $(run-R)

%.outcomes.Rout: covariates.Rout %.Rout outcomes.R
		 $(run-R)

%.survival.Rout: %.outcomes.Rout survival.R
		 $(run-R)

%.glm.Rout:	 %.outcomes.Rout glm.R
		 $(run-R)

%.quarters.Rout: %.outcomes.Rout quarters.R
		 $(run-R)

#####testing different divisions

%.months.Rout:	 %.outcomes.Rout months.R
		 $(run-R)

%.semi.Rout:	 %.outcomes.Rout semi.R
		 $(run-R)

%.bimonthly.Rout:	%.outcomes.Rout bimonthly.R
			$(run-R)

######################################################

##Survival/test

%.testcov.Rout:	times.RData %.R testcov.R
		$(run-R)

%.simulate.Rout:	%.testcov.Rout simulate.R
			$(run-R)
