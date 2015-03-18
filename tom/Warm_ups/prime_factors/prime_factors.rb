require 'prime'

class PrimeFactors
  def self.for(n)
    prime_factors = []

    (Prime.each(n)).each do |prime|
      while n % prime == 0
        n = n / prime
        prime_factors << prime
      end
    end
    prime_factors
  end


  # # Jack's solution, much much faster
  # def self.for(n)
  #   prime_factors = []
  #   divisor = 2
  #   while n > 1
  #     while n % divisor == 0
  #       n /= divisor
  #       prime_factors << divisor
  #     end
  #     divisor += 1
  #   end
  #   prime_factors
  # end
end
