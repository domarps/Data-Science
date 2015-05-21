######################################################################################

##Command : pollutantmean("specdata",sulphate,1:22)######

#######################################################################################



setwd("/home/pramod/R Programming/")
pollutantmean <- function(directory, pollutant, id) 
{
  
  #########################Problem Statement############################################################
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating the name of the
  #  pollutant for which we will calculate the mean; either 'sulfate' or 'nitrate'.
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  ## pollutantmean(directory = "C:/Users/pramodsr/Documents/R Programming/specdata", pollutant = sulphate, id = 1:332)
  #########################Problem Statement############################################################
  
  
  if(grep("specdata", directory) == 1) 
  {
    directory <- paste(getwd(),"/specdata",sep = "")
  }
  #print(directory)
  filePaths  <- list.files( directory,        #a character vector of full path names; the default corresponds to the working directory, getwd()
                           pattern="*.csv",   #Only file names which match the regular expression e.g : *.csv will be returned.
                           full.names=TRUE    #If TRUE, the directory path is prepended to the file names to give a relative file path. 
  )
  ####   list.files <----------->  http://stat.ethz.ch/R-manual/R-devel/library/base/html/list.files.html #### 
  
  #print(filePaths)
  
  meanVector <- c()
  for (i in id) 
  {
        currFileData  <- read.csv(filePaths[i], header = TRUE, sep = ",")
        head(currFileData)
        cleanedData   <- currFileData[!is.na(currFileData[,pollutant]),pollutant]
        meanVector    <- c(meanVector,cleanedData)
        #Calculating the meanVector after removing the NA or Bogus data from the currFileData
  } 
  result <- mean(meanVector)
  return(round(result,3))
  print(result)
  #return(mean(data, na.rm = TRUE))
}