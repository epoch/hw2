require 'spec_helper'
require_relative '../number.rb'

describe Number do 

  describe 'bin2dec' do 
    it 'converts binary to decimal' do 
      expect(Number.bin2dec('1101')).to eq 13
    end
  end

  describe 'dec2bin' do 
    it 'converts decimal to binary' do 
      expect(Number.dec2bin(13)).to eq '1101'
    end
  end

  describe 'bin2hex' do 
    it 'converts binary to hexidecimal' do 
      expect(Number.bin2hex('1110111110011')).to eq '1df3'
    end
  end

  describe 'hex2bin' do 
    it 'converts hexidecimal to binary' do 
      expect(Number.hex2bin('1df3')).to eq '0001110111110011'
    end
  end

end

# '%b' % 0x1df3