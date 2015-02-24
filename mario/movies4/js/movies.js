var selectMovie = function(searchResults) {
  if (searchResults.Error) {
    $posterDiv = $('.poster');
    $posterDiv.html("<h2>We can't find that movie.</h2>");
    return
  }

  searchResults = searchResults.Search;
  if (searchResults.length === 1) {
    var imdbID = searchResults[0].imdbID;
    searchOMDBbyID(imdbID);
  } else {
    displayOptions(searchResults);
  }
};

var generateRadioButtons = function(searchResults) {
  var $movieDiv = $('<div/>');
  for (var i = 0; i < searchResults.length; i++) {
    var movie = searchResults[i];
    var imdbID = movie.imdbID;
    var movieDiplay = movie.Title + ' (' + movie.Year + ')';

    var $label = $('<label/>').addClass(imdbID);
    var $radioBtn = $('<input type="radio">').attr({id: imdbID, value: imdbID, name: 'movieChoice'});
    var $span = $("<span/>").addClass('label-body').text(movieDiplay);

    $label.append($radioBtn, $span);
    $movieDiv.append($label);
  };
  return $movieDiv
};

var displayOptions = function(searchResults) {
  $posterDiv = $('.poster');
  $posterDiv.html('<h4>Which movie did you mean?</h4>')

  $movieDiv = generateRadioButtons(searchResults);
  $posterDiv.append($movieDiv);

  var $buttonNext = $("<button>").attr('id', 'submit').text("Submit");
  $posterDiv.append($buttonNext);

  $("#submit").click(function(){
    var selectedID = $("input[name=movieChoice]:checked").val()
    searchOMDBbyID(selectedID);
  });
};

var insertPoster = function(movieJSON) {
  $posterDiv = $('.poster');
  if (movieJSON.Poster === "N/A") {
    $posterDiv.html('<h2>Sorry, no poster is avaliable.</h2>');
    return
  }
  var title = movieJSON.Title;
  var year = movieJSON.Year;
  $posterDiv.html('<h2>' + title + ' (' + year + ')</h2>')

  var $poster = $('<img>').attr('src', movieJSON.Poster);
  $poster.appendTo($posterDiv);
};

var searchOMDB = function () {
  var movieTitle = $('#movie-title').val();
  var omdbUrl = 'http://www.omdbapi.com/?';

  $.getJSON(omdbUrl, {
    s: movieTitle,
    type: 'movie'
  }).done(selectMovie);
};

var searchOMDBbyID = function (imdbID) {
  var omdbUrl = 'http://www.omdbapi.com/?';

  $.getJSON(omdbUrl, {
    i: imdbID,
    type: 'movie'
  }).done(insertPoster);
};

$(document).ready(function () {
  $('#search').on('click', searchOMDB);

  $('#movie-title').on('keypress', function (event) {
    // Ignore any keypresses that are not Enter.
    if (event.which !== 13) {
      return;
    }
    searchOMDB();
  });
});
