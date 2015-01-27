require 'sinatra'
require 'sinatra/reloader'

options=["Rock", "Paper", "Scissors"]
computer_throw=options[Random.rand(1..3)]

get '/' do
    erb :home
end

get '/games/rock_paper_scissors' do
    @throw = params[:throw]
    @computer_throw=computer_throw 
    erb :throw
end
