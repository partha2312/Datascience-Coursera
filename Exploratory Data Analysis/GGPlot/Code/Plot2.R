plot2 <- function(NEI){
  subsetNEI  <- NEI[NEI$fips=="24510", ]
  aggByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
  barplot(height=aggByYear$Emissions, names.arg=aggByYear$year, xlab="years", ylab=expression('total PM_2.5 emission'),main=expression('Total PM_2.5 in the Baltimore City, MD emissions at different years'))
  dev.print(png, "Plot.png", width=640, height=640)
  dev.off()
}