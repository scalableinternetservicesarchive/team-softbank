function onSuccess(pos) {
  const { latitude, longitude } = pos.coords;

  document.getElementById('post_latitude').value = latitude;
  document.getElementById('post_longitude').value = longitude;

  document.getElementById('locfield').innerText = '';
}

function onError() {
  document.getElementById('post_latitude').value = 'error';
  document.getElementById('post_longitude').value = 'error';
}

function setHTML5Loc() {
  if ('geolocation' in navigator) {
    document.getElementById('locfield').innerText =
      'Computing location, please wait...';
    navigator.geolocation.getCurrentPosition(onSuccess, onError);
  } else {
    onError();
  }
}
