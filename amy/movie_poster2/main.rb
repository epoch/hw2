require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'

get '/' do
    erb :movie_poster
end
# this is saying in the event of a get request for this forward slash this is what i want you to do

get '/options' do

    title = params[:title].gsub(/\s/,'+')

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
            erb :options
        end

    end
end

get '/poster' do

    id = params[:id]

    url = "http://www.omdbapi.com/?i=#{id}" 

    raw_data = HTTParty.get url

    movie_data = JSON.parse raw_data

    @image_url = movie_data['Poster']

  
    if movie_data["Poster"] == "N/A"
        erb :poster_error
    else
        erb :poster_displayed
    end

end