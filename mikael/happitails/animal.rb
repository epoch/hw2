class Animal
	attr_accessor :name, :owner, :species, :breed, :age, :gender
	def initialize(name, species, breed, age, gender)
		@name = name
		@owner = nil
		@species = species
		@breed = breed
		@age = age
		@gender = gender
	end

	def link_owner(owner)
		@owner = owner
	end

	def to_s
		puts "Name: #{@name}, Species: #{@species}, Breed: #{@breed}"
	end
end
