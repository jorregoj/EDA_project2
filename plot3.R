# source("obtainingdata.R")
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
Baltimore_data <- NEI[NEI$fips==24510,]
Baltimore_total <- aggregate(Emissions~year+type,Baltimore_data,FUN=sum)
library(ggplot2)
png("plot3.png")

ggplot(Baltimore_data,aes(year,Emissions)) + geom_col() + facet_wrap(~type)

dev.off()
