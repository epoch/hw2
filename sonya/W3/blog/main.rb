require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'posts.db'
)

require_relative 'post'

get '/pry' do
  binding .pry
end

after do
  ActiveRecord::Base.connection.close
end

# HOME
get '/' do
  erb :home
end

# INDEX
get '/posts' do
  @posts = Post.order(:id)
  erb :index
end

get '/new' do
  erb :new
end

# CREATE
post '/posts' do
  post = Post.new
  post.title = params[:title]
  post.url = params[:url]
  post.save

  redirect to("/posts/#{post.id}")
end

# READ
get '/posts/:id' do
  @post = Post.find params[:id]
  erb :show
end

# DELETE
get '/posts/:id/delete' do
  post = Post.find params[:id]
  post.destroy
  redirect '/posts'
end

# Show the edit form
get '/posts/:id/edit' do
  @post = Post.find params[:id]
  erb :edit
end

# UPDATE
post '/posts/:id' do
  post = Post.find params[:id]
  post.title = params[:title]
  post.url = params[:url]
  post.save
  redirect to("/posts/#{ post.id }")
end


 
