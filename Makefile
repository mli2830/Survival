#Makefile 

current: target

target:	  base.outcomes.Rout
	  less base.outcomes.Rout
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