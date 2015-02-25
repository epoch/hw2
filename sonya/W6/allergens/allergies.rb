# The list of items (and their value) that were tested are:

# eggs (1)
# peanuts (2)
# shellfish (4)
# strawberries (8)
# tomatoes (16)
# chocolate (32)
# pollen (64)
# cats (128)

# So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

# Write a program that, given a person's score can tell them:
# a) whether or not they're allergic to a given item,
# b) the full list of allergies.

# FLOW OF TEST
# allergies = Allergies.new(34)
# allergies.allergic_to?('chocolate')
# => true

# allergies.allergic_to?('cats')
# => false

# allergies.list
# => ['peanuts', 'chocolate']

class Allergies

  VALUES = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    @score & VALUES[item] > 0
  end

  def list
    VALUES.keys.select { |item| allergic_to?(item) }
  end

end