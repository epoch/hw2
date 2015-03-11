# Title: Smoothies
# Prerequisites:

# Ruby
# Hashes & Arrays
# Blocks
# OOP
# Objectives:

# Exercise working with arrays, strings, and a basic object
# Activity:

# can work on this lab individually or groups of 2
# Explanation

# Given a hash of ingredients, write a function called blend.
# It should take all the smoothie ingredients (not the measurements) and chop up and mix all the characters and output a mixed string of characters
# Be sure to remove the spaces, as we don't want any air bubbles in our smoothie!
# Create a class called Blender
# It should have a method that takes an array of ingredients and returns a mixed string of characters (blend).
# Give the blender an on and off switch and only allow the blender to function when it's on.
# FOR SAFETY'S SAKE When you create a new blender by default it should be off.
# Blend the the smoothie array

require 'pry'

# Every Morning I make a smoothie with the follow ingredients:
smoothie_ingredients = {
  'flax seeds' => '1 tbsp',
  'chia seeds' => '1 tbsp',
  'coconut flakes' => '1 tbsp',
  'spirulina' => '1 tsp',
  'pumpkin seeds' => '1 tbsp',
  'oatmeal' => '1/4 cup',
  'coco powder' => '1 tbsp',
  'peanut butter' => '1 tbsp',
  'almonds' => '1/4 cup',
  'walnuts' => '1/4 cup',
  'spinach' => '1/4 cup',
  'greek yogurt' => '1/4 cup',
  'nutrional yeast' => '1 tbsp',
  'brussel sprouts' => '1/4 cup',
  'asparagus' => '1/4 cup',
  'kale' => '1/4 cup',
  'brocoli rabe' => '1/4 cup',
  'blue berries' => '1/4 cup',
  'chopped banana' => '1/2 cup',
  'straw berries' => '1/4 cup',
  'mango' => '1/4 cup',
  'hemp milk' => '1 cup'
}
 
# Write a function called blend.
# It should take all the smoothie ingredients (not the measurements) and chop up and mix all the characters
# and output a mixed string of characters
# Be sure to remove the spaces, as we don't want any air bubbles in our smoothie!


 
def blend(smoothie_ingredients)
    array = []
    array << smoothie_ingredients.keys     
    new_array = array.flatten! 

    joined_array = new_array.join("").gsub(/\s+/, "")
    print joined_array.split("").shuffle.join

end

print blend(smoothie_ingredients) 



# create a class called Blender
# It should have a method that takes an array of ingredients and returns a mixed string of characters.
# Give the blender an on and off switch and only allow the blender to function when it's on.
# FOR SAFETY'S SAKE When you create a new blender by default it should be off.
# Blend the the smoothie array
 


class Blender
    attr_accessor :switch 

    def initialize(switch='off')
      @switch = switch 
    end 

    def blend(ingredients=[])  
      if @switch == 'on'
      joined_array = ingredients.join("").gsub(/\s+/, "")
      print joined_array.split("").shuffle.join
    end
  end

end

binding.pry




























