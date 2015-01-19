class Client

	attr_accessor :name, :num_children, :age, :num_pets, :pets

	def initialize(name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		# stores the pets they have adopted
		@pets = []
		# records the length of the pets array
		@num_pets = @pets.length
	end

	def to_s
		"#{@name} is #{@age} years old, has #{@num_children} children and #{@pets.length} pet(s)."
	end
end