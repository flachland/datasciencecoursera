corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  corr_vector = numeric()
  
  id <- length(list.files(directory))
  
  for(i in 1:id){
    
    filename <- sprintf("%03d.csv", i) ## id change from "1" to "001" etc
    filename <- paste(directory, filename, sep="/") ## prepend the directory path
    
    data <-read.csv(filename)
    
    num_obs <- nrow(na.omit(data))
    
    if(num_obs > threshold){
      
      data_clean <- data[complete.cases(data),]
      
      corr_current <- cor(data_clean[["nitrate"]],data_clean[["sulfate"]])  
      
      corr_vector <- append(corr_vector,corr_current)
      
    }

        
  }

  corr_vector
     
}