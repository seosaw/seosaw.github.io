# Creating a csv file for conversion to geoJSON for seosaw.github.io
# John Godlee (johngodlee@gmail.com)
# 2017_12_03
# 2018_03_14

# Clear env.
rm(list=ls())

# Packages ----
library(dplyr)
library(geojsonio)
library(readr)

# Directory paths and data ----
load("~/git_proj/seosaw/clean_data_sets/seosaw_plot_summary24Sept_v1.Rdata")
out_dir <- "~/git_proj/seosaw_website/scripts/"

# Create intermediate data frame ----
plots_export <- ssaw7$plotInfoFull %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(name = paste(name, "-", plotcode),
				 lon = as.numeric(as.character(longitude_of_centre)),
				 lat = as.numeric(as.character(latitude_of_centre)),
				 area_of_plot = round(as.numeric(area_of_plot) * 10000, digits = 2)) %>%
	select(name, country, 
				 area_of_plot, 
				 lon, lat) %>%
	filter(!is.na(lon), !is.na(lat))
	
# Export to json ----
geojson_write(input = plots_export,
						 lat = "lat",
						 lon = "lon",
						 file = paste0(out_dir, "plot_loc"))

