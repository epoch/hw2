var nextPage = 1;
var endOfImages = false;
var requestInProgress = false;

var searchFlickr = function () {
  
  if (endOfImages === true) {
    return; // Abort Abort!
  }

  var query = $('#query').val();

  if (query === "") {
    return;
  }

  var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';

  $.getJSON(flickrUrl, {
    method: 'flickr.photos.search',
    api_key: '55c28eb3e4c67900d6e2079d49ff78a9',
    text: query,
    format: 'json',
    page: nextPage++,
    per_page: 100,
  }).done(processImages);
};

var processImages = function(result) {

  var photos = result.photos.photo;
  
  if (nextPage > result.photos.pages) {
    endOfImages = true;
  }

  _(photos).each(function (photo) {
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

$(document).ready(function () {
  $('#search').on('click', searchFlickr);

  $('#query').on('change', function () {
    endOfImages = false;
    nextPage = 1;
    console.log("Change");
    searchFlickr();
  });

  // Infinite scroll

  function loadMore(){
    if($(window).scrollTop() + $(window).height() > $(document).height() - 400) {
      searchFlickr();
      console.log(nextPage);
    }
  }

  var debounceSearch = _.debounce(loadMore, 1000)
  $(window).scroll(debounceSearch);

});