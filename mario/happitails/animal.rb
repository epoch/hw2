class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = []
	end

	def to_s
		s = "#{ @name } is a #{ @gender } #{ @species } that is #{ @age } years old. "
		s += display_toys
		s
	end

	def display_toys
		return "#{ @name } has no toys." if toys.empty? 
		# else
		s = "#{ @name } has the following toy(s):\n"
		@toys.each { |toy| s += toy + "\n" }
		s
	end

end