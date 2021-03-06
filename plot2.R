## Read data from local direcory
hpc <- read.table("household_power_consumption.txt",sep=";",header = T)
hpc <- read.table("household_power_consumption.txt",sep=";",header = T, 
                  na.strings = "?",dec=".", stringsAsFactors = F)

## Filter data start from "1/2/2007" to "2/2/2007"
hpc<- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

## Convert data Date & Time
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time),"%e/%m/%Y %H:%M:%S")

## Create Plot 
plot(hpc$DateTime,hpc$Global_active_power, type="l",xlab ="",
     ylab = "Globl Active Power (killowatts)")

## Copy plot to png file
dev.copy(png,filename = "plot2.png", width = 480,height = 480)
dev.off()
