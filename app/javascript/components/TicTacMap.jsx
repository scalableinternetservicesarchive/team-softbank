import React from 'react';
import Map from 'pigeon-maps';
import Marker from 'pigeon-marker';
// import Overlay from "pigeon-overlay";
import { geolocated } from 'react-geolocated';

const TicTacMap = props => {
  const {
    location,
    coords,
    isGeolocationAvailable,
    isGeolocationEnabled
  } = props;
  const [zoom, setZoom] = React.useState(14);
  // currLocation already passed in
  if (location) {
    const currLocation = location.map(s => parseFloat(s));
    return (
      <>
        <Map center={currLocation} zoom={zoom} width={600} height={400}>
          <Marker anchor={currLocation} payload={1} />
        </Map>
        <button onClick={() => setZoom(zoom + 1)}>Zoom In</button>
        <button onClick={() => setZoom(zoom - 1)}>Zoom Out</button>
      </>
    );
  }

  // otherwise get location
  if (!isGeolocationAvailable) {
    return <div>Your browser does not support Geolocation</div>;
  } else if (!isGeolocationEnabled) {
    return <div>Geolocation is not enabled</div>;
  } else if (coords) {
    const currLocation = [coords.latitude, coords.longitude];
    const metaCsrf = document.querySelector("meta[name='csrf-token']");
    const csrfToken = metaCsrf.getAttribute('content');
    fetch('/map/location', {
      method: 'POST',
      body: JSON.stringify({ location: currLocation }),
      headers: {
        'x-csrf-token': csrfToken,
        'content-type': 'application/json'
      }
    })
      .then(response => {
        // HTTP 301 response
        // HOW CAN I FOLLOW THE HTTP REDIRECT RESPONSE?
        if (response.redirected) {
          window.location.href = response.url;
        }
      })
      .catch(function(err) {
        console.info(err + ' url: ' + url);
      });
  } else {
    return <div>Getting the location data&hellip; </div>;
  }
  return null;
};

export default geolocated({
  positionOptions: {
    enableHighAccuracy: false
  },
  userDecisionTimeout: 5000
})(TicTacMap);
