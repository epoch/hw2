require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @question = "Do you have a test for that?"
    @yes = 'pass'
    @no =  'write_test'
    erb :bot_choice
end

get '/pass' do
    @question = "Does the test pass?"
    @yes = 'refactor'
    @no =  'write_code'
    erb :bot_choice
end

get '/write_code' do
    @statement = "Write a test."
    @link = 'pass'
    @button_text = 'Done'
    erb :bot_no_choice
end

get '/refactor' do
    @question = "Need to refactor?"
    @yes = 'do_refactor'
    @no =  'new_feature'
    erb :bot_choice
end

get '/do_refactor' do
    @statement = "Refactor the code."
    @link = 'pass'
    @button_text = 'Done'
    erb :bot_no_choice
end

get '/new_feature' do
    @statement = "Select a new feature to implement."
    @link = ''
    @button_text = 'Continue'
    erb :bot_no_choice
end

get '/write_test' do
    @statement = "Write a test."
    @link = 'pass'
    @button_text = 'Done'
    erb :bot_no_choice
end