##load data (only 2007-02-01 and 2007-02-02)

all_data <- read.table("~/ExData_Plotting1/household_power_consumption.txt", 
                       header = TRUE, sep=";", na.strings = "?")
data <- data.frame()
data <- subset(all_data, Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##construct plot
##plot 2: no title, line/freq
##x = day of week, y= Global active power (kilowatts)
png("~/ExData_Plotting1/plot2.png", width=480, height=480)

with(data, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
## save as 480 x 480 png

dev.off()