# Small script to create the third plot of Course Project 1 of the Exploratory
# Data Analysis course.
#
# When run, this creates a plot3.png file that matches what we see in
# https://github.com/rdpeng/ExData_Plotting1#plot-3


# You will need to download
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip and place this file in the parent directory:
HOUSEHOLD_POWER_DATA <- "../household_power_consumption.txt"

OUTPUT_FILENAME <- "plot3.png"

# In this dataset, missing data is marked with a question mark. Failure to use
# na.strings causes our column of interest to be considered a "factor"
# rather than a numeric.
consumption <- read.table(HOUSEHOLD_POWER_DATA,
        sep=';',
        header=T,
        na.strings=c('?')
)

# We just want the first two days of February 2007. Just doing this by string
# rather than a Date type:
days_to_examine <- consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
part_consumption <- consumption[days_to_examine,]

# create a 480x480 PNG:
png(OUTPUT_FILENAME, 480, 480)

# Create a POSIXlt vector from the Date and Time columns: 
time <- strptime(paste(part_consumption$Date, part_consumption$Time),
        "%d/%m/%Y %H:%M:%S"
)

plot(time, part_consumption$Sub_metering_1, type='l',
        xlab="", ylab="Energy sub metering"
)

# These commands add new line graphs to the existing plot:
lines(time, part_consumption$Sub_metering_2, col="red")
lines(time, part_consumption$Sub_metering_3, col="blue")

# Now, we have to create the legend:
# I learned this from http://www.r-bloggers.com/adding-a-legend-to-a-plot/
legend("topright",
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1, 1, 1),       # line type
        col=c("black", "red", "blue")
)

# This saves the PNG:
dev.off()
