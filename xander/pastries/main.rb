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

get '/pastries/flavour/:snack' do
    @pastries = Pastry.where(:flavour => params[:snack])
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
