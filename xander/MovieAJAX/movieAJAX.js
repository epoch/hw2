
$(document).ready(function() {

  $('#search').on('click', function(event) {
    event.preventDefault();
    var $movieTitle = $('#title').val();

    $.ajax({
      url: 'http://www.omdbapi.com/?s=' + $movieTitle,
      method: 'get',
      dataType: 'json',
      success: function(movie){
      
      var $list = movie.Search;
      _.each($list, function(item) {
        var $movieTitle = item.Title;
        var $movieYear = item.Year;
        var $movieID = item.imdbID;

        $('#results-list').append('<li data-id="' + $movieID + '">' + $movieTitle + ', ' + $movieYear + '</li>').attr("class", "movie-list");

        });
      }
    });
  });

  $('.movie-list').on('click', 'li', function(event) {
    event.preventDefault();
    var $imdbID = $(this).attr('data-id');
  // Need to make he list actual links so they can be clicked on and trigger this function.
      $.ajax({
        url: 'http://www.omdbapi.com/?i=' + $imdbID,
        method: 'get',
        dataType: 'json',
        success: function(movie){
             debugger;
          // var $poster = item.Poster;
         
          }

      
        });     
    });
});

