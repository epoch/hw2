require_relative './word_calculator'
require 'minitest/autorun'
require 'minitest/pride'

class WordProblemTest < MiniTest::Test
  def test_add_1
    # skip
    assert_equal 2, WordProblem.new('What is 1 plus 1?').answer
  end

  def test_add_2
    # skip
    assert_equal 3, WordProblem.new('What is 1 plus 2?').answer
  end

  def test_add_more_digits
    # skip
    assert_equal 45801, WordProblem.new('What is 123 plus 45678?').answer
  end

  def test_add_negative_numbers
    # skip
    assert_equal -11, WordProblem.new('What is -1 plus -10?').answer
  end

  def test_subtract
    # skip
    assert_equal 16, WordProblem.new('What is 4 minus -12?').answer
  end

  def test_multiply
    # skip
    assert_equal -75, WordProblem.new('What is -3 multiplied by 25?').answer
  end

  def test_divide
    # skip
    assert_equal -11, WordProblem.new('What is 33 divided by -3?').answer
  end

  def test_too_advanced
    skip
    assert_raises ArgumentError do
      WordProblem.new('What is 53 cubed?').answer
    end
  end
end