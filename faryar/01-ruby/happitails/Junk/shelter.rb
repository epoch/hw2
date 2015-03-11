class ShelterClass
    attr_accessor :clients, :animals

  def initialize(clients=[], animals=[])
    @clients = clients
    @animals = animals
  end

  def display_client
    clients.each do |client|
      puts "Name: #{client.name}    Number of Children: #{client.children}    Age: #{client.age}    Number of Pets: #{client.pets}"
    end
  end


  def display_animal
    animals.each do |animal|
      puts "Name: #{animal.name}    Age: #{animal.age}    Gender: #{animal.gender}    Species: #{animal.species}    Toys: #{animal.toys}"
    end
  end

end