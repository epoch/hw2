result = []
(1..100).to_a.each do |i|
  result << i if (i % 3 == 0) && (i % 5 == 0)
end 

(1..100).to_a.select do |i|
  i % 3 == 0 && i % 5 == 0
end 

# opposite 
(1..100).to_a.reject do |i|
  i % 3 == 0 && i % 5 == 0
end 


# add all the numbers in the array 
numbers = [1,2,3,4]
numbers.reduce(:+)

result = []
numbers.each do |n|
  result += n 
end 


