# SEOSAW website homepage tickers - https://www.seosaw.github.io/
# John Godlee (johngodlee@gmail.com)
# 2018_07_09

# Remove old crap
rm(list=ls())

# Packages ----
library(XML)
library(RCurl)
library(rlist)

# Import data ----
plot <- read.csv("/Volumes/bascule/seosaw_clean/p_2018-05-06_13_39_56.csv")
stem <- read.csv("/Volumes/bascule/seosaw_clean/s_latest_2018-05-06_13_39_42.csv")

theurl <- getURL("https://seosaw.github.io/people.html",.opts = list(ssl.verifypeer = FALSE) )
tables <- readHTMLTable(theurl)
tables <- list.clean(tables, fun = is.null, recursive = FALSE)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
researcher <- tables[[which.max(n.rows)]]

# Number of woodland plots
n_plot <- length(unique(plot$plotcode))
names(n_plot) <- "n_plot"	

# Number of countries
n_country <- length(unique(plot$country))
names(n_country) <- 'n_country'

# Number of tree measurements
n_measurement <- nrow(stem)
names(n_measurement) <- "n_measurment"

# Number of researchers
n_researcher <- length(unique(researcher$Name))
names(n_researcher) <- "n_researcher"

# Compile
tickers <- c(n_plot, 
						 n_country, 
						 n_measurement, 
						 n_researcher)

tickers
