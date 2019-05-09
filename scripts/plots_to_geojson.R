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
load("~/git_proj/seosaw/clean_data_sets/seosaw_plot_summary5Apr2019.Rdata")
out_dir <- "~/git_proj/seosaw_website/scripts/"

# Create intermediate data frame
plots_inter <- ssaw8$plotInfoFull %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(n_censuses = as.numeric(n_censuses)) %>%
	mutate(name_long = paste(name, "-", plotcode),
		lon = as.numeric(as.character(longitude_of_centre)),
		lat = as.numeric(as.character(latitude_of_centre)),
		area_of_plot = round(as.numeric(area_of_plot) * 10000, digits = 2)) %>%
	mutate(
		single_multi = case_when(
			n_censuses > 1 ~ "multi",
			name %in% c("angola_bicuar_godlee_maiato", "Beteke Fire Experiment", "Kruger Skukuza") ~ "multi",
			TRUE ~ "single"))

##' in theory stems in the database will have a tag id if they are tagged and stem ID if not. I'm not sure that is what happened though.
##' AFAIK the only sites that are suitable for measurement but do not yet have repeat data are yours, Congo, and Sally's in Kruger.

# Isolate Zambian forestry commission plots
plots_zambia_fc <- plots_inter %>%
	filter(pi == "Siampale") %>%
	separate(plot_id, c("plot_group", "plot_subset"))

# Transform into spatial object
zambia_spat <- SpatialPointsDataFrame(
	matrix(c(plots_zambia_fc$lon, plots_zambia_fc$lat),
		ncol = 2), 
	data.frame(group = plots_zambia_fc$plot_group,
		subset = plots_zambia_fc$plot_subset,
		code = plots_zambia_fc$plotcode,
		name = plots_zambia_fc$name_long,
		area_of_plot = plots_zambia_fc$area_of_plot,
		lon = plots_zambia_fc$lon,
		lat = plots_zambia_fc$lat,
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
		name = first(name),
		country = "Zambia",
		area_of_plot = mean(area_of_plot),
		lon = mean(lon),
		lat = mean(lat),
		single_multi = first(single_multi),
		n_censuses = min(n_censuses),
		n_plots = n()
		) %>%
	select(-clust) %>%
	filter(!is.na(lon), !is.na(lat))

# Bind zambian plots back to original dataframe
plots_export <- plots_inter %>%
	filter(pi != "Siampale") %>%
	select(name, country, 
				 area_of_plot, 
				 lon, lat, single_multi, n_censuses) %>%
	mutate(n_plots = 1) %>%
	filter(!is.na(lon), !is.na(lat)) %>%
	bind_rows(.,zambia_agg) 
	
# Export to json ----
geojson_write(input = plots_export,
						 lat = "lat",
						 lon = "lon",
						 file = paste0(out_dir, "plot_loc"))

