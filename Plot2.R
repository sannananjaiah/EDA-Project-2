## This first line will likely take a few seconds. Be patient!
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Plot2_data <- filter(NEI, fips== 24510)

png(filename = "Plot2.png")
barplot(tapply(X = Plot2_data$Emissions, INDEX = Plot2_data$year, FUN = sum), main = 'Emissions in Baltimore', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()