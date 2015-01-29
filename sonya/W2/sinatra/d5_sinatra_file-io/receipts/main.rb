require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :form    
end

post '/' do
    db = File.open('receipts.csv', 'a')
    # put in the database the values in the params (data in the url) and join them together with a comma
    db.puts params.values.join(',')
    # this syncs the data
    db.close
    erb :thanks
end

get '/all' do
    db = File.open('receipts.csv', 'r')
    @receipts = []

    db.each do |line|
        info = line.split(',')
        receipt = {
            :client => info[0],
            :service => info[1],
            :cost => info[2]
        }
    @receipts << receipt
end

    db.close
    erb :all
end
