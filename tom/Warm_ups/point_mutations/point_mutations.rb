class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(strand2)
    diff_counter = 0;
    strand2 = strand2.chars

    shortest = @strand.length <= strand2.length ? @strand : strand2

    shortest.each_with_index do |v, i|
      diff_counter += 1 if (@strand[i] != strand2[i])
    end

    diff_counter
  end
end
