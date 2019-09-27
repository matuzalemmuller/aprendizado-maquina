from reader import Reader
from weka import Weka

reader = Reader('../../data/enem_data_converted.csv', chunksize = 30000, encoding='utf-8')
df = reader.read()

print("Salvando...")
weka = Weka('enem_data_converted.arff')
weka.write('enem2016', df)

print("Finalizado!")