require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :search
end

get '/process' do
    movie, year = params[:query], params[:year]
    url = "http://omdbapi.com/?t=#{ movie }&y=#{ year }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    if @movie_data['Error']
        erb :error
    else
        erb :result
    end
end