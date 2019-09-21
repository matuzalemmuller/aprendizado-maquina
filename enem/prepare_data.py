def main():
    data_file = "data/enem_data.csv"

    with open(data_file, 'r') as f:
        lines = f.readlines()
        print("Data loaded")
    with open(data_file, 'w') as f:
        number_of_lines = len(lines)
        for idx, line in enumerate(lines):
            count = line.count(',')            
            if count != 165:
                lines.remove(line)
                print("Removed entry " + str(idx) +
                        " out of " + str(number_of_lines))
            else:
                f.write(line)
    print("Invalid entries have been removed!")

if __name__ == "__main__":
    main()