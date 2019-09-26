import pandas as pd
import numpy as np
from data_types import *  
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics

# load dataset
data_csv = pd.read_csv(data_file, dtype=data_type, encoding='iso-8859-1')
print(data_csv.head())

data = np.array(data_csv)
print(data)

# target = data.pop('TP_COR_RACA').values

# x_train, x_test, y_train, y_test = train_test_split(data.data, data.target, stratify=data.target, random_state=42)