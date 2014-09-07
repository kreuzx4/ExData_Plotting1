setwd("/Javier/Coursera/Exploratory_Analysis/week_1/Assignment_1/")

# Read file only with the rows needed to plot.
# Columns are parsed to character or numeric data type assuring ? will be introduced as NA.
mainDT <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                     sep = ";",
                     #colClasses="character",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

png(file="plot3.png",width=480,height=480)
# Time range is created for x axis
xAxisToPlot <- strptime(paste(mainDT$Date, mainDT$Time), format='%d/%m/%Y %H:%M:%S')

# Plot is created with time axis and first series. Labels are specified as well as line colour.
plot(xAxisToPlot,mainDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
# Series line is added specifying colour line.
lines(xAxisToPlot,mainDT$Sub_metering_2, type="l", xlab="", ylab="", col="red")
# Series line is added specifying colour line.
lines(xAxisToPlot,mainDT$Sub_metering_3, type="l", xlab="", ylab="", col="blue")
# Legend is configured with position, labels and line colours.
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, xjust=1)
dev.off()