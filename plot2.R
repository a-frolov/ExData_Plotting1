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

png("plot2.png", width = 480, height = 480) 


## Build active power consumption by date and time plot

plot(sub_hpc_data$dateTime, sub_hpc_data$Global_active_power, xlab = "", 
                            ylab = "Global Active Power (kilowatts)", type = "l")


## Add the plot label on the top left corner

mtext ("Plot 2", side = 3, outer = TRUE, line = -1.2, adj = 0, font = 9 )


## Close PNG device
dev.off()
