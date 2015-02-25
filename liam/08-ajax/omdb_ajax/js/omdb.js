var searchOMDB = function () {
  var search = $('#query').val();

  if (search === "") {
    return;
  };

  var omdbUrl = 'http://www.omdbapi.com/?';

  $.getJSON(omdbUrl, {
    s: search,
    type: "movie",
  }).done(showSearchResults);
}

var showSearchResults = function (result) {
  clearSearchResults();
  clearMovie();
  clearErrors();

  var searchResults = result.Search;
  var $searchList = $('.search_container');

  if(result.Error){ // If there are no results, show noMovieError
    noMovieError();
  } else if(searchResults.length === 1){ // If there is only one result, show poster straight away
    var movieResult = searchResults[0];
    var movieID = movieResult.imdbID;
    requestMovie(movieID);
    abort()
  } else { // Othersie, show all searchResults
    _(searchResults).each(function(movie){
      var movieTitle = movie.Title;
      var movieYear = movie.Year;
      var movieID = movie.imdbID;
      var $movie = $('<li><a href='+ movieID +'>'+ movieTitle + ', ' + movieYear + '</a></li>' );
      $movie.addClass('movie').appendTo($searchList);
    });

    $('.movie a').on('click', function(event){
      event.preventDefault();
      clearMovie();
      requestMovie($(this).attr('href')); // when they click on movie a, pass the href into requestMovie
    });
  }
}

var requestMovie = function (movieID) {
  clearMovie();
  clearErrors();

  var omdbUrl = 'http://www.omdbapi.com/?';

  $.getJSON(omdbUrl, {
    i: movieID,
    type: "movie",
  }).done(showMovie);
}

var showMovie = function (result) {
  var movieData = result;
  var movieTitle = movieData.Title;
  var movieYear = movieData.Year;
  var moviePoster = movieData.Poster;

  // Check if moviePoster exists

  if(moviePoster === "N/A"){
    noPosterError();
    var displayResult = "<h2 class=search_result>" + movieTitle + ", " + movieYear + "</h2>";
  }else{
    var displayResult = "<h2 class=search_result>" + movieTitle + ", " + movieYear + "</h2>" + "<img src=" + moviePoster + ">";
  }

  var $movieResult = $('.movie_container');
  $movieResult.append(displayResult);
}

// Error handling

var noMovieError = function(){
  var $errorContainer = $('.error_container');
  var $errorMsg = $('<em/>').addClass('error-msg').html("No movie by that name");
  $errorContainer.append($errorMsg);
};

var noPosterError = function(){
  var $errorContainer = $('.error_container');
  var $errorMsg = $('<em/>').addClass('error-msg').html("No poster for that movie.");
  $errorContainer.append($errorMsg);
};

// Clearing containers

var clearSearchResults = function(){
  $('.search_container').empty();
  // console.log("clearing search results");
};

var clearMovie = function(){
  $('.movie_container').empty();
  // console.log("clearing movie data");
};

clearErrors = function(){
  $('.error_container').empty();
  // console.log('clearing errors');
};

// Run searchOMDB when document is ready, and upon click or change to query

$(document).ready(function () {
  $('#search').on('click', searchOMDB);

  $('#query').on('change', function () {
    searchOMDB();
  });
});