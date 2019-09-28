load_enem = function(load_from_csv, nrows = 10000){
  source('tools/load_dataset.R', local=TRUE)
  source('tools/prepare_dataset.R', local=TRUE)
  
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
  
  enem$REGIAO[is.element(enem$SG_UF_RESIDENCIA, c('AM','RR','AP','PA','TO','RO','AC'))] = 'A'
  enem$REGIAO[is.element(enem$SG_UF_RESIDENCIA, c('MA','PI','CE','RN','PE','PB','SE','AL','BA'))] = 'B'
  enem$REGIAO[is.element(enem$SG_UF_RESIDENCIA, c('MT','MS','GO','DF'))] = 'C'
  enem$REGIAO[is.element(enem$SG_UF_RESIDENCIA, c('SP','RJ','ES','MG'))] = 'D'
  enem$REGIAO[is.element(enem$SG_UF_RESIDENCIA, c('PR','RS','SC'))] = 'E'
  
  # Convert character columns to factors
  enem[] <- lapply(enem, function(x) if(is.character(x)) as.factor(x) else x)
  
  enem$TP_ESTADO_CIVIL = as.integer(enem$TP_ESTADO_CIVIL)
  enem$TP_STATUS_REDACAO = as.integer(enem$TP_STATUS_REDACAO)
  
  return(enem)
}