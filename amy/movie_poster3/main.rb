require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'
require 'active_record'


ActiveRecord::Base.logger = Logger.new(STDERR) 
# show sql in the terminal

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3', 
    :database => "movies.db"
)

require_relative 'movie'

# the above two lines establish the connection and load our movie class
# active record lets you map a class to the table without specifying the name of the table


get '/' do
    erb :search
end

get '/results' do

    title = params[:title].gsub(/\s/,'+')

    imdbID = params[:imdbID]

    type = params[:type]

    url = "http://www.omdbapi.com/?s=#{title}"

    raw_data = HTTParty.get url

    movie_options = JSON.parse raw_data

    @movie_options_array = movie_options['Search']


    if movie_options["Error"]
        erb :movie_error
    else

        @movie_options_array = @movie_options_array.select do |movie|
            movie['Type'] == 'movie'
        end

        if @movie_options_array.length == 1
            redirect to("/poster?id=#{@movie_options_array[0]['imdbID']}")
        else
            erb :results
        end
    end
end


get '/poster' do

@movie = Movie.find_by(:imdbID => params[:id])

    if @movie

        if @movie.poster == "N/A"
            erb :poster_error
        else
            @image_url = @movie.poster
            erb :poster
        end

    else

        id = params[:id]

        url = "http://www.omdbapi.com/?i=#{id}" 

        raw_data = HTTParty.get url

        movie_data = JSON.parse raw_data

        @image_url = movie_data['Poster']


        if movie_data['Poster'] == "N/A"
            erb :poster_error
        else

            movie = Movie.new
            movie.title = movie_data['Title']
            movie.imdbID = movie_data['imdbID']
            movie.poster = movie_data['Poster']
            movie.response = movie_data['Response']
            movie.save

            erb :poster

        end
        
    end

end


get '/pry' do
    binding.pry
end


