class StocksController < ApplicationController
  
  def search
    
  end

  def stock_results
    @symbol = params[:symbol]

    # if @symbol == ""
    #   render :search_error
    # else
    #   @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    #   if !@quote.nil?
    #     render :stock_results
    #   else
    #     render :search_error
    #   end
    # end

    if @symbol == ""
      render :search_error
    # WOULD BE GOOD TO ADD ANOTHER ERROR HANDLING STATEMENT FOR FALSE SYMBOLS. NOT SURE HOW...?
    else
      @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
  end

end