load_dataset = function(file, nrows = Inf) 
{
    # Load
    library(data.table)
    data <- fread(file, nrows = nrows)

    source('prepare_dataset.R', local = TRUE)
    data = prepare_dataset(data)

    return(data)
}