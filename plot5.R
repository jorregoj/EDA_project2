# library(dplyr)
# library(ggplot2)
# source("obtainingdata.R")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
vehicle_source <- SCC$SCC[grep("[Vv]ehicle",SCC$SCC.Level.Two)]
vehicle_source_data <- filter(NEI,SCC %in% vehicle_source,fips==24510)
vehicle_source_data_y <- aggregate(Emissions~year,vehicle_source_data,FUN=sum)

png("plot5.png")

ggplot(vehicle_source_data_y,aes(factor(year),Emissions)) + geom_col() +
        xlab("Year") + ylab("Emissions") 

dev.off()
