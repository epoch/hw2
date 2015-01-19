# require 'pry'
require_relative 'animal'
require_relative 'client'
require_relative 'shelter'

shelter = Shelter.new('Happi Tails')
shelter.clients["Pekka"] = Client.new("Pekka", 25, 5000, 3)
shelter.animals["Olli"] = Animal.new("Olli", "Dog", "German Shepherd", 12, "Female")

def read_choice
	puts `clear` # don't use on windows
	puts "Save the animals...yes?"
	print "Display (D), Animals (A), Clients (C) or Quit (Q) "
	gets.chomp.downcase
end

menu_selection = read_choice

while menu_selection != 'q'
	case menu_selection
	when 'd'
		print "Animals (A) or Clients (C) "
		answer = gets.chomp.downcase
		if answer == 'a'
			puts shelter.animals.to_s
			gets
			read_choice
		else answer == 'c'
			puts shelter.clients.to_s
			gets
			read_choice
		end
	when 'a'
		print "Deposit animal (d) or Withdraw animal (w). To quit (q). "
		animal_in = gets.chomp.downcase
		while animal_in != 'q'
			case animal_in
			when 'd'
				print "Name: "
				name = gets.chomp.capitalize
				print "Species: "
				species = gets.chomp.capitalize
				print "Breed: "
				breed = gets.chomp.capitalize
				print "Age: "
				age = gets.chomp.capitalize
				print "Gender: "
				gender = gets.chomp.capitalize
				shelter.animals[name] = Animal.new(name, species, breed, age, gender)
				puts "Thanks for dropping in (you(r) animal)."
			when 'w'
				puts "Ace Ventura recommends these animals for adoption: "
				puts shelter.animals.keys
				print "Your pick? "
				checkout = gets.chomp
				print "What is your name? (owner) "
				owner = gets.chomp.capitalize
				shelter.animals[checkout].link_owner(owner)
				puts "Thanks for picking up (you(r) animal)."
			end
			print "Deposit animal (d) or Withdraw animal (w). To quit (q). "
			animal_in = gets.chomp.downcase
		end
	when 'c'
		print "Add a client (y) or go back (n): "
		answer = gets.chomp.downcase
		if answer == 'y'
			print "Name: "
			name = gets.chomp
			print "Age: "
			age = gets.chomp.to_i
			print "Any children? If so, how many have you popped out: "
			children = gets.chomp.to_i
			print "How many pets do you have? "
			pets = gets.chomp.to_i
			client = Client.new(name, age, children, pets)
			shelter.clients[name] = client
			puts "Client added."
			gets
			read_choice
		else
			read_choice
		end
	when 'q'
		puts "Bye."
	else
		read_choice
	end
	menu_selection = read_choice
end
