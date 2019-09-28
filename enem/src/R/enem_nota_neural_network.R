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


# Neural Network ----------------------------------------------------------

# Load NN library
require(nnet)

# fit neural network
nota.model = nnet(NOTA ~ Q006 + Q024 + Q047 + Q001, 
                       data=train, size = 20,
                       maxit=50)

# Plot the model
library("devtools")
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

#plot each model
plot.nnet(nota.model)

# Predict
nota.prediction <- predict(nota.model, test, type="class")
nota.table <- table(test$NOTA, nota.prediction)
nota.accuracy <- sum(diag(nota.table)) / sum(nota.table)
print(paste('Accuracy for test', nota.accuracy))
