require_relative 'subway'

# Class for single line journeys on MTA
class SingleLine

    attr_reader :counter, :stations, :subways
    include Subway

    def initialize(line, start_station, finish_station)
        @line = Subway::LINES[line]
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