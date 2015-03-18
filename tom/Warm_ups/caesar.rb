require 'pry'

class CaesarCipher
  def initialize
  end

  def encode(message)
    @secret_message = message.tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'DEFGHIJKLMNOPQRSTUVWXYZABC')
  end

  def decode(encoded_message)
    @answer = encoded_message.upcase.tr('DEFGHIJKLMNOPQRSTUVWXYZABC', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
  end

  # can also use negative numbers for key
  def encode_with_key(message, key)

    letter_value = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      'D' => 3,
      'E' => 4,
      'F' => 5,
      'G' => 6,
      'H' => 7,
      'I' => 8,
      'J' => 9,
      'K' => 10,
      'L' => 11,
      'M' => 12,
      'N' => 13,
      'O' => 14,
      'P' => 15,
      'Q' => 16,
      'R' => 17,
      'S' => 18,
      'T' => 19,
      'U' => 20,
      'V' => 21,
      'W' => 22,
      'X' => 23,
      'Y' => 24,
      'Z' => 25
    }

    number_value = {
      0 => 'A',
      1 => 'B',
      2 => 'C',
      3 => 'D',
      4 => 'E',
      5 => 'F',
      6 => 'G',
      7 => 'H',
      8 => 'I',
      9 => 'J',
      10 => 'K',
      11 => 'L',
      12 => 'M',
      13 => 'N',
      14 => 'O',
      15 => 'P',
      16 => 'Q',
      17 => 'R',
      18 => 'S',
      19 => 'T',
      20 => 'U',
      21 => 'V',
      22 => 'W',
      23 => 'X',
      24 => 'Y',
      25 => 'Z'
    }

    encoded_string = []
    # array of the letters that make up 'message'

    chars = message.chars
    chars.each do |char|
      unless letter_value[char] == nil
        num_letter = letter_value[char]
        num_letter += 1
        new_letter = (num_letter + key) % 26
        new_letter -= 1
        encoded_letter = number_value[new_letter]
        encoded_string << encoded_letter
      # to account for spaces and punctuation etc.
      else
        encoded_string << char
      end
    end

    encoded_string.join

  end
end



c = CaesarCipher.new

binding.pry


# need to assign each letter a numerical value, add the key on
# and then recovert it (after a modulo)