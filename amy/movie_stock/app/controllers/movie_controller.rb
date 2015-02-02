class MovieController < ApplicationController
    def movie
    end

    def options

        title = params[:title].gsub(/\s/,'+')

        url = "http://www.omdbapi.com/?s=#{title}"

        raw_data = HTTParty.get url

        movie_options = JSON.parse raw_data

        @movie_options_array = movie_options['Search']

        if movie_options["Error"]
            render '/movie/movie_error'
        else
            @movie_options_array = @movie_options_array.select do |movie|
                movie['Type'] == 'movie'
            end

            if @movie_options_array.length == 1
                redirect_to("/movie/poster?id=#{@movie_options_array[0]['imdbID']}")
            else
                render '/movie/options'
            end
        end

    end

    def poster

        id = params[:id]

        url = "http://www.omdbapi.com/?i=#{id}" 

        raw_data = HTTParty.get url

        movie_data = JSON.parse raw_data

        @image_url = movie_data['Poster']

      
        if movie_data["Poster"] == "N/A"
            render '/movie/poster_error'
        else
            render '/movie/poster'
        end

    end
end