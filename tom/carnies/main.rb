require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :home
end

get '/8_ball' do
  erb :magic_ball
end

get '/prediction' do
  @answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

  @get_answer = @answers.sample(1).join

  erb :answer
end

get '/secret_number' do
  erb :secret_number
end


get '/guess' do
  @user_choice = params[:n]
  @secret_number = Random.rand(1..10)

  erb :guess
end

get '/rock_paper_scissors' do
  erb :rock_paper_scissors
end

get '/match' do
  @user_move = params[:throw]
  @comp_options =["rock", "paper", "scissors"]
  @comp_move = @comp_options.sample(1).join

  @scoring = {
    "rock" => {"rock" => 1, "paper" => 2, "scissors" => 0},
    "paper" => {"rock" => 0, "paper" => 1, "scissors" => 2},
    "scissors" => {"rock" => 2, "paper" => 0, "scissors" => 1}
  }

  @user_score = @scoring[@user_move][@user_move]
  @comp_score = @scoring[@user_move][@comp_move]

  erb :match
end