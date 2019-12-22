line = File.readlines('input').first
limits = line.split('-').map(&:to_i)
range = (limits.first..limits.last).to_a

class Integer
    def is_ordered?
        raw = self.to_s.split('')
        raw == raw.sort
    end
    def sole_double?
        raw = self.to_s.split('')
        raw.group_by{|i| i }.map{|k,v| v.count}.any?(2)
    end
end

puts range.select { |val| 
    val.is_ordered? && val.sole_double?
}.count