var searchOmdb = function () {
  var query = $('#query').val();

  var omdbUrl = 'http://www.omdbapi.com/?'

  $.getJSON(omdbUrl, {
    s: query,
    type: 'movie',
    r: 'json'
  }).done(showResults);
};

var showResults = function (result) {
  var results = result.Search;

  var $moviesContainer = $('<div/>').addClass('movies-container');
  $('.container').append($moviesContainer);

  if (result.Response) {
    var $moviesHeader = $('<p>').addClass('error').html('Sorry, the film could not be found');
    $moviesContainer.append($moviesHeader);

  } else{
    var $moviesHeader = $('<h2>').html('Select a film');
    var $moviesList = $('<ul/>').addClass('movies-list');

    $moviesContainer.append($moviesHeader, $moviesList);

    _(results).each(function(result) {
      var title = result.Title;
      var imdbId = result.imdbID;

      var $movie = $('<li/>').addClass('movie').html($('<a/>').attr('href', imdbId).html(title));
      $moviesList.append($movie);
    });

    $('.movie a').on('click', function (event) {
      event.preventDefault();
      getPoster( $(this).attr('href') );
    });
  };
}

var getPoster = function (imdbId) {

  $('.poster-container').remove();

  var omdbUrl = 'http://www.omdbapi.com/?'

  $.getJSON(omdbUrl, {
    i: imdbId,
    type: 'movie',
    r: 'json'
  }).done( function (result) {
    var $url = result.Poster;

    var $posterContainer = $('<div/>').addClass('poster-container');
    $('.container').append($posterContainer);

    if (result.Poster === 'N/A') {
      var $posterError = $('<p/>').addClass('error').html('Sorry, we can\'t seem to find that poster');
      $posterContainer.append($posterError);

    } else {
      var $poster = $('<img />').addClass('poster').attr('src', $url);
      $posterContainer.append($poster);
    };
  });
}

$(document).ready(function() {
  var buildForm = function () {
    $div = $('<div/>').addClass('form-container');
    $label = $('<label>').attr('for', 'query');
    $input = $('<input>').attr({
      id: 'query',
      name: 'query',
      placeholder: 'Enter a film title'
    });
    $button = $('<button/>').attr('id', 'search').html('Search');

    $('header').append($div);
    $div.append($label, $input, $button);
  };

  buildForm();

  $('#query').on('change', function() {
    $('.movies-container').remove();
    $('.poster-container').remove();
    searchOmdb();
  });
});