require 'pry'
require 'rainbow'
require_relative 'animals'
require_relative 'clients'

$shelter = {
	:animals => [],
	:clients => []
}

# HappiTails main menu
def user_input
	puts Rainbow("\n\nWelcome to the HappiTails Temporary Database\n").black.bg(:white)
	puts Rainbow("\nMain Menu\n").underline
	puts "\tPress 1: Display all available animals"
	puts "\tPress 2: Display all clients"
	puts "\tPress 3: Add a new animal"
	puts "\tPress 4: Add a new client"
	puts "\tPress 5: Add a new toy"
	puts "\tPress 6: Process an adoption"
	puts "\tPress 7: Add an animal for adoption"
	puts "\tPress 0: Exit"

	print "\nOption: "
	choice = gets.to_i
	choice
end

# Fix output for toys - needs to return just the name
def display_animals
	puts Rainbow("\n\nHappiTails Animals:\n").underline
	if $shelter[:animals].empty?
		puts Rainbow("\nUh oh! Looks like we don\'t have any animals. Maybe we should add some animals.\n\nYou will now be directed back to the main menu.\n").red
	else
		$shelter[:animals].each do |animal| 
			puts Rainbow("#{animal.name}").underline
			puts "\tAge: #{animal.age}"
			puts "\tGender: #{animal.gender}"
			puts "\tSpecies: #{animal.species}"
			if animal.toys == []
				puts "\tToys: 0"
			else
				puts "\tToys: #{animal.toys}"
			end
		end
	end
end

# Fix output for pets - needs to return just the name
def display_clients
	puts Rainbow("\n\nHappiTails Clients:\n").underline
	if $shelter[:clients].empty?
		puts Rainbow("\nUh oh! Looks like we don\'t have any clients. Maybe we should add some clients.\n\nYou will now be directed back to the main menu.\n").red
	else
		$shelter[:clients].each do |client|
			puts Rainbow("#{client.name}").underline
			puts "\tAge: #{client.age}"
			puts "\tNumber of children: #{client.num_children}"
			if client.num_pets == []
				puts "\tPets: 0"
			else
				puts "\tPets: #{client.num_pets}"
			end
		end
	end
end

# ToFix: success_msg is commented out as it causes issues with other methods but works for this method
# ToDo: Regex for age???
def add_new_animal
	puts Rainbow("\n\nHappiTails New Animal Form\n").underline
	puts "\nComplete the below to add a new animal.\n\n"
	print "What is the animal\'s name? "
	name = gets.chomp.capitalize
	print "How old is #{name}? " # MONTHS AND YEARS?
	age = gets.to_i
	print "What is #{name}\'s gender? "
	gender = gets.chomp.capitalize
	print "What species is #{name}? "
	species = gets.chomp.capitalize

	new_animal = Animal.new name, age, gender, species
	new_animal
	# puts new_animal.success_msg
end

def new_toy 
	puts Rainbow("\n\nHappiTails Add a New Toy\n\n").underline
	print "Would you like to add a new toy? "
	user_choice = gets.chomp.capitalize!
	user_choice
	if user_choice == ('Y' || 'Yes')
		puts "\n\nFollow the below prompts to add a toy."
		print "\n\nName of toy: "
		toy = gets.chomp.capitalize	
		toy
		if $shelter[:animals].empty?
			puts Rainbow("\nUh oh! Looks like we don\'t have any animals. Maybe we should add some animals before adding toys.\n\n").red
		else
			puts "Animals:"
			count = 1
			$shelter[:animals].each do |animal|
				puts "\tPress #{count}: #{animal.name}"
				count += 1
			end
			print "\nWhich animal does the toy belong to? "
			animal = gets.to_i - 1
			animal

			$shelter[:animals][animal].toys << toy
			puts Rainbow("\n\nSuccess! You have added #{$shelter[:animals][animal].toys} to #{$shelter[:animals][animal].name}\'s record.").green
		end
	else
		puts "\n\nYou will now be returned back to the main menu."
	end
end

# ToFix: success_msg is commented out as it causes issues with other methods but works for this method
def add_new_client
	puts Rainbow("\n\nHappiTails New Client Form\n").underline
	puts "\nComplete the below to add a new client.\n\n"
	print "What is the client\'s name? "
	name = gets.chomp.capitalize
	print "How many children does #{name} have? "
	num_children = gets.to_i
	print "How old is #{name}? "
	age = gets.to_i

	new_client = Client.new name, num_children, age 
	new_client
	# puts new_client.success_msg
end

def new_adoption
	puts Rainbow("\n\nHappiTails New Adoption Form\n\n").underline
	if $shelter[:animals].empty?
		puts Rainbow("\nUh oh! Looks like we don\'t have any animals. Maybe we should first add some animals.\n\n").red
	else
		puts "Animals:"
		count = 1
		$shelter[:animals].each do |animal|
			puts "\tPress #{count}: #{animal.name}"
			count += 1
		end
		print "\nWhich animal is being adopted? "
		animal = gets.to_i - 1
		animal
	end
	if $shelter[:clients].empty?
		puts Rainbow("\nUh oh! Looks like we don\'t have any clients. Maybe we should first add some clients.\n\n").red
	else
		puts "\nClients:"
		count = 1
		$shelter[:clients].each do |client|
			puts "\tPress #{count}: #{client.name}"
			count += 1
		end
		print "\nWhich client is adopting #{$shelter[:animals][animal].name}? "
		client = gets.to_i - 1
		client
	end
	$shelter[:clients][client].num_pets << $shelter[:animals][animal]
	puts Rainbow("\nYay! #{$shelter[:animals][animal].name} has been adopted.").green
	$shelter[:animals].delete_at(animal)
end

def up_for_adoption 
	puts Rainbow("\n\nHappiTails New Animal for Adoption Form\n\n").underline
	if $shelter[:clients].empty?
		puts Rainbow("\nUh oh! Looks like we don\'t have any clients. Maybe we should first add some clients.\n\n").red
	else
		puts "Clients:"
		count = 1
		$shelter[:clients].each do |client|
			puts "\tPress #{count}: #{client.name}"
			count += 1
		end
		print "\nCurrent owner: "
		client = gets.to_i - 1
		client
	end
		puts "\nAnimals:"
		count = 1
		$shelter[:clients][client].num_pets.each do |pet|
			puts "\tPress #{count}: #{pet.name}"
			count += 1
		end
		print "\nWhich pet would the client like to put up for adoption? " 
		pet = gets.to_i - 1 

		$shelter[:animals] << $shelter[:clients][client].num_pets[pet]
		puts Rainbow("\n#{$shelter[:clients][client].num_pets[pet].name} is now available for adoption. :(").green
		$shelter[:clients][client].num_pets.delete_at(pet)
end

menu_selection = user_input

while menu_selection != 0

	case menu_selection
	when 1
		display_animals
	when 2
		display_clients
	when 3
		$shelter[:animals].to_a << add_new_animal
		puts Rainbow("\n\nSuccess! You have just added a new animal!").green # ToDo: Need to update message to include name
	when 4
		$shelter[:clients].to_a << add_new_client
		puts Rainbow("\n\nSuccess! You have just added a new client!").green # ToDo: Need to update message to include name
	when 5
		new_toy
	when 6
		new_adoption
	when 7
		up_for_adoption
	else
		puts Rainbow("\nUh oh! Looks like something went wrong. Try again.\n\n").red
	end
	
	menu_selection = user_input
end

puts Rainbow("\n\nYou've now left Happitals Temporary Database.").black.background(:white)

binding.pry