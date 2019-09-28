# Load
# enem <- read.csv('../../data/enem_data_converted.csv', stringsAsFactors = FALSE)
enem <- readRDS("../../data/enem_filtered_data.rds")

enem <- enem[!(is.na(enem$NU_IDADE)), ]

# Add default values to missing fields
enem$TP_ESTADO_CIVIL[is.na(enem$TP_ESTADO_CIVIL)] = 0           # 'solteiro'

enem$TP_PRESENCA_CN[is.na(enem$TP_PRESENCA_CN)] = 0             # missed exam
enem$TP_PRESENCA_CH[is.na(enem$TP_PRESENCA_CH)] = 0 
enem$TP_PRESENCA_LC[is.na(enem$TP_PRESENCA_LC)] = 0 
enem$TP_PRESENCA_MT[is.na(enem$TP_PRESENCA_MT)] = 0 

enem$NU_NOTA_CN[is.na(enem$NU_NOTA_CN)] = 0                     # exam grades
enem$NU_NOTA_CH[is.na(enem$NU_NOTA_CH)] = 0
enem$NU_NOTA_LC[is.na(enem$NU_NOTA_LC)] = 0
enem$NU_NOTA_MT[is.na(enem$NU_NOTA_MT)] = 0

enem$TP_STATUS_REDACAO[is.na(enem$TP_STATUS_REDACAO)] = 1       # 'sem problemas'

enem$NU_NOTA_COMP1[is.na(enem$NU_NOTA_COMP1)] = 0               # essay components
enem$NU_NOTA_COMP2[is.na(enem$NU_NOTA_COMP2)] = 0
enem$NU_NOTA_COMP3[is.na(enem$NU_NOTA_COMP3)] = 0
enem$NU_NOTA_COMP4[is.na(enem$NU_NOTA_COMP4)] = 0
enem$NU_NOTA_COMP5[is.na(enem$NU_NOTA_COMP5)] = 0

enem$NU_NOTA_REDACAO[is.na(enem$NU_NOTA_REDACAO)] = 0           # essay grade

enem$Q001[enem$Q001 == ''] = 'H'                                # 'nao sei'
enem$Q002[enem$Q002 == ''] = 'H'                                # 'nao sei'
enem$Q003[enem$Q003 == ''] = 'F'                                # 'nao sei'
enem$Q004[enem$Q004 == ''] = 'F'                                # 'nao sei'

# Remove rows that have too few empty fields
# It is not necessary to create a new category for these rows,
# we can just remove them as there are just a few
enem <- enem[!(is.na(enem$Q005)), ]

# Unnecessary to delete rows for other Qs as deleting the rows for Q005 already
# deletes those
# enem <- enem[!(enem$Q006 == '' ), ]
# enem <- enem[!(enem$Q007 == '' ), ]
# enem <- enem[!(enem$Q008 == '' ), ]
# enem <- enem[!(enem$Q009 == '' ), ]
# enem <- enem[!(enem$Q010 == '' ), ]
# enem <- enem[!(enem$Q011 == '' ), ]
# enem <- enem[!(enem$Q012 == '' ), ]
# enem <- enem[!(enem$Q013 == '' ), ]
# enem <- enem[!(enem$Q014 == '' ), ]
# enem <- enem[!(enem$Q015 == '' ), ]
# enem <- enem[!(enem$Q016 == '' ), ]
# enem <- enem[!(enem$Q017 == '' ), ]
# enem <- enem[!(enem$Q018 == '' ), ]
# enem <- enem[!(enem$Q019 == '' ), ]
# enem <- enem[!(enem$Q020 == '' ), ]
# enem <- enem[!(enem$Q021 == '' ), ]
# enem <- enem[!(enem$Q022 == '' ), ]
# enem <- enem[!(enem$Q023 == '' ), ]
# enem <- enem[!(enem$Q024 == '' ), ]
# enem <- enem[!(enem$Q025 == '' ), ]
# enem <- enem[!(enem$Q026 == '' ), ]
# enem <- enem[!(is.na(enem$Q034)), ]
# enem <- enem[!(is.na(enem$Q035)), ]
# enem <- enem[!(is.na(enem$Q036)), ]
# enem <- enem[!(is.na(enem$Q037)), ]
# enem <- enem[!(is.na(enem$Q038)), ]
# enem <- enem[!(is.na(enem$Q039)), ]
# enem <- enem[!(is.na(enem$Q040)), ]
# enem <- enem[!(enem$Q042 == '' ), ]
# enem <- enem[!(enem$Q043 == '' ), ]
# enem <- enem[!(enem$Q044 == '' ), ]
# enem <- enem[!(enem$Q045 == '' ), ]
# enem <- enem[!(enem$Q046 == '' ), ]
# enem <- enem[!(enem$Q047 == '' ), ]
# enem <- enem[!(enem$Q048 == '' ), ]
# enem <- enem[!(enem$Q049 == '' ), ]
# enem <- enem[!(enem$Q050 == '' ), ]