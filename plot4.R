#Setting working directory
setwd("D:\\Coursera\\Exploratory data analysis")

#Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata_data_household_power_consumption.zip", method="curl")
unzip("exdata_data_household_power_consumption.zip")

#Reading data and filtering data
tab <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
tab <- subset(tab, Date %in% c("1/2/2007","2/2/2007"))

#Convert column classes and create column with date and time
tab$Date <- as.Date(tab$Date,"%d/%m/%Y")
tab$DateTime <- as.POSIXct(paste(tab$Date,tab$Time))
tab[,3:9] = apply(tab[,3:9], 2, function(x) as.numeric(as.character(x)));
Sys.setlocale(category = "LC_TIME", locale = "English")

#Plot 4 (Global Active Power and Energy sub metering by weekday)
## Global parameters
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
##  Graph1
plot(tab$Global_active_power~tab$DateTime, type="l", 
     ylab="Global Active Power", xlab="",cex=0.7)
##  Graph2
plot(tab$Voltage~tab$DateTime, type="l",  ylab="Voltage", xlab="", cex=0.7)
##  Graph3
plot(tab$Sub_metering_1~tab$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines(tab$Sub_metering_2~tab$DateTime, col='Red')
lines(tab$Sub_metering_3~tab$DateTime, col='Blue')
legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2,bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, y.intersp=0.5)
##  Graph4
plot(tab$Global_reactive_power~tab$DateTime, type="l", 
     ylab="Global Reactive Power", xlab="", cex=0.7)
#Save Plot 4 to a png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()