##load data (only 2007-02-01 and 2007-02-02)

all_data <- read.table("~/ExData_Plotting1/household_power_consumption.txt", 
                       header = TRUE, sep=";", na.strings = "?")
data <- data.frame()
data <- subset(all_data, Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##construct plot
## save as 480 x 480 png
png("~/ExData_Plotting1/plot4.png", width=480, height=480)
##plot 4: 4 plots (2x2)

par(mfrow=c(2,2))

##top-left same as plot 2
with(data, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
##top-right x=datetime, y=voltage

with(data, {
        plot(Voltage~Datetime, type="l",
             ylab="Voltage", xlab="datetime")
})

##bottom-left same as plot 3

plot(data$Sub_metering_1~data$Datetime, type="l", col="Black",
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col="Red")
lines(data$Sub_metering_3~data$Datetime,col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##bottom-right x=datetime, y=Global_reactive_power

with(data, {
        plot(Global_reactive_power~Datetime, type="l",
             ylab="Global_reactive_power", xlab="datetime")
})

dev.off()