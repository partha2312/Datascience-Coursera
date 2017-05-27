plot1 <- function(NEI){
  aggByYear <- aggregate(Emissions ~ year, NEI, sum)
  barplot(height=aggByYear$Emissions, names.arg=aggByYear$year, xlab="years", 
          ylab=expression('total PM_2.5 emission'),main=expression('Total PM_2.5 emissions at different years'))
  dev.print(png, "Plot1.png", width=640, height=640)
  dev.off()
}