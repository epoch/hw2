class Tenant
	attr_accessor :name, :age, :gender

	@@all_tenants = []

	def initialize(name,age,gender)
		@name,@age,@gender = name, age, gender
		@@all_tenants << self
	end

	def self.all_tenants
		@@all_tenants
	end

	def to_s
		"#{@name} is #{@age} years old and #{@gender}."
	end
end

