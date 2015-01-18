
require_relative 'tenant'
require_relative 'apartment'
require_relative 'building'
def read_choice
  puts "Welcome to our website."
  puts "1. Adding a building"
  puts "2. Adding an apartment"
  puts "3. Adding a tenant"
  puts "4. Assign a building"
  puts "5. Assign an apartment"
  puts "6. Print all available apartment"
  puts "7. Print tenants who are living in our apartments."
  puts "8. print tenant who are waiting for apartments."
  puts "Q. Quit"

  print "Please enter your selections: "
  gets.chomp.downcase
end

$waiting_tenants = []
$current_tenants = []
def create_tenant
  puts "Tenant Creation:"
  print "Enter tenant name: "
  name = gets.chomp

  print "Enter tenant age: "
  age = gets.chomp

  print "Enter tenant gender: "
  gender = gets.chomp

  Tenant.new name, age, gender
end

def create_apartment
  puts "Apartment Creation:"
  print "Enter apartment name: "
  name = gets.chomp

  print "Enter the square feet of the apartment: "
  sqft = gets.chomp

  print "Enter the number of bathrooms: "
  num_bathrooms = gets.chomp

  print "Enter the number of bedrooms: "
  num_bedrooms = gets.chomp

  Apartment.new name, sqft, num_bathrooms, num_bedrooms
end

def create_building
  puts "Building Creation:"
  print "Enter the Building's address: "
  address = gets.chomp

  print "Enter the style of the building: "
  style = gets.chomp

  print "If the building has doorman? (y/n): "
  has_doorman = gets.chomp

  print "If the building has elevator? (y/n): "
  has_elevator = gets.chomp

  print "Enter the number of floors: "
  num_floors = gets.chomp

  Building.new address, style, has_doorman, has_elevator, num_floors
end




def assign_building
  puts "Choose your building. \n 0 to not assign"
  Building.all_buildings.each_index do |i|
    puts "#{i+1}. #{Building.all_buildings[i]}"
  end
  chosen_building = gets.chomp.to_i
  if chosen_building == 0
    return
  else
    building = Building.all_buildings[chosen_building-1]
    puts "Choose your apartment. \n0 to not assign"
    Apartment.all_apartments.each_index do |i|
      puts "#{i+1}. #{Apartment.all_apartments[i]}"
    end
    chosen_apartment = gets.chomp.to_i
    if chosen_apartment == 0
      return
    else
      apartment = Apartment.all_apartments[chosen_apartment-1]
      building.apartments << apartment
    end
  end
end

def assign_apartment
  puts "Choose your apartment.\n 0 to not assign"
  Apartment.all_apartments.each_index do |i|
    puts "#{i+1}. #{Apartment.all_apartments[i]}"
  end
  chosen_apartment = gets.chomp.to_i
  if chosen_apartment == 0
    return
  else
    apartment = Apartment.all_apartments[chosen_apartment-1]
    puts "Choose the tenant. \n0. to not assign"
    Tenant.all_tenants.each_index do |i|
      puts "#{i+1}. #{Tenant.all_tenants[i]}"
    end
    chosen_tenant = gets.chomp.to_i
    if chosen_tenant == 0
      return
    else
      tenant = Tenant.all_tenants[chosen_tenant-1]
      $current_tenants << tenant
      $waiting_tenants = Tenant.all_tenants - $current_tenants
      apartment.tenants << tenant
    end
  end
end

def available_apartments
  Apartment.all_apartments.each do |i|
    if i.occupied?
      Apartment.all_apartments.delete(i)
    end
  end
  puts Apartment.all_apartments
end


Apartment.new 'Apartment 12', 200,1,9
Apartment.new 'Apartment 13', 400,4,9
Building.new '123 Fake St', 'Gothic Industrial', false, false, 1000
Tenant.new 'Craigsy', 22, "male"
Tenant.new 'Jonesy', 55, "male"

loop do
  menu_selection = read_choice
  if menu_selection != "q"
    if menu_selection == "1"
      create_building
    elsif menu_selection == "2"
      create_apartment
    elsif menu_selection == "3"
      create_tenant
    elsif menu_selection == "4"
      assign_building
    elsif menu_selection == "5"
      assign_apartment
    elsif menu_selection == "6"
      available_apartments
    elsif menu_selection == "7"
      puts $current_tenants
    elsif menu_selection == "8"
      puts $waiting_tenants
    else
      puts "Invalid choice."
    end
  else
  	puts "Thank you for using our serverse."
    break
  end 
end



require 'pry'
binding.pry
