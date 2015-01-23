#skeleton
require 'HTTParty'
require 'JSON'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :home
end

get'/options' do
    @title = params[:movie_name]
    @multi_url = "http://omdbapi.com/?s=#{@title}"
    @multi_raw_data = HTTParty.get @multi_url
    @multi_movie_data= JSON.parse @multi_raw_data

    if @multi_movie_data["Search"].length == 1
        redirect to("/result?movie_name=#{@title}")
    else
        erb :options
    end

end
    
get '/result' do
    @title = params[:movie_name] 
    @url = "http://omdbapi.com/?t=#{@title}"
    @raw_data=HTTParty.get @url
    @movie_data=JSON.parse @raw_data
    $awards=@movie_data["Awards"].split(' ') if @movie_data["Awards"]

    @multi_url = "http://omdbapi.com/?s=#{@title}"
    @multi_raw_data = HTTParty.get @multi_url
    @multi_movie_data= JSON.parse @multi_raw_data
    
    erb :result
end