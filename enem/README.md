## Requirements

* Python 3
* (*Recommended*) "Unix-based" system to run the `head` command

## Instructions

1. Install Python modules:
```
pip3 install -r requirements.txt
```
2. Download the data file in https://www.kaggle.com/gbonesso/enem-2016/data
3. Uncompress the data file
> * (*Recommended*) There are 8.627.367 examples in the uncompressed data file, which results in a long processing time if all examples are used to create to learn the model. It is recommended to choose only a subset of the available data so the processing time is not too long. In order to choose only a subset of the available data, run the code below:
>  ```
>  head -xxxxx microdados_enem_2016_coma.csv > enem_data.csv
>  ```
> > * This code will create a new file (`enem_data.csv`) that contains the first `xxxxx` files of the original file.
3. The name of universities may contain commas, which means that some examples may not be properly loaded from the data file. Therefore, it is necessary to remove those examples from the file so all examples from the `csv` file are properly loaded as a table. In order to remore such examples, run the `prepare_data.py` file:
```
python3 prepare_date.py
```