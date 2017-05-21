source("PlotHelper.R")

PlotSubMeteringMain <- function(data){
  if(nrow(data) == 0){
    return (0)
  }
  PlotSubMetering(data)
  return(downloadSubMetering())
}

PlotSubMetering <- function(data) {
  legendPos <- "topright"
  legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legendColors <- c("Black", "Red", "Blue")
  
  PlotLineGraph(xVar = data$DateTime, yVar = data$Sub_metering_1, ylabel = "Energy sub metering")
  AddLineToPlot(xVar = data$DateTime, yVar = data$Sub_metering_2, color = legendColors[2])
  AddLineToPlot(xVar = data$DateTime, yVar = data$Sub_metering_3, color = legendColors[3])
  
  legend(legendPos, legendNames, lty = c(1,1,1), lwd = c(2,2,2), col=legendColors, cex = 0.50, text.font = 10)
}

downloadSubMetering <- function() {
  outputFile <- "Plot3.png"
  
  DownloadFile(png, outputFile, 640, 640)
  
  if(file.exists(outputFile)){
    return (1)
  }
  
  return (0)
}