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
	# TODO add other details like number of floors.
	def to_s
		puts "The building at #{ @address } has #{num_floors}."
		puts "The style is best described as #{ @style }." 
		puts "The building has #{ @apartments.count } apartments."
		# insert statement regarding doorman and elevator
	end
end