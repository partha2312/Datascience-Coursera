plot5 <- function(NEI){
  library(ggplot2)
  subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
  aggByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
  g <- ggplot(aggByYear, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM_2.5 Emissions')) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, MD from 1999 to 2008')
  png("plot5.png", width=640, height=640)
  print(g)
  dev.off()
}