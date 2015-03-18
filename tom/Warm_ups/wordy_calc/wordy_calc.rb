class Calculator
  # def ask(query)
  #   # num_array = query.scan(/\d+/)

  #   # num1 = num_array[0].to_i
  #   # num2 = num_array[1].to_i
  #   # result = num1 + num2

  #   query_array = query.split(' ')
  #   num1 = query_array[2].to_i
  #   num2 = query_array[4].to_i
  #   result = num1 + num2
  # end

  def ask(question)
    question.match(/What is (-?\d+) plus (-?\d+)?/) do |m|
      m[1].to_i + m[2].to_i
    end
  end
end
