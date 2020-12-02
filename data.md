---
layout: default
---

<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.css" />
<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.Default.css" />

# The SEOSAW plot network

The SEOSAW partnership holds plot data from across the woodlands and savannas of southern Africa. A major activity of SEOSAW is collating these data and conducting regional analyses of the structure and function of the region's vegetation.

The map below shows the location of the main data sets the partnership holds, along with the SEOSAW core region, which encompasses woody savannas and woodlands in southern Africa, based on White's vegetation map and further expert opinion. This map is periodically updated as we add new data sets.


## The SEOSAW dataset 

The SEOSAW dataset is available for research purposes following agreement from all data contributors. Please contact [Casey Ryan](mailto:casey.ryan@ed.ac.uk) if you would like to use or contribute to the SEOSAW dataset. 

SEOSAW maintains a strict data sharing agreement and code of conduct for SEOSAW members who wish to use SEOSAW data or contribute to the SEOSAW database. Please see the full [Code of Conduct]({{ site.baseurl }}/resources/SEOSAW_CoC_V2.1_200504.pdf) and the accompanying [plain language summary]({{ site.baseurl }}/resources/seosaw_coc_plain_summary_v2.1_200504.txt).

### Data set structure

The SEOSAW dataset uses two main tables to organise data, a __stems__ table and a __plots__ table. To help guide your own data collection, refer to these pages which document the format of the data stored in each of these tables:

* [Stem table columns]({{ site.baseurl }}/stem_columns)
* [Plot table columns]({{ site.baseurl }}/plot_columns)

Additionally, refer to the [seosawR package vignette]({{ site.baseurl }}/vignette) for more information on how the SEOSAW dataset is cleaned and how you can format your own data in a SEOSAW friendly way. [See here for further description of the SEOSAW dataset]({{ site.baseurl }}/description).

Plots with multiple censuses will eventually be provided to [ForestPlots.net](https://www.forestplots.net/) for those members of the partnership who wish to make their data, or just the metadata, public. As part of the SEOSAW project, the [ForestPlots.net](https://www.forestplots.net/) database is being adapted to allow it to handle data from savannas and woodlands more easily. 

If you are interested in being involved in data synthesis activities and have data you would like to contribute, please contact [Casey Ryan](mailto:casey.ryan@ed.ac.uk).

[See here for further description of the SEOSAW dataset]({{ site.baseurl }}/description).

<div id="leaf-map"></div>

<script src="{{ site.baseurl }}/scripts/plots.js"></script>
<script src="{{ site.baseurl }}/scripts/region.js"></script>
<script src="https://unpkg.com/leaflet@1.2.0/dist/leaflet.js"
	integrity="sha512-lInM/apFSqyy1o6s89K4iQUKg6ppXEgsVxT35HbzUupEVRh2Eu9Wdl4tHj7dZO0s1uvplcYGmt3498TtHq+log=="
	crossorigin=""></script>
<script src="{{ site.baseurl }}/scripts/leaf-map.js"></script>
<script src="{{ site.baseurl }}/scripts/leaflet.markercluster-src.js"></script>


