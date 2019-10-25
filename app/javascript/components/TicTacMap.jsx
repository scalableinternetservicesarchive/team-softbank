import React from 'react';
import Map from 'pigeon-maps';
import Marker from 'pigeon-marker';
// import Overlay from "pigeon-overlay";
import { geolocated } from 'react-geolocated';

const TicTacMap = props => {
  const { coords, isGeolocationAvailable, isGeolocationEnabled } = props;

  const [zoom, setZoom] = React.useState(14);
  if (!isGeolocationAvailable) {
    return <div>Your browser does not support Geolocation</div>;
  } else if (!isGeolocationEnabled) {
    return <div>Geolocation is not enabled</div>;
  } else if (coords) {
    const currLocation = [coords.latitude, coords.longitude];
    return (
      <>
        <Map
          mouseEvents={true}
          center={currLocation}
          zoom={zoom}
          width={600}
          height={400}
        >
          <Marker
            anchor={currLocation}
            payload={1}
            onClick={({ event, anchor, payload }) => {}}
          />
        </Map>
        <button onClick={() => setZoom(zoom + 1)}>Zoom In</button>
        <button onClick={() => setZoom(zoom - 1)}>Zoom Out</button>
      </>
    );
  } else {
    return <div>Getting the location data&hellip; </div>;
  }
};

export default geolocated({
  positionOptions: {
    enableHighAccuracy: false
  },
  userDecisionTimeout: 5000
})(TicTacMap);
