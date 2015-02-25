class StockController < ApplicationController

  def lookup
    if params[:stock]
        @stock = params[:stock]
        result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock)[@stock]
        @price = result.lastTradeWithTime
    end
  end

end