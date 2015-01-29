# encoding: UTF-8
require "sinatra"
require "sinatra/reloader"
require "httparty"
require "omdbapi"
require "sqlite3"
require "active_record"
require "pry"

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal.

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "movies.db"
)

require_relative "movies"

after do
  ActiveRecord::Base.connection.close
end

get "/pry" do
  binding.pry
  redirect "/"
end

get "/" do
  if params[:movie] == nil
    movie = @movie_data = @results = @title = @year = @poster = @plot = @imdb_id = nil
    erb :lookup
  else
    movie = params[:movie]
    @movie_data = OMDB.title(movie)
    @results = OMDB.search(movie)

    unless @movie_data.response == "False"
      @title = @movie_data.title
      @year = @movie_data.year
      @poster = @movie_data.poster
      @plot = @movie_data.plot
      @imdb_id = @movie_data.imdb_id
    end

    erb :lookup
  end
end

def save_movie
  unless Movies.find_by(imdbID: @imdb_id)
    @save_movie = Movies.new
    @save_movie.title = @title
    @save_movie.year = @year
    @save_movie.poster = @poster
    @save_movie.plot = @plot
    @save_movie.imdbID = @imdb_id
    @save_movie.save
  end
end

def read_movie(movie)
  movie = Movies.find_by(title: @title, year: @year, poster: @poster, plot: @plot)
  @movie = movie
end
