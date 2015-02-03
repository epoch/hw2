class StockController < ApplicationController

    def stock
        # raise "errr"
        @symbol = params[:stock_symbol].to_s.upcase
        result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
        @price = result[@symbol].lastTrade if result[@symbol] 
        # (so we only set the price if we actually got a result back for this symbol)
        # render '/stock'

    end

end