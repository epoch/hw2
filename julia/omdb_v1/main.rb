require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
    erb :index
end

get '/poster' do
    film = params[:film]
    url = "http://www.omdbapi.com/?t=#{film}"
    raw_data = HTTParty.get url
    movie_data = JSON.parse raw_data
    @poster_data = movie_data['Poster']
    @released = movie_data['Released']
    if movie_data["Error"] || movie_data["Poster"] == "N/A"
        erb :error
    else
        erb :poster
    end
end
