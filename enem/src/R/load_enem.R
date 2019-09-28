load_enem = function(load_from_csv, nrows = 10000){
  source('load_dataset.R', local=TRUE)
  source('prepare_dataset.R', local=TRUE)
  
  if(load_from_csv == TRUE) {
    # Load from file
    enem = load_dataset('../../data/enem_data_converted.csv', nrows = nrows)
  } else {
    # Load from workspace
    enem <- readRDS("../../data/enem_filtered_data.rds")
    enem = prepare_dataset(enem)
  }
  
  # Create new fields
  enem$NU_NOTA = ( enem$NU_NOTA_CH + 
                     enem$NU_NOTA_CN + 
                     enem$NU_NOTA_LC + 
                     enem$NU_NOTA_MT + 
                     enem$NU_NOTA_REDACAO ) / 5
  
  enem$NOTA = cut(enem$NU_NOTA, 
          breaks = c(-Inf, 200, 400, 600, 800, Inf),
          labels = c('E', 'D', 'C', 'B', 'A'))
  
  enem$IDADE = cut(enem$NU_IDADE,
           breaks = c(-Inf, 20, 35, 50, 70, Inf),
           labels = c('A', 'B', 'C', 'D', 'E'))
  
  
  return(enem)
}