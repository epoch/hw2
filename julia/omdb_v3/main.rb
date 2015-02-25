require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) #Show SQL in the terminal.

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'movies.db'
)

require_relative 'movie'

after do
    ActiveRecord::Base.connection.close
end 

# --- DEBUGGING --- #
get '/pry' do
    binding.pry
end

get '/' do
    erb :index
end

get '/options' do
    keyword = params[:keyword]
    imdbID = params[:imdbID]
    url = "http://www.omdbapi.com/?s=#{keyword}"
    raw_data = HTTParty.get url
    search_data = JSON.parse raw_data
    @film_array = search_data['Search']
    if search_data["Error"]
        erb :error
    else
        @film_array = @film_array.select do |movie|
            movie['Type'] == 'movie'
        end

        if @film_array.length == 1
            redirect to("/poster?id=#{@film_array[0]['imdbID']}")
        else
            erb :options
        end
    end
end

get '/poster' do
    @movie = Movie.find_by(:imdbID => params[:id])

    if @movie
        if @movie.poster == "N/A"
            erb :error
        else
            @image_url = @movie.poster
            erb :poster
        end
        
    else
        film_id = params[:id]
        id_url = "http://www.omdbapi.com/?i=#{film_id}"
        raw_data = HTTParty.get id_url
        movie_data = JSON.parse raw_data

        @image_url = movie_data['Poster']
        
        if movie_data['Poster'] == "N/A"
            erb :error
        else
            movie = Movie.new
            movie.title = movie_data['Title']
            movie.year = movie_data['Year']
            movie.genre = movie_data['Genre']
            movie.director = movie_data['Director']
            movie.actors = movie_data['Actors']
            movie.plot = movie_data['Plot']
            movie.poster = movie_data['Poster']
            movie.imdbid = movie_data['imdbID']
            movie.save
            
            erb :poster
        end

    end

end
