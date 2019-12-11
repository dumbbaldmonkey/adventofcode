require '../common/icpu'
lines = File.readlines('input')
intcodes = lines.first.split(',').map(&:to_i)

puts ICPU.new(intcodes).process == 3850704