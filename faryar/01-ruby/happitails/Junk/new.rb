require_relative 'animal'
require_relative 'client'
require_relative 'sheltermain'


def read_choice
	puts "Welcome to HappiTails Shelter!"
	puts "What would you like to do?"
	puts "1. Display all animals"
	puts "2. Display all clients"
	puts "3. Create an animal" 
	puts "4. Create a client"
	puts "5. Adopt an Animal"
	puts "6. Put an Animal Up For Adoption"
	puts "Q. Quit"

	print "
  	Pick a menu option: "

  	choice = gets.chomp.downcase 
 	choice 
 end 


class Animal 
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys=0)
		@name = name.capitalize
		@age = age 
		@gender = gender 
		@species = species 
		@toys = toys 
	end 

end 

class Client 
	attr_accessor :name, :children, :age, :pets 

	def initialize(name, children, age, pets)
		@name = name.capitalize 
		@children = children 
		@age = age 
		@pets = pets
	end 

	def add_animal_client(animal)
		@pets << animal
	end

	def lookup_animal(name)
		animal_name = @pets.select {|ani| name == ani.name}
		return animal_name.pop
	end

	def delete_animal(animal)
		@pets.delete(animal)
	end

end 



# class Pets 
# 	attr_accessor :pet_name, :pet_age, :pet_gender, :pet_species, :pet_toys

# 	def initialize(pet_name, pet_age, pet_gender, pet_species, pet_toys)
# 		@pet_name = pet_name 
# 		@pet_age = pet_age 
# 		@pet_gender = pet_gender 
# 		@pet_species = pet_species 
# 		@pet_toys = pet_toys 
# 	end

# end 


$shelter = { 
	:animal => [],
	:client => []
}

# $client = { 
# 	:pets => []
# 	}

def create_animal 
	puts "Animal Creation:"
	print "Enter animal name: "
	name = gets.chomp

	print "Enter animal age: "
	age = gets.chomp 

	print "Enter animal gender: "
	gender = gets.chomp 

	print "Enter animal species: "
	species = gets.chomp

	print "What toys does the animal have? "
	toys = gets.chomp 

	$shelter[:animal] << Animal.new(name, age, gender, species, toys)
	puts "You just created a #{gender} #{species} named #{name} who is #{age} years old and has the following toys: #{toys}."

end 

def create_client 
	puts "Client Creation:"
	print "Enter client name: "
	name = gets.chomp

	print "Enter number of children: "
	children = gets.chomp 

	print "Enter client age: "
	age = gets.chomp 

	print "Enter number of pets: "
	pets = gets.chomp

	$shelter[:client] << Client.new(name, children, age, pets) 
	puts "You just created a #{age}-year-old client named #{name} who has #{children} children and #{pets} pets."

end 

# def create_client 
# 	puts "Client Creation:"
# 	print "Enter client name: "
# 	name = gets.chomp

# 	print "Enter number of children: "
# 	children = gets.chomp 

# 	print "Enter client age: "
# 	age = gets.chomp 

# 	print "Do you have any pets? (y/n) " 
# 	pets_answer = gets.chomp.downcase
# 		if pets_answer == "y"
# 			print "Enter animal name: "
# 			name = gets.chomp

# 			print "Enter animal age: "
# 			age = gets.chomp 

# 			print "Enter animal gender: "
# 			gender = gets.chomp 

# 			print "Enter animal species: "
# 			species = gets.chomp

# 			print "What toys does the animal have? "
# 			toys = gets.chomp 

# 			pets
# 		end 

# 	print "Do you have any more pets? (y/n) "
# 	more = gets.chomp.downcase
# 		if more == "y"
# 			print "Enter animal name: "
# 			name = gets.chomp

# 			print "Enter animal age: "
# 			age = gets.chomp 

# 			print "Enter animal gender: "
# 			gender = gets.chomp 

# 			print "Enter animal species: "
# 			species = gets.chomp

# 			print "What toys does the animal have? "
# 			toys = gets.chomp 

# 			client.pets << Animal.new(name, age, gender, species, toys)
# 		end 

# 	print "Do you have any more pets? (y/n) "
# 	more_more = gets.chomp.downcase
# 		if more_more == "y"
# 			print "Enter animal name: "
# 			name = gets.chomp

# 			print "Enter animal age: "
# 			age = gets.chomp 

# 			print "Enter animal gender: "
# 			gender = gets.chomp 

# 			print "Enter animal species: "
# 			species = gets.chomp

# 			print "What toys does the animal have? "
# 			toys = gets.chomp 

# 			client.pets << Animal.new(name, age, gender, species, toys)
# 		end 

# 	$shelter[:client] << Client.new(name, children, age, pets) 
# 	puts "You just created a #{age}-year-old client named #{name}who has #{children} children and with the following pets: #{pet_species}."

# end



menu_selection = read_choice
while menu_selection != "q"
	case menu_selection
	when "1"
		# puts "Here is a list of all animals: "
		# $shelter[:animal].each do |animal|
		# 	puts animal.name + " the " + animal.species
		# end 
		puts "Here is a list of all animals: "
		$shelter.display_animal
	when "2"
		# puts "Here is a list of all clients: "
		# $shelter[:client].each do |client|
		# 	puts client.name 
		# end 
		puts "Here is a list of all clients: "
		$shelter.display_client
	when "3"
		create_animal
	when "4"
		create_client
	when "5"
		puts "Which client wants to adopt an animal?"
		puts "Here is a list of all clients: "
		$shelter[:client].each do |client|
			puts client.name 
		end 
		client_name = gets.chomp.capitalize
		puts "Which animal does the client want to adopt?"
		$shelter[:animal].select do |animal|
			puts animal.name
		end
		requested_animal = gets.chomp.capitalize
		requested_animal = shelter.lookup_animal(requested_animal)
	when "6" # Facilitate rejection
		
		# Check if we have any clients to facilitate a rejection
		if $shelter[:clients].length < 1
			puts "We have no clients to facilitate a rejection."

		# Now that we've done the first check, we can start the rejection process
		else
			$shelter[:clients].each_with_index do |client, index|
	    		puts "#{index + 1}. #{client.name}"
			end

			# Get the index number of the rejecter (client)
			print "Select the person: "
			rejecter_index = gets.to_i - 1

			# Check if the client has any pets to facilitate a rejection
			if $shelter[:clients][rejecter_index].pets.length < 1
				puts "This client has no pets to facilitate a rejection."

			# Now that we've done the final check, we can continue the rejection process
			else
				$shelter[:clients][rejecter_index].pets.each_with_index do |animal, index|
		    		puts "#{index + 1}. #{animal.name}"
				end

				# Get the index number of the rejected (animal)
				print "Select the animal to be given up for adoption: "
				rejected_index = gets.to_i - 1

				# Create temporary variable that can be used to delete animal from client array and append to animal array
				rejected_animal = []

				$shelter[:clients][rejecter_index].pets.each_with_index do |animal, index|
		    		if index == rejected_index
		    			rejected_animal = animal
		    			# Delete the rejected animal from the "pets" array in the "clients" array in the "shelter" hash
		    			$shelter[:clients][rejecter_index].pets.delete_at(index)
		    		end

				end

				# Append the rejected animal to the "animals" array inside the "shelter" hash
				$shelter[:animals] << rejected_animal

				puts "Shame on you #{$shelter[:clients][rejecter_index].name}! You just rejected #{rejected_animal.name}."
			end
		end
	else
		puts "Unknown function"
	end 
	menu_selection = read_choice

end 

