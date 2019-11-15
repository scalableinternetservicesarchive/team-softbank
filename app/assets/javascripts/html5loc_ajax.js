function onPostSuccess(pos) {
  const { latitude, longitude } = pos.coords;

  $.post('/posts/update_location', { latitude, longitude }).done(res =>
    console.log(`posted successfully`)
  );
}

function onPostError() {
  // TODO: send error ajax so we can fallback?
  console.log('error getting location');
}

function postHTML5Loc() {
  if ('geolocation' in navigator) {
    console.log('computing location');
    navigator.geolocation.getCurrentPosition(onPostSuccess, onPostError);
  } else {
    onError();
  }
}
