corr <- function(directory, threshold = 0) 
{
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  if(grep("specdata",directory) == 1)
  {
    directory <- ("./specdata")
  }
  completeTable <- complete("specdata",1:332)
  nobs          <- completeTable$nobs
  ids           <- completeTable$ids[nobs > threshold]
  id_len        <- length(ids)
  corr_vector   <- rep(0,id_len)
  filePaths  <- list.files(
    directory,        #a character vector of full path names; the default corresponds to the working directory, getwd()
    pattern="*.csv",   #Only file names which match the regular expression e.g : *.csv will be returned.
    full.names=TRUE    #If TRUE, the directory path is prepended to the file names to give a relative file path. 
  )
  j <- 1
  for (i in ids) 
  {
    currFileData    <- read.csv(filePaths[i], header = TRUE, sep = ",")
    completeData[j] =  cor(currFileData$sulfate,currFileData$nitrate,use = "complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)
}