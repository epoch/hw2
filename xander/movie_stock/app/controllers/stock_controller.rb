class StockController < ApplicationController
    
    def stocksearch
    end

    def stockresult
        @code = params[:code]
        @result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @code)[@code.upcase].lastTrade if @code
    end
end
