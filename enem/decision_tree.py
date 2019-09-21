import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics

# https://stackoverflow.com/questions/24251219/pandas-read-csv-low-memory-and-dtype-options
data_file = "data/enem_data.csv"

# load dataset
data = pd.read_csv(data_file, header=None)
print(data.head())
