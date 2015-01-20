class Tenant
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)
		@name, @age, @gender = name, age, gender
	end

	# #OR ONE BY ONE

	# def initialize(name, age, gender)
	# 	@name = name,
	# 	@age = age,
	# 	@gender = gender
	# end

	def to_s
		"#{name} is #{age} years ond and #{gender}."
	end
end

