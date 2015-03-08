class Animal
	attr_accessor :name, :gender, :age, :species, :toys

	def initialize(name, gender, age, species, toys)
		@name = name
		@gender = gender
		@age = age
		@species = species
		@toys = toys
	end

	def to_s
		"- #{name} is a #{age} year old #{gender} #{species} with #{toys.length} toy(s)."
	end
end