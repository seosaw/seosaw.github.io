var mymap = L.map('leaf-map').setView([-16.5, 24.7], 4);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
  maxZoom: 18,
  id: 'mapbox.streets'
}).addTo(mymap);

function getColor(d) { 
	return d == 'single' ? '#08868AFE' :
	'#D6C107FE'; 
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
		layer.bindPopup("Name: " + feature.properties.name + "<br>" +
				"Country: " + feature.properties.country + "<br>" +
				"Plot Area: " + feature.properties.area_of_plot + " m<sup>2</sup>" + "<br>" + 
				"Times surveyed: " + feature.properties.n_censuses);
	}

function miomboOptions(feature) {
  return { 
    fillOpacity: 0.9,
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



