# def create_building 
# 	puts "Building Creation: "
# 	print "What is the building's address? "
# 	address = gets.chomp 

# 	print "What is the building's style? "
# 	style = gets.chomp 

# 	print "Does the building have a doorman? (yes/no) "
# 	doorman = gets.chomp 

# 	print "Does the building have an elevator? (yes/no) "
# 	elevator = gets.chomp 

# 	print "How many floors does the building have? "
# 	floors = gets.chomp 

# 	building = Building.new address, style, doorman, elevator, floors
# 	building 

# end 

# class Building 
# 	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments 
# 	def initialize (address, style, has_doorman, has_elevator, num_floors)
# 		@address = address
# 		@style = style
# 		@has_doorman = has_doorman
# 		@has_elevator = has_elevator
# 		@num_floors = num_floors
# 		@apartments = {} 
# 	end 

# 	# TODO: Add other details like number of floors 
# 	def to_s
# 		"The #{ @style } building at #{ @addresss } has #{ @apartments.count } apartments."
# 	end 
# end 

# building = []
# building << create_building

class Apartment 
	attr_accessor :name, :price, :sqft, :num_bathrooms, :num_bedrooms, :tenants

	def initialize(name, sqft, num_bedrooms, num_bathrooms)
		@name = name 
		@price = 0 
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@tenants = []
	end 

	def occupied
		@tenants.any?
	end
	
	def to_s
		"Apartment #{ @name }is #{ @sqft } square feet with #{ @tenants.count } tenants."
	end 
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



apartment = []
apartment << create_apartment 



require 'pry'
binding.pry





