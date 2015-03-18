require 'sinatra'
require 'sinatra/reloader' # comes with sinatra-contrib 

get '/hello' do 
	"Hello world from Sinatra"
end 

get '/help' do 
	"Hello"
end 

get '/faryar' do 
	"Hello Faryar, have a great day! "
end 

get '/greeting/:name' do
	"Hello " + params[:name].upcase 
end 

get '/greeting/:first/:last' do 
	"Hello there Mr or Ms #{ params[:first] } #{ params[:last].upcase }"
end 

get '/greeting/:first/:last/:age' do 
	"#{ params[:first] } is #{ params[:age] } years old	"
end 

get '/multiply/:x/:y' do 
	result = params[:x].to_f * params[:y].to_f
	"The result is  #{ result }"
end 