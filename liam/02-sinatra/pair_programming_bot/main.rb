require "sinatra"
require "sinatra/reloader"

get '/' do
  @question = "Do you have a test for that?"
  @yes = "pass"
  @no = "write_test"
  erb :bot_choice
end

get '/pass' do
  @question = "Does the test pass?"
  @yes = "refactor"
  @no = "write_code"
  erb :bot_choice
end

get '/write_test' do
  @question = "Write a test."
  @done = "pass"
  erb :bot_no_choice
end

get '/refactor' do
  @question = "Need to refactor?"
  @yes = "do_refactor"
  @no = "new_feature"
  erb :bot_choice
end

get '/write_code' do
  @question = "Write just enough code for the test to pass."
  @done = "pass"
  erb :bot_no_choice
end

get '/do_refactor' do
  @question = "Need to refactor?"
  @done = "pass"
  erb :bot_no_choice
end

get '/new_feature' do
  @question = "Select a new feature to implement."
  @done = ""
  erb :bot_no_choice
end