class StockController < ApplicationController
  
  def stock_search
    if params[:stock] == nil
      @quotes = nil
    else params[:stock] == !nil
      @quotes = YahooFinance::get_quotes(YahooFinance::StandardQuote, params[:stock].upcase)[params[:stock].upcase].lastTrade
    end
  end

end
