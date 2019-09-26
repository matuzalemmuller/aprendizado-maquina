## Description

This project uses classification and association techniques to achieve a better understanding of the social and economic context of the applicants in the ENEM 2016 exam.

More details are available in the [assigment description (in Portuguese)](assignment.pdf).

## Requirements

* Python 3
* (*Recommended*) "Unix-based" system to run the `head` command

## Instructions

1. Install Python modules:
    ```
    pip3 install -r requirements.txt
    ```
2. Download the data file available in https://www.kaggle.com/gbonesso/enem-2016/data to the `data` folder
3. Uncompress the data file inside the `data` folder
> * (*Recommended*) There are 8.627.367 examples in the uncompressed data file, which results in a long processing time if all examples are used to create to learn the model. It is recommended to choose only a subset of the available data so the processing time is not too long. In order to choose only a subset of the available data, run the code below:
>    ```
>    head -xxxxx data/microdados_enem_2016_coma.csv > data/enem_data.csv
>    ```
> > * This code will create a new file (`data/enem_data.csv`) that contains the first `xxxxx` files of the original file.
4. In order to prepare the data for analysis, it is necessary to:
    * Remove the lines that have less or more than 165 commas
    * Replace single and double quotes by spaces
    * Convert the file to UTF-8
  
    To prepare the data, run the `prepare_data.py` program (remember that the data file should located in the `data` folder and named as `enem_data.csv`):

    ```
    python3 code/prepare_date.py
    ```

5. **[DECISION TREE - IN PROGRESS]** Run the code:
```
python3 code/decision_tree.py
```