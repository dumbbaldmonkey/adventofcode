line = File.readlines('input').first
limits = line.split('-').map(&:to_i)
range = (limits.first..limits.last).to_a

class Integer
    def is_ordered?
        raw = self.to_s.split('')
        raw == raw.sort
    end
    def duplicates?
        raw = self.to_s.split('')
        raw.uniq.count < raw.count
    end
end

puts range.select { |val| 
    val.is_ordered? && val.duplicates?
}.count