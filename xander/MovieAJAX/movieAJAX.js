
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
        var $entry = $('<li><button>' + $movieTitle + ', ' + $movieYear + '</button></li>').attr("id", $movieID);
        $('#results-list').append($entry);

        });
      }
    });
  });

  $('#results-list').on('click', 'button', function() {
    $('#show-poster').empty();
    var $imdbID = $(this).parent().attr('id');
      $.ajax({
        url: 'http://www.omdbapi.com/?i=' + $imdbID,
        method: 'get',
        dataType: 'json',
        success: function(movie){
             
          var $posterUrl = movie.Poster;
          var $poster = $('<img>').attr('src', $posterUrl);
          $('#show-poster').append($poster);
          $('#results-list').empty();
      }      
    });     
  });
});

