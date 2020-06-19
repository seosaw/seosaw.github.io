#!/bin/bash

# Generate geojson
Rscript "plots_to_geojson.R"


#Rscript "savanna_shp_to_geojson.R" 


## Change plot_loc.geojson to a new plot_loc.js
touch plot_loc.geojson.tmp

## Remove first 3 lines
tail -n +4 "plot_loc.geojson" > plot_loc.geojson.tmp

## Remove last two lines
awk 'n>=2 { print a[n%2] } { a[n%2]=$0; n=n+1 }' plot_loc.geojson.tmp > plot_loc.geojson.tmp.tmp

## Add line at start
gsed -i '1s/^/var locations = [/' plot_loc.geojson.tmp.tmp

## Add line at end
gsed -i  '$s/$/]/' plot_loc.geojson.tmp.tmp

## Move temp file to permanent
mv plot_loc.geojson.tmp.tmp plot_loc.js 
rm plot_loc.geojson.tmp

# Change miombo_po.geojson to a new miombo_po.js
touch miombo_po.geojson.tmp

# Remove last line
awk 'n>=1 { print a[n%1] } { a[n%1]=$0; n=n+1 }' miombo_po.geojson > miombo_po.geojson.tmp

## Add line at start
gsed -i  '1s/^/var miombo = [/' miombo_po.geojson.tmp

## Add line at end
gsed -i  '$s/$/}]/' miombo_po.geojson.tmp

## Move temp file to permanent
mv miombo_po.geojson.tmp miombo_po.js
