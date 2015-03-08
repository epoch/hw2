class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize (name, age, gender, species)
		@name = name # be sure to capitalize this)
		@age = age
		@gender = gender
		@species = species
		@toys = []
	end

	def to_s
		"#{ name } is a #{ age } year old #{ gender } #{ species }."
	end
end
