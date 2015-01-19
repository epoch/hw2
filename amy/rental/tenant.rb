class Tenant
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)
		@name, @age, @gender = name, age, gender
	end

	def to_s
		puts " "
		puts "Name: #{@name}"
		puts "Age: #{@age}"
		puts "Gender: #{@gender}"
		puts " "
	end
end




