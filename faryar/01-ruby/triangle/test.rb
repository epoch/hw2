require 'minitest/autorun'
require 'minitest/pride'
require_relative './main'
 
class TriangleTest < MiniTest::Test
  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, triangle(2, 2, 2)
  end
 
  def test_larger_equilateral_triangles_also_have_equal_sides
    assert_equal :equilateral, triangle(10, 10, 10)
  end
 
  def test_isosceles_triangles_have_last_two_sides_equal
    
    assert_equal :isosceles, triangle(3, 4, 4)
  end
 
  def test_isosceles_triangles_have_first_and_last_sides_equal
    assert_equal :isosceles, triangle(4, 3, 4)
  end
 
  def test_isosceles_triangles_have_two_first_sides_equal
    assert_equal :isosceles, triangle(4, 4, 3)
  end
 
  def test_isosceles_triangles_have_in_fact_exactly_two_sides_equal
    assert_equal :isosceles, triangle(10, 10, 2)
  end
 
  def test_scalene_triangles_have_no_equal_sides
    assert_equal :scalene, triangle(3, 4, 5)
  end
 
  def test_scalene_triangles_have_no_equal_sides_at_a_larger_scale_too
    assert_equal :scalene, triangle(10, 11, 12)
  end
 
  def test_scalene_triangles_have_no_equal_sides_in_descending_order_either
    assert_equal :scalene, triangle(5, 4, 2)
  end
 
  def test_triangles_with_no_size_are_illegal
    assert_raises ArgumentError do 
      triangle(0, 0, 0) 
    end
  end

  def test_triangles_with_negative_sides_are_illegal
    assert_raises ArgumentError do 
      triangle(3, 4, -5) 
    end
  end

  def test_triangles_are_illegal_if_they_cannot_have_straight_sides
    assert_raises ArgumentError do 
      triangle(1, 1, 3) 
    end
  end

  def test_triangles_cannot_have_too_short_legs
    assert_raises ArgumentError do 
      triangle(2, 4, 2) 
    end
  end
end
