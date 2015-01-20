require 'pry'
# Initialize
require_relative 'animals'
require_relative 'clients'

#################################################################################
# Database
animals_array = []
clients_array =[]
$Shelter_hash ={:all_animals => animals_array, :all_clients => clients_array}

#################################################################################
# Seed data

fido = Animals.new 'Fido', 3, 'male', 'dog'
whiskers = Animals.new 'Whiskers', 5, 'female', 'cat'

animals_array << fido << whiskers

bishin = Clients.new 'Bishin', 0, 24
michael = Clients.new 'Michael', 0, 26

clients_array << bishin << michael

#################################################################################
# Menu

def happitails_menu
	puts "Please select from the following menu: "
	puts "1 Display all animals"
	puts "2 Display all clients"
	puts "3 Create an animal"
	puts "4 Create a client"
	puts "5 Adopt an animal"
	puts "6 Abandon an animal"
	puts "q Quit program"
end

#################################################################################
# Create each method

## 1. Display all animals
def display_animals

	puts "Please select the animal you wish to view the details of: "

	$Shelter_hash[:all_animals].each_with_index do |animal, index|
		puts "#{index} #{animal.name}"
	end

	selected_animal = gets.to_i

	$Shelter_hash[:all_animals][selected_animal].statement

end

## 2. Display all clients
def display_clients

	puts "Please select the client you wish to view the details of: "

	$Shelter_hash[:all_clients].each_with_index do |client, index|
		puts "#{index} #{client.name}"

	end

	selected_client = gets.to_i

	$Shelter_hash[:all_clients][selected_client].statement

end

## 3. Create an animal
def create_animal

	puts "You are creating a new animal"
	print "enter animal name: "
	name = gets.chomp

	print "enter animal age in years: "
	age = gets.to_i

	print "enter animal gender: "
	gender = gets.chomp

	print "enter animal species: "
	species = gets.chomp

	print "enter animal toys: "
	toys = gets.chomp
	toys = toys.split(' ').flatten

	new_animal = Animals.new name, age, gender, species # Initialize variables only
	new_animal.toys = toys
	$Shelter_hash[:all_animals] << new_animal # pushes into animal array

end

## 4. Create a client
def create_client
	puts "create new client"
	print "enter client name: "
	name = gets.chomp

	print "enter client's number of children: "
	num_children = gets.to_i

	print "enter client age: "
	age = gets.to_i

	print "enter names of current pets: "
	pets = gets.chomp
	pets = pets.split (' ').flatten

	new_client = Clients.new name, num_children, age
	new_client.pets = pets
	$Shelter_hash[:all_clients] << new_client
	
end

## 5. Adopt an animal
def adopt_animal # are all animal details supposed to be recorded for each client?

	puts "Which client are you?"
	$Shelter_hash[:all_clients].each_with_index do |client, index|
		puts "#{index} #{ client.name }"
	end

	selected_client = gets.to_i


	puts "Which animal would you like to adopt?"
	$Shelter_hash[:all_animals].each_with_index do |animal, index|
		puts "#{ index } #{ animal.name }"
	end

	selected_animal = gets.to_i

	puts "#{$Shelter_hash[:all_animals][selected_animal].name} has now been adopted by #{$Shelter_hash[:all_clients][selected_client].name}. Congratulations! Another HappiTail to wag!" # Why does this not work???

	$Shelter_hash[:all_clients][selected_client].pets<< $Shelter_hash[:all_animals][selected_animal].name

	$Shelter_hash[:all_animals][selected_animal] = nil

end

## 6. Abandon an animal
def abandon_animal

	puts "Which client are you?"
	$Shelter_hash[:all_clients].each_with_index do |client, index|
		puts "#{index} #{ client.name }"
	end

	selected_client = gets.to_i

	puts "Which pet do you want to abandon? "

	
	$Shelter_hash[:all_clients][selected_client].pets.each_with_index do |pet_array, index|
		puts "#{index} #{pet_array}"
	end

	selected_pet = gets.to_i

	$Shelter_hash[:all_clients][selected_client].pets.delete_at(selected_pet)# delete pet from array

	create_animal

puts "Your pet has now been put up for adoption :'("

end

#################################################################################

# Execute HappiTails

puts "Welcome to HappiTails!"

## show menu
happitails_menu

## select menu option
user_action = gets.chomp


## execute menu option using when/ case/ then
## run method for each option depending on the option selected

case user_action

when '1'
	then display_animals 

when '2'
	then display_clients

when '3'
	then create_animal

when '4'
	then create_client

when '5'
	then adopt_animal

when '6'
	then abandon_animal

when 'q'
	then
	puts "You have chosen to quit HappiTails"

else
	puts "Error! This option does not exist"
end

puts "Thank you for using HappiTails"

binding.pry
