# Removes lines with less or more than 165 commas
# Replaces single and double quotes by spaces
# Saves the new data file using UTF-8 format

def main():
    load_file = "../data/enem_data.csv"
    save_file = "../data/enem_data_converted.csv"

    with open(load_file, 'r', encoding='iso-8859-1') as file_loaded:
        print("Loading data from file " + load_file + "...")      
        with open(save_file, 'w', encoding='utf-8') as f:
            for idx, line in enumerate(file_loaded):
                count = line.count(',')            
                if count != 165:
                    print("Removed line " + str(idx))
                else:
                    if "'" in line:
                        line = line.replace("'", " ")
                        print("Removed single quote from line " + str(idx))
                    if '"' in line:
                        line = line.replace('"', " ")
                        print("Removed double quote from line " + str(idx))
                    f.write(line)
        print("Data has been prepared for analysis!")

if __name__ == "__main__":
    main()