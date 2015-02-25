
require 'pry'


# A. Given the following data structure:

a = ["Anil", "Erik", "Jonathan"]

binding.pry #tells you where to pause 
# How would you return the string "Erik"?
p a[1]
# How would you add your name to the array?
a.push "Faryar" # or a.unshift "Faryar"
# B. Given the following data structure:

h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# How would you return the string "One"?
p h[1]
# How would you return the string "Two"?
p h[:two]
# How would you return the number 2?
p h["two"]
# How would you add {3 => "Three"} to the hash?
h[3] = 'Three'
p h 
# How would you add {:four => 4} to the hash?
h[:four] = 4
p h 
# C. Given the following data structure:

is = {true => "It's true!", false => "It's false"}
# What is the return value of is[2 + 2 == 4]?
"It's true!"
# What is the return value of is["Erik" == "Jonathan"]?
"It's false"
# What is the return value of is[9 > 10]?
"It's false"
# What is the return value of is[0]?
nothing
# What is the return value of is["Erik"]?
nothing 


# D. Given the following data structure:

# users = {
#   "Jonathan" => {
#     :twitter => "tronathan",
#     :favorite_numbers => [12, 42, 75],
#   },
#   "Erik" => {
#     :twitter => "sferik",
#     :favorite_numbers => [8, 12, 24],
#   },
#   "Anil" => {
#     :twitter => "bridgpal",
#     :favorite_numbers => [12, 14, 85],
#   },
# }


# How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
users["Jonathan"][:twitter]
# How would you add the number 7 to Erik's favorite numbers?
users["Erik"][:favorite_numbers] << 7 # users["Erik"][:favorite_numbers].push 7 
# How would you add yourself to the users hash?
users["Faryar"] = { :twitter => "faryar88", :favorite_numbers => [8, 4, 24] }
# How would you return the array of Erik's favorite numbers?
users["Erik"][:favorite_numbers]
# How would you return the smallest of Erik's favorite numbers?
users["Erik"][:favorite_numbers].min # users["Erik"][:favorite_numbers].sort.first 
# How would you return an array of Anil's favorite numbers that are also even?
users["Anil"][:favorite_numbers].select { |num| num.even? }
# evens = []
# users["Anil"][:favorite_numbers].each do |n|
#       even.push n if n.even?
#     end 
# How would you return an array of the favorite numbers common to all users?
users["Anil"][:favorite_numbers] & users["Erik"][:favorite_numbers] & users["Jonathan"][:favorite_numbers]
# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
(users["Anil"][:favorite_numbers] - users["Erik"][:favorite_numbers] - users["Jonathan"][:favorite_numbers]).sort

# other way 

(users["Anil"][:favorite_numbers] + users["Erik"][:favorite_numbers] + users["Jonathan"][:favorite_numbers]).uniq.sort



















