require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'blog_posts.db'
)

require_relative 'post'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :home
end

