---
layout: default
---

<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.css" />
<link rel="stylesheet" href="{{ site.baseurl }}/css/MarkerCluster.Default.css" />

# The SEOSAW plot network

The SEOSAW partnership maintains a database of tree and stem measurements gathered from plots across southern Africa. A major activity of SEOSAW is collating these data and conducting analyses of the structure and function of the region's vegetation.

The map below shows the locations of plots in the SEOSAW dataset, The map also shows the SEOSAW core region, which encompasses woody savannas and woodlands in southern Africa. The core region is based on [White's vegetation map](https://www.cabdirect.org/cabdirect/abstract/19840692540) and further shaped by expert opinion. 

## The SEOSAW dataset 

The SEOSAW dataset is available for research purposes following agreement from all data contributors. Please use the [contact form]({{ site.baseurl }}/contact.html) if you would like to use or contribute to the SEOSAW dataset. 


SEOSAW maintains a strict data sharing agreement and code of conduct for SEOSAW members who wish to use SEOSAW data or contribute to the SEOSAW database. Please see the full [Code of Conduct]({{ site.baseurl }}/resources/SEOSAW_CoC_V2.1_200504.pdf) and the accompanying [plain language summary]({{ site.baseurl }}/resources/seosaw_coc_plain_summary_v2.1_200504.txt).

Plots with multiple censuses will eventually be provided to [ForestPlots.net](https://www.forestplots.net/) for those members of the partnership who wish to make public their data, or just the metadata. As part of the SEOSAW project, the ForestPlots.net database is being adapted to allow it to handle data from savannas and woodlands more easily.  There is a [dataset manual]({{ site.baseurl }}/resources/dataset_manual.pdf) available which covers the contents of the SEOSAW dataset and how it is generated from raw data.

<div id="leaf-map"></div>

<script src="{{ site.baseurl }}/scripts/plots.js"></script>
<script src="{{ site.baseurl }}/scripts/region.js"></script>
<script src="https://unpkg.com/leaflet@1.2.0/dist/leaflet.js"
	integrity="sha512-lInM/apFSqyy1o6s89K4iQUKg6ppXEgsVxT35HbzUupEVRh2Eu9Wdl4tHj7dZO0s1uvplcYGmt3498TtHq+log=="
	crossorigin=""></script>
<script src="{{ site.baseurl }}/scripts/leaf-map.js"></script>
<script src="{{ site.baseurl }}/scripts/leaflet.markercluster-src.js"></script>


