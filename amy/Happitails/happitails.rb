require 'pry'

require_relative 'animals'
require_relative 'clients'

$shelter = {
	:animals => [],
	:clients => []
}

def show_menu
	puts "Hello!"
	puts "Would you like to: "
	puts "1. Display all animals"
	puts "2. Display all clients"
	puts "3. Create an animal"
	puts "4. Create a client"
	puts "5. Client adopt an animal"
	puts "6. Client puts animal up for adoption"
	puts "Q. Quit"
	print "> "
	menu_choice = gets.chomp.downcase
end

def show_animals
	$shelter[:animals].each do |animal|
		puts animal.show_animal
	end
end

def show_clients
	$shelter[:clients].each do |client|
		puts client.show_client
	end
end

def show_client_pets_to_adopt
	$shelter[:clients].each do |client|
		puts client.show_client_pets
	end
end

def create_animal

	print "Enter animal name: "
	name = gets.chomp

	print "Enter animal age: "
	age = gets.chomp

	print "Enter animal gender: "
	gender = gets.chomp

	print "Enter animal species: "
	species = gets.chomp

	print "Enter animal toys: "
	toys = gets.chomp.split

	@animal = Animal.new name, age, gender, species, toys
	@animal #this returns the animal

end

def create_client

	print "Enter client name: "
	name = gets.chomp

	print "Enter how many children the client has: "
	num_children = gets.chomp

	print "Enter the client's age: "
	age = gets.chomp

	@client = Client.new name, num_children, age
	@client #this returns the client
end

def adopt_animal

	puts "Here's a list of all animals up for adoption:"
	show_animals
	print "Enter the name of the animal the client would like to adopt: "
	animal_to_adopt = gets.chomp

	$shelter[:animals].each do |animal|
		if animal.name == animal_to_adopt
		puts "Which client is adopting #{animal_to_adopt}?:"
		show_clients
		print "Enter the name of the client who would like to adopt #{animal_to_adopt}: "
		client_to_adopt = gets.chomp

			$shelter[:clients].each do |client|
				if client.name == client_to_adopt
				client.pets << animal
				$shelter[:animals].delete(animal)
				puts "Animal adopted!"
			end
		end
		else 
			puts "No animal by that name is up for adoption."
		end
	end
end

#this is not working!
def list_animal

	puts "Happitails clients:"
	show_clients
	print "Enter the name of the client who wants to list an animal for adoption: "
	client_to_list = gets.chomp

	$shelter[:clients].each do |client|
		if client.name == client_to_list
		puts "#{client.name} owns the following pets: "
		show_client_pets_to_adopt
		#array not displaying properly

		puts "Which pet does #{client.name} wish to put up for adoption?"
		animal_to_list = gets.chomp

			#breaking at this line
			$shelter[:clients][client].pets.each do |pet|
				if pet.name == animal_to_list
				animals << pet
				$shelter[:clients][client].pets.delete(pet)
				puts "Animal listed for adoption!"
				end
		end
		else 
			puts "No animal by that name is up for adoption."
		end
	end
end

puts "Welcome to Happitails"
menu_choice = show_menu

while menu_choice != 'q'
	if menu_choice == "1"
		show_animals	
	elsif menu_choice =='2'
		show_clients
	elsif menu_choice =='3'
		$shelter[:animals] << create_animal
	elsif menu_choice == '4'
		$shelter[:clients] << create_client
	elsif menu_choice == '5'
		adopt_animal 
	elsif menu_choice == '6'
		list_animal
 	elsif menu_choice == 'Q'
	else
		"Invalid choice"
	end
	menu_choice = show_menu
end

binding.pry

