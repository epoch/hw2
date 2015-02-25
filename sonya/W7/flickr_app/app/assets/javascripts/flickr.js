$(document).ready(function(){
  // SEARCH
  $('#search').on('click', searchFlickr);
  $('#query').on('keypress', function(event){
    if(event.which !== 13){
      return;
    } 
    searchFlickr();
  });

  // CLEAR
  $('#clear').on('click', clearPhotos);

  // CONTROL SCROLL
  $(window).on('scroll', _.throttle(lateLoad, 250));
});

// FLICKR API 
var searchFlickr = function(event) {
  var query = $('#query').val();

  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';

  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: 'f6741f68e7604ecd65621c682204b14b',
    text: query,
    format: 'json',
    page: currentPage,
  }).done(processImages);
};

// CONTROL LOADING
var requestInProgress = false;
var currentPage = 1;
var endOfResults = false;

var lateLoad = function (){
  if (requestInProgress || endOfResults){
    return;
  }

  var scrollTop = $(window).scrollTop();
  var docHeight = $(document).height();
  var windowHeight = $(window).height();

  if (scrollTop === docHeight - windowHeight){
    searchFlickr();
  }
};

var clearPhotos = function () {
  currentPage = 1;
  endOfResults = false;
  $('#images').empty();
};

var processImages= function(result){
  requestInProgress = false;
  currentPage += 1;

  if (result.photos.photo.length === 0){
    endOfResults = true;
  }

  if (result.stat != 'ok') {
    return;
  }

// FLICKR URL CREATION
  _(result.photos.photo).each(function(photo){
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

    var $img = $('<img>').attr('src', url).fadeIn('slow');
    $img.appendTo('#images');
  });
};