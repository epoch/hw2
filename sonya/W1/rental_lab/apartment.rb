class Apartment
	attr_accessor :price, :sqft, :num_bedrooms, :num_bathrooms, :tenants
	# note we'll be adding price later
	def initialize(sqft, num_bedrooms, num_bathrooms, tenants)
		@price = 0
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		# Create an empty array to push in things later
		@tenants = []
	end

	# ? is a predicated method and only returns true or false
	def occupied?
		@tenants.any?
	end

	def to_s
		"The apartment is #{ @sqft } square feet with #{ @tenants.count } tenants."
	end

end
