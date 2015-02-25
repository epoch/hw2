class Apartment
	attr_accessor :address, :name , :price, :sqft, :num_bathrooms, :num_bedrooms, :tenants

	def initialize(name, sqft, num_bathrooms, num_bedrooms)
		@address = address
		@name = name
		@price = 0
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@tenants = []  # this is important to set as array so we can push values into it later
	end

	def set_price(address, name, price)
		
		buildings[address][name][:price] = price
	
	end


	def occupied?
	 @tenants.any?
	end

	def to_s
		"Apartment #{ @name } is #{ @sqft } square feet with #{ @tenants.count } tenants."
	end
end
