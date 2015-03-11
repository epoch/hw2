require_relative "client"
require_relative "animal"

def menu
	puts
	puts "----------------------------------------------------"
	puts "| Menu selection:                                   |"
	puts "| 1. Add new animal                                 |"
	puts "| 2. Add new client                                 |"
	puts "| 3. List available animals                         |"
	puts "| 4. List all clients                               |"
	puts "| 5. Facilitate adoption                            |"
	puts "| 6. Facilitate rejection                           |"
	puts "| 7. Facilate toy donation                          |"
	puts "| Q: Quit                                           |"
	puts "----------------------------------------------------"


	print "Please enter your choice: "
	
	choice = gets.chomp.downcase
	choice
end

def create_client
	puts "Client Creation"

	print "Name: "
	name = gets.chomp

	print "Gender: "
	gender = gets.chomp

	print "Age: "
	age = gets.to_i
	
	print "Number of Children: "
	num_children = gets.to_i

	client = Client.new name, gender, age, num_children
	client
end

def create_animal
	puts "Animal Creation"

	print "Name: "
	name = gets.chomp

	print "Gender: "
	gender = gets.chomp

	print "Age: "
	age = gets.to_i
	
	print "Species: "
	species = gets.chomp
	
	print "Toys: "
	toys = gets.chomp.split(", ")

	animal = Animal.new name, gender, age, species, toys
	animal
end

###############################################

puts "Welcome to HappiTails"
menu_choice = menu

$shelter = {
	:clients => [],
	:animals => []
}

while menu_choice != "q"
	
	puts "What would you like to do?"
	
	case menu_choice
	
	when "1" # Add new animal
		$shelter[:animals] << create_animal
		puts "The new animal has been added to the database."
	
	when "2" # Add new client
		$shelter[:clients] << create_client
		puts "The new client has been added to the database."

	when "3" # List available animals  
		
		# Check if we have any available animals to list
		if $shelter[:animals].length < 1
			puts "There are no available animals for adoption."
		
		# Now that we've done the check, we can list the available animals
		else
			puts "Here is a list of all animals:"
			puts $shelter[:animals]

		end
	
	when "4" # List all clients
		
		# Check if we have any clients to list
		if $shelter[:clients].length < 1
			puts "We don't have any clients yet."
		
		# Now that we've done the check, we can list the clients
		else
			puts "Here is a list of all clients:"
			puts $shelter[:clients]

		end
	
	when "5" # Facilitate adoption
		
		# Check if we have any clients to facilitate an adoption
		if $shelter[:clients].length < 1
			puts "We have no clients to facilitate an adoption. Add a client to the database first."
		
		# Check if we have any animals available for adoptions
		elsif $shelter[:animals].length < 1
			puts "We have no animals available for adoption."
		
		# Now that we've done the checks, we can facilitate an adoption
		else
			$shelter[:clients].each_with_index do |client, index|
	    		puts "#{index + 1}. #{client.name}"
			end

			# Get the index number of the adopter (client)
			print "Select the adopter: "
			adopter_index = gets.to_i - 1

			$shelter[:animals].each_with_index do |animal, index|
	    		puts "#{index + 1}. #{animal.name}"
			end

			# Get the index number of the adopted (animal)
			print "Select the animal to be adopted: "
			adopted_index = gets.to_i - 1

			# Create temporary variable that can be used to delete animal from animal array and append to client array
			adopted_animal = []

			$shelter[:animals].each_with_index do |animal, index|
	    		if index == adopted_index
	    			adopted_animal = animal
	    			# Delete the adopted animal from the "animals" array inside the "shelter" hash
	    			$shelter[:animals].delete_at(index)
	    		end

			end
	    	
	    	# Append the adopted animal to the "pets" array in the "clients" array in the "shelter" hash
			$shelter[:clients][adopter_index].pets << adopted_animal

			puts "Congratulations #{$shelter[:clients][adopter_index].name}! You just adopted #{adopted_animal.name}."
		end
		
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
	
	when "7" # Donate a toy to an animal
		
		# Check if we have any clients to donate toys
		if $shelter[:clients].empty? # Use ".empty? instead of ".length < 1"
			puts "We have no clients to donate toys."

		# Check if we have any animals to donate toys
		elsif $shelter[:animals].empty? # Use ".empty? instead of ".length < 1"
			puts "We have no animals for you to donate toys."

		# Now that we've done the checks, we can start the toy donation process
		else
			$shelter[:clients].each_with_index do |client, index|
	    		puts "#{index + 1}. #{client.name}"
			end

			# Get the index number of the donater (client)
			print "Select the person: "
			donater_index = gets.to_i - 1

			$shelter[:animals].each_with_index do |animal, index|
		    	puts "#{index + 1}. #{animal.name}"
			end

			# Get the index number of the donatee (animal)
			print "Select the animal that #{$shelter[:clients][donater_index].name} would like to donate a toy: "
			animal_index = gets.to_i - 1

			# Get the toys that would like to be donated
			print "List the toys that #{$shelter[:clients][donater_index].name} would like to donate to #{$shelter[:animals][animal_index].name}: "
			donated_toys = gets.chomp.split(", ")
	    	
	    	# Append the donated toys to the toys array for the selected animal
			$shelter[:animals][animal_index].toys.concat(donated_toys)
			# $shelter[:animals][animal_index].toys << donated_toys
			# ($shelter[:animals][animal_index].toys).flatten

			puts "Congratulations #{$shelter[:clients][donater_index].name}! You just donated to #{$shelter[:animals][animal_index].name}."
		end

	else
		puts "We don't offer that selection. Goodday!"
	end
	menu_choice = menu
end