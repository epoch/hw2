class Tenant 
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)
		@name, @age, @gender = name, age, gender
	end 

	def to_s
		"#{ @name} is a #{ @age }-year-old #{@gender}."
	end 
end 

