####################################################################
########## Exploratory Data Analysis ###############################
########## Plotting systems in R     ###############################
########## Project 01                ###############################  
########## Created by PRH ##########################################
########## Last Revision 10/05/2015 ################################


# 1. Get the data

power <- read.table(file="household_power_consumption.txt", header=TRUE, sep =";")


# 2. Turn the table into a data frame object

#power <- as.data.frame.matrix(power)

# 3. Transforming variables


power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(x = as.character( power$Time ), format = "%H:%M:%S")
power$Time <- format(power$Time, "%H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_active_power <- as.numeric(paste(power$Global_active_power))
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Global_reactive_power <- as.numeric(paste(power$Global_reactive_power))
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Global_intensity <- as.numeric(paste(power$Global_intensity))
power$Voltage <- as.numeric(power$Voltage)
power$Voltage <- as.numeric(paste(power$Voltage))
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_1 <- as.numeric(paste(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_2 <- as.numeric(paste(power$Sub_metering_2))
power$days <- weekdays(as.Date(power$Date,'%d-%m-%Y'))
power$Time <- format(power$Time, "%H:%M:%S")


#  4.Subset data
data <- subset(power,power$Date=="2007-02-01" | power$Date=="2007-02-02")

datetime <- within(data, { timestamp=format(as.POSIXct(paste(Date, Time, days)), "%d/%m/%Y %H:%M:%S") })
datetime <- datetime[,11]
datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")

data <- data.frame(data, datetime)









################################################################################################################



# Plot # 2. 


png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(data$datetime ,data$Global_active_power, main = " ", xlab="", 
     ylab ="Global Active Power(kilowatts)", type="l")
dev.off()
