require 'sinatra'
require 'sinatra/reloader'

get '/' do
@text = "Do you have a test for that?"
@link_1 = 'pass'
@link_2 = 'write_test'
@link_text1 = 'Yes'
@link_text2 = 'No'
  erb :two_buttons
end

get '/pass' do
@text = "Does the test pass?"
@link_1 = 'refactor'
@link_2 = 'write_code'
@link_text1 = 'Yes'
@link_text2 = 'No'
  erb :two_buttons
end

get '/refactor' do
@text = "Need a refactor?"
@link_1 = 'do_refactor'
@link_2 = 'new_feature'
@link_text1 = 'Yes'
@link_text2 = 'No'
  erb :two_buttons
end

get '/write_code' do
@text = "Write just enough code for the test to pass."
@link_1 = 'pass'
@link_text1 = 'Done'
  erb :one_button
end

get '/write_test' do
@text = "Write a test."
@link_1 = 'pass'
@link_text1 = 'Done'
  erb :one_button
end

get '/do_refactor' do
@text = "Refactor the code."
@link_1 = 'pass'
@link_text1 = 'Done'
  erb :one_button
end

get '/new_feature' do
@text = "Select a new feature to implement."
@link_1 = '/'
@link_text1 = 'Continue'
  erb :one_button
end


















