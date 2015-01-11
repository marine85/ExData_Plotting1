setwd("~/Dropbox/Annie's Documents/Classes/coursera/Exporatory_Data_Analysis/Data")
data = read.table("household_power_consumption.txt", sep = ";", 
                  header= TRUE)
# Make new column with date as date class instead of factor.
data$Date.date = as.Date(data$Date, format = "%d/%m/%Y")
# subset data for 2 dates of interest (Feb 1 & 2, 2007)
data.Feb = subset(data, Date.date == as.Date("2007-02-01") | Date.date == as.Date("2007-02-02"))
# Change class of global active power to numeric
data.Feb$Global_active_power = as.character(data.Feb$Global_active_power)
data.Feb$Global_active_power = as.numeric(data.Feb$Global_active_power)
# Change class of voltage to numeric
data.Feb$Voltage = as.character(data.Feb$Voltage)
data.Feb$Voltage = as.numeric(data.Feb$Voltage)
# Change class of sub_metering columns to numeric
data.Feb$Sub_metering_1 = as.character(data.Feb$Sub_metering_1)
data.Feb$Sub_metering_1 = as.numeric(data.Feb$Sub_metering_1)
#
data.Feb$Sub_metering_2 = as.character(data.Feb$Sub_metering_2)
data.Feb$Sub_metering_2 = as.numeric(data.Feb$Sub_metering_2)
#
data.Feb$Sub_metering_3 = as.character(data.Feb$Sub_metering_3)
data.Feb$Sub_metering_3 = as.numeric(data.Feb$Sub_metering_3)
#
# Change class of global active power to numeric
data.Feb$Global_reactive_power = as.character(data.Feb$Global_reactive_power)
data.Feb$Global_reactive_power = as.numeric(data.Feb$Global_reactive_power)
#
timestamp = paste(data.Feb$Date,data.Feb$Time)
data.Feb$timestamp = as.POSIXct(timestamp, format = "%d/%m/%Y %H:%M:%S")
#
### Plot 2
setwd("~/Dropbox/Annie's Documents/Classes/coursera/Exporatory_Data_Analysis/ProgrammingAssignments")
png(file = "plot2.png") 
plot(data.Feb$Global_active_power~data.Feb$timestamp, type='l',
     xlim=as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00")),
     xlab = "", ylab = "Global Active Power (killowatts)")
dev.off()



