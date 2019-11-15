function onPostSuccess(pos) {
  const { latitude, longitude } = pos.coords;
  postLoc(latitude, longitude);
}

function onPostError() {
  // let's stub a fake location
  const { latitude, longitude } = genRandomLoc();
  postLoc(latitude, longitude);
}

function postLoc(latitude, longitude) {
  $.post('/posts/update_location', { latitude, longitude }).done(_ => {
    // console.log(`posted successfully`)
  });
}

function postHTML5Loc() {
  if ('geolocation' in navigator) {
    // console.log('computing location');
    navigator.geolocation.getCurrentPosition(onPostSuccess, onPostError);
  } else {
    onPostError();
  }
}
