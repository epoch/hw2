Title: HappiTails
Objectives:

Practice creating objects
Explanation

You are the manager at HappiTails animal shelter. You need to manage your shelter by storing and manipulating information about clients and animals.
Specification:

Object Specs:

Animal:

An animal should have a name.
An animal should have an age.
An animal should have a gender.
An animal should have a species.
An animal can have multiple toys.
Client:

A client should have a name.
A client should have a number of children.
A client should have an age.
A client should have a number of pets.
Shelter:

The shelter should display all the clients.
The shelter should display all the animals.
The shelter should display all the animals.
Relationships:

A client should be able to adopt an animal.
A client should be able to put an animal up for adoption.
Phase 1

Can create animals and clients
Phase 2

New animals and clients can be added to the shelter
Phase 3

When creating an animal or client, the user is prompted for information like names, gender etc.
Phase 4

At start, the user is prompted with a menu of options:
display all animals
display all clients
create an animal
create an client
facilitate client adopts an animal
facilitate client puts an animal up for adoption
After selecting from the menu the task the user is prompted through the entire process


# pets.length - don't have an num_pets attribute so don't ask how many pets???

# def new_adoption
# 	animal = animal_adopt($shelter[:animals])
# 	client = client_adopt($shelter[:clients])

# 	puts animal
# 	puts client
# 	$shelter.([:clients][client]).num_pets << $shelter.([:animals][animal])
# 	# puts $shelter.([:clients].num_pets)
	
# 	puts "\nThe adoption has been processed.\n"
# end
