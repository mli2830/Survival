#Makefile 

current: target

target:	  base.survival.Rout
	  less base.survival.Rout
############################################


gitroot = ../
-include local.mk
-include $(gitroot)/local.mk
ms = $(gitroot)/makestuff

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