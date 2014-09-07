# Read file only with the rows needed to plot.
# Columns are parsed to character or numeric data type assuring ? will be introduced as NA.
mainDT <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                     sep = ";",
                     #colClasses="character",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

# Configuration for the four plots arranged in 2 rows and 2 columns.
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(mainDT, {
    # Time range is created for x axis
    xAxisToPlot <- strptime(paste(mainDT$Date, mainDT$Time), format='%d/%m/%Y %H:%M:%S')
    # Plots are added with their own configuration.
    plot(xAxisToPlot, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(xAxisToPlot, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(xAxisToPlot,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(xAxisToPlot,Sub_metering_2, type="l", xlab="", ylab="", col="red")
    lines(xAxisToPlot,Sub_metering_3, type="l", xlab="", ylab="", col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lty = 1, cex=0.7)
    plot(xAxisToPlot, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

# PNG file is created and saved at the current working directory with the correct measures as requested.
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()