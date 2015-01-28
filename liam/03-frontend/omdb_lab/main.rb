require 'sinatra'
require 'sinatra/reloader'
require "HTTParty"
require "json"

get '/' do
  erb :search
end

get '/movie' do
  title = params[:title]
  slug = title.downcase.strip.gsub(/\s/, '+')
  url = "http://www.omdbapi.com/?t=#{slug}"
  raw_data = HTTParty.get url
  movie_data = JSON.parse raw_data
  @poster_url = movie_data["Poster"] # "@" turns the variable into an instance variable --> it gives us access to the variable on other views

  if movie_data["Error"] || movie_data["Poster"] == "N/A"
    erb :error
  else
    erb :movie_result
  end
  
end