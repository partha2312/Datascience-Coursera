plot4 <- function(NEI, SCC){
  library(ggplot2)
  mrg <- merge(NEI, SCC, by="SCC")
  coal  <- grepl("coal", mrg$Short.Name, ignore.case=TRUE)
  subsetNEISCC <- mrg[coal, ]
  aggByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)
  g <- ggplot(aggByYear, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM_2.5 Emissions')) +
  ggtitle('Total Emissions by coal from 1999 to 2008')
  png("plot4.png", width=640, height=640)
  print(g)
  dev.off()
}