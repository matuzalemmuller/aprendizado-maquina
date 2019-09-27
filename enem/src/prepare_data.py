# Removes lines with less or more than 165 commas
# Replaces single and double quotes by spaces
# Saves the new data file using UTF-8 format

import sys
sys.path.append('./old_codes')

import data_types as dt

def main(remove_empty):
    load_file = "../data/enem_data.csv"
    save_file = "../data/enem_data_converted.csv"

    header = None
    valid = [0] * len(dt.data_useful)

    with open(load_file, 'r', encoding='iso-8859-1') as file_loaded:
        print("Loading data from file " + load_file + "...")      
        with open(save_file, 'w', encoding='utf-8') as f:
            for idx, line in enumerate(file_loaded):
                parts = line.strip().split(',')
                if idx == 0:
                    header = parts
                    for i in range(len(valid)):
                        valid[i] = header.index(dt.data_useful[i])

                count = len(parts) 
                if count != 166:
                    # print("Removed line " + str(idx) + " [Invalid columns]")
                    pass
                elif remove_empty and '' in parts:
                    # print("Removed line " + str(idx) + " [Empty fields]")
                    pass
                else:
                    useful = [parts[i] for i in valid]
                    line = ','.join(useful)
                    if "'" in line:
                        line = line.replace("'", " ")
                        # print("Removed single quote from line " + str(idx))
                    if '"' in line:
                        line = line.replace('"', " ")
                        # print("Removed double quote from line " + str(idx))
                    f.write(line+'\n')
        print("Data has been prepared for analysis!")

if __name__ == "__main__":
    main(remove_empty = True)