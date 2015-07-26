## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Plot1_data <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Plot1_data$PM <- round(Plot1_data[, 2] / 6497651, 2)

png(filename = "Plot1.png")
barplot(Plot1_data$PM, names.arg = Plot1_data$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()