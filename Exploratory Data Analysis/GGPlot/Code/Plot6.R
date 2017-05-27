plot6 <- function(NEI){
  library(ggplot2)
  subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
  aggByYear <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
  aggByYear$fips[aggByYear$fips=="24510"] <- "Baltimore, MD"
  aggByYear$fips[aggByYear$fips=="06037"] <- "Los Angeles, CA"
  g <- ggplot(aggByYear, aes(factor(year), Emissions))
  g <- g + facet_grid(. ~ fips)
  g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM_2.5 Emissions')) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD vs Los Angeles, CA in 1999-2008')
  png("plot6.png", width=640, height=640)
  print(g)
  dev.off()
}