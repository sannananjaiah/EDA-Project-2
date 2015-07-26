## This first line will likely take a few seconds. Be patient!
library(dplyr)
require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

NEI.Onroad.Baltimore <- filter(NEI, fips== '24510', type == 'ON-ROAD')
NEI.Onroad.LA_County <- filter(NEI, fips== '06037', type == 'ON-ROAD')

Plot6_data_BAL <- aggregate(NEI.Onroad.Baltimore[, 'Emissions'], by = list(NEI.Onroad.Baltimore$year), sum)
colnames(Plot6_data_BAL) <- c('year', 'Emissions')

Plot6_data_LAC <- aggregate(NEI.Onroad.LA_County[, 'Emissions'], by = list(NEI.Onroad.LA_County$year), sum)
colnames(Plot6_data_LAC) <- c('year', 'Emissions')

Plot6_data_BAL$County <- paste(rep('BAL', 4))
Plot6_data_LAC$County <- paste(rep('LAC', 4))

Plot6_data <- as.data.frame(rbind(Plot6_data_BAL, Plot6_data_LAC))

png('Plot6.png')
ggplot(data = Plot6_data, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year),stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources\nLA County, CA vs. Baltimore County, MD') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ County) + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
dev.off()