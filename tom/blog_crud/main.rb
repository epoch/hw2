require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'sqlite3'

require_relative 'post'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'posts.db'
)

after do
  # ensures that we don't run out of connections (works like db.close)
  ActiveRecord::Base.connection.close
end

get '/' do

  @most_recent_post = Post.order(:id).last

  @top_five = Post.order(:id).reverse.take(5)

  erb :home
end

get '/posts' do
  @posts = Post.all.order(:id)
  erb :index
end

get '/about' do
  erb :about
end


### CREATE ###

get '/new' do
  erb :new
end

post '/posts' do
  post = Post.new
  post.title = params[:title]
  post.body = params[:body]
  post.image = params[:image]
  post.post_time = Time.now.asctime
  post.save
  redirect to("/posts/#{ post.id }")
end


### READ ###

get '/posts/:id' do
  # isnt retrieving it properly
  @post = Post.find params[:id]

  erb :show
end


### UPDATE ###

get '/posts/:id/edit' do
  @post = Post.find params[:id]
  erb :edit
end

post '/posts/:id' do
  post = Post.find params[:id]
  post.update :title => params[:title], :body => params[:body], :image => params[:image]
  redirect to ("/posts/#{ post.id }")
end



### DELETE ###

get '/posts/:id/delete' do
  post = Post.find params[:id]
  post.destroy

  redirect to ('/posts')
end