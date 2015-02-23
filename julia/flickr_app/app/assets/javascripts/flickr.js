var currentPage = 1;

var searchFlickr = function () {
  var query = $('#query').val();

  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';

  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: '91f6c3c48aab375f9d9bd1fba944128f',
    text: query,
    format: 'json',
    page: currentPage
  }).done(processImages)
};


var loadMoreImages = function () {
  var query = $('#query').val();
  currentPage++;
  console.log(currentPage);
  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';

  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: '91f6c3c48aab375f9d9bd1fba944128f',
    text: query,
    format: 'json',
    page: currentPage
  }).done(processImages)
};

var processImages = function(result) {
  var photos = result.photos.photo;

  _(photos).each(function(photo) {
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

$(document).ready(function() {
  $('#search').on('click', searchFlickr);

  $('#query').on('keypress', function(event) {
    if (event.which !== 13) {
      return;
    }
    searchFlickr();
  });

  $('#clear').on('click', function() {
    $('#images').empty();
  })

  $(window).on('scroll', function() {
    var $documentHeight = $(document).height();
    var $windowHeight = $(window).height();
    var $scrollTop = $(document).scrollTop();

    if ($windowHeight + $scrollTop === $documentHeight) {
      loadMoreImages();
    };
  });
});