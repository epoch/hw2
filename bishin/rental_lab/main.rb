
require_relative 'tenant' # pull this file relative to the current file
require_relative 'apartment'
require_relative 'building'

## Menu navigation systems ##

$tenants =[]
$apartments =[]
$buildings =[]
		

def program_start
	puts "Welcome to the Property Management System 3000! Please pick from the following options"
	puts "1. View existing details"
	puts "2. Update existing details"
	puts "3. Create new details"
	puts "4. Link details"
	user_action =gets.to_i
end

# Search method for existing details
def exist_search
	puts "What would you like to search by?"
	puts "1. Building"
	puts "2. Apartment"
	puts "3. Tenant"
	search_term = gets.to_i
end


# 1. View existing details
def view_existing_details
	if exist_search ==1
		puts $buildings
	elsif exist_search ==2
		puts $apartments
	else
		puts $tenants
	end
end


# 2. Update existing details
def update_existing_details
	puts "Sorry, I am yet to be programmed with this function"
end

# 3. Create new details
def create_new_details
	puts "Please select which new details you wish to create: "
	puts "1. Create tenant details"
	puts "2. Create apartment details"
	puts "3. Create building details"
	new_details = gets.to_i

	if new_details == 1
		$tenants << create_tenant
	elsif new_details == 2
		$apartments << create_apartment
	elsif new_details == 3
		$buildings << create_building 	
	else
		print "Error! Not a valid selection"
		
	end
end

## Select details to create

		### Create tenant
		def create_tenant
			puts "Tenant Creation:"
			print "Enter tenant name: "
			name = gets.chomp

			print "Enter tenant age: "
			age = gets.to_i
			
			print "Enter tenant gender: "
			gender = gets.chomp

			Tenant.new name, age, gender

		end

		### Create an apartment
		def create_apartment
			puts "Apartment Creation:"
			print "Enter apartment name: "
			apartment_name = gets.chomp

			print "Enter square footage: "
			square_footage = gets.to_i
			
			print "Enter number of bedrooms "
			number_bedrooms = gets.to_i

			print "Enter number of bathrooms " 
			number_bathrooms = gets.to_i

			Apartment.new apartment_name, square_footage, number_bedrooms, number_bathrooms
		end

		### Create building
		def create_building
			puts "Building Creation:"
			print "Enter building address: "
			address = gets.chomp

			print "Enter building style: "
			style = gets.chomp
			
			print "Does the building have a doorman? " # boolean
			doorman = gets.chomp

			print "Does the building have an elevator? " # boolean
			elevator = gets.chomp

			print "Enter number of floors in the building: " # integer
			floors = gets.chomp.to_i

			Building.new address, style, doorman, elevator, floors
		end	


# 4. Link details
def link_details
	puts "Sorry, I am yet to be programmed with this function"
end


# ## Action ##

user_action = program_start

if user_action == 1
	view_existing_details
elsif user_action ==2
	update_existing_details
elsif user_action == 3
	create_new_details
elsif user_action == 4
	link_details
else 
	print "Error! Not a valid option"
	program_start
end

puts "This is the end of the program"

# exist_search


# Seed data

	craigsy = Tenant.new 'Craigsy', 22, 'male'
	jonesy = Tenant.new 'Jonesy', 55 , 'male'

	apt12 = Apartment.new 'Apartment 12', 200, 1, 9 #all variable names must start with letters

	converted_warehouse = Building.new '123 fake street','Gothic Industrial','false', 'false', 1000

$tenants << craigsy << jonesy
$apartments << apt12
$buildings << converted_warehouse

require 'pry'
binding.pry



## Questions
# What is the name of each new class element I am creating?
# How do I link buildings to apartments to tenants
# How do I delete existing details?

