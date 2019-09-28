# Data --------------------------------------------------------------------
source('tools/load_enem.R')

# Load dataset
enem = load_enem(TRUE, 100000)

# Split dataset
require(caTools)
set.seed(101) 
sample = sample.split(enem$NOTA, SplitRatio = 0.6)
train = subset(enem, sample == TRUE)
test  = subset(enem, sample == FALSE)

# Check dataset ratio
prop.table(table(train$NOTA))
prop.table(table(test$NOTA))


# Decision Tree -----------------------------------------------------------

# Load CART packages
library(rpart)
library(rpart.plot)

# Model settings
regiao.settings <- rpart.control(minsplit = 2,
                         minbucket = round(5 / 3),
                         maxdepth = 6,
                         cp = 0)

# Model
regiao.model = rpart(REGIAO ~ Q005 + Q010 + Q013 + Q016 + Q018, 
                   data=train, 
                   method = 'class', 
                   control = regiao.settings)

# Plot the model
prp(regiao.model)

# Predict
regiao.prediction <-predict(regiao.model, test, type = 'class')
regiao.table <- table(test$REGIAO, regiao.prediction)
regiao.accuracy <- sum(diag(regiao.table)) / sum(regiao.table)
print(paste('Accuracy for test', regiao.accuracy))

