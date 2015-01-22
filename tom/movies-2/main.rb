# to add:
# - make it look pretty
# - display other info
# - query string parameters, pass in other stuff
# - get it working for one word first, then look into multiple

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





 # each movie has a unique imdb identifier to tell which films are different

  erb :results
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

# there needs to be a variable that stores the movie data for
# a particular search result, like in the program before





# it then needs to
# - go through the array of search results
# - list them
# - make them all links which lead to the relevant info page (with posters etc.)
