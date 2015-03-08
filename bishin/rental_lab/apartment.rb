class Apartment
	attr_accessor :name, :price, :sqft, :num_bedrooms, :num_bathrooms, :tenants

	def initialize(name, sqft, num_bedrooms, num_bathrooms) # not price as this may change later
		@name = name
		@price= 0 # so instance variable exists for price
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@tenants = [] # must be set up otherwise default will be value of nil and you can't push anything into here

	end

	def occupied? #predicate method - will only return true or false
		@tenants.any? #any entries in this array?
	end

	def to_s
		"Apartment #{ @name } is #{ @sqft } square feed with #{ @tenants.count } tenants."
	end

end
