class SumOfMultiples
  def initialize(*args)
    # 'nums' comes through as an array.
    @args = args
  end

  def self.to(n)
    multiples = []
    (1...n).each do |num|
      multiples << num if num % 3 == 0 || num % 5 == 0
    end
    # 'multiples.length == 0 ? 0 : multiples.inject(:+)' can be written as below.
    # Can also start array at 0 to solve this.
    multiples.inject(0, :+)
  end

  def to(n)
    multiples = []
    (1...n).each do |num|

      @args.each do |arg|
        # This will add numbers in twice if they are divisible by both args.
        # So we need to check if they're already present in the multiples array.
        multiples << num if num % arg == 0 && multiples.include?(num) == false
      end

    end
    multiples.inject(0, :+)
  end
end
