require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'httparty'
require 'json'
require 'pry'

require_relative 'movie'

ActiveRecord::Base.logger = Logger.new(STDERR) # show SQL in the terminal.

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

after do
  # ensures that we don't run out of connections (works like db.close)
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :search
end

####### Search Results ########

get '/results' do
  @search_string = params[:search]
  @url = "http://www.omdbapi.com/?s=#{ @search_string }"
  @raw_data = HTTParty.get @url
  @search_results = JSON.parse @raw_data

  if @search_results["Response"] == "False"
    erb :results
  elsif @search_results["Search"].count == 1
    redirect "/movie?imdb=" + @search_results["Search"][0]["imdbID"]
  else
    erb :results
  end
end

##### Info Page w/ Poster #####

get '/movie' do
  # checks to see if it the film is already in the db
  movie = Movie.find_by(imdb_id: params[:imdb])

  # if it's in the db
  if movie
    # store it in @movie so it can be retrieved from the db in the view
    @movie = movie
    erb :info

  # if it isn't, make a request to omdb and store the result in a new db entry for next time
  else
    # make id quest and store the data in the db for next time
    @imdb = params[:imdb]
    @id_url = "http://www.omdbapi.com/?i=#{ @imdb }"
    @raw_data = HTTParty.get @id_url
    @movie_data = JSON.parse @raw_data

    movie = Movie.new
    movie.name = @movie_data["Title"]
    movie.poster = @movie_data["Poster"]
    movie.imdb_id = @movie_data["imdbID"]
    movie.save
    erb :info_omdb
  end

  # throws up different views in the event it already exists/has to be made, as the info is accessed in different
  # ways (getter methods, and hash access respectively)
end