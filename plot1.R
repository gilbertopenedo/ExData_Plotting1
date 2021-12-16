#Setting working directory
setwd("D:\\Coursera\\Exploratory data analysis")

#Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="exdata_data_household_power_consumption.zip", method="curl")
unzip("exdata_data_household_power_consumption.zip")

#Reading data and filtering data
tab <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
tab <- subset(tab, Date %in% c("1/2/2007","2/2/2007"))

#Convert column classes 
tab$Date <- as.Date(tab$Date,"%d/%m/%y")
tab$Global_active_power <- as.numeric(tab$Global_active_power)

#Plot 1 (Histogram of Global Active Power)
hist(tab$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#Save Plot 1 to a png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
