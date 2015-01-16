class Client
	attr_accessor = :name, :num_children, :age, :pets

	def intialize(name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@pets = []
	end

	def to_s
		s = "#{ @name } is #{ @age } year old and has #{ @num_children }."
		s += display_pets
		s
	end

	def display_pets
		return "#{ @name } has no pets." if pets.empty? 
		# else
		s = "#{ @name } has the following pets(s):\n"
		pets.each { |toy| s += "toy" + "\n" }
		s
	end

end