require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in the terminal

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'entries.db'
)

ActiveRecord::Base.default_timezone = :local

require_relative 'entry'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :welcome
end

get '/entries/new' do
  erb :new
end

post '/entries' do
  entry = Entry.new
  entry.title = params[:title]
  entry.body = params[:body]
  entry.save
  
  redirect to ("/entries/#{ entry.id }")
end

get '/entries' do
  @entries = Entry.all.order(:created_at).reverse
  erb :index
end

get '/entries/:id' do
  @entry = Entry.find params[:id]
  erb :show
end

get '/entries/:id/delete' do
  entry = Entry.find params[:id]
  entry.destroy
  redirect to ('/entries')
end

get '/entries/:id/edit' do
  @entry = Entry.find params[:id]
  erb :edit
end

post '/entries/:id' do
  entry = Entry.find params[:id]
  entry.title = params[:title]
  entry.body = params[:body]
  entry.save
  
  redirect to ("/entries/#{ entry.id }")
end
