class Client
	attr_accessor :name, :num_children, :age, :pets

	def initialize(name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@pets = []
	end

	def to_s
		s = "#{ @name } is #{ @age } years old and has #{ @num_children } children.\n"
		s += display_pets
		s
	end

	def display_pets
		return "#{ @name } has no pets." if @pets.empty? 
		# else
		s = "#{ @name } has the following pets(s): "
		@pets.each { |pet| s += "#{pet.name}, " }
		# delete the last comma and space and return
		s[0..-3]
	end
end