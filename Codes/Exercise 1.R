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

# Estimate Autocorrelation
ggAcf(AirPassengers)
# Auto correlation is very great (above > 0,5) for every lag till lag 17

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
