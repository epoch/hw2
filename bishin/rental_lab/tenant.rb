class Tenant
	attr_accessor :name, :age, :gender

	def initialize (name, age, gender)
		@name, @age, @gender = name, age, gender #parallel assignment
	end

	def to_s
		"#{@name} is #{@age} years old and #{@gender}"
	end

end

## example
# t1 = Tenant.new 'bob', 4, 'female'