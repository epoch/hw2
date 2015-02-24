var searchOMDB = function () {
  var movieTitle = $('#movie-title').val();
  var searchSlug = movieTitle.split(' ').join('+');
  var searchString = 'http://www.omdbapi.com/?t=' + searchSlug + '&plot=short&r=json';

  $.getJSON(searchString).done(function (result) {
   console.log(result);
  });
};

$(document).ready(function () {
  $('#search').on('click', searchOMDB);
});
