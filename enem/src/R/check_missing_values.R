# Creates variable enem_empty_colums with all columns that are missing values
# TODO: Add default values to missing fields

enem <- read.csv('../../data/enem_data_converted.csv')
enem[enem==""] <- NA
enem_empty_colums = enem[, colSums(is.na(enem)) > 0]
# View(enem_empty_colums)