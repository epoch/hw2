require 'pry'

require_relative "tenant"
require_relative "apartment"
require_relative "building"

# seed data

craigsy = Tenant.new 'Craigsy', 22, 'male'
jonesy = Tenant.new 'Jonesy', 33, 'male'
apt12 = Apartment.new 'Apartment 12', 200, 1, 9
converted_warehouse = Building.new '123 Sesame St', 'Gothic Industrial', false, false, 300

# Menu selections display

def read_choice
	puts "Welcome to Crappy Real Estate App!"
	puts "What would you like to do today?"
	puts "A. Add a new building"
	puts "B. Add a new apartment"
	puts "C. Add new tenants"
	puts "D. Show a list of all buildings in portfolio"
	puts "E. Show a list of available apartments"
	puts "F. Show a list of all tenant records"
	puts "G. Remove a building from database"
	puts "H. Remove an apartment from database"
	puts "I. Set apartment rental price"
	puts "J. Assign a tenant to an apartment"
	puts "K. Assign an apartment to a building"
	puts "L. Rub out an annoying tenant"
	puts "Q. Quit"

	print "Please enter your selection: "

	choice = gets.chomp.downcase
	choice
end

menu_selection = read_choice

def create_building
	puts "Please enter the building address: "
	address = gets.chomp
	
	puts "Please enter the building style: "
	style = gets.chomp
	
	puts "Does the building have a doorman?  Y/N "
	has_doorman = gets.downcase
	
	if has_doorman == "y"
		has_doorman = true
		else 
			has_doorman = false
	end

	puts "Does the building have an elevator?: Y/N "
	has_elevator = gets.downcase
	
	if has_elevator == "y"
		has_elevator = true
		else
			has_elevator = false
	end

	puts "How many floors does the building have?"
	num_floors = gets.to_i

	building = Building.new address, style, has_doorman, has_elevator, num_floors
end

def create_apartment

	puts "Enter the building address: "
	address = gets.chomp

	puts "Enter the apartment name: "
	name = gets.chomp.to_s
	
	puts "Enter the size of the apartment in square feet: "
	sqft = gets.to_i
	
	puts "Enter the number of bathrooms: "
	num_bathrooms = gets.to_i
	
	puts "Enter the number of bedrooms: "
	num_bedrooms = gets.to_i

	apartment = Apartment.new address, name, sqft, num_bathrooms, num_bedrooms
end

def create_tenant
	puts "Enter the name of the tenant: "
	name = gets.chomp

	puts "Enter the tenant's age: "
	age = gets.to_i

	puts "Enter the tenant's gender: "
	gender = gets.chomp

	tenant = Tenant.new name, age, gender
end


def vacant
	print Apartment.occupied?(false)
end






# def assign_tenant
# 	puts "Enter address of tenant's apartment: "
# 	address = gets.chomp

# 	puts "Enter name of apartment tenant will occupy: "
# 	apt_name = gets.chomp

# 	puts "Please enter the name of the tenant: "
# 	ten_name = gets.chomp


# 	# buildings[address][name][:occupants] << ????

# end



def set_price
	puts "Enter the building address: "
	address = gets.chomp

	puts "Enter the apartment name: "
	name = gets.chomp

	puts "Please enter the weekly rental amount: $"
	price = gets.to_i

	buildings[address][name][:price] = price
# 	Somehow need to access Apartment class and feed price variable into set_price method

end

# def delete_building
# 	puts "Please enter the address of the building to be removed: "
# 	building_to_delete = gets.chomp
# end
# building.find.destroy


apartments = []
buildings = []
tenants = []

while menu_selection != "q"
	
	case menu_selection
	when "a"
		buildings << create_building
	when "b"
		apartments << create_apartment
	when "c"
		tenants << create_tenant
	when "d"
		puts buildings
	when "e"
		puts "Our records contain the following vacant apartments: "
		vacant
	when "f"
		puts "Our records contain the following tenants: "
		puts tenants
	when "g"
		puts "Enter the address of the building to be removed: "
		address = gets.chomp
		place = buildings[address].index
		buildings - [place]
		puts "The building has been removed."
	when "h"
		apartments >> delete_apartment
	when "i"
		set_price
	when "j"
		assign_tenant
		puts "The tenant has been assigned to the apartment"
	when "k"
		assign_apartment
	when "l"
		rub_out_tenant
	else
		puts "That function does not exist"
	end

binding.pry

	menu_selection = read_choice
end	




# Need to be able to put an apartment in a building
# Need to be able to put a tenant in an apartment

# Methods corresponding to each menu item selection



# Specific methods for each menu action item









# def create_tenant
# 	puts "Tenant Creation"
# 	print "Enter tenant name: "
# 	name = gets.chomp

# 	print "Enter tenant age:"
# 	age = gets.chomp

# 	print "What's their gender?"

# 	tenant = Tenant.new name, age, gender

	# tenant #this shows the tenant details


# end
 
# tenants =[]
# tenants << create_tenant
