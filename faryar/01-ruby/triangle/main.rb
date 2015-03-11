# Triangle
# Write a program that can tell you if a triangle is equilateral, isosceles, or scalene.

# The program should raise an error if the triangle cannot exist: http://rubylearning.com/satishtalim/ruby_exceptions.html

def triangle(a,b,c)
    if (b == a) && (a == c) && (b == c) && (a != 0) 
        :equilateral
    elsif (a == b) || (a == c) || (b == c)
        :isosceles
    elsif a == 0 || b == 0 || c == 0 
        raise ArgumentError 
    else 
        :scalene
    end      
end 



 


