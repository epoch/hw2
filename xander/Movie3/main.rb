require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) #Show SQL in terminal.

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'movies.db'
)

require_relative 'movie'

after do
    ActiveRecord::Base.connection.close
end

get '/pry' do 
    binding.pry
end

get '/' do  
    erb :forms
end

get '/multiple' do
    url = "http://www.omdbapi.com/?s=#{ params[:title] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    @movies = @movie_data['Search']
    if @movies == nil
        redirect '/error'
    elsif
        @movies.length == 1
        redirect "/single_result?title=#{params[:title]}"    
    end
    erb :multiple
end

get '/result' do
    url = "http://www.omdbapi.com/?i=#{ params[:id] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    @title = @movie_data['Title']
    @poster_image = @movie_data['Poster']
    @director = "Directed by " + @movie_data['Director']
    @year = "Released in " + @movie_data['Year']
    @imdbrating = "IMDB Rating: " + @movie_data['imdbRating']

    if 
        Movie.find_by(:imdbID => params[:id])
        erb :result
    end

    movie = Movie.new
    movie.title = @title
    movie.director = @movie_data['Director']
    movie.poster = @poster_image
    movie.imdbrating = @movie_data['imdbRating']
    movie.imdbid = params[:id]
    movie.save

    erb :result
end

get '/single_result' do 
    url = "http://www.omdbapi.com/?t=#{ params[:title] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    @title = @movie_data['Title']
    @poster_image = @movie_data['Poster']
    @director = "Directed by " + @movie_data['Director']
    @year = "Released in " + @movie_data['Year']
    @imdbrating = "IMDB Rating: " + @movie_data['imdbRating']

    if 
        Movie.find_by(:imdbID => params[:id])
        erb :single_result
    end

    movie = Movie.new
    movie.title = @title
    movie.director = @movie_data['Director']
    movie.poster = @poster_image
    movie.imdbrating = @movie_data['imdbRating']
    movie.imdbid = params[:id]
    movie.save

    erb :single_result
end

get '/error' do
    @error = "That movie sleeps with the fishes. Try again..."
    erb :error
end

