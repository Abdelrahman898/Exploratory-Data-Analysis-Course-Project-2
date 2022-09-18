
# Q5:
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# read our data
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
View(SCCdata)

# get motor vehicle data from SCC
mv_SCC<- SCCdata[grep('[Vv]ehicle',SCCdata$EI.Sector),]
View(mv_SCC)
table(mv_SCC$Data.Category)

# subset our Baltimore City, Maryland data 
BaltCity <- subset(NEIdata,fips == "24510")
View(BaltCity)


# get SCC in BaltCity that match mv_SCC
library(dplyr)
mv_baltcity<-BaltCity[BaltCity[,2] %in% mv_SCC[,1],]
View(mv_baltcity)
table(mv_baltcity$type)


#create png with specific dimensions
png("plot5.png", width=480, height=480)


# use ggplot with geom_col which heights of the bars represent values in the data
library(ggplot2)
g <- ggplot(mv_baltcity,aes(x=factor(year),y=Emissions,fill=year))+
      geom_col()+
      ylab(expression('PM'[2.5]*' Emissions'))+
      xlab("Year")+
      ggtitle("motor vehicle Emissions from 1999 to 2008")


print(g)      


# close the PNG device
dev.off() 


