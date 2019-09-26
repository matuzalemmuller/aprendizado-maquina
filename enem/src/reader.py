import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import string
import random

class Reader:
    def __init__(self, file, chunksize = 1000, encoding = 'ISO-8859-1', columns = None, maxRows = None):
        self.chunksize = chunksize
        self.file = file
        self.encoding = encoding
        self.columns = columns

        if maxRows == None:
            with open(file) as f:
                self.maxRows = sum(1 for line in f)
            print(self.maxRows)
        else:
            self.maxRows = maxRows

        self.skip = []

        self.tfr = pd.read_csv(file, chunksize = self.chunksize, encoding = encoding, usecols = columns)

    def read(self, chunksize = 0):
        if chunksize <= 0:
            chunksize = self.chunksize
        df = self.tfr.get_chunk(chunksize)
        df.dropna(inplace=True)

        if len(df.index) < chunksize:
            df_p = self.read(chunksize - len(df.index))
            df = pd.concat([df, df_p])

        return df

    def readAll(self):
        df = None
        for chunk in pd.read_csv(self.file, chunksize = self.chunksize, encoding = self.encoding, usecols = self.columns):
            chunk.dropna(inplace=True)
            if df is None:
                df = chunk
            else:
                df = pd.concat([df, chunk])
        return df

    def clear(self, file):
        df = None
        count = 0
        for chunk in pd.read_csv(self.file, chunksize = 100000, encoding = self.encoding, error_bad_lines=False):
            chunk.dropna(inplace=True)
            if df is None:
                df = chunk
            else:
                df = pd.concat([df, chunk])
            count += 1
        
        df.to_csv(file)

        return df

    def random(self, chunksize = 0):
        if chunksize <= 0:
            chunksize = self.chunksize
        
        count = chunksize
        def shouldSkip(n):
            nonlocal count
            if n == 0:
                return False
            elif count <= 0:
                return True
            elif n in self.skip:
                return True
            elif random.random() > 0.1:
                return True
            self.skip.append(n)
            count -= 1
            return False

        # print("Reading: %d" % chunksize)
        # print("Skip: %d" % len(self.skip))
        df = pd.read_csv(self.file, skiprows = shouldSkip, encoding = self.encoding, usecols = self.columns)
        df.dropna(inplace=True)
        # print("Readed: %d" % len(df.index))
        # print("Needed: %d" % chunksize)
        # print(df)

        if len(df.index) < chunksize:
            df_p = self.random(chunksize - len(df.index))
            df = pd.concat([df, df_p])

        
        # print(df)

        return df

if __name__ == "__main__":

    #%% Abre o arquivo para leitura
    print("Creating...")
    reader = Reader('../data/enem_data.csv', maxRows = 8627368, columns = ['SG_UF_RESIDENCIA', 'Q006', 'NU_NOTA_CN', 'NU_NOTA_CH', 'NU_NOTA_LC', 'NU_NOTA_MT', 'NU_NOTA_REDACAO'])

    #%% Lê um pacote
    print("Reading...")
    df = reader.read()

    #%%
    print("Raw:")
    print(df.head())

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

    #%% Dados estatísticos sobre as notas
    stats = df[['NU_NOTA_CN', 'NU_NOTA_CH', 'NU_NOTA_LC', 'NU_NOTA_MT', 'NU_NOTA_REDACAO', 'NOTA_MEDIA']].describe()
    print("Estatísticas")
    print(stats)

    #%% Dados categóricos
    print("Categorias: ")
    print(df.describe(include="O"))

    #%% Pessoas com nota máxima em redação:
    print("# de notas máximas em redação: ")
    print(len(df[df.NU_NOTA_REDACAO == 1000]))

    #%% Histograma das médias
    plt.figure(0)
    sns.distplot(df.NOTA_MEDIA)

    #%% distribuição dos estudantes por estado
    des = df.SG_UF_RESIDENCIA.value_counts()
    print(des)

    #%% De forma gráfica:
    plt.figure(1)
    df.SG_UF_RESIDENCIA.value_counts().plot.bar(color='blue')

    #%% 17 primeiras letras maiúsculas
    ordem_renda = list(string.ascii_uppercase[:17])
    print(ordem_renda)
    #Q006_order=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q"]

    #%% distribuição do número de alunos por nível de renda
    plt.figure(2)
    df.Q006.value_counts().plot.bar(color='blue')


    #%% Distribuição de notas por patamar de renda familiar
    fig, ax = plt.subplots()
    # the size of A4 paper
    # fig.set_size_inches(11.7, 8.27)

    sns.violinplot(
        x="Q006", 
        y="NOTA_MEDIA", 
        data=df, # caso queira recortar por estado: df[(df.SG_UF_RESIDENCIA == {código de estado})]
        order=ordem_renda
        )
    plt.title("Distribuição de notas por patamar de renda familiar")



    #%% Distribuição de notas por estado
    fig, ax = plt.subplots()
    # the size of A4 paper
    # fig.set_size_inches(11.7, 8.27)

    sns.violinplot(
        x="SG_UF_RESIDENCIA",
        y="NOTA_MEDIA",
        data=df, # caso queira recortar por patamar de renda: df[(df.Q006 == {nível de renda, letra de A a Q})]
        )
    plt.title("Distribuição de notas por estado")
    plt.show()

    #%% Mostra plot
    # plt.show(block=True)

