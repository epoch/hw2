require "sinatra"
require "sinatra/reloader"
require "httparty"
require "Json"


get '/' do 
    erb :forms
end

get '/result/:name' do
    @name = params[:name]
    url = "http://www.omdbapi.com/?t=#{@name}"
    raw_date = HTTParty.get(url)
    movie_date=JSON.parse raw_date
    @poster = movie_date['Poster']
    erb :result
end

get '/lists' do
    @title = params[:title]
    url = "http://www.omdbapi.com/?s=#{@title}"
    raw_date = HTTParty.get(url)
    movie_date=JSON.parse raw_date
    @array = movie_date['Search']
    if movie_date['Response'] == 'False'
        erb :error 
    elsif @array.count == 1 
        redirect to("/result/#{@array[0]['Title'].gsub(' ', '+')}") 
    else
        erb :lists
    end
end






