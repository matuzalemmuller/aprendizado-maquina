prepare_dataset = function(data) 
{
    data <- data[!(is.na(data$NU_IDADE)), ]

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

    data$Q001[data$Q001 == ''] = 'H'                                # 'nao sei'
    data$Q002[data$Q002 == ''] = 'H'                                # 'nao sei'
    data$Q003[data$Q003 == ''] = 'F'                                # 'nao sei'
    data$Q004[data$Q004 == ''] = 'F'                                # 'nao sei'

    # Remove rows that have too few empty fields
    # It is not necessary to create a new category for these rows,
    # we can just remove them as there are just a few
    # Unnecessary to delete rows for other Qs as deleting the rows for Q005 
    # already deletes those
    data <- data[!(is.na(data$Q005)), ]

    return(data)
}