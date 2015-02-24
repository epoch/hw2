$(document).ready(function () {

  var movieTitle = "true lies";
  var searchSlug = movieTitle.split(' ').join('+');
  var searchString = 'http://www.omdbapi.com/?t=' + searchSlug + '&plot=short&r=json';

  $.getJSON(searchString).done(function (result) {
   console.log(result);
  });

});
