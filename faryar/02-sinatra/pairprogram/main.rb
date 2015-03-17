require 'sinatra'
require 'sinatra/reloader'

get '/do_you_have_a_test_for_that' do 
    @yes = params[:yes]
    @no = params[:no]

    erb :do_you_have_a_test_for_that
end 


get '/does_the_test_pass' do 
    @yes = params[:yes]
    @no = params[:no]

    erb :does_the_test_pass
end 


get '/write_a_test' do 
    @done = params[:done]
    
    erb :write_a_test
end 

get '/need_to_refactor' do 
     @yes = params[:yes]
    @no = params[:no]

    erb :need_to_refactor
end 

get '/write_just_enough_code_for_the_test_to_pass' do 
    @done = params[:done]
    
    erb :write_just_enough_code_for_the_test_to_pass
end 

get '/refactor_the_code' do 
    @done = params[:done]
    
    erb :refactor_the_code
end 

get '/select_a_new_feature_to_implement' do 
    @done = params[:done]
    
    erb :select_a_new_feature_to_implement
end 


