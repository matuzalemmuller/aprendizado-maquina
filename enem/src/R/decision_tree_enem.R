# Randomize
set.seed(563)

# Loading the dataset
enem <- read.csv('../../data/enem_data_converted.csv')

# Select random rows
shuffle_index <- sample(1:nrow(enem))

# shuffle the dataset
enem <- enem[shuffle_index, ]

# remove unused columns
#enem <- subset(enem, select = c(SG_UF_RESIDENCIA, NU_IDADE, TP_SEXO, TP_ESTADO_CIVIL, TP_COR_RACA, TP_ESCOLA, TP_ENSINO, Q001, Q002, Q003, Q004, Q006, Q007, Q026, Q027, Q028, Q042, Q046, Q047, Q050))
enem <- subset(enem, select = c(NU_IDADE, TP_ESTADO_CIVIL, TP_COR_RACA, Q001, Q002, Q003, Q004, Q006, Q007, Q026, Q027, Q028, Q050))

# Function to select train/test set
create_train_test <- function(data, size = 0.8, train = TRUE){
  n_row = nrow(data)
  total_row = size * n_row
  train_sample <- 1:total_row
  if(train == TRUE){
    return (data[train_sample, ])
  }
  else{
    return (data[-train_sample, ])
  }
}

# Train and test datasets
data_train <- create_train_test(enem, 0.8, train = TRUE)
data_test <- create_train_test(enem, 0.8, train = FALSE)
dim(data_train)
dim(data_test)

# Checking the randomization
prop.table(table(data_train$TP_COR_RACA))
prop.table(table(data_test$TP_COR_RACA))


# Install rpart.plot if not installed
if (!require("rpart.plot")) install.packages("rpart.plot")	

# Creating the model
library(rpart)
library(rpart.plot)
fit <- rpart(TP_COR_RACA~., data = data_train, method = 'class')
rpart.plot(fit, extra = 106)


# Prediction function
accuracy_tune <- function(fit) {
  predict_unseen <- predict(fit, data_test, type = 'class')
  table_mat <- table(data_test$TP_COR_RACA, predict_unseen)
  accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
  print(paste('Accuracy for test', accuracy_Test))
}

# Make predictions
accuracy_tune(fit)

# Tune hyperparameters
control <- rpart.control(minsplit = 4,
                         minbucket = round(5 / 3),
                         maxdepth = 3,
                         cp = 0)
tune_fit <- rpart(TP_COR_RACA~., data = data_train, method = 'class', control = control)
rpart.plot(tune_fit, extra = 106)
accuracy_tune(tune_fit)


