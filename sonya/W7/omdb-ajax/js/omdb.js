// GET AND DISPLAY POSTER
$(document).ready(function () {

  $('#lookup').on('click', function(event){
    event.preventDefault();

    var title = $('#title').val();

    var processMovie = function (movie) {
      var $poster = $('<img>').attr('src', movie.Poster);
      $('#result-poster').html($poster);
    }

    var url = 'http://www.omdbapi.com/';
    $.getJSON(url, {
      t: title
    }).done(processMovie);
  });

});

// GET AND DISPLAY SEARCH RESULTS
$(document).ready(function () {

  $('#lookup').on('click', function(event){
    event.preventDefault();

    var errorWithRequest = function (message) {
      console.log("There is an error!")
    }

    var showResults = function (movie) {
      console.log(movie)
      // debugger;
      // var $movieList = $('<li/>').attr('li', movie.Search);
      var $displayList = $('<ul>')
      var $movieList = movie.Search
      // $('#result-list').append( "<p>Or did you mean...</p>");
      _($movieList).each(function(film){
          var title = film.Title
          var imdbID = film.imdbID
          var $link = $('<li>' + title + '</li>').attr('id', imdbID)
          $displayList.append($link)
      });
      $('#result-list').html($displayList);
      
      // LOOP TITLES & DISPLAY AS <li>


      // showResults();
    }

    var query = $('#title').val();
    var url = 'http://www.omdbapi.com/?';
    $.getJSON(url, {
      s: query,
      type: 'movie',
      r: 'json'
    }).done(showResults).fail(errorWithRequest);
  });

});
