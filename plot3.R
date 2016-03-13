## Read data from local direcory
hpc <- read.table("household_power_consumption.txt",sep=";",header = T)
hpc <- read.table("household_power_consumption.txt",sep=";",header = T, 
                  na.strings = "?",dec=".", stringsAsFactors = F)

## Filter data start from "1/2/2007" to "2/2/2007"
hpc<- subset(hpc,hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

## Convert data Date & Time
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time),"%e/%m/%Y %H:%M:%S")


## Create plot
plot(hpc$DateTime,hpc$Sub_metering_1 ,type="n",xlab="",ylab = "Enegy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_1)
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"))

## Copy file to png
dev.copy(png,filename = "plot3.png", width = 480,height = 480)
dev.off()
