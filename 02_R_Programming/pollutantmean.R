pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  
  filenames <- sprintf("%03d.csv", id) ## id change from "1" to "001" etc
  filenames_full <- paste(directory, filenames, sep="/") ## prepend the directory path
  
  data_full <- NULL ## initialize data frame
  
  for(i in 1:length(id)){ ## loop over all files and create a single data frame with all relevant observations
    
    data_intermediate <-read.csv(filenames_full[i])
    
    data_full <- rbind(data_full,data_intermediate)
    
  }
  
  mean_pollutant <- mean(data_full[[pollutant]],na.rm=TRUE) ## calculate the mean of the pollutant chosen
  
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
}