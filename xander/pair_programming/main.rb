require 'sinatra'
require 'sinatra/reloader'

get '/home' do
    erb :home
end

get '/write_test' do
    erb :write_test
end

get '/does_test_pass' do
    erb :does_test_pass
end

get '/feature' do
    erb :feature
end

get '/need_refactor' do
    erb :need_refactor
end

get '/write_code' do
    erb :write_code
end

get '/refactoring' do
    erb :refactoring
end