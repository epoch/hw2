require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/' do  

    erb :select_game

end

get '/throw' do

    erb :throw

end

get '/rock_paper_scissors' do

    weapons = ['rock', 'paper', 'scissors']
    computer_weapon = weapons.sample
    
    if computer_weapon == params[:throw]
        
        @message = "It's a draw!"

        elsif computer_weapon == 'rock' && params[:throw] == 'scissors'

            @message = "You lose!!"

        elsif computer_weapon == 'paper' && params[:throw] == 'scissors'

            @message = "You win!!"

        elsif computer_weapon == 'paper' && params[:throw] == 'rock'

            @message = "You lose!!"

        elsif computer_weapon == 'scissors' && params[:throw] == 'rock'

            @message = "You win!!"

        elsif computer_weapon == 'scissors' && params[:throw] == 'paper'

            @message = "You lose!!"

        else

            @message = "You win!!"
        end

    erb :rock_paper_scissors

end



get '/ball_question' do

    erb :ball_question

end

get '/ball_advice' do

    answers = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes definitely', 'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', 'Dont count on it', 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful' ]

    @advice = answers.sample

    erb :ball_advice

end

get '/secret_number' do

    erb :secret_number

end


get '/number_result' do

    @secret = rand(1...10)
    @guess = params[:number_guess].to_i

    if @guess == @secret
        @message = "You guessed correctly!!!"
    else
        @message = "Sorry, that's not it..."
    end

    erb :number_result

end
