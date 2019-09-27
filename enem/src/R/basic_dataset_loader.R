# Load dataset

source('load_dataset.R')
source('prepare_dataset.R')

# Load from file
enem = load_dataset('../../data/enem_data_converted.csv', nrows = 100)

# Load from workspace
#load('../../data/r_workspace_enem.RData')
#enem = prepare_dataset(enem)


