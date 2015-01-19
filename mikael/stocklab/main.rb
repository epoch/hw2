require "sinatra"
require "sinatra/reloader"
require 'yahoofinance'

get "/" do
  @quotes = YahooFinance::get_quotes(YahooFinance::StandardQuote, params[:stock].upcase)[params[:stock].upcase].lastTrade
  erb :lookup
end
