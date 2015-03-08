class MovieController < ApplicationController
    def moviesearch
    end

    def multiple
        url = "http://www.omdbapi.com/?s=#{ params[:title] }"
        raw_data = HTTParty.get url
        
        @movie_data = JSON.parse raw_data
        @movies = @movie_data['Search']

        if @movies == nil
            redirect_to('/movie/error')
        elsif @movies.length == 1
            redirect_to("/movie/result?id=#{ movie['imdbId']}")   
        end
    end

    def movieresult
        url = "http://www.omdbapi.com/?i=#{ params[:id] }"
        raw_data = HTTParty.get url
        
        @movie_data = JSON.parse raw_data
        @poster_image = @movie_data['Poster']
        @director = "Directed by " + @movie_data['Director']
        @year = "Released in " + @movie_data['Year']
        @imdbrating = "IMDB Rating: " + @movie_data['imdbRating']
    end

    def error
        @error = "Are you sure that's the correct title? We can't find that in our records."
    end
end
