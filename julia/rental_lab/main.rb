require_relative 'tenant' # means get a file in same directory
require_relative 'apartment'
require_relative 'building'

# TODO: Need to not use global variables
$building_list = []
$apartment_list = []
$tenant_list = []

def menu_input
	puts "\nWillow Creek Real Estate Agency Database\n\n"
	puts "\tPress 1: View a list of buildings"
	puts "\tPress 2: View the available apartments"
	puts "\tPress 3: View all tenants"
	puts "\tPress 4: Add a new building"
	puts "\tPress 5: Add a new apartment" # TODO: Need to allocate to a building.
	puts "\tPress 6: Add a new tenant" # TODO: Need to allocate to an apartment.
	puts "\tPress 7: Remove a building"
	puts "\tPress 8: Remove an apartment"
	puts "\tPress 9: Exit"
	print "\n\nEnter your selection from the above menu: "

	choice = gets.to_i
	choice
end

#=====  NEW BUILDING  =====#
def create_building
	puts "\n\nFollow the prompts to add a new building\n\n"

	print "Building name: "
	name = gets.chomp

	print "Address: "
	address = gets.chomp

	print "Style: "
	style = gets.chomp

	print "Doorman: "
	has_doorman = gets.chomp

	print "Elevator: "
	has_elevator = gets.chomp

	print "Floors: "
	num_floors = gets.to_i

	building = Building.new(name, address, style, has_doorman, has_elevator, num_floors)
	building
	$building_list << building

	puts "\nSuccess! #{name} has been added.\n\n"
end


#=====  NEW APARTMENT  =====#
def create_apartment
	puts "\nFollow the prompts to add a new apartment\n\n"

	print "Apartment name: "
	name = gets.chomp

	print "Square feet: "
	sqft = gets.chomp

	print "Number of bedrooms: "
	num_bedrooms = gets.chomp

	print "Number of bathrooms: "
	num_bathrooms = gets.chomp

	apartment = Apartment.new name, sqft, num_bedrooms, num_bathrooms
	apartment
	$apartment_list << apartment

	puts "\nSuccess! #{name} has been added.\n\n"
	print "Would you like to "

end


#=====  NEW TENANT  =====#
def create_tenant
	puts "Follow the prompts to add a new tenant".upcase
	print "Enter tenant name: "
	name = gets.chomp

	print "Enter tenant age: "
	age = gets.chomp

	print "Enter tenant gender: "
	gender = gets.chomp

	tenant = Tenant.new name, age, gender
	tenant
	$tenant_list << tenant

	puts "\nSuccess! #{name} has been added.\n\n"
end


#=====  VIEW BUILDINGS =====#
def list_buildings(list)
	if $building_list.empty?
		puts "\nUh oh! There are no buildings. Add a new building."
	else
		puts $building_list
	end
end

#=====  VIEW AVAILABLE APARTMENTS  =====#
# TODO: Need to see if this works - first need to set up a function to allocate tenants to apartments
def avail_apartment(list)
	if $apartment_list.empty?
		puts "\nUh oh! Looks like this apartment doesn't exist. You will now be returned to the main menu."
	else
		apartments_tenants = $apartment_list + $tenant_list
		apartments_tenants.uniq!
		puts "Apartments availabe for lease.\n"
		puts apartments_tenants
	end
end

#=====  VIEW TENANTS  =====#
def list_tenants(list)
	if $tenant_list.empty?
		puts "\nUh oh! There are no tenants. Add a new tenant."
	else
		puts $tenant_list
	end
end

#=====  REMOVE BUILDING  =====#
def remove_building(list)
	if $building_list.empty?
		puts "\nUh oh! Looks like this building doesn't exist. You will now be returned to the main menu."
	else
		count = 1
		list.each do |list|
			puts "Press #{count}: #{list}"
			count += 1
		end
		print "Which building would you like to remove from the database? "
		user_input = gets.to_i

		$building_list.delete_at(user_input - 1)
		puts "Success! The building has been removed."
	end
end

#=====  REMOVE APARTMENT  =====#
def remove_apartment(list)
	if $apartment_list.empty?
		puts "\nUh oh! Looks like this apartment doesn't exist. You will now be returned to the main menu."
	else
		count = 1
		list.each do |list|
			puts "Press #{count}: #{list}"
			count += 1
		end
		print "Which apartment would you like to remove from the database? "
		user_input = gets.to_i

		$apartment_list.delete_at(user_input - 1)
		puts "Success! The apartment has been removed."
	end
end

menu_selection = menu_input

while menu_selection != 9

	case menu_selection
	when 1
		list_buildings($building_list)
	when 2
		list_avail_apartments($apartment_list)
	when 3
		list_tenants($tenant_list)
	when 4
		create_building
	when 5
		create_apartment
	when 6
		create_tenant
	when 7
		remove_building($building_list)
	when 8
		remove_apartment($apartment_list)
	else
		puts "\nUh oh! Looks like something went wrong. Try again."
	end

	menu_selection = menu_input
end

puts "Thank you for using the Willow Creek Real Estate Agency Database"

require 'pry' # means get me a gem - need to install the gem firs to use the gem
binding.pry




# Happitails - use one $global variable that is a harsh
# eg.
# $rentals = {
# 	:tenants = []
# 	:buildings = []
# }