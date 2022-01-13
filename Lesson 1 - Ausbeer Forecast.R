# Clean the console
rm (list=ls())

# Load the packages
library(fpp2)
library(dplyr)

# Load the dataset
ausbeer

# Access information about the dataset
?ausbeer
# Total quarterly beer production in Australia (in megalitres) 
# From 1956:Q1 to 2010:Q2.

# Exploratory analysis: plot the graph
autoplot(ausbeer)
# The graph shows annual seasonality (ups in the second semester/summer)
# An increasing trend till 1975, then a steady/declining trend

# Create a subset from 1992, plot it
ausbeer_1992 <- window(ausbeer, start=1992)
autoplot(ausbeer_1992)
# There is a decreasing trend

# Make a forecast
forecast_1992 <- forecast(ausbeer_1992) 
autoplot(forecast_1992)
# ETS models are a family of time series models which shares a level component,
# a trend component (T), a seasonal component (S), and an error term (E)

# Better graph (added: axes' labels, title)
plot1 <- autoplot(forecast_1992) + xlab("Year") + ylab("Megalitres") + 
  ggtitle("Beer Consumption Over Time")
print(plot1)
# The forecast is highlighted in blue