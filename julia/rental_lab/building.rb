class Building
	attr_accessor :name, :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

	def initialize(name, address, style, has_doorman, has_elevator, num_floors)
		@name = name
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		@apartments = {}
	end
	# TODO: Add other details to string

	def to_s
		"#{@name}"
	end
end
