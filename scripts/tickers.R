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
load("~/git_proj/seosaw/clean_data_sets/seosaw_plot_summary24Sept_v1.Rdata")
load("~/git_proj/seosaw/clean_data_sets/community_matrices_by_size_classes.Rdata")

theurl <- getURL("https://seosaw.github.io/people.html",.opts = list(ssl.verifypeer = FALSE) )
tables <- readHTMLTable(theurl)
tables <- list.clean(tables, fun = is.null, recursive = FALSE)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
researcher <- tables[[which.max(n.rows)]]

# Number of researchers
n_researcher <- length(unique(researcher$Name))
names(n_researcher) <- "n_researcher"

# Number of woodland plots
n_plot <- length(unique(ssaw7$plotInfoFull$plotcode))
names(n_plot) <- "n_plot"	

# Number of countries
n_country <- length(unique(ssaw7$plotInfoFull$country))
names(n_country) <- 'n_country'

# Number of tree measurements
n_measurement <- nrow(sl_clean)
names(n_measurement) <- "n_measurment"

# Compile
tickers <- c(n_plot, 
						 n_country, 
						 n_measurement, 
						 n_researcher)

tickers


