library(dplyr)
library(ggplot2)
source("obtainingdata.R")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_coal <- SCC$SCC[grep("[Cc]oal$",SCC$EI.Sector)]
emissions_coal <- filter(NEI,SCC%in%SCC_coal)
emissions_coal_y <- aggregate(Emissions ~ year,emissions_coal,FUN=sum)

png("plot4.png")

ggplot(emissions_coal_y,aes(factor(year),Emissions/10^3)) + 
        geom_col() + xlab("year") + ylab("Emission (in miles)") +
        ggtitle("Coal Combustion Emissions from 1999 to 2008")


dev.off()