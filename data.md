---
layout: default
---

<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.css" />
<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.Default.css" />

# The SEOSAW plot network

The SEOSAW partnership holds plot data from across the woodlands and savannas of southern Africa. A major activity of SEOSAW is collating these data and conducting regional analyses of the structure and function of the region's vegetation.

The map below shows the location of the main data sets the partnership holds, along with the distribution of savannas and woodlands in Africa (green). Sites with multiple survey years are yellow. This map is still being updated as we add new data sets.

<h2 class="h-inline">Data</h2>

The data collated by SEOSAW will eventually be stored in [ForestPlots.net](https://www.forestplots.net/) for those members of the partnership who wish to make their data, or just their meta data, public. As part of the SEOSAW project, the [ForestPlots.net](https://www.forestplots.net/) database is being adapted to allow it to handle data from savannas and woodlands more easily. This part of SEOSAW is being led by Prof. Simon Lewis at the University of Leeds / UCL.

If you are interested in being involved in data synthesis activities and have data you would like to contribute, please contact [Casey Ryan](mailto:casey.ryan@ed.ac.uk).

<div id="leaf-map"></div>

<script src="{{ site.baseurl }}/scripts/plot_loc.js"></script>
<script src="{{ site.baseurl }}/scripts/miombo_po.js"></script>
<script src="https://unpkg.com/leaflet@1.2.0/dist/leaflet.js"
	integrity="sha512-lInM/apFSqyy1o6s89K4iQUKg6ppXEgsVxT35HbzUupEVRh2Eu9Wdl4tHj7dZO0s1uvplcYGmt3498TtHq+log=="
	crossorigin=""></script>
<script src="{{ site.baseurl }}/scripts/leaf-map.js"></script>
<script src="{{ site.baseurl }}/scripts/leaflet.markercluster-src.js"></script>
