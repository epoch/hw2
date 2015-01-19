class Client

	#creates getter and setter methods for our instance variables
	#if you don't define a getter and a setter, like for the instance variable, it means you don't have access to the instance variable outside the function 
	attr_accessor :name, :num_children, :age, :pets

	#def initialize creates a special magic method called initialize. 
	#Whenever I call a new Client, it will trigger the initialize function and allow me to pass through those variables.
	def initialize(name, num_children, age)
		@name = name
		@num_children = num_children
		@age = age
		@pets = []
	end

	def show_client
		puts "Name: #{@name}"
		puts "Number of children: #{@num_children}"
		puts "Age: #{@age}"
		puts "Number of pets: #{@pets.length}"
	end

	def show_client_pets
		puts "Pets: #{@pets.join(" ")}"
	end

end

# A client should have a name.
# A client should have a number of children.
# A client should have an age.
# A client should have a number of pets.



