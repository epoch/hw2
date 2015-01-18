require_relative 'animal'
require_relative 'client'
require "pry"
require 'yaml'

$shelter = YAML::load(File.read('temp.yaml'))

def get_user_input(prompts)
  result = {}
  prompts.each_key do |k|
    print "Enter #{prompts[k]}: "
    result[k] = gets.chomp
  end
  result
end

def add_client
  v = get_user_input({ name: "name",  num_children: "number of children", age: "age", num_pets: "the number of pets"})
  $shelter[:all_clients] << Client.new(v[:name], v[:num_children].to_i, v[:age], v[:num_pets].to_i)
  puts "You have add #{v[:name]} successfully."
end

def add_animal
  v = get_user_input({ name: "the animal's name",
                       age: "the animal's age",
                       gender: "the animal's gender",
                       species: "the animal's species",
                       toys: "the animal's toys (please separate with space)" })

  $shelter[:all_animals] << Animal.new(v[:name], v[:age], v[:gender], v[:species], v[:toys].split)
  puts "You have add #{v[:name]} successfully."
end

def with_selected(thing, list)
  choice = select(list, thing)
  return if choice.nil?
  yield choice
end

def adopt_application
  with_selected('client', :all_clients) do |client|
    $shelter[:clients_waiting_for_animal] << client
    puts "You have submit your adopt appliation successfully."
  end
end

def select(list, thing)
  puts "Choose the #{thing}'s name: \n0. Back"
  $shelter[list].each_index do |i|
    puts "#{i+1}. #{$shelter[list][i]}"
  end
  choice = gets.chomp.to_i
  choice == 0 ? nil : $shelter[list][choice - 1]
end

def put_to_adopt
  with_selected('animal', :all_animals) do |animal|
    $shelter[:animals_waiting_for_adoption] << animal
    puts "You have put your pet for adoption successfully."
  end
end

def assign_animal
  with_selected('client', :clients_waiting_for_animal) do |client|
    with_selected('animal', :animals_waiting_for_adoption) do |animal|
      $shelter[:clients_waiting_for_animal].delete(client)
      $shelter[:animals_waiting_for_adoption].delete(animal)
      $shelter[:all_animals].delete(animal)
      client.num_pets += 1
    end
  end
end

def print_list (list)
  if $shelter[list].empty?
    puts "   ====  NO RECORDS  ===="
  else
    puts $shelter[list]
  end
end


loop do
  menu = {  '1' => { text: "Add a client", code: lambda { add_client } },
            '2' => { text: 'Add an animal', code: lambda { add_animal } },
            '3' => { text: 'Submit adoption application', code: lambda { adopt_application } },
            '4' => { text: 'Put an animal up for adoption', code: lambda { put_to_adopt } },
            '5' => { text: 'Assign animal to client', code: lambda { assign_animal } },
            '6' => { text: 'List all clients', code: lambda { print_list(:all_clients) } },
            '7' => { text: 'List all animals', code: lambda { print_list(:all_animals) } },
            '8' => { text: 'List clients waiting to adopt', code: lambda { print_list(:clients_waiting_for_animal) } },
            '9' => { text: 'List animals waiting to be adopted', code: lambda { print_list(:animals_waiting_for_adoption) } },
            'q' => { text: 'Quit', code: lambda { exit } },
            'x' => { text: 'binding.pry', code: lambda { binding.pry } } }

  puts "Welcome to our terminal site."
  menu.each_key { |k| puts "#{k}. #{menu[k][:text]}" }

  print "Please enter your selections: "

  selection = gets.chomp.downcase
  if menu[selection].nil?
    puts "Invalid choice"
  else
    menu[selection][:code].call
  end
  File.open('temp.yaml','w') { |file| file.write(YAML::dump($shelter)) }
end
