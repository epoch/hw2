require "rainbow"
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

# Seed info

$my_shelter = Shelter.new
jazz = Animal.new("Jazz", 3, "male", "dog")
donald = Client.new("Donald", 2, 54)
donald.pets << jazz
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

menu_selection = nil
while menu_selection != 'q'
	menu_selection = read_choice
	case menu_selection
	when '1'
		$my_shelter.display_animals

	when '2'
		$my_shelter.display_clients

	when '3'
		# Multiply
		puts x * y
	when '4'
		# Division
		puts x / y
	when '5'
		# Exponent
		puts x ** y
	when '6'
		# Square root
		square_root
	else
		puts Rainbow("Unknown command. Please try again.").red
		sleep 1
		menu_selection
	end
	sleep 1.5
end

puts Rainbow("Thank you for using HappiTails").blue.bright.underline