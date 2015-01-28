class Animal

	#creates getter and setter methods for our instance variables
	#if you don't define a getter and a setter, like for the instance variable, it means you don't have access to the instance variable outside the function 
	attr_accessor :name, :age, :gender, :species, :toys

	#def initialize creates a special magic method called initialize. 
	#Whenever I call a new Animal, it will trigger the initialize function and allow me to pass through those variables.
	def initialize(name, age, gender, species, toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys

	end

	def show_animal
		puts "Name: #{@name}"
		puts "Age: #{@age}"
		puts "Gender: #{@gender}"
		puts "Species: #{@gender}"
		puts "Toys: #{@toys.join(" ")}"
	end
end

# An animal should have a name.
# An animal should have an age.
# An animal should have a gender.
# An animal should have a species.
# An animal can have multiple toys.


