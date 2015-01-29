# Write a program that can tell you if a triangle is equilateral, isosceles, or scalene.

# equilateral - 3 sides same size
# isosceles - 2 sides equal length
# scalene - all sides unequal

def triangle(x, y, z)   

    side = (x + y + z) / 2.0

    assert_equal = (side - x) * (side - y) * (side - z)

    # if z <= 0 || y <= 0 || z <= 0 || assert_equal <= 0 then
    #     raise ArgumentError
    # end

    if x == y && y == z then
        :equilateral
    elsif x == y || x == z || y == z then
        :isosceles
    else
        :scalene
    end
end



# class TriangleError < StandardError
# end

