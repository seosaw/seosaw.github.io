// Initialize the map
var map = L.map('map',
	{
        crs: L.CRS.EPSG3857,
		maxZoom: 8,
        zoom: 4,
        zoomControl: false,
        worldCopyJump: true,
        preferCanvas: true,
	}).setView([-13.4,25.6]);

// Add background map from tinyworldmap
new L.GridLayer.TinyWorld().addTo(map)

// Add background map from openstreetmap
//L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
//    maxZoom: 19,
//    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
//}).addTo(map);
