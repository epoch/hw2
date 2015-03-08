require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'posts.db'
)

require_relative 'post'
require_relative 'comment'

after do
  ActiveRecord::Base.connection.close
end

get '/pry' do
  binding.pry
end

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts' do
  @posts = Post.all

  erb :index
end

get '/posts/add' do
  erb :add_post
end

post '/posts' do
  Post.create :subject => params[:subject], :body => params[:body], :author => params[:author], :tags => params[:tags]

  redirect to('/posts')
end

get '/posts/:id' do
    @post = Post.find params[:id]
    erb :view
end


get '/posts/:id/delete' do
  post = Post.find params[:id]

  post.destroy

  redirect to ('/posts')
end


get '/posts/:id/edit' do
  @post = Post.find params[:id]

  erb :edit_post
end

post '/posts/:id' do
  post = Post.find params[:id]

  post.update :subject => params[:subject], :body => params[:body], :author => params[:author], :tags => params[:tags]

  redirect to("/posts/#{post.id}")
end


