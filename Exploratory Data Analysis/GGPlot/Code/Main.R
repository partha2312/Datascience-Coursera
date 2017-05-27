source('Plot1.R')
source('Plot2.R')
source('Plot3.R')
source('Plot4.R')
source('Plot5.R')
source('Plot6.R')
main <- function(){
  if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
  }
  plot1(NEI)
  plot2(NEI)
  plot3(NEI)
  plot4(NEI, SCC)
  plot5(NEI)
  plot6(NEI)
}