class Building
	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments 

	def initialize(address, style, has_doorman, has_elevator, num_floors)
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		@apartments = {}
	end

	def to_s
		puts " "
		puts "Address: #{@address}"
		puts "Style: #{@style}"
		puts "Floors: #{@num_floors}"
		puts "Apartments: #{@apartments.count}"
		if has_doorman
			puts "Doorman: Yes"
		else
			puts "Doorman: None"
		end
		if has_elevator
			puts "Elevator: Yes"
		else
			puts "Elevator: None"
		end
		puts " "
	end
end
