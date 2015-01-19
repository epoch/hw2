require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do
    @symbol = params[:symbol].upcase

    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade

    erb :lookup
end