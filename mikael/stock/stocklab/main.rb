require "sinatra"
require "sinatra/reloader"
require "yahoofinance"

get "/" do
  if params[:stock] == nil
    @quotes = nil
    erb :lookup
  else params[:stock] == !nil
    @quotes = YahooFinance::get_quotes(YahooFinance::StandardQuote, params[:stock].upcase)[params[:stock].upcase].lastTrade
    erb :lookup
  end
end
