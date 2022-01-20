rm(list=ls())
library(fpp2)


# 1 - Houses in USA

# Set the Working Directory 
#"Session" -> "Set Working Directory" -> "Choose Directory" OR "setwd("c:\\...")"

# Import data from ".csv" 
houses = scan('houses_USA.csv')
houses
# 107 items
summary(houses)
# Median slightly greater than Mean; min: 29; MAX: 74

# Make "houses" a Time-Series
# That represents sales of new one-family houses, in the USA, from Jan 1987 to Nov 1995
housests = ts(houses, start = c(1987,1), frequency = 12)
print(housests)
# Improved readability of No. of sales per Month && Year

graph1 <- autoplot(housests) + xlab("Time") + ylab(" ") +
  ggtitle("Sales of new one-family houses, USA, from Jan 1987 to Nov 1995")
print(graph1)
# The observations show a seasonal (annual) pattern, minimum near year-end
# Non-stationary

# Estimate Autocorrelation
graph2 <- ggAcf(housests) # ACF means AutoCorrelation Function
print(graph2)
# Lag 1 and 12 have great correlation (correlation coefficients > 0,55)
# Data is auto correlated

# Visualize auto correlation at lagged times 
graph3 <- gglagplot(housests,lags=12,do.lines=F)
# "gglagplot" plots time series against lagged versions of themselves
# To visualize 'auto-dependence' even when auto-correlations vanish
print(graph3)
# Lags 1 and 12 seem to be more auto correlated than other lags


# 2 - Air Passengers

# Plot data (already a Time Series)
autoplot(AirPassengers)
# Non-stationary

# Estimate Autocorrelation
ggAcf(AirPassengers)
# Very serious auto correlation (above > 0,5) for every lag till lag 17

# Visualize auto correlation at lagged times 
gglagplot(AirPassengers, lags=12, do.lines=FALSE)
# Observations seem most correlated at lag 12

# Visualize a Seasonal Plot 
ggseasonplot(AirPassengers)
# Each layer represents a year: most years seem to have the same seasonal pattern
# Peaks in Jul/Aug; minimums in Feb and in Nov

# Seasonal subseries plot 
ggsubseriesplot(AirPassengers)
# The blue lines (the means of each month) show minimums in Feb and Nov
# Peaks in Jul/Aug


# 3 - Lake Huron 

# Annual level of Lake Huron in feet, reduced by 570 feet: 1875-1972
autoplot(huron)
# Data seem not to have seasonality
# Non-stationary

# Estimate Autocorrelation
ggAcf(huron)
# Data is seriously auto correlated till lag 2
# This occurs because consecutive values appear to follow one another closely 


# 4 - Souvenirs
# Monthly sales for a souvenir shop at a beach resort town in Queensland, Australia
# From January 1987 to December 1993 

# Import data from ".txt"
souvenir <- scan("souvenir.txt")
# 84 items

# Create a Time Series which starts from 1st month of 1987
souvenirts <- ts(souvenir, frequency=12, start=c(1987,1))
autoplot(souvenirts)
# Observations are seasonal (1 year cycle), peak close to year-end, increasing trend
# Non-stationary

# Estimate Autocorrelation
ggAcf(souvenirts)
# Medium autocorrelation for lags 1 and 12

# Visualize a Seasonal Plot 
ggseasonplot(souvenirts)
# Seasonal pattern for most years' observations

# Seasonal subseries plot 
ggsubseriesplot(souvenirts)
# Peaks in Mar (local peak) and in Dec (absolute); minimum: Jan
