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
        clearResults();
        clearPosters();
        clearErrors();
        clearMovieInfo();

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

            var year = result.Year;

            // var posterURL = result.Poster

            var url = result.imdbID;

            var $movie = $('<li><a href='+ url +'>'+ title + ', ' + year + '</a></li>' );

            $movie.addClass('movie').appendTo($moviesList);

        });

        // if no results show no movie error
        // if result.Error === "Movie not found!"
        if(result.Error){
            noMovieError();
            console.log("no movie error called");
        };

        // if one result show poster straight away
        if(results.length === 1){
            // console.log("one result");
            var result = result.Search[0];
            var url = result.imdbID;
            getPoster(url);
        };

        $('.movie a').on('click', function(event){
            event.preventDefault();
            // dont treat this as a link
            clearPosters();
            getPoster($(this).attr('href'));
            // when they clikc on movie a, into getPoster, pass in the href
        });

    }

    var getPoster = function(url){

        console.log(url);
        console.log('getting poster');

        var OMDBUrl = 'http://www.omdbapi.com/?'

        $.getJSON(OMDBUrl, {
            i: url,
            r: 'json',
            type: 'movie'
        }).done(showPoster);
    }

    var showPoster = function(result){

        // debugger;

        clearErrors();
        console.log("showing poster");

        if(result.Poster === "N/A"){
            clearMovieInfo();
            noPosterError();
        }else{
            var posterURL = result.Poster;
            var $resultsContainer = $('<div/>').addClass('results-container').appendTo('.container');
            var $postersContainer = $('<div/>').addClass('posters-container').appendTo('.results-container');
            var $singlePoster = $('<img/>').addClass('single-poster').attr("src", posterURL).appendTo('.posters-container');
            
            showMovieInfo(result);
        }

    };

    var showMovieInfo = function(result){
    
        clearMovieInfo();

        var actors = result.Actors;
        var awards = result.Awards;
        var director = result.Director;
        var genre = result.Genre;
        var plot = result.Plot;
        var rating = result.Rated;
        var imdbScore = result.imdbRating;

        var $movieInfoContainer = $('<div/>').addClass('movie-info-container').appendTo('.results-container');
        var $movieInfoList = $('<ul/>').addClass('movie-info-list').appendTo('.movie-info-container');
        
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Plot: </span>' + plot).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Genre: </span>' + genre).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Rated: </span>' + rating).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Director: </span>' + director).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Actors: </span>' + actors).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">Awards: </span>' + awards).appendTo('.movie-info-list');
        $('<li/>').addClass('movie-info-list-item').html('<span class="info-label">imdb Rating: </span>' + imdbScore).appendTo('.movie-info-list');

    };

    var noMovieError = function(){
        var $errorContainer = $('<div/>').addClass('error-container').appendTo('.container');
        var $errorMsg = $('<p/>').addClass('error-msg').html("No movie by that name").appendTo('.error-container');
    };

    var noPosterError = function(){
        var $errorContainer = $('<div/>').addClass('error-container').appendTo('.container');
        var $errorMsg = $('<p/>').addClass('error-msg').html("No poster for that movie").appendTo('.error-container');
    }

    var clearPosters = function(){
        $('.posters-container').remove();
        console.log("clearing poster");
    };

    var clearMovieInfo = function(){
        $('.movie-info-container').remove();
        console.log("clearing movie info");
    }

    var clearResults = function(){
        $('.movies-container').remove();
        console.log("clearing search results");
    };

    clearErrors = function(){
        $('.error-container').remove();
        console.log('clearing errors');
    };

    $('.search').on('click', searchOMDB);

    $('#query').on('keypress', function(){
        if(event.which != 13){
            return;
            // ignore any key presses that are not flickr
        }
        searchOMDB();
        // console.log(event);
    });

});


