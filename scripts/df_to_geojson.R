# Creating a csv file for conversion to geoJSON for seosaw.github.io
# John Godlee (johngodlee@gmail.com)
# 2017_12_03
# 2018_03_14

# Packages ----
library(dplyr)
library(geojsonio)
library(readr)

# Directory paths ----
# Define in and out directory paths from bascule
in_dir <- "/Volumes/csce/geos/groups/bascule/seosaw_data_out/plots/"
out_dir <- "~/git_proj/seosaw_website"

# Import merged plot level data from bascule ----
# List potential files 
plots_file <- list.files(pattern = "s_all*", path = paste(in_dir, sep = ""))

# Create file paths from potential files
plots_path <- paste(in_dir, plots_file, sep = "")

# Read in most recent file
plots <- read.csv(tail(plots_path, n = 1))

# Create intermediate data frame ----
plots_export <- plots %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(name = paste(name, "-", plotcode),
				 lon = as.numeric(as.character(longitude_of_centre)),
				 lat = as.numeric(as.character(latitude_of_centre)),
				 area_of_plot = as.numeric(area_of_plot) * 10000) %>%
	select(name, country, 
				 area_of_plot, 
				 lon, lat) %>%
	filter(!is.na(lon), !is.na(lat))
	
# Export to json ----
geojson_write(input = plots_export,
						 lat = "lat",
						 lon = "lon",
						 file = paste(out_dir, "/", "scripts", "/", "plot_loc", sep = ""))

