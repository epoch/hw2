# Class for single line journeys on MTA
class SingleLine

    attr_reader :counter, :stations, :subways

    def initialize(line, start_station, finish_station)
        subways = {
            :n_line => ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
            :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
            :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
        }
        @line = subways[line]
        @start_index, @finish_index = @line.index(start_station), @line.index(finish_station)
        @counter = (@start_index - @finish_index).abs # Counter for the number of stations travelled
        @stations = []
        journey
    end

    private

    # journey on a single line
    def journey
        if @start_index == @finish_index
            @stations = @line[@start_index]
        elsif @start_index < @finish_index
            @stations = @line[@start_index..@finish_index]
        else
            @stations = @line[@finish_index..@start_index].reverse
        end
    end
end

require 'pry'
binding.pry