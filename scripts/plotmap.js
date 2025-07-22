// Initialise map
var map = L.map('map',
	{
        crs: L.CRS.EPSG3857,
        minZoom: 2,
        maxZoom: 8,
        zoom: 4,
        zoomControl: false,
        worldCopyJump: true,
        preferCanvas: true,
	}).setView([-13.4,25.6]);

// Add background map from tinyworldmap
//new L.GridLayer.TinyWorld().addTo(map)

// Add background map from openstreetmap
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

// Define function to set display options for SEOSAW region polygon
function regionOpt(feature) {
  return { 
    fillOpacity: 0.6,
    fillColor: "#179600",
    color: "#179600",
    weight: 0.1
  };
}

// Add region polygon to map
L.geoJSON(region, {style: regionOpt}).addTo(map);

// Define function to set colour of plot marker points
function getColor(d) { 
	return d === false ? '#08868A' : 
		d === true ? '#D6C107' : 
		'#D6C107';
}

// Define function to set display options for plot markers
function markerOpt (feature) {
	return { 
		fillColor: getColor(feature.properties.permanent),
		color: "#000",
		fillOpacity: 0.6,
		weight: 0.5,
		radius: 4,
	};
}

// Define function to generate plot marker popup labels
function genLabels(feature, layer) {
	layer.bindPopup(
		"<h3>Plot ID: " + feature.properties.plot_id + "</h3>" + 
		"Country: " + feature.properties.country_iso3 + "<br>" +
		"PI: " + feature.properties.prinv + "<br>" + 
		"Plot Area: " + feature.properties.plot_area + " ha" + "<br>" +
		"Times surveyed: " + feature.properties.n_census
	);
}

// Define function to generate plot markers
function genPoints(feature, latlng) {
	return L.circleMarker(latlng, markerOpt);
}

// Add plot markers to map
L.geoJSON(plots, { 
	style: markerOpt,
	pointToLayer: genPoints,
	onEachFeature: genLabels,
}).addTo(map);

// Initialise legend
var legend = L.control({position: 'bottomright'});

// Define function to add labels to legend
legend.onAdd = function (map) {
    var div = L.DomUtil.create('div', 'legend');
	div.innerHTML += '<i style="background: #179600"></i><span>SEOSAW region</span><br>';
	div.innerHTML += '<i class="circle" style="background: #08868A"></i><span>Single census</span><br>';
	div.innerHTML += '<i class="circle" style="background: #D6C107"></i><span>Permanent plot</span><br>';
    return div;
};

// Add legend to map
legend.addTo(map);

