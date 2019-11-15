function getRandomInRange(from, to, fixed) {
  return (Math.random() * (to - from) + from).toFixed(fixed) * 1;
}

function genRandomLoc() {
  const latitude = getRandomInRange(-90.0, 90.0, 6);
  const longitude = getRandomInRange(-180.0, 180.0, 6);

  return { latitude, longitude };
}
