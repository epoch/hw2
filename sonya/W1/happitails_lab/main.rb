# * Manage the clients coming into the shelter. Track their names, ages, gender, kids and the number of pets they have.
# * Manage the animals. Track their names, breed, age, gender and their favorite toys.
# * A client will want to come and see the list of available animals to adopt
# * A client will want to come in and give up their animal for adoption
# * A manager will want to list the animals in the shelter
# * A manager will want to list the clients

require 'rainbow'

require_relative 'animals.rb'
require_relative 'clients.rb'

class Shelter 
	attr_accessor :animals, :clients

	def initialize
		@animals = []
		@clients = []
	end
end

# to access items in hash $happitails.animals
$happitails = Shelter.new

# Global arrays to store new input data
animals = []
clients = []

# Seed data - replace this with file input file output!?!
bay = Animals.new("Bay", 3, "female", "Irish Wolfhound", ["chickens", "balls"])
willie = Animals.new("Willie", 2, "male", "Huskie", ["rope", "balls"])
sox = Clients.new("Sox", 0, 30)
dt = Clients.new("DT", 0, 22)

$happitails.animals << bay
$happitails.animals << willie

$happitails.clients << sox
$happitails.clients << dt

# # to access from the hash - call the key 
# $happitails.animals.each do |animal| 
# puts animal.name
# end

# CREATE METHODS

def create_animal
	puts "Create an animal"
	print "Enter animal name: "
	name = gets.chomp

	print "Enter animal age: "
	age = gets.chomp.to_i

	print "Enter animal gender: "
	gender = gets.chomp

	print "Enter animal species: "
	species = gets.chomp

	print "Enter animal toys - seperated by a comma: "
	toys = []
	toys << gets.chomp
	
	Animals.new(name, age, gender, species, toys.join.split(",  "))

end

def create_client
	puts "Client Creation: "
	print "Enter the client name: "
	name = gets.chomp

	print "Enter the number of children: "
	number_of_children = gets.chomp.to_i

	print "Enter age of children: "
	age = gets.chomp.to_i

	Clients.new name, number_of_children, age
end

def adopt_animal

	puts "====="
	$happitails.animals.each_with_index do |animal, index|
		puts "#{index} #{animal.name}"
	end

	print "\nWhich animal do you want to adopt? "
	animal_index = gets.chomp.to_i
	
	puts "====="
	$happitails.clients.each_with_index do |client, index|
		puts "#{ index } #{ client }"
	end

	print "\nWhich client would you like to pair with this animal? "
	client_index = gets.chomp.to_i

	# TODO: add option for user to run create_client

	# get animal id using each and create a new pet variable for this to push into client file

	adopted_animal = $happitails.animals.delete_at(animal_index)

require 'pry'
binding.pry

	$happitails.clients[client_index].pets << adopted_animal

	puts "Congratulations #{ $happitails.clients[client_index].name }, you have just adopted a fur baby!"
end

# Method to return animals

def return_animal
	puts "====="
	print "\nIdentify yourself, you dirty abandoner?\n"

	$happitails.clients.each_with_index do |client, index|
		puts "#{ index } #{ client.name }"
	end

	client_index = gets.chomp.to_i

	puts "====="
  	$happitails.clients[client_index].pets.each_with_index do |animal, index|
		puts "#{index} #{animal.name}"
	end
	
	print "\nWhich animal do you want to abandon :( "
	animal_index = gets.chomp.to_i

	# TODO: add option for user to run create_animal

	# get animal id using each and create a new pet variable for this to push into client file

	abandoned_animal = $happitails.clients[client_index].pets.delete_at(animal_index)

	$happitails.animals << abandoned_animal

	p abandoned_animal
	#animal_index += 1

	print "\nSorry for your loss, if you change your mind #{ $happitails.clients[client_index].name }, we have the following animals in our shelter\n"
	
	$happitails.animals
end

# CREATE REFACTORED MENU

def menu
	puts Rainbow("(=^.^=) (=^.^=) (=^.^=) (=^.^=) (=^.^=) (=^.^=)").inverse
	print Rainbow("The Shelter Terminal - Adopt a Fur Baby Today!!\n").inverse
	#Rainbow("this on yellow bg").bg(:yellow)
	puts Rainbow("(=^.^=) (=^.^=) (=^.^=) (=^.^=) (=^.^=) (=^.^=)").inverse
	puts "\t1. Create animal"
	puts "\t2. Create client"
	puts "\t3. List all animals"
	puts "\t4. List all clients"
	puts "\t5. Adopt a Fur Baby"
	puts "\t6. Return an animal"
	puts "\tQ. Quit"
	print Rainbow("Please enter your selection: ").red
end

def read_menu_selection
	menu
	gets.chomp.downcase
end

menu_selection = read_menu_selection

while menu_selection != 'q'
	case menu_selection
	when '1'
		$happitails.animals << create_animal
		puts animals
	 when '2'
	 	$happitails.clients << create_client
	 	puts clients
	 when '3'
	 	puts "List of animals: "
	 	puts $happitails.animals
	 when '4'
	 	puts "List of clients: "
	 	puts $happitails.clients
	 when '5'
	 	puts "Adopt a Fur Baby: "
	 	puts adopt_animal
	 when '6'
	 	puts "Return an animal: "
	 	puts return_animal
	else 
		puts "Unknown function"
	end
	
	menu_selection = read_menu_selection
end


