require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) 

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3', 
    :database => "posts.db"
)

ActiveRecord::Base.default_timezone = :local

require_relative 'post'

# before do

# end

after do
    ActiveRecord::Base.connection.close
end

get '/pry' do
    binding.pry
end

#home
get '/' do
    @posts = Post.all.reverse
    erb :blog
end

#new post form
get '/new' do
    erb :new
end

 
#about
get '/about' do
    erb :about
end

#contact
get '/contact' do
    erb :contact
end

#CREATE a new post
post '/' do 
    post = Post.new 
    post.title = params[:title]
    post.description = params[:description]
    post.full_text = params[:full_text]
    post.category = params[:category]
    post.image = params[:image]
    post.save
    redirect to("/#{post.id}")
end

# view category page
get '/category/:category' do
    @posts = Post.where(:category => params[:category]).reverse
    erb :blog
end

#view post by id 
get '/post/:id' do
    @post = Post.find params[:id] 
    erb :post
end


#prelude to the edit post by id   
get '/post/:id/edit' do
    @post = Post.find params[:id]
    erb :edit
end

#the actual edit  
post '/post/:id' do
    #retrieve an existing post, update its attributes and save (persist) to the database
    post = Post.find params[:id]
    post.title = params[:title]
    post.description = params[:description]
    post.full_text = params[:full_text]
    post.category = params[:category]
    post.image = params[:image]
    post.save
    redirect to("/#{post.id}")
end

#delete post by id
get 'post/:id/delete' do
    post = Post.find params[:id]
    post.destroy
    redirect to ('/')
end


