require 'sinatra'
require 'sinatra/reloader'

require 'yahoofinance'

get '/' do 
    erb :lookup
end

get '/lookup' do 
    @symbol = params[:symbol]

    @result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol.upcase].lastTrade if @symbol
    erb :lookup
end