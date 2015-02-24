var insertPoster = function(movieJSON) {
  $posterDiv = $('.poster');
  title = movieJSON.Title;
  year = movieJSON.Year;
  $posterDiv.html('<h2>' + title + ', ' + year + '</h2>')

  var $poster = $('<img>').attr('src', movieJSON.Poster);
  $poster.appendTo($posterDiv);
};

var searchOMDB = function () {
  var movieTitle = $('#movie-title').val();
  var searchSlug = movieTitle.split(' ').join('+');
  var searchString = 'http://www.omdbapi.com/?t=' + searchSlug + '&plot=short&r=json';

  $.getJSON(searchString).done(function (result) {
   insertPoster(result);
  });
};

$(document).ready(function () {
  $('#search').on('click', searchOMDB);
});
