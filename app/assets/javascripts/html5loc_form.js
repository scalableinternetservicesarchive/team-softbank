function onSetSuccess(pos) {
  const { latitude, longitude } = pos.coords;
  setLocHTML(latitude, longitude);
}

function onSetError() {
  // let's stub a fake location
  const { latitude, longitude } = genRandomLoc();
  setLocHTML(latitude, longitude);
}

function setLocHTML(latitude, longitude) {
  $('#post_latitude').val(latitude);
  $('#post_longitude').val(longitude);

  $('#locfield').text(`Your location: ${latitude}, ${longitude}`);
}

function setHTML5Loc() {
  if ('geolocation' in navigator) {
    $('#locfield').text('Computing location, please wait...');
    navigator.geolocation.getCurrentPosition(onSetSuccess, onSetError);
  } else {
    onSetError();
  }
}
