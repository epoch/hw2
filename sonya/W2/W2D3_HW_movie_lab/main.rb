require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'

get '/movie' do

@title = params[:movie_title]
movie_data = HTTParty.get("http://www.omdbapi.com/?t=#{ @title }")
@movie_data = JSON.parse movie_data

    erb :movie
end