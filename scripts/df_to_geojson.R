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
in_dir <- "/Volumes/bascule/seosaw_data_out"
out_dir <- "~/git_proj/seosaw_website"

# Import merged plot level data from bascule ----
# List potential files 
plots_file <- list.files(pattern = "p_all*", path = paste(in_dir, "/plots/", sep = ""))

# Create file paths from potential files
plots_path <- paste(in_dir, "/plots/", plots_file, sep = "")

# Read in most recent file
plots <- read.csv(tail(plots_path, n = 1))

# Create intermediate data frame ----
plots_export <- plots %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(lon = as.numeric(longitude_of_centre),
				 lat = as.numeric(latitude_of_centre),
				 area_of_plot = as.numeric(area_of_plot)) %>%
	select(name, country, 
				 area_of_plot, 
				 lon, lat)
	
# Export to json ----
geojson_write(input = plots_export,
						 lat = "lat",
						 lon = "lon",
						 file = paste(out_dir, "/", "scripts", "/", "plot_loc.geojson"))

