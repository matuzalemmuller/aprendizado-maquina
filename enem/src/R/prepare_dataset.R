prepare_dataset = function(data) 
{
    data[data==""] = NA

    # remove NA NU_IDADE - 
    # data[is.na(data$NU_IDADE)] <- NULL
    data <- data[!(is.na(data$TP_SEXO)), ]

    # Add default values to missing fields
    data$TP_ESTADO_CIVIL[is.na(data$TP_ESTADO_CIVIL)] = 0           # 'solteiro'

    data$TP_PRESENCA_CN[is.na(data$TP_PRESENCA_CN)] = 0             # missed exam
    data$TP_PRESENCA_CH[is.na(data$TP_PRESENCA_CH)] = 0 
    data$TP_PRESENCA_LC[is.na(data$TP_PRESENCA_LC)] = 0 
    data$TP_PRESENCA_MT[is.na(data$TP_PRESENCA_MT)] = 0 

    data$NU_NOTA_CN[is.na(data$NU_NOTA_CN)] = 0                     # exam grades
    data$NU_NOTA_CH[is.na(data$NU_NOTA_CH)] = 0
    data$NU_NOTA_LC[is.na(data$NU_NOTA_LC)] = 0
    data$NU_NOTA_MT[is.na(data$NU_NOTA_MT)] = 0

    data$TP_STATUS_REDACAO[is.na(data$TP_STATUS_REDACAO)] = 1       # 'sem problemas'

    data$NU_NOTA_COMP1[is.na(data$NU_NOTA_COMP1)] = 0               # essay components
    data$NU_NOTA_COMP2[is.na(data$NU_NOTA_COMP2)] = 0
    data$NU_NOTA_COMP3[is.na(data$NU_NOTA_COMP3)] = 0
    data$NU_NOTA_COMP4[is.na(data$NU_NOTA_COMP4)] = 0
    data$NU_NOTA_COMP5[is.na(data$NU_NOTA_COMP5)] = 0

    data$NU_NOTA_REDACAO[is.na(data$NU_NOTA_REDACAO)] = 0           # essay grade

    data$Q001[is.na(data$Q001)] = 'H'                               # 'nao sei'
    data$Q002[is.na(data$Q002)] = 'H'                               # 'nao sei'
    data$Q003[is.na(data$Q003)] = 'F'                               # 'nao sei'
    data$Q004[is.na(data$Q004)] = 'F'                               # 'nao sei'
    data$Q005[is.na(data$Q005)] = 0                                 # undefined (new category)
    data$Q006[is.na(data$Q006)] = 'Z'                               # undefined (new category)
    data$Q007[is.na(data$Q007)] = 'Z'                               # undefined (new category)
    data$Q008[is.na(data$Q008)] = 'Z'                               # undefined (new category)
    data$Q009[is.na(data$Q009)] = 'Z'                               # undefined (new category)
    data$Q010[is.na(data$Q010)] = 'Z'                               # undefined (new category)
    data$Q011[is.na(data$Q011)] = 'Z'                               # undefined (new category)
    data$Q012[is.na(data$Q012)] = 'Z'                               # undefined (new category)
    data$Q013[is.na(data$Q013)] = 'Z'                               # undefined (new category)
    data$Q014[is.na(data$Q014)] = 'Z'                               # undefined (new category)
    data$Q015[is.na(data$Q015)] = 'Z'                               # undefined (new category)
    data$Q016[is.na(data$Q016)] = 'Z'                               # undefined (new category)
    data$Q017[is.na(data$Q017)] = 'Z'                               # undefined (new category)
    data$Q018[is.na(data$Q018)] = 'Z'                               # undefined (new category)
    data$Q019[is.na(data$Q019)] = 'Z'                               # undefined (new category)
    data$Q020[is.na(data$Q020)] = 'Z'                               # undefined (new category)
    data$Q021[is.na(data$Q021)] = 'Z'                               # undefined (new category)
    data$Q022[is.na(data$Q022)] = 'Z'                               # undefined (new category)
    data$Q023[is.na(data$Q023)] = 'Z'                               # undefined (new category)
    data$Q024[is.na(data$Q024)] = 'Z'                               # undefined (new category)
    data$Q025[is.na(data$Q025)] = 'Z'                               # undefined (new category)
    data$Q026[is.na(data$Q026)] = 'Z'                               # undefined (new category)
    data$Q034[is.na(data$Q034)] = 9                                 # undefined (new category)
    data$Q035[is.na(data$Q035)] = 9                                 # undefined (new category)
    data$Q036[is.na(data$Q036)] = 9                                 # undefined (new category)
    data$Q037[is.na(data$Q037)] = 9                                 # undefined (new category)
    data$Q038[is.na(data$Q038)] = 9                                 # undefined (new category)
    data$Q039[is.na(data$Q039)] = 9                                 # undefined (new category)
    data$Q040[is.na(data$Q040)] = 9                                 # undefined (new category)
    data$Q042[is.na(data$Q042)] = 'Z'                               # undefined (new category)
    data$Q043[is.na(data$Q043)] = 'Z'                               # undefined (new category)
    data$Q044[is.na(data$Q044)] = 'Z'                               # undefined (new category)
    data$Q045[is.na(data$Q045)] = 'Z'                               # undefined (new category)
    data$Q046[is.na(data$Q046)] = 'Z'                               # undefined (new category)
    data$Q047[is.na(data$Q047)] = 'Z'                               # undefined (new category)
    data$Q048[is.na(data$Q048)] = 'Z'                               # undefined (new category)
    data$Q049[is.na(data$Q049)] = 'Z'                               # undefined (new category)
    data$Q050[is.na(data$Q050)] = 'Z'                               # undefined (new category)
    
    return(data)
}