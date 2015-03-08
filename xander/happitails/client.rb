class Client
	attr_accessor :name, :age, :number_of_children, :pets

	def initialize(name, age, number_of_children)
		@name = name
		@age = age
		@number_of_children = number_of_children
		@pets = []
	end

	def to_s
		"#{ name }, who is #{ age } years old and has #{ number_of_children } children."
	end
end

