import React from 'react';
import Map from 'pigeon-maps';
import Marker from 'pigeon-marker';
// import Overlay from "pigeon-overlay";

const TicTacMap = props => {
  const { currLocation } = props;
  const [zoom, setZoom] = React.useState(12);

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
          anchor={[50.874, 4.6947]}
          payload={1}
          onClick={({ event, anchor, payload }) => {}}
        />
      </Map>
      <button onClick={() => setZoom(zoom + 1)}>Zoom In</button>
      <button onClick={() => setZoom(zoom - 1)}>Zoom Out</button>
    </>
  );
};

export default TicTacMap;
