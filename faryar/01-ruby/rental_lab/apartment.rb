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



apt1 = Apartment.new 'Apartment 1', 200, 2, 1
apt5 = Apartment.new 'Apartment 5', 300, 3, 1
apt6 = Apartment.new 'Apartment 6', 280, 3, 1
apt7 = Apartment.new 'Apartment 7', 220, 2, 1
apt8 = Apartment.new 'Apartment 8', 150, 1, 1



