import pandas as pd 
from pandas.api.types import is_string_dtype
from pandas.api.types import is_numeric_dtype
from io import StringIO

class Weka:
    def __init__(self, file):
        self.file = file

    def write(self, name, data, force_str = []):
        if not isinstance(data, pd.DataFrame):
            try:
                data = pd.DataFrame(data) 
            except:
                return False

        file_str = StringIO()

        file_str.write("@relation %s\n" % name)

        for col in data.columns:
            if is_string_dtype( data[col] ) or col in force_str:
                opts = data[col].unique()
                opts_str = ', '.join(map(str, opts))
                file_str.write("@attribute '%s' { %s }\n" % (col.lower(), opts_str))
            elif is_numeric_dtype( data[col] ):
                file_str.write("@attribute '%s' numeric\n" % col.lower())


        file_str.write("@data\n")

        for i in data.itertuples():
            item = ', '.join(map(str, i[1:]))
            file_str.write("%s\n" % item)

        with open(self.file, 'w') as f:
            f.write(file_str.getvalue())

        return True