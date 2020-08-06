library(dplyr)
library(ggplot2)
source("obtainingdata.R")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicle_source <- SCC$SCC[grep("[Vv]ehicle",SCC$SCC.Level.Two)]
vehicle_source_data <- filter(NEI,SCC %in% vehicle_source,fips %in% c("24510","06037"))
vehicle_source_data_y <- aggregate(Emissions~year+fips,vehicle_source_data,FUN=sum)
vehicle_source_data_y$fips <- factor(vehicle_source_data_y$fips,labels=c("California","Baltimore"))

png("plot6.png")

ggplot(vehicle_source_data_y,aes(factor(year),Emissions)) + geom_col() +
        xlab("Year") + ylab("Emissions") + facet_wrap(~fips)

dev.off()
