#skeleton
require 'HTTParty'
require 'JSON'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :home
end
    
get '/result' do
    @title = params[:movie_name] 
    @url = "http://omdbapi.com/?t=#{@title}"
    @raw_data=HTTParty.get @url
    @movie_data=JSON.parse @raw_data
    $awards=@movie_data["Awards"].split(' ') if @movie_data["Awards"]
    erb :result
end