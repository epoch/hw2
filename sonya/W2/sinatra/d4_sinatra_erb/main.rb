require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @groucho = 'excellent'
    @dog = 'https://www.petfinder.com/wp-content/uploads/2012/11/122163343-conditioning-dog-loud-noises-632x475.jpg'
# Adds message to the server log
    puts "Someone accessed the homepage"
    @debug_mode = true
    erb :demo    
end