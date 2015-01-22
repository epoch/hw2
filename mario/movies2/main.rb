require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :search
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
        redirect "/get_poster?imdbid=#{ imdbid }"
    else
        @search_results
        erb :search_results
    end
end

get '/get_poster' do
    imdbid = params[:imdbid]
    url = "http://omdbapi.com/?i=#{ imdbid }"
    raw_data = HTTParty.get url
    @movie_data = JSON.parse raw_data
    if @movie_data['Error']
        erb :error
    else
        erb :result
    end
end