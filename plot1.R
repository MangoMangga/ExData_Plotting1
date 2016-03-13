
## Read data from local direcory
hpc <- read.table("household_power_consumption.txt",sep=";",header = T)
hpc <- read.table("household_power_consumption.txt",sep=";",header = T, 
                  na.strings = "?",dec=".", stringsAsFactors = F)
## Filter data start from "1/2/2007" to "2/2/2007"
hpc<- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

## Create Histogram
hist(hpc$Global_active_power, xlab = "Global Active Power(Killowatts)",
     main="Global Active Power", col="red")

## Copy Histogram to png file
dev.copy(png,filename = "plot1.png", width = 480,height = 480)
dev.off()
