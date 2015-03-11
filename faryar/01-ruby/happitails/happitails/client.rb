class Client
	attr_accessor :name, :gender, :age, :num_children, :pets

	def initialize(name, gender, age, num_children)
		@name = name
		@gender = gender
		@age = age
		@num_children = num_children
		@pets = []
	end

	def to_s
		"- #{name} is #{age} years old and identifies as a #{gender}. They have #{num_children} children and have adopted #{pets.length} pet(s)."
	end
end