lines = File.readlines('input')

puts lines.map(&:to_i).map{ |i| i/3-2 }.sum()
