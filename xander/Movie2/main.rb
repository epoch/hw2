require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'

get '/' do  
    erb :forms
end

get '/multiple' do

    url = "http://www.omdbapi.com/?s=#{ params[:title] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    @movies = @movie_data['Search']

    if @movies == nil

        redirect '/error'

    elsif

        @movies.length == 1

        redirect '/single_result'    

    end

    erb :multiple

end

get '/result' do

    url = "http://www.omdbapi.com/?i=#{ params[:id] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data

    @poster_image = @movie_data['Poster']
    @director = "Directed by " + @movie_data['Director']
    @year = "Released in " + @movie_data['Year']
    @imdbrating = "IMDB Rating: " + @movie_data['imdbRating']
    
        erb :result

end

get '/single_result' do 

    url = "http://www.omdbapi.com/?t=#{ params[:title] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
binding.pry
    @poster_image = @movie_data['Poster']
    @director = "Directed by " + @movie_data['Director']
    @year = "Released in " + @movie_data['Year']
    @imdbrating = "IMDB Rating: " + @movie_data['imdbRating']

    erb :single_result
end



get '/error' do

    @error = "Are you sure that's the correct title? We can't find that in our records."

    erb :error

end

