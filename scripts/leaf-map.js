var mymap = L.map('leaf-map').setView([-16.5, 24.7], 4);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
  maxZoom: 18,
  id: 'mapbox.streets'
}).addTo(mymap);

function getColor(d) { 
	return d == 'single' ? '#08868AFE' :
		   d == 'multi'  ? '#D6C107FE': 
						   '#D6C107FE';
}

function getDescrip(d){
	return d == 'single' ? 'Single census' : 
		   d == 'multi'  ? 'Permanent plot' :
						   '';
}

function plotOptions(feature) {
	return { 
		fillColor: getColor(feature.properties.single_multi),
		fillOpacity: 0.6,
		weight: 0.5,
		radius: 5,
		color: "#7A0099"
	};
}


function genPoints(feature, latlng) {
		return L.circleMarker(latlng, plotOptions);
	}

function genLabels(feature, layer){
		layer.bindPopup(
				"Country: " + feature.properties.country + "<br>" +
				"Plot Area: " + feature.properties.plot_area + " m<sup>2</sup>" + "<br>" + 
				"Times surveyed: " + feature.properties.n_censuses + "<br>" + 
				"Plots in cluster: " + feature.properties.n_plots);
	}

function miomboOptions(feature) {
  return { 
    fillOpacity: 0.6,
    fillColor: "#179600",
    color: "#179600",
    weight: 0.1
  };
}

L.geoJSON(miombo, {style: miomboOptions}).addTo(mymap);

L.geoJSON(locations, {
	style: plotOptions,
	pointToLayer: genPoints,
	onEachFeature: genLabels}).addTo(mymap);



var legend = L.control({position: 'bottomright'});

legend.onAdd = function (mymap) {
    var div = L.DomUtil.create('div', 'legend');
    	categories = ['single','multi'];
    	labels = ['<strong>Plot type</strong>']

    // loop through our density intervals and generate a label with a colored square for each interval
    for (var i = 0; i < categories.length; i++) {
        div.innerHTML += 
        	labels.push(
        	'<i class="circle" style="background:' + getColor(categories[i]) + '"></i> ' + (getDescrip(categories[i]) ? getDescrip(categories[i]) : '+'));
    }
    div.innerHTML = labels.join('<br>');
    return div;
};

legend.addTo(mymap);

var legend_miombo = L.control({position: 'bottomright'});

legend_miombo.onAdd = function (mymap) {
    var div = L.DomUtil.create('div', 'legend');
    	categories = ['savanna'];
    	labels = []

    // loop through our density intervals and generate a label with a colored square for each interval
    for (var i = 0; i < categories.length; i++) {
        div.innerHTML += 
        	labels.push(
        	'<i style="background:#179600"></i> ' + 'Savanna');
    }
    div.innerHTML = labels.join('<br>');
    return div;
};

legend_miombo.addTo(mymap);
