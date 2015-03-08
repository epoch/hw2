require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) #Show SQL in the terminal.

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'butterflies.db'
    )

require_relative 'butterfly'

before do
    @families = Butterfly.select(:family).uniq
end
after do
    ActiveRecord::Base.connection.close
end    

# Include so easy to access pry - for debugging purposes. Visit localhost:4567/pry
get '/pry' do
    binding.pry
end


get '/' do
    erb :home
end

get '/butterflies' do
    @butterflies = Butterfly.all
    # EXAMPLES FOR ORDERING
    # @butterflies = Butterfly.all.shuffle
    # @butterflies = Butterfly.all.reverse
    # @butterflies = Butterfly.order(:name)
    erb :index
end

get '/butterflies/family/:name' do
    @butterflies = Butterfly.where(:family => params[:name])
    erb :index
end


get '/butterflies/new' do
    erb :new
end


post '/butterflies' do
    butterfly = Butterfly.new
    butterfly.name = params[:name]
    butterfly.family = params[:family].capitalize
    butterfly.image = params[:image]

    butterfly.save

    redirect to('/butterflies')
end

get '/butterflies/:id' do
    @butterfly = Butterfly.find params[:id] 
    #'@butterfly' so it's an instance variable so can be accessed on show page.
    erb :show
end

get '/butterflies/:id/delete' do
    butterfly = Butterfly.find params[:id]
    #butterfly without @ because we don't need it to be instance to access elsewhere.
    butterfly.destroy
    redirect to('butterflies')
end

get '/butterflies/:id/edit' do
    @butterfly = Butterfly.find params[:id]
    erb :edit
end

post '/butterflies/:id' do
    butterfly = Butterfly.find params[:id]
    butterfly.name = params[:name]
    butterfly.family = params[:family].capitalize
    butterfly.image = params[:image]
    butterfly.save

    redirect to("/butterflies/#{butterfly.id}")
end
