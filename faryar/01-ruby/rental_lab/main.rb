require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'

building = []
apartment = []
tenant = []


def read_choice  
	puts "
	RealEstates, RealFast "
	puts ""
	puts "1. Show buildings"
	puts "2. Show apartments"
	puts "3. Show available apartments" 
	puts "4. Show tenants" 
	puts "5. Create building" 
	puts "6. Create apartment" 
	puts "7. Create new tenant"
	puts "Q. Quit"
  
  	print "
  	Pick a menu option: "

  	choice = gets.chomp.downcase 
 	choice 
 end 


def create_tenant
	puts "Tenant Creation:"
	print "Enter tenant name: "
	tenant_name = gets.chomp 

	print "Enter tenant age: "
	age = gets.chomp 

	print "Enter tenant gender: "
	gender = gets.chomp 

	tenant = Tenant.new tenant_name, age, gender
	p tenant  
end 



def create_apartment 
	puts "Apartment Creation:"
	print "Enter apartment name: "
	apartment_name = gets.chomp 

	print "How many sqft is the apartment? "
	sqft = gets.chomp 

	print "How many bedrooms does the apartment have?"
	bedrooms = gets.chomp 

	print "How many bathrooms does the apartment have?"
	bathrooms = gets.chomp 

	apartment = Apartment.new apartment_name, sqft, bedrooms, bathrooms
	p apartment 

end 


def create_building 
	building = []
	puts "Building Creation: "
	print "What is the building's address? "
	address = gets.chomp 

	print "What is the building's style? "
	style = gets.chomp 

	print "Does the building have a doorman? (yes/no) "
	doorman = gets.chomp 

	print "Does the building have an elevator? (yes/no) "
	elevator = gets.chomp 

	print "How many floors does the building have? "
	floors = gets.chomp 

	building = Building.new address, style, doorman, elevator, floors
	p building 

end 

menu_selection = read_choice
while menu_selection != "q"
	case menu_selection
	when "1"
		p building 
	when "2"
		p apartments
	when "3"
		
	when "4"
		p tenants
	when "5"
		building << create_building
	when "6"
		apartment << create_apartment
	when "7"
		tenant << create_tenant	
	else
		puts "Unknown function"
	end 
	menu_selection = read_choice

end 

$@

require 'pry'
binding.pry



















# # do this for create apartments 
# # do this for create buildings 
# # try to put specific tenant into specific apartment 

# #  $tenants = [] =====> this makes the array global so it is available person 



# # Seed data 

# craigsy = Tenant.new 'Craigsy', 22, 'male'
# jonesy = Tenant.new 'Jonesy', 55, 'male'

# apt1 = Apartment.new 'Apartment 1', 200, 2, 1
# apt2 = Apartment.new 'Apartment 2', 250, 2, 2
# apt3 = Apartment.new 'Apartment 3', 100, 1, 1
# apt4 = Apartment.new 'Apartment 4', 340, 3, 2
# apt5 = Apartment.new 'Apartment 5', 300, 3, 1
# apt6 = Apartment.new 'Apartment 6', 280, 3, 1
# apt7 = Apartment.new 'Apartment 7', 220, 2, 1
# apt8 = Apartment.new 'Apartment 8', 150, 1, 1

# converted_warehouse = Building.new '123 Fake St', 'Gothic Industrial', false, false, 1000

# # require "pry"
# # binding.pry 
