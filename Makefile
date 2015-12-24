#Makefile 

current: target

target:	  covariates.Rout
	  less covariates.Rout
############################################

gitroot = ../
-include local.mk
-include $(gitroot)/local.mk
ms = $(gitroot)/makestuff


############################################

covariates.Rout: times.RData covariates.R
		 R CMD BATCH covariates.R