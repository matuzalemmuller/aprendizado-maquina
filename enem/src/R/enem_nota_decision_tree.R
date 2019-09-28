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
nota.settings <- rpart.control(minsplit = 4,
                         minbucket = round(5 / 3),
                         maxdepth = 4,
                         cp = 0)

# Model
nota.model = rpart(NOTA ~ Q006 + Q024 + Q047 + Q001, 
                   data=train, 
                   method = 'class', 
                   control = nota.settings)

# Plot the model
prp(nota.model)

# Predict
nota.prediction <-predict(nota.model, test, type = 'class')
nota.table <- table(test$NOTA, nota.prediction)
nota.accuracy <- sum(diag(nota.table)) / sum(nota.table)
print(paste('Accuracy for test', nota.accuracy))
