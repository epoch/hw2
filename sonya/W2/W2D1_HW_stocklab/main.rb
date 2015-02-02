require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/' do
    if params[:stock]
        @stock = params[:stock]
        result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock)[@stock]
        @price = result.lastTradeWithTime
        # require 'pry'
        # binding.pry
  end

 erb :lookup   
end