class Phone
  def initialize(phone_no)
    @phone_no = phone_no
    @clean_no = clean_up(@phone_no)
  end

  def number
    if @clean_no.length == 10
      @clean_no
    elsif @clean_no.length == 11 && @clean_no.chars.first == "1"
      clean_up_11(@clean_no)
    else
      "0000000000"
    end
  end

  def clean_up(number)
    clean_no = number.chars
    clean_no.keep_if { |v| v =~ /[0123456789]/ }
    clean_no = clean_no.join
  end

  def clean_up_11(number)
    number = number.chars
    number.delete_at(0)
    number.join
  end

  def area_code
    @phone_no.chars.take(3).join
    # @phone_no[0..2]
  end

  def to_s
    "(#{@phone_no[0..2]}) #{@phone_no[3..5]}-#{@phone_no[6..9]}"
  end
end




