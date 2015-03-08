require 'sinatra'
require 'sinatra/reloader'
require 'YahooFinance'

get '/stock' do
  @symbol = params[:symbol]

  if !@symbol.nil?
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end
  
  erb :lookup
end