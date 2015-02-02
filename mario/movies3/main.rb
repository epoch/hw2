require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'movies.db'
)

require_relative 'movie'

get '/' do
    erb :search
end

get '/pry' do
    binding.pry
    redirect "/"
end

after do
    ActiveRecord::Base.connection.close
end

get '/process' do
    movie, year = params[:query], params[:year]
    url = "http://omdbapi.com/?s=#{ movie }&y=#{ year }"
    raw_data = HTTParty.get url
    parsed_data = JSON.parse raw_data
    @search_results = parsed_data["Search"]
    if parsed_data['Error']
        puts parsed_data['Error']
        erb :error
    elsif @search_results.size == 1
        imdbid = @search_results[0]["imdbID"]
        redirect "/get_poster/#{ imdbid }"
    else
        erb :search_results
    end
end

get '/get_poster/:imdbid' do
    movie = Movie.find_by(id: params[:imdbid])
    if movie
        display_movie(movie)
    else
        fetch_movie(params[:imdbid])
    end
end

def display_movie(movie)
    @movie = movie
    erb :result
end

def fetch_movie(imdbid)
    movie_data = data_from_omdb(imdbid)
    if movie_data['Error']
        erb :error
    else
        create_record(movie_data)
    end
end

def data_from_omdb(imdbid)
    url = "http://omdbapi.com/?i=#{ imdbid }"
    raw_data = HTTParty.get url
    movie_data = JSON.parse raw_data
    movie_data
end

def create_record(movie_data)
    movie = Movie.new
    movie.id = movie_data["imdbID"]
    movie.title = movie_data["Title"]   
    movie.year = movie_data["Year"]
    movie.poster = movie_data["Poster"]
    movie.save
    redirect to("/get_poster/#{movie.id}")
end

