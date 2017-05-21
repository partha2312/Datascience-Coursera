source("PlotHelper.R")

CombinePlotMain <- function(data){
  if(nrow(data) == 0){
    return (0)
  }
  par(mfrow=c(2,2))
  PlotLineGraph(xVar = data$DateTime, yVar = data$Global_active_power, ylabel = "Global Active Power (kilowatts)")
  PlotLineGraph(xVar = data$DateTime, yVar = data$Voltage, xlabel = "datetime",  ylabel = "Voltage")
  PlotLineGraph(xVar = data$DateTime, yVar = data$Sub_metering_1, ylabel = "Energy sub metering")
  AddLineToPlot(xVar = data$DateTime, yVar = data$Sub_metering_2, color = legendColors[2])
  AddLineToPlot(xVar = data$DateTime, yVar = data$Sub_metering_3, color = legendColors[3])
  legend(legendPos, legendNames, lty = c(1,1,1), lwd = c(2,2,2), col=legendColors, cex = 0.50, text.font = 10)
  PlotLineGraph(xVar = data$DateTime, yVar = data$Global_reactive_power,xlabel = "datetime", ylabel = "Global_reactive_power")
  return(DownloadCombined())
}

DownloadCombined <- function(){
  outputFile <- "Plot4.png"
  
  DownloadFile(png, outputFile, 640, 640)
  
  if(file.exists(outputFile)){
    return (1)
  }
  
  return (0)
}