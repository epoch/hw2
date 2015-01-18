require 'pry'
require_relative "animal"
require_relative "client"

animals = {}
clients = {}
$shelter = { animals:{}, clients:{} }

def read_choice
	puts "Welcome to Shitty Shelter!"
	puts "What would you like to do today?"
	puts "A. Add an animal to the shelter"
	puts "B. Add a new client"
	puts "C. Show a list of all animals on record"
	puts "D. Show a list of all clients on record"
	puts "E. Record the adoption of an animal"
	puts "F. Place a client's animal on the adoption list"
	puts "Q. Quit"

	print "Please enter your selection: "

	choice = gets.chomp.downcase
	puts "\n"
	choice
end

menu_selection = read_choice

def create_animal
	puts "Please enter the name of the animal:"
	name = gets.chomp

	puts "Please enter the age of the animal:"
	age = gets.to_i

	puts "Please enter the animal's gender:"
	gender = gets.chomp

	puts "Please enter the species of animal"
	species = gets.chomp

	animal = Animal.new name, age, gender, species
end

def create_client
	puts "Enter client name:"
	name = gets.chomp

	puts "Enter client age:"
	age = gets.to_i

	puts "How many children does the client have?"
	number_of_children = gets.to_i

	puts "A new file for #{name} has been created.\n"

	client = Client.new name, age, number_of_children
end

def list_animals
	puts "These are the animals we have available for adoption:"
	$shelter[:animals].each{|k,v| puts v }
end

def list_clients
	puts "Our clients are:"
	$shelter[:clients].each{|k,v| puts v }
end

def adoption
	puts "Who are you?"
	adopter = gets.chomp
		
	puts "Enter the name of the animal you'd like to adopt: "
	$shelter[:animals].each{|k,v| puts v }

	lucky_animal = gets.chomp

	$shelter[:clients][adopter].pets << $shelter[:animals][lucky_animal]
	$shelter[:animals][lucky_animal] = nil

	puts "Congratulations you have just adopted #{lucky_animal}!"
end

def abandon
	puts "Who are you?"
	owner = gets.chomp
	
	puts "Which animal are you putting up for adoption?"
	puts $shelter[:clients][owner].pets
	
	unlucky_animal = gets.chomp

	unhappy = $shelter[:clients][owner].pets.find {|pet| pet.name == unlucky_animal}
	
	$shelter[:animals][unlucky_animal] = $shelter[:clients][owner].pets.delete(unhappy)
end

while menu_selection != "q"
	case menu_selection
	when "a" #add animal
		a = create_animal
		$shelter[:animals][a.name] = a
	when "b" #add client
		c = create_client
		$shelter[:clients][c.name] = c
	when "c" #list animals
		list_animals
	when "d" #list clients
		list_clients 
	when "e" #record adoption of an animal
		adoption
	when "f" #put client animal up for adoption	
		abandon
	else
		puts "That function does not exist"
	end
	menu_selection = read_choice
end	

