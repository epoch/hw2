require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/symbol' do 
    @symbol = params[:symbol]

    if !@symbol.nil?
        @result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
    erb :lookup 
end 




