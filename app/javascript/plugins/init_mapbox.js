import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
	const bounds = new mapboxgl.LngLatBounds();
	markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
	map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
	markers.forEach((marker) => {
		const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
		console.log(marker.infoWindow);
		new mapboxgl.Marker()
			.setLngLat([marker.lng, marker.lat])
			.setPopup(popup) // add this
			.addTo(map);
	});
};

const initMapbox = () => {
	const mapElement = document.getElementById('map');

	if (mapElement) {
		// only build a map if there's a div#map to inject into
		mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
		const map = new mapboxgl.Map({
			container: 'map',
			style: 'mapbox://styles/mapbox/streets-v10',
		});
		const markers = JSON.parse(mapElement.dataset.markers);
		markers.forEach((marker) => {
			new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
		});

		fitMapToMarkers(map, markers);

		addMarkersToMap(map, markers);

		map.addControl(
			new MapboxGeocoder({
				accessToken: mapboxgl.accessToken,
				mapboxgl: mapboxgl,
			})
		);
	}
};

export { initMapbox };
