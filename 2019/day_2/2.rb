require '../common/icpu'
lines = File.readlines('input')
intcodes = lines.first.split(',').map(&:to_i)
noun, verb = [0,0]
(0..99).each do |i|
    (0..99).each do |j|
        tmp = [1,i,j,3] + intcodes[4..-1]
        cpu = ICPU.new(tmp)
        noun, verb = [i,j] if cpu.process() == 19690720
    end
end
puts 100*noun+verb