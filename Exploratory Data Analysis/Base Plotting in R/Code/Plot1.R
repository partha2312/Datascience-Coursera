source("PlotHelper.R")

plotHistogramMain <- function(data){
  if(nrow(data) == 0){
    return (0)
  }
  
  PlotHistogram(xVar = data$Global_active_power, color = "red", title = "Global Active Power", 
                xlabel = "Global Active Power (kilowatts)", ylabel = "Frequency")
  
  return (downloadHistogram())
}

downloadHistogram <- function(){
  outputFile <- "Plot1.png"
  
  DownloadFile(png, outputFile, 640, 640)
  
  if(file.exists(outputFile)){
    return (1)
  }
  
  return (0)
}