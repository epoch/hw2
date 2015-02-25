require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal.

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'pastries.db'
)

require_relative 'pastry'

before do
  @flavours = Pastry.select(:flavour).uniq

  @rating_options = { 0 => "Call an ambulance.", 1 => "Anyone have a bucket?", 2 => "Meh. It's fuel.", 3 => "Pretty damn tasty", 4 => "I would maim someone for another one", 5 => "This is my O-face"}

end

after do
  ActiveRecord::Base.connection.close
end

get '/pry' do 
    binding.pry
end

get '/' do
    erb :home
end

get '/pastries' do 
    @pastries = Pastry.all.order(:snack)
    erb :index
end

get '/pastries/flavour/:flavour' do
    @pastries = Pastry.where(:flavour => params[:flavour])
    erb :index
end


get '/pastries/new' do 
    erb :new
end

post '/pastries' do
    pastry = Pastry.new
    pastry.snack = params[:snack]
    pastry.flavour = params[:flavour]
    pastry.comment = params[:comment]
    pastry.rating = params[:rating]

    pastry.save

    redirect to('/pastries')
end

get '/pastries/:id' do 
    @pastry = Pastry.find params[:id]
    erb :show
end

get '/pastries/:id/delete' do
    pastry = Pastry.find params[:id]
    pastry.destroy
    redirect to('/pastries')
end

get '/pastries/:id/edit' do 
    @pastry = Pastry.find params[:id]
    erb :edit
end

post '/pastries/:id' do
    pastry = Pastry.find params[:id]
    pastry.snack = params[:snack]
    pastry.flavour = params[:flavour]
    pastry.comment = params[:comment]
    pastry.rating = params[:rating]
    redirect to("/pastries/#{ pastry.id }")
end


