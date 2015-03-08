require 'sinatra'
require 'sinatra/reloader'
require 'YahooFinance'

get '/' do
  erb :lookup
end

# get '/lookup' do
#   @symbol = params[:stock_symbol]
#   if !@symbol.nil?
#       @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
#   end
#   erb :lookup
# end

get '/lookup' do
  @symbol = params[:stock_symbol].upcase
  result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
  @price = result[@symbol].lastTrade if result[@symbol]

  erb :lookup
end

# YahooFinance::get_quotes(YahooFinance::StandardQuote, 'MSFT')['MSFT'].lastTrade