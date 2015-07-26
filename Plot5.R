## This first line will likely take a few seconds. Be patient!
library(dplyr)
require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

NEI.Onroad.Baltimore <- filter(NEI, fips== 24510, type == 'ON-ROAD')
Plot5_data <- aggregate(NEI.Onroad.Baltimore[, 'Emissions'], by = list(NEI.Onroad.Baltimore$year), sum)
colnames(Plot5_data) <- c('year', 'Emissions')

png('Plot5.png')
ggplot(data = Plot5_data, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total On-Road Emmisions- Baltimore, MD') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()