require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :index
end

get '/magic_eight' do
    erb :magic_eight
end


get '/answer' do

    answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
    @answer = answers.shuffle.sample

    erb :answer
end

get '/secret_number' do
    @numbers = [*1..10] 
    erb :secret_number
end

get '/guess/:number' do
    @number = params[:number].to_i
    @controller = Random.rand(1..10).to_i

    erb :guess
end


get '/rock_paper_scissors' do
    gesture = ["rock", "paper", "scissors"]
    @gestures = gesture
    erb :rock_paper_scissors
end

get '/match/:throw' do
    @user_throw = params[:throw]
    @program_throw = @gestures.shuffle.sample

    if @user_throw == "rock" && 
        if @user_throw && (@program_throw == "paper")
            "You lose!"
        elsif @user_throw && (@program_throw == "rock")
            "Draw"
        elsif @user_throw && (@program_throw == "scissors")
            "You win"
        end
    elsif @user_throw == "paper"
        if @user_throw && (@program_throw == "scissors")
            "You lose!"
        elsif @user_throw && (@program_throw == "paper")
            "Draw"
        elsif @user_throw && (@program_throw == "rock")
            "You win"
        end
    elsif @user_throw == "scissors"
        if @user_throw && (@program_throw == "rock")
            "You lose!"
        elsif @user_throw && (@program_throw == "scissors")
            "Draw"
        elsif @user_throw && (@program_throw == "paper")
            "You win"
        end
    end
    erb :match
end
