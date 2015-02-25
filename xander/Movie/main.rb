require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'


get '/' do  
    erb :forms
end

get '/request' do

    url = "http://www.omdbapi.com/?t=#{ params[:title] }"
    raw_data = HTTParty.get url
    movie_data = JSON.parse raw_data
    
    if movie_data['Response'] == "True"   
        @poster_image = movie_data['Poster']
        @director = "Directed by " + movie_data['Director']
        @year = "Released in " + movie_data['Year']
        @imdbrating = "IMDB Rating: " + movie_data['imdbRating']
    else
        @error = "That movie sleeps with the fishes. Try again..."
    end
    erb :request
end


