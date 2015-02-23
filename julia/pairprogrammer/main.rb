require 'sinatra'
require 'sinatra/reloader'

# Step One
get '/' do
  erb :index
end

get '/pass' do
  erb :pass
end

get '/refactor' do
  erb :refactor
end

get '/write_test' do
  erb :write_test
end

get '/do_refactor' do
  erb :do_refactor
end

get '/write_code' do
  erb :write_code
end

get '/new_feature' do
  erb :new_feature
end

# %a{:href => url('/pass')} pass
