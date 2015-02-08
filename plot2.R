# Small script to create the second plot of Course Project 1 of the Exploratory
# Data Analysis course.
#
# When run, this creates a plot2.png file that matches what we see in
# https://github.com/rdpeng/ExData_Plotting1#plot-2


# You will need to download
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip and place this file in the parent directory:
HOUSEHOLD_POWER_DATA <- "../household_power_consumption.txt"

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
png("plot2.png", 480, 480)

# Create a POSIXlt vector from the Date and Time columns: 
time <- strptime(paste(part_consumption$Date, part_consumption$Time),
        "%d/%m/%Y %H:%M:%S"
)

# Create a line graph of Global Active Power over time:
plot(time, part_consumption$Global_active_power, type='l',
        xlab="", ylab="Global Active Power (kilowatts)"
)

# This saves the PNG:
dev.off()
