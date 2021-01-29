#If you are totally freshman about bioinformatics, I highly recommend you strat with my tutorial.
#We start with installing required packages.
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.12")
#why we start with installing BioManager?
#If you want to install packages released by bioconductor
#you could install.packages("tidyverse") for common packages like that.
#But you not use 'install.packages("BioManager")' for Bioconductor packages.
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")
#The next packages is GEOquery. It will help us query data from GEO.
library(GEOquery)
#Here I recommend that any new package, it is better for you to read the documents or using ?packages to read how the usages.
#I am interested with GSE15197, so I start analysis with it.
#The first step is loading the data.
rawdata = GEOquery::getGEO(GEO = 'GSE15197', AnnotGPL = T, destdir = '.')
#So, here is a little trick that when you could not remember the argument, then you could type the name of the package and choice the one.
#destdir = '.' means downloading the file in current Rproject.
exprs <- rawdata[[1]]
#we observe the stucture of 'rawdata', use [[1]] instead of using [1] to extract the expressionset data.
eset <- exprs(exprs)
#dim(eset) check out the data 
pset <- pData(exprs)
#head(pset)
fdata <- fData(exprs)
# we could use fdata do annotation.

library(limma)
limma::plotDensities(eset)
eset <- limma::normalizeBetweenArrays(eset)
limma::plotDensities(eset)


