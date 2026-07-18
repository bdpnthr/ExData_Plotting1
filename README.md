# Exploratory Data Analysis - Household Power Consumption

This repository contains code and plots for the Exploratory Data Analysis course project.  
The goal is to examine household energy usage over two days in February 2007.

## Dataset
- Source: `household_power_consumption.txt`
- Size: ~2 million rows, 9 columns
- Missing values are coded as `?`
- Only data from **2007-02-01** and **2007-02-02** are used.

## How to Run
Each plot has its own R script (`plot1.R`, `plot2.R`, `plot3.R`, `plot4.R`).  
Running a script will:
1. Load the dataset (filtered to the required dates).
2. Convert Date and Time into a proper DateTime object.
3. Generate the plot and save it as a PNG file (480x480 pixels).

Example snippet used in all scripts:

```r
library(data.table)

# Read only needed dates directly
data <- fread("household_power_consumption.txt", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
