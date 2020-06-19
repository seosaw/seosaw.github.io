# Plotting White's 1983 Vegetation map and extracting the miombo part for SEOSAW website
# http://omap.africanmarineatlas.org/BIOSPHERE/pages/3_terrestrial%20vegetation.htm
# http://maplibrary.org/library/stacks/Africa/index.htm
# John Godlee (johngodlee@gmail.com)
# 2018_04_02

# Clear env.
rm(list=ls())

# Packages ----
library(maps)
library(rgdal)
library(rgeos)
library(ggplot2)
library(geojsonio)
library(dplyr)

# setwd ----
# setwd(setwd(dirname(rstudioapi::getActiveDocumentContext()$path)))
out_dir <- "~/git_proj/seosaw_website/scripts/"

# Read shapefile ----
white_veg <- readOGR(dsn="~/git_proj/whites_veg_map/whitesveg", 
										 layer="Whites vegetation")

# Attempting to transform CRS to wgs84 ---- 
## No CRS given
proj4string(white_veg)
#white_veg_wgs84 <- spTransform(white_veg,
#															 CRS("+proj=longlat +datum=WGS84"))
# Exploring the shapefile ----
white_veg@data
# white_veg@polygons
white_veg@proj4string
white_veg@bbox
white_veg@plotOrder

# Fortify shapefile ----
white_veg_fort <- fortify(white_veg, region = "DESCRIPTIO")
names(white_veg_fort)
length(unique(white_veg_fort$id))

# Extract miombo bits
white_veg_sub <- white_veg[which((white_veg$DESCRIPTIO == "Moist-infertile savanna") | 
									(white_veg$DESCRIPTIO == "Mosaics of forest") | 
									(white_veg$DESCRIPTIO == "Mopane savanna") | 
									(white_veg$DESCRIPTIO == "Montane Forest") | 
									(white_veg$DESCRIPTIO == "Hydropmorphic grassland") | 
									(white_veg$DESCRIPTIO == "Arid-fertile savanna") | 
									(white_veg$DESCRIPTIO == "Sedge and reed swamp")),]

white_woodlands_poly <- gUnaryUnion(white_veg_sub)

# Export to json ----
geojson_write(input = white_woodlands_poly,
						 file = paste0(out_dir, "miombo_po"))
