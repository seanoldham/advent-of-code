test_input = ["R8", "R4", "R4", "R8"]
input = ["L2", "L5", "L5", "R5", "L2", "L4", "R1", "R1", "L4", "R2", "R1", "L1", "L4", "R1", "L4", "L4", "R5", "R3", "R1", "L1", "R1", "L5", "L1", "R5", "L4", "R2", "L5", "L3", "L3", "R3", "L3", "R4", "R4", "L2", "L5", "R1", "R2", "L2", "L1", "R3", "R4", "L193", "R3", "L5", "R45", "L1", "R4", "R79", "L5", "L5", "R5", "R1", "L4", "R3", "R3", "L4", "R185", "L5", "L3", "L1", "R5", "L2", "R1", "R3", "R2", "L3", "L4", "L2", "R2", "L3", "L2", "L2", "L3", "L5", "R3", "R4", "L5", "R1", "R2", "L2", "R4", "R3", "L4", "L3", "L1", "R3", "R2", "R1", "R1", "L3", "R4", "L5", "R2", "R1", "R3", "L3", "L2", "L2", "R2", "R1", "R2", "R3", "L3", "L3", "R4", "L4", "R4", "R4", "R4", "L3", "L1", "L2", "R5", "R2", "R2", "R2", "L4", "L3", "L4", "R4", "L5", "L4", "R2", "L4", "L4", "R4", "R1", "R5", "L2", "L4", "L5", "L3", "L2", "L4", "L4", "R3", "L3", "L4", "R1", "L2", "R3", "L2", "R1", "R2", "R5", "L4", "L2", "L1", "L3", "R2", "R3", "L2", "L1", "L5", "L2", "L1", "R4"]

# degrees starts a 0, which means you're facing north. 90 is east, 180 is south, 270 is west. if the case arises where 270 + 90, it will reset degrees to 0 instead to making it 360.
@degrees = 0
orig_x = 0
orig_y = 0
x = 0
y = 0

locations = []

def turn(direction)
  case direction.to_s
  when "L"
    if @degrees > 0
      @degrees = @degrees - 90
    elsif @degrees == 0
      @degrees = 270
    end
  when "R"
    if @degrees < 270
      @degrees = @degrees + 90
    elsif @degrees == 270
      @degrees = 0
    end
  else
    puts "oops"
  end
end

def distance(x1, y1, x2, y2)
  distance = ((x1 - x2).abs + (y1 - y2).abs)
  return distance
end

input.each do |input|

  direction = /./.match(input)
  blocks = $'.to_i

  turn(direction)
  case @degrees
  when 0
    i = 1
    while i <= blocks
      y = y + 1
      locations << [x,y]
      i = i + 1
    end
    puts "You walked #{blocks} blocks north."
  when 90
    i = 1
    while i <= blocks
      x = x + 1
      locations << [x,y]
      i = i + 1
    end
    puts "You walked #{blocks} blocks east."
  when 180
    i = 1
    while i <= blocks
      y = y - 1
      locations << [x,y]
      i = i + 1
    end
    puts "You walked #{blocks} blocks south."
  when 270
    i = 1
    while i <= blocks
      x = x - 1
      locations << [x,y]
      i = i + 1
    end
    puts "You walked #{blocks} blocks west."
  else
    puts "You broke me."
  end

end

distance = distance(orig_x, orig_y, x, y)
puts "You are #{distance} blocks away."

dupes = locations.find_all { |e| locations.count(e) > 1 }

first_dupe_distance = distance(orig_x, orig_y, dupes[0][0], dupes[0][1])

puts "The first location you visited twice is #{first_dupe_distance} blocks away."
