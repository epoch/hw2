require 'sinatra'
require 'sinatra/reloader'

get '/' do 
    @groucho = 'excellent'
    @cat = 'http://www.zakshow.com/show/cat3.jpg'


    @debug_mode = true 


    erb :demo 
end 