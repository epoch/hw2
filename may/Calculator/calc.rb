# $gem instll rainbow
# require 'rainbow'

def read_choice
  puts "Welcome to May's Calculator!"
  puts "Available functions: "
  puts "1. Addition"
  puts "2. Subtract"
  puts "3. Multiply"
  puts "4. Division"
  puts "5. Exponents"
  puts "6. Square roots"

  puts "Q. Quit"

  print "Please enter your selections: "

  gets.chomp.downcase
end

def add(number1,number2)
  number1 + number2
end

def sub(number1,number2)
  number1 - number2
end

def multply(number1,number2)
  number1 * number2
end

def division(number1,number2)
  number1.to_f / number2
end

def expo(number1,number2)
  number1 ** number2
end

def square_roots(n)
  Math.sqrt(n)
end


loop do
  menu_selection = read_choice
  if menu_selection != "q"
    if menu_selection.to_i < 6
      print "Enter the first number: "
      n1 = gets.to_i
      print "Enter the second number: "
      n2 = gets.to_i
    else menu_selection == '6'
      print "Enter your number: "
      n = gets.to_i
    end
  else 
  	break
  end

  case menu_selection
  when '1'
    result = add(n1,n2)
  when '2'
    result = sub(n1,n2)
  when '3'
    result = multply(n1,n2)
  when '4'
    result = division(n1,n2)
  when '5'
    result = expo(n1,n2)
  when '6'
    result = square_roots(n)
  else
    result = nil
    puts "Unknown function"
  end

  puts "The result is: #{result}" unless result.nil?

end

puts "Thank you for using May's Calculator."
