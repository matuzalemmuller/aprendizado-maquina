from reader import Reader
from weka import Weka

print("Reading...")
reader = Reader('../../../data/enem_data_converted.csv', chunksize = 10000, encoding='utf-8')
df = reader.readAll()
print(df.head())

print("Saving...")
weka = Weka('../../../data/enem_data_converted.arff')
weka.write('enem_data_converted', df)

print("Done!")