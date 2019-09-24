import pandas as pd
from data_types import *  
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics

# load dataset
data = pd.read_csv(data_file, dtype=data_type, encoding='iso-8859-1')
print(data.head())