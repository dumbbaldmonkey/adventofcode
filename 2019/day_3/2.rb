lines = File.readlines('input')
lines.map!{|line| line.split(',')}
wire_map=[[],[]]

points_set = [{},{}]

def key_for(point)
    "#{point.first},#{point.last}"
end

lines.each_with_index do |instruction_set, line|
    points = 1
    x=0
    y=0
    instruction_set.each do |instruction|
        dist = instruction[1..-1].to_i
        case instruction[0]
        when 'U'
            ((y+1)..(y+dist)).each do |i|
                wire_map[line] << [x,i]
                points_set[line][key_for([x,i])] = points if points_set[line][key_for([x,i])].nil?
                points += 1
            end
            y += dist
        when 'D'
            range = ((y-1)..(y-dist))
            range.first.downto(range.last) do |i|
                wire_map[line] << [x,i]
                points_set[line][key_for([x,i])] = points if points_set[line][key_for([x,i])].nil?
                points += 1
            end
            y -= dist
        when 'L'
            range = ((x-1)..(x-dist))
            range.first.downto(range.last) do |i|
                wire_map[line] << [i,y]
                points_set[line][key_for([i,y])] = points if points_set[line][key_for([i,y])].nil?
                points += 1
            end
            x -= dist
        when 'R' 
            ((x+1)..(x+dist)).each do |i|
                wire_map[line] << [i,y]
                points_set[line][key_for([i,y])] = points if points_set[line][key_for([i,y])].nil?
                points += 1
            end
            x += dist
        end
    end
end

def min_points(common_points, points_set)
    common_points.map {|point|
        points_set[0][key_for(point)] + points_set[1][key_for(point)]
    }.min
end
wire_map.map(&:uniq!)
wire_map.each{|a| a.delete([0,0])}
puts min_points(wire_map[0] & wire_map[1], points_set)