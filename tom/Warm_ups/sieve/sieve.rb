require 'pry'
require 'prime'
class Sieve
  def initialize(n)
    @n = n
  end

  # def primes
  #   # Cheaty/Work Smart way
  #   prime_array = []

  #   Prime.each(@n) do |prime|
  #     prime_array << prime
  #   end
  # end

  def primes
    # First two nums are set to nil as we are counting from 2 (kept in so indexes match up)
    # Splat operator to expand the array to the necessary length
    nums = [nil, nil, *2..@n]
    # We only need to check multiples of numbers from 2 to sqrt of n, as per the formula
    (2..Math.sqrt(@n)).each do |i|
      # If we are looking at the num element with the index of i (i.e. within the aformentioned ranged of 2 - sqrt n)
      # then go and find the multiples of that number and set them to nil (mark them)
      (i**2..@n).step(i){|m| nums[m] = nil}  if nums[i]
    end
    # Simply get rid of all of the 'nil's and leave us with the prime numbers
    nums.compact
  end
end
