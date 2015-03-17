# Games on Sinatra
# Summary

# Games on Sinatra is a web application with three games

# Magic 8 Ball
# Secret Number
# Rock Paper Scissors
# Magic 8 Ball

# Magic 8 ball takes user's questions and returns an eerily prescient answer.
# Secret Number

# Users click a number between 1 and 10. The controller validates the guess and renders the win or lose view.
# Rock Paper Scissors

# Create a URL in this form: /games/rock_paper_scissors/:throw
# Use params[:throw] as the user's choice (i.e. /games/rock_paper_scissors/rock)
# Compare the 2!
# Extensions

# Styling
# Rock Paper Scissors Lizard Spock


require 'sinatra'
# require 'sinatra/reloader'

get '/' do 
    erb :games
end 


get '/magic' do 
    erb :magic
end 


get '/magicanswer' do 
    array = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes definitely', 'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', 'Do not count on it', 'My reply is no', 'My sources say now', 'Outlook not so good', 'Very doubtful']
    @magic = array.shuffle.sample
    erb :magicanswer
end 


get '/secret' do
    erb :secret
end 


get '/secretanswer' do 
    @computer = rand(1..10)
    @x = params[:info].to_i

    if @x ==  @computer
        erb :secretwin
    else
        erb :secretlose              
    end
end 


get '/secretwin' do 
    erb :secretwin
end 


get '/secretlose' do 
    erb :secretlose
end 

get '/rock' do 
    erb :rock
end 

get '/rocklose' do 
    erb :rocklose
end 

get '/rockwin' do 
    erb :rockwin 
end 

get '/rocktie' do 
    erb :rocktie
end 

get '/rockanswer' do 
    array = ['rock', 'paper', 'scissors']
    @computer = array.shuffle.sample
    @x = params[:info]

    if @x == @computer
        erb :rocktie
    elsif (@x == 'rock' && @computer == 'scissors') || (@x == 'paper' && @computer == 'rock') || (@x == 'scissors' && @computer == 'paper')
        erb :rockwin
    else
        erb :rocklose        
    end
end 

get '/message' do 
    erb :message
end 































