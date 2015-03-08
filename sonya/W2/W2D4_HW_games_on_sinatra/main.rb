require 'sinatra'
require 'sinatra/reloader'

# LANDING PAGE

get '/' do
   erb :games
end

# MAGIC 8 BALL

get '/magic' do

@magic = ['404 page not found', 'Yes', 'Unless he\'s focking your sister, don\'t worry about it', 'No', '404 page not found', 'Try Again Later', 'Not a chance in hell', 'Ab-so-focking-lut-ly', 'Fock noes', 'Take a shot of whiskey and ask again', 'The answer is in the bottom of a glass', 'I will pray for you']

@random_answer = @magic.shuffle.sample

    erb :magic
end

# SECRET NUMBER

get '/secret_number' do
    erb :secret_number
end

get '/secret_number_result' do

    @generated_number = Random.rand(1..10).to_s
    if params[:range] == @generated_number
        erb :correct_guess
    else
        erb :incorrect_guess
    end
end

# ROCK PAPER SCISSORS

get '/rock' do
    erb :rock
end

# Rules
# rock beats scissors
# paper beats rock
# scissors beats paper

get '/rock_guess' do
    @rock_paper_scissors = ['rock', 'paper', 'scissors']
    @computer_guess = @rock_paper_scissors.sample
        if params[:rock] == @computer_guess || params[:paper] == @computer_guess || params[:scissors] == @computer_guess
            erb :rock_tie
        elsif (params[:rock] && @computer_guess == 'scissors') || (params[:scissors] && @computer_guess == 'paper') || (params[:paper] && @computer_guess == 'rock')
            erb :rock_user_win
        else
            erb :rock_comp_win
        end
end