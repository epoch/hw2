class Clients

	attr_accessor :name, :number_of_children, :age, :pets

	def initialize(name, number_of_children, age)
		@name = name
		@number_of_children = number_of_children
		@age = age
		@pets = []
	end

	def to_s
		"Our client #{ @name } has a #{ @number_of_children } bald babies, aged #{ @age } and #{ @pets.size } fur babies."
	end

end


