function getRandomInRange(from, to, fixed) {
  return (Math.random() * (to - from) + from).toFixed(fixed) * 1;
}

function genRandomLoc() {
  // around the entire planet
  // const latitude = getRandomInRange(-90.0, 90.0, 6);
  // const longitude = getRandomInRange(-180.0, 180.0, 6);

  // within some random square around LA-ish
  const latitude = getRandomInRange(33.69, 34.12, 6);
  const longitude = getRandomInRange(-118.55, -118.08, 6);

  return { latitude, longitude };
}
