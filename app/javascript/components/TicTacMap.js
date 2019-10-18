import React from "react";
import Map from "pigeon-maps";
import Marker from "pigeon-marker";
// import Overlay from "pigeon-overlay";

const TicTacMap = props => {
  return (
    // <h1>Hello Map</h1>
    <Map center={[50.879, 4.6997]} zoom={12} width={600} height={400}>
      <Marker
        anchor={[50.874, 4.6947]}
        payload={1}
        onClick={({ event, anchor, payload }) => {}}
      />
    </Map>
  );
};

export default TicTacMap;
