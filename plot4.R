## Read data with the required dates 02/01-02/02, 2007. 
## (According to the data file, lines 66630 to 69517)

Names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
           "Global_intensity", "Sub_metering_1",  "Sub_metering_2", "Sub_metering_3")

sub_hpc_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                           skip = 66637, nrows = 2880, col.names = Names)


## Combine and convert Date and Time variables into dateTime variable in POSIX format

sub_hpc_data$dateTime <- strptime(paste(as.character(sub_hpc_data$Date), 
                                        as.character(sub_hpc_data$Time)),

                                                                                                      "%d/%m/%Y %H:%M:%S")
## Open PNG device

png("plot4.png", width = 480, height = 480) 


## Set multiple plot frame (filled by column)

par(mfcol=c(2,2))


## Build active power consumption by date and time plot in [1,1]

plot(sub_hpc_data$dateTime, sub_hpc_data$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")


## Build Sub_metering No 1 by date and time plot  in [2,1]

plot(sub_hpc_data$dateTime, sub_hpc_data$Sub_metering_1, xlab = "", 
     ylab = "Energy Sub Metering", type = "l")


## Add points for Sub_metering No2 

points(sub_hpc_data$dateTime, sub_hpc_data$Sub_metering_2, type = "l", col = "red")


## Add points for Sub_metering No3

points(sub_hpc_data$dateTime, sub_hpc_data$Sub_metering_3, type = "l", col = "blue")


## Add the legend

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), 
                   col = c("black", "red", "blue"), bty="n", y.intersp = 0.9)


## Build Voltage by dateTime plot in [1,2]

plot(sub_hpc_data$dateTime, sub_hpc_data$Voltage, xlab = "dateTime", 
                                                  ylab = "Voltage", type = "l")


## Build Global reactive power by date and time plot in [2,2]

plot(sub_hpc_data$dateTime, sub_hpc_data$Global_reactive_power, xlab = "dateTime", 
                                       ylab = "Global Reactive Power", type = "l")


## Add the plot label on the top left corner

mtext ("Plot 4", side = 3, outer = TRUE, line = -1.2, adj = 0, font = 9 )


## Close PNG device

dev.off()
