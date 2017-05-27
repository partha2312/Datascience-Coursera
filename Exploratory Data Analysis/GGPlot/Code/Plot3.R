plot3 <- function(NEI){
  library(ggplot2)
  subsetNEI  <- NEI[NEI$fips=="24510", ]
  aggByYear <- aggregate(Emissions ~ year + type, subsetNEI, sum)
  g <- ggplot(aggByYear, aes(year, Emissions, color = type))
  g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM_2.5 Emissions')) +
  ggtitle('Total Emissions in Baltimore City, MD from 1999 to 2008')
  png("plot3.png", width=640, height=640)
  print(g)
  dev.off()
}