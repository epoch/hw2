require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'

def menu
	puts "Hello agent!"
	puts "Would you like to: "
	puts "1. Create tenant"
	puts "2. Create apartment"
	puts "3. Create building"
	puts "4. Show all tenants"
	puts "5. Show all apartments"
	puts "6. Show all buildings"
	puts "7. Delete tenant"
	puts "8. Delete apartment (including its tenants)"
	puts "9. Delete building (including its apartment and tenants)"
	puts "Q. Quit"
	print "> "
	agent_choice = gets.chomp.downcase
end

def create_tenant
	print "Enter tenant name: "
	name = gets.chomp

	print "Enter tenant age: "
	age = gets.chomp

	print "Enter tenant gender: "
	gender = gets.chomp

	tenant = Tenant.new name, age, gender
	tenant #this returns the tenant
end

def create_apartment
	print "Enter apartment name: "
	name = gets.chomp

	print "Enter how many square feet the apartment is: "
	sqft = gets.chomp

	print "Enter the number of bathrooms: "
	num_bathrooms = gets.chomp

	print "Enter the number of bedrooms: "
	num_bedrooms = gets.chomp

	apartment = Apartment.new name, sqft, num_bathrooms, num_bedrooms
	apartment 
end

def create_building
	print "Enter the building address: "
	address = gets.chomp

	print "Enter the building style: "
	style = gets.chomp

	print "Does the building have a doorman (Y or N)? "

	if gets.chomp.downcase == "y"
		has_doorman = true
	else
		has_doorman = false
	end

	print "Does the building have an elevator (Y or N)? "

	if gets.chomp.downcase == "y"
		has_elevator = true
	else
		has_elevator = false
	end

	print "How many floors are in the building? "
	num_floors = gets.chomp

	building = Building.new address, style, has_doorman, has_elevator, num_floors
	building

end

def delete_tenant(local_tenants)
	puts "Which tenant would you like to delete?"
	puts local_tenants
	delete_tenant_request = gets.chomp.downcase
	local_tenants.each do |tenant|
		if tenant.name == delete_tenant_request
			local_tenants.delete(tenant)
			puts "Tenant deleted."
			puts ""
		else
			puts "Could not find tenant."
			puts ""
		end

	end
end

def delete_apartment(local_apartments)
	puts "Which apartment would you like to delete?"
	puts local_apartments
	delete_apartment_request = gets.chomp.downcase
	local_apartments.each do |apartment|
		if apartment.name == delete_apartment_request
			local_apartments.delete(apartment)
			puts "Apartment deleted."
			puts ""
		else
			puts "Could not find apartment."
			puts ""
		end
	end
end

def delete_building(local_buildings)
	puts "Which building would you like to delete?"
	puts local_buildings
	delete_building_request = gets.chomp.downcase
	local_buildings.each do |building|
		if building.address == delete_building_request
			local_buildings.delete(building)
			puts "Building deleted."
			puts ""
		else
			puts "Could not find building."
			puts ""
		end
	end
end


buildings = []
apartments = []
tenants = []

puts "Welcome to Rentals"
menu_choice = menu

while menu_choice != 'q'
	if menu_choice == "1"
		tenants << create_tenant
	elsif menu_choice =='2'
		apartments << create_apartment
	elsif menu_choice =='3'
		buildings << create_building
	elsif menu_choice == '4'
		puts tenants
	elsif menu_choice == '5'
		puts apartments
	elsif menu_choice == '6'
		puts buildings
 	elsif menu_choice == '7'
 		delete_tenant(tenants)
 	elsif menu_choice == '8'
 		delete_apartment(apartments)
 	elsif menu_choice == '9'
 		delete_building(buildings)
	else
		"Invalid choice"
	end
	menu_choice = menu
end


require 'pry'
binding.pry

