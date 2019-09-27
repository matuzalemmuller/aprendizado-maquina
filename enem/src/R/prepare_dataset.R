prepare_dataset = function(data) 
{
    # Set NA
    data[data==""] = NA

    # remove NA NU_IDADE
    data <- data[!(is.na(data$NU_IDADE)), ]


    # Add default values to missing fields
    data$TP_ESTADO_CIVIL[is.na(data$TP_ESTADO_CIVIL)] = 0           # solteiro
    data$TP_ENSINO[is.na(data$TP_ENSINO)] = 1                       # regular

    data$TP_PRESENCA_CN[is.na(data$TP_PRESENCA_CN)] = 0             # faltou a prova
    data$TP_PRESENCA_CH[is.na(data$TP_PRESENCA_CH)] = 0 
    data$TP_PRESENCA_LC[is.na(data$TP_PRESENCA_LC)] = 0 
    data$TP_PRESENCA_MT[is.na(data$TP_PRESENCA_MT)] = 0 

    data$TP_STATUS_REDACAO[is.na(data$TP_STATUS_REDACAO)] = 1       # sem problemas

    data$NU_NOTA_COMP1[is.na(data$NU_NOTA_COMP1)] = 0               # nota redacao
    data$NU_NOTA_COMP2[is.na(data$NU_NOTA_COMP2)] = 0
    data$NU_NOTA_COMP3[is.na(data$NU_NOTA_COMP3)] = 0
    data$NU_NOTA_COMP4[is.na(data$NU_NOTA_COMP4)] = 0
    data$NU_NOTA_COMP5[is.na(data$NU_NOTA_COMP5)] = 0

    data$NU_NOTA_CN[is.na(data$NU_NOTA_CN)] = 0                     # nota provas
    data$NU_NOTA_CH[is.na(data$NU_NOTA_CH)] = 0
    data$NU_NOTA_LC[is.na(data$NU_NOTA_LC)] = 0
    data$NU_NOTA_MT[is.na(data$NU_NOTA_MT)] = 0

    data$NU_NOTA_REDACAO[is.na(data$NU_NOTA_REDACAO)] = 0           # nota da redacao

    data$Q001[is.na(data$Q001)] = 'H'                               # nao sei
    data$Q002[is.na(data$Q002)] = 'H'                               # nao sei
    data$Q003[is.na(data$Q003)] = 'F'                               # nao sei
    data$Q004[is.na(data$Q004)] = 'F'                               # nao sei
    data$Q005[is.na(data$Q005)] = 0                                 # indefinido (nova categoria)
    data$Q006[is.na(data$Q006)] = 'Z'                               # indefinido (nova categoria)
    data$Q007[is.na(data$Q007)] = 'Z'                               # indefinido (nova categoria)
    data$Q008[is.na(data$Q008)] = 'Z'                               # indefinido (nova categoria)
    data$Q009[is.na(data$Q009)] = 'Z'                               # indefinido (nova categoria)
    data$Q010[is.na(data$Q010)] = 'Z'                               # indefinido (nova categoria)
    data$Q011[is.na(data$Q011)] = 'Z'                               # indefinido (nova categoria)
    data$Q012[is.na(data$Q012)] = 'Z'                               # indefinido (nova categoria)
    data$Q013[is.na(data$Q013)] = 'Z'                               # indefinido (nova categoria)
    data$Q014[is.na(data$Q014)] = 'Z'                               # indefinido (nova categoria)
    data$Q015[is.na(data$Q015)] = 'Z'                               # indefinido (nova categoria)
    data$Q016[is.na(data$Q016)] = 'Z'                               # indefinido (nova categoria)
    data$Q017[is.na(data$Q017)] = 'Z'                               # indefinido (nova categoria)
    data$Q018[is.na(data$Q018)] = 'Z'                               # indefinido (nova categoria)
    data$Q019[is.na(data$Q019)] = 'Z'                               # indefinido (nova categoria)
    data$Q020[is.na(data$Q020)] = 'Z'                               # indefinido (nova categoria)
    data$Q021[is.na(data$Q021)] = 'Z'                               # indefinido (nova categoria)
    data$Q022[is.na(data$Q022)] = 'Z'                               # indefinido (nova categoria)
    data$Q023[is.na(data$Q023)] = 'Z'                               # indefinido (nova categoria)
    data$Q024[is.na(data$Q024)] = 'Z'                               # indefinido (nova categoria)
    data$Q025[is.na(data$Q025)] = 'Z'                               # indefinido (nova categoria)
    data$Q026[is.na(data$Q026)] = 'Z'                               # indefinido (nova categoria)
    data$Q027[is.na(data$Q027)] = 'Z'                               # indefinido (nova categoria)
    data$Q028[is.na(data$Q028)] = 'Z'                               # indefinido (nova categoria)
    data$Q029[is.na(data$Q029)] = 9                                 # indefinido (nova categoria)
    data$Q030[is.na(data$Q030)] = 9                                 # indefinido (nova categoria)
    data$Q031[is.na(data$Q031)] = 9                                 # indefinido (nova categoria)
    data$Q032[is.na(data$Q032)] = 9                                 # indefinido (nova categoria)
    data$Q033[is.na(data$Q033)] = 9                                 # indefinido (nova categoria)
    data$Q034[is.na(data$Q034)] = 9                                 # indefinido (nova categoria)
    data$Q035[is.na(data$Q035)] = 9                                 # indefinido (nova categoria)
    data$Q036[is.na(data$Q036)] = 9                                 # indefinido (nova categoria)
    data$Q037[is.na(data$Q037)] = 9                                 # indefinido (nova categoria)
    data$Q038[is.na(data$Q038)] = 9                                 # indefinido (nova categoria)
    data$Q039[is.na(data$Q039)] = 9                                 # indefinido (nova categoria)
    data$Q040[is.na(data$Q040)] = 9                                 # indefinido (nova categoria)
    data$Q041[is.na(data$Q041)] = 9                                 # indefinido (nova categoria)
    data$Q042[is.na(data$Q042)] = 'Z'                               # indefinido (nova categoria)
    data$Q043[is.na(data$Q043)] = 'Z'                               # indefinido (nova categoria)
    data$Q044[is.na(data$Q044)] = 'Z'                               # indefinido (nova categoria)
    data$Q045[is.na(data$Q045)] = 'Z'                               # indefinido (nova categoria)
    data$Q046[is.na(data$Q046)] = 'Z'                               # indefinido (nova categoria)
    data$Q047[is.na(data$Q047)] = 'Z'                               # indefinido (nova categoria)
    data$Q048[is.na(data$Q048)] = 'Z'                               # indefinido (nova categoria)
    data$Q049[is.na(data$Q049)] = 'Z'                               # indefinido (nova categoria)
    data$Q050[is.na(data$Q050)] = 'Z'                               # indefinido (nova categoria)
    
    return(data)
}