# Check regular expressions on Rubular.com

class Phone

  def initialize(number)
    @number = number
  end

  def number

    # when_9_digits
    if when_9_digits?
      return "0000000000"
    end

    # test_invalid_when_11_digits
    if @number.length == 11 && @number[0] != "1"
      return "0000000000"
    end

    # first_is_1
    if @number.length == 11
      @number[0] = ""
    end
    
    # test_cleans_number
    @number.gsub(/([-(). ])/, '')

  end

  def area_code
    @number[0..2]
  end

  def to_s
    return "(#{area_code}) #{@number[3..5]}-#{@number[6..9]}"
  end

  def when_9_digits?
    @number.length < 10
  end
  
end



