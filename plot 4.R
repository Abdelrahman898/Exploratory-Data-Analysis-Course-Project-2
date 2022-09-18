
# Q4:
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# read our data
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
View(SCCdata)
head(SCCdata[,1:3])
str(SCCdata)

# get coal data from SCC
coal_SCC<- SCCdata[grep('[Cc][Oo][Aa][Ll]',SCCdata$EI.Sector),]
class(coal_SCC)
str(coal_SCC)
View(coal_SCC)
View(NEIdata)

# get SCC in NEI that match coal_SCC
library(dplyr)
coal_NEI<-NEIdata[NEIdata[,2] %in% coal_SCC[,1],]
View(coal_NEI)


#create png with specific dimensions
png("plot4.png", width=480, height=480)

# use ggplot with geom_col which heights of the bars represent values in the data
library(ggplot2)
g <- ggplot(coal_NEI,aes(x=factor(year),y=round(Emissions/1000),fill=year))+
      geom_col()+
      ylab(expression('PM'[2.5]*' Emissions'))+
      xlab("Year")+
      ggtitle("Coal Combustion Emissions from 1999 to 2008")
                 

print(g)      


# close the PNG device
dev.off()      
      


