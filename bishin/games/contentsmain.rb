require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :contents
end

########################################### Magic 8 Ball ###########################################

$answers=["It is certain...also, I'm hungry", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes","Most likely", "Outlook good","Yes", "Signs point to yes", "Reply hazy try again", "Ask again later...I'm not potty trained and I just had an accident", "Better not tell you now", "Cannot predict now...need puppy treats", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good","Very doubtful"]
get '/magic8ballhome' do   
erb :magic8ballhome
end

get '/magic8ballanswer' do
@outcome= $answers[Random.rand(0..20)]
erb :magic8ballanswer
end

########################################### Secret Number ###########################################

number=Random.rand(1..10)

get '/secretnumberhome' do 
    erb :secretnumberhome
end

get '/secretnumberguess' do
    @number=number
    @guess=params[:number_guess]
    erb :secretnumberguess
end

########################################### Secret Number ###########################################
options=["Rock", "Paper", "Scissors"]
computer_throw=options[Random.rand(1..3)]

get '/rockpaperscissorshome' do
    erb :rockpaperscissorshome
end

get '/rockpaperscissorsthrow' do
    @throw = params[:throw]
    @computer_throw=computer_throw 
    erb :rockpaperscissorsthrow
end
