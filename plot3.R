#Read the data if needed
if (!"household" %in% list.files()) {
  household <- read.csv("./data/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
}

#Creates the subset of data with two days if needed
if (!"householdFeb07" %in% list.files()) {
  #Downsizing the sample
  householdFeb07 <- household[household$Date %in% c("1/2/2007", "2/2/2007") , ]
  
  #Convert date and time strings to date/time in R
  householdFeb07$DateTime <-paste(householdFeb07$Date, householdFeb07$Time)
  householdFeb07$DateTime <- strptime(householdFeb07$DateTime, "%d/%m/%Y %H:%M:%S")
}

#Defines the output device
png(filename = "plot3.png", 
    width = 480, 
    height = 480, 
    units = "px")

#Creates the multiline chart
plot(householdFeb07$DateTime, householdFeb07$Sub_metering_1,
     type="l", 
     xlab="", 
     ylab="Energy sub metering",
     col="black")

lines(householdFeb07$DateTime, householdFeb07$Sub_metering_2, type="l", col="red")
lines(householdFeb07$DateTime, householdFeb07$Sub_metering_3, type="l", col="blue")

#Adds a legend to the chart
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, 
       col=c("black", "red", "blue"))

#closes the output device
dev.off()