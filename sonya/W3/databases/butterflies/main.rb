require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal

# Define a connection to the DB
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'butterflies.db'
)
# Require ActiveRecord Models
require_relative 'butterfly'
require_relative 'plant'

# Before filter runs before and every request
before do
    # The layout requires this variable for the menu
    @families = Butterfly.select(:family).uniq
end

# Close DB connection after every action
after do
    ActiveRecord::Base.connection.close
end

# HOMEPAGE
get '/' do
    erb :home
end

# Debugging in browser and terminal
get '/pry' do
    binding.pry
end

# BUTTERFLY INDEX
get '/butterflies' do
    @butterflies = Butterfly.order(:name)
    erb :index
end

# Butterflies within a single family
get '/butterflies/family/:name' do
    @butterflies = Butterfly.where(:family => params[:name])
    erb :index
end

get '/butterflies/new' do
    erb :new
end

# CREATE a new butterfly
post '/butterflies' do
    # Instantiate a new butterfly in memory, set its attributes
    # Save (persist) it to the database
    butterfly = Butterfly.new
    butterfly.name = params[:name]
    butterfly.family = params[:family]
    butterfly.image = params[:image]
    butterfly.save

    redirect to("/butterflies/#{ butterfly.id }") # Show new butterfly
end

# READ / SHOW BUTTERFLY
get '/butterflies/:id' do
    @butterfly = Butterfly.find params[:id] # The id is in the url
    erb :show
end

# DELETE. This is lazy, sorry. POST: would be better
get '/butterflies/:id/delete' do
    butterfly = Butterfly.find params[:id] # The ID is in the URL
    butterfly.destroy # Delete the butterfly from the database
    redirect ('/butterflies') # Return the user to the index
end

# Show the edit form
get '/butterflies/:id/edit' do
    @butterfly = Butterfly.find params[:id]
    erb :edit
end

# UPDATE butterfly.
post '/butterflies/:id' do
    # Retrieve an existing butterfly, update, save (persist) to the database.
    butterfly = Butterfly.find params[:id]
    butterfly.name = params[:name]
    butterfly.family = params[:family]
    butterfly.image = params[:image]
    butterfly.plant_id = params[:plant_id]
    butterfly.save
    redirect to ("/butterflies/#{ butterfly.id }")
end

get '/plants' do
    @plants = Plant.all.order(:name)
    erb :plants_index
end

get '/plants/new' do
  erb :plants_new
end

get '/plants/:id' do
  @plant = Plant.find params[:id]
  erb :plants_show
end

post '/plants' do
    Plant.create :name => params[:name], :image => params[:image]
    redirect to('/plants')
end

get '/plants/:id/delete' do
    plant = Plant.find params[:id]
    plant.destroy
    redirect to('/plants')
end

get '/plants/:id/edit' do
    @plant = Plant.find params[:id]
    erb :plants_edit
end

post '/plants/:id' do
    # this url is not using 'plant' in a view so it doesn't need a hat (instance variable)
    plant = Plant.find params[:id]
    plant.update :name => params[:name], :image => params[:image]
    redirect to("/plants/#{ plant.id }")
end














