# encoding: UTF-8
require "sinatra"
require "sinatra/reloader"
require "httparty"
require "omdbapi"

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
