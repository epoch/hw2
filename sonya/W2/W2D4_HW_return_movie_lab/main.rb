require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'

get '/' do
    erb :search
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
        redirect "/get_poster?imdbid=#{ imdbid }"
    else
        @search_results
        erb :search_result
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


# imdbid "tt0073195"

