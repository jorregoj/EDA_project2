# source(obtainingdata)
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

Baltimore_data <- NEI[NEI$fips==24510,]
total_emissions_Baltimore <- aggregate(Emissions~year,NEI,FUN=sum)

png("plot2.png")

barplot(main="Total emissions in Baltimore",total_emissions_Baltimore$Emissions/10^6,
        names.arg = total_emissions_Baltimore$year,
        xlab="Emissions (in millions)",ylab="year")

dev.off()
