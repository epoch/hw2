var insertPoster = function(movieJSON) {
  $posterDiv = $('.poster');
  var title = movieJSON.Title;
  var year = movieJSON.Year;
  $posterDiv.html('<h2>' + title + ', ' + year + '</h2>')

  var $poster = $('<img>').attr('src', movieJSON.Poster);
  $poster.appendTo($posterDiv);
};

var searchOMDB = function () {
  var movieTitle = $('#movie-title').val();
  var omdbUrl = 'http://www.omdbapi.com/?';

  $.getJSON(omdbUrl, {
    t: movieTitle
  }).done(insertPoster);
};

$(document).ready(function () {
  $('#search').on('click', searchOMDB);
});
