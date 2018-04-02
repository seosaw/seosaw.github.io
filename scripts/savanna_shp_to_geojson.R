# Plotting White's 1983 Vegetation map and extracting the miombo part for SEOSAW website
# http://omap.africanmarineatlas.org/BIOSPHERE/pages/3_terrestrial%20vegetation.htm
# http://maplibrary.org/library/stacks/Africa/index.htm
# John Godlee (johngodlee@gmail.com)
# 2018_04_02

# Packages ----
library(maps)
library(rgdal)
library(rgeos)
library(ggplot2)
library(ggmap)
library(geojsonio)
library(dplyr)

# setwd ----
setwd(setwd(dirname(rstudioapi::getActiveDocumentContext()$path)))

# Read shapefile ----
white_veg <- readOGR(dsn="whitesveg", 
										 layer="Whites vegetation")

# Attempting to transform CRS to wgs84 ---- 
## No CRS given
proj4string(white_veg)
white_veg_wgs84 <- spTransform(white_veg,
															 CRS("+proj=longlat +datum=WGS84"))
# Exploring the shapefile ----
white_veg@data
white_veg@polygons
white_veg@proj4string
white_veg@bbox
white_veg@plotOrder

# Basic plot ----
plot(white_veg, col = white_veg$DESCRIPTIO)

# Fortify shapefile for use in ggplot2 ----
white_veg_fort <- fortify(white_veg, region = "DESCRIPTIO")
names(white_veg_fort)
length(unique(white_veg_fort$id))

# Create colour palette for ggplot2
palette_veg_type_19 <- c("#FF4A46","#008941","#006FA6","#A30059","#FFDBE5",
												 "#7A4900","#0000A6","#63FFAC","#B79762","#004D43",
												 "#8FB0FF","#997D87","#5A0007","#809693","#FEFFE6",
												 "#1B4400","#4FC601","#3B5DFF","#4A3B53")

length(palette_veg_type_19)

# Get country borders ----
countries <- readOGR(dsn="africa", 
										 layer="Africa")
countries@data

countries_fort <- fortify(countries, region = "COUNTRY")

# ggplot Africa ----
ggplot() + 
	geom_polygon(aes(x = long, y = lat, group = group, fill = id), 
							 data = white_veg_fort) + 
	geom_polygon(aes(x = long, y = lat, group = group, fill = NA), 
							 colour = "black", 
							 data = countries_fort) + 
	theme_classic()  + 
	scale_fill_manual(values = palette_veg_type_19) + 
	labs(fill = "Biome") + 
	xlab("Longitude") + 
	ylab("Latitude") + 
	coord_map()

# Extract miombo bits and change names of plots
white_veg_fort$id_new <- white_veg_fort$id %>%
	gsub("Moist-infertile savanna", "Miombo woodlands", .) %>%
	gsub("Mosaics of forests", "Forest/grassland mosaic", .) %>%
	gsub("Mopane savanna", "Mopane woodlands", .)

white_woodlands <- white_veg_fort %>%
	filter(id_new %in% c("Miombo woodlands",
											 "Montane forest", "Hydromorphic grassland",
											 "Arid-fertile savanna", "Mopane woodlands", "Sedge and reed swamp"))

ggplot() + 
	geom_polygon(aes(x = long, y = lat, group = group), 
							 fill = "#1AA302", colour = "#1AA302",
							 data = white_woodlands) + 
	geom_polygon(aes(x = long, y = lat, group = group), 
							 colour = "black", fill = NA,
							 data = countries_fort) + 
	theme_classic()  + 
	labs(fill = "Biome") + 
	xlab("Longitude") + 
	ylab("Latitude") + 
	coord_map()

# Concatenate polygons using above rules

white_veg_sub <- white_veg[which((white_veg$DESCRIPTIO == "Moist-infertile savanna") | 
									(white_veg$DESCRIPTIO == "Mosaics of forest") | 
									(white_veg$DESCRIPTIO == "Mopane savanna") | 
									(white_veg$DESCRIPTIO == "Montane Forest") | 
									(white_veg$DESCRIPTIO == "Hydropmorphic grassland") | 
									(white_veg$DESCRIPTIO == "Arid-fertile savanna") | 
									(white_veg$DESCRIPTIO == "Sedge and reed swamp")),]


white_woodlands_poly <- gUnaryUnion(white_veg_sub)
plot(white_woodlands_poly)

# Output to geojson ----
# Export to json ----
geojson_write(input = white_woodlands_poly,
						 file = "miombo_po")
