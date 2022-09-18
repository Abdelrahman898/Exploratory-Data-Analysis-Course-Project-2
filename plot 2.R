
# Q2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# read our data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset our Baltimore City, Maryland data 
BaltCity <- subset(NEI,fips == "24510")
View(BaltCity)
str(BaltCity)
table(BaltCity$year)

# aggregate emissions in each year so i can easy plot it 
yearly_emmissions <- aggregate(Emissions ~ year,BaltCity,sum)

#create png with specific dimensions
png("plot2.png", width=480, height=480)

# do our plot 
barplot(height = yearly_emmissions$Emissions/10000,names.arg = yearly_emmissions$year,
        col = c("blue","green","red","yellow"),xlab="Year",ylab = "Aggregated Emission for Baltimore City ",
        main = expression('Aggregated PM'[2.5]*' Emmissions by Year for Baltimore City'))

# close the PNG device
dev.off()


