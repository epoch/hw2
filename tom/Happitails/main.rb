require_relative 'client'
require_relative 'animal'
require_relative 'shelter'

# seed animals

$happitails = Shelter.new('HappiTails')

pablo = Animal.new 'Pablo', '5', 'male', 'cat'
($happitails.animals) << pablo

ralph = Animal.new 'Ralph', '6', 'male', 'dog'
($happitails.animals) << ralph

lucky = Animal.new 'Lucky', '7', 'female', 'dog'
($happitails.animals) << lucky

fluffy = Animal.new 'Fluffy', '2', 'female', 'cat'
($happitails.animals) << fluffy

bugs = Animal.new 'Bugs', '45', 'male', 'rabbit'
($happitails.animals) << bugs

# seed clients

tom = Client.new 'Tom', '0', '23'
($happitails.clients) << tom

sarah = Client.new 'Sarah', '0', '24'
($happitails.clients) << sarah

charlie = Client.new 'Charlie', '2', '34'
($happitails.clients) << charlie

nikki = Client.new 'Nikki', '1', '19'
($happitails.clients) << nikki

john = Client.new 'John', '3', '45'
($happitails.clients) << john



def read_choice
	puts " ------------------------------"
	puts "|      Availble functions:     |"
	puts " ------------------------------"
	puts "|  1. Show available animals   |"
	puts "|  2. Show client list         |"
	puts "|  3. Show a client's animals  |"
	puts "|  4. Register a new animal    |"
	puts "|  5. Register a new client    |"
	puts "|  6. Adopt an animal :)       |"
	puts "|  7. Abandon animal :(        |"
	puts "|  8. Donate toy               |"
	puts "|  9. Quit                     |"
	puts " ------------------------------"

	choice = gets.to_i
end

def create_animal
	puts "Animal Registration:"
	puts "\n"
	puts "Please enter the following details:"

	print "Name: "
	name = gets.chomp

	print "Age: "
	age = gets.chomp

	print "Gender: "
	gender = gets.chomp

	print "Species: "
	species = gets.chomp

	print "Does this animal have a toy? (y/n): "
	prompt_choice = gets.chomp

	# works ok, but multiple toys just equal one toy
	if prompt_choice == 'y'
		print "Toy: "
		toys = gets.chomp
		animal = Animal.new name, age, gender, species
		animal.toys << toys 
	else
		animal = Animal.new name, age, gender, species
	end

	# automatically adds animal to shelter
	($happitails.animals) << animal
end

def create_client
	puts "Client Registration:"
	puts "\n"
	puts "Please enter the following details:"

	print "Name: "
	name = gets.chomp

	print "Age: "
	age = gets.chomp

	print "Number of children: "
	num_children = gets.chomp

	client = Client.new name, num_children, age
	client

	# automatically adds client to the shelter
	($happitails.clients) << client
end

def adopt_animal
	if ($happitails.clients).empty? && ($happitails.animals).empty?
		puts "Sorry, there are no registered clients or available animals."
	elsif ($happitails.clients).empty?
		puts "Sorry, there are no registered clients."
	elsif ($happitails.animals).empty?
		puts "Sorry, there are no available animals."
	else
		puts "Animals:"
		($happitails.animals).each_with_index do |value, index|
			if (value.toys).empty?
				puts "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
			else
				print "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
				print " - Toys: #{value.toys}"
				puts "\n"
			end
		end

		puts "\n"
		# prompt choice
		print "Please choose an animal: "
		animal_no = gets.to_i
		animal_index = animal_no - 1
		puts "\n"

		# then list clients to choose from
		puts "Clients:"
		($happitails.clients).each_with_index do |value, index|
			puts "#{index + 1}. #{value.name}: #{value.age} years old, #{value.num_children} children, #{(value.pets).length} pet(s)."
		end

		puts "\n"
		# prompt choice
		print "Please choose a client: "
		client_no = gets.to_i
		client_index = client_no - 1
		puts "\n"
		
		adopted_animal = []
		($happitails.animals).each_with_index do |v, i|
			if i == animal_index
				adopted_animal = v
				($happitails.animals).delete_at(animal_index)
			end
		end

		adopted_animal_name = adopted_animal.name

		($happitails.clients[client_index].pets) << adopted_animal

		puts "#{($happitails.clients[client_index]).name} has adopted #{adopted_animal_name}!"
	end
end

def abandon_animal
	if ($happitails.clients).empty?
		puts "Sorry, there are no registered clients."
	else
		puts "Clients:"
		($happitails.clients).each_with_index do |value, index|
			puts "#{index + 1}. #{value.name}: #{value.age} years old, #{value.num_children} children, #{(value.pets).length} pet(s)."
		end

		puts "\n"
		# prompt choice
		print "Please choose an irresponsible client: "
		client_no = gets.to_i
		client_index = client_no - 1
		puts "\n"
		
		if ($happitails.clients[client_index].pets).empty?
			puts "Sorry, this client doesn't have any pets."
		else
			# then list animals they have to choose from
			puts "Pets:"
			($happitails.clients[client_index].pets).each_with_index do |value, index|
				if (value.toys).empty?
					puts "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
				else
					print "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
					print " - Toys: #{value.toys}"
					puts "\n"
				end
			end

			puts "\n"
			# prompt choice
			print "Please choose an unlucky (and probably sad) pet: "
			animal_no = gets.to_i
			animal_index = animal_no - 1
			puts "\n"
			# loops through the array of client's pets, finds the users chosen animal by comparing indexes, stores the value in a new variable (rejected_animal), then deletes that animal from the client's pet array
			rejected_animal = []
			($happitails.clients[client_index].pets).each_with_index do |v, i|
				if i == animal_index
					rejected_animal = v
					($happitails.clients[client_index].pets).delete_at(animal_index)
				end
			end

			rejected_animal_name = rejected_animal.name
			
			# stores the animal in the shelter array
			($happitails.animals) << rejected_animal
			
			puts "#{($happitails.clients[client_index]).name} has abandoned #{rejected_animal_name}."
		end
	end
end

def show_client_animals
	
	if ($happitails.clients).empty?
		puts "Sorry, there are currently no registered clients."
	else
		puts "Clients:"

		($happitails.clients).each_with_index do |value, index|
			puts "#{index + 1}. #{value.name}: #{value.age} years old, #{value.num_children} children, #{(value.pets).length} pet(s)."
		end

		puts "\n"
		print "Please a choose a client: "
		client_no = gets.to_i
		client_index = client_no - 1
		puts "\n"

		# shows their pets
		if (($happitails.clients)[client_index].pets).empty?
			puts "Sorry, this client hasn't got any animals."
		else
			puts "#{($happitails.clients)[client_index].name} has adopted:"
			puts "\n"

			($happitails.clients[client_index].pets).each_with_index do |value, index|
				if (value.toys).empty?
					puts "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
				else
					print "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
					print " - Toys: #{value.toys}"
					puts "\n"
				end
			end
		end
	end
end

def donate_toy
	if ($happitails.animals).empty?
		puts "Sorry, there are currently no animals in shelter to give a toy."
	else
		puts "Shelter Animals:"
		($happitails.animals).each_with_index do |value, index|
			puts "#{index + 1}. #{value}"
		end
		puts "\n"
		# prompt choice
		print "Please choose an animal in need: "
		animal_no = gets.to_i
		animal_index = animal_no - 1
		puts "\n"

		print "Please write the name of the toy to donate: "
		toy = gets.chomp

		(($happitails.animals[animal_index]).toys) << toy

		puts "\n"
		puts "Thank you for your donation."
	end
end

tom = Animal.new 'tom', 23, 'male', 'dog'
puts "======================================="
puts " Welcome to HappiTails Animal Shelter!"
puts "======================================="
puts "\n"

menu_selection = read_choice

while menu_selection != 9

	case menu_selection
		when 1
			if ($happitails.animals).empty?
				puts "Sorry, there are no animals available to adopt."
			else
				($happitails.animals).each_with_index do |value, index|
					if (value.toys).empty?
						puts "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
					else
						print "#{index + 1}. #{value.name}: #{value.age} year old #{value.species} (#{value.gender})"
						print " - Toys: #{value.toys}"
						puts "\n"
					end
				end
				
			end
		when 2
			if ($happitails.clients).empty?
				puts "Sorry, there are no registered clients."
			else
				($happitails.clients).each_with_index do |value, index|
					puts "#{index + 1}. #{value.name}: #{value.age} years old, #{value.num_children} children, #{(value.pets).length} pet(s)."
				end
			end

		when 3 
			show_client_animals
		when 4
			create_animal
		when 5
			create_client
		when 6	
			adopt_animal
		when 7
			abandon_animal
		when 8
			donate_toy

		# putting in an else will make sure that I don't need a loop to check if there's an erroneous input. Massively better!
	end

	puts "\n"
	print "Do you want to perform another function? (y/n) "	
	again = gets.chomp.downcase

	until again == 'y' || again == 'n'
		print "Please press y or n: "
		again = gets.chomp.downcase
	end

	if again == 'n'
		menu_selection = 9
	else
		menu_selection = read_choice
	end
end

# puts "\n"
# puts '"A dog is not just for Christmas, it\'s for life. Seriously, stop bringing your animals back." Happy Tailson, founder and CEO of HappiTails Animal Shelter'
# puts "\n"