source("PlotHelper.R")

plotLineMain <- function(data){
  if(nrow(data) == 0){
    return (0)
  }
  PlotLineGraph(xVar = data$DateTime, yVar = data$Global_active_power, ylabel = "Global Active Power (kilowatts)")
  return(downloadLine())
}

downloadLine <- function() {
  outputFile <- "Plot2.png"
  
  DownloadFile(png, outputFile, 640, 640)
  
  if(file.exists(outputFile)){
    return (1)
  }
  
  return (0)
}