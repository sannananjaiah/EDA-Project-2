## This first line will likely take a few seconds. Be patient!
library(dplyr)
require(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Plot3_data <- filter(NEI, fips== 24510)
Plot3_data$year <- factor(Plot3_data$year, levels= c('1999', '2002', '2005', '2008'))

png(filename = "Plot3.png")
ggplot(data = Plot3_data, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions Sources Baltimore, MD') + geom_jitter(alpha = 0.10)
dev.off()
                          
