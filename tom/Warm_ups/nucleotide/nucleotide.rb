class DNA
  def initialize(string)
    @string = string
  end

  def count(letter)
    if letter.length > 1
      raise ArgumentError
    end

    if /[ACGTU]/.match(letter)
      @string.count(letter)
    else
      raise ArgumentError
    end
  end

  def nucleotide_counts
    n_count = {}
    ['A', 'T', 'C', 'G', 'U'].each do |letter|
      n_count[letter] = @string.count(letter)
    end
    n_count
  end
end
