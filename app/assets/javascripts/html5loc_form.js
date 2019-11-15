function onSetSuccess(pos) {
  const { latitude, longitude } = pos.coords;

  $('#post_latitude').val(latitude);
  $('#post_longitude').val(longitude);

  $('#locfield').text('');
}

function onSetError() {
  $('#post_latitude').val('error');
  $('#post_longitude').val('error');

  $('#locfield').text('Error getting location');
}

function setHTML5Loc() {
  if ('geolocation' in navigator) {
    $('#locfield').text('Computing location, please wait...');
    navigator.geolocation.getCurrentPosition(onSetSuccess, onSetError);
  } else {
    onError();
  }
}
