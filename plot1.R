# Read file only with the rows needed to plot.
# Columns are parsed to character or numeric data type assuring ? will be introduced as NA.
mainDT <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                  sep = ";",
                  #colClasses="character",
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                  col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

# Histogram function is called with the column needed to be plotted. Labels are specified.
hist(mainDT$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# PNG file is created and saved at the current working directory with the correct measures as requested.
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()