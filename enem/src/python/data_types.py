# ignore: attribute is irrelevant for ML model
# NA: attribute contains too many empty values

data_useful = [
    # 'NU_INSCRICAO',               ignore
    # 'NU_ANO',                     ignore
    # 'CO_MUNICIPIO_RESIDENCIA',    ignore
    # 'NO_MUNICIPIO_RESIDENCIA',    ignore
    # 'CO_UF_RESIDENCIA',           ignore
    'SG_UF_RESIDENCIA',
    'NU_IDADE',
    'TP_SEXO',
    'TP_ESTADO_CIVIL',
    'TP_COR_RACA',
    'TP_NACIONALIDADE',
    # 'CO_MUNICIPIO_NASCIMENTO',    ignore
    # 'NO_MUNICIPIO_NASCIMENTO',    ignore
    # 'CO_UF_NASCIMENTO',           ignore
    # 'SG_UF_NASCIMENTO',           ignore
    'TP_ST_CONCLUSAO',
    'TP_ANO_CONCLUIU',
    'TP_ESCOLA',
    # 'TP_ENSINO',                  6740902 NA
    'IN_TREINEIRO',
    # 'CO_ESCOLA',                  ignore
    # 'CO_MUNICIPIO_ESC',           ignore
    # 'NO_MUNICIPIO_ESC',           ignore
    # 'CO_UF_ESC',                  ignore
    # 'SG_UF_ESC',                  ignore
    # 'TP_DEPENDENCIA_ADM_ESC',     ignore
    # 'TP_LOCALIZACAO_ESC',         ignore
    # 'TP_SIT_FUNC_ESC',            ignore
    'IN_BAIXA_VISAO',
    # 'IN_CEGUEIRA',                1156    NA
    # 'IN_SURDEZ',                  2287    NA
    # 'IN_DEFICIENCIA_AUDITIVA',    7130    NA
    # 'IN_SURDO_CEGUEIRA',          23      NA
    'IN_DEFICIENCIA_FISICA',
    # 'IN_DEFICIENCIA_MENTAL',      1107    NA
    # 'IN_DEFICIT_ATENCAO',         5299    NA
    # 'IN_DISLEXIA',                1438    NA
    # 'IN_DISCALCULIA',             342     NA
    # 'IN_AUTISMO',                 372     NA
    # 'IN_VISAO_MONOCULAR',         3743    NA
    # 'IN_OUTRA_DEF',               3530    NA
    'IN_SABATISTA',
    # 'IN_GESTANTE',                7578    NA
    'IN_LACTANTE',
    # 'IN_IDOSO',                   1454    NA
    # 'IN_ESTUDA_CLASSE_HOSPITALAR',38      NA
    'IN_SEM_RECURSO',
    # 'IN_BRAILLE',                 560     NA
    # 'IN_AMPLIADA_24',             2121    NA
    # 'IN_AMPLIADA_18',             7301
    # 'IN_LEDOR',                   7092
    'IN_ACESSO',
    # 'IN_TRANSCRICAO',             7051        NA
    # 'IN_LIBRAS',                  3557        NA
    # 'IN_LEITURA_LABIAL',          1624        NA
    # 'IN_MESA_CADEIRA_RODAS',      2963        NA
    # 'IN_MESA_CADEIRA_SEPARADA',   5903        NA
    # 'IN_APOIO_PERNA',             3841        NA
    # 'IN_GUIA_INTERPRETE',         15      NA
    # 'IN_MACA',                    7       NA
    # 'IN_COMPUTADOR',              9       NA
    # 'IN_CADEIRA_ESPECIAL',        38      NA
    # 'IN_CADEIRA_CANHOTO',         31      NA
    # 'IN_CADEIRA_ACOLCHOADA',      282     NA
    # 'IN_PROVA_DEITADO',           3       NA
    # 'IN_MOBILIARIO_OBESO',        55      NA
    # 'IN_LAMINA_OVERLAY',          20      NA
    # 'IN_PROTETOR_AURICULAR',      4       NA
    # 'IN_MEDIDOR_GLICOSE',         346     NA
    # 'IN_MAQUINA_BRAILE',          92      NA
    # 'IN_SOROBAN',                 28      NA
    # 'IN_MARCA_PASSO',             13      NA
    # 'IN_SONDA',                   16      NA
    # 'IN_MEDICAMENTOS',            334     NA
    # 'IN_SALA_INDIVIDUAL',         366     NA
    # 'IN_SALA_ESPECIAL',           283     NA
    # 'IN_SALA_ACOMPANHANTE',       102     NA
    # 'IN_MOBILIARIO_ESPECIFICO',   30      NA
    # 'IN_MATERIAL_ESPECIFICO',     134     NA
    # 'IN_NOME_SOCIAL',             431     NA
    'TP_PRESENCA_CN',
    'TP_PRESENCA_CH',
    'TP_PRESENCA_LC',
    'TP_PRESENCA_MT',
    'NU_NOTA_CN',
    'NU_NOTA_CH',
    'NU_NOTA_LC',
    'NU_NOTA_MT',
    'TP_STATUS_REDACAO',
    'NU_NOTA_COMP1',
    'NU_NOTA_COMP2',
    'NU_NOTA_COMP3',
    'NU_NOTA_COMP4',
    'NU_NOTA_COMP5',
    'NU_NOTA_REDACAO',
    'Q001',
    'Q002',
    'Q003',
    'Q004',
    'Q005',
    'Q006',
    'Q007',
    'Q008',
    'Q009',
    'Q010',
    'Q011',
    'Q012',
    'Q013',
    'Q014',
    'Q015',
    'Q016',
    'Q017',
    'Q018',
    'Q019',
    'Q020',
    'Q021',
    'Q022',
    'Q023',
    'Q024',
    'Q025',
    'Q026',
    # 'Q027',                       3836300 NA
    # 'Q028',                       3836633 NA
    # 'Q029',                       3836932 NA
    # 'Q030',                       3837101 NA
    # 'Q031',                       3837151 NA
    # 'Q032',                       3837200 NA
    # 'Q033',                       3837241 NA
    'Q034',
    'Q035',
    'Q036',
    'Q037',
    'Q038',
    'Q039',
    'Q040',
    # 'Q041',                       6137533 NA
    'Q042',
    'Q043',
    'Q044',
    'Q045',
    'Q046',
    'Q047',
    'Q048',
    'Q049',
    'Q050'
    ]