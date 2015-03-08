require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'pry'

get '/' do
    erb :index
end

get '/options' do
    keyword = params[:keyword]
    url = "http://www.omdbapi.com/?s=#{keyword}"
    raw_data = HTTParty.get url
    search_data = JSON.parse raw_data
    @film_array = search_data['Search']
    if search_data["Error"]
        erb :error
    else
        if @film_array.length == 1
            redirect to("/poster?id=#{@film_array[0]['imdbID']}")
        else
            erb :options
        end
    end
end

get '/poster' do
    film_id = params[:id]
    id_url = "http://www.omdbapi.com/?i=#{film_id}"
    raw_data = HTTParty.get id_url
    film_data = JSON.parse raw_data
    @poster_data = film_data['Poster']
    @released = film_data['Released']
    if film_data['Poster'] == "N/A"
        erb :error
    else
        erb :poster
    end
end

# binding.pry