# Draw plot 1

source("get_data.R")

# Create plot & save it to .png 
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(x = df$global_active_power,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "red")
dev.off()
