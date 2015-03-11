# Objectives:

# Practice creating objects
# Explanation

# You are the manager at HappiTails animal shelter. You need to manage your shelter by storing and manipulating information about clients and animals.
# Specification:

# Object Specs:

# Animal:
# An animal should have a name.
# An animal should have an age.
# An animal should have a gender.
# An animal should have a species.
# An animal can have multiple toys.

# Client:
# A client should have a name.
# A client should have a number of children.
# A client should have an age.
# A client should have a number of pets.

# Shelter:
# The shelter should display all the clients.
# The shelter should display all the animals.

# Relationships:
# A client should be able to adopt an animal.
# A client should be able to put an animal up for adoption.

# Phase 1
# Can create animals and clients

# Phase 2
# New animals and clients can be added to the shelter

# Phase 3
# When creating an animal or client, the user is prompted for information like names, gender etc.

# Phase 4
# At start, the user is prompted with a menu of options:
# display all animals
# display all clients
# create an animal
# create an client
# facilitate client adopts an animal
# facilitate client puts an animal up for adoption
# After selecting from the menu the task the user is prompted through the entire process

require_relative 'animal'
require_relative 'client'
require_relative 'sheltermain'

$shelter = Shelter.new


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

	animal = Animal.new(name, age, gender, species, toys)
	$shelter.add_animal(animal)
	puts "You just created a #{gender} #{species} named #{name} who is #{age}years old and has the following toys: #{toys}."

end 

def delete_animal
   puts "What animal would you like to adopt?"
   puts "Here is a list of all animals: "
		$shelter.display_animal
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

	animal = Animal.new(name, age, gender, species, toys)
    $shelter.animals.each do |animal|
      if animal.name == name 
        $shelter.remove_animal(animal)
      end
    end
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

	client = Client.new(name, children, age, pets) 
	$shelter.add_client(client)
	puts "You just created a #{age}-year-old client named #{name} who has #{children} children and #{pets} pets."

end 

def add_pet_client 
  puts "What is the client information?"
  puts "Here is a list of all clients: "
		$shelter.display_client
    print "Enter client name: "
	name = gets.chomp

	print "Enter number of children: "
	children = gets.chomp 

	print "Enter client age: "
	age = gets.chomp 

	print "Enter number of pets: "
	pets = gets.chomp

    $shelter.clients.each do |client|
      if client.name == name && client.children == children && client.age == age && 
        client.pets == pets
        puts "The client has adopted the animal." 
      end
    end
end


def subtract_pet_client
  puts "What is the client information?"
    print "Enter client name: "
	name = gets.chomp

	print "Enter number of children: "
	children = gets.chomp 

	print "Enter client age: "
	age = gets.chomp 

	print "Enter number of pets: "
	pets = gets.chomp

    $shelter.clients.each do |client|
      if client.name == name && client.children == children && client.age == age && 
        client.pets == pets
        puts "The animal is up for adoption!" 
      end
    end
end



menu_selection = read_choice
while menu_selection != "q"
	case menu_selection
	when "1"
		puts "Here is a list of all animals: "
		$shelter.display_animal
	when "2"
		puts "Here is a list of all clients: "
		$shelter.display_client
	when "3"
		create_animal
	when "4"
		create_client
	when "5"
		delete_animal
		add_pet_client
	when "6"
		create_animal
		subtract_pet_client
	else
		puts "Unknown function"
	end 
	menu_selection = read_choice

end 




































































