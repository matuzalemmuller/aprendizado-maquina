source('load_enem.R')

# Load dataset
enem = load_enem(TRUE)

# Check if there is NA in enem
sum(is.na(enem))

#library(Hmisc)
#correlations <- rcorr(as.matrix(enem))

library(corrgram)
corrgram(enem)


