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
tab$Global_active_power <- as.numeric(tab$Global_active_power)
tab$DateTime <- as.POSIXct(paste(tab$Date,tab$Time))
Sys.setlocale(category = "LC_TIME", locale = "English")

#Plot 2 (Histogram of Global Active Power by weekday)
plot(tab$Global_active_power~tab$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
