
class Client 
	attr_accessor :name, :children, :age, :pets 

	def initialize(name, children, age)
		@name = name 
		@children = children 
		@age = age 
		@pets = []  
	end 

	def to_s 
		puts "#{@name}is #{@age}years old, has #{@children}children, and has adopted #{pets.length}pet(s)."
	end
end 