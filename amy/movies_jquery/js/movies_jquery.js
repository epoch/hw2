console.log('hello', $.fn.jquery);

$(document).ready(function(){

    var buildForm = function(){
        $div = $('<div/>').addClass('form').appendTo('.container');
        $input = $('<input>').attr({
        id: 'query',
        name: 'query',
        placeholder: 'Search movie poster'
        }).appendTo('.form');

        $button = $('<button/>').addClass('search').html('Search').appendTo('.form');
    };
    buildForm();

    var searchOMDB = function(){
        console.log('search button clicked');

        var query = $('#query').val();

        var OMDBUrl = 'http://www.omdbapi.com/?'

        $.getJSON(OMDBUrl, {
            s: query,
            r: 'json',
            type: 'movie'
        }).done(showResults);

    }

    var showResults = function(result){

        var results = result.Search;

        var $moviesContainer = $('<div/>').addClass('movies-container').appendTo('.container');
        var $moviesList = $('<ul/>').addClass('movies-list').appendTo('.movies-container');

        _(results).each(function(result){

            var title = result.Title;

            // var posterURL = result.Poster

            var url = result.imdbID;

            var $movie = $('<li><a href='+ url +'>'+ title +'</a></li>' );

            $movie.addClass('movie').appendTo($moviesList);


            // debugger;
        });


        $('.movie a').on('click', function(event){
            event.preventDefault();
            // dont treat this as a link
            getPoster($(this).attr('href'));
            // when they clikc on movie a, into getPoster, pass in the href
        });

    }

    var getPoster = function(url){

        console.log(url);
        console.log('getting poster');

        // i = url

        // var href = $('.movie a').attr('href');

        // var index = href.indexOf("=");

        // var movieID = url.slice(index + 1);


        // var query = $('#query').val();

        var OMDBUrl = 'http://www.omdbapi.com/?'

        $.getJSON(OMDBUrl, {
            i: url,
            r: 'json',
            type: 'movie'
        }).done(showPoster);


    }

    var showPoster = function(result){

        console.log("showing poster");
        
        var posterURL = result.Poster;
        var $postersContainer = $('<div/>').addClass('posters-container').appendTo('.container');
        var $singlePoster = $('<img/>').addClass('single-poster').attr("src", posterURL).appendTo('.posters-container');
        

    }

    $('.search').on('click', searchOMDB);


});


    //     var $a = $('<a class="image-link"></a>').attr('href', flickrURL);
    //     var $img = $('<img>').attr('src', url);
    //     $img.appendTo($a);
    //     $a.appendTo('#images');
    //     // console.log($a)
    //     // console.log

    //     // cant clear my val here because it breaks the load more photos
    //     // $('#query').val('').focus();
    //     // sets the value to nothing and focuses on the input


    // });

