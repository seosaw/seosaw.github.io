var mymap = L.map('leaf-map').setView([-16.5, 24.7], 4);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
  maxZoom: 18,
  id: 'mapbox.streets'
}).addTo(mymap);

var geojsonMarkerOptions = {
  fillOpacity: 0.2,
	weight: 1,
	radius: 5,
};

L.geoJSON(locations, {
  pointToLayer: function(feature, latlng) {
    return L.circleMarker(latlng, geojsonMarkerOptions);
  },
	onEachFeature: function(feature, layer){
		layer.bindPopup("Name: " + feature.properties.name + "<br>" +
		"Country: " + feature.properties.country + "<br>" +
	  "Plot Area: " + feature.properties.area_of_plot + " m<sup>2</sup>");
	}
}).addTo(mymap);
