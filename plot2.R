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
png(filename = "plot2.png", 
    width = 480, 
    height = 480, 
    units = "px")

#Creates the line chart
plot(householdFeb07$DateTime, householdFeb07$Global_active_power,
    type="l", 
    xlab="", 
    ylab="Global Active Power (kilowatts)")

#closes the output device
dev.off()