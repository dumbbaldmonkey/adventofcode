lines = File.readlines('input')

def required_fuel(i)
    return 0 if i <= 6  #return if fuel will be 0 or lower
    fuel = i/3 - 2
    fuel + required_fuel(fuel)
end

puts lines.map(&:to_i).map{ |_module| required_fuel(_module) }.sum()
