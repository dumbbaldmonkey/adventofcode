lines = File.readlines('input')
lines.map!{|line| line.split(',')}
wire_map=[[],[]]

lines.each_with_index do |instruction_set, line|
    x=0
    y=0
    instruction_set.each do |instruction|
        dist = instruction[1..-1].to_i
        case instruction[0]
        when 'U'
            ((y+1)..(y+dist)).each do |i|
                wire_map[line] << [x,i]
            end
            y += dist
        when 'D'
            range = ((y-1)..(y-dist))
            range.first.downto(range.last) do |i|
                wire_map[line] << [x,i]
            end
            y -= dist
        when 'L'
            range = ((x-1)..(x-dist))
            range.first.downto(range.last) do |i|
                wire_map[line] << [i,y]
            end
            x -= dist
        when 'R' 
            ((x+1)..(x+dist)).each do |i|
                wire_map[line] << [i,y]
            end
            x += dist
        end
    end
end

def min_distance(common_points)
    # ensure all points are are converted to distance then find min sum
    common_points.each{|point| point.map!(&:abs)}.map(&:sum).min
end
wire_map.map(&:uniq!)
puts min_distance(wire_map[0] & wire_map[1])