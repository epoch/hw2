require 'sinatra'
require 'sinatra/reloader'
require 'JSON'
require 'HTTParty'

get '/' do 
    erb :movie
end 


get '/result' do 
    @result = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{ params[:movie] }"))
    erb :result
end 
