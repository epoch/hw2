class Apartment 
	attr_accessor :name, :price, :sqft, :num_bathrooms, :num_bedrooms, :tenants

	def initialize(name, sqft, num_bathrooms, num_bedrooms)
		@price = 0
		@name = name
		@sqft = sqft
		@num_bathrooms = num_bathrooms
		@num_bedrooms = num_bedrooms
		@tenants = []
	end

	def occupied?
		@tenants.any?
	end
	#this method will return true or false only

	def to_s
		puts " "
		puts "Name: #{@name}" 
		puts "Sqft: #{@sqft}"
		puts "Number of bathrooms: #{@num_bathrooms}"
		puts "Number of bedrooms: #{@num_bedrooms}"
		puts "Tenants: #{@tenants.count}"
		puts " "
	end
	
end









