require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in terminal

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

require_relative 'movie'

# For debugging purposes: visit this URL and pry will open in the terminal
get '/pry' do
  binding.pry
end

get '/' do
  erb :search
end

get '/search' do
  search_keyword = params[:keyword]
  search_slug = search_keyword.downcase.strip.gsub(/\s/, '+')
  search_url = "http://www.omdbapi.com/?s=#{search_slug}"
  raw_search_data = HTTParty.get search_url
  @search_data = JSON.parse raw_search_data

  if search_keyword == ""
    erb :error_search
  elsif @search_data["Response"] == "False"
    erb :error_search
  elsif @search_data["Search"].count == 1
    redirect "/results?id=" + @search_data["Search"][0]["imdbID"]
  else
    erb :search_list
  end
end

get '/results' do

  id = params[:id]

  @movie = Movie.find_by(:imdbID => id)

  if @movie
    erb :movie_result
  else
    movie_url = "http://www.omdbapi.com/?i=#{id}"
    raw_movie_data = HTTParty.get movie_url
    @movie_data = JSON.parse raw_movie_data

    @movie = Movie.new
    @movie.title = @movie_data["Title"]
    @movie.year = @movie_data["Year"]
    @movie.rated = @movie_data["Rated"]
    @movie.released = @movie_data["Released"]
    @movie.runtime = @movie_data["Runtmie"]
    @movie.genre = @movie_data["Genre"]
    @movie.director = @movie_data["Director"]
    @movie.writer = @movie_data["Writer"]
    @movie.actors = @movie_data["Actors"]
    @movie.plot = @movie_data["Plot"]
    @movie.language = @movie_data["Language"]
    @movie.country = @movie_data["Country"]
    @movie.awards = @movie_data["Awards"]
    @movie.poster = @movie_data["Poster"]
    @movie.metascore = @movie_data["Metascore"]
    @movie.imdbRating = @movie_data["imdbRating"]
    @movie.imdbVotes = @movie_data["imdbVotes"]
    @movie.imdbID = @movie_data["imdbID"]
    @movie.category = @movie_data["Type"]
    @movie.response = @movie_data["Response"]

    @movie.save

    erb :movie_result
  end
end

get '/database' do
  @movies = Movie.order(:title)
  erb :index
end