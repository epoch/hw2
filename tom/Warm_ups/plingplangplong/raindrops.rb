class Raindrops
  def convert(n)
    output = ''
    output += 'Pling' if n % 3 == 0
    output += 'Plang' if n % 5 == 0
    output += 'Plong' if n % 7 == 0
    output == '' ? output = n.to_s : output
  end
end
