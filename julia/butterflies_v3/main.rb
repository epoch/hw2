require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

# this wouldn't need to be added if using rails - rails automatically does this
ActiveRecord::Base.logger = Logger.new(STDERR) #Show SQL in the terminal.

# This explains where to find the database
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'butterflies.db' # Plant data has been set up to be added to this database
    )

# Include our models - specific kind of class.
require_relative 'butterfly'
require_relative 'plant'

# Before filter - runs before any and every request
before do
    # The layout requires this variable to be set.
    @families = Butterfly.select(:family).uniq
end
# After filter as above but after
after do
    # Stops the database running out of connections
    ActiveRecord::Base.connection.close
end    

# Include so easy to access pry - for debugging purposes. Visit localhost:4567/pry
get '/pry' do
    binding.pry
end

# Homepage
get '/' do
    erb :home
end

# Butterflies index - index of everything in the database.
get '/butterflies' do
    @butterflies = Butterfly.all
    # EXAMPLES FOR ORDERING
    # @butterflies = Butterfly.all.shuffle
    # @butterflies = Butterfly.all.reverse
    # @butterflies = Butterfly.order(:name)
    erb :index
end

get '/butterflies/family/:name' do
    # :family is the name of the column. Returns the results where requested value is in the family column. 
    @butterflies = Butterfly.where(:family => params[:name]) 
    erb :index #Same view as the index but only for a particular family.
end

# New butterfly form
get '/butterflies/new' do
    erb :new # The form for a new butterfly.
end

# CREATE a new butterfly
post '/butterflies' do
    # Instantiate a new butterfly in memory, set its attributes
    # and saves (persist) it to the database.
    butterfly = Butterfly.new
    butterfly.name = params[:name]
    butterfly.family = params[:family].capitalize
    butterfly.image = params[:image]
    butterfly.plant_id = params[:plant_id]

    butterfly.save

    redirect to("/butterflies/#{butterfly.id}") # Show the user the new butterfly
end

# SHOW a butterfly
get '/butterflies/:id' do # dynamic
    @butterfly = Butterfly.find params[:id] # The id is in the URL.
    #'@butterfly' so it's an instance variable so can be accessed on show page.
    erb :show
end

# DO NOT DO THIS! 
# SHOULD BE A POST REQUEST
# GOOGLE VISITS EVERY URL WITH A GET REQUEST - IT WOULD VISIT THIS URL AND THEREFORE  
# DELETE THIS EVERY PAGE/ENTRY
# GOOGLE'S CRAWLER DOES GET REQUESTS NOT POST
get '/butterflies/:id/delete' do
    butterfly = Butterfly.find params[:id]
    # butterfly without @ because we don't need it to be instance to access elsewhere.
    butterfly.destroy # Delete the butterfly from the database - cannot be undone.
    redirect to('butterflies') # Return the user to the index.
end

get '/butterflies/:id/edit' do
    @butterfly = Butterfly.find params[:id]
    erb :edit
end

# UPDATE butterfly
post '/butterflies/:id' do
    # Retrieve an existing butterfly, update it's attributes and save(persist)
    # to the database.
    butterfly = Butterfly.find params[:id]
    butterfly.name = params[:name]
    butterfly.family = params[:family].capitalize
    butterfly.image = params[:image]
    butterfly.plant_id = params[:plant_id]
    butterfly.save

    redirect to("/butterflies/#{butterfly.id}")
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

# DONT DO FOR REAL DATABASE AS GOOGLE WILL DELETE PAGE/DATABSE ENTRY IN ERROR WHEN INDEXING
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
    plant = Plant.find params[:id]
    plant.update :name => params[:name], :image => params[:image]

    redirect to("/plants/#{plant.id}")
end

