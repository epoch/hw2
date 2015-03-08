# to add:
# - make it look pretty
# - re-route to inital solution for one search result

require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  erb :search
end

get '/results' do

  @search_string = params[:search]
  @url = "http://www.omdbapi.com/?s=#{ @search_string }"
  @raw_data = HTTParty.get @url
  @search_results = JSON.parse @raw_data

  if @search_results["Response"] == "False"
    erb :results
  elsif @search_results["Search"].count == 1
    redirect "/movie?id=" + @search_results["Search"][0]["imdbID"]
  else
    erb :results
  end
 # each movie has a unique imdb identifier to tell which films are different


end

get '/movie' do
  # needs to make the imdbID query in this block and then
  # post the info to another erb

  @id = params[:id]
  @id_url = "http://www.omdbapi.com/?i=#{ @id }"
  @raw_data = HTTParty.get @id_url
  @movie_data = JSON.parse @raw_data

  erb :info
end

