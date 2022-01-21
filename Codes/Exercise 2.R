# Exercises from Chapter 2.10

rm(list=ls())


# 1

# Use the help function to explore gold, woolyrnq and gas
# Use autoplot()
# What is their frequency?
# Use which.max() to spot the outlier in the gold series

library(fpp2)

?gold
# Daily morning gold prices in US dollars. 1 January 1985 – 31 March 1989

?woolyrnq
# Quarterly production of woolen yarn in Australia: tonnes. Mar 1965 – Sep 1994

?gas
# Australian monthly gas production: 1956–1995

autoplot(gold)
# Non-stationary Time Series
tsdisplay(gold)
# Time Series, ACF and PACF

autoplot(woolyrnq)
# Cyclical Time Series

autoplot(gas)
# Seasonal Time Series (regular annual season)

which.max(gold)
# Maximum value at $770 USD


# 2

# Read the data from "tute1.csv"
# Convert the data to time series
# Construct time series plots of each of the three series

rm(list=ls())

tute1 <- read.csv("tute1.csv", header=TRUE)

mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)
autoplot(mytimeseries) # Same as "autoplot(mytimeseries, facets=FALSE)"
autoplot(mytimeseries, facets=TRUE)
# The graphs are slightly different, with "facets=FALSE" being more readable


# 3

# Download "retail.xlsx", read it
# Select a Time Series and explore it

rm(list=ls())

# Upload a library to read ".xlsx" files 
library(readxl)

retaildata <- read_excel("retail.xlsx", skip=1)
# 190 variables with 381 observations each

# Select one column as TS
turnoverts <- ts(retaildata[,"A3349874C"], frequency=12, start=c(1982,4))
# Turnover;  New South Wales;  Footwear and other personal accessory retailing

autoplot(turnoverts)
# TS with seasonal pattern; increasing pattern; non-stationary

ggseasonplot(turnoverts)
# Seasonality is more visible; every year has more or less the same pattern

ggsubseriesplot(turnoverts)
# Minimum in Feb, MAX in Dec

gglagplot(turnoverts,do.lines=F)
# Great 'auto-dependence' in lag 12; clearly a seasonal pattern of 12 months

ggAcf(turnoverts)
# Very strong and persistent autocorrelation (>0,625) till lag 24
# Definitely not white noise


# 4.

# Create time plots of the following time series: 
# bicoal, chicken, dole, usdeaths, lynx, goog, writing, fancy, a10, h02

library(ggplot2)

?lynx
# Annual number of lynx trapped in McKenzie river district of northwest Canada
# 1821–1934.

autoplot(lynx)
# Cyclical pattern

ggseasonplot(lynx)
# Definitely not seasonal

ggAcf(lynx)
# Auto-correlation is present (with 4 spikes >0,5) 
# Swinging pattern signalling a cyclic TS
# Definitely not white noise

?goog
# Closing stock prices of GOOG from the NASDAQ exchange, for 1000 consecutive 
# trading days between 25 February 2013 and 13 February 2017

p <- autoplot(goog, xlab = "Trading Day", ylab = "Price") + ggtitle("Closing Stock Prices") 
p
# Graph is more readable; non-stationary; seems not seasonal

ggseasonplot(goog)
# Definitely not seasonal; seems cyclical between 200/600 and 600/1000

ggAcf(goog)
# Very strong autocorrelation (>0,875) till lag 25
# Observations depend on previous values 
# Definitely not white noise

?writing
# Industry sales for printing and writing paper (in thousands of French francs)
# Jan 1963 – Dec 1972

autoplot(writing)
# Seasonal pattern, non-stationary

ggseasonplot(writing)
# Seasonality is annual, and every year has more or less the same pattern 

ggsubseriesplot(writing)
# Annual minimum in Aug

ggAcf(writing)
# Significant auto-correlation in a seemingly seasonal pattern
# Definitely not white noise


# 5

# explore the seasonal patterns in the following time series
# writing, fancy, a10, h02

?fancy
# Monthly sales for a souvenir shop on the wharf at a beach resort town in 
# Queensland, Australia

autoplot(fancy)
# Non-stationary; seasonal

ggseasonplot(fancy)
# Seasonal

ggsubseriesplot(fancy)
# Minimum in Jan, MAX in Dec

ggAcf(fancy)
# Slightly auto-correlated at lags 1, 12 and 24 (only one spike >0,625)
# Not white noise

?a10
# Monthly government expenditure (millions of dollars) as part of the Pharmaceutical
# Benefit Scheme for products falling under ATC code A10 as recorded by the 
# Australian Health Insurance Commission; July 1991 - June 2008

autoplot(a10)
# Non-stationary, increasing pattern; seasonal

ggseasonplot(a10)
# Seasonal pattern more or less consistent from year to year

ggsubseriesplot(a10)
# Min in Feb, MAX in Jan

ggAcf(a10)
# Strong and persistent auto-correlation (>0,50 till lag 24)
# Observations are linked one another
# Definitely not white noise


# 6

# Explore features from the following time series
# hsales, usdeaths, bricksq, sunspotarea, gasoline

autoplot(bricksq)
# Non-stationary; seasonal pattern (1 year); cyclic patterns ('55/'75; '75/'82; '82/'90)

ggseasonplot(bricksq)
# Most years have similar patterns

ggsubseriesplot(bricksq)
# Min in Q1, MAX in Q3

gglagplot(bricksq,do.lines=F)
# 'auto-dependence' is persistent in all lags; greatest in lag 4

ggAcf(bricksq)
# Autocorrelation is persistent (>0,50 till lag 20)
# Definitely not white noise

?sunspotarea
# Annual averages of the daily sunspot areas (in units of millionths of a hemisphere)
# For the full sun. Sunspots are magnetic regions that appear as dark spots on the 
# Surface of the sun. The Royal Greenwich Observatory compiled daily sunspot 
# observations from May 1874 to 1976. Later data are from the US Air Force and 
# the US National Oceanic and Atmospheric Administration. The data have been
# calibrated to be consistent across the whole history of observations.

autoplot(sunspotarea)
# Cyclical 

ggseasonplot(sunspotarea)
# Definitely not seasonal

gglagplot(sunspotarea, do.lines = F)
# Lag 1 shows the greatest correlation 

ggAcf(sunspotarea)
# Observations have autocorrelation; swinging pattern typical of cyclic TS
# Definitely not white noise


# 7

# "arrivals" data set comprises quarterly international arrivals

autoplot(arrivals)
# All the data in the same plot; difficult to read
autoplot(arrivals, facets = TRUE)
# Easier to read

autoplot(arrivals[,1]) # Japan
# Non-stationary; seasonal (1 year); cyclic (increasing till '98, decreasing after)
ggseasonplot(arrivals[,1])
# Seasonal; more or less consistent each year 
ggsubseriesplot(arrivals[,1])
# Min in Q2, MAX in Q1

autoplot(arrivals[,2]) # New Zealand
# Non-stationary; seasonal (1 year); increasing
ggseasonplot(arrivals[,2])
# Seasonal; consistent each year 
ggsubseriesplot(arrivals[,2])
# Min in Q1, MAX in Q3

autoplot(arrivals[,3]) # United Kingdom
# Non-stationary; seasonal (1 year); increasing
ggseasonplot(arrivals[,3])
# Seasonal; consistent each year 
ggsubseriesplot(arrivals[,3])
# Min in Q2, MAX in Q4

autoplot(arrivals[,4]) # United States
# Non-stationary; seasonal (1 year); increasing
ggseasonplot(arrivals[,4])
# Seasonal; more or less consistent each year 
ggsubseriesplot(arrivals[,4])
# Min in Q2, MAX in Q4


# 8

# Match each time plot in the first row with one of the ACF plots in the second row

autoplot(cowtemp)
ggAcf(cowtemp)
# 1 and B

autoplot(usdeaths)
ggAcf(usdeaths)
# 2 and A

autoplot(mink)
ggAcf(mink)
# 3 and C
# 4 and D


# 9

# Monthly total number of pigs slaughtered in Victoria, Australia
# From Jan 1980 to Aug 1995

mypigs <- window(pigs, start=1990)
# Select data from 1990

autoplot(mypigs)
# Observations seem to have no seasonal nor cyclical pattern

ggAcf(mypigs)
# First 3 spikes are above blue line, so there is some signal in this time series
# component that can be used in a forecasting approach
# Most spikes (21/24, which is 87,5%) lie inside the blue lines
# Very likely not white noise


# 10

# "dj" contains 292 consecutive trading days of the Dow Jones Index

ddj <- diff(dj)
# Compute the daily changes in the index.

autoplot(ddj)
# Data seems white noise

ggAcf(ddj)
# Almost all spikes (24/25, which is 4%) lie inside the blue lines
# ddj might be white noise (with 5% bound)
