complete <- function(directory, id = 1:332) {
  
  filenames <- sprintf("%03d.csv", id) ## id change from "1" to "001" etc
  filenames_full <- paste(directory, filenames, sep="/") ## prepend the directory path
  
  obs_frame <- data.frame(id = id, nobs= NA)

  for(i in 1:length(id)){
    
    data_intermediate <-read.csv(filenames_full[i])
    
    data_intermediate_complete <- na.omit(data_intermediate)
    
    ##ok <- complete.cases(data_intermediate)
    ##sum(ok)
    
    obs_frame[i,2] <- nrow(data_intermediate_complete)
      
  }
  
obs_frame  
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}