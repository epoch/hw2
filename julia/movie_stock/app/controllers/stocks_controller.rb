class StocksController < ApplicationController
  def lookup
    @symbol = params[:stock_symbol].to_s.upcase
    result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
    @price = result[@symbol].lastTrade if result[@symbol]
  end
end