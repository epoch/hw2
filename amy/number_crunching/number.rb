class Number
  def self.bin2dec(binary)
    # for the length of the binary array - 1
    # count down from that to 0
    # while it is greater than or equal to zero
    # do 2 to the power of i 
    # then push that num into the powers of two array
    a = binary.chars
    i = a.length - 1
    powersOfTwo = []

    while i >= 0 do 
      powersOfTwo << 2**i
      i -= 1
    end

    # for every zero in the binary array, 
    # find the index
    zeros = a.each_index.select{|i| a[i] == "0"}

    # find the number at the corresponding index in the powersOfTwo array
    # remove that number
    zeros.each do |i|
      powersOfTwo.delete_at(i)
    end

    # sum the powersOfTwo array
    powersOfTwo.inject(:+)
  end

  def self.dec2bin(dec) 

    quotient = dec
    binaryNums = []

    # while the quotient is greater than 0, 
    # keep dividing the quotient by 2 to get a new quotient, and 
    # pushing the remainder (0 if even, 1 if odd) into the binary nums array
    while quotient > 0
      remainder = quotient % 2
      binaryNums << remainder
      quotient = quotient / 2
    end

    binaryNums.reverse.join

  end

  def self.bin2hex(binary)

    binary = binary

    # Divide the binary number into sets of 4 digits. 
    # Add leading zeros as needed. 
    remainder = binary.length / 4.0

    if remainder.to_s.include? ".25"
      binary.prepend("000")
    elsif remainder.to_s.include? ".5"
      binary.prepend("00")
    elsif remainder.to_s.include? ".75"
      binary.prepend("0")
    end

    sets = binary.scan /.{1,4}/

    # convert each 4-digit binary string to a single hex digit:
    values = 
    [["1", "1"], 
    ["10", "2"], 
    ["11", "3"],
    ["100", "4"], 
    ["101", "5"], 
    ["110", "6"], 
    ["111", "7"], 
    ["1000", "8"], 
    ["1001", "9"],
    ["1010", "A"],
    ["1011", "B"], 
    ["1100", "C"], 
    ["1101", "D"], 
    ["1110", "E"], 
    ["1111", "F"]]

    hex = ''

    sets.each do |set|
      values.each do |key, value|
        if key.to_i == set.to_i
          # push each one into hex string
          hex << value
        end
      end
    end
    hex.downcase
  end

  def self.hex2bin(hex)

    hex = hex

    values = 
      [["0000", "0"],
      ["0001", "1"], 
      ["0010", "2"], 
      ["0011", "3"],
      ["0100", "4"], 
      ["0101", "5"], 
      ["0110", "6"], 
      ["0111", "7"], 
      ["1000", "8"], 
      ["1001", "9"],
      ["1010", "A"],
      ["1011", "B"], 
      ["1100", "C"], 
      ["1101", "D"], 
      ["1110", "E"], 
      ["1111", "F"]]

    binary = ''

    chars = hex.upcase.chars

    chars.each do |char|
      values.each do |key, value|
        if value == char
          # push each one into the binary string
          binary << key
        end
      end
    end
    binary
  end
end


