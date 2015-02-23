var searchFlickr = function() {
  var query = $('#query').val();

  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';

  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: 'f6741f68e7604ecd65621c682204b14b',
    text: query,
    format: 'json',
  }).done(processImages);
};

var processImages= function(result){
  var photos = result.photos.photo;

  _(photos).each(function(photo){
    var url = [
      'https://farm',
      photo.farm,
      '.staticflickr.com/',
      photo.server,
      '/',
      photo.id,
      '_',
      photo.secret,
      '_q.jpg'
    ].join('');

    var $img = $('<img>').attr('src', url);
    $img.appendTo('#images');
  });
};

$(document).ready(function(){
  $('#search').on('click', searchFlickr);
  $('#query').on('keypress', function(event){
    if(event.which !== 13){
      return;
    } 
    searchFlickr();
  });

  var clearPhotos = function () {
  currentPage = 1; // Reset the page number.
  endOfResults = false;
  $('#images').empty();
};
  $('#clear').on('click', clearPhotos);

});