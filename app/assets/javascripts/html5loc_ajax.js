function onSuccess(pos) {
  const { latitude, longitude } = pos.coords;

  $.post('/posts/update_location', { latitude, longitude }).done(res =>
    console.log(`posted successfully`)
  );
}

function onError() {
  console.log('error getting location');
}

function postHTML5Loc() {
  if ('geolocation' in navigator) {
    console.log('computing location');
    navigator.geolocation.getCurrentPosition(onSuccess, onError);
  } else {
    onError();
  }
}
