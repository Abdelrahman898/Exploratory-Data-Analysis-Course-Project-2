
# Q1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# read our data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate emissions in each year so i can easy plot it 
yearly_emmissions <- aggregate(Emissions ~ year,NEI,sum)

#create png with specific dimensions
png("plot1.png", width=480, height=480)

# do our plot 
barplot(height = yearly_emmissions$Emissions/10000,names.arg = yearly_emmissions$year,
        col = c("blue","green","red","yellow"),xlab="Year",ylab = "Aggregated Emission",
        main = expression('Aggregated PM'[2.5]*' Emmissions by Year'))
# as we see 2008 have lowest emissions so emissions is reduced with time

# close the PNG device
dev.off()

