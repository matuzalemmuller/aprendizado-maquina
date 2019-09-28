# Load
enem <- read.csv('../../data/enem_data_converted.csv', stringsAsFactors = FALSE)
enem[enem==""] = NA

# remove NA NU_IDADE - 
# enem[is.na(enem$NU_IDADE)] <- NULL
enem <- enem[!(is.na(enem$TP_SEXO)), ]

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

enem$Q001[is.na(enem$Q001)] = 'H'                               # 'nao sei'
enem$Q002[is.na(enem$Q002)] = 'H'                               # 'nao sei'
enem$Q003[is.na(enem$Q003)] = 'F'                               # 'nao sei'
enem$Q004[is.na(enem$Q004)] = 'F'                               # 'nao sei'
enem$Q005[is.na(enem$Q005)] = 0                                 # undefined (new category)
enem$Q006[is.na(enem$Q006)] = 'Z'                               # undefined (new category)
enem$Q007[is.na(enem$Q007)] = 'Z'                               # undefined (new category)
enem$Q008[is.na(enem$Q008)] = 'Z'                               # undefined (new category)
enem$Q009[is.na(enem$Q009)] = 'Z'                               # undefined (new category)
enem$Q010[is.na(enem$Q010)] = 'Z'                               # undefined (new category)
enem$Q011[is.na(enem$Q011)] = 'Z'                               # undefined (new category)
enem$Q012[is.na(enem$Q012)] = 'Z'                               # undefined (new category)
enem$Q013[is.na(enem$Q013)] = 'Z'                               # undefined (new category)
enem$Q014[is.na(enem$Q014)] = 'Z'                               # undefined (new category)
enem$Q015[is.na(enem$Q015)] = 'Z'                               # undefined (new category)
enem$Q016[is.na(enem$Q016)] = 'Z'                               # undefined (new category)
enem$Q017[is.na(enem$Q017)] = 'Z'                               # undefined (new category)
enem$Q018[is.na(enem$Q018)] = 'Z'                               # undefined (new category)
enem$Q019[is.na(enem$Q019)] = 'Z'                               # undefined (new category)
enem$Q020[is.na(enem$Q020)] = 'Z'                               # undefined (new category)
enem$Q021[is.na(enem$Q021)] = 'Z'                               # undefined (new category)
enem$Q022[is.na(enem$Q022)] = 'Z'                               # undefined (new category)
enem$Q023[is.na(enem$Q023)] = 'Z'                               # undefined (new category)
enem$Q024[is.na(enem$Q024)] = 'Z'                               # undefined (new category)
enem$Q025[is.na(enem$Q025)] = 'Z'                               # undefined (new category)
enem$Q026[is.na(enem$Q026)] = 'Z'                               # undefined (new category)
enem$Q034[is.na(enem$Q034)] = 9                                 # undefined (new category)
enem$Q035[is.na(enem$Q035)] = 9                                 # undefined (new category)
enem$Q036[is.na(enem$Q036)] = 9                                 # undefined (new category)
enem$Q037[is.na(enem$Q037)] = 9                                 # undefined (new category)
enem$Q038[is.na(enem$Q038)] = 9                                 # undefined (new category)
enem$Q039[is.na(enem$Q039)] = 9                                 # undefined (new category)
enem$Q040[is.na(enem$Q040)] = 9                                 # undefined (new category)
enem$Q042[is.na(enem$Q042)] = 'Z'                               # undefined (new category)
enem$Q043[is.na(enem$Q043)] = 'Z'                               # undefined (new category)
enem$Q044[is.na(enem$Q044)] = 'Z'                               # undefined (new category)
enem$Q045[is.na(enem$Q045)] = 'Z'                               # undefined (new category)
enem$Q046[is.na(enem$Q046)] = 'Z'                               # undefined (new category)
enem$Q047[is.na(enem$Q047)] = 'Z'                               # undefined (new category)
enem$Q048[is.na(enem$Q048)] = 'Z'                               # undefined (new category)
enem$Q049[is.na(enem$Q049)] = 'Z'                               # undefined (new category)
enem$Q050[is.na(enem$Q050)] = 'Z'                               # undefined (new category)