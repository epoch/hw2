require 'sinatra'
require 'sinatra/reloader'
require_relative 'eight_ball'
require_relative 'rock_paper_scissors'

get '/' do
    erb :menu
end

get '/magic_eight_ball' do
    erb :magic_eight_ball
end

get '/eight_ball_result' do
    e_ball = EightBall.new
    @reply = e_ball.shake
    erb :eight_ball_result
end

get '/secret_number' do
    erb :secret_number
end

get '/secret_number_result' do
    @secret_number = rand(1..10).to_s
    if params[:guess] == @secret_number
        erb :correct_guess
    else
        erb :incorrect_guess
    end
end

get '/rock_paper_scissors' do
    erb :rock_paper_scissors
end

get '/rock_paper_scissors_results' do
    rps = RockPaperScissors.new("Human", "Computer")
    @player_hand = params[:hand]
    @comp_hand = rps.generate_hand
    @winning_player = rps.winner(@player_hand, @comp_hand)
    erb :rock_paper_results
end

