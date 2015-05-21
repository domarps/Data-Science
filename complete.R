complete <- function(directory, id = 1:332) 
{
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
  
  if(grep("specdata", directory) == 1) 
  {
    directory <- paste(getwd(),"/specdata",sep = "")
  }
  print(directory)
  
  id_len <- length(id)
  completeData <- rep(0,id_len)
  #rep replicates the value,x given number of times : rep(x,times)
  filePaths  <- list.files(
    directory,        #a character vector of full path names; the default corresponds to the working directory, getwd()
    pattern="*.csv",   #Only file names which match the regular expression e.g : *.csv will be returned.
    full.names=TRUE    #If TRUE, the directory path is prepended to the file names to give a relative file path. 
   )
  j <- 1
  for (i in id) 
  {
    currFileData  <- read.csv(filePaths[i], header = TRUE, sep = ",")
    completeData[j]  = sum(complete.cases(currFileData))
    #complete.cases returns a logical vector specifying which cases have missing values
    j <- j + 1
  }
  result <- data.frame(id = id, nobs = completeData)
  #Data Framse is a tightly couple collection
  return(result)
  
  #find all files in the spec data folder
  
  
}