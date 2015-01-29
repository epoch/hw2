require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal

# Define a connection to the DB
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'movies.db'
)

# Require ActiveRecord
require_relative 'movie'

# Close DB connection after every action
after do
    ActiveRecord::Base.connection.close
end

get '/' do
    erb :search
end

get '/pry' do
    binding.pry
end

get '/process' do
    movie = params[:query]
    url = "http://omdbapi.com/?s=#{ movie }"
    raw_data = HTTParty.get url
    parsed_data = JSON.parse raw_data
    @search_results = parsed_data["Search"]
    if parsed_data['Error']
        puts parsed_data['Error']
        erb :error
    elsif @search_results.size == 1
        imdbid = @search_results[0]["imdbid"]
        redirect "/get_poster?imdbid=#{ params[:imdbid] }"
    else
        @search_results
        erb :search_result
    end
end

get '/get_poster' do

    movie = Movie.find_by(imdbid: params[:imdbid])

    if movie
        @movie = movie
        erb :result_db

    else

    url = "http://omdbapi.com/?i=#{ params[:imdbid] }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data

    # adding data to movies.db
    @movie = Movie.new
    @movie.title = @movie_data["Title"]
    @movie.poster = @movie_data["Poster"]
    @movie.imdbid = @movie_data["imdbID"]
    @movie.save
    
    # if @movie_data['Error']
    #     erb :error
    # else
        erb :result
    end
end

# READ
get '/movie' do
    @movies = Movie.where(:genre => params[:name])

    erb :index
end

def db_query(sql)
    db = SQLite3::Database.new "movies.db"
    db.results_as_hash = true

    result = db.execute sql
    db.close
    result
end
