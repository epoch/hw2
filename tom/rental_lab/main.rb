# makes sure that all of the relevant classes are linked to the main application file
require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'

tenants = []
apartments = []
buildings = []

def read_choice
	puts " ----------------------------------"
	puts "|        Availble functions:       |"
	puts " ----------------------------------"
	puts "|  1. Show buildings               |"
	puts "|  2. Show apartments              |"
	puts "|  3. Show tenants                 |"
	puts "|  4. Create building              |"
	puts "|  5. Create apartment             |"
	puts "|  6. Create new tenant            |"
	puts "|  7. Associate apt. with building |"
	puts "|  8. House tenant                 |"
	puts "|  9. Quit                         |"
	puts " ----------------------------------"

	# user is inputting a number, so needs to be converted to int
	choice = gets.to_i
end


def create_tenant
	puts "Tenant Creation:"
	puts "\n"
	puts "Please enter the following details:"

	print "Name: "
	name = gets.chomp

	print "Age: "
	age = gets.chomp

	print "Gender: "
	gender = gets.chomp 

	tenant = Tenant.new name, age, gender
	tenant # this returns the tenant
end

def create_apartment
	puts "Apartment Creation:"
	puts "\n"
	puts "Please enter the following details:"

	print "Apartment name (e.g. Apartment 9): "
	name = gets.chomp

	print "Square footage: "
	sqft = gets.chomp

	print "Number of bedrooms: "
	num_bedrooms = gets.chomp

	print "Number of bathrooms: "
	num_bathrooms = gets.chomp

	apartment = Apartment.new name, sqft, num_bedrooms, num_bathrooms
	apartment  
end

def create_building
	puts "Building Creation:"
	puts "\n"
	puts "Please enter the following details:"

	print "Address: "
	address = gets.chomp

	print "Style: "
	style = gets.chomp

	print "Is there a doorman? true/false: "
	has_doorman = gets.chomp

	print "Is there an elevator? true/false: "
	has_elevator = gets.chomp

	print "Number of floors: "
	num_floors = gets.chomp

	building = Building.new address, style, has_doorman, has_elevator, num_floors
	building # returns building
end

puts "Welcome to thing for estate agents!"
puts "\n"

menu_selection = read_choice
# require 'pry'
# binding.pry

while menu_selection != 9
# 	until menu_selection == # include array thing
# 		puts "Unknown function. Please choose again:"
# 		menu_selection = read_choice
# 	end

	case menu_selection
		when 1
			# show buildings
			if buildings.empty?
				puts "There are no buildings."
			else
				puts buildings
			end
		when 2
			# show available apts
			if apartments.empty?
				puts "There are no available apartments."
			else
				puts apartments
			end
		when 3
			# show tenants
			if tenants.empty?
				puts "There are no tenants."
			else
				puts tenants
			end
		when 4
			# create building
			buildings << create_building

		when 5
			# create apartment
			apartments << create_apartment			
		when 6
			# create tenant
			tenants << create_tenant
		when 7
			# put apt in a building
			# needs to store an apt object in the building's apt hash
			# @my_hash = Hash.new {|h,k| h[k] = Array.new }
			if buildings.empty? && apartments.empty?
				puts "Sorry, there are no buildings or apartments."
			elsif buildings.empty?
				puts "Sorry, there are no buildings."
			elsif apartments.empty?
				puts "Sorry, there are no apartments."
			else
				# prints a list for user
				# + 1 accounts for zero-indexing
				buildings.each_with_index do |v, i|
					puts "#{(i+1)}. #{v.address}: #{v.style}, #{v.has_doorman} = true, #{v.has_elevator} = true, #{v.num_floors} floors."	
				end
				print "Please choose a building: "

				# find building's index in the buildings storage array based on their choice (to be used in interpolation)
				building_no = gets.to_i 
				building_index = building_no - 1 # to account for the zero indexes

				# select an apartment
				apartments.each_with_index do |v, i|
					puts "#{(i+1)}. #{v.name}: #{v.sqft}sqft, #{v.num_bedrooms} bedrooms, #{v.num_bathrooms} bathrooms, #{v.tenants.length} current tenants."	
				end
				# fins apartment's index
				print "Please choose an apartment: "
				apt_no = gets.to_i 
				apt_index = apt_no - 1 # to account for the zero indexes
				
				# then buildings[building_index] will be that object
				# so buildings[building_index].apartments will be the hash
				(buildings[building_index].apartments).store(apartments[apt_index].name, apartments[apt_index].name)

				puts "\n"
				puts "#{apartments[apt_index].name} has been placed into #{buildings[building_index].address}."
			end

		when 8
			# house tenant
			# put all of this into a function afterwards
			if apartments.empty? && tenants.empty?
				puts "Sorry, there are no available apartments or tenants."
			elsif apartments.empty?
				puts "Sorry, there are no available apartments."
			elsif tenants.empty?
				puts "Sorry, there are no tenants to house."
			else
				apartments.each_with_index do |v, i|
					puts "#{(i+1)}. #{v.name}: #{v.sqft}sqft, #{v.num_bedrooms} bedrooms, #{v.num_bathrooms} bathrooms, #{v.tenants.length} current tenants."	
				end
				# puts apartments
				print "Please choose an apartment: "
				apt_no = gets.to_i 
				apt_index = apt_no - 1 # to account for the zero indexes

				tenants.each_with_index do |v, i|
					puts "#{(i+1)}. #{v.name}, #{v.age}, #{v.gender}."	
				end
				print "Please choose a tenant: "
				tenant_no = gets.to_i
				tenant_index = tenant_no - 1

				apartments[apt_index].tenants << tenants[tenant_index]
				puts "\n"
				puts "#{tenants[tenant_index].name} has moved into #{apartments[apt_index].name}."

			end

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

puts "Thank you for using thing for estate agents."