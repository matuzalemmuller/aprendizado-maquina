source('tools/load_enem.R')

# Load dataset
enem = load_enem(TRUE, 100000)

# Select random subset
enem_subset = enem[sample(c(1:1000)), ]

# Check random ratio
prop.table(table(enem$NOTA))
prop.table(table(enem_subset$NOTA))

# Creates correlation diagram
library(corrgram)
corrgram(enem_subset)

