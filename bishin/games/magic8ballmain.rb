require 'sinatra'
require 'sinatra/reloader'

$answers=["It is certain...also, I'm hungry", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes","Most likely", "Outlook good","Yes", "Signs point to yes", "Reply hazy try again", "Ask again later...I'm not potty trained and I just had an accident", "Better not tell you now", "Cannot predict now...need puppy treats", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good","Very doubtful"]

get '/' do   
erb :home
end

get '/answer' do
@outcome= $answers[Random.rand(0..20)]
erb :answer
end

