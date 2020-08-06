source("obtainingdata.R")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total_emissions <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png",width=480,height=480)

barplot(total_emissions$Emissions/10^5,names.arg=total_emissions$year,
        xlab="year",ylab="Emissions (in millions)")

dev.off()
