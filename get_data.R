# Download & import data used for plotting

rm(list = ls())
graphics.off()


# Load R packages
packages <- c("tidyverse", "data.table", "janitor", "lubridate") # list of packages to load
source("package_check.R") # load or install & load list of packages


# Create data folder if necessary
if(!dir.exists("data")){ 
  dir.create(path = "data")  
}
# Download file (if not already downloaded)
if(!file.exists("./data/exdata_data_household_power_consumption.zip")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                destfile = "./data/exdata_data_household_power_consumption.zip")
}
# Unzip .txt file (if not already unzipped)
if(!file.exists("./data/household_power_consumption.txt")){
  unzip(zipfile = "./data/exdata_data_household_power_consumption.zip", 
        exdir = "data")
}


# Import .txt file to R
df <- fread(file = "./data/household_power_consumption.txt", sep = ";", na.strings = "?") %>% 
  clean_names()

# Clean data frame
df <- df %>% 
  mutate(datetime = paste0(date, " " ,time), # create datetime column
         date = dmy(date), # convert to date
         datetime = dmy_hms(datetime)) %>%  # convert to date time object
  select(-time) %>% # drop time column
  select(date, datetime, everything()) %>%  # re-arrange columns
  mutate_if(.predicate = is.character, .funs = as.numeric) # convert remaining strings to numeric

# Sort only relevant rows
df <- df %>% 
  filter(date >= "2007-02-01" & date <= "2007-02-02")
