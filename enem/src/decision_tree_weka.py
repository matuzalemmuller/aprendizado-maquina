
#%% Imports

import math
import pandas as pd

from reader import Reader
from weka import Weka

def roundup(x):
    return int(round(x / 100.0)) * 100

#%% Defines the loaded columns
#load_cols = ['Q001', 'Q002', 'Q006', 'Q007', 'Q042', 'Q043', 'NU_NOTA_CN', 'NU_NOTA_CH', 'NU_NOTA_LC', 'NU_NOTA_MT', 'NU_NOTA_REDACAO', 'TP_COR_RACA', 'TP_ESCOLA', 'TP_ENSINO']
load_cols = None

#%% Open the database and read the data
# reader = Reader('data/microdados_enem_2016_coma.csv', maxRows = 8627368, columns = load_cols, chunksize = 100)
reader = Reader('../data/enem_data.csv', maxRows = 8627368, columns = load_cols, chunksize = 30000)
df = reader.read()

#%% Calcula a nota média de cada aluno
df['NOTA_MEDIA'] = (df['NU_NOTA_CN'] + df['NU_NOTA_CH'] + df['NU_NOTA_LC'] + df['NU_NOTA_MT'] + df['NU_NOTA_REDACAO']) / 5.0
# print("Média:")
# print(df.head())
    
#%% Elimina linhas com nota NaN
# df.dropna(inplace=True)
# print("Sem NaN:")
# print(df.head())

#%% Nota média em blocos
df['NOTA_MEDIA'] = df['NOTA_MEDIA'].apply(roundup)
# print("Media em blocos:")
# print(df.head())

# feature_cols = [ 'SG_UF_RESIDENCIA', 'Q001', 'Q002', 'Q006', 'Q007', 'TP_COR_RACA', 'TP_ANO_CONCLUIU', 'IN_TREINEIRO', 'TP_ESCOLA', 'TP_ENSINO', 'NOTA_MEDIA' ]
feature_cols = [ 'Q006', 'Q050', 'TP_ESCOLA', 'NOTA_MEDIA' ]
data = df[feature_cols]

print("Dados: ")
print(data)

print("Salvando...")
weka = Weka('enem2016.arff')
weka.write('enem2016', data, force_str = ['TP_COR_RACA', 'TP_ANO_CONCLUIU', 'IN_TREINEIRO', 'TP_ESCOLA', 'TP_ENSINO', 'NOTA_MEDIA'])

print("Finalizado!")