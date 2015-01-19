require 'Rainbow'
require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'

# Seed data

# Tenants
craigsy = Tenant.new 'Craigsy', 22, 'male'
jonesy = Tenant.new 'Jonesy', 55, 'male'
# Apartments
apt12 = Apartment.new 'Apartment 12', 200, 1, 9
# Building
converted_warehouse = Building.new '123 Fake St.', 'Gothic', false, false, 1000

# Global arrays to store new input data

tenants = []
apartments = []
buildings = []

# CREATE METHODS

def create_tenant
	puts "Tenant Creation: "
	print "Enter tenant name: "
	name = gets.chomp

	print "Enter tenant age: "
	age = gets.chomp

	print "Enter tenant gender: "
	gender = gets.chomp
	
	Tenant.new name, age, gender
end

def create_apartment
	puts "Apartment Creation: "
	print "Enter the apartment size: "
	sqft = gets.chomp

	print "Enter the number of bedrooms: "
	num_bedrooms = gets.chomp

	print "Enter the number of bathrooms: "
	num_bathrooms = gets.chomp

	print "Enter the number of tenants: "
	tenants = gets.chomp

	Apartment.new sqft, num_bedrooms, num_bathrooms, tenants
end

def create_building
	puts "Building Creation: "
	print "Enter Address: "
	address = gets.chomp

	print "Enter style: "
	style = gets.chomp

	print "Is there a doorman? (Y/N): "
	has_doorman = gets.chomp.downcase

	print "Is there an elevator? (Y/N): "
	has_elevator = gets.chomp.downcase

	print "How many floors?: "
	num_floors = gets.chomp

	print "How many apartments?: "
	apartments = gets.chomp

	Building.new address, style, has_doorman, has_elevator, num_floors
end

# CREATE REFACTORED MENU

def menu
	print Rainbow("Rental Lab Menu\n").red
	puts "1. Create tenant"
	puts "2. Create apartment"
	puts "3. Create building"
	puts "4. List all tenants"
	puts "5. List all apartments"
	puts "6. List all buildings"
	puts "Q. Quit"
	print Rainbow("Please enter your selection: ").blue
end

def read_menu_selection
	menu
	gets.chomp.downcase
end

menu_selection = read_menu_selection

while menu_selection != 'q'
	case menu_selection
	when '1'
		tenants << create_tenant # when user creates new tenant, stick it in here
		tenants
	 when '2'
	 	apartments << create_apartment
	 	puts apartments
	 when '3'
	 	buildings << create_building
	 	puts buildings
	 when '4'
	 	puts "List of tenants: "
	 	puts tenants
	 when '5'
	 	puts "List of apartments: "
	 	puts apartments
	 when '6'
	 	puts "List of buildings: "
	 	puts buildings
	else 
		puts "Unknown function"
	end
	
	menu_selection = read_menu_selection
end





# require 'pry'
# binding.pry

