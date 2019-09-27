import pandas as pd
import string
import random

class Reader:
    # def __init__(self, file, chunksize = 1000, encoding = 'ISO-8859-1', columns = None, maxRows = None):
    def __init__(self, file, chunksize = 1000, encoding = 'ISO-8859-1', columns = None):
        self.chunksize = chunksize
        self.file = file
        self.encoding = encoding
        self.columns = columns

        # if maxRows == None:
        #     with open(file) as f:
        #         self.maxRows = sum(1 for line in f)
        #     print(self.maxRows)
        # else:
        #     self.maxRows = maxRows

        self.skip = []
        
        self.tfr = pd.read_csv(file, chunksize = self.chunksize, encoding = encoding, usecols = columns, iterator=True)

    def read(self, chunksize = 0):
        if chunksize <= 0:
            chunksize = self.chunksize
        df = self.tfr.get_chunk(chunksize)
        # print(len(df.index))
        # df.dropna(inplace=True)

        # print(len(df.index))
        # if len(df.index) < chunksize:
        #     df_p = self.read(chunksize - len(df.index))
        #     df = pd.concat([df, df_p])

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