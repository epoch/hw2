// console.log('hello world', $.fn.jquery);
var current_page = 1;
var endOfImages = false;

var searchFlickr = function() {

    if (endOfImages === true) {
        return; // Abort!
    }

    var query = $('#query').val();
    // get the query

    var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    // explains to js that this is where you need to go and request this information from

    $.getJSON(flickrUrl, {
        method: 'flickr.photos.search',
        api_key: 'b47d91403359ea157efabefedc9e5508',
        text: query,
        page: current_page++,
        format: 'json'

    }).done(processImages);


    // we are searching for photos
    // we are providing the api key 
    // the text will have the value of query,
    // so if they search for butterlfies it will know 
    // the format we get the data back in is json 
    // all of these pieces of data will appear at the end of the url after 
    // json call back 

    // hey jquery make some request for me to a url and this is the information 
    // im giving you 
    // we are making a get request

    // when you are done, run this function for me 
    // the only place that the results data is going to exist is inside the done function
    // when you're not insude the done function, it's not done, it hasnt happened yet

    // you have to be able to make the request properly, and then know how to handle it
    // with the .done function

    // jsonP lets you get data from a different website, not your own website 

};

var processImages = function(result){

    // $('#images').empty();
    var photos = result.photos.photo;

    // debugger;
    
    // var photoId = 

    // vvar userId = 

    // current_page = result.photos.page;

    // page ++
    // console.log(page);

    if (current_page > result.photos.pages) {
        endOfImages = true;
    }

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

        var flickrURL = [
            'https://www.flickr.com/photos/',
            photo.owner,
            '/',
            photo.id
        ].join('');

    // https://www.flickr.com/photos/{user-id}/{photo-id}

        var $a = $('<a class="image-link"></a>').attr('href', flickrURL);
        var $img = $('<img>').attr('src', url);
        $img.appendTo($a);
        $a.appendTo('#images');
        // console.log($a)
        // console.log

        // cant clear my val here because it breaks the load more photos
        // $('#query').val('').focus();
        // sets the value to nothing and focuses on the input


    });
};


// var searchFlickrAgain = function(result){
    
//     if (endOfImages === true) {
//         return; // Abort!
//     }

//     var query = $('#query').val();
//     // get the query
//     console.log(current_page);
//     current_page++;
//     var flickrUrl = 'https://api.flickr.com/services/rest/?jsoncallback=?';
//     // explains to js that this is where you need to go and request this information from

//     $.getJSON(flickrUrl, {
//         method: 'flickr.photos.search',
//         api_key: 'b47d91403359ea157efabefedc9e5508',
//         text: query,
//         page: current_page,
//         format: 'json'

//     }).done(processImages);
// }

var loadMoreImages = function(result) {
    
    // console.log("scroll function working");

    // var current_page = result.photos.page; 

    var documentHeight = $(document).height();
    // console.log(documentHeight);

    var windowHeight = $(window).height();

    var scrollTop = $(window).scrollTop();
    // console.log(scrollTop);

    if(windowHeight + scrollTop === documentHeight){
        console.log("bottom of page reached");

        searchFlickr();

    };

}

// you can log result in console to return the object
// you can run result.photos in console to return another object
// result.photos.photo is where my actual data is - this returns my array of objects

$(document).ready(function(){

    $('#search').on('click', searchFlickr);

    $('#query').on('keypress', function(){
        if(event.which != 13){
            return;
            // ignore any key presses that are not flickr
        }
        searchFlickr();
        // console.log(event);
    });

    $('#clear').on('click', function(){
        $('#images').empty();
    });

    $('#query').on('change', function () {
        endOfImages = false;
    });

    $(window).on('scroll', loadMoreImages);

});

// photos[]

// in the console to generate the photo url

// var photo = result.photos.photo[0]
// undefined
// photo.farm
// 9
// photo.server
// "8668"
//     var url = [
//       'https://farm',
//       photo.farm,
//       '.staticflickr.com/',
//       photo.server,
//       '/',
//       photo.id,
//       '_',
//       photo.secret,
//       '_q.jpg'
//     ].join('');
    
// undefined
// url
// "https://farm9.staticflickr.com/8668/16618579871_ed5e8d63fc_q.jpg"


// we take the users search parameters

// we send them off to flickr

// we find the array that we care about

// by typing result and getting to result.photos.photo

// for each photo obejct, i want to turn it into just a nice clean single url


// to do:

// infinite scrolling
// clear out search when new search is entered
// link each image to the flickr image or the original size of the image 

// has the user reached the bottom of screen

// if they have, load more photos

// window.scroll

// when the window scrolls

// go and do something for me

// then we need toc heck how far we have scrolls

// there is somethign called th e scroll top

// that tells you how far you have scrolled

// it is a jquery method

// we have to do some maths wit the window height, versus the document height 

// have we scrolled so far that we are nearing the bottom of the document?

// using the total size of the page, the size of the window, and how much we have alreadys crolls past
// you can work out how near you are to the bottom of thw window
// and that is the point that you go and get more





// $(document).height()

// $(window).height()

// $(window).scrollTop()



// $(window).on('scroll', function(){
//     console.log('scroll fired');
// })

// when you get to the bottom, make one request then stop for a while
// an underscore method called throttle

// which might help you with that

// it stops something from happening too often

// throttle this function for me so i only call it once every x seconds

// result.photos tells you whcih page you are on
// page 1

// so in the next request you could say page: currentPage++

// firstly

// dont make the second request until the first one comes back
// see the first 500 then the next 500 then the following 500 as you scroll through them













