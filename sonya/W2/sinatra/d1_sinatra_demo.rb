require 'sinatra'
require 'sinatra/reloader'

# get method with URL 'hello' doing a return of a string
get '/hello' do
	"Hello World from Sinatra"
end

get '/help' do
	"Help"
end

get '/sox' do
	"How you doing on Monday!?!"
end

get '/greeting/:name' do
	# paramas is a hash
	# to access it via the browser localhost:4567/greeting/DT
	"Hello " + params[:name].capitalize
end

get '/greeting/:first/:last' do
	"Hello there #{ params[:first].capitalize } #{ params[:last].upcase }"
end

get '/greeting/:first/:last/:age' do
	"#{ params[:first].capitalize } is #{ params[:age] } years old."
end

################

# Calculator

get '/multiply/:x/:y' do
	result = params[:x].to_f * params[:y].to_f
	"The result is #{ result }"
end



















