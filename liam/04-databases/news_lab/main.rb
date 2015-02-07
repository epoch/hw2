require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR) # Show SQL in terminal.

# Explains to ActiveRecord where to find the database.
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'news_lab.db'
)

# Include our models.
require_relative 'article'
require_relative 'user'

# # Before filter which runs before any and every request.
# before do
#   # The layout requires this variable to be set.
#   @categories = Article.select(:category).uniq
# end

# # Ditto for the after filter.
# after do
#   # This stops the database running out of connections.
#   ActiveRecord::Base.connection.close
# end

# For debugging purposes: visit this URL and pry will open in the terminal
get '/pry' do
  binding.pry
end

# Homepage.
get '/' do
  erb :home
end

# About page.
get '/about' do
  erb :about
end

# Articles index.
get '/articles' do
  @articles = Article.order(:posted_at)
  erb :articles_index
end

# Articles within a single category.
get '/categpries/category/:name' do
  @articles = Article.where(:category => params[:name])
  erb :articles_index # Same view as the index but only for a particular category.
end

get '/articles/new' do
  erb :articles_new
end

post '/articles' do
  # Instantiate a new article in memorey, set its attributes
  # and save (persist) it to the database.
  article = Article.new
  article.title = params[:title]
  article.category = params[:category]
  article.body = params[:body]
  article.image = params[:image]
  article.user_id = params[:user_id]
  
  article.save
  
  redirect to('/articles') # Show the user the new article.
end

# Show a article
get '/articles/:id' do
  # An instance veriable with a hat (@) is created so the view can access the data.
  @article = Article.find params[:id] # The ID is in the URL.
  erb :articles_show
end

# This is naughty. I was lazy, sorry: POST would be better.
get '/articles/:id/delete' do
  article = Article.find params[:id] # The ID is in the URL.
  article.destroy # Delete the article from the database.
  redirect to ('/articles') # Return the user to the articles index.
end

get '/articles/:id/edit' do
  @article = Article.find params[:id] # The ID is in the URL.
  erb :articles_edit
end

# UPDATE article.
post '/articles/:id' do
  # Retrieve an existing article, update its attributes and save (persist)
  # to the database.
  article = Article.find params[:id]
  article.title = params[:title]
  article.category = params[:category]
  article.body = params[:body]
  article.image = params[:image]
  article.user_id = params[:user_id]

  article.save

  redirect to("/articles/#{article.id}")
end

get '/users' do
  @users = User.all.order(:name)
  erb :users_index
end

get '/users/new' do
  erb :users_new
end

post '/users' do
  user = User.new
  user.name = params[:name]
  user.email = params[:email]
  user.image = params[:image]
  user.description = params[:description]
  
  user.save
  
  redirect to('/users')
end

get '/users/:id' do
  @user = User.find params[:id]
  erb :users_show
end

get '/users/:id/delete' do
  user = User.find params[:id]
  user.destroy
  redirect to ('/users')
end

get '/users/:id/edit' do
  @user = User.find params[:id]
  erb :users_edit
end

post '/users/:id' do
  user = User.find params[:id]
  user.name = params[:name]
  user.email = params[:email]
  user.image = params[:image]
  user.description = params[:description]
  user.save

  redirect to("/users/#{user.id}")
end