require 'minitest/autorun'
require 'minitest/pride'
require_relative './prime_factors'

class PrimeFactorsTestTest < MiniTest::Test
  def test_one
    assert_equal [], PrimeFactors.for(1)
  end
  def test_two
    assert_equal [2], PrimeFactors.for(2)
  end
  def test_three
    assert_equal [3], PrimeFactors.for(3)
  end
  def test_four
    assert_equal [2, 2], PrimeFactors.for(4)
  end
  def test_six
    assert_equal [2, 3], PrimeFactors.for(6)
  end
  def test_eight
    assert_equal [2, 2, 2], PrimeFactors.for(8)
  end
  def test_nine
    assert_equal [3, 3], PrimeFactors.for(9)
  end
  def test_twenty_seven
    assert_equal [3, 3, 3], PrimeFactors.for(27)
  end
  def test_large_number
    assert_equal [5, 5, 5, 5], PrimeFactors.for(625)
  end
  def test_really_large_number
    assert_equal [5, 17, 23, 461], PrimeFactors.for(901255)
  end

end