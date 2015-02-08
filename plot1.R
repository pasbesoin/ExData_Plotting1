# Small script to create the first plot of Course Project 1 of the Exploratory
# Data Analysis course.
#
# When run, this creates a plot1.png file that matches what we see in
# https://github.com/rdpeng/ExData_Plotting1#plot-1


# You will need to download
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip and place this file in the parent directory:
HOUSEHOLD_POWER_DATA <- "../household_power_consumption.txt"

# In this dataset, missing data is marked with a question mark. Failure to use
# na.strings causes that our column of interest to be consider a "factor"
# rather than a numeric.
consumption <- read.table(HOUSEHOLD_POWER_DATA,
        sep=';',
        header=T,
        na.strings=c('?')
)

# We just want the first two days of February 2007. Just doing this by string
# rather than a Date type:
days_to_examine = consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
part_consumption = consumption[days_to_examine,]

# create a 480x480 PNG:
png("plot1.png", 480, 480)

# Create a histogram with the appropriate labels:
hist(part_consumption$Global_active_power,
        col="red",
        xlab="Global Active Power (kilowatts)",
        main="Global Active Power"
)

# This saves the PNG:
dev.off()
