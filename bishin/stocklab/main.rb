require 'sinatra'
require 'sinatra/reloader'
require 'YahooFinance'

get '/' do # homepage - shows lookup file
    erb :lookup
end

get '/lookup' do
    @ticker = params[:ticker].upcase
    result = YahooFinance::get_quotes(YahooFinance::StandardQuote,@ticker)
    @last_trade = result[@ticker].lastTrade if result[@ticker] #i.e. if it exists in the first place
    erb :lookup
end