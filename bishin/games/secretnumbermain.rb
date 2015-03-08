require 'sinatra'
require 'sinatra/reloader'

number=Random.rand(1..10)

get '/' do 
    erb :home
end

get '/guess' do
    @number=number
    @guess=params[:number_guess]
    erb :guess
end
