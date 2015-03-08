require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'
require 'pry'

get '/' do
  erb :games
end

get '/magic-8-ball' do
  magic_question = params[:question].to_s
  question_slug = magic_question.downcase.strip.gsub(/\s/, '+')
  
  if magic_question == ""
    erb :magic_8_ball
  else
    redirect "/magic-8-ball/response?q=" + question_slug
  end
  
end

get '/magic-8-ball/response' do
  magic_response = ['404 page not found', 'Yes', 'Unless he\'s focking your sister, don\'t worry about it', 'No', '404 page not found', 'Try Again Later', 'Not a change in hell', 'Ab-so-focking-lut-ly', 'Fock noes', 'Take a shot of whiskey and ask again', 'The answer is in the bottom of a glass']
  @random_answer = magic_response.shuffle.sample

  erb :magic_8_ball_response
end

get '/secret-number' do
  # @max_guess = params[:max].to_i
  erb :secret_number
end

get '/secret-number/guess' do
  @user_choice = params[:n].to_i
  @secret_number = Random.rand(1..10)

  erb :secret_number_guess
end

get '/rock-paper-scissors' do
  erb :rock_paper_scissors
end

get '/rock-paper-scissors/match' do
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

  erb :rock_paper_scissors_match
end