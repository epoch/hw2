$(document).ready(function () {

  $('#lookup').on('click', function(event){
    event.preventDefault();

    var title = $('#title').val();

    var processMovie = function (movie) {
      var $poster = $('<img>').attr('src', movie.Poster);
      $('#result').html($poster);
    }

    var url = 'http://www.omdbapi.com/';
    $.getJSON(url, {
      t: title
    }).done(processMovie);
  });

});

