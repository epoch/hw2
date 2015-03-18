require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get '/' do  # avoid more than one slash in the url name because the css/receipts.css file is RELATIVE to this file 
    erb :form 
end 

post '/' do # since we changed the method in the form from the implicit get to post, now we need to do a post request
  db = File.open('receipts.csv', 'a+')
  db.puts params.values.join(',') # or we can use "#{ params[:client] }, #{ params[:service] }, #{ params[:cost] }"
  db.close
  erb :thanks
end

get '/all' do 
    db = File.open('receipts.csv', 'r')
    @receipts = []

    db.each do |line|
        info = line.split(',')
        receipt = { 
            :client => info[0]
            :service => info[1]
            :cost => info[2]
        }
        @receipts << receipt 
    end

    db.close
    erb :all
end 

