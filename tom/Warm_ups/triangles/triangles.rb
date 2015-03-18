# class Triangle

#   def initialize(side1, side2, side3)
#     @side1, @side2, @side3 = side1, side2, side3
#   end

#   def type

#     if @side1 == @side2 && @side2== @side3
#       puts "This is an equilateral triangle. Yay."
#     elsif @side1 == @side2 || @side2 == @side3 || @side3 == @side1
#       puts "This is an isosceles triangle. You must be super happy."
#     else
#       puts "This is a scalene triangle. Who knew."
#     end

#   end

# end
# require_relative 'test'

def triangle(a, b, c)

  if a == 0 || b == 0 || c == 0 || a < 0 || b < 0 || c < 0
    raise ArgumentError
  elsif (a + b)

  else

    if a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end
end


# triangle1 = Triangle.new(5, 5, 5)
# triangle1.type

# triangle2 = Triangle.new(5, 3, 5)
# triangle2.type

# triangle3 = Triangle.new(5, 6, 7)
# triangle3.type
# other two sides added together have to be longer than the longest side

