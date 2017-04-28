best <- function(state, outcome){
  idx = 0
  outcomeErr = FALSE
  if(outcome == "heart attack"){
    idx = 11
  }else if(outcome == "heart failure"){
    idx = 17
  }else if(outcome == "pneumonia"){
    idx=23
  }else{
    outcomeErr = TRUE
  }
  if(outcomeErr){
    cat('Error in best("', state,'","', outcome ,'"): invalid outcome', sep="")
  }else{
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    stateHospitals <- subset(data, State==state, select = c(2,idx))
    
    if(nrow(stateHospitals) == 0){
      cat('Error in best("', state,'","', outcome ,'"): invalid state', sep="")
    }else{
      stateHospitals <- subset(stateHospitals, stateHospitals[,2] != 'Not Available')
      stateHospitals[,2] <- as.numeric(as.character(stateHospitals[,2]))
      
      sortedData <- stateHospitals[order(stateHospitals[,2], stateHospitals[,1]),]
      sortedData[1,1] 
    }
    
  }
}

rankhospital <- function(state, outcome, num = "best"){
  idx = 0
  outcomeErr = FALSE
  if(outcome == "heart attack"){
    idx = 11
  }else if(outcome == "heart failure"){
    idx = 17
  }else if(outcome == "pneumonia"){
    idx=23
  }else{
    outcomeErr = TRUE
  }
  if(outcomeErr){
    cat('Error in best("', state,'","', outcome ,'"): invalid outcome', sep="")
  }else{
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    stateHospitals <- subset(data, State==state, select = c(2,idx))
    if(nrow(stateHospitals) == 0){
      cat('Error in best("', state,'","', outcome ,'"): invalid state', sep="")
    }else{
      stateHospitals <- subset(stateHospitals, stateHospitals[,2] != 'Not Available')
      stateHospitals[,2] <- as.numeric(as.character(stateHospitals[,2]))
      sortedData <- stateHospitals[order(stateHospitals[,2], stateHospitals[,1]),]
      rank <- 0
      if(!is.numeric(num)){
        if(num == "best"){
          rank = 1
        }else if(num == "worst"){
          rank = nrow(sortedData)
        }
      }else{
        rank = num
      }
      if(rank > nrow(sortedData)){
        return(NA)
      }else{
        sortedData[rank,1]
      }
    }
  }
}

rankall <- function(outcome, num = "best"){
  idx = 0
  outcomeErr = FALSE
  if(outcome == "heart attack"){
    idx = 11
  }else if(outcome == "heart failure"){
    idx = 17
  }else if(outcome == "pneumonia"){
    idx=23
  }else{
    outcomeErr = TRUE
  }
  if(outcomeErr){
    cat('Error in best("', state,'","', outcome ,'"): invalid outcome', sep="")
  }else{
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    hospitals <- subset(data, select = c(7,2,idx))
    hospitals <- subset(hospitals, hospitals[,3] != 'Not Available')
    hospitals[,3] <- as.numeric(as.character(hospitals[,3]))
    sortedData <- hospitals[order(hospitals[,1], hospitals[,3], hospitals[,2]),]
    rank <- 0
    if(!is.numeric(num)){
      if(num == "best"){
        rank = 1
      }else if(num == "worst"){
        rank = -1
      }
    }else{
      rank = num
    }
    print(rank)
    statelist <- unique(sortedData[,1])
    result <- data.frame("hospital"=character(0), "state"=character(0), stringsAsFactors=FALSE)
    for (state in statelist){
      df <- subset(sortedData, State == state)
      len = nrow(df)
      if(rank == -1){
        h = df[len,2]
      }else{
        if(len < rank){
          h = "NA"
        }else{
          h = df[rank,2]
        }
      }
      result[nrow(result)+1, ] <- c(h, state)
    }
    result
  }
}