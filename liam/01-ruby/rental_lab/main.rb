require_relative "tenant"
require_relative "apartment"
require_relative "building"

def menu
	puts "Menu Selection"
	puts "1. Show buildings"
	puts "2. Show available apartments"
	puts "3. Show tenants"
	puts "4. Create building"
	puts "5. Create apartment"
	puts "6. Create new tenant"
	puts "7. Destroy building (this kills all tenants)"
	puts "Q: Quit"

	print "Please enter your choice: "
	
	choice = gets.chomp.downcase
	choice
end

def create_building
	puts "Building Creation"

	print "Enter building address: "
	address = gets.chomp

	print "Enter building style: "
	style = gets.chomp

	print "Doorman (true / false): "
	has_doorman = gets.chomp
	
	print "Elevator (true / flase): "
	has_elevator = gets.chomp
	
	print "Enter number of floors: "
	num_floors = gets.to_i

	building = Building.new address, style, has_doorman, has_elevator, num_floors
	building
end

def create_apartment
	puts "Apartment Creation"

	print "Enter apartment name: "
	name = gets.chomp

	print "Enter apartment size (square feet): "
	sqft = gets.to_i

	print "Enter the number of bedrooms: "
	num_bedrooms = gets.to_i
	
	print "Enter the number of bathrooms: "
	num_bathrooms = gets.to_i

	apartment = Apartment.new name, sqft, num_bedrooms, num_bathrooms
	apartment

	# Trying to work out how to append an apartment to a building
	
	puts "What building is this apartment located?"
	$buildings.each_with_index do |building, index|
    	puts "#{index}. #{building.address}"
	end

	print "Please enter your choice: "
	building_index = gets.to_i
	$buildings[building_index].apartments << apartment
end

def create_tenant
	puts "Tenant Creation"
	
	print "Enter tenant name: "
	name = gets.chomp
	
	print "Enter tenant age: "
	age = gets.to_i

	print "Enter tenant gender: "
	gender = gets.chomp

	tenant = Tenant.new name, age, gender
	tenant
end

###############################################

puts "Welcome to Rental Lab"
menu_choice = menu
@buildings = {
	:apartments => {
		:tenants => {	
		}
	}
}
# buildings = []
# apartments = []
# tenants = []

while menu_choice != 'q'
	puts "What would you like to do?"
	case menu_choice
	when "1"
		puts "Here is a list of buildings:"
		puts $rental.buildings
	when "2"
		puts "Here is a list of available apartments:"
		puts $rental.apartments
	when "3"
		puts "Here is a list of tenants:"
		puts $rental.tenants
	when "4"
		$rental.buildings << create_building
		puts "The new building has been added to the database."
	when "5"
		$rental.apartments << create_apartment
		puts "The new apartment has been added to the database."
	when "6"
		$rental.tenants << create_tenant
		puts "The new tenant has been added to the database."
	when "7"
		puts "Which building would you like to destroy?"
		
		$rental.buildings.each_with_index do |building, index|
    		puts "#{index}. #{building.address}"
		end

		print "Please enter your choice: "
		destroy_building = gets.to_i
		$rental.buildings.delete_at(destroy_building)
		#still have to work out how to kill tenants in the building
		puts "We have destroyed the building and killded the tenants. Good job!"
	else
		puts "We don't offer that selection. Goodday!"
	end
	menu_choice = menu
end

####################################

require "pry"
binding.pry