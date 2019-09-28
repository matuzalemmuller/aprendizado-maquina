# Load dataset

source('load_dataset.R')
source('prepare_dataset.R')

# Load from file
enem = load_dataset('../../data/enem_data_converted.csv', nrows = 1000)

# Load from workspace
#load('../../data/r_workspace_enem.RData')
#enem = prepare_dataset(enem)

# Create new fields
enem$NU_NOTA = ( enem$NU_NOTA_CH + enem$NU_NOTA_CN + enem$NU_NOTA_LC + enem$NU_NOTA_MT + enem$NU_NOTA_REDACAO ) / 5

enem$NOTA = cut(enem$NU_NOTA, 
                breaks = c(-Inf, 200, 400, 600, 800, Inf),
                labels = c('E', 'D', 'C', 'B', 'A'))

enem$IDADE = cut(enem$NU_IDADE,
                 breaks = c(-Inf, 20, 35, 50, 70, Inf),
                 labels = c('A', 'B', 'C', 'D', 'E'))


#library(Hmisc)
#correlations <- rcorr(as.matrix(enem))

library(corrgram)
corrgram(enem)


