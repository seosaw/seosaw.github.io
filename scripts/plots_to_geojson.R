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

# Directory paths and data ----
load("~/git_proj/seosaw/clean_data_sets/seosaw_plot_summary24Sept_v1.Rdata")
out_dir <- "~/git_proj/seosaw_website/scripts/"

# Create intermediate data frame ----


plots_inter <- ssaw7$plotInfoFull %>%
	filter(!is.na(longitude_of_centre) & !is.na(latitude_of_centre)) %>%
	mutate(n_censuses = as.numeric(n_censuses)) %>%
	mutate(name = paste(name, "-", plotcode),
		lon = as.numeric(as.character(longitude_of_centre)),
		lat = as.numeric(as.character(latitude_of_centre)),
		area_of_plot = round(as.numeric(area_of_plot) * 10000, digits = 2),
		single_multi = case_when(
			n_censuses > 1 ~ "multi",
			TRUE ~ "single"))

plots_zambia_agg <- plots_inter %>%
	filter(country == "Zambia",
		pi == "Siampale") %>%
	separate(plot_id, c("plot_group", "plot_subset")) %>%
	group_by(plot_group, single_multi) %>%
	summarise(lon = mean(lon),
		lat = mean(lat),
		area_of_plot = sum(area_of_plot),
		n_censuses = mean(n_censuses)) %>%
	ungroup() %>%
	mutate(name = paste0("Zambia_ILUAii - ", seq(1:length(.$area_of_plot))),
		country = "Zambia") %>%
	select(-plot_group) %>% 
	filter(!is.na(lon), !is.na(lat))

plots_export <- plots_inter %>%
	filter(pi != "Siampale") %>%
	select(name, country, 
				 area_of_plot, 
				 lon, lat, single_multi, n_censuses) %>%
	filter(!is.na(lon), !is.na(lat)) %>%
	bind_rows(.,plots_zambia_agg) 
	
# Export to json ----
geojson_write(input = plots_export,
						 lat = "lat",
						 lon = "lon",
						 file = paste0(out_dir, "plot_loc"))

