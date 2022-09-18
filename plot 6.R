
# Q6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

# read our data
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
View(SCCdata)

# get motor vehicle data from SCC
mv_SCC<- SCCdata[grep('[Vv]ehicle',SCCdata$EI.Sector),]
View(mv_SCC)
table(mv_SCC$Data.Category)
table(mv_SCC$SCC.Level.One)

# subset our Baltimore City, Maryland data 
BaltCity <- subset(NEIdata,fips == "24510")
View(BaltCity)
table(BaltCity$fips)

# subset our Los Angeles City, California data 
loscity <- subset(NEIdata,fips == "06037")
View(loscity)
table(loscity$fips)

# get SCC in BaltCity that match mv_SCC
library(dplyr)
mv_baltcity<-BaltCity[BaltCity[,2] %in% mv_SCC[,1],]
View(mv_baltcity)
table(mv_baltcity$type)
table(mv_baltcity$year)

# get SCC in loscity that match mv_SCC
mv_loscity <- loscity[loscity[,2] %in% mv_SCC[,1],]
View(mv_loscity)
table(mv_loscity$type)
table(mv_loscity$year)

# add new variable to our data  
mv_baltcity$county <- "Baltimore City, MD"
mv_loscity$county <- "Los Angeles City, CA"

# make them in one table
vehicle_emissions <- rbind(mv_baltcity, mv_loscity)
View(vehicle_emissions)
table(vehicle_emissions$type)
table(vehicle_emissions$county)
table(vehicle_emissions$year)

#create png with specific dimensions
png("plot6.png", width=480, height=480)

# use ggplot with geom_col which heights of the bars to represent values in the data
g <- ggplot(vehicle_emissions,aes(x=factor(year),y=Emissions,fill=county))+
      geom_col()+
      facet_grid(.~county)+
      ylab(expression('Total PM'[2.5]*' Emissions'))+
      xlab("Year")+
      ggtitle("Baltimore & LA motor vehicle Emissions from 1999 to 2008")

print(g)

# close the PNG device
dev.off() 

