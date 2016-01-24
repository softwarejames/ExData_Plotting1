#course project 1 assignment: plot 2

#read file into data frame
data <- read.table(file = "household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   colClasses = c("character", "character", "numeric", #Date field kept as character since non-standard date format
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric"
                   ),
                   na.strings = "?"
)

#open png device
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px"
)

#convert Date column values from character to date class
data$Date <- as.Date(x = data$Date, format = "%d/%m/%Y")

#subset data for only 2007-02-01 and 2007-02-02 dates
data <- subset(x = data,
               subset = {Date == "2007-02-01" | Date == "2007-02-02"}
)

#create datetime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),
                            format="%Y-%m-%d %H:%M:%S"
)

#create plot
with(data,
     plot(x = DateTime,
          y = Global_active_power,
          col = "black",
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          main = ""
     )
)

#close png device
dev.off()

