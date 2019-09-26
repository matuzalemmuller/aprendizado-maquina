
#%% Imports
# Import Decision Tree Classifier
from sklearn.tree import DecisionTreeClassifier 
# Import train_test_split function
from sklearn.model_selection import train_test_split 
# Import scikit-learn metrics module for accuracy calculation
from sklearn import metrics 

from sklearn import preprocessing
from sklearn.tree import export_graphviz
from sklearn.externals.six import StringIO  
from IPython.display import Image  
import pydotplus

import math

# Import csv reader
from reader import Reader
import pandas as pd

def roundup(x):
    return int(round(x / 100.0)) * 100

#%% Defines the loaded columns
load_cols = ['SG_UF_RESIDENCIA', 'Q006', 'NU_NOTA_CN', 'NU_NOTA_CH', 'NU_NOTA_LC', 'NU_NOTA_MT', 'NU_NOTA_REDACAO']

#%% Open the database and read the data
reader = Reader('../data/enem_data.csv', maxRows = 8627368, columns = load_cols)
df = reader.read()

#%% Calcula os alunos faltantes
total = df.isnull().sum().sort_values(ascending = False)
percentual = (df.isnull().sum()/df.isnull().count()*100).sort_values(ascending = False)
faltantes  = pd.concat([total, percentual], axis=1, keys=['Total', 'Percentual'])
print('Faltantes:')
print(faltantes)

#%% Calcula a nota média de cada aluno
df['NOTA_MEDIA'] = (df['NU_NOTA_CN'] + df['NU_NOTA_CH'] + df['NU_NOTA_LC'] + df['NU_NOTA_MT'] + df['NU_NOTA_REDACAO']) / 5.0
print("Média:")
print(df.head())
    
#%% Elimina linhas com nota NaN
df.dropna(inplace=True)
print("Sem NaN:")
print(df.head())

#%% Nota média em blocos
df['NOTA_MEDIA'] = df['NOTA_MEDIA'].apply(roundup)
print("Media em blocos:")
print(df.head())

#%% Split dataset in features and target variable
uf = df['SG_UF_RESIDENCIA'].tolist()
uf_unique = list(dict.fromkeys(uf))
le_uf = preprocessing.LabelEncoder()
le_uf.fit(uf_unique)
uf_data = le_uf.transform(uf)
df['SG_UF_RESIDENCIA'] = uf_data

q006 = df['Q006'].tolist()
q006_unique = list(dict.fromkeys(q006))
le_q006 = preprocessing.LabelEncoder()
le_q006.fit(q006_unique)
q006_data = le_q006.transform(q006)
df['Q006'] = q006_data


print(df.head)


feature_cols = [ 'SG_UF_RESIDENCIA', 'Q006']
X = df[feature_cols] # Features
y = df.NOTA_MEDIA # Target variabledf[]

y_enc = preprocessing.LabelEncoder()
y = y_enc.fit_transform(y)

#%% Split dataset into training set and test set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1) # 70% training and 30% test
print("X: ")
print(X_train)

print("Y: ")
print(y_train)

#%% Create Decision Tree classifer object
clf = DecisionTreeClassifier()


# Train Decision Tree Classifer
clf = clf.fit(X_train,y_train)

#Predict the response for test dataset
y_pred = clf.predict(X_test)

#%% Model Accuracy, how often is the classifier correct?
print("Accuracy:",metrics.accuracy_score(y_test, y_pred))


#%% Plot

class_names_l = list(range(0, 1000, 100))
class_names_l = [str(i) for i in class_names_l]

dot_data = StringIO()
export_graphviz(clf, out_file=dot_data,  
                filled=True, rounded=True,
                special_characters=True,feature_names = feature_cols,class_names=class_names_l)
graph = pydotplus.graph_from_dot_data(dot_data.getvalue())  
graph.write_png('enem2016.png')
Image(graph.create_png())