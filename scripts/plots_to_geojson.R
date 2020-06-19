# Creating a csv file for conversion to geoJSON for seosaw.github.io
# John Godlee (johngodlee@gmail.com)
# 2017_12_03
# 2018_03_14

# Clear env.
rm(list=ls())

# Packages ----
library(dplyr)
library(tidyr)
library(geojsonio)
library(readr)
library(geosphere)
library(rgdal)

# Directory paths and data ----
plots <- read.csv("../../seosaw_data/data_out/plots_v2.6.csv")
out_dir <- "scripts"

# Create intermediate data frame
plots$n_censuses <- sapply(strsplit(plots$all_dates, ","), length)

plots_inter <- plots %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(name_long = paste(name, "-", plot_id),
		lon = as.numeric(as.character(longitude_of_centre)),
		lat = as.numeric(as.character(latitude_of_centre)),
		area_of_plot = round(as.numeric(plot_area) * 10000, digits = 2)) %>%
	mutate(
		single_multi = case_when(
			n_censuses > 1 ~ "multi",
			grepl("ABG", plot_id) ~ "multi",
		  grepl("CBN", plot_id) ~ "multi", 
		  grepl("SSM", plot_id) ~ "multi", 
		  TRUE ~ "single"))

# Isolate Zambian forestry commission plots
plots_zambia_fc <- plots_inter %>%
	filter(prinv == "Siampale A.")

# Transform into spatial object
zambia_spat <- SpatialPointsDataFrame(
	matrix(c(plots_zambia_fc$lon, plots_zambia_fc$lat),
		ncol = 2), 
	data.frame(plot_cluster = plots_zambia_fc$plot_cluster,
		plot_id = plots_zambia_fc$plot_id,
		plot_area = plots_zambia_fc$plot_area,
	  longitude_of_centre = plots_zambia_fc$longitude_of_centre,
	  latitude_of_centre = plots_zambia_fc$latitude_of_centre,
		single_multi = plots_zambia_fc$single_multi,
		n_censuses = plots_zambia_fc$n_censuses),
	proj4string = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))

# Create distance matrix
zambia_mdist <- distm(zambia_spat)

# Cluster
hc <- hclust(as.dist(zambia_mdist), method="complete")

zambia_spat$clust <- cutree(hc, h =  100000)

# Transform back to dataframe and clean
zambia_agg <- data.frame(zambia_spat) %>%
	group_by(clust) %>%
	summarise(
		country = "Zambia",
	  plot_area = mean(plot_area, na.rm = TRUE),
	  longitude_of_centre = mean(longitude_of_centre),
	  latitude_of_centre = mean(latitude_of_centre),
		single_multi = first(single_multi),
		n_censuses = min(n_censuses),
		n_plots = n()
		) %>%
	select(-clust) %>%
	filter(!is.na(longitude_of_centre), !is.na(latitude_of_centre))

# Bind zambian plots back to original dataframe
plots_export <- plots_inter %>%
	filter(pi != "Siampale") %>%
	select(country, 
				 plot_area, 
				 longitude_of_centre, latitude_of_centre, single_multi, n_censuses) %>%
	mutate(n_plots = 1) %>%
	filter(!is.na(longitude_of_centre), !is.na(latitude_of_centre)) %>%
	bind_rows(.,zambia_agg) 
	
# Export to json ----
geojson_write(input = plots_export,
  lat = "latitude_of_centre",
  lon = "longitude_of_centre",
						 file = file.path(out_dir, "plot_loc"))

