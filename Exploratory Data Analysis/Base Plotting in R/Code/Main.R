main <- function(){
  require("sqldf")
  library(sqldf)

  source("PlotHelper.R")
  source("Plot1.R")
  source("Plot2.R")
  source("Plot3.R")
  source("Plot4.R")
  
  dataFileName <- "household_power_consumption.txt"
  requiredDateQuery <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
  plotError <- "Error creating plot"
  
  if(!file.exists(dataFileName)){
    print("Data file missing")
  }

  print("Reading in required data.")
  requiredData <- read.csv.sql(dataFileName, requiredDateQuery, header = TRUE, eol = "\n", sep = ";")
  closeAllConnections()
  paste("Read", nrow(df),"rows",sep = " ")
  print("---------------------------------------------------------------------")

  print("Plotting histogram for Global Active Power vs Frequency")
  foo = plotHistogramMain(requiredData)
  if(foo == 1){
    print("Plot stored as Plot1.png")
  }else{
    print(plotError)
  }
  print("---------------------------------------------------------------------")
  
  dates <- as.vector(requiredData$Date)
  times <- as.vector(requiredData$Time)
  dateTime <- paste(dates, times, sep = " ")
  dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
  
  requiredData$DateTime <- dateTime
  
  print("Plotting Line plot of Global Active Power at each time of day")
  foo = plotLineMain(requiredData)
  if(foo == 1){
    print("Plot stored as Plot2.png")
  }else{
    print(plotError)
  }
  print("---------------------------------------------------------------------")
  
  print("Plotting Line plot of Energy sub metering at each time of day")
  foo = PlotSubMeteringMain(requiredData)
  if(foo == 1){
    print("Plot stored as Plot3.png")
  }else{
    print(plotError)
  }
  print("---------------------------------------------------------------------")
  
  print("Plotting Combined graphs")
  foo = CombinePlotMain(requiredData)
  if(foo == 1){
    print("Plot stored as Plot4.png")
  }else{
    print(plotError)
  }
  print("---------------------------------------------------------------------")
}