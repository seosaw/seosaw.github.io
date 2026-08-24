// Set via a global before this script loads (see data.md), so the map's
// data fetches still resolve correctly when the site is served from a
// subpath (e.g. the /preview/ dev-branch build), not just from the root.
var BASEURL = window.SEOSAW_BASEURL || '';

Promise.all([
	fetch(BASEURL + '/scripts/plots.json').then(r => r.json()),
	fetch(BASEURL + '/scripts/region.json').then(r => r.json()),
	fetch(BASEURL + '/scripts/Ecoregions2017.geojson').then(r => r.json())
]).then(([plots, region, Ecoregions2017]) => {

	// Initialise map
	var map = L.map('map', {
		crs: L.CRS.EPSG3857,
		minZoom: 2,
		maxZoom: 8,
		zoom: 4,
		zoomControl: false,
		worldCopyJump: true,
		preferCanvas: true,
		attributionControl: false,
	}).setView([-13.4, 25.6]);

	// Background tiles
	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		maxZoom: 19,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
	}).addTo(map);

	var biomeColours = {
		//'Mangroves': '#0800ff',
		'Deserts & Xeric Shrublands': '#fff59b',
		'Flooded Grasslands & Savannas': '#3bffd1',
		'Montane Grasslands & Shrublands': '#5997ba',
		//'Mediterranean Forests, Woodlands & Scrub': '#fb3e21e1',
		'Dry Forest, Savanna, Shrubland and Grassland': '#e6b84a',
		'Tropical & Subtropical Moist Broadleaf Forests': '#2a9617',
	};
	
	L.geoJSON(Ecoregions2017, {
		smoothFactor: 0,
		style: function(feature) {
			var colour =
			biomeColours[feature.properties.BIOME_NAME] || '#88888800';
			
			return {
				fillColor: colour,
				fillOpacity: 0.6,
				color: colour,
				weight: 0.1
			};
		}
	}).addTo(map);

	// L.geoJSON(region, {
	// 	style: {
	// 		fillOpacity: 0.6,
	// 		fillColor: '#179600',
	// 		color: '#179600',
	// 		weight: 0.1,
	// 	}
	// }).addTo(map);

	// Normalise to array of features (plots.json may be array or FeatureCollection)
	var featureList = Array.isArray(plots) ? plots : plots.features;

	// --- Layer 1: PSP site circles ---
	// plots.json already ships one pre-aggregated point per site (site_code,
	// n_psp, max_census, country, pi) — exact plot locations are never sent
	// to the browser, so no client-side aggregation is needed here.
	var pspFeatures = featureList.filter(function(f) { return f.properties.permanent; });

	var pspLayer = L.geoJSON(pspFeatures, {
		pointToLayer: function(feature, latlng) {
			return L.circleMarker(latlng, {
				radius: 6 + Math.sqrt(feature.properties.n_psp) * 2,
				fillColor: '#2a7ae2',
				color: '#ffffff',
				weight: 1.5,
				fillOpacity: 0.85,
			});
		},
		onEachFeature: function(feature, layer) {
			var p = feature.properties;
			layer.bindPopup(
				'<strong>Site: ' + p.site_code + '</strong><br>' +
				'Country: ' + p.country + '<br>' +
				'Permanent plots: ' + p.n_psp + '&emsp;Max censuses: ' + p.max_census + '<br>' +
				'PI: ' + (p.pi || '&mdash;')
			);
		}
	});

	// --- Layer 2: One-off plot dots (hidden by default) ---
	var oneoffFeatures = featureList.filter(function(f) { return !f.properties.permanent; });

	var oneoffLayer = L.geoJSON(oneoffFeatures, {
		pointToLayer: function(feature, latlng) {
			return L.circleMarker(latlng, {
				radius: 2,
				fillColor: '#888888',
				stroke: false,
				fillOpacity: 0.4,
			});
		}
	});

	// Add PSP layer by default; one-off layer starts hidden
	pspLayer.addTo(map);

	// Layer control (overlays only, expanded)
	L.control.layers(null, {
		'Permanent plots (PSPs)': pspLayer,
		'One-off plots': oneoffLayer,
	}, { collapsed: false }).addTo(map);

	// Legend
	var legend = L.control({ position: 'bottomright' });
	legend.onAdd = function() {
		var div = L.DomUtil.create('div', 'legend');
		Object.entries(biomeColours).forEach(function([name, colour]) {
			div.innerHTML +=
				'<i style="background:' + colour + '"></i>' +
				'<span>' + name + '</span><br>';
			});
		//div.innerHTML += '<i style="background: #179600"></i><span>SEOSAW region</span><br>';
		div.innerHTML += '<i class="circle" style="background: #2a7ae2"></i><span>PSP site</span><br>';
		div.innerHTML += '<i class="circle" style="background: #888888; opacity: 0.4"></i><span>One-off plot</span><br>';
		return div;
	};
	legend.addTo(map);

});
