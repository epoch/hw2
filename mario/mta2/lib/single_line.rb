# Class for single line journeys on MTA
class SingleLine

    attr_reader :counter, :stations, :subways

    def initialize(line, start_station, finish_station)
        @line, @start_station, @finish_station = line, start_station, finish_station
        @subways = {
            :n_line => ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
            :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
            :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
        }
        @start_index = @subways[line].index(start)
        @finish_index = @subways[line].index(finish)
        @counter = (@start_index - @finish_index).abs # Counter for the number of stations travelled
        @stations = []
    end

    private
    # journey on a single line
    def journey(line, start, finish)
        # current_index is the index of the current station
        # stations visited on the single line journey
        current_index = start_index

        until arrived?(line, current_index, finish_index) do 
            @stations << @subways[line][current_index]
            current_index += direction
        end
    end

    # Direction that the train travels
    def direction
        return -1 if @finish_index < @start_index
        return 1
    end

    def arrived?(line, current_index, finish_index)
        @subways[line][current_index] == @subways[line][finish_index]
    end
end