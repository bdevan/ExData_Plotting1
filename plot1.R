##load data (only 2007-02-01 and 2007-02-02)

all_data <- read.table("~/ExData_Plotting1/household_power_consumption.txt", 
                   header = TRUE, sep=";", na.strings = "?")
data <- data.frame()
data <- subset(all_data, Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <-strptime(data$Time, format="%H:%M:%S")

##construct plot

png("~/ExData_Plotting1/plot1.png", width=480, height=480)

hist(data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

## save as 480 x 480 png


dev.off()