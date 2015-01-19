class Building
	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

	def initialize(address, style, has_doorman, has_elevator, num_floors)
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		# key will be apt number, value will be object
		@apartments = {}
	end

	def to_s
		# this works fine, need to try and add doorman and elevator
		"The #{@style} building at #{@address} has #{@apartments.count} apartments."
	end
end