#############################################------------------SHITTY REALESTATE------------------#############################################

require_relative "tenant"
require_relative "apartment"
require_relative "building"

#############################################------------------PRY------------------#############################################

# require 'pry'
# binding.pry

#############################################------------------TESTING------------------#############################################

# # EXAMPLES
# craigsy = Tenant.new("Craigsy", 22, "Male")
# jonesy = Tenant.new("Jonesy", 55, "Male")

# apartment1 = Apartment.new("Apartment 12", 200, 1, 9)

# building1 = Building.new("123 Fake St", "Fuckjob", false, false, 1000)

# building1.apartments["12"] = apt12

#############################################------------------DISPLAY------------------#############################################

def read_choice
	puts
	puts "REALESTATE APP"
	puts "Available functions:"
	puts "1. Show tenants"
	puts "2. Show apartments"
	puts "3. Show buildings"
	puts "4. Create new tenant"
	puts "5. Create apartment"
	puts "6. Create building"
	puts "Q. Quit"
	print "Please enter your selection: "
	choice = gets.chomp.downcase
	choice
end

#############################################------------------TENANTS------------------#############################################

def create_tenant
	puts "Tenant Creation:"
	print "Enter tenant name: "
	name = gets.chomp

	print "Enter tenant age: "
	age = gets.chomp

	print "Enter tenant gender: "
	gender = gets.chomp

	tenant = Tenant.new name, age, gender

	tenants = []
	tenants << tenant
end

#############################################------------------APARTMENTS------------------#############################################

def create_apartment
	puts "Apartment Creation:"
	print "Enter apartment name: "
	name = gets.chomp

	print "Enter apartment square feet: "
	sqft = gets.chomp.to_i

	print "Enter the number of bedrooms: "
	num_bedrooms = gets.chomp.to_i

	print "Enter the number of bathrooms: "
	num_bathrooms = gets.chomp.to_i

	apartment = Apartment.new name, sqft, num_bedrooms, num_bathrooms
	
	apartments = []
	apartments << apartment
end

#############################################------------------BUILDINGS------------------#############################################

def create_building
	puts "Building Creation:"
	print "Enter building address: "
	address = gets.chomp

	print "Enter building style: "
	style = gets.chomp.to_i

	print "Doorman? (yes/no) "
	has_doorman = gets.chomp.to_b

	print "Elevator? (yes/no) "
	has_elevator = gets.chomp.to_b

	print "Number of floors: "
	num_floors = gets.chomp.to_i

	building = Building.new address, style, has_doorman, has_elevator, num_floors

	buildings = []
	buildings << building
end	

#############################################------------------MENU------------------#############################################

menu_selection = read_choice

while menu_selection != 'q'
	case menu_selection
	when '1'
		show_tenants
	when '2'
		subtract
	when '3'
		multiply
	when '4'
		create_tenant
	when '5'
		create_apartment
	when '6'
		create_building
	when 'q'
		exit 0
	else
		puts "Take a look..."
	end
	menu_selection = read_choice
end

#############################################------------------STORAGE------------------#############################################













