require_relative 'single_line'

class MTA
	attr_reader :start_line, :start_station, :finish_line, :finish_station,
				:counter, :visited_stations

	def initialize(start_line, start_station, finish_line, finish_station)
		@start_line, @start_station = start_line, start_station
		@finish_line, @finish_station = finish_line, finish_station
	    @counter, @stations = 0, [] # Counter for the number of stations travelled
		journey
	end

	private

	def journey
		# if trip is on a single line
		if @start_line == @finish_line
			trip_with_no_transfers
		# else trip is on multiple lines
		else
			trip_with_transfers
		end
	end

	def trip_with_no_transfers
		s = SingleLine.new(start_line, @start_station, @finish_station)
		@counter, @stations = s.counter, s.stations
	end

	def trip_with_transfers
		s1 = SingleLine.new(@start_line, @start_station, "Union Square")
		s2 = SingleLine.new(@finish_line, "Union Square", @finish_station)
		@counter = s1.counter + s2.counter
		@stations << s1.stations << s2.stations
	end
end
