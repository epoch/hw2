class Apartment
	attr_accessor :name, :price, :sqft, :num_bedrooms, :num_bathrooms, :tenants

	def initialize(name, sqft, num_bedrooms, num_bathrooms)
		@name = name
		@price = 0
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@tenants = []
	end

	def occupied? # predicate method - will only return true or false
		@tenants.any? # will look into the tenants arrary to see if there is any tenants - returns boolean
	end

	def to_s
		"Apartment #{name}is #{sqft} square feet with #{tenants.count} tenants."
	end
end
