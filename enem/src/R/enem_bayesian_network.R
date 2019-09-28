# Data --------------------------------------------------------------------
source('tools/load_enem.R')

# Load dataset
enem = load_enem(TRUE, 100000)

# Remove numeric columns
library("dplyr")
enem <- enem %>% select_if(~ !(is.numeric(.x)))

# Split dataset
require(caTools)
set.seed(101) 
sample = sample.split(enem$NOTA, SplitRatio = 0.7)
train = subset(enem, sample == TRUE)
test  = subset(enem, sample == FALSE)

# Check dataset ratio
prop.table(table(train$NOTA))
prop.table(table(test$NOTA))



# Bayesian Network --------------------------------------------------------
library("bnlearn")

structure <- hc(train, score = "bic")
plot(structure)
model <- bn.fit(structure, data = enem)
model

