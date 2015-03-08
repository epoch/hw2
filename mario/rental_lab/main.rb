require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'

def read_choice
	puts " Donald Trump Simulator ".center(80, ?=)
	puts "Available functions:\n\n"
	puts "\t1. Show buildings"
	puts "\t2. Show avaliable aparments"
	puts "\t3. Show tenants"
	puts "\t4. Create building"
	puts "\t5. Create aparment"
	puts "\t6. Create new tenant"
	puts "\t7. Destroy building"
	puts "\t8. Allocate tenant"
	puts "\tQ. Quit"

	print "\nPlease enter your selection: "

	choice = gets.chomp.downcase
	puts ''.center(80, ?-)
	# Check to see if user has selected a valid option
	if "12345678q".split('').include? choice
		choice
	else
		puts "Unknown command. Please try again."
		sleep 1
		read_choice
	end
end

# Prints a numbered list of buildings
def display_buildings(buildings)
	# counter for numbering buildings
	counter = 1
	buildings.each do |building|
		puts "#{ counter }. #{building.address}"
		counter += 1
	end
end

def main
	menu_selection = nil

	# Seed Data
	buildings = [Building.new("23 Evergreen Tce", "post modern", false, false, 2)]
	buildings[0].apartments["unit 12"] = Apartment.new("unit 12", 300, 3, 2)

	mac = Tenant.new("Mac Donald", 44, "male")
	buildings[0].apartments["unit 12"].tenants << mac
	tenants = []
	tenants << mac

	# require 'pry'
	# binding.pry

	until menu_selection == 'q'
		menu_selection = read_choice
		# Option 6 is square root which only requires one input
		case menu_selection
		when '1'
			puts "There are #{ buildings.length } buildings and they are displayed below."
			puts buildings

		when '2'
			puts "Below are the available apartments."
			buildings.each do |building|
				puts "\tAt #{ building.address } the available aparments are:"
				building.apartments.each do |name, apartment|
					puts "\t\t" + apartment.to_s
				end
			end

		when '3'
			puts "The list of tenants is as follows:"
			tenants.each do |i|
				puts "\t#{i}"
			end

		when '4'
			puts "Create building"
			print "What is the address? "
			address = gets.chomp
			print "What is the style? "
			style = gets.chomp
			print "Does the building have a door man? (y/n) "
			has_doorman = gets.chomp == 'y' ? true : false
			print "Does the building have an elevator? (y/n) "
			has_elevator = gets.chomp == 'y' ? true : false
			print "How many floors does the building have? "
			num_floors = gets.to_i

			buildings << Building.new(address, style, has_doorman, has_elevator, num_floors)

			puts "New building successfully created."

		when '5'
			if buildings.empty?
				puts "You need buildings before you can have apartments."
			else
				puts "Create apartment"
				print "What is the name? "
				name = gets.chomp
				print "How many square feet? "
				sqft = gets.to_i
				print "How many bedrooms? "
				num_bedrooms = gets.to_i
				print "How many bathrooms? "
				num_bathrooms = gets.to_i

				puts "Select the building where this apartment belongs."
				display_buildings(buildings)

				print "Enter a number: "
				selection = gets.to_i
				# Make a new apartment for the selected building
				buildings[selection - 1].apartments[name] = Apartment.new(name, sqft, num_bedrooms, num_bathrooms)

				puts "Apartment successfully created."
			end

		when '6'
			puts "Create tenant"
			print "Name? "
			name = gets.chomp
			print "Age? "
			age = gets.to_i
			print "Gender? "
			gender = gets.chomp

			tenants << Tenant.new(name, age, gender)

			puts "Tenant successfully created."

		when '7'
			puts "Select the building you wish to destroy."
			display_buildings(buildings)
			print "Enter a number: "
			selection = gets.to_i
			puts "the building will permanently be removed. proceed? (y/n)".upcase
			if gets.chomp.downcase == 'y'
				buildings.delete_at (selection - 1)
			end
			puts "Building deleted."

		when '8'
			puts "Allocate tenant to apartment"
			counter = 1
			tenants.each do |tenant|
				puts "#{counter}. #{tenant.name}"
				counter += 1
			end
			print "Enter the number of the tenant to be allocated: "
			tenant_selection = gets.chomp.to_i

			puts "Which building would you like to move this tenant?"
			display_buildings(buildings)
			print "Enter a number: "
			building_selection = gets.to_i

			puts "Which apartment would you like to move this tenant?"
			buildings[building_selection - 1].apartments.each do |name, apartment|
				puts name
			end
			print "Enter the name of the apartment you wish to move the tenant: "
			apartment_name = gets.chomp

			buildings[building_selection - 1].apartments[apartment_name].tenants << tenants[tenant_selection - 1]
			puts "Tenant successfully allocated."

		when 'q'
			puts "Thank you for using this program. Goodbye."
		end
		sleep 2
	end
end

main