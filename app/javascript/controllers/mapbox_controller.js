import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    this.steps = ``
    this.markersValue.forEach((marker) => {
      const step = [marker.lng, marker.lat]
      this.steps += `${step};`
    })
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#addRoute();
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  #drawRoute(coord){
    const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: coord
          }
        };
        if (this.map.getSource('route')) {
          this.map.getSource('route').setData(geojson);
        }
        else {
          this.map.addLayer({
            id: 'route',
            type: 'line',
            source: {
              type: 'geojson',
              data: geojson
            },
            layout: {
              'line-join': 'round',
              'line-cap': 'round'
            },
            paint: {
              'line-color': 'red',
              'line-width': 5,
              'line-opacity': 1
            }
          });
        }

  }

  #addRoute() {
    if (this.steps.length > 21) {
      console.log("hello")
      // async function getRoute() {
        fetch(
          `https://api.mapbox.com/directions/v5/mapbox/driving/${this.steps.substring(0, this.steps.length - 1)}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`)
          .then(response => response.json())
          .then(data =>  {
            const coord = data.routes[0].geometry.coordinates;
            console.log(coord);
            this.#drawRoute(coord);
          });

        //

    }

  }
}
