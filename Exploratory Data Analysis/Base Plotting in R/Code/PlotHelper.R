PlotLineGraph <- function(xVar, yVar, xlabel = "", ylabel = "", color = "black") {
  plot(xVar, yVar, type = "l", ylab = ylabel , xlab = xlabel, col = color)
}

PlotHistogram <- function(xVar, color = "black", title = "", xlabel = "", ylabel = ""){
  hist(xVar, col = color, main = title, xlab = xlabel, ylab = ylabel)
}

AddLineToPlot <- function(xVar, yVar, color = "black"){
  lines(xVar, yVar, type="l", col = color)
}

DownloadFile <- function(type, outputFile, filewidth, fileheight) {
  
  if(file.exists(outputFile)){
    file.remove(outputFile)
  }
  
  dev.print(type, outputFile, width=filewidth, height=fileheight)
  dev.off()
}