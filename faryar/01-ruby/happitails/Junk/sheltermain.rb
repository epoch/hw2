class Shelter
	attr_accessor :clients, :animals

  def initialize(clients=[], animals=[])
    @clients = clients
    @animals = animals
  end

  # def add_client(client)
  #   @clients.push(client)
  # end

  # def add_animal(animal)
  #   @animals.push(animal)
  # end

  # def remove_animal(animal)
  #   @animals.delete(animal)
  # end

  def display_client
    clients.each do |client|
      puts "Name: #{client.name}    Number of Children: #{client.nchildren}    Age: #{client.age}    Number of Pets: #{client.pets}"
    end
  end


  def display_animal
    animals.each do |animal|
      puts "Name: #{animal.name}    Age: #{animal.age}    Gender: #{animal.gender}    Species: #{animal.species}    Toys: #{animal.toys}"
    end
  end

end