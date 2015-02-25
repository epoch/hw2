$(document).ready(function () {
  var search = function () {
    $('#title').text('AJAX Poster Search');
    $('#title').removeClass('animated rotateIn');
    var $searchVal = $('#query').val();
    var queryURL = 'http://www.omdbapi.com/';

    $.getJSON(queryURL, {
      s: $searchVal
    }).done(searchResults);
  };

  var searchResults = function (result) {
    if (result.Response === "False") {
      $('#info-box').empty();
      $('#search-results').empty();
      $error = $("<p>Sorry, that film doesn't exist</p>");
      $error.appendTo('#search-results');
      return;
    }

    var array = result.Search;

    if (array.length === 1) {
      singleMovie();
    } else {
      $('#info-box').empty();
      $('#search-results').empty();

      $.each(array, function (i) {
        var $link = $('<a>' + array[i].Title + '</a>');
        // rather than make up a new attr to store the ID, you can just use preventDefault in the event
        // so that the link doesn't try to take you somewhere
        $link.attr('imdb', array[i].imdbID);
        $link.attr('href', '#'); // makes it look like a link, doesn't point anywhere
        $link.addClass('result');
        var $p = $('<p/>');
        $link.appendTo($p);
        $p.appendTo('#search-results');
        $('#search-results').addClass('animated rollIn');
      });
    };

    $('a.result').click(function () {
      $('#search-results').addClass('rollOut');
      $('#search-results').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $('#search-results').empty();
        $('#search-results').removeClass('animated rollOut rollIn');
        $('#info-box').removeClass('animated fadeIn'); // means that the fadeIn effect can be added next time round
      });

      var imdbID = $(this).attr('imdb');
      var queryURL = 'http://www.omdbapi.com/';

      // runs a search using the selected films imdbID
      $.getJSON(queryURL, {
        i: imdbID
      }).done(processData);
    });
  };

  var singleMovie = function () {
    var $searchVal = $('#query').val();
    var queryURL = 'http://www.omdbapi.com/';

    $.getJSON(queryURL, {
      t: $searchVal,
      y: '',
      plot: 'short',
      r: 'json'
    }).done(processData);
  };

  var processData = function (result) {
    $('#info-box').addClass('animated fadeIn');
    $('#search-results').empty();
    $('#info-box').empty();
    var $title = $('<p><b>' + result.Title + '</b>, ' + result.Director + ', ' + result.Year + '</p>');
    var $poster = $('<img>');
    $poster.attr('src', result.Poster);
    $title.appendTo('#info-box');
    $poster.appendTo('#info-box');

    $('#title').text('Search again?');
    $('#title').addClass('animated rotateIn');
  };

  $('#search').click(search);

  $('#query').on('keypress', function(event) {
    if (event.which !== 13) {
      return;
    }
    search();
  });
});

// animation for rollIn when searching after results have been displayed (and one hasn't been selected)
// fade out for info-box
// needs a no poster error
