url_file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if(!file.exists("DataPM25.zip")){
        download.file(url_file,"./DataPM25.zip")
}

if(!file.exists("summarySCC_PM25.rds")&
   !file.exists("Source_Classification_Code.rds")){
        unzip("./DataPM25.zip")  
}

