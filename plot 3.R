

# Q2:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# read our data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset our Baltimore City, Maryland data 
BaltCity <- subset(NEI,fips == "24510")
View(BaltCity)
str(BaltCity)
summary(BaltCity)
table(BaltCity$year)
table(BaltCity$type)

# plot our data
library(ggplot2)

#create png with specific dimensions
png("plot3.png", width=480, height=480)

# use ggplot with geom_col which heights of the bars to represent values in the data
g <- ggplot(BaltCity,aes(x=factor(year),y=Emissions,fill=type))+
      geom_col()+
      facet_grid(. ~ type)+
      xlab("Year")+
      ylab("Baltimore Emissions")+
      ggtitle("Baltimore Emissions by type")

print(g)

# close the PNG device
dev.off()







