# Read file only with the rows needed to plot.
# Columns are parsed to character or numeric data type assuring ? will be introduced as NA.
mainDT <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                     sep = ";",
                     #colClasses="character",
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                     col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

# Time range is created for x axis
xAxisToPlot <- strptime(paste(mainDT$Date, mainDT$Time), format='%d/%m/%Y %H:%M:%S')

# Plot is generated with time axis and specified column.
plot(xAxisToPlot,mainDT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# PNG file is created and saved at the current working directory with the correct measures as requested.
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()