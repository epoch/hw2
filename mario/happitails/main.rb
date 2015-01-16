require "rainbow"
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

# Seed info

$my_shelter = Shelter.new
jazz = Animal.new("Jazz", 3, "male", "dog")
inky = Animal.new("Inky", 14, "female", "dog")
mario = Client.new("Mario", 0, 32)
donald = Client.new("Donald", 2, 54)
donald.pets << jazz
$my_shelter.animals << inky
$my_shelter.clients << mario
$my_shelter.clients << donald

def read_choice
	puts " H a p p i    T a i l s ".center(80, ?=)
	puts "Available functions:\n\n"
	puts "\t1. Display all animals"
	puts "\t2. Display all clients"
	puts "\t3. Create an animal"
	puts "\t4. Create a client"
	puts "\t5. Client adopts an animal"
	puts "\t6. Client puts animal up for adoption"
	puts "\tQ. Quit"

	print Rainbow("\nPlease enter your selection:").yellow.inverse + " "

	choice = gets.chomp.downcase
	puts ''.center(80, ?-)
	choice
end

def create_animal
	puts "Create an animal"

	print "Name: "
	name = gets.chomp

	print "Age: "
	age = gets.chomp

	print "Gender: "
	gender = gets.chomp

	print "Species: "
	species = gets.chomp

	$my_shelter.animals << Animal.new(name, age, gender, species)

	puts "Animal successfully created"
end

def create_client
	puts "Create a client"

	print "Name: "
	name = gets.chomp

	print "Number of chilidren: "
	num_children = gets.chomp

	print "Age: "
	age = gets.chomp

	$my_shelter.clients << Client.new(name, num_children, age)

	puts "Client successfully created"
end

def numbered_list(x)
	counter = 1
	x.each do |i|
		puts "#{counter}. #{i.name}"
		counter += 1
	end
	print "Type a number: "
	return gets.to_i - 1
end


def client_adopts_pet
	puts "Client adopts an animal"
	if $my_shelter.animals.empty?
		puts "No pets available for adoption."
	elsif $my_shelter.clients.empty?
		puts "No clients available to adopt animals."
	else
		puts "Select an animal:"
		animal_index = numbered_list($my_shelter.animals)

		puts "Select a client:"
		client_index = numbered_list($my_shelter.clients)

		$my_shelter.clients[client_index].pets << $my_shelter.animals.delete_at(animal_index)

		puts "Client has successfully adopted animal."
	end
end

def animal_for_adoption
	puts "Client puts animal up for adoption:"
	if $my_shelter.clients.empty?
		puts "No clients available to put animals up for adoption."
	else
		puts "Select a client."
		client_index = numbered_list($my_shelter.clients)
	end

	if $my_shelter.clients[client_index].pets.empty?
		puts "No pets from this client available to put up for adoption."
	else
		puts "Select an animal:"
		animal_index = numbered_list($my_shelter.clients[client_index].pets)
		$my_shelter.animals << $my_shelter.clients[client_index].pets.delete_at(animal_index)
		puts "Animal successfully put up for adoption."
	end
end

menu_selection = nil
while menu_selection != 'q'
	menu_selection = read_choice
	case menu_selection
	when '1'
		$my_shelter.display_animals

	when '2'
		$my_shelter.display_clients

	when '3'
		create_animal

	when '4'
		create_client

	when '5'
		client_adopts_pet

	when '6'
		animal_for_adoption

	else
		puts Rainbow("Unknown command. Please try again.").red
		sleep 1
		menu_selection
	end
	sleep 1.5
end

puts Rainbow("Thank you for using HappiTails").blue.bright.underline