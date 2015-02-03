class StockController < ApplicationController
  def index
    redirect_to('/stock/lookup')
  end

  def lookup
  end

  def result
    @symbol = params[:symbol].upcase

    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end
end