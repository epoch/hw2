# Quiz - Decode this message!
# Write a program to decode this message:

# FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV, WKH YDOLDQW QHYHU WDVWH RI GHDWK EXW RQFH.

# This is a form of cryptography known as the Caesar Ciper. It has a shift parameter of 3.

# The alphabet is normally:

# ABCDEFGHIJKLMNOPQRSTUVWXYZ

# The alphabet with the shift parameter of 3 is now as follows:

# DEFGHIJKLMNOPQRSTUVWXYZABC

# Extension:

# Write the program to encode plain text into messages.

# CasearCipher.encode('TWO SYMBOLS KISSING EACH OTHER')
# Extension 2:

# Write the program to endcode it with any shift parameter.

# Send each other secret messages.

require 'pry'

class Language 

  def decode(hello)
    hello.tr('DEFGHIJKLMNOPQRSTUVWXYZABC', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')
  end

  def encode(hello)
    hello.tr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'DEFGHIJKLMNOPQRSTUVWXYZABC')
  end

  def trade(string, this, that)
    string.tr(this, that)
  end

end



binding.pry


































